Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3871191ejx;
        Tue, 8 Nov 2022 04:52:35 -0800 (PST)
X-Received: by 2002:a5d:4e04:0:b0:236:5d2d:8c38 with SMTP id p4-20020a5d4e04000000b002365d2d8c38mr36464507wrt.593.1667911955128;
        Tue, 08 Nov 2022 04:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667911955; cv=none;
        d=google.com; s=arc-20160816;
        b=dhpJp1Znm1404t9QnS8mqobJB1rwZMoUJoPKOcF4+qphZVxR761ERUvC0WsGmw1bct
         +xf5Ng4+8XKm752/X4M5tgFPREV7sLEseFy3kPoY5Czhmevq8VIqxo4H0CsNqK+ax8nT
         ZlUKBXorSkdoQRX02Jr8WBQ5Hhvq8dxlzPOtMGhjo7XGdjg/JcG2vdcIfEjY2CmqlGGm
         xBegjqESctwNcydCrHEfgREATJjmFV9iItBfRbtP06w2b5ScjlN/xSboBQS7y5AdvJhP
         M6cPio1/90/CupLFLhA6ay2Q+nMRWZJSP7CNKUnHlqLSZHv79c1M5ovOl0fW38dhKmlH
         HCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yYHFQoAZk6Td/wFnj+B7LtUjfpHcV2mva19ZbWS+dHc=;
        b=GMrwHnb85aZ6ENNEosxdSd5CTpofME4a9e3ndNdKebcU6qahcFdGsTu2e+J09vQxwe
         NUsOI8FiReYxABPg0TGKyueAOHwhpqqmoVQlXXi9HPIi/8cHxMn5mzvxMSlNlA6D/B2P
         ieSBA72ogUeN7+RjX+yCsW8xkROi1tYOupWppxpPwNC0wNo8vtf0aU/7x8JheEfxRPhC
         QJ8zmnjKUBrO8GvdNn4avNTNsRrM3ITNAof1JmBVM75xDudVYxRTVd8wCKXOP7EeOtax
         722w5WdOJzJQKvegr3LjXhXDUijt0WIGmT60Ms8VF2Xrs3G1fEAI8rWFSiZm1sp/xewZ
         acJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YBF2FiDQ;
       spf=pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=schspa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <schspa@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r15-20020adfbb0f000000b0022b0db9e505sor4540387wrg.59.2022.11.08.04.52.34
        (Google Transport Security);
        Tue, 08 Nov 2022 04:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YBF2FiDQ;
       spf=pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=schspa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYHFQoAZk6Td/wFnj+B7LtUjfpHcV2mva19ZbWS+dHc=;
        b=YBF2FiDQBMj0G30Y07wPWFxXXGZLCCzwBeBva5vBOOZgIARCiWrsEMxNH43VTVK+4Y
         WMfShBXK4nvQfYkqbkU7J+J3rHuZExGLfncGiaP50JHdLNs0uq+peo6U7ca6vp8ib9bL
         +rfARVExt2mbKSDnwfgvfDXYeNpMnaoiVBjrtrxxU+9bUizUiWQ2+BACRB6nshmI83IN
         QXp5dn1tuiYk7efwCRekGp6VgXE4adKi5sQfw15hyR377JP/NnXFnrXo65Dzh5XN+Ngy
         S6xp2b7JSKPYsvmJ+0TGEXENd5qwhVYPJ/U9nrrhcmqRDT1b/sbIR6ZBp6aWCgI3WlLb
         baNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYHFQoAZk6Td/wFnj+B7LtUjfpHcV2mva19ZbWS+dHc=;
        b=PuOsHIJ1qmXbfFRlvx2tuakccgKI1MkkJw1rMeTJtKa8AiQARcbvxVcTgl7hyFcPPK
         +BZgLF6En8XwceFEvThLOnshmmr0DIkFmKH9drtwI4svPCSlsZ+5yqc3/15IFa2MADSh
         XrlZfHtBumCpPxy0kZItjgpxvgNyWVUJRo3FghH7fjN4WekkArALXTk2cWJv36JRVu2+
         WeD6nvdhxWZE4TB4qRp2fxlemQeCLPDxXM0ymA2qCodoC91yjdHQrAX/IYIumQAUcDlB
         bLWQUOZNJjVU4vzFmU8dppHULbGzz8lE9frogUFfMcKBa9TPjrU53O5sMIVksoF5C1ym
         AF7A==
X-Gm-Message-State: ACrzQf30wInv90zja4Tj2uIskde58UgUVvjToRrk+u+FuM0HM1a2R5zn
	dXrkppquHKpEhbc/pr1z/yj4r5YCVDO0Eg1++7PwryngILQ=
X-Google-Smtp-Source: AMsMyM5bHHv13uV1OxBCHPFUEaCdtDeF3ZAzpndR7U/4MZMp0G6WUr11K3gJEx21Ibdgk2k0cq60MVlHd1+th3S9RA8=
X-Received: by 2002:a05:6000:24f:b0:236:76e8:33fd with SMTP id
 m15-20020a056000024f00b0023676e833fdmr34387877wrz.215.1667911954313; Tue, 08
 Nov 2022 04:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com> <87fsetg5xh.fsf@linaro.org>
In-Reply-To: <87fsetg5xh.fsf@linaro.org>
From: Schspa Shi <schspa@gmail.com>
Date: Tue, 8 Nov 2022 20:52:22 +0800
Message-ID: <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nX+4CerrYUJm

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Schspa Shi <schspa@gmail.com> writes:
>
>> We use 32bit value for linux,initrd-[start/end], when we have
>> loader_start > 4GB, there will be a wrong initrd_start passed
>> to the kernel, and the kernel will report the following warning.
>>
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] initrd not fully accessible via the linear mapping -- ple=
ase check your bootloader ...
>> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/init.c:355 arm64_=
memblock_init+0x158/0x244
>> [    0.000000] Modules linked in:
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          =
6.1.0-rc3-13250-g30a0b95b1335-dirty #28
>> [    0.000000] Hardware name: Horizon Sigi Virtual development board
>> (DT)
>
> Is this an out-of-tree board model?
>

Yes, this is a virtual board created by myself.

>> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTY=
PE=3D--)
>> [    0.000000] pc : arm64_memblock_init+0x158/0x244
>> [    0.000000] lr : arm64_memblock_init+0x158/0x244
>> [    0.000000] sp : ffff800009273df0
>> [    0.000000] x29: ffff800009273df0 x28: 0000001000cc0010 x27: 00008000=
00000000
>> [    0.000000] x26: 000000000050a3e2 x25: ffff800008b46000 x24: ffff8000=
08b46000
>> [    0.000000] x23: ffff800008a53000 x22: ffff800009420000 x21: ffff8000=
08a53000
>> [    0.000000] x20: 0000000004000000 x19: 0000000004000000 x18: 00000000=
ffff1020
>> [    0.000000] x17: 6568632065736165 x16: 6c70202d2d20676e x15: 69707061=
6d207261
>> [    0.000000] x14: 656e696c20656874 x13: 0a2e2e2e20726564 x12: 00000000=
00000000
>> [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 00000000=
00000000
>> [    0.000000] x8 : 0000000000000000 x7 : 796c6c756620746f x6 : 6e206472=
74696e69
>> [    0.000000] x5 : ffff8000093c7c47 x4 : ffff800008a2102f x3 : ffff8000=
09273a88
>> [    0.000000] x2 : 80000000fffff038 x1 : 00000000000000c0 x0 : 00000000=
00000056
>> [    0.000000] Call trace:
>> [    0.000000]  arm64_memblock_init+0x158/0x244
>> [    0.000000]  setup_arch+0x164/0x1cc
>> [    0.000000]  start_kernel+0x94/0x4ac
>> [    0.000000]  __primary_switched+0xb4/0xbc
>> [    0.000000] ---[ end trace 0000000000000000 ]---
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA      [mem 0x0000001000000000-0x0000001007ffffff]
>>
>> To fix it, we can change it to u64 type.
>>
>> Signed-off-by: Schspa Shi <schspa@gmail.com>
>> ---
>>  hw/arm/boot.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 57efb61ee419..da719a4f8874 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -638,14 +638,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boo=
t_info *binfo,
>>      }
>>
>>      if (binfo->initrd_size) {
>> -        rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-star=
t",
>> +        rc =3D qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-start=
",
>>                                     binfo->initrd_start);
>>          if (rc < 0) {
>>              fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n"=
);
>>              goto fail;
>>          }
>>
>> -        rc =3D qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end"=
,
>> +        rc =3D qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-end",
>>                                     binfo->initrd_start + binfo->initrd_=
size);
>>          if (rc < 0) {
>>              fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
>
> On the face of things this seems fine because unlike the other linux
> properties they are not specified to be "expressed in #address-cells and
> #size-cells" but I do wonder how we got into the situation where the
> kernel and initrd ended up so high in the physical address space.
>

The reason why I faced this problem is there is no DRAM region below
4GB on the hardware. And I make this virtual board to have the same
memory layout as the hardware.

Although there is no something like #address-cells and #size-cells,
but Linux will handle the size correctly by calling the following code:

prop =3D of_get_flat_dt_prop(node, "linux,initrd-start", &len);

Please check the link at
Link: https://lore.kernel.org/all/20091105074724.10460.4083.stgit@angua/
Every Linux version support fdt on arm[64] platform should work without
problems.

> There is a whole comment in boot.c talking about keeping initrd within
> lowmem:
>
>     /*
>      * We want to put the initrd far enough into RAM that when the
>      * kernel is uncompressed it will not clobber the initrd. However
>      * on boards without much RAM we must ensure that we still leave
>      * enough room for a decent sized initrd, and on boards with large
>      * amounts of RAM we must avoid the initrd being so far up in RAM
>      * that it is outside lowmem and inaccessible to the kernel.
>      * So for boards with less  than 256MB of RAM we put the initrd
>      * halfway into RAM, and for boards with 256MB of RAM or more we put
>      * the initrd at 128MB.
>      * We also refuse to put the initrd somewhere that will definitely
>      * overlay the kernel we just loaded, though for kernel formats which
>      * don't tell us their exact size (eg self-decompressing 32-bit kerne=
ls)
>      * we might still make a bad choice here.
>      */
>

I think this lowmem does not mean below 4GB. and it is to make sure
the initrd_start > memblock_start_of_DRAM for Linux address range check.

> Is this just because the base RAM address of the board is outside of the
> 32 bit address range?

Yes, it is.


--
BRs
Schspa Shi
