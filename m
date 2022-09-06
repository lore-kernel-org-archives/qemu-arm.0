Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2780754ejh;
        Tue, 6 Sep 2022 00:20:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5idan3v8qPTuG6Mxo5IgfL1R5TLOztRvf83VtrKQI2ku+K1LleJiRHSUDFcO+NLsbruv5R
X-Received: by 2002:a0c:aa0c:0:b0:477:49b7:2ad with SMTP id d12-20020a0caa0c000000b0047749b702admr42805139qvb.48.1662448845043;
        Tue, 06 Sep 2022 00:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662448845; cv=none;
        d=google.com; s=arc-20160816;
        b=KVzYdxlxjZCNXDbRt9O2eBPQeH297KL1rLKAD20ALquNwDltoc88ET2/VkucbwJdTt
         S5xRwt5OXBbApGJ5e7jvJ97sikFOu3kjVyk3AVsjYbw1l7E7Dq3iX+UoPW3N89ESOsGB
         qfXgclrNNzPOhJ323ue63UUosV94fBeyMLWsYXdWYyAUWBAkvqSPDfXj2Ge70PJntBXX
         uF0cmKhH/guEpNM+yvptVC0FwdpJ83xM1ap9HM/KWCndTxRJdMG5EnGGE7IWLN3vQNfC
         kH3M5fzS0mXMQMjwoihlhQwUd/UG0f3zKe89feqZS/0290UbPxJH3tLRWq8tJs2WzjxH
         Osxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=uU5yxb2ZcfvP1uB8VXcw5BlORKFuwNRzwiM9VJJMGZc=;
        b=c/vdnoAi8eQhOqNCemsOPzM+qwiGkIRKJ0xoBLo/pmPoUlogbOsP2Zxu/3zO1nRLwp
         GgjVKLXVHuoLpE1UxMNMAqR22bX5HQxcT9J1KMy6G520yJM1JOpQ9Wb49rSpeqx+iNGK
         fR8ZlRvdOuBFx/ftiA1S+QUE9qKVUnAuvBPkxaSDtPSHU9DDIJrUPYM96V+d0F3hrKaN
         /6yOoMkZUqZVF8CQvLlT5C5PuBTNEFvjZdZg3unEjF3KzLJH0TBW7pdP3OQ3ae9s6Rbk
         YfBjmJuROo8cffpIV2TAoFpbPe8UfYMAgKBWWfqXbbsjN78vALlq6EkdAhYzaliLoTpu
         ppjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="R7d/sPCc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020a05622a111100b003446c6e015bsi8040685qty.407.2022.09.06.00.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 00:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="R7d/sPCc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVSt0-0004Bt-VE
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 03:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSsV-0004AZ-UE
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 03:20:13 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSsS-0000uP-7y
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 03:20:10 -0400
Received: by mail-ed1-x531.google.com with SMTP id 29so8848872edv.2
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=uU5yxb2ZcfvP1uB8VXcw5BlORKFuwNRzwiM9VJJMGZc=;
 b=R7d/sPCcQRs6fMPyVQjKRKqxOVTtNzH1sH0RHEr9VEwmKDGlSrVnGKxcYkHXR+dF1z
 KosAUHQw+CpmYqupmfPyjxz4qr3ANXXh0x2HRAs5b3oKwe5jAplpPLiw6UtCETfTeuiE
 wW53Q42mk5r3R5RzLdOkvtCoyc3EiLoDc490nRzIF5KdVJ7qyKykhbcSOu73VMvXviwz
 cd3s8u8uQ/q7Llmq7MQ2q1SkhWy31RRRuXvLVxlEQ6SAApkjnlcwn/8tWDyDPJC+sxn9
 lO6wqD9syCNGJsl3kXO7cahYMPK7sxzAaDqwDhcRHQRg65c+R/baG4uJ5w6dneLbuqPy
 R+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=uU5yxb2ZcfvP1uB8VXcw5BlORKFuwNRzwiM9VJJMGZc=;
 b=lerOc2AF1T+HU6BHSXRodKeMAFePECr0x6Jc5fRLy9se2Bn7JXjMYK16OtopYS9BRE
 6ZCVR7S7HrYIfIoMPc2XDHjnPEhmzyW+pwhFmuL3NnZljf2k0bmboM7MPxj1axLjON+y
 hwBtbnpLpFcrzwdBTHTzxSWXi1d3AIJCidhdzj1olKeS6PUzp/6ljSvZCCUxS88/k3Mf
 BYcjmShhWCjHll3fhFH9QlhF1xOTIgu1Fr6bIVDne2hfle/kgfOlp/GVEXTXlrDtFpeS
 XUyhZkskQNux1RwF4Eed9B+gv52KyUX79mlmtY/8Rx5WF1+OBOOkrLPitWmo2JLVGtZ8
 QNWw==
X-Gm-Message-State: ACgBeo2utKs+5yoD28Gss4L6EwY9yjhZ67fECwCBCs7ZbEcKMPQHB0/J
 xeamZB0nkYrdw/xQfapuyXjpFA==
X-Received: by 2002:a05:6402:3506:b0:43e:954b:bc8a with SMTP id
 b6-20020a056402350600b0043e954bbc8amr47369697edd.266.1662448800925; 
 Tue, 06 Sep 2022 00:20:00 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a1709066bcd00b0073d5a8a2bfcsm6077560ejs.221.2022.09.06.00.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:20:00 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:19:58 +0200
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
Subject: Re: [PATCH V3 3/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
Message-ID: <20220906071958.fiwqbwnkofk4kqye@kamzik>
References: <20220906042451.379611-1-sunilvl@ventanamicro.com>
 <20220906042451.379611-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906042451.379611-4-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x531.google.com
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
X-TUID: GJGRO1u8IUfx

On Tue, Sep 06, 2022 at 09:54:51AM +0530, Sunil V L wrote:
> To boot S-mode firmware payload like EDK2 from persistent
> flash storage, qemu needs to pass the flash address as the
> next_addr in fw_dynamic_info to the opensbi.
> 
> When both -kernel and -pflash options are provided in command line,
> the kernel (and initrd if -initrd) will be copied to fw_cfg table.
> The S-mode FW will load the kernel/initrd from fw_cfg table.
> 
> If only pflash is given but not -kernel, then it is the job of
> of the S-mode firmware to locate and load the kernel.
> 
> In either case, update the kernel_entry with the flash address
> so that the opensbi can jump to the entry point of the S-mode
> firmware.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/boot.c         | 28 ++++++++++++++++++++++++++++
>  hw/riscv/virt.c         | 17 ++++++++++++++++-
>  include/hw/riscv/boot.h |  1 +
>  3 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 1ae7596873..39436b8d56 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -338,3 +338,31 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
>          riscv_cpu->env.fdt_addr = fdt_addr;
>      }
>  }
> +
> +void riscv_setup_firmware_boot(MachineState *machine)
> +{
> +    if (machine->kernel_filename) {
> +        FWCfgState *fw_cfg;
> +        fw_cfg = fw_cfg_find();
> +
> +        assert(fw_cfg);
> +        /*
> +         * Expose the kernel, the command line, and the initrd in fw_cfg.
> +         * We don't process them here at all, it's all left to the
> +         * firmware.
> +         */
> +        load_image_to_fw_cfg(fw_cfg,
> +                             FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
> +                             machine->kernel_filename,
> +                             true);
> +        load_image_to_fw_cfg(fw_cfg,
> +                             FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
> +                             machine->initrd_filename, false);

blank line

> +        if (machine->kernel_cmdline) {
> +            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
> +                           strlen(machine->kernel_cmdline) + 1);
> +            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
> +                              machine->kernel_cmdline);
> +        }
> +    }
> +}
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index b6bbf03f61..b985df9b16 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1258,7 +1258,22 @@ static void virt_machine_done(Notifier *notifier, void *data)
>      s->fw_cfg = create_fw_cfg(machine);
>      rom_set_fw(s->fw_cfg);
>  
> -    if (machine->kernel_filename) {
> +    if (drive_get(IF_PFLASH, 0, 1)) {
> +        /*
> +         * S-mode FW like EDk2 will be kept in second plash (unit 1). When

edk2 or EDK2

> +         * both -kernel and -pflash options are provided in command line,
                                                              ^ the
> +         * the kernel, initrd will be copied to fw_cfg table and opensbi
                        ^                         ^ the
                        ^ replace, with ' and'
                       
> +         * will jump to flash address which is the entry point of S-mode FW.
                          ^ the
> +         * It is the job of the S-mode FW to load the kernel/initrd and launch.
> +         *
> +         * If only pflash is given but not -kernel, then it is the job of
> +         * of the S-mode firmware to locate and load the kernel.
> +         * In either case, the next_addr for opensbi will be the flash address.
> +         */
> +        riscv_setup_firmware_boot(machine);
> +        kernel_entry = virt_memmap[VIRT_FLASH].base +
> +                         virt_memmap[VIRT_FLASH].size / 2;
                          ^
                          Please line up the lower virt_memmap[] with the upper

> +    } else if (machine->kernel_filename) {
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
>  
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index a36f7618f5..93e5f8760d 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -57,5 +57,6 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
>                                    uint32_t reset_vec_size,
>                                    uint64_t kernel_entry);
>  void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr);
> +void riscv_setup_firmware_boot(MachineState *machine);
>  
>  #endif /* RISCV_BOOT_H */
> -- 
> 2.25.1
> 

Besides the whitespace and comment edits

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew
