Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp237705lfq;
        Fri, 11 Sep 2020 12:41:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw79IbeGdVvJvBvuc6nmRZMwxfcV6mr1tNKjRFqL7LIXyjL1RdDognToSyNRApvfXwFKiJW
X-Received: by 2002:a5b:14f:: with SMTP id c15mr4980219ybp.151.1599853316238;
        Fri, 11 Sep 2020 12:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599853316; cv=none;
        d=google.com; s=arc-20160816;
        b=cElgSfjmG4LVXkwJrCermJbmivwgO0cR2YPN9/RrumwDc+LuihCF4Vp9PeyG7nvLFu
         sHb7DLVxZXBAyxLC2bK/oGPjrTAAgsjmv5i51lnBaSYUejO0niDgNgsU8i2Db8PiHVPo
         dhUd1v4A1riLw1fcIFWbp873LnKz+QB0wk7GC6d4dsbOapZauGnbyQr02I/vwM8CsPD2
         CMFhxoF6wsEoqfwlz38/U0SGILc+N2Zh8o0VgUbg49LW3TBKqwR+hpkeltyKWD65RLRR
         t8801EZfH3ntBKzLIGSaK9T8bvWITKUH94/E/debPeiY7c3mjDuAre2zoaGXGHJ4g/xD
         qXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fzsN2kmp759BPhrivZCf0ftkqqjeCNXbrECqPg8QK3A=;
        b=aXItwzLrCP5oVNtxuj4LNDcpV50XuwUdCTQB6sak8QWB69x+Jg/XXXPavqEeyP+4X4
         9GPYJaXtxUuk4tqPdEVpuADvFwJLzcopXnnrX9l3vGjJ1Zi/4LDLF5mxw3hdT09dfavY
         7VKB7rZ36HsYeTHH78af/CSHpHNtY0AkQQZUd7wXuTr9R8FBXf/nUKNk3FBW9Hz56fSV
         v05/YMukD/osu5A1YFVTpAzCvVbLNjvvTP0HtcdImsfJnffAMJe8STagPcLd1T9KPN2A
         lpxkAie4M7Uk3P6uaN3R1g4yKYSAgEk/8l2HL1FsLKWWUeDhly5PNwLKP8SRUfkibyOG
         23ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVUJDjbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si2850435ybm.196.2020.09.11.12.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 12:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVUJDjbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGovj-0008S5-Gc
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 15:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGouF-0006av-1H
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:40:23 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGouC-0001ZI-I0
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:40:22 -0400
Received: by mail-pf1-x442.google.com with SMTP id x123so8150492pfc.7
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fzsN2kmp759BPhrivZCf0ftkqqjeCNXbrECqPg8QK3A=;
 b=nVUJDjbYmKKhvCJuBkUTEPJbTeWY9Sp9fSkEhU30G87x92A9Dpb+hURHjdAqqAsq+e
 cLdnz5RwrTIaX7mDrftfaibNYeWB37PJHlODHUyp+GbgmHF4R64pLJVr8PMT/TL9/7WO
 QfgScagcR5FswXXijnBOsgeRBVN0trbURZaxuAdpULJfOAAuTGDVzsKF0ZUT0+71y1gK
 8A/b8TUhjmIM2avIksEl8CHjGa1DCA+wEnanULYNSrHC9ktnDNqsMWR4oWJUeqBJPwjd
 nJr0VkrDeLjrScYmUXrSUHuKu1daUyFosLK2p36hreAS13Lry0diNjsn9Gr5hZxKAd9B
 ivQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fzsN2kmp759BPhrivZCf0ftkqqjeCNXbrECqPg8QK3A=;
 b=mWCA8EytPwL3HI12cPWQ7FcGmoyOyD+O9MrxxaEl/q/04W79u+ItWdfD5Ef9LmdliY
 Lv5VolFnCumECP8dNKaR2BocJPeqmCF3Evgeem8iBg6LUJOFNHvH4ukcD8CtUWQuxMPm
 yYxZFKZmIUtNBpFKpbsBvGsF6mJ7GMUKVY5irpy+xlujNrhfLFFlfFP5AmbExvyUp646
 T/XwH9dDnZ9aYgkizF3QOB6fzdUTrK5Tpsus/NOCmjt4/UfeeXhkvG0UCoCmpZWdL5IA
 PRLS76mI92lU4C8+dr3y0kmdwj30yO2hQQbKE3a6N1tsgu81AIE+v4elRjZH3lRbPddj
 3elA==
X-Gm-Message-State: AOAM532zFKQg+jip6Ql9L7Hh9aK3NFLWz5nIQ8Mjo7/ILA7tM8RDuH3z
 tUNSjjZJbHHBRmfrzHUpCgSYsQ==
X-Received: by 2002:a62:8f4a:: with SMTP id n71mr3605478pfd.141.1599853219124; 
 Fri, 11 Sep 2020 12:40:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gi20sm2611596pjb.28.2020.09.11.12.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 12:40:18 -0700 (PDT)
Subject: Re: [PATCH 0/5] handle M-profile in fp16_arith isar_feature test
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200910173855.4068-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df87b4ec-2091-6d1f-9f5e-3f3617f7cf92@linaro.org>
Date: Fri, 11 Sep 2020 12:40:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910173855.4068-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qBGA7Y66fX7N

On 9/10/20 10:38 AM, Peter Maydell wrote:
> This series leaves us with two different ways to check for "is this
> M-profile?" -- the old ARM_FEATURE_M bit, and also the new
> isar_feature_aa32_mprofile() test.  We could in theory convert the
> users of ARM_FEATURE_M, but I haven't, because there are a lot of
> callsites, and it can't be done automatically:
> 
>  * arm_feature() takes the CPUARMState* whereas cpu_isar_feature()
>    takes the ARMCPU*, so each callsite needs manual attention to
>    identify whether it already has a 'cpu' local variable and
>    add one if it doesn't
>  * awkwardly, the KVM-on-AArch64-only host case does not zero
>    out these ID register fields (see the comment in kvm64.c
>    kvm_arm_get_host_cpu_features()), so calling the
>    isar_feature function is only valid if we already know that
>    this CPU is AArch32 -- this would need manually checking
>    at all callsites. (Unless we wanted to change our minds about
>    leaving UNKNOWN values in the ID register fields.)

That is why I had suggested moving env->features to cpu->isar.features, so that
it would be nearby.

Which would give us

static inline bool isar_feature(const ARMISARegisters *id,
                                int feature)
{
    return extract64(id->features, feature, 1);
}

static inline bool arm_feature(CPUARMState *env, int feature)
{
    return isar_feature(&env_archcpu(env)->isar, feature);
}

But what you have at present solves the current problem, where we know we're in
aa32 mode in translate.c.


r~
