Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2264282njm;
        Fri, 7 Mar 2025 07:33:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWx5S+CF78zOnViNBcrJmwtq8KHjZfX0kMNA/t9taynI8/KtInc/5J8/MDICMwsKSS6MiBogKShYe5BFw==@linaro.org
X-Google-Smtp-Source: AGHT+IGEUT20shXeLFNR39s6pS5M/TmNqAaxXU8fsUUN2FgnsyeO5rX2jXr3ZvR7SI5rnpjt9Xu4
X-Received: by 2002:ad4:5be2:0:b0:6e8:af23:b6f1 with SMTP id 6a1803df08f44-6e8ff738403mr48921226d6.10.1741361590598;
        Fri, 07 Mar 2025 07:33:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741361590; cv=none;
        d=google.com; s=arc-20240605;
        b=TrQwf15pKz6dwbjZesBfWAvIGkWyaWEYh+EFoMwNJwIL0p7DbE/thYd2pfPE+7vv0l
         oj+wyODR1SxmOAy6+8qQ5uOkKE74RkGY4bbK2qsvXXbP7iWiXnWNf+sNn39Kvm57ySLx
         3m8FjcIoBo//OUCojDhomrhmfBoCtrqZFEAthAmVcSq2m8Md0MFx7ermIk+3mMwUO5Aj
         0fQI/TYkNgAmIQM+9pgEidgKm/kngh8P47HmG21JiYm8LhX8vDRgUcD8CGIrMkFuGFhq
         tAj+5yGPKm2tlr9E0050gvqSDmkMz1uy2oKVr/KXmlOdouNNzt08HpqHu9MP6UFBGka8
         TCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:to:from
         :dkim-signature;
        bh=oBCW2iTblUHdm3lEv+FYrmINGJFc+0L2nOyXxZWhD6w=;
        fh=aYiF/zCfbWb8ljJdclTVJwTYeSlmEWG6r6gfpqjlBns=;
        b=SnV8tJZ5TnCmTdbYqICbbFHGyGuvMV8NpeNlrxrkaFeic+MfyGZVIqHi1XALKAKERZ
         5Ptqn5YmRXls5D0gcprhwBFPIA34/QZv9mO7IdptuFCARG+OND6ykj2iCjVK0WiTQuOt
         ZlJq5CrN35CVQVNBFTOWdpNKHyS8uXSXA80mqVyaMxKridYQZETIrm3dlXY+Kvv1dfFE
         zhTFwa41y5BlezJvMBP0Yx4By7a18s9FvfBHbPGqFD5h5GxrPzXJ8k/z/5tIE8+6t14p
         T43d4ntIdo//5rgJ4awIAaitmIYVIcgvadOT1vWS+rp+H4dl71wY4E1T4n6W1y91hOJe
         O5CQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Iq0yjzUf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f707d412si36302146d6.87.2025.03.07.07.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 07:33:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Iq0yjzUf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqZgn-0000sd-Go; Fri, 07 Mar 2025 10:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1tqZgZ-0000re-PW
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 10:32:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1tqZgY-0002vS-1K
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 10:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741361544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oBCW2iTblUHdm3lEv+FYrmINGJFc+0L2nOyXxZWhD6w=;
 b=Iq0yjzUfzKk/VrRlIKYxzU4mxeVyho8pUg3UIAbdLpSsGDtRJDdvOdCuejx6dJAYj2EEz1
 WRGZOgmVaJa/GSJfGVEe70aIRjgplBtEH8dhwvihzssBmCE72BgohLApLwYBgJwMggfkrt
 uPTcPcEjUdmWQVZgpEGRgMcE6H+WpaA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-8NoEgYIRMrK4t0Nfk-fjZg-1; Fri,
 07 Mar 2025 10:32:22 -0500
X-MC-Unique: 8NoEgYIRMrK4t0Nfk-fjZg-1
X-Mimecast-MFC-AGG-ID: 8NoEgYIRMrK4t0Nfk-fjZg_1741361541
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CFFAC1800349; Fri,  7 Mar 2025 15:32:19 +0000 (UTC)
Received: from localhost (unknown [10.44.33.78])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D29AC1955DCE; Fri,  7 Mar 2025 15:32:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 01/14] arm/cpu: Add sysreg definitions in cpu-sysregs.h
In-Reply-To: <1f8bfd50-669a-41be-95e1-b277255a96a4@linaro.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy Ross"
References: <20250305163819.2477553-1-cohuck@redhat.com>
 <20250305163819.2477553-2-cohuck@redhat.com>
 <1f8bfd50-669a-41be-95e1-b277255a96a4@linaro.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 07 Mar 2025 16:32:14 +0100
Message-ID: <87senovou9.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /mtI4eToSKx9

On Wed, Mar 05 2025, Richard Henderson <richard.henderson@linaro.org> wrote:

> On 3/5/25 08:38, Cornelia Huck wrote:
>> +++ b/target/arm/cpu-sysregs.h
>> @@ -0,0 +1,131 @@
>> +#ifndef ARM_CPU_SYSREGS_H
>> +#define ARM_CPU_SYSREGS_H
>> +
>> +/*
>> + * Following is similar to the coprocessor regs encodings, but with an argument
>> + * ordering that matches the ARM ARM. We also reuse the various CP_REG_ defines
>> + * that actually are the same as the equivalent KVM_REG_ values.
>> + */
>> +#define ENCODE_ID_REG(op0, op1, crn, crm, op2)          \
>> +    (((op0) << CP_REG_ARM64_SYSREG_OP0_SHIFT) |         \
>> +     ((op1) << CP_REG_ARM64_SYSREG_OP1_SHIFT) |         \
>> +     ((crn) << CP_REG_ARM64_SYSREG_CRN_SHIFT) |         \
>> +     ((crm) << CP_REG_ARM64_SYSREG_CRM_SHIFT) |         \
>> +     ((op2) << CP_REG_ARM64_SYSREG_OP2_SHIFT))
>> +
>> +typedef enum ARMIDRegisterIdx {
>> +    ID_AA64PFR0_EL1_IDX,
>> +    ID_AA64PFR1_EL1_IDX,
>> +    ID_AA64SMFR0_EL1_IDX,
>> +    ID_AA64DFR0_EL1_IDX,
>> +    ID_AA64DFR1_EL1_IDX,
>> +    ID_AA64ISAR0_EL1_IDX,
>> +    ID_AA64ISAR1_EL1_IDX,
>> +    ID_AA64ISAR2_EL1_IDX,
>> +    ID_AA64MMFR0_EL1_IDX,
>> +    ID_AA64MMFR1_EL1_IDX,
>> +    ID_AA64MMFR2_EL1_IDX,
>> +    ID_AA64MMFR3_EL1_IDX,
>> +    ID_PFR0_EL1_IDX,
>> +    ID_PFR1_EL1_IDX,
>> +    ID_DFR0_EL1_IDX,
>> +    ID_MMFR0_EL1_IDX,
>> +    ID_MMFR1_EL1_IDX,
>> +    ID_MMFR2_EL1_IDX,
>> +    ID_MMFR3_EL1_IDX,
>> +    ID_ISAR0_EL1_IDX,
>> +    ID_ISAR1_EL1_IDX,
>> +    ID_ISAR2_EL1_IDX,
>> +    ID_ISAR3_EL1_IDX,
>> +    ID_ISAR4_EL1_IDX,
>> +    ID_ISAR5_EL1_IDX,
>> +    ID_MMFR4_EL1_IDX,
>> +    ID_ISAR6_EL1_IDX,
>> +    MVFR0_EL1_IDX,
>> +    MVFR1_EL1_IDX,
>> +    MVFR2_EL1_IDX,
>> +    ID_PFR2_EL1_IDX,
>> +    ID_DFR1_EL1_IDX,
>> +    ID_MMFR5_EL1_IDX,
>> +    ID_AA64ZFR0_EL1_IDX,
>> +    CTR_EL0_IDX,
>> +    NUM_ID_IDX,
>> +} ARMIDRegisterIdx;
>> +
>> +typedef enum ARMSysRegs {
>> +    SYS_ID_AA64PFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 0),
>> +    SYS_ID_AA64PFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 1),
>> +    SYS_ID_AA64SMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 5),
>> +    SYS_ID_AA64DFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 0),
>> +    SYS_ID_AA64DFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 5, 1),
>> +    SYS_ID_AA64ISAR0_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 0),
>> +    SYS_ID_AA64ISAR1_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 1),
>> +    SYS_ID_AA64ISAR2_EL1 = ENCODE_ID_REG(3, 0, 0, 6, 2),
>> +    SYS_ID_AA64MMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 0),
>> +    SYS_ID_AA64MMFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 1),
>> +    SYS_ID_AA64MMFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 2),
>> +    SYS_ID_AA64MMFR3_EL1 = ENCODE_ID_REG(3, 0, 0, 7, 3),
>> +    SYS_ID_PFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 0),
>> +    SYS_ID_PFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 1),
>> +    SYS_ID_DFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 2),
>> +    SYS_ID_MMFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 4),
>> +    SYS_ID_MMFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 5),
>> +    SYS_ID_MMFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 6),
>> +    SYS_ID_MMFR3_EL1 = ENCODE_ID_REG(3, 0, 0, 1, 7),
>> +    SYS_ID_ISAR0_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 0),
>> +    SYS_ID_ISAR1_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 1),
>> +    SYS_ID_ISAR2_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 2),
>> +    SYS_ID_ISAR3_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 3),
>> +    SYS_ID_ISAR4_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 4),
>> +    SYS_ID_ISAR5_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 5),
>> +    SYS_ID_MMFR4_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 6),
>> +    SYS_ID_ISAR6_EL1 = ENCODE_ID_REG(3, 0, 0, 2, 7),
>> +    SYS_MVFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 0),
>> +    SYS_MVFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 1),
>> +    SYS_MVFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 2),
>> +    SYS_ID_PFR2_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 4),
>> +    SYS_ID_DFR1_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 5),
>> +    SYS_ID_MMFR5_EL1 = ENCODE_ID_REG(3, 0, 0, 3, 6),
>> +    SYS_ID_AA64ZFR0_EL1 = ENCODE_ID_REG(3, 0, 0, 4, 4),
>> +    SYS_CTR_EL0 = ENCODE_ID_REG(3, 3, 0, 0, 1),
>> +} ARMSysRegs;
>> +
>> +static const uint32_t id_register_sysreg[NUM_ID_IDX] = {
>> +    [ID_AA64PFR0_EL1_IDX] = SYS_ID_AA64PFR0_EL1,
>> +    [ID_AA64PFR1_EL1_IDX] = SYS_ID_AA64PFR1_EL1,
>> +    [ID_AA64SMFR0_EL1_IDX] = SYS_ID_AA64SMFR0_EL1,
>> +    [ID_AA64DFR0_EL1_IDX] = SYS_ID_AA64DFR0_EL1,
>> +    [ID_AA64DFR1_EL1_IDX] = SYS_ID_AA64DFR1_EL1,
>> +    [ID_AA64ISAR0_EL1_IDX] = SYS_ID_AA64ISAR0_EL1,
>> +    [ID_AA64ISAR1_EL1_IDX] = SYS_ID_AA64ISAR1_EL1,
>> +    [ID_AA64ISAR2_EL1_IDX] = SYS_ID_AA64ISAR2_EL1,
>> +    [ID_AA64MMFR0_EL1_IDX] = SYS_ID_AA64MMFR0_EL1,
>> +    [ID_AA64MMFR1_EL1_IDX] = SYS_ID_AA64MMFR1_EL1,
>> +    [ID_AA64MMFR2_EL1_IDX] = SYS_ID_AA64MMFR2_EL1,
>> +    [ID_AA64MMFR3_EL1_IDX] = SYS_ID_AA64MMFR3_EL1,
>> +    [ID_PFR0_EL1_IDX] = SYS_ID_PFR0_EL1,
>> +    [ID_PFR1_EL1_IDX] = SYS_ID_PFR1_EL1,
>> +    [ID_DFR0_EL1_IDX] = SYS_ID_DFR0_EL1,
>> +    [ID_MMFR0_EL1_IDX] = SYS_ID_MMFR0_EL1,
>> +    [ID_MMFR1_EL1_IDX] = SYS_ID_MMFR1_EL1,
>> +    [ID_MMFR2_EL1_IDX] = SYS_ID_MMFR2_EL1,
>> +    [ID_MMFR3_EL1_IDX] = SYS_ID_MMFR3_EL1,
>> +    [ID_ISAR0_EL1_IDX] = SYS_ID_ISAR0_EL1,
>> +    [ID_ISAR1_EL1_IDX] = SYS_ID_ISAR1_EL1,
>> +    [ID_ISAR2_EL1_IDX] = SYS_ID_ISAR2_EL1,
>> +    [ID_ISAR3_EL1_IDX] = SYS_ID_ISAR3_EL1,
>> +    [ID_ISAR4_EL1_IDX] = SYS_ID_ISAR4_EL1,
>> +    [ID_ISAR5_EL1_IDX] = SYS_ID_ISAR5_EL1,
>> +    [ID_MMFR4_EL1_IDX] = SYS_ID_MMFR4_EL1,
>> +    [ID_ISAR6_EL1_IDX] = SYS_ID_ISAR6_EL1,
>> +    [MVFR0_EL1_IDX] = SYS_MVFR0_EL1,
>> +    [MVFR1_EL1_IDX] = SYS_MVFR1_EL1,
>> +    [MVFR2_EL1_IDX] = SYS_MVFR2_EL1,
>> +    [ID_PFR2_EL1_IDX] = SYS_ID_PFR2_EL1,
>> +    [ID_DFR1_EL1_IDX] = SYS_ID_DFR1_EL1,
>> +    [ID_MMFR5_EL1_IDX] = SYS_ID_MMFR5_EL1,
>> +    [ID_AA64ZFR0_EL1_IDX] = SYS_ID_AA64ZFR0_EL1,
>> +    [CTR_EL0_IDX] = SYS_CTR_EL0,
>> +};
>
> Again, you should NOT place this array in a header,
> to be replicated in every single user of the header.

Hrm, I thought I had addressed this... but apparently not.

>
>
> This can be a bit more automated to avoid mistakes.

You mean to reduce this to a single invocation of the parsing script?
(The hand-written version is more error prone, I agree.)

>
> --- target/arm/cpu-sysregs.h.inc
>
> DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
> ...
>
> --- target/arm/cpu-sysregs.h
>
> #define DEF(NAME, OP0, OP1, CRN, CRM, OP2)  NAME##_IDX,
>
> typedef enum ARMIDRegisterIdx {
> #include "cpu-sysregs.h.inc"
> } ARMIDRegisterIdx;
>
> #undef DEF
> #define DEF(NAME, OP0, OP1, CRN, CRM, OP2) \
>      SYS_##NAME = ENCODE_ID_REG(OP0, OP1, CRN, CRM, OP2),
>
> typedef enum ARMSysRegs {
> #include "cpu-sysregs.h.inc"
> } ARMSysRegs;
>
> #undef DEF
>
>
> r~

