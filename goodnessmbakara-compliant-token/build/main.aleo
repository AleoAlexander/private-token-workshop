import workshop_ofac.aleo;
program goodnessmbakara_compliant.aleo;

record Token:
    owner as address.private;
    amount as u64.private;

mapping balances:
    key as address.public;
    value as u64.public;

function mint_public:
    input r0 as address.public;
    input r1 as u64.public;
    call workshop_ofac.aleo/address_check r0 into r2;
    async mint_public r0 r1 r2 into r3;
    output r3 as goodnessmbakara_compliant.aleo/mint_public.future;

finalize mint_public:
    input r0 as address.public;
    input r1 as u64.public;
    input r2 as workshop_ofac.aleo/address_check.future;
    await r2;
    get.or_use balances[r0] 0u64 into r3;
    add r3 r1 into r4;
    set r4 into balances[r0];

function mint_private:
    input r0 as address.private;
    input r1 as u64.private;
    call workshop_ofac.aleo/address_check r0 into r2;
    cast r0 r1 into r3 as Token.record;
    async mint_private r2 into r4;
    output r3 as Token.record;
    output r4 as goodnessmbakara_compliant.aleo/mint_private.future;

finalize mint_private:
    input r0 as workshop_ofac.aleo/address_check.future;
    await r0;

function transfer_public:
    input r0 as address.public;
    input r1 as u64.public;
    call workshop_ofac.aleo/address_check r0 into r2;
    async transfer_public self.signer r0 r1 r2 into r3;
    output r3 as goodnessmbakara_compliant.aleo/transfer_public.future;

finalize transfer_public:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as u64.public;
    input r3 as workshop_ofac.aleo/address_check.future;
    await r3;
    get.or_use balances[r0] 0u64 into r4;
    sub r4 r2 into r5;
    set r5 into balances[r0];
    get.or_use balances[r1] 0u64 into r6;
    add r6 r2 into r7;
    set r7 into balances[r1];

function transfer_private:
    input r0 as Token.record;
    input r1 as address.private;
    input r2 as u64.private;
    call workshop_ofac.aleo/address_check r1 into r3;
    sub r0.amount r2 into r4;
    cast r0.owner r4 into r5 as Token.record;
    cast r1 r2 into r6 as Token.record;
    async transfer_private r3 into r7;
    output r5 as Token.record;
    output r6 as Token.record;
    output r7 as goodnessmbakara_compliant.aleo/transfer_private.future;

finalize transfer_private:
    input r0 as workshop_ofac.aleo/address_check.future;
    await r0;

constructor:
    assert.eq edition 0u16;
