Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp761608njb;
        Tue, 18 Feb 2025 07:22:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXn+cyb/W0e60/OZVJZQmwAmCkX9TLsfYihn9lSvI1eDn0j/5cbrP9zqIXb/YKfQt4LgJtJXnc3wkKi0A==@linaro.org
X-Google-Smtp-Source: AGHT+IG7NH/zJVscOkqQ6QRSsWUWF91p+RSOIh7wWtMZ+cV7vafxwa+Pr20/XbSp/3uPOot27frp
X-Received: by 2002:ad4:5f0a:0:b0:6e4:3c52:d67e with SMTP id 6a1803df08f44-6e66ccbcd8amr215725886d6.18.1739892139140;
        Tue, 18 Feb 2025 07:22:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739892139; cv=none;
        d=google.com; s=arc-20240605;
        b=aUa0xr8hge9bHjCYzjR9pOXAYXtG9LTUcY8eFvj6XHVkCXhCS+Gzxxt9/2ULrs47uZ
         T+4ERwiwqbuGIAmZOEZ9L1kcZRvlFdy0NbF+bq+bWDZi2V47XLfPs7NtWvYw7QJxyo2w
         sgmsIXgKZDrfuhXTNG24/g5WSB0dn3xr+P7uPxEsRlt6fEU5oUYXn/O02HJCst66GAK+
         8TzVgUC1IylwuY+sDeJ4m1c4FPs+RNAsKsK4VAwG2ei63Pt5Hhofbb0Zb2S61KjFFKTl
         1tX0qDX76yGu/17xQ1SaOYARqVpiKVnw3EiDUrRjcpecv4V+YBG66mnSa4ZqD4ewHUYp
         SWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Ot+fYgSVKyy+rAYXe+wg7VR70oe9I02rM5x2Ee3gz8M=;
        fh=k9eAKcDs0gPeZdUe7YsBsV2XjZ4T5R/MlpvDmtZ8Z+w=;
        b=HwYDJH5Ogb3JTg/AfTp7vg/PAHVM+beFphejMLTBotN3lVltvmsa7AaBc10BKKOrCn
         6TcyRPber9EmE5X4ZOZLa1LJ2ikT/DvrU2yFbUDZx1RDhVcOvjkKXN3NkAqoqncx4kfk
         xaPfWcb5tXLfuviuER1mx329pCVtAlT+dpKS9AYZeRZnfnpp3xDGeWn6faM84FmVtny7
         0iCRHscODRdKFRswSE+fwcJjDimdbcxTthjcyaNOl1GgzGl/oAB2LSnWeFfV2PBrxKqY
         Vkr1FD4xTNduUZrHxMGJx0UmxLlD44Q3XHKs13xSn09RlcTKqrxpfk4OD0vY0QP0VBLh
         tklg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CoIIsnmS;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-471f22dbc09si38546561cf.261.2025.02.18.07.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 07:22:19 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CoIIsnmS;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739892138;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ot+fYgSVKyy+rAYXe+wg7VR70oe9I02rM5x2Ee3gz8M=;
	b=CoIIsnmSWTKSn1St5s9WQrCd/HPrPoDLFuPxy7aXmT2wypcpIgmIGcsZJNqpYqkTWIR8JV
	mTWhZTZTeEwEcYG2q07Ao6/vHPMWpAceAieMPIhACMF993YoSgGVHr4r565vkd7v++jRLw
	3cYtnJEiFNoQDwu/2XUXjB8amEKw1Yw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-Q3IUb2BNOU6FgWfvM36ccg-1; Tue, 18 Feb 2025 10:22:17 -0500
X-MC-Unique: Q3IUb2BNOU6FgWfvM36ccg-1
X-Mimecast-MFC-AGG-ID: Q3IUb2BNOU6FgWfvM36ccg_1739892137
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f455a8fcaso2305161f8f.2
        for <alex.bennee@linaro.org>; Tue, 18 Feb 2025 07:22:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892136; x=1740496936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ot+fYgSVKyy+rAYXe+wg7VR70oe9I02rM5x2Ee3gz8M=;
        b=q6Zqarx+kDXfNGQEhx1vH7mhAEDRtCLc9sWevXugOmXwPqSXb2VbvCLO5UQ4CKV5lw
         Bf39taFZx1jofCkeCmTvRLAIrF8rH+zSgDgfDiiGQBztsb1oDwyJo5YvCojuCZLOksIM
         NhZvfbYcWVzZVjVFOZPcIZymgAyHO8NAWIrtpF52QcMC3L1RrXRwrUwFtldMl1yHAgww
         NIwRhv4//dIkSOJkX6c8bQYUZ1dsNh9OWVztYUA5LXRfcsh7eHizdQYKlm5hxvEYo3Tu
         3j/HBbtyOcDvssK+ZF4+/3h7KWt/J2Bqtlwmk3Xp0iwQXI4V9VoLHZ6yinpNgUpCTZsT
         EUFA==
X-Forwarded-Encrypted: i=1; AJvYcCV552oYUhPqGlP9z036hiP4e7/96p+0EHE7fuABmSrsNAph35SX6OSirjFTNgXiaw9A+kjFzc98YIgR2A==@linaro.org
X-Gm-Message-State: AOJu0Yy+DoEDkEv0ZduW0b/D/Aq4eqSOW2gY4R9lwJMGNH5KFXfiv+l9
	83AuCO8pIelMw1cQwa2/Mrz7zKCE1t0z6yZxLTDNjJPXOI1OZm9moQ4OBtnSLXWEfHRCTCXKo/T
	4iuUoyGEjoAMNG6ZbKlwu8gP3HKZAZ7Xk5iWHwG0DY5RlUtyUgrocLQ==
X-Gm-Gg: ASbGnctsT5F4V/Cj/XBo9uoCKV8srKyO/nBb1QyhAJ9iRnNTXpxLi6J08eRsDbauMFr
	KxWlkbOtWcL9aOWdJ4MwbktgD6I74vE876tmg647k46jaFewJAVyMt+1UFDFqM36mE7A2CvqIRm
	xroY/9oSUJJWT870G+N+jTT9/JXOMLpd9ukrq2n/OSjo4Z5kYyI46CL+mk22cryBOAJApwu0Tv2
	PMh+DUXnyJwdhwpApiz8THWEwhh4r44X9njD767M2/xVPFOwJeONAWkBsc1Ueg74bXKQkJnjxIO
	Rqno5w2G70586fEv3J7skfnJiJoU322rg7eAetcHR/Lilxb838cp
X-Received: by 2002:a05:6000:2a7:b0:38d:e190:b713 with SMTP id ffacd0b85a97d-38f33f4acbdmr9880405f8f.37.1739892136444;
        Tue, 18 Feb 2025 07:22:16 -0800 (PST)
X-Received: by 2002:a05:6000:2a7:b0:38d:e190:b713 with SMTP id ffacd0b85a97d-38f33f4acbdmr9880373f8f.37.1739892136005;
        Tue, 18 Feb 2025 07:22:16 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fb6sm15062981f8f.44.2025.02.18.07.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 07:22:15 -0800 (PST)
Message-ID: <6030fd76-e7f1-47ca-9eb7-8cafe48bd639@redhat.com>
Date: Tue, 18 Feb 2025 16:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 01/15] arm/cpu: Add sysreg definitions in cpu-sysregs.h
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250207110248.1580465-1-cohuck@redhat.com>
 <20250207110248.1580465-2-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250207110248.1580465-2-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iqFskHh87Xz-22QVkYoTInR6sWQ9QsSfRJz-sJhOCLI_1739892137
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CS2Y60kvm38c

Hi Connie,


On 2/7/25 12:02 PM, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> This new header contains macros that define aarch64 registers.
> In a subsequent patch, this will be replaced by a more exhaustive
> version that will be generated from linux arch/arm64/tools/sysreg
> file. Those macros are sufficient to migrate the storage of those
> ID regs from named fields in isar struct to an array cell.
>
> [CH: reworked to use different structures]
> [CH: moved accessors from the patches first using them to here,
>      dropped interaction with writable registers, which will happen
>      later]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu-sysregs.h | 131 +++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.h         |  42 +++++++++++++
>  2 files changed, 173 insertions(+)
>  create mode 100644 target/arm/cpu-sysregs.h
>
> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
> new file mode 100644
> index 000000000000..de09ebae91a5
> --- /dev/null
> +++ b/target/arm/cpu-sysregs.h
> @@ -0,0 +1,131 @@
> +#ifndef ARM_CPU_SYSREGS_H
> +#define ARM_CPU_SYSREGS_H
> +
> +/*
> + * Following is similar to the coprocessor regs encodings, but with an argument
> + * ordering that matches the ARM ARM. We also reuse the various CP_REG_ defines
> + * that actually are the same as the equivalent KVM_REG_ values.
> + */
> +#define ENCODE_ID_REG(op0, op1, crn, crm, op2)          \
> +    (((op0) << CP_REG_ARM64_SYSREG_OP0_SHIFT) |         \
> +     ((op1) << CP_REG_ARM64_SYSREG_OP1_SHIFT) |         \
> +     ((crn) << CP_REG_ARM64_SYSREG_CRN_SHIFT) |         \
> +     ((crm) << CP_REG_ARM64_SYSREG_CRM_SHIFT) |         \
> +     ((op2) << CP_REG_ARM64_SYSREG_OP2_SHIFT))
> +
> +typedef enum ARMIDRegisterIdx {
> +    ID_AA64PFR0_EL1_IDX,
> +    ID_AA64PFR1_EL1_IDX,
> +    ID_AA64SMFR0_EL1_IDX,
> +    ID_AA64DFR0_EL1_IDX,
> +    ID_AA64DFR1_EL1_IDX,
> +    ID_AA64ISAR0_EL1_IDX,
> +    ID_AA64ISAR1_EL1_IDX,
> +    ID_AA64ISAR2_EL1_IDX,
> +    ID_AA64MMFR0_EL1_IDX,
> +    ID_AA64MMFR1_EL1_IDX,
> +    ID_AA64MMFR2_EL1_IDX,
> +    ID_AA64MMFR3_EL1_IDX,
> +    ID_PFR0_EL1_IDX,
> +    ID_PFR1_EL1_IDX,
> +    ID_DFR0_EL1_IDX,
> +    ID_MMFR0_EL1_IDX,
> +    ID_MMFR1_EL1_IDX,
> +    ID_MMFR2_EL1_IDX,
> +    ID_MMFR3_EL1_IDX,
> +    ID_ISAR0_EL1_IDX,
> +    ID_ISAR1_EL1_IDX,
> +    ID_ISAR2_EL1_IDX,
> +    ID_ISAR3_EL1_IDX,
> +    ID_ISAR4_EL1_IDX,
> +    ID_ISAR5_EL1_IDX,
> +    ID_MMFR4_EL1_IDX,
> +    ID_ISAR6_EL1_IDX,
> +    MVFR0_EL1_IDX,
> +    MVFR1_EL1_IDX,
> +    MVFR2_EL1_IDX,
> +    ID_PFR2_EL1_IDX,
> +    ID_DFR1_EL1_IDX,
> +    ID_MMFR5_EL1_IDX,
> +    ID_AA64ZFR0_EL1_IDX,
> +    CTR_EL0_IDX,
> +    NUM_ID_IDX,
> +} ARMIDRegisterIdx;
> +
> +typedef enum ARMSysRegs {
> +    SYS_ID_AA64PFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 0),
> +    SYS_ID_AA64PFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 1),
> +    SYS_ID_AA64SMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 5),
> +    SYS_ID_AA64DFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 0),
> +    SYS_ID_AA64DFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 1),
> +    SYS_ID_AA64ISAR0_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 0),
> +    SYS_ID_AA64ISAR1_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 1),
> +    SYS_ID_AA64ISAR2_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 2),
> +    SYS_ID_AA64MMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 0),
> +    SYS_ID_AA64MMFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 1),
> +    SYS_ID_AA64MMFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 2),
> +    SYS_ID_AA64MMFR3_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 3),
> +    SYS_ID_PFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 0),
> +    SYS_ID_PFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 1),
> +    SYS_ID_DFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 2),
> +    SYS_ID_MMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 4),
> +    SYS_ID_MMFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 5),
> +    SYS_ID_MMFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 6),
> +    SYS_ID_MMFR3_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 7),
> +    SYS_ID_ISAR0_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 0),
> +    SYS_ID_ISAR1_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 1),
> +    SYS_ID_ISAR2_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 2),
> +    SYS_ID_ISAR3_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 3),
> +    SYS_ID_ISAR4_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 4),
> +    SYS_ID_ISAR5_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 5),
> +    SYS_ID_MMFR4_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 6),
> +    SYS_ID_ISAR6_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 7),
> +    SYS_MVFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 0),
> +    SYS_MVFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 1),
> +    SYS_MVFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 2),
> +    SYS_ID_PFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 4),
> +    SYS_ID_DFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 5),
> +    SYS_ID_MMFR5_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 6),
> +    SYS_ID_AA64ZFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 4),
> +    SYS_CTR_EL0 = ENCODE_ID_REG(3, 3, 0, 0, 1),
> +} ARMSysRegs;
> +
> +static const uint32_t id_register_sysreg[NUM_ID_IDX] = {
> +    [ID_AA64PFR0_EL1_IDX] = SYS_ID_AA64PFR0_EL1,
> +    [ID_AA64PFR1_EL1_IDX] = SYS_ID_AA64PFR1_EL1,
> +    [ID_AA64SMFR0_EL1_IDX] = SYS_ID_AA64SMFR0_EL1,
> +    [ID_AA64DFR0_EL1_IDX] = SYS_ID_AA64DFR0_EL1,
> +    [ID_AA64DFR1_EL1_IDX] = SYS_ID_AA64DFR1_EL1,
> +    [ID_AA64ISAR0_EL1_IDX] = SYS_ID_AA64ISAR0_EL1,
> +    [ID_AA64ISAR1_EL1_IDX] = SYS_ID_AA64ISAR1_EL1,
> +    [ID_AA64ISAR2_EL1_IDX] = SYS_ID_AA64ISAR2_EL1,
> +    [ID_AA64MMFR0_EL1_IDX] = SYS_ID_AA64MMFR0_EL1,
> +    [ID_AA64MMFR1_EL1_IDX] = SYS_ID_AA64MMFR1_EL1,
> +    [ID_AA64MMFR2_EL1_IDX] = SYS_ID_AA64MMFR2_EL1,
> +    [ID_AA64MMFR3_EL1_IDX] = SYS_ID_AA64MMFR3_EL1,
> +    [ID_PFR0_EL1_IDX] = SYS_ID_PFR0_EL1,
> +    [ID_PFR1_EL1_IDX] = SYS_ID_PFR1_EL1,
> +    [ID_DFR0_EL1_IDX] = SYS_ID_DFR0_EL1,
> +    [ID_MMFR0_EL1_IDX] = SYS_ID_MMFR0_EL1,
> +    [ID_MMFR1_EL1_IDX] = SYS_ID_MMFR1_EL1,
> +    [ID_MMFR2_EL1_IDX] = SYS_ID_MMFR2_EL1,
> +    [ID_MMFR3_EL1_IDX] = SYS_ID_MMFR3_EL1,
> +    [ID_ISAR0_EL1_IDX] = SYS_ID_ISAR0_EL1,
> +    [ID_ISAR1_EL1_IDX] = SYS_ID_ISAR1_EL1,
> +    [ID_ISAR2_EL1_IDX] = SYS_ID_ISAR2_EL1,
> +    [ID_ISAR3_EL1_IDX] = SYS_ID_ISAR3_EL1,
> +    [ID_ISAR4_EL1_IDX] = SYS_ID_ISAR4_EL1,
> +    [ID_ISAR5_EL1_IDX] = SYS_ID_ISAR5_EL1,
> +    [ID_MMFR4_EL1_IDX] = SYS_ID_MMFR4_EL1,
> +    [ID_ISAR6_EL1_IDX] = SYS_ID_ISAR6_EL1,
> +    [MVFR0_EL1_IDX] = SYS_MVFR0_EL1,
> +    [MVFR1_EL1_IDX] = SYS_MVFR1_EL1,
> +    [MVFR2_EL1_IDX] = SYS_MVFR2_EL1,
> +    [ID_PFR2_EL1_IDX] = SYS_ID_PFR2_EL1,
> +    [ID_DFR1_EL1_IDX] = SYS_ID_DFR1_EL1,
> +    [ID_MMFR5_EL1_IDX] = SYS_ID_MMFR5_EL1,
> +    [ID_AA64ZFR0_EL1_IDX] = SYS_ID_AA64ZFR0_EL1,
> +    [CTR_EL0_IDX] = SYS_CTR_EL0,
> +};
> +
> +#endif /* ARM_CPU_SYSREGS_H */
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 2213c277348d..4bbce34e268d 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -30,6 +30,7 @@
>  #include "qapi/qapi-types-common.h"
>  #include "target/arm/multiprocessing.h"
>  #include "target/arm/gtimer.h"
> +#include "target/arm/cpu-sysregs.h"
>  
>  #ifdef TARGET_AARCH64
>  #define KVM_HAVE_MCE_INJECTION 1
> @@ -832,6 +833,46 @@ typedef struct {
>      uint32_t map, init, supported;
>  } ARMVQMap;
>  
> +static inline uint64_t _get_idreg(uint64_t *idregs, uint32_t index)
> +{
> +    return idregs[index];
> +}
> +
> +static inline void _set_idreg(uint64_t *idregs, uint32_t index, uint64_t value)
> +{
> +    idregs[index] = value;
> +}
> +
> +/* REG is ID_XXX */
nit: we have MVFRx too so maybe we shall rather say that REG is the

ARMIDRegisterIdx litteral without  _EL1_IDX suffix or just remove the comment

 
> +#define FIELD_DP64_IDREG(ARRAY, REG, FIELD, VALUE)              \
> +{                                                             \
> +    uint64_t regval = _get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX);   \
> +        regval = FIELD_DP64(regval, REG, FIELD, VALUE);                 \
> +    _set_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX, regval);             \
> +}
> +
> +#define FIELD_DP32_IDREG(ARRAY, REG, FIELD, VALUE)              \
> +{                                                             \
> +uint64_t regval = _get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX);       \
> +regval = FIELD_DP32(regval, REG, FIELD, VALUE);               \
> +_set_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX, regval);                 \
> +}
> +
> +#define FIELD_EX64_IDREG(ARRAY, REG, FIELD)                     \
> +FIELD_EX64(_get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX), REG, FIELD)  \
> +
> +#define FIELD_EX32_IDREG(ARRAY, REG, FIELD)                     \
> +FIELD_EX32(_get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX), REG, FIELD)  \
> +
> +#define FIELD_SEX64_IDREG(ARRAY, REG, FIELD)                     \
> +FIELD_SEX64(_get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX), REG, FIELD)  \
> +
> +#define SET_IDREG(ARRAY, REG, VALUE)                            \
> +_set_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX, VALUE)
> +
> +#define GET_IDREG(ARRAY, REG)                                   \
> +_get_idreg((uint64_t *)ARRAY, REG ## _EL1_IDX)
> +
>  /**
>   * ARMCPU:
>   * @env: #CPUARMState
> @@ -1040,6 +1081,7 @@ struct ArchCPU {
>          uint64_t id_aa64zfr0;
>          uint64_t id_aa64smfr0;
>          uint64_t reset_pmcr_el0;
> +        uint64_t idregs[NUM_ID_IDX];
>      } isar;
>      uint64_t midr;
>      uint32_t revidr;

Thanks

Eric
