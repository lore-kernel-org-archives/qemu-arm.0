Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1187152njm;
        Wed, 5 Mar 2025 17:14:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAML30TaFUEwRMWN8SK+CfJbotmgRjcZLmVqPZvegBW5q08FodqhVTq6d10keAMWG/1lTV5oqK+GlQ+A==@linaro.org
X-Google-Smtp-Source: AGHT+IHOpXgZhLSGha2iu4AfeGMdMWzojV1dSZhoMaDeh/7B+qu9ifft8FGEPymfC7vC+yleZcff
X-Received: by 2002:a05:622a:154:b0:475:ce:3c59 with SMTP id d75a77b69052e-4750b45f59cmr86698751cf.30.1741223678904;
        Wed, 05 Mar 2025 17:14:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741223678; cv=none;
        d=google.com; s=arc-20240605;
        b=gi0rNVVbUOBkkA/6rPzKAScPOb27MzkEtCCo5gKmd2zk96e3Zz8zMPkLJ4ywgnBufP
         FM2kIFrsJHVu5/ZUCD6uJ6PkVsvUk9LRFEk+LVCz43Oe98T8Fi4uE6FS2td/WR4mi56R
         3h4Qh4WhU0lCfMN87H6IynuS7bkwhDriWRqvMxfdaROePOLLxcjqv6Xgpmeqr52KkE26
         w30Y4guAwztCElNBBs3u6Qb7Bwl8ub4juQkjESxjeWkCt+T6GHHKt136BDDLy6dUUY/l
         c7ucHgWHIgI5ZVqQsq3WEWfLY//8tNEPI8c0KUM45LkqYBcN7Aa2vo92/jbnmzJcWJ9V
         WgzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=IZNSX40B0LWPocH4d937YtNReVbf2z70/WFhXiXVLeg=;
        fh=ucnhg9eS0AqLKBbcoaesKpOSn7RzsSdqm1hucl0AeGM=;
        b=WHqvYc6H5phGV1NjUxwOsWMM6DAudgu/ukjg8ctPIFwBYOEZeFdOujyDbwYhofHhfr
         5Cwv3gx+vgnVctj0e+eK8yqJILehWv/x9MwWyXQaaULge0tvRXq60H4aIJ0Rzx+PcYZb
         rOHHw7aVtyAGt64L2pQGsTi5wNqm2i01O4eD7+c2kbrO2VAR+gFJaPIXEevo15pBjPn5
         i4/VGwn+BlHLWu5xoi1uyB1CXw6fKfZkhK5k9lN1HMyz8k7H4T4SUqtj9XWRxQpZNyMO
         hUVCyH2vSS+nBSbS9y9efyhJPcxxjn4FLEFt1GPrfJypAeWTlmHo3hrt1A3tyR49HNpH
         UgIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vbfEO/o8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751daf6579si2173451cf.286.2025.03.05.17.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 17:14:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vbfEO/o8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpzoo-0002vQ-Pn; Wed, 05 Mar 2025 20:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tpzok-0002pS-HP
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 20:14:31 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tpzoi-0004wj-C9
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 20:14:30 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-223378e2b0dso1202645ad.0
 for <qemu-arm@nongnu.org>; Wed, 05 Mar 2025 17:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741223666; x=1741828466; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IZNSX40B0LWPocH4d937YtNReVbf2z70/WFhXiXVLeg=;
 b=vbfEO/o86y3yQwvMgTDIER2Sr706HnDKGpQwY1UliQ083n87XMUFFQcxCdOFwUQXHF
 225ahz6IPufK6Z+9/Tz+syH/HjXVB4Q3zRhfDsMeEiKrdwvBgAxDJ3XHbxPsgTcCQlAG
 zS1wMQKRk70tWXNkR/VFBpWo3VO2ipiP/rvqnFeD4vzmSybddupwwqOJaQf6oX1Q9Yw8
 uiUA3Iv41EUjgMdszj83x8Eh73uPhl/c9eaNhWrWoRNoOLFH32uB8ccnQR0Ne0deK57r
 z55dN0y/RJEtkVTHoOdYx/EL3rVshaIdcNpy92PGjHIY77kRoEk6QVnli9uaGgmY/k+k
 NsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741223666; x=1741828466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IZNSX40B0LWPocH4d937YtNReVbf2z70/WFhXiXVLeg=;
 b=HzvFbdwnIJrmtrnZMeuhK3T0SgN2DZxeiSDtUFYkjc2HXGxKHDoq6yMQKKaDA7blRf
 zg45QVP0JeAwjhHTgzSQ1qYZNLFa6VmgI8JLNR2KA+ZP+jaG48/hFuW5EgqLzMk01QmF
 JjmgJccRvtdNGtO/+SQsTWTYWCe7/S9EdSTxjQnErR7AvDA/TNyKQfGHrIFD51wpZs2l
 9HhCCX245O7I7CVl2JDA9zuVrKRXiBt121eJs5ENllY+HyreeR8eACfoG5FmGBhygjf5
 yQhSgjNTc88LqIxBePwtXO1h1Psh7ugCFsgijkRYNNv3sYRjhZjsWPbl4gf0JARAq4ll
 Baow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuZ6XX6+sn9EQZNs2lLOjmiQ04uDI2f+7LjIyF3ct+ycXzCytWFDPd/PmxuSkBeN+OTqc2bol6VA==@nongnu.org
X-Gm-Message-State: AOJu0YzWxxtbMjtwA3gT+lLlKPlAYWzLYTSYiIkdw2twfRJCMKOffqRo
 hwdOjDLZO2PLDfMy9j6eqaHuogDT5g1FZV/JoHWNUvShR5gpKleW3OgTvcbnL1o=
X-Gm-Gg: ASbGncsmMhKB+9UaPSce/qpbidQNXWT6UOzvYPFMdSHxQqkHjHb5danaP2ERBwJ4i5k
 5vBnk/RydChJ26vMs7wq4At6FtNnl8dWoJS7ta10gvHXTLx/l/JL87OaSEGtpgbnPegaPyehoKZ
 1cpgF1qZkYn7qDdxci8wd1V4dRcFEA4sKbU1a3hZqW79cvk5DcQ9YKP73PihYbCHIHY4zVL72oS
 rv3HSx+k94/lQDp9dDBvmCAbgu9/njcB5VSsi5jxTlgfv7SDe2Bx7pO0kPWSjloP/HriIaezatH
 Wal+Dl0pbvvVu4NzSpbdvwzFovnJLkwD0a1vwog6OJXEZA+C6fdXS+04yxPjHVWJ6HumYhZwSob
 35vU+9gL6
X-Received: by 2002:a17:902:d48d:b0:220:e7ae:dbcf with SMTP id
 d9443c01a7336-223f1cf61aemr82910775ad.23.1741223666070; 
 Wed, 05 Mar 2025 17:14:26 -0800 (PST)
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-224109e9fbfsm671265ad.92.2025.03.05.17.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 17:14:25 -0800 (PST)
Message-ID: <1f8bfd50-669a-41be-95e1-b277255a96a4@linaro.org>
Date: Wed, 5 Mar 2025 17:14:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] arm/cpu: Add sysreg definitions in cpu-sysregs.h
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250305163819.2477553-1-cohuck@redhat.com>
 <20250305163819.2477553-2-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250305163819.2477553-2-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-TUID: wRvwVHVhRtyt

On 3/5/25 08:38, Cornelia Huck wrote:
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

Again, you should NOT place this array in a header,
to be replicated in every single user of the header.


This can be a bit more automated to avoid mistakes.

--- target/arm/cpu-sysregs.h.inc

DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
...

--- target/arm/cpu-sysregs.h

#define DEF(NAME, OP0, OP1, CRN, CRM, OP2)  NAME##_IDX,

typedef enum ARMIDRegisterIdx {
#include "cpu-sysregs.h.inc"
} ARMIDRegisterIdx;

#undef DEF
#define DEF(NAME, OP0, OP1, CRN, CRM, OP2) \
     SYS_##NAME = ENCODE_ID_REG(OP0, OP1, CRN, CRM, OP2),

typedef enum ARMSysRegs {
#include "cpu-sysregs.h.inc"
} ARMSysRegs;

#undef DEF


r~
