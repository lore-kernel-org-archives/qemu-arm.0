Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2148383lfk;
        Mon, 18 Apr 2022 21:51:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjKBp5ZwM3yABJIBu8PB3szqZSC2OgntBXTr8+D2dv46kc50bOclGMVaigAhJSTGDp/Urj
X-Received: by 2002:a05:622a:11c5:b0:2f1:ef41:f909 with SMTP id n5-20020a05622a11c500b002f1ef41f909mr9138646qtk.333.1650343882471;
        Mon, 18 Apr 2022 21:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650343882; cv=none;
        d=google.com; s=arc-20160816;
        b=mLG9fX0QrP0cT1pcKGnh+6Q7imEVAEY55rAh8ZI4dcmKcVoPhBqrIk3gnLEWu8GRvk
         ZvzL/YGhywm3vkPU1FP5xDifOgSXKk1UWirM8NLBv3BLkOLWwQe0GAvTbU6h5bhOdVh5
         lyxZhzISnbcDg5tNRPbhHDheC00veLqyFpnztwoLSXNSxNTIwy5xR/99KEUt0829EYUS
         ErYq6Q5k8NfAj3eWb2gYGWARpNscWA6X3rwzLSP3xJg5YPN/+xcd94BZVC5UCKruIfjO
         remcItsfBlP6E2xlM+wgggThhWdEiArISvf54koj7kDSwcNP71uI4ayup7uu01ooYoR5
         PuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EkEBm+Bg2eAq4CQJ3CnPFikJldUBp3Nu12KxMyLdIl0=;
        b=vxElfqz8Mc2SEtqmb2naIp18ECh5Hr/flZHhPEqlOUwueovEnAqByUIUySHAgmzHxE
         9ZtX+lxXjIeBOxouqTVjN5wo939vrrop3mmDY02ihNkqUrzOFifmQAS8iniuyc8r2oWv
         if7FaZkroXXgeFT2Izhbi51dZ+gaqZWWv3sVDxtFtynPb134VSzykyBuFCDZMrx4cezh
         6dLnJ/YB6EbGL0nKLiwTxclntiU6CWdJyPt0FcCJb6vNO+txd0xFPPsYsZeP7ZylBIb7
         UEUP8y4vc92iQXYhTTuOP9EZtfJC9zAO0/pEt5VWaJB3JOdlfXsZWbm9BdB8tkDL48V1
         QcoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=MopoL41Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a05621420c800b0044410c8ee72si3489892qve.381.2022.04.18.21.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Apr 2022 21:51:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=MopoL41Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ngfph-0001Xs-VQ
	for alex.bennee@linaro.org; Tue, 19 Apr 2022 00:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngfp2-0001Vy-26; Tue, 19 Apr 2022 00:50:40 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:46024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ngfoy-00045G-Ku; Tue, 19 Apr 2022 00:50:39 -0400
Received: by mail-io1-xd2f.google.com with SMTP id o127so11113654iof.12;
 Mon, 18 Apr 2022 21:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EkEBm+Bg2eAq4CQJ3CnPFikJldUBp3Nu12KxMyLdIl0=;
 b=MopoL41ZM2CU8v5SolTgPqvSziuBPF9MlOtKBSrNaOeJ8Vc+h7oXKuVS1XRu2sINmS
 lhDB1pcVZuZbaF5pbFmMs6ZFOjAGSweI+dFanf9t0RepveJ87YLnkK86d4kfgNtkmALa
 iRoNr6NwleEuGafZL8rgLtXyBXNV7lA74ECxnTN1L6leNA8JpoubLPsSRFMGKClm8uVI
 tvtCzx7aoNemjTkcmMgrjgv2dZyUK6WupbruhMmM2wtXdtKt4i/nbIokB0OmjEint1v6
 jub0/jKv1X1E/zavYdlnmrTKXVL69hTDPxIOmyBz3/ZcPuTvUKzquf8I03lBr6guB6S6
 0p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EkEBm+Bg2eAq4CQJ3CnPFikJldUBp3Nu12KxMyLdIl0=;
 b=wWbMd9IWk4JDinlWFtSD6/v5M3aKa+qt0a8+hRbxEoGx/4TM2jds08esIwiRzCR4tX
 2rR5pOdxDV3EeI1rTzHMJlNVKVXrPwYZFnjxMJDeGVYaA7GIM7+uyGaO8NeVosTAjYf1
 zveTryY/8TcjHKjln06E069HcvlvHuwlUh5NLCi+Bv3NAdXp49SuH2iW8iRi1EEJ7sLt
 AQuP8pluBdtZcapkWVQHIx4nEGnkzeD59YU73Gs0Vpgmkdo3xslTFsw4riIbhnFyBdkC
 FD9QQaJrn6S6M+0LJ6Ym+mUjJLzF4TFvKs77e1PzGTP8Ixg1+V1x5ounZmd/tOy3n/A6
 8lEg==
X-Gm-Message-State: AOAM5323/F5wzPVZvd8Vfc0v8fztlvzkxhr/fgVICwg3EHln1+MIupRO
 /LoPHGLCjT5CBrv0v04MbiayxztMLwOCkvMm60w=
X-Received: by 2002:a05:6638:1917:b0:328:937e:f05b with SMTP id
 p23-20020a056638191700b00328937ef05bmr2735844jal.212.1650343833486; Mon, 18
 Apr 2022 21:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
 <20220407020432.4062829-2-alistair.francis@opensource.wdc.com>
 <CALE4mHpYVY_VSjGwMk08aoEOzNfb8uyxNeQ5LYHogj-LkTfptA@mail.gmail.com>
In-Reply-To: <CALE4mHpYVY_VSjGwMk08aoEOzNfb8uyxNeQ5LYHogj-LkTfptA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Apr 2022 14:50:07 +1000
Message-ID: <CAKmqyKPqOEfbG_RbRA94RrU8gHBTYyLBc6zgOpZ-dtYrxzbWiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hw/riscv: virt: Add a machine done notifier
To: Andrew Bresticker <abrestic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0bLgmSZqaE7Q

On Sat, Apr 16, 2022 at 1:25 AM Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> Hi Alistair,
>
> On Wed, Apr 6, 2022 at 10:05 PM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Move the binary and device tree loading code to the machine done
> > notifier. This allows us to prepare for editing the device tree as part
> > of the notifier.
> >
> > This is based on similar code in the ARM virt machine.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/riscv/virt.h |   1 +
> >  hw/riscv/virt.c         | 180 +++++++++++++++++++++-------------------
> >  2 files changed, 97 insertions(+), 84 deletions(-)
> >
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index 78b058ec86..8b8db3fb7c 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -45,6 +45,7 @@ struct RISCVVirtState {
> >      MachineState parent;
> >
> >      /*< public >*/
> > +    Notifier machine_done;
> >      RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
> >      DeviceState *irqchip[VIRT_SOCKETS_MAX];
> >      PFlashCFI01 *flash[2];
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index da50cbed43..3f065b540e 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -1156,6 +1156,99 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
> >      return aplic_m;
> >  }
> >
> > +static
> > +void virt_machine_done(Notifier *notifier, void *data)
> > +{
> > +    RISCVVirtState *s = container_of(notifier, RISCVVirtState,
> > +                                     machine_done);
> > +    const MemMapEntry *memmap = virt_memmap;
> > +    MachineState *machine = MACHINE(s);
> > +    target_ulong start_addr = memmap[VIRT_DRAM].base;
> > +    target_ulong firmware_end_addr, kernel_start_addr;
> > +    uint32_t fdt_load_addr;
> > +    uint64_t kernel_entry;
> > +
> > +    /* create device tree */
> > +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> > +               riscv_is_32bit(&s->soc[0]));
>
> Creating the initial FDT in machine_init() is still useful for
> allowing guest-loader to add its FDT nodes. Yes it's currently broken
> because the FDT is finalized in machine_init(), but it'll remain
> broken after this patch :) How about splitting it up like the ARM virt
> machine and leaving FDT creation in machine_init() while doing the
> dynamic additions / finalization in the machine_done notifier? Happy
> to send a separate patch for that if you prefer.

Good point. I have left the create_fdt() call in machine_init(). Feel
free to add support for guest-loader editing FDT nodes

Alistair

>
> -Andrew
>
> > +
> > +    /*
> > +     * Only direct boot kernel is currently supported for KVM VM,
> > +     * so the "-bios" parameter is ignored and treated like "-bios none"
> > +     * when KVM is enabled.
> > +     */
> > +    if (kvm_enabled()) {
> > +        g_free(machine->firmware);
> > +        machine->firmware = g_strdup("none");
> > +    }
> > +
> > +    if (riscv_is_32bit(&s->soc[0])) {
> > +        firmware_end_addr = riscv_find_and_load_firmware(machine,
> > +                                    RISCV32_BIOS_BIN, start_addr, NULL);
> > +    } else {
> > +        firmware_end_addr = riscv_find_and_load_firmware(machine,
> > +                                    RISCV64_BIOS_BIN, start_addr, NULL);
> > +    }
> > +
> > +    if (machine->kernel_filename) {
> > +        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
> > +                                                         firmware_end_addr);
> > +
> > +        kernel_entry = riscv_load_kernel(machine->kernel_filename,
> > +                                         kernel_start_addr, NULL);
> > +
> > +        if (machine->initrd_filename) {
> > +            hwaddr start;
> > +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> > +                                           machine->ram_size, kernel_entry,
> > +                                           &start);
> > +            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> > +                                  "linux,initrd-start", start);
> > +            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
> > +                                  end);
> > +        }
> > +    } else {
> > +       /*
> > +        * If dynamic firmware is used, it doesn't know where is the next mode
> > +        * if kernel argument is not set.
> > +        */
> > +        kernel_entry = 0;
> > +    }
> > +
> > +    if (drive_get(IF_PFLASH, 0, 0)) {
> > +        /*
> > +         * Pflash was supplied, let's overwrite the address we jump to after
> > +         * reset to the base of the flash.
> > +         */
> > +        start_addr = virt_memmap[VIRT_FLASH].base;
> > +    }
> > +
> > +    /*
> > +     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> > +     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> > +     */
> > +    s->fw_cfg = create_fw_cfg(machine);
> > +    rom_set_fw(s->fw_cfg);
> > +
> > +    /* Compute the fdt load address in dram */
> > +    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
> > +                                   machine->ram_size, machine->fdt);
> > +    /* load the reset vector */
> > +    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
> > +                              virt_memmap[VIRT_MROM].base,
> > +                              virt_memmap[VIRT_MROM].size, kernel_entry,
> > +                              fdt_load_addr, machine->fdt);
> > +
> > +    /*
> > +     * Only direct boot kernel is currently supported for KVM VM,
> > +     * So here setup kernel start address and fdt address.
> > +     * TODO:Support firmware loading and integrate to TCG start
> > +     */
> > +    if (kvm_enabled()) {
> > +        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
> > +    }
> > +}
> > +
> >  static void virt_machine_init(MachineState *machine)
> >  {
> >      const MemMapEntry *memmap = virt_memmap;
> > @@ -1163,10 +1256,6 @@ static void virt_machine_init(MachineState *machine)
> >      MemoryRegion *system_memory = get_system_memory();
> >      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
> >      char *soc_name;
> > -    target_ulong start_addr = memmap[VIRT_DRAM].base;
> > -    target_ulong firmware_end_addr, kernel_start_addr;
> > -    uint32_t fdt_load_addr;
> > -    uint64_t kernel_entry;
> >      DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
> >      int i, base_hartid, hart_count;
> >
> > @@ -1296,92 +1385,12 @@ static void virt_machine_init(MachineState *machine)
> >      memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
> >          machine->ram);
> >
> > -    /* create device tree */
> > -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> > -               riscv_is_32bit(&s->soc[0]));
> > -
> >      /* boot rom */
> >      memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
> >                             memmap[VIRT_MROM].size, &error_fatal);
> >      memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
> >                                  mask_rom);
> >
> > -    /*
> > -     * Only direct boot kernel is currently supported for KVM VM,
> > -     * so the "-bios" parameter is ignored and treated like "-bios none"
> > -     * when KVM is enabled.
> > -     */
> > -    if (kvm_enabled()) {
> > -        g_free(machine->firmware);
> > -        machine->firmware = g_strdup("none");
> > -    }
> > -
> > -    if (riscv_is_32bit(&s->soc[0])) {
> > -        firmware_end_addr = riscv_find_and_load_firmware(machine,
> > -                                    RISCV32_BIOS_BIN, start_addr, NULL);
> > -    } else {
> > -        firmware_end_addr = riscv_find_and_load_firmware(machine,
> > -                                    RISCV64_BIOS_BIN, start_addr, NULL);
> > -    }
> > -
> > -    if (machine->kernel_filename) {
> > -        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
> > -                                                         firmware_end_addr);
> > -
> > -        kernel_entry = riscv_load_kernel(machine->kernel_filename,
> > -                                         kernel_start_addr, NULL);
> > -
> > -        if (machine->initrd_filename) {
> > -            hwaddr start;
> > -            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> > -                                           machine->ram_size, kernel_entry,
> > -                                           &start);
> > -            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> > -                                  "linux,initrd-start", start);
> > -            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
> > -                                  end);
> > -        }
> > -    } else {
> > -       /*
> > -        * If dynamic firmware is used, it doesn't know where is the next mode
> > -        * if kernel argument is not set.
> > -        */
> > -        kernel_entry = 0;
> > -    }
> > -
> > -    if (drive_get(IF_PFLASH, 0, 0)) {
> > -        /*
> > -         * Pflash was supplied, let's overwrite the address we jump to after
> > -         * reset to the base of the flash.
> > -         */
> > -        start_addr = virt_memmap[VIRT_FLASH].base;
> > -    }
> > -
> > -    /*
> > -     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> > -     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> > -     */
> > -    s->fw_cfg = create_fw_cfg(machine);
> > -    rom_set_fw(s->fw_cfg);
> > -
> > -    /* Compute the fdt load address in dram */
> > -    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
> > -                                   machine->ram_size, machine->fdt);
> > -    /* load the reset vector */
> > -    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
> > -                              virt_memmap[VIRT_MROM].base,
> > -                              virt_memmap[VIRT_MROM].size, kernel_entry,
> > -                              fdt_load_addr, machine->fdt);
> > -
> > -    /*
> > -     * Only direct boot kernel is currently supported for KVM VM,
> > -     * So here setup kernel start address and fdt address.
> > -     * TODO:Support firmware loading and integrate to TCG start
> > -     */
> > -    if (kvm_enabled()) {
> > -        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
> > -    }
> > -
> >      /* SiFive Test MMIO device */
> >      sifive_test_create(memmap[VIRT_TEST].base);
> >
> > @@ -1417,6 +1426,9 @@ static void virt_machine_init(MachineState *machine)
> >                                    drive_get(IF_PFLASH, 0, i));
> >      }
> >      virt_flash_map(s, system_memory);
> > +
> > +    s->machine_done.notify = virt_machine_done;
> > +    qemu_add_machine_init_done_notifier(&s->machine_done);
> >  }
> >
> >  static void virt_machine_instance_init(Object *obj)
> > --
> > 2.35.1
> >
> >
