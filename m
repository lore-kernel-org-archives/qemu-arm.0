Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp501743lfg;
        Thu, 19 Aug 2021 09:57:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoBW1NeAMYCjoTEELgFiTu0KZFlTSsvp7853sJEOGP0Tly8lCz7jgXBt+uOWnzFWPNMCFf
X-Received: by 2002:a0c:f706:: with SMTP id w6mr15564143qvn.2.1629392272344;
        Thu, 19 Aug 2021 09:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629392272; cv=none;
        d=google.com; s=arc-20160816;
        b=V8VeGSpwbqsG7xcgN81kCayQW2Ldbtvqp1b1DTTcx4el02ro5Kn4yv+h3lMN9NkDAl
         2NaJ8m/mMbNF04HWL6bnHYaTj4OJxhrKuzpPAuC0xAlLdschKmdtzE+0y27UeKCp3a3Q
         jG97HfKTzGzaByfWo7Bs8l6gBHwm3yLE9fBNfXNI+qPH3dpigfCa4VOQQM+c0beKI4fu
         ZMqPbOBHu9/kuq3wlKMeCETP06KujHAC9hJ3uZ5Q/tQlMYy3BFyJXVE582ajI+BPWOzo
         +nzRa86XxIL2gHGLVIJme+fthe8AL1DN/+GGqjVkk5JmwtRxP5YE0fONXTcG51bfKLVb
         ctCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=WGRzv8w5a/gL+meYkzee2RyQixWl65LF4xY/7I0brUc=;
        b=oOF28c/1bFSoBXfGReRpLtVCFbWJe91/dJH1IeaimwOboJFNw+tGILlCZJXxzfId/Z
         hmlMuEu3u96eGusQhIVRdrDLn7IVFUER7zz1XtlcA9MELE5FKsXMPeyI0MHfE4fCpPvR
         n6POFjZ15g4BPJszmcJhU7iDvNqSh6mlsbnRw080qPj7tG5qOG2ga/PiXRGeELgAc9Cr
         uXmYZjoYeVfOV8ywFEJaqte9tZYyI7eExm8Cvop42MqoL3PbobN2cOx8NYNVTPZBy2Xw
         CMAcc2CAH/iy2gKPwoZ+IqtzIJeadwASd19v7IMTh3HDU2AGLuWn+6hEdyXgv92QMrzV
         4+CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uVWltxLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si1917qtl.75.2021.08.19.09.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 09:57:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uVWltxLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGlMV-0005iB-My
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 12:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGlMN-0005i0-KV
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:57:43 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:42687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGlML-0004yc-QS
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:57:43 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso5238296pjb.1
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WGRzv8w5a/gL+meYkzee2RyQixWl65LF4xY/7I0brUc=;
 b=uVWltxLDhJpX/GNlJTR3Qcl4iEttMnuFMt6nH3zLW4z8MTbUdCTbtwdYPK5Ea11AWc
 iJg73sKZHzqqIBQw+owvfX1RnMoJLY94a16s/MWy8o923OTxisbaH8D9CBRitihIYOCc
 MLZr0T4eJRfjQVaNtYVYkCQG06B2M+x6sYp8jkkxd4wbFf1k0YBEBJwY/AERUON3pQC3
 jHIhRzhwNlS5Wtv7BQamzjcWO9sFjuT2apuCKaZqtuk56AyROn6N42BTnRMxXNfURp61
 nYD5TNvAeiWPYhXAeK9+1qNMj43UpWIgEo4lxBPkoGnQcz3Hh3xLyFK4seHCF7HUEfjQ
 3+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WGRzv8w5a/gL+meYkzee2RyQixWl65LF4xY/7I0brUc=;
 b=lvXR90hgoaFlZF2J9D0Q3PUDSeSIucCJJvOw9qS8g5V4ARB6VC2+qoZN+llza0iqhg
 mYFLBiYD9jzXAIOCTjc90KbJkML9P4HDHiPRwyWvOLai8ojJp+N5Fpt57ImfzbK0oz++
 08/PCWYbAOEuHYtQWx+MPrT+TVLrHJrmSTCRNqx66NfAgyO/qGIqxlUjfcBRPiISZsYO
 YtKJ1TweT2dl5xVzAGNMdjlo5dhXDtW1PDEZ1VHczdo1iFeKLr25O90Ja0Uh0M3M/3Co
 vwatdR4NOrBddjoPzc+u26Cp7hGW6YAvlegJ7IkVsk9byxB4LXlIib8x1RhIS/UH12f1
 gWZw==
X-Gm-Message-State: AOAM530N25JioLgxmUrj3pWjDHjkRo+X/MfDJyvkTFk2mE7gunRyfbvG
 E1dqkWJURQHH2fa0tkOhQYJFJ+NARNyORg==
X-Received: by 2002:a17:902:9a47:b0:12f:6a05:caaf with SMTP id
 x7-20020a1709029a4700b0012f6a05caafmr5741521plv.55.1629392260077; 
 Thu, 19 Aug 2021 09:57:40 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id t15sm4785164pgi.80.2021.08.19.09.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 09:57:39 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
 <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
 <bb739396-f8d1-a5a8-ab1a-61892d9c84e6@linaro.org>
Message-ID: <b6754a17-7b6a-201d-6c33-7759ea8ea270@linaro.org>
Date: Thu, 19 Aug 2021 06:57:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bb739396-f8d1-a5a8-ab1a-61892d9c84e6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4KVBqKtKRJgj

On 8/19/21 6:50 AM, Richard Henderson wrote:
> On 8/19/21 3:40 AM, Peter Maydell wrote:
>>>       uint32_t insn;
>>>       bool is_16bit;
>>>
>>> -    if (arm_pre_translate_insn(dc)) {
>>> +    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
>>
>>
>> Is it not possible to get a misaligned PC in the Thumb case ?
> 
> No.  The thumb bit is always removed, leaving all pc aligned mod 2.
> Both BXWritePC and BranchWritePC do this, as do we in gen_bx and store_reg.

Do you think it's worth an assert here to make sure we never miss a case?  I did an audit 
of the exception code and it looks like we mask everything correctly there, but...


r~

