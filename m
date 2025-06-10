Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp1965001njc;
        Tue, 10 Jun 2025 02:07:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgd1IzNjLZP7qMT3N+k6PTStuWZteyQTdcK6ZfysaeKN7PCMFwJXs60n7YMasVyAInLCIYRQ2Qj5GJ9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFlGAg3ReJa+tFcp2QK10Dxzy3S3Nqc0bek2SKJrb58OAe9297AXQhk6bo/GUCOXw96a/zF
X-Received: by 2002:a05:6214:29cb:b0:6ea:d6e1:f3f8 with SMTP id 6a1803df08f44-6fb08fbce91mr247644116d6.45.1749546423043;
        Tue, 10 Jun 2025 02:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749546423; cv=none;
        d=google.com; s=arc-20240605;
        b=dz+v1096NMSu4jaj8tTLJlCNi/mmyaXrtwEDvhBzd0Djts3GINGF7LiRZiloaA/HWH
         Ir1oPNchnxTKW3Ub070PNpFzQxKQFl9S2UMKQIJ6VUldLmVacS9H0SdzW+aXDAaln9B2
         8boF1CBxZcqUJi/qNu9U+W5OfmKYrA2R5hZ0mAeSlfzwatmLx4nDBOreFLHIDvOEYaoo
         xRVnn9IUSQ5bRw7Nb7R4axr2s4bflnFAUpbBJ3rNCwYuZlLotbpsstrRDpf+Z0vj1PBk
         PlTD6esx53jK6DjohaGcHqn73bJHB5uvPrKjqEXQ6229Fr3BJONaFrTZQ4fGgg1rw5S0
         2YDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JCNGUdt79UT3hUTrwvrn/b51y7GF2PbbICDInXcjiVY=;
        fh=Wa4mMvB3gDlYFpI3OmxgJepRuA6tDiyrs8piC9UOncc=;
        b=KUExi3LXY1UVj1aJlsXz2Py10HsIPMULArqk11FEuBbSVxbFrhan5GtWxCmDjTbE1L
         WDwSKFhSdBWGKX+ZmD/TENf23jnuTwI05S2OejF23t+FZK4JvHz3Qe/5aOKyTMcdoVvF
         LGA15XFzzRnRLU39G7eMOnv/4JzvM9lvtyntyb8SHJTZwfEjPivI6kq5qL5BVxpD4UJa
         M9U2ZM2hcop8tsJJMV1cMe28n/3LpgSDowPK5CUVyk2vTBoh2NSPFPufNTm7x1rolQYt
         z4FuN5Q8cbqdm+BOTQuTlYkBI0VkX1Wu5x4woxVY+9Zz8emnCAbpK7fIlVta9cJbOjFI
         jVEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aL2ErXQ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198ad36dsi97625321cf.461.2025.06.10.02.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 02:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aL2ErXQ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOuwO-0002MW-SS; Tue, 10 Jun 2025 05:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uOuwM-0002L2-1d
 for qemu-arm@nongnu.org; Tue, 10 Jun 2025 05:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uOuwG-00068c-0p
 for qemu-arm@nongnu.org; Tue, 10 Jun 2025 05:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749546392;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCNGUdt79UT3hUTrwvrn/b51y7GF2PbbICDInXcjiVY=;
 b=aL2ErXQ/KN+uPvnC0p341H/2SSW12wtJ20q13FzdGz4lLnhb1y4ccxjYV1becr7ffF/fgo
 EOzE80/nYEwaacQg3v8jHVyUGntKWMWNo5teqcGpu7pERgrQrZJ4pirw9b9aqI9ZOyvFvX
 1aZtOfPotUfMaEN0fDE6GYcZgMhHLrU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-RuuKvr-KOb2USFbl8DiVQQ-1; Tue, 10 Jun 2025 05:06:31 -0400
X-MC-Unique: RuuKvr-KOb2USFbl8DiVQQ-1
X-Mimecast-MFC-AGG-ID: RuuKvr-KOb2USFbl8DiVQQ_1749546390
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4fac7fa27so2302272f8f.0
 for <qemu-arm@nongnu.org>; Tue, 10 Jun 2025 02:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749546390; x=1750151190;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JCNGUdt79UT3hUTrwvrn/b51y7GF2PbbICDInXcjiVY=;
 b=lYkb/YS2seZGjZAjsbvljzhtYAaLsgOuSwLw7pAWJ2s1Ysihm1b6d91kucK6EDFk8x
 dIqz2QK4mkxYZBPImOSypsZ2G6gv1wLb5w1t7xZp2TcE17KmsXBHJfcLVWvIegfyEwda
 FufXXsLL6c1rO+Sbo3DBeVLkkXyW/U/doNYXl5AxQOyhLhJyp9OS+c5X+ikgl8xpO+Z9
 ezXR8I2sJo/vF3DQl4lVBWm0UIq/YiDbZyeVYuFPyeICvMxFP9pbRraJHe/wEcTaUieU
 Ya1oakSENj6e2jypAD8s3TfjFoBj0KMmpGpz1ZjwPluBRhkwEKrtpcxZOMWNAU3flZFw
 QySg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhTL2uSIV/75U4sy/PVz4XQMhi5hut1a05Odge5KVl2B6CSombPxad1aT9BN3F1USYfkR23j0CXw==@nongnu.org
X-Gm-Message-State: AOJu0Yz4GhS6JyIK2/Fk7ByyIkpTDpmwOWUiFFr55VhNGXlRhnyxrumo
 wNwOGGxa/1OfVlHpkngTRoHc/krhFGVi2gWs5qHj6Df48YvE1SL88pR7PWmcNKOiLiftJrODkEe
 ZN2M8OgnTc58rBNufJHuOm2jPqe91FxTKMoaKzO9vjhxDhZ7HPBtSODl+T74bQg==
X-Gm-Gg: ASbGncvgMvDR1TTH3uP7FSP7qRzYOu4gBnLFgu70ENILwsrOYlkYZ/mSOlGou0ybGBO
 C6GfFGPPIHZb6Ae8R2d1PQ/TgNYDjeoUXrKUCWmQmybipM/VlIjGrc7KAoAJWpHy3bXEF7SmMeB
 kXNocKloqUKJ3vPy2Lpy0xc8oHA/PWUJ5imVfxtyHe66vyzMWz/fXB6GNksbipMu6B1P9vZ3QgG
 fCJ1QWGTcJwyfK9km2nvuwqI0PD7qbhD+p7RbDsQtIoqiCQSo6mcy6gYmF5kvwDcDHy0PX+3C87
 GsjLNK9yJkkiMkETAqSp/NJD5U6HSmw5fCsnA6h1d9IokNy+KB6UuBLuOa61HA+xYAW5/Q==
X-Received: by 2002:a05:6000:3106:b0:3a4:e6d7:6160 with SMTP id
 ffacd0b85a97d-3a531684405mr11632876f8f.6.1749546389656; 
 Tue, 10 Jun 2025 02:06:29 -0700 (PDT)
X-Received: by 2002:a05:6000:3106:b0:3a4:e6d7:6160 with SMTP id
 ffacd0b85a97d-3a531684405mr11632844f8f.6.1749546389205; 
 Tue, 10 Jun 2025 02:06:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a532464f20sm11746155f8f.98.2025.06.10.02.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 02:06:28 -0700 (PDT)
Message-ID: <865a5ec1-f445-45a0-8464-52374355e0a1@redhat.com>
Date: Tue, 10 Jun 2025 11:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: Implement ID_AA64PFR2_EL1
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>
References: <20250609104146.1547437-1-peter.maydell@linaro.org>
 <20250609104146.1547437-3-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250609104146.1547437-3-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L2Jt26BD-AsQz-Zy10ofIhdzdz2iiflML2_B6uCJ8RQ_1749546390
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nuccGj9X6snq

Hi Peter,

On 6/9/25 12:41 PM, Peter Maydell wrote:
> Currently we define the ID_AA64PFR2_EL1 encoding as reserved (with
> the required RAZ behaviour for unassigned system registers in the ID
> register encoding space).  Newer architecture versions start to
> define fields in this ID register, so define the appropriate
> constants and implement it as an ID register backed by a field in
> cpu->isar.  Since none of our CPUs set that isar field to non-zero,
> there is no behavioural change here (other than the name exposed to
> the user via the gdbstub), but this paves the way for implementing
> the new features that use fields in this register.
>
> The fields here are the ones documented in rev L.a of the Arm ARM.

this conflicts with

[PATCH v7 00/14] arm: rework id register storage <https://lore.kernel.org/all/87ikl99oxg.fsf@redhat.com/#r>

on which Connie recently pinged and which sounded mostly ready, except of course if you have objections.

Thanks

Eric

>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu-features.h | 5 +++++
>  target/arm/cpu.h          | 1 +
>  target/arm/helper.c       | 6 ++++--
>  target/arm/hvf/hvf.c      | 2 ++
>  target/arm/kvm.c          | 2 ++
>  5 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index db80ea1cc67..a8a94ee9d96 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -275,6 +275,11 @@ FIELD(ID_AA64PFR1, MTEX, 52, 4)
>  FIELD(ID_AA64PFR1, DF2, 56, 4)
>  FIELD(ID_AA64PFR1, PFAR, 60, 4)
>  
> +FIELD(ID_AA64PFR2, MTEPERM, 0, 4)
> +FIELD(ID_AA64PFR2, MTESTOREONLY, 4, 4)
> +FIELD(ID_AA64PFR2, MTEFAR, 8, 4)
> +FIELD(ID_AA64PFR2, FPMR, 32, 4)
> +
>  FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
>  FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
>  FIELD(ID_AA64MMFR0, BIGEND, 8, 4)
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9364d221744..93e055e34fd 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1031,6 +1031,7 @@ struct ArchCPU {
>          uint64_t id_aa64isar2;
>          uint64_t id_aa64pfr0;
>          uint64_t id_aa64pfr1;
> +        uint64_t id_aa64pfr2;
>          uint64_t id_aa64mmfr0;
>          uint64_t id_aa64mmfr1;
>          uint64_t id_aa64mmfr2;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 76312102879..31b667b7e05 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7927,11 +7927,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
>                .resetvalue = cpu->isar.id_aa64pfr1},
> -            { .name = "ID_AA64PFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +            { .name = "ID_AA64PFR2_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 2,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
> -              .resetvalue = 0 },
> +              .resetvalue = cpu->isar.id_aa64pfr2 },
>              { .name = "ID_AA64PFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 3,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -8179,6 +8179,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                                 R_ID_AA64PFR1_SSBS_MASK |
>                                 R_ID_AA64PFR1_MTE_MASK |
>                                 R_ID_AA64PFR1_SME_MASK },
> +            { .name = "ID_AA64PFR2_EL1",
> +              .exported_bits = 0 },
>              { .name = "ID_AA64PFR*_EL1_RESERVED",
>                .is_glob = true },
>              { .name = "ID_AA64ZFR0_EL1",
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 42258cc2d88..b4f2b743901 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -493,6 +493,7 @@ static struct hvf_sreg_match hvf_sreg_match[] = {
>      { HV_SYS_REG_ID_AA64PFR0_EL1, HVF_SYSREG(0, 4, 3, 0, 0) },
>  #endif
>      { HV_SYS_REG_ID_AA64PFR1_EL1, HVF_SYSREG(0, 4, 3, 0, 1) },
> +    /* Add ID_AA64PFR2_EL1 here when HVF supports it */
>      { HV_SYS_REG_ID_AA64DFR0_EL1, HVF_SYSREG(0, 5, 3, 0, 0) },
>      { HV_SYS_REG_ID_AA64DFR1_EL1, HVF_SYSREG(0, 5, 3, 0, 1) },
>      { HV_SYS_REG_ID_AA64ISAR0_EL1, HVF_SYSREG(0, 6, 3, 0, 0) },
> @@ -864,6 +865,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      } regs[] = {
>          { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
>          { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
> +        /* Add ID_AA64PFR2_EL1 here when HVF supports it */
>          { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
>          { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
>          { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 74fda8b8090..915fc04e54e 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -292,6 +292,8 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      } else {
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr1,
>                                ARM64_SYS_REG(3, 0, 0, 4, 1));
> +        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr2,
> +                              ARM64_SYS_REG(3, 0, 0, 4, 2));
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64smfr0,
>                                ARM64_SYS_REG(3, 0, 0, 4, 5));
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr0,

