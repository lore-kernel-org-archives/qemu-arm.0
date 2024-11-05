Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3163612njc;
        Tue, 5 Nov 2024 15:02:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXu9L4/p+WE0xjZ/uAjqMSZERSS+AKnmBisW0n1Co9VU1pI4OecK1WKT6jpa1HR+RZqS8NoFA997ZqnSw==@linaro.org
X-Google-Smtp-Source: AGHT+IHPFwJ8mfoWGtoHokvSsmgBeZj7E6HPkOHW5AtWx2K7zIGgjngbO7zlXBadgomydR3AkzBM
X-Received: by 2002:a05:622a:18a1:b0:460:ae0f:4708 with SMTP id d75a77b69052e-462b86579fcmr259105171cf.1.1730847768707;
        Tue, 05 Nov 2024 15:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730847768; cv=none;
        d=google.com; s=arc-20240605;
        b=hrqNR9+w4UY79jt3MwMje/YhrnPAF0q9BrG1fukcG0AfZ0jvb+y9h6s09k3h3VE7kv
         Frtln+qRVQAd8F5tg9sVYruofpXdU1tXT31MJ30Jw+wRKgzx9Z45gQyxt5mQ3I8jtwtN
         vXKIP+u5QqkWWOciXe0lnZPR2B0P8Mdi9wRt1m0eYzZZ7taeYBArBi/XK4A4RlOAkpZF
         jq6Xz4I1UJRL3DUwnIuSOYDMb9nsKlNgbv9y7H5eC6BezcP/zFC+X+4rLJ+4j9vdj9uG
         TVgfFer6pZ5qj2/tTitCsFhX3jzrS+waRCmlg0WUHtiPfIGYmzQqvsHAyD9NDyObl9il
         Cp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=+1zRsQOSlz5lLxWp81jnxAZHaOYR3Y4jOwTntP9DeL0=;
        fh=0MpdSeTiAhWi5qz0oo5mnjig9/wi/pK1PHcGVOzumu8=;
        b=FQYzHrOK7sKsFV1NKL0nhe/WGrGuKLEWxiIayZViWtWszzFAwHLDb6TusCJUBaIqLQ
         uH/G8m5eEm27v0JtOpZ4xoNLCVfvCUk0ocFJ1iFujs+E7+YfzgOa9G+qvVW6LRhbVsAx
         p+N/+Is265k0HOkLIwllzx0C/xIOBvS+ukVA2s1PKaYuch3j3S6Xhbye6Q4uP7ek69pR
         VoKDIVFe/z0cRurKxaHV/EkILRjq3jFD4hgQRkkF4pAfWN0T6ZisPP414/blkr4qT7Dz
         xHEVAry4sLbnsRnFBrN9CqZtkPSDG+tCgJV4pm3g7M4rW1MF8nJlBNQwGD6CpAptgeZ1
         Peog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XNgCBFMs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad275f78si157208511cf.675.2024.11.05.15.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 15:02:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XNgCBFMs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8SZD-0006Ev-CC; Tue, 05 Nov 2024 18:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1t8SZ8-0006E3-O4; Tue, 05 Nov 2024 18:02:26 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1t8SZ7-0007Od-1n; Tue, 05 Nov 2024 18:02:26 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso51067665e9.1; 
 Tue, 05 Nov 2024 15:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730847743; x=1731452543; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+1zRsQOSlz5lLxWp81jnxAZHaOYR3Y4jOwTntP9DeL0=;
 b=XNgCBFMscZCXE2rcZkMkgiOJAunrdmG6UI9IIQrgECbS4S3EphZIJ7/jkrU5xRfBvL
 M3Jo6y7svc6n0T4gdYo7TEcLWZb2zkweX22hDUNMZsO5ESUF85Nzb2N2XAfBVYVJTNfz
 PqcH2JsfUpKPayWEdxIDnIKKG910uH9RoVgzds2oBQUYlzoZPJnLc78InWylDfF8nt8C
 ia0eWyOz+6q9DMNc8toFUIG8jNBJgbkReT/+UWURxKiH74RDiDX1MqK6Jqjh6BrVHZsZ
 E1EfL20Sp5DrBIqR/Sxv8D2liq2w66Opyupt8vpBWHJgE05kPEwwqNV9nO3/52jr9YNZ
 mPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730847743; x=1731452543;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+1zRsQOSlz5lLxWp81jnxAZHaOYR3Y4jOwTntP9DeL0=;
 b=OTWb4PFU6Iwm6xexw4G+x6K70OB/9BPTERr9fFyruEDLss0YgTmusevE7P7IdQSkCE
 uctlDM8o0wwaP8kE0UoGVutiWZotmM7gbtiQMPu+FTaw1lpFU8amp5VsRbe+PtiLSmwv
 +Y5Qj8lCHr+PfFkpRJ7X3ARgA72mxV4YgjhiilF5uXQknv+RNJGk0h8qBXXNUwOASI7i
 nwp/2u7eL7q9TkJWucrFVTO45a3eYXX8Bj2xGcSalyIsj8qBHCCclG8i81/EHXAWWhhL
 EkponmO8qWl64WxRJjJBkybuJNu5/4j0dTXjUnn32loS9EZIzqNPuq2VT3zDZV1qpanK
 sjgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVHQsOYOyM6FXVmKCuHHwIihBxaM7VGHTUDyU4WxRioeeVk2zRnsS/MPdO88B7LDpXOCLkZ53QHA==@nongnu.org
X-Gm-Message-State: AOJu0YxuEOuH9oUKcRQaFW32Nu5CF+b3g2oZ1KI3RG/RfOwLeSF2S9F+
 I3vMjqN2OixfokqflsQ7xI1oOohKhGhwVlEhELRXhgbeJKuwVf0u
X-Received: by 2002:a05:600c:35cf:b0:431:3b53:105e with SMTP id
 5b1f17b1804b1-43283244e02mr157282855e9.9.1730847742928; 
 Tue, 05 Nov 2024 15:02:22 -0800 (PST)
Received: from gmail.com ([89.101.60.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e734csm17386214f8f.60.2024.11.05.15.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 15:02:22 -0800 (PST)
Date: Wed, 6 Nov 2024 00:02:22 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 08/19] hw/microblaze: Propagate CPU endianness to
 microblaze_load_kernel()
Message-ID: <Zyqj_mB8pkuQ2rG4@zapote>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-9-philmd@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uNCKDPwBKHUn

On Tue, Nov 05, 2024 at 02:04:20PM +0100, Philippe Mathieu-Daudé wrote:
> Pass vCPU endianness as argument so we can load kernels
> with different endianness (different from the qemu-system-binary
> builtin one).

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/microblaze/boot.h                     | 4 ++--
>  hw/microblaze/boot.c                     | 8 ++++----
>  hw/microblaze/petalogix_ml605_mmu.c      | 2 +-
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 2 +-
>  hw/microblaze/xlnx-zynqmp-pmu.c          | 2 +-
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/microblaze/boot.h b/hw/microblaze/boot.h
> index 5a8c2f79750..d179a551a69 100644
> --- a/hw/microblaze/boot.h
> +++ b/hw/microblaze/boot.h
> @@ -2,8 +2,8 @@
>  #define MICROBLAZE_BOOT_H
>  
>  
> -void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
> -                            uint32_t ramsize,
> +void microblaze_load_kernel(MicroBlazeCPU *cpu, bool is_little_endian,
> +                            hwaddr ddr_base, uint32_t ramsize,
>                              const char *initrd_filename,
>                              const char *dtb_filename,
>                              void (*machine_cpu_reset)(MicroBlazeCPU *));
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index ed61e483ee8..3675489fa5b 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -114,8 +114,8 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
>      return addr - 0x30000000LL;
>  }
>  
> -void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
> -                            uint32_t ramsize,
> +void microblaze_load_kernel(MicroBlazeCPU *cpu, bool is_little_endian,
> +                            hwaddr ddr_base, uint32_t ramsize,
>                              const char *initrd_filename,
>                              const char *dtb_filename,
>                              void (*machine_cpu_reset)(MicroBlazeCPU *))
> @@ -144,13 +144,13 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>          /* Boots a kernel elf binary.  */
>          kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
>                                 &entry, NULL, &high, NULL,
> -                               TARGET_BIG_ENDIAN, EM_MICROBLAZE, 0, 0);
> +                               !is_little_endian, EM_MICROBLAZE, 0, 0);
>          base32 = entry;
>          if (base32 == 0xc0000000) {
>              kernel_size = load_elf(kernel_filename, NULL,
>                                     translate_kernel_address, NULL,
>                                     &entry, NULL, NULL, NULL,
> -                                   TARGET_BIG_ENDIAN, EM_MICROBLAZE, 0, 0);
> +                                   !is_little_endian, EM_MICROBLAZE, 0, 0);
>          }
>          /* Always boot into physical ram.  */
>          boot_info.bootstrap_pc = (uint32_t)entry;
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
> index 61e47d83988..d2b2109065d 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -204,7 +204,7 @@ petalogix_ml605_init(MachineState *machine)
>      cpu->cfg.pvr_regs[5] = 0xc56be000;
>      cpu->cfg.pvr_regs[10] = 0x0e000000; /* virtex 6 */
>  
> -    microblaze_load_kernel(cpu, MEMORY_BASEADDR, ram_size,
> +    microblaze_load_kernel(cpu, true, MEMORY_BASEADDR, ram_size,
>                             machine->initrd_filename,
>                             BINARY_DEVICE_TREE_FILE,
>                             NULL);
> diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
> index 6c0f5c6c651..8110be83715 100644
> --- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
> +++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
> @@ -129,7 +129,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
>  
>      create_unimplemented_device("xps_gpio", GPIO_BASEADDR, 0x10000);
>  
> -    microblaze_load_kernel(cpu, ddr_base, ram_size,
> +    microblaze_load_kernel(cpu, !TARGET_BIG_ENDIAN, ddr_base, ram_size,
>                             machine->initrd_filename,
>                             BINARY_DEVICE_TREE_FILE,
>                             NULL);
> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
> index 567aad47bfc..bdbf7328bf4 100644
> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
> @@ -172,7 +172,7 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
>      qdev_realize(DEVICE(pmu), NULL, &error_fatal);
>  
>      /* Load the kernel */
> -    microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
> +    microblaze_load_kernel(&pmu->cpu, true, XLNX_ZYNQMP_PMU_RAM_ADDR,
>                             machine->ram_size,
>                             machine->initrd_filename,
>                             machine->dtb,
> -- 
> 2.45.2
> 
