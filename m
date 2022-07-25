Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1022501lfg;
        Mon, 25 Jul 2022 11:23:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vmNCTRRnJ0Q6YZb6/0/R249j9p8CRKbw4QLQ7hqwC9b7GoP/9mTh56X30B0RwwbDgTJHwQ
X-Received: by 2002:a05:620a:19a9:b0:6b6:4f9c:fc24 with SMTP id bm41-20020a05620a19a900b006b64f9cfc24mr6792383qkb.252.1658773414014;
        Mon, 25 Jul 2022 11:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658773414; cv=none;
        d=google.com; s=arc-20160816;
        b=Pu0n8pGd/Gn6X7Ho61hD5kA3vD44709i73mU530dzmzlPzr7RU8GpjsgebU0/xaQUC
         nRgX1xrYs+oWgsW4VCxNV3L0FvdZDpI91EfAEgUfjazlyNbJxa+y9FM2FWYDYlg8bEGu
         +0xtAfx25pokZAQ4fd+VIZd1D8q95X6626++NBUQSMtiMZOo+ajWrMs7NXpsb05A858p
         daEAgmehYN93RH304Ri/oFKbKITmmlakzGlcD0FZjIFKHy9eRGkS2pY9F2b4Kh4ktM1I
         IT9wp+utvt3qnTpzDpG32guPyzDdO8WII819W4p3/VLFS3vsRUjmUeBDSurAwf4qIgzl
         PY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ACzgSzCa5ERQJBIyGWPc4HKpcVCvjGP1xHu7xLPnF8Q=;
        b=GmTPtTGphwfD35+jiyRqC94+zcf0hHCFvUAx6eEoVA2ZT8l8w39tZhQbSwFMJ8BfNi
         aIl6bU+iAC7ruok/69+v8CYoEviy92q8MlrQidXCUJ6QXVLoDw78B/tNYphVyd+k0Job
         u3jGDNKwJnGQtCU082UvkciveB3LQKDuBdOJ+AbYO15aPrZbetSgaBi35wVw/SgEIK6B
         Ka1eu2zqMtwsfbeOYSATHm7Qwx+I/22c+RGaoQwyi36+esbHSEb1p/XhAdBfGHdz+XWx
         OJoG3q6Llp+HibxGVoY3jrvpBIs8isqfMHsCNzE26fTUPypAVAYsFsvdHTgAHUoi9/j5
         6f0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lP3NpA87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e124-20020a378282000000b006b57485aff2si7112750qkd.648.2022.07.25.11.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 11:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lP3NpA87;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oG2jt-0003ed-Gb
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 14:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2gx-0000bV-9L
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 14:20:31 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2gv-0006Zy-HT
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 14:20:30 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so11034859pjf.2
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=ACzgSzCa5ERQJBIyGWPc4HKpcVCvjGP1xHu7xLPnF8Q=;
 b=lP3NpA87wvstnTj22Ldd6LwAxx0lXpE//vOfrAQly0mU4fmI0S/b0tEYcHA9rvAtmz
 eLQJY4ETzHWGsQxHf6H8alLOMTHoNqn3T+3Wh+Rk6ahz8BAx/mYTD6aoWBNWNHD9Qwih
 G1X3N7y8gqwyCQXyhiYzcR4X1fD8NPUeO9HidAq2Kc8TAeO1hzvJKHKUBCrg9ZtdLE3m
 ndyW9E9TWejCHUIytFgkdBwgjFOz7wybg0poemHKHHp3f1WU+yAWl7iLc0Pwt7Eb0Jy7
 zdPu3DEwvCXrd9wmtzB2dUaYwe0u/Qgp7iuRcXKIDLITGEojANNWYM8a10WmtFrgdDHX
 FovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ACzgSzCa5ERQJBIyGWPc4HKpcVCvjGP1xHu7xLPnF8Q=;
 b=7rKt8wTQwj7y0CutLTa8GOOqSgmhjQra+Mw74heyg4r25jp3ajudbnEbScRXb8a9nz
 ki60PTQGB82t7rSE1+WHJL1M34iJVueVEf/aG5P9EZdCovvXvXRydywuWPt9S6nUpFJn
 aOboFY4fq0yBZi5BvMg5bbn/gCNLZanDimqDiIuiwVgcZg8pcdFq0gwCcWK45mPClEGg
 yF/345NiQC12z+rU1lFo6mdTeCE+rm6cc7fRKWGyVhQENxCrc6V3sJHQ8pps09urNjjl
 VqFUWAfTm1X9jgTdSE4agWjSMy8NMSL2U+sD5PQaQan47KhMB0km21KgARNAWrvaNz6x
 1+ZQ==
X-Gm-Message-State: AJIora9JAQIoPAvcnHS1kfMBgyONvWZd3JY/hkGT4x4QDZdrUBD7HjOm
 J+P3EtgO5rKt62pOG7oZ92buUA==
X-Received: by 2002:a17:90b:1d01:b0:1f2:104:6424 with SMTP id
 on1-20020a17090b1d0100b001f201046424mr15263086pjb.101.1658773226097; 
 Mon, 25 Jul 2022 11:20:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:30c1:2484:a853:233d?
 ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 6-20020a620606000000b005255489187fsm9948324pfg.135.2022.07.25.11.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 11:20:25 -0700 (PDT)
Message-ID: <8ee6d63a-67a9-0025-06ef-412f042fffae@linaro.org>
Date: Mon, 25 Jul 2022 11:20:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] target/arm: Set KVM_ARM_VCPU_SVE while probing the
 host
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com, qemu-arm@nongnu.org
References: <20220725181457.41083-1-richard.henderson@linaro.org>
 <20220725181457.41083-3-richard.henderson@linaro.org>
In-Reply-To: <20220725181457.41083-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: UmukJCRI8u+A

On 7/25/22 11:14, Richard Henderson wrote:
> Because we weren't setting this flag, our probe of ID_AA64ZFR0
> was always returning zero.  This also obviates the adjustment
> of ID_AA64PFR0, which had sanitized the SVE field.


Oh, I meant to say here that this the effects of the bug are not visible, because the only 
thing that ISAR.ID_AA64ZFR0 is used for within qemu at present is tcg translation.  The 
other tests for SVE within KVM are via ISAR.ID_AA64PFR0.SVE.


r~


> 
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm64.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 36ff20c9e3..8b2ae9948a 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -512,7 +512,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       bool sve_supported;
>       bool pmu_supported = false;
>       uint64_t features = 0;
> -    uint64_t t;
>       int err;
>   
>       /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
> @@ -533,10 +532,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       struct kvm_vcpu_init init = { .target = -1, };
>   
>       /*
> -     * Ask for Pointer Authentication if supported. We can't play the
> -     * SVE trick of synthesising the ID reg as KVM won't tell us
> -     * whether we have the architected or IMPDEF version of PAuth, so
> -     * we have to use the actual ID regs.
> +     * Ask for SVE if supported, so that we can query ID_AA64ZFR0,
> +     * which is otherwise RAZ.
> +     */
> +    sve_supported = kvm_arm_svm_supported();
> +    if (sve_supported) {
> +        init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
> +    }
> +
> +    /*
> +     * Ask for Pointer Authentication if supported, so that we get
> +     * the unsanitized field values for AA64ISAR1_EL1.
>        */
>       if (kvm_arm_pauth_supported()) {
>           init.features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
> @@ -680,20 +686,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>           }
>       }
>   
> -    sve_supported = kvm_arm_svm_supported();
> -
> -    /* Add feature bits that can't appear until after VCPU init. */
>       if (sve_supported) {
> -        t = ahcf->isar.id_aa64pfr0;
> -        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
> -        ahcf->isar.id_aa64pfr0 = t;
> -
>           /*
>            * There is a range of kernels between kernel commit 73433762fcae
>            * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
>            * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
> -         * SVE support, so we only read it here, rather than together with all
> -         * the other ID registers earlier.
> +         * SVE support, which resulted in an error rather than RAZ.
> +         * So only read the register if we set KVM_ARM_VCPU_SVE above.
>            */
>           err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
>                                 ARM64_SYS_REG(3, 0, 0, 4, 4));

