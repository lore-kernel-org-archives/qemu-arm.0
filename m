Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3878651lfb;
        Mon, 30 Aug 2021 01:39:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMBON2LqjTeFA4SMQ/EcJLu463Oxy+qb5to477tk5HI2AMm6ugA1BJOq0jPZapfluwi/Ul
X-Received: by 2002:a25:6d43:: with SMTP id i64mr22289581ybc.252.1630312791486;
        Mon, 30 Aug 2021 01:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630312791; cv=none;
        d=google.com; s=arc-20160816;
        b=M4b+s2+1lSgDEBXLmSKpXGgyZksVW14QOKnE1Vrw9RoFAiu8mV1tvV9Ff8XKJz8d42
         Ds29ZqBIYGW4L8n7xxbJ3CvLoYWcmA316lRMPMEOUcMaJ2kKjx2W4xLjsOee/cSpV4K0
         m9NopufKQbWQSxPLQNTZd+qBIAZ5SCPYiWUxyOPuqIHtW54/68Iia1ixL7Nl1E+sRAw0
         PjNSDXfAiVHcBwO+GpsGmtn3dgEg0dVtRYaXYtHNY3UerxxdiKJ3+DlM+0r76g6zDR0l
         XbI473N5qqGL/gqksKZC7OyZ0XpmOyKoF6ShNaPofHJI8RImD05iQei9LwM6pSYex7BV
         LYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=s0eK0yjhDIRV7D3XYtVKl7JDvnVIl6/v5vCUGQjakH8=;
        b=P6g5RgmlDLbctxImniYrMaIZg5s6OCPUAbslMKMJji0WQr2O2sgBomx2H5Q0xzaN/p
         pOetSbPS3cVALrxicrXDpnnz+WJNPV4yrrQWWC5ADLeH1OPzlvKFoEjomfpxNzJTrMfO
         biNs/hkD+pdghSiM86jP5hs60ATy9BkEVd2pBcHRiGzb5DQneidgEugSJpO2PKeCkijU
         eJyokviop3wuLRPsfX/pDGQATVklKDL6i0iwHD0EnxM6EDOkhzSa6etpQz/uZNV5KsLL
         t4lJa5gqnHK/Y+RV1L4INBxdFOEyFRGLBmIHs6wI2CqTvXSlXbivV9/x037ZX5y6oa/o
         GH3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="V78/0JPb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si15018702ybp.202.2021.08.30.01.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Aug 2021 01:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="V78/0JPb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKcpa-0005QM-PQ
	for alex.bennee@linaro.org; Mon, 30 Aug 2021 04:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcpR-0005Pz-AY
 for qemu-arm@nongnu.org; Mon, 30 Aug 2021 04:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcpO-0001lW-JR
 for qemu-arm@nongnu.org; Mon, 30 Aug 2021 04:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630312776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0eK0yjhDIRV7D3XYtVKl7JDvnVIl6/v5vCUGQjakH8=;
 b=V78/0JPbQtDyzFjCqyOVkKzURdNROHNKQAWIuxIP4DvjRhBV9zlYfYQx72l+JhUwE4gDLf
 tSROLxPiwtlCT1OwDl1umX+2Q0ZkkJSAWyNF5XARrGYXxn/F33fOWVOpuU3w6zmmspKqF+
 7zr4ykYd6SaCIc+7B0PzfI9e5XkK/Hw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-nP28iwzXNCCEMpRZv8mKXQ-1; Mon, 30 Aug 2021 04:39:34 -0400
X-MC-Unique: nP28iwzXNCCEMpRZv8mKXQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 b6-20020aa7c6c6000000b003c2b5b2ddf8so3197839eds.0
 for <qemu-arm@nongnu.org>; Mon, 30 Aug 2021 01:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s0eK0yjhDIRV7D3XYtVKl7JDvnVIl6/v5vCUGQjakH8=;
 b=g4eMn+OrT5ONIcUetCDvYu0BOI882bLw0wmpptcFVEP2YSlyiPwYuibHHcbssnpDLT
 Vl4pznIWixrMOnmAyMuo46v0xXkPc3ePyVLtsmeffCLSyusZBFRW8kGIrKBlOJAmnNs5
 YulqJFV165/A1WZ+2bk2fdpDoIhhM7ZrdUUCEJXrrjpoZEnxfr3vjTWYt7opf+R0qv1e
 B96eTFswe9UKa4XUQZKss/HU7uWMl3E5j/g5Gqs0Mq0iXsI87S7mYp7bIglMIM/07sIv
 Dai3mkIfXt1rrhxlmatosoWicfEFcrOxpljzQnUH5cycRRI+DJ2oCRZhe71gGy/1+2UC
 0aJA==
X-Gm-Message-State: AOAM5317x1lNz4Id1FgJzH/vHoXN3+jUBI7WOZzEnxy94IpSDRwgMuYQ
 2d65vFsKEOJbJfThjfXlKEAn0OG2Xc+sV/VUV2maWi8UVNPSy+MTmwfqaORGjYKKfh/J2RZmN80
 JFquek+mAGeNS
X-Received: by 2002:a50:ed09:: with SMTP id j9mr22727199eds.164.1630312773435; 
 Mon, 30 Aug 2021 01:39:33 -0700 (PDT)
X-Received: by 2002:a50:ed09:: with SMTP id j9mr22727180eds.164.1630312773198; 
 Mon, 30 Aug 2021 01:39:33 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id d19sm1923361eja.45.2021.08.30.01.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:39:32 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:39:31 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v5 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210830083931.4fft4c5cv4c4ysni@gator.home>
References: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
 <20210830082820.2690275-2-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210830082820.2690275-2-ishii.shuuichir@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dEH79zsV4GvZ

On Mon, Aug 30, 2021 at 05:28:18PM +0900, Shuuichirou Ishii wrote:
> Add a definition for the Fujitsu A64FX processor.
> 
> The A64FX processor does not implement the AArch32 Execution state,
> so there are no associated AArch32 Identification registers.
> 
> For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.
> 
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu64.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 2f0cbddab5..15245a60a8 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -841,10 +841,58 @@ static void aarch64_max_initfn(Object *obj)
>                          cpu_max_set_sve_max_vq, NULL, NULL);
>  }
>  
> +static void aarch64_a64fx_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,a64fx";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    cpu->midr = 0x461f0010;
> +    cpu->revidr = 0x00000000;
> +    cpu->ctr = 0x86668006;
> +    cpu->reset_sctlr = 0x30000180;
> +    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
> +    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
> +    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
> +    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
> +    cpu->id_aa64afr0 = 0x0000000000000000;
> +    cpu->id_aa64afr1 = 0x0000000000000000;
> +    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
> +    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
> +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
> +    cpu->isar.id_aa64isar0 = 0x0000000010211120;
> +    cpu->isar.id_aa64isar1 = 0x0000000000010001;
> +    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
> +    cpu->clidr = 0x0000000080000023;
> +    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
> +    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
> +    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
> +    cpu->dcz_blocksize = 6; /* 256 bytes */
> +    cpu->gic_num_lrs = 4;
> +    cpu->gic_vpribits = 5;
> +    cpu->gic_vprebits = 5;
> +
> +    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> +    aarch64_add_sve_properties(obj);
> +    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
> +    set_bit(0, cpu->sve_vq_supported); /* 128bit */
> +    set_bit(1, cpu->sve_vq_supported); /* 256bit */
> +    set_bit(3, cpu->sve_vq_supported); /* 512bit */
> +
> +    /* TODO:  Add A64FX specific HPC extension registers */
> +}
> +
>  static const ARMCPUInfo aarch64_cpus[] = {
>      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
>      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
> +    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
>      { .name = "max",                .initfn = aarch64_max_initfn },
>  };
>  
> -- 
> 2.27.0
>

For the SVE stuff,

Reviewed-by: Andrew Jones <drjones@redhat.com>

Question: For testing, did you dump all the ID registers on this
model and compare them with a dump of ID registers from real
hardware? If so, that would be good info to put in the commit
message or at least the cover letter.

Thanks,
drew

