Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp6065162njd;
        Mon, 28 Apr 2025 08:56:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKgxj40InMJV+5TGjMLaWGJHU5p/YZLmFqpxMJU/b3xS461Bxd3Ei8T0Hkh5mg3lWjGfH2G6EIKJFOGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFkWRP+FUYeV5RoOrz3FEoJl94iiG44ubG5UCSZZEzUu1DpGX2Mn4kXl8QF9ujnFJq5MbVU
X-Received: by 2002:ac8:5a4b:0:b0:476:832b:7ee1 with SMTP id d75a77b69052e-48133176e9dmr135230721cf.40.1745855793697;
        Mon, 28 Apr 2025 08:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745855793; cv=none;
        d=google.com; s=arc-20240605;
        b=MuSB+yBQ99hFdb832GIJ3pqBnWVgQTxC+PrUmvVnjtPQSfuB0ObL+a/hwdUlPV0nuc
         Rl+Fzgzt3lJ8adjtli2Qyqr+3XGE9pa/jTJ3lZX2gkDCLndjN0zKvPTolkQFyATrgeIi
         NqeqihqBfYlUSj6a2v1AxrFMJmY5aluuwhFiBNza2zfXFBMwh4B/bkvyrS/DDERTJtnB
         H2txSuSb9eZuj445uwCGXGr36SShbIlSuowNGMe6YUlNR7kaXpS7rUpLa2h50nvpvmH0
         ukJ/GgYwzzvL/N9w75H9rxviTAnHOB99V9bRaKWbsbQr69Eozi4MxQxxFeO/XtQhaIGa
         pbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ktVKJmtkMVGmq1y2Ov1M19xkWiMbtAmAmsDoTOZZCy4=;
        fh=WGFzhi9p6bsLZmgrxsoeDsb2/+8u5F+p5+e6VQRU46E=;
        b=butM02OeEJATvJHVGc5vj+aMjdDVKaDiAc68FugfBZIi6HYjvi3kFArp796jgCAtCS
         qpsQrsLzYZGy9jlPJoWfYLGNKVoP9ImDzGVLebQ2G8/7eHWYcnOVeMRl9P3a/+cQ5hLt
         uoRhkmvsjO+yoBp3nyq+YwXiEvkJ4hqilkn0PkxIv04GjtBVvPH+BRfq/tIt9nWyPBi4
         1wnfwRbHjEA5WpciQjsrt2SsL1Os184ZkV35Z8DB5F6rVQspxIyhJuv+rDMcHHxWTZY0
         TEwu3yZGEGYB3ILdR2xwPS7rHzjcCvnB9fH7+05NRfmNiRmuzv64hEq0JUiedDC2bgDZ
         uyWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dBIolTsG;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea2cb4605si104372131cf.651.2025.04.28.08.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:56:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dBIolTsG;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745855793;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktVKJmtkMVGmq1y2Ov1M19xkWiMbtAmAmsDoTOZZCy4=;
	b=dBIolTsGnmoJAE7g0thP6bcUlWIV/ZzLOtUUGlP6ffcZlBQDLbflaqhfm8ZX+pJRlwyr04
	Ptz6GjdTT/QC9yFPEpcXuodbfP6yfMHneU6Rrhp6kZgW8axfG/ln9OcAorALB+NH93poN0
	dCRwImGjDA6Z33+4hQE84wVQoXMqHwY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-mCJOTJznN1qsZHQ4DRDfPg-1; Mon, 28 Apr 2025 11:56:31 -0400
X-MC-Unique: mCJOTJznN1qsZHQ4DRDfPg-1
X-Mimecast-MFC-AGG-ID: mCJOTJznN1qsZHQ4DRDfPg_1745855791
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso28177855e9.0
        for <alex.bennee@linaro.org>; Mon, 28 Apr 2025 08:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855790; x=1746460590;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktVKJmtkMVGmq1y2Ov1M19xkWiMbtAmAmsDoTOZZCy4=;
        b=XJ+FKck3N6tys4+hR6GynPvowlCWqxO0pSQqAaGLfwLSf59Th1zP+vmj3gV+jbjYrm
         j+EIr757JpSDhVMkJQCUfLQ0+WT7zJEWZX8JcrD5lZpx+S1Nzjvu+aQ6VagD21J+SxqU
         +uYlRLglQn2YatCmQezU1+1uzZVoBMiZF09qCxa++UoxVUg6DC8a38zirywMRoZ8ohSY
         U+L4kb0Sia9LhCo1XAVz0b/ClIcFKy+lug8JdjCWX3vfbSzr0cuAk0mqczXGsf1RJhh5
         vPq67a7UKpVUB62GES7KV5uIdb+5gZpY3EwkMN6xhRCAQ628X7fW7IEgqctonU41KmbN
         Mjew==
X-Forwarded-Encrypted: i=1; AJvYcCXG4wXBGV2JLrItZzXTb6C6MQWlWZxpTrQgU32BMUeFq78OPkCoqYah+bQxTtggK8YbllE07qfzNaOnjw==@linaro.org
X-Gm-Message-State: AOJu0YwGFCJye2+iFyZSr15lUd2bkRxeglo5RWsbj3NBlWfUiwP59oiz
	YsAOM4Jhis2C5uhXMkJVRhP55jwcq0+cRsh0uPIiS02PG51oIhzTcWxxRUKV2rYbwabdy/HtPD4
	5qULT/cQhr15m9twx94zILGGoMze3m2YX1V2cs/wP+YEx/8H7A6qoxA==
X-Gm-Gg: ASbGncuOYAlI0us/XqMBImD4OMPlqzYrAW2Wqb/A+mLcQ6VSICl3FhWxRjIXDXbgmER
	Xp3pCYcUUmox3TWZamEK2Rw/ilda9t3elE55at1rBG+rilr3OPuhyrX1hUwyRfyrV4RvplU9DLi
	mRurry4B0cnkaQ/HR//b00en+ijMTE650+YjHKgfLfk4xhYYOKiVXjN4r4TT8/yM/zK53lNm8mj
	E+BgiXOh+aHFbsjdIVeq0ym3r/UTTqS9nHtgDbPrCLXR7UfI553PXopqZ4n1Avi9HZ5kKIpOrlv
	Ia6JExoujkNa5a8/gd6lM8BYoboOYjnY+6CmOpAs5wjw3Gz7QmcwzwqdFZ8=
X-Received: by 2002:a05:600c:1ca0:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-440a66ac67bmr89982695e9.23.1745855790518;
        Mon, 28 Apr 2025 08:56:30 -0700 (PDT)
X-Received: by 2002:a05:600c:1ca0:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-440a66ac67bmr89982455e9.23.1745855790107;
        Mon, 28 Apr 2025 08:56:30 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2386sm164158895e9.14.2025.04.28.08.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 08:56:29 -0700 (PDT)
Message-ID: <c150cb74-d11a-4090-90fa-0405a488c471@redhat.com>
Date: Mon, 28 Apr 2025 17:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH for-10.1 v5 06/13] arm/cpu: Store aa64dfr0/1 into the
 idregs array
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250409144304.912325-1-cohuck@redhat.com>
 <20250409144304.912325-7-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250409144304.912325-7-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lOAl8HubZk8xlbf6nK6dN1eVqAdU6cpb5osWlWlTvRs_1745855791
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: Pq0ckUhELJT0



On 4/9/25 4:42 PM, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu-features.h | 16 ++++++++--------
>  target/arm/cpu.c          | 15 +++++----------
>  target/arm/cpu.h          |  2 --
>  target/arm/cpu64.c        |  4 ++--
>  target/arm/helper.c       |  4 ++--
>  target/arm/hvf/hvf.c      |  4 ++--
>  target/arm/internals.h    |  6 +++---
>  target/arm/kvm.c          | 12 +++++-------
>  target/arm/tcg/cpu64.c    | 33 +++++++++++++++++----------------
>  9 files changed, 44 insertions(+), 52 deletions(-)
>
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 36c35f6a434a..7f6331ca437d 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -900,30 +900,30 @@ static inline bool isar_feature_aa64_nv2(const ARMISARegisters *id)
>  
>  static inline bool isar_feature_aa64_pmuv3p1(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
> -        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
> +    return FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) >= 4 &&
> +        FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) != 0xf;
>  }
>  
>  static inline bool isar_feature_aa64_pmuv3p4(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 5 &&
> -        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
> +    return FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) >= 5 &&
> +        FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) != 0xf;
>  }
>  
>  static inline bool isar_feature_aa64_pmuv3p5(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 6 &&
> -        FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
> +    return FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) >= 6 &&
> +        FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) != 0xf;
>  }
>  
>  static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
> +    return FIELD_EX64_IDREG(id, ID_AA64DFR0, DEBUGVER) >= 8;
>  }
>  
>  static inline bool isar_feature_aa64_doublelock(const ARMISARegisters *id)
>  {
> -    return FIELD_SEX64(id->id_aa64dfr0, ID_AA64DFR0, DOUBLELOCK) >= 0;
> +    return FIELD_SEX64_IDREG(id, ID_AA64DFR0, DOUBLELOCK) >= 0;
>  }
>  
>  static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 23be9ab97334..7bd20d1f2710 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2353,8 +2353,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>                  cpu);
>  #endif
>      } else {
> -        cpu->isar.id_aa64dfr0 =
> -            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
> +        FIELD_DP64_IDREG(isar, ID_AA64DFR0, PMUVER, 0);
>          cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, PERFMON, 0);
>          cpu->pmceid0 = 0;
>          cpu->pmceid1 = 0;
> @@ -2414,19 +2413,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>           * try to access the non-existent system registers for them.
>           */
>          /* FEAT_SPE (Statistical Profiling Extension) */
> -        cpu->isar.id_aa64dfr0 =
> -            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMSVER, 0);
> +        FIELD_DP64_IDREG(isar, ID_AA64DFR0, PMSVER, 0);
>          /* FEAT_TRBE (Trace Buffer Extension) */
> -        cpu->isar.id_aa64dfr0 =
> -            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEBUFFER, 0);
> +        FIELD_DP64_IDREG(isar, ID_AA64DFR0, TRACEBUFFER, 0);
>          /* FEAT_TRF (Self-hosted Trace Extension) */
> -        cpu->isar.id_aa64dfr0 =
> -            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEFILT, 0);
> +        FIELD_DP64_IDREG(isar, ID_AA64DFR0, TRACEFILT, 0);
>          cpu->isar.id_dfr0 =
>              FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, TRACEFILT, 0);
>          /* Trace Macrocell system register access */
> -        cpu->isar.id_aa64dfr0 =
> -            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, TRACEVER, 0);
> +        FIELD_DP64_IDREG(isar, ID_AA64DFR0, TRACEVER, 0);
>          cpu->isar.id_dfr0 =
>              FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPTRC, 0);
>          /* Memory mapped trace */
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 30f27fb64aed..37bb337b3c71 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1097,8 +1097,6 @@ struct ArchCPU {
>          uint32_t dbgdidr;
>          uint32_t dbgdevid;
>          uint32_t dbgdevid1;
> -        uint64_t id_aa64dfr0;
> -        uint64_t id_aa64dfr1;
>          uint64_t id_aa64smfr0;
>          uint64_t reset_pmcr_el0;
>          uint64_t idregs[NUM_ID_IDX];
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 6d51a53b0abb..4ba53f75ed96 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -671,7 +671,7 @@ static void aarch64_a57_initfn(Object *obj)
>      cpu->isar.id_isar5 = 0x00011121;
>      cpu->isar.id_isar6 = 0;
>      SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
> -    cpu->isar.id_aa64dfr0 = 0x10305106;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
>      SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x00001124);
>      cpu->isar.dbgdidr = 0x3516d000;
> @@ -733,7 +733,7 @@ static void aarch64_a53_initfn(Object *obj)
>      cpu->isar.id_isar5 = 0x00011121;
>      cpu->isar.id_isar6 = 0;
>      SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
> -    cpu->isar.id_aa64dfr0 = 0x10305106;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
>      SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x00001122); /* 40 bit physical addr */
>      cpu->isar.dbgdidr = 0x3516d000;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 15ca88b165e1..8efe508306e5 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7961,12 +7961,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
> -              .resetvalue = cpu->isar.id_aa64dfr0 },
> +              .resetvalue = GET_IDREG(isar, ID_AA64DFR0) },
>              { .name = "ID_AA64DFR1_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
> -              .resetvalue = cpu->isar.id_aa64dfr1 },
> +              .resetvalue = GET_IDREG(isar, ID_AA64DFR1) },
>              { .name = "ID_AA64DFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 2,
>                .access = PL1_R, .type = ARM_CP_CONST,
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 833681e9a28e..b0c45d4ca294 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -867,8 +867,8 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      } regs[] = {
>          { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.idregs[ID_AA64PFR0_EL1_IDX] },
>          { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.idregs[ID_AA64PFR1_EL1_IDX] },
> -        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
> -        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
> +        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.idregs[ID_AA64DFR0_EL1_IDX] },
> +        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.idregs[ID_AA64DFR1_EL1_IDX] },
>          { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.idregs[ID_AA64ISAR0_EL1_IDX] },
>          { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.idregs[ID_AA64ISAR1_EL1_IDX] },
>          /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 28585c07555b..cafc8e66324f 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1170,7 +1170,7 @@ static inline bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
>  static inline int arm_num_brps(ARMCPU *cpu)
>  {
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        return FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, BRPS) + 1;
> +        return FIELD_EX64_IDREG(&cpu->isar, ID_AA64DFR0, BRPS) + 1;
>      } else {
>          return FIELD_EX32(cpu->isar.dbgdidr, DBGDIDR, BRPS) + 1;
>      }
> @@ -1184,7 +1184,7 @@ static inline int arm_num_brps(ARMCPU *cpu)
>  static inline int arm_num_wrps(ARMCPU *cpu)
>  {
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        return FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, WRPS) + 1;
> +        return FIELD_EX64_IDREG(&cpu->isar, ID_AA64DFR0, WRPS) + 1;
>      } else {
>          return FIELD_EX32(cpu->isar.dbgdidr, DBGDIDR, WRPS) + 1;
>      }
> @@ -1198,7 +1198,7 @@ static inline int arm_num_wrps(ARMCPU *cpu)
>  static inline int arm_num_ctx_cmps(ARMCPU *cpu)
>  {
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        return FIELD_EX64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS) + 1;
> +        return FIELD_EX64_IDREG(&cpu->isar, ID_AA64DFR0, CTX_CMPS) + 1;
>      } else {
>          return FIELD_EX32(cpu->isar.dbgdidr, DBGDIDR, CTX_CMPS) + 1;
>      }
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 5f3c42b94690..e999d98dcf7f 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -355,10 +355,8 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          err |= get_host_cpu_reg(fd, ahcf, ID_AA64PFR1_EL1_IDX);
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
>                                ARM64_SYS_REG(3, 0, 0, 4, 5));
> -        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,
> -                              ARM64_SYS_REG(3, 0, 0, 5, 0));
> -        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
> -                              ARM64_SYS_REG(3, 0, 0, 5, 1));
> +        err |= get_host_cpu_reg(fd, ahcf, ID_AA64DFR0_EL1_IDX);
> +        err |= get_host_cpu_reg(fd, ahcf, ID_AA64DFR1_EL1_IDX);
>          err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR0_EL1_IDX);
>          err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR1_EL1_IDX);
>          err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR2_EL1_IDX);
> @@ -427,10 +425,10 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>           * We only do this if the CPU supports AArch32 at EL1.
>           */
>          if (FIELD_EX32_IDREG(&ahcf->isar, ID_AA64PFR0, EL1) >= 2) {
> -            int wrps = FIELD_EX64(&ahcf->isar.id_aa64dfr0, ID_AA64DFR0, WRPS);
> -            int brps = FIELD_EX64(&ahcf->isar.id_aa64dfr0, ID_AA64DFR0, BRPS);
> +            int wrps = FIELD_EX64_IDREG(&ahcf->isar, ID_AA64DFR0, WRPS);
> +            int brps = FIELD_EX64_IDREG(&ahcf->isar, ID_AA64DFR0, BRPS);
>              int ctx_cmps =
> -                FIELD_EX64(&ahcf->isar.id_aa64dfr0, ID_AA64DFR0, CTX_CMPS);
> +                FIELD_EX64_IDREG(&ahcf->isar, ID_AA64DFR0, CTX_CMPS);
>              int version = 6; /* ARMv8 debug architecture */
>              bool has_el3 =
>                  !!FIELD_EX32_IDREG(&ahcf->isar, ID_AA64PFR0, EL3);
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 439c29e69546..41077b3dcd08 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -65,8 +65,8 @@ static void aarch64_a35_initfn(Object *obj)
>      cpu->isar.id_isar5 = 0x00011121;
>      SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
>      SET_IDREG(isar, ID_AA64PFR1, 0);
> -    cpu->isar.id_aa64dfr0 = 0x10305106;
> -    cpu->isar.id_aa64dfr1 = 0;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
> +    SET_IDREG(isar, ID_AA64DFR1, 0);
>      SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
>      SET_IDREG(isar, ID_AA64ISAR1, 0);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x00101122);
> @@ -219,7 +219,7 @@ static void aarch64_a55_initfn(Object *obj)
>      cpu->clidr = 0x82000023;
>      cpu->ctr = 0x84448004; /* L1Ip = VIPT */
>      cpu->dcz_blocksize = 4; /* 64 bytes */
> -    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408ull);
>      SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
>      SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101122ull);
> @@ -310,7 +310,7 @@ static void aarch64_a72_initfn(Object *obj)
>      cpu->isar.id_isar4 = 0x00011142;
>      cpu->isar.id_isar5 = 0x00011121;
>      SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
> -    cpu->isar.id_aa64dfr0 = 0x10305106;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
>      SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x00001124);
>      cpu->isar.dbgdidr = 0x3516d000;
> @@ -352,7 +352,7 @@ static void aarch64_a76_initfn(Object *obj)
>      cpu->clidr = 0x82000023;
>      cpu->ctr = 0x8444C004;
>      cpu->dcz_blocksize = 4;
> -    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408ull),
>      SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
>      SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101122ull);
> @@ -426,8 +426,8 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->reset_sctlr = 0x30000180;
>      SET_IDREG(isar, ID_AA64PFR0, 0x0000000101111111); /* No RAS Extensions */
>      SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000000);
> -    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
> -    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x0000000010305408),
> +    SET_IDREG(isar, ID_AA64DFR1, 0x0000000000000000),
>      cpu->id_aa64afr0 = 0x0000000000000000;
>      cpu->id_aa64afr1 = 0x0000000000000000;
>      SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000001122);
> @@ -600,7 +600,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
>      cpu->clidr = 0x82000023;
>      cpu->ctr = 0x8444c004;
>      cpu->dcz_blocksize = 4;
> -    cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x0000000110305408ull);
>      SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
>      SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101125ull);
> @@ -678,8 +678,8 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
>      cpu->dcz_blocksize = 4;
>      cpu->id_aa64afr0 = 0x00000000;
>      cpu->id_aa64afr1 = 0x00000000;
> -    cpu->isar.id_aa64dfr0  = 0x000001f210305519ull;
> -    cpu->isar.id_aa64dfr1 = 0x00000000;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x000001f210305519ull),
> +    SET_IDREG(isar, ID_AA64DFR1, 0x00000000),
>      SET_IDREG(isar, ID_AA64ISAR0, 0x1011111110212120ull); /* with FEAT_RNG */
>      SET_IDREG(isar, ID_AA64ISAR1, 0x0011000001211032ull);
>      SET_IDREG(isar, ID_AA64MMFR0, 0x0000000000101125ull);
> @@ -925,8 +925,9 @@ static void aarch64_a710_initfn(Object *obj)
>      SET_IDREG(isar, ID_AA64PFR0, 0x1201111120111112ull); /* GIC filled in later */
>      SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000221ull);
>      SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
> -    cpu->isar.id_aa64dfr0  = 0x000011f010305619ull;
> -    cpu->isar.id_aa64dfr1  = 0;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x000011f010305619ull);
> +    SET_IDREG(isar, ID_AA64DFR0, 0x000011f010305619ull);
this line is doubled.

Eric
> +    SET_IDREG(isar, ID_AA64DFR1, 0);
>      cpu->id_aa64afr0       = 0;
>      cpu->id_aa64afr1       = 0;
>      SET_IDREG(isar, ID_AA64ISAR0, 0x0221111110212120ull); /* with Crypto */
> @@ -1027,8 +1028,8 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
>      SET_IDREG(isar, ID_AA64PFR0, 0x1201111120111112ull); /* GIC filled in later */
>      SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000221ull);
>      SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
> -    cpu->isar.id_aa64dfr0  = 0x000011f210305619ull;
> -    cpu->isar.id_aa64dfr1  = 0;
> +    SET_IDREG(isar, ID_AA64DFR0, 0x000011f210305619ull);
> +    SET_IDREG(isar, ID_AA64DFR1, 0);
>      cpu->id_aa64afr0       = 0;
>      cpu->id_aa64afr1       = 0;
>      SET_IDREG(isar, ID_AA64ISAR0, 0x1221111110212120ull); /* with Crypto and FEAT_RNG */
> @@ -1261,11 +1262,11 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
>      SET_IDREG(isar, ID_AA64ZFR0, t);
>  
> -    t = cpu->isar.id_aa64dfr0;
> +    t = GET_IDREG(isar, ID_AA64DFR0);
>      t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 10); /* FEAT_Debugv8p8 */
>      t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
>      t = FIELD_DP64(t, ID_AA64DFR0, HPMN0, 1);     /* FEAT_HPMN0 */
> -    cpu->isar.id_aa64dfr0 = t;
> +    SET_IDREG(isar, ID_AA64DFR0, t);
>  
>      t = cpu->isar.id_aa64smfr0;
>      t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
