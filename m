Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp246258ejb;
        Tue, 28 Mar 2023 22:04:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350auo+aS9vMn0gGiRTSfOATRCrh6sQlQ9p5a7mNIrx2AUQjno2aYtXWXZkTbZ8dWfdRw39zV
X-Received: by 2002:ac8:5c46:0:b0:3e4:e8a8:f235 with SMTP id j6-20020ac85c46000000b003e4e8a8f235mr16380677qtj.36.1680066255921;
        Tue, 28 Mar 2023 22:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680066255; cv=none;
        d=google.com; s=arc-20160816;
        b=dVXAWay5t65pWYOzAsxo0O/OX4/zoX73cKVpW/NOt90/Z8Pim8s/8UCLMgbaOTjQBx
         X7kUuDRRWCA2oke8Bu6Ypguq9iGNJIzLmwiTnM1AFVy6zYJeg+p2uXIc23jSOkePRNBo
         SyTXg/TCCRp5Lrx6f7bckUIX+2uRaOGlvKXZ7J4wxDN6c3YOueqjWfIB5wUix0E9D/SF
         zlHK+9eXS8OjtLLhoycCK2xYokjyKbjIDVUiKIT3fUMjGxMJC0K480gKe5wUDBsy9idG
         5ROm8SkAAhypE3MA9DQaM4oQ68Emxye8Zpaf4K8Xx+KbzC3kfw5M3IJw1A2my00KrFMb
         P7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=yP0KyVKE+R1sUog5E8X20TxoAAGxmYFNRLauaZmRtJ0=;
        b=upcCg2YBRTcr1eMEYb0jDvRBTyClkcJqSNm/YvCmIKXLEgnU8crFJm+/qeOR6YG+yB
         hypE7CsoLF97agD32MGkLFNAh9/DD+sMGpmobLHVtlJBjtvI3M+ntQvfDJpPR/Plga8/
         dE3/5iRAvZN9w083dVmCysTcpaKY5mVU5KFJf+ueR0SGme8Otv3lKfg9EOJV6pqgJfwh
         dfQB1tJP5GxPLwxcEbY7I6GGfCUx4ogLQGOfqkWb/G46MiKjph3glrhab5pl2oN2ilqh
         iH/f6Qio8UxihWsHlwB2jx6sRaEPoDR4ry+80vrhafM1FDRreaJS0Lody+TaXYtBPAlM
         k/rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C49l81fV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10-20020ae9eb0a000000b007467bb47939si18295117qkg.182.2023.03.28.22.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 22:04:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C49l81fV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phNyi-0005e1-3X; Wed, 29 Mar 2023 01:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phNyg-0005dl-U0
 for qemu-arm@nongnu.org; Wed, 29 Mar 2023 01:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phNyf-0007TJ-9c
 for qemu-arm@nongnu.org; Wed, 29 Mar 2023 01:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680066244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yP0KyVKE+R1sUog5E8X20TxoAAGxmYFNRLauaZmRtJ0=;
 b=C49l81fVSIyHiTZSmCp7U+5WchRhBCt94lPx9g/eA6KW1Y2fKsiCsGrFwEq1Pre3vMpTZf
 HzKEAB5sL9TJ6GmPfD4K394ed2iVl2Ihiqh2XXzP2vNMrWhajc2Mxxpam0ZJJTzIzHfsAU
 Tyiv6R5/8o1dSp24jBdRjLFVmZWJOlk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-m-dx-B5fNpGSFJqa__QAug-1; Wed, 29 Mar 2023 01:04:03 -0400
X-MC-Unique: m-dx-B5fNpGSFJqa__QAug-1
Received: by mail-wm1-f69.google.com with SMTP id
 d11-20020a05600c34cb00b003ee89ce8cc3so7248889wmq.7
 for <qemu-arm@nongnu.org>; Tue, 28 Mar 2023 22:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680066242;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yP0KyVKE+R1sUog5E8X20TxoAAGxmYFNRLauaZmRtJ0=;
 b=WV0v80WWOEZPf2r8ONDeE3dpP4V56N8Ly3iYBD0mztQUy+RKjRN5ra0QsaHYp1W3QK
 7cqSF+4RoNiykVIyYZvqyRer8L94KHdmhAK66XEQGN03cx+aFXmwP/jaIrbGFHxXtH66
 dsY6/9G72jhGcAZJfAJ16BEb6qY4CpM6mOf+N8lHMePtm7Qrw1luHAuQU9G0iv5TOVGH
 kdSfRsrwXcXeOat/UrtZaOdftcPsSWgqJZe58LDrtg3RG5gV/x7+liXV8BlcR2QAGuaW
 L6dRD72JJknADTfPp1H5mCVWJRdPRIgO+LDtuTYySFclJCr/wJ1dxzhgFHzvmZOFN/Fs
 xvnw==
X-Gm-Message-State: AAQBX9cgrbZ/Zjnys2KEueiGVvMpG6GKST+3QS7ajxRg8Lu8dYMpjTpu
 t8Tp2xrz9NNgRmJGlSVSy0+l16IxPG7haRpdLYTDk71BewZD51iLlHyi6+pKmt0zToa7Jf8a3Q0
 V3yInXvTSdZnH
X-Received: by 2002:a05:6000:10:b0:2ce:a6f6:edca with SMTP id
 h16-20020a056000001000b002cea6f6edcamr12814285wrx.55.1680066241947; 
 Tue, 28 Mar 2023 22:04:01 -0700 (PDT)
X-Received: by 2002:a05:6000:10:b0:2ce:a6f6:edca with SMTP id
 h16-20020a056000001000b002cea6f6edcamr12814272wrx.55.1680066241651; 
 Tue, 28 Mar 2023 22:04:01 -0700 (PDT)
Received: from redhat.com ([2.52.18.165]) by smtp.gmail.com with ESMTPSA id
 k10-20020a5d6e8a000000b002d1daafea30sm29066230wrz.34.2023.03.28.22.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 22:04:01 -0700 (PDT)
Date: Wed, 29 Mar 2023 01:03:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH 2/2] hw/acpi: i386: bump MADT to revision 5
Message-ID: <20230329010126-mutt-send-email-mst@kernel.org>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-3-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230328155926.2277-3-eric.devolder@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: qiFatRkI5/dR

On Tue, Mar 28, 2023 at 11:59:26AM -0400, Eric DeVolder wrote:
> Currently i386 QEMU generates MADT revision 3, and reports
> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
> 
> For MADT revision 4, that introduces ARM GIC structures, which do
> not apply to i386.
> 
> For MADT revision 5, the Local APIC flags introduces the Online
> Capable bitfield.
> 
> Making MADT generate and report revision 5 will solve problems with
> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

I am looking for ways to reduce risk of breakage with this.
We don't currently have a reason to change it if cpu
hotplug is off, do we? Maybe make it conditional on that.





> ---
>  hw/i386/acpi-common.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 52e5c1439a..1e3a13a36c 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>  {
>      uint32_t apic_id = apic_ids->cpus[uid].arch_id;
>      /* Flags – Local APIC Flags */
> -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> -                     1 /* Enabled */ : 0;
> +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> +                     true /* Enabled */ : false;
> +    /*
> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> +     * if Enabled is set.
> +     */
> +    bool onlinecapable = enabled ? false : true; /* Online Capable */
> +    uint32_t flags = onlinecapable ? 0x2 : 0x0 |
> +        enabled ? 0x1 : 0x0;
>  
>      /* ACPI spec says that LAPIC entry for non present
>       * CPU may be omitted from MADT or it must be marked
> @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
>      AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
>                          .oem_table_id = oem_table_id };
>  
>      acpi_table_begin(&table, table_data);
> -- 
> 2.31.1
> 
> 
> 

