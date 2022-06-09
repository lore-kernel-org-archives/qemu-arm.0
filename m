Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp686052lfb;
        Thu, 9 Jun 2022 13:40:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxws9LP7i3vGmSWaY7VoJ6j9H+w4CgeQnLAI5sx6UCI7D0jrpNfL4i1ltifJ8y09qAYedRb
X-Received: by 2002:a05:622a:c8:b0:305:78:8d6c with SMTP id p8-20020a05622a00c800b0030500788d6cmr9140210qtw.211.1654807212247;
        Thu, 09 Jun 2022 13:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654807212; cv=none;
        d=google.com; s=arc-20160816;
        b=yYL3SkRypBVKDWdCAVMJ/kB24MGbJnM1nwDwsiZxgd/2kWjB/8je8xtGsciRyzCYy8
         aft798PBn3dnWS8P2J/t1jyUqgx49PGbVHyOcIAueJjqstL7MccLoocL0h/Ys/JMcFfD
         GIHzuzSuS/ZGQ4ihdhpsIiiYMfzESzGzl29Dau1Ecbrk3YrJVaRTV0sNeL/zhdaH8y/+
         E+i6X/rxJD1H0cIqCVk1rRBqVvQY1/d94Sqs5+XgMJ1Cx5nRveBySFWAa7EwuuZTySYq
         OqDrT+IG9QZv/TSTj5opu6Tc0jn+cqdOPF3IUKaf1sDlPXCzobIVtNs5lnvorkp17Kan
         qCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vRVKsC8rEIiqRV5BAUvZTtGnuZ4DvOD84WuMPrP+5UQ=;
        b=uWDse58TMWaKh9vSQ7XHblMV78MTnIrh530bgSTkKlshH/bznbEe5sDywsk5fEozrt
         ilxvPvuPOoPMJmcHMRSdcpCOUeCajFgG+sG+zLewxnSFLMqqO2s0eKHzuCwgZ3twWu7K
         j83U2f5XEcITex9AdnkUQUSJX5sdYQx0UKMMpED9qwRAziLZi7axFFIbYWJKdc6PDeuH
         zXFCt7o8w7wLKlR4o+CEiGSJ//Zf5pVoWg3eTmgqnlc/upVbwI/OM9p0TsacWpGCMXvJ
         LtE+Qp/3vC5A/tjo5OJg4tpk+Mj4KlBVovXEM6QHSod7IQ6lVCP+q8i5qDb6TDiQD4h1
         C0CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l7No791I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a379105000000b006a73b7374a2si935721qkd.552.2022.06.09.13.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:40:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l7No791I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzOwt-00079e-LB
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOAC-0003PI-TA
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 15:49:52 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOAB-0001pz-Bl
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 15:49:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so264754pjb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vRVKsC8rEIiqRV5BAUvZTtGnuZ4DvOD84WuMPrP+5UQ=;
 b=l7No791IQ4tQwhHMzw48xsX0VlEBh0EQD49k5ojObRUs0zxXPlO/IaDJOnGcquC9HY
 kurPXm7x2muxe7vyE/dj83dPFOBt8hLluULw21CILyzpeimSjRJFUP6QzQa1ieXOj4Cw
 m09CN3l5lUv34dmcrHuhqWTAiBkZogWf2aAwtUL+PkfCGrvSHnvAitEA2rkdiXCaeGlQ
 uWKCEtxyVOhiN5t66LrBpQ/rfl9yPVZvAnNM/eCIf2J3yHXSfdSMqqmKpFbOnrljaD2E
 yoOfrkgXNUbrB9MOj0mcDv+jSwbNGRalyMMoN+V7MR2VSHPrEdOGmJHNMtNTeyjHMGZW
 7ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vRVKsC8rEIiqRV5BAUvZTtGnuZ4DvOD84WuMPrP+5UQ=;
 b=bP/9HJgIw9b0ZERmsRugKHP4KMdrEiz3UfGTb4s+PcgRy2bLVowBTgJZBqzLQlsU0f
 Dy4aPdhgPQlp+5aipl8IKIKoV+bG3F5ZKxSa7bhs/9LhZvn8vTEH2Un03lSm7u758vmf
 Q1X+xtgIlWuFKCzQ2riVkDlwEPhAGPdatv+G3ivttqX2T/BhilDmuA9xwPDLJC10vs2Z
 kAqAdpxCQ01Rhvz4+hZdXvEukZhRvWrROO+58Woml4CjiwVF+jY0I9KZkCDqNIss8bCA
 LAzuTaK4GQOgGd6lK8i3ZbKh+e6IJ5Sha4Ca46kY8W8fuzGQrWxY5/EYm6r6laePYxI0
 4GDA==
X-Gm-Message-State: AOAM530/E0YGqnojShVfBzO8sf+j9MKuB4egBVlplnpivygfmVDQnYAI
 1P+r40twVn0d7yqT11O3sTASRQ==
X-Received: by 2002:a17:90b:1b10:b0:1e8:2966:3232 with SMTP id
 nu16-20020a17090b1b1000b001e829663232mr4915470pjb.103.1654804189678; 
 Thu, 09 Jun 2022 12:49:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a17090331c900b0016796cdd802sm6207444ple.19.2022.06.09.12.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 12:49:49 -0700 (PDT)
Message-ID: <a3289600-31db-bc1e-4a64-47565965774e@linaro.org>
Date: Thu, 9 Jun 2022 12:49:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 24/25] target/arm: Rearrange Secure PL1 test in
 arm_debug_target_el
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-25-richard.henderson@linaro.org>
 <CAFEAcA9KR9_YicVwE0Ryp8BWzUe_-xOV78h=v9b5Hhpm+LZpCA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9KR9_YicVwE0Ryp8BWzUe_-xOV78h=v9b5Hhpm+LZpCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nR7E1gM+8YHI

On 6/9/22 09:53, Peter Maydell wrote:
> On Tue, 7 Jun 2022 at 04:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Not a bug, because arm_is_el2_enabled tests for secure,
>> and SCR_EL3.EEL2 cannot be set for AArch32, however the
>> ordering of the tests looks odd.  Mirror the structure
>> over in exception_target_el().
> 
> I think the code is following the ordering in the
> DebugTarget() and DebugTargetFrom() pseudocode (or else some other
> equivalent function in an older version of the Arm ARM...)

Fair enough.

> I think you're also relying on there being no secure EL2
> if EL3 is AArch32 (otherwise an exception from secure EL0
> might need to be routed to secure EL2, not EL3).

Correct, though I don't imagine SEL2 will ever apply to A32.

I'll drop the patch though.


r~
