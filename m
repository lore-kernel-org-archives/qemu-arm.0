Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3742669ejf;
        Wed, 10 Aug 2022 05:39:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR57PqlsAq/VDRQAqpYU75HyhyXPy6MMKim+EGYUfDtu4V98qt/NK97grAlNnfChVWkxxXW5
X-Received: by 2002:a05:6214:27e4:b0:476:f199:40c with SMTP id jt4-20020a05621427e400b00476f199040cmr23046935qvb.118.1660135151500;
        Wed, 10 Aug 2022 05:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660135151; cv=none;
        d=google.com; s=arc-20160816;
        b=Qex18H4rgK9iVJqqKhZ3vDc6b2CxfVIKIKNfBI3eczJob0K02s3ZzucjCcZZL3b4Lp
         iuL3jmEcWB83z1t9MIl1IU530roId1q6fuPX1xLNoPd8txUTKdhX3Z26uFJt14FFp3X8
         Q0w+LYNDxkDBMZyrO3ocIqPf59oo+d2X9LreVmFaFQsjMm0q9O7MuSuf+sKUYpIz1kT7
         OT7miVb67Kt6SI5EP0ghds3Ct3edByIherVmCOKvUWj0TmNQMBViL8kwTojuAR2Y2E0X
         z439fjGABpU7Tz1YXMErsyjCbiCWuHuuC2CJ95VQBEVpkMsmth3NBEgzugxOg7NEAtT7
         VgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=vpjl9aCCcCCX+043N06DoI9KR9rnwsJ2Evt+s8uuSaw=;
        b=K3aeLGlfY8sZxGsqctpxZIJCzfowuR7z62LHLTl21VZUuDVoNEpWcnk3rbOl8hHaUD
         SMdeAXaAle4Z3FT/yHxX0HNqcZxO2L3VJXSOddmXCUyUIVmMFp+CMefBI7T+3M+YZe9r
         Mt23ZmBeB53mjH4fY3kgwqkJ+6H2amMswIp9f18BuJpRZY/CRq7slDYAPENYqHtZMfMo
         Udjf8dSVm6LQvs04SxRBM4C7bCa7luw+erQKEq0zNvUC5vDqNOv+vGc+WDjUHnhzJe0c
         lSPIa2JV4CAfzgq7ihgFOncT80MYrIHK5aM6rPud50wVAOVa3PM2Qu8TQOAdcwJFTtJO
         qJmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ZbiTM9YH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cq8-20020a05622a424800b00342f959afb3si4986059qtb.98.2022.08.10.05.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 05:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ZbiTM9YH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLkzO-0003xo-VC
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 08:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkvA-00014T-Bu
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 08:34:48 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkv8-00041l-Cz
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 08:34:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id v5so7747489wmj.0
 for <qemu-arm@nongnu.org>; Wed, 10 Aug 2022 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=vpjl9aCCcCCX+043N06DoI9KR9rnwsJ2Evt+s8uuSaw=;
 b=ZbiTM9YH5lLF7yeeXUTx71pVsknmQ/QEimkTFUicoC4fLSiGyRwjS+i9TXKGShJQcH
 3VCt20s6SIlU+Gj2fIeKxCn4T1qBjmNBJWfbpyNljBrZCv9Ui75k/SPtT5nQLFpHAcio
 JYYcM4Zh9Vz1wnnoMnNQGeSSN5dm+3bmz+gqW8YompTsXD89GvC8/DaTE9XYCSBKdrRf
 IwF5F3MM9vPa3a2+Y3Y5xeJuf/B9ev6YzCJx9NlEVM5DyU72SeEhZnipz8fOJ9/eOhoc
 olUG4ew0euMzbcHT0bsWF+ypSu3dVjZCjo3myB356N40stbHg78jQM+/oXW0OY5MN5ol
 pXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=vpjl9aCCcCCX+043N06DoI9KR9rnwsJ2Evt+s8uuSaw=;
 b=40dDKrz5ObNI5JShBGMsd7QNRsokeuLURVeqytBK/5gasM6EacaMlB2oe6wSAUB4uv
 qJqMoKPJItnEAR4I45B4MQhQHNMkRJ7gVNQajFwdo68So0KMlBmMlK5+I//CxP87dyvS
 ga1L21dSUsMbAlA35mRkj4eUVUdc9TPH/Ee7iWRAMxf2EHEWuDg/K3NQuVrAedFodPdm
 RxiDxQX8qiC8gS64/XEb3/Scbs6dotbny3aGig+gnL4pCaUdSrW73mYcJi6nR44RR9OS
 Gdv36INdpZFLSDjOTCxN6gqDi1Fd2io/iC3qRfe0bTykJr7mWWIYFNnxminiGoWQ6v7S
 kR6Q==
X-Gm-Message-State: ACgBeo2J7wVfgaYw8spPMCGwB0nPKUu08g4vtr0cPIT6NXJUSKRRM4K3
 ctx7XFszLEeZjnyFXGDo/RPsUQ==
X-Received: by 2002:a1c:2981:0:b0:3a2:ffe9:945c with SMTP id
 p123-20020a1c2981000000b003a2ffe9945cmr2352785wmp.38.1660134884804; 
 Wed, 10 Aug 2022 05:34:44 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a1c4304000000b003a5a5069107sm2187526wma.24.2022.08.10.05.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:34:44 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:34:43 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 3/6] hw/riscv: use qemu_fdt_setprop_strings() for
 string arrays
Message-ID: <20220810123443.tmt4ddkz7pdnvxz5@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-4-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-4-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W6Hb/CKFzaZV

On Tue, Aug 09, 2022 at 07:56:37PM +0100, Ben Dooks wrote:
> Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify the code.
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
>  hw/riscv/sifive_u.c | 18 +++++-------------
>  hw/riscv/spike.c    |  7 ++-----
>  hw/riscv/virt.c     | 32 ++++++++------------------------
>  3 files changed, 15 insertions(+), 42 deletions(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index e4c814a3ea..dc112a253a 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -103,13 +103,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      char *nodename;
>      uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
>      uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
> -    static const char * const ethclk_names[2] = { "pclk", "hclk" };
> -    static const char * const clint_compat[2] = {
> -        "sifive,clint0", "riscv,clint0"
> -    };
> -    static const char * const plic_compat[2] = {
> -        "sifive,plic-1.0.0", "riscv,plic0"
> -    };
>  
>      if (ms->dtb) {
>          fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
> @@ -221,11 +214,11 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      nodename = g_strdup_printf("/soc/clint@%lx",
>          (long)memmap[SIFIVE_U_DEV_CLINT].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> -        (char **)&clint_compat, ARRAY_SIZE(clint_compat));
>      qemu_fdt_setprop_cells(fdt, nodename, "reg",
>          0x0, memmap[SIFIVE_U_DEV_CLINT].base,
>          0x0, memmap[SIFIVE_U_DEV_CLINT].size);
> +    qemu_fdt_setprop_strings(fdt, nodename, "compatible",
> +                             "sifive,clint0", "riscv,clint0");

Why move this down?

>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
>          cells, ms->smp.cpus * sizeof(uint32_t) * 4);
>      g_free(cells);
> @@ -279,8 +272,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>          (long)memmap[SIFIVE_U_DEV_PLIC].base);
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
> -        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
> +    qemu_fdt_setprop_strings(fdt, nodename, "compatbile",
> +                             "sifive,plic-1.0.0", "riscv,plic0");
>      qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
>      qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
>          cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
> @@ -426,8 +419,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
>      qemu_fdt_setprop_cells(fdt, nodename, "clocks",
>          prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
> -    qemu_fdt_setprop_string_array(fdt, nodename, "clock-names",
> -        (char **)&ethclk_names, ARRAY_SIZE(ethclk_names));
> +    qemu_fdt_setprop_strings(fdt, nodename, "clock-names", "pclk", "hclk");
>      qemu_fdt_setprop(fdt, nodename, "local-mac-address",
>          s->soc.gem.conf.macaddr.a, ETH_ALEN);
>      qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index e41b6aa9f0..aa895779cd 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -59,9 +59,6 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>      uint32_t cpu_phandle, intc_phandle, phandle = 1;
>      char *name, *mem_name, *clint_name, *clust_name;
>      char *core_name, *cpu_name, *intc_name;
> -    static const char * const clint_compat[2] = {
> -        "sifive,clint0", "riscv,clint0"
> -    };
>  
>      fdt = s->fdt = create_device_tree(&s->fdt_size);
>      if (!fdt) {
> @@ -159,8 +156,8 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>              (memmap[SPIKE_CLINT].size * socket);
>          clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
>          qemu_fdt_add_subnode(fdt, clint_name);
> -        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
> -            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
> +        qemu_fdt_setprop_strings(fdt, clint_name, "compatible",
> +                                 "sifive,clint0", "riscv,clint0");
>          qemu_fdt_setprop_cells(fdt, clint_name, "reg",
>              0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
>          qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index bc424dd2f5..c6aaa611a6 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -261,11 +261,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>              intc_phandles[cpu]);
>          if (riscv_feature(&s->soc[socket].harts[cpu].env,
>                            RISCV_FEATURE_AIA)) {
> -            static const char * const compat[2] = {
> -                "riscv,cpu-intc-aia", "riscv,cpu-intc"
> -            };
> -            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
> -                                      (char **)&compat, ARRAY_SIZE(compat));
> +            qemu_fdt_setprop_strings(mc->fdt, intc_name, "compatible",
> +                                     "riscv,cpu-intc-aia", "riscv,cpu-intc");
>          } else {
>              qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
>                  "riscv,cpu-intc");
> @@ -310,9 +307,6 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
>      uint32_t *clint_cells;
>      unsigned long clint_addr;
>      MachineState *mc = MACHINE(s);
> -    static const char * const clint_compat[2] = {
> -        "sifive,clint0", "riscv,clint0"
> -    };
>  
>      clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
>  
> @@ -326,9 +320,8 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
>      clint_addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
>      clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
>      qemu_fdt_add_subnode(mc->fdt, clint_name);
> -    qemu_fdt_setprop_string_array(mc->fdt, clint_name, "compatible",
> -                                  (char **)&clint_compat,
> -                                  ARRAY_SIZE(clint_compat));
> +    qemu_fdt_setprop_strings(mc->fdt, clint_name, "compatible",
> +                             "sifive,clint0", "riscv,clint0");
>      qemu_fdt_setprop_cells(mc->fdt, clint_name, "reg",
>          0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
>      qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
> @@ -437,9 +430,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      uint32_t *plic_cells;
>      unsigned long plic_addr;
>      MachineState *mc = MACHINE(s);
> -    static const char * const plic_compat[2] = {
> -        "sifive,plic-1.0.0", "riscv,plic0"
> -    };
>  
>      if (kvm_enabled()) {
>          plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
> @@ -465,9 +455,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      qemu_fdt_add_subnode(mc->fdt, plic_name);
>      qemu_fdt_setprop_cell(mc->fdt, plic_name,
>          "#interrupt-cells", FDT_PLIC_INT_CELLS);
> -    qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
> -                                  (char **)&plic_compat,
> -                                  ARRAY_SIZE(plic_compat));
> +    qemu_fdt_setprop_strings(mc->fdt, plic_name, "compatible",
> +                             "sifive,plic-1.0.0", "riscv,plic0");
>      qemu_fdt_setprop(mc->fdt, plic_name, "interrupt-controller", NULL, 0);
>      qemu_fdt_setprop(mc->fdt, plic_name, "interrupts-extended",
>          plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> @@ -881,13 +870,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
>      name = g_strdup_printf("/soc/test@%lx",
>          (long)memmap[VIRT_TEST].base);
>      qemu_fdt_add_subnode(mc->fdt, name);
> -    {
> -        static const char * const compat[3] = {
> -            "sifive,test1", "sifive,test0", "syscon"
> -        };
> -        qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
> -                                      (char **)&compat, ARRAY_SIZE(compat));
> -    }
> +    qemu_fdt_setprop_strings(mc->fdt, name, "compatible",
> +                             "sifive,test1", "sifive,test0", "syscon");
>      qemu_fdt_setprop_cells(mc->fdt, name, "reg",
>          0x0, memmap[VIRT_TEST].base, 0x0, memmap[VIRT_TEST].size);
>      qemu_fdt_setprop_cell(mc->fdt, name, "phandle", test_phandle);
> -- 
> 2.35.1
> 
>

Other than the unnecessary line move

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
