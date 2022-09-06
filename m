Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2780974ejh;
        Tue, 6 Sep 2022 00:21:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5/tEiOBsNUeqUvOfXCSM3D3VXZPgSpTyy1+EQxgBB0KuuObZyxVCjtRbx/tBQozwfekzTA
X-Received: by 2002:a05:622a:1895:b0:344:f8dc:d070 with SMTP id v21-20020a05622a189500b00344f8dcd070mr42384949qtc.416.1662448872900;
        Tue, 06 Sep 2022 00:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662448872; cv=none;
        d=google.com; s=arc-20160816;
        b=bd22AL0JGXMh/LXawkEVUF/khd7aS621hVbitkARjlhQCBjNhxpLDCCAWlTTcYvN/q
         BlDDgJ2hSL0pB5HqnQ20WzvTumu/VbzAmRIIpAymYtGf+ksMB5GWQGcZaQJe0ZrOlYJ3
         hKYNa6C34AgEd+4SlBlEnFU28RA2EUleB+uCvxILX11B5oIwRq6xMloOUOMUH57bj3ei
         EDAYh9itj2i2NRHazUZ69eOoi7WGdco5Wydy/frSyKUMUCV1pNI+TNN8nKu+oyYe+wQU
         HUQeh42jYzEhCo2vLAowdOgOweI6WM96QPjbgy27CngOZ0fsOgE8ayHRMqtM/W6yffLw
         /XgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2Jpfz+WIB/we4TX6mXR/DxZWXuNK5/543RdUPIpixbs=;
        b=HXp9PJ/hRbQ0LrAWXyf1C395ml/BiFRvtjEhT6kk+/mT/620Uuoilp5qHzBtTQJ1wq
         XMCtgxYoCv1b3DSCd6c3eHNRRmdYU3lIC0UweIVD014mDb3DBsVQQZbqzUFqwqfVADL8
         FCNxtD9eI2RmbSvXWDVpJP1JzWEYfDyI3KTaTHbUFlNQIrEBt/TToV6+i0LXOx8WPDyO
         1ellyx8FuQeG1ZMQPhsUqn0Y6yihwnqZ++VqHpOrgMjkvXvxoP40Eq4cBVxY3DgU9Qwk
         NdQiU4ZI+NhHWgc6cHdWEjxU2042NDbf0oyIBqty/KxQEQrZPIr1eBaItCdl30VmJpdj
         HxIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=hFiM7uC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020ad45be5000000b00496cddbd3bcsi7182184qvc.373.2022.09.06.00.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 00:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=hFiM7uC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVStU-0004eb-Ei
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 03:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSt3-0004dV-Oh
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 03:20:46 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSt1-0001Gk-N3
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 03:20:45 -0400
Received: by mail-ed1-x535.google.com with SMTP id r4so13906067edi.8
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 00:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=2Jpfz+WIB/we4TX6mXR/DxZWXuNK5/543RdUPIpixbs=;
 b=hFiM7uC3hO+t7hVUOF+IjdMhxZ4D4EPrM6folZtHmGRYzNbdWr5S6qEulK5jFkJpVs
 LXYMPFyDQt+S0oshkc6E941IInHjn27zQ7upOXxbVIJ4J94g669yO1c0QBhd4GX9khLQ
 4cxpgu4EGm+ZHUTr6+Smgvv3NqaRWOVqQrs+bjLb3/ULVK0mz8XvX0hJHmXI/gCD3VJr
 SKT8KZ+R9JQpNTnRMkmCufY8aLgQOtCZ9dv51oYNzvUjpe705K0eNGW8e+XfYxdEU0p3
 mPQR9DHGCeEpp8AaIVxTzlDdU8lu8G2leES2lXQV3Eu2cOi+kJnYoIf7O93295yYU9Wx
 UTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=2Jpfz+WIB/we4TX6mXR/DxZWXuNK5/543RdUPIpixbs=;
 b=CoTFmwP/HRjmvi4UIDxEqBVPgOv6YF4VMbLpwyZkhgpx8lc3HEAcEENonxpGBiySms
 v2fQDXqAFtVroZjqxygaJAeQCekJ/okq09P4AjEaPiTATB0EZQ9pjYEKWroSXnK/GLP5
 oRSS459E07d3yiF8Y7wtGTZ1jRQq7A+UT7dgYK6S+XlYmQmRg1HxHEjLtSZcVDrHA8Sd
 Ph6x7C3uES2158TM+/drLF2My92fAO4FkTpo1DiviyzR93h5wgDIzqRYnw69hJU/u+BI
 O6H2jBGAF22RKQV5kdGppEDL4dDlnIC/n8FEVQqdewcHd6zT6XH8Q2kvqZqbQeLVXP4E
 fB2g==
X-Gm-Message-State: ACgBeo1lS1wuXiyXs+CZwInxhucWlRh7fqknmchlLR5mV2FYZ48S5J37
 LXdvTK42HAk9344/hhtF8e8QZw==
X-Received: by 2002:a05:6402:b6c:b0:44e:2faf:1ba4 with SMTP id
 cb12-20020a0564020b6c00b0044e2faf1ba4mr9720993edb.191.1662448842370; 
 Tue, 06 Sep 2022 00:20:42 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 dc4-20020a170906c7c400b0073bf84be798sm6110735ejb.142.2022.09.06.00.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:20:41 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:20:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V3 2/3] hw/riscv: virt: Move create_fw_cfg() prior to
 loading kernel
Message-ID: <20220906072040.rycwn7qxnhoc7sro@kamzik>
References: <20220906042451.379611-1-sunilvl@ventanamicro.com>
 <20220906042451.379611-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906042451.379611-3-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QcQrqJu5IW2D

On Tue, Sep 06, 2022 at 09:54:50AM +0530, Sunil V L wrote:
> To enable both -kernel and -pflash options, the fw_cfg needs to be
> created prior to loading the kernel.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index ff8c0df5cd..b6bbf03f61 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1251,6 +1251,13 @@ static void virt_machine_done(Notifier *notifier, void *data)
>                                      RISCV64_BIOS_BIN, start_addr, NULL);
>      }
>  
> +    /*
> +     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> +     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> +     */
> +    s->fw_cfg = create_fw_cfg(machine);
> +    rom_set_fw(s->fw_cfg);
> +
>      if (machine->kernel_filename) {
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
> @@ -1284,13 +1291,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          start_addr = virt_memmap[VIRT_FLASH].base;
>      }
>  
> -    /*
> -     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> -     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> -     */
> -    s->fw_cfg = create_fw_cfg(machine);
> -    rom_set_fw(s->fw_cfg);
> -
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
>                                     machine->ram_size, machine->fdt);
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
