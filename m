Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp535761lfa;
        Thu, 3 Jun 2021 13:08:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR+b0BTLRbdkui17+tGw0QEvoE4FnbJ1zS5KgV2XskX80aTNHP/35ofuzfa1qwmbbP4kQl
X-Received: by 2002:a67:d50d:: with SMTP id l13mr189263vsj.33.1622750912135;
        Thu, 03 Jun 2021 13:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622750912; cv=none;
        d=google.com; s=arc-20160816;
        b=vb7BbqsWC1U277qWcOMi9s8hV+RGymVYbVR3VlbXe/c4pLzYswBUq+Sfkin6nj2OHq
         sdjVJh+C5pKDfYAv/r3JL7we4iFSeR3aXUVHsMHY/wbl7wj76et7q49SJ+/TU8ksB5p3
         kFcXVjKA7m8n/8JFlxzrtQB2w8PKvZdaclv1+qpSml1VscKEY/0qfqH5zaZpzo1LAnuo
         bIZl03KJFoumZrOD3nbxKclcApE5V+YPmpcO6XNS20hT72tQhcwWMFJoiVTZe5rw5tG4
         ogtwFtv0sAIXPYAuYrVYNSXlh215g0+f/YVhB41rtkdKth6mm57FPttqBOJ7sVwnGIx9
         02Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UA3W026wWvjUG2XmVjHJZBd9HirAYi0EKLar928B9g8=;
        b=O5S61iKe2GNv+yuCo28hccX03wFdtYQ/X72gfxlfDTg3r3cJD91EYoQ1AxR/Fz70XI
         rPzjfnihLi/CYkZVVbRvIcfLgns1d9as9od15oZiZG2DgWCInKtgpbYneTjHS1t5dIFO
         PX3n/xWOoSmyt4XI4f5Ip8BuqxAhz/2BpCwxqmD7YCol5QFWYwm0oh3JTumvWeHkp3WG
         un9KHcwE9ohTl2cqHRjJeDiYAX1UrnHXP47bU6D/ENFN855+YDZ0qANN3zpm6sGMzvjB
         jfXcsY8UDS3M3U2Zz5HMyUaqB9xQ3E4YXbbloBcXMg4TJtGDB/blXDpgeC023kvhatET
         qROg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZORDsAXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si1823918ual.88.2021.06.03.13.08.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 13:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZORDsAXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lotdn-0003TO-8p
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 16:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lotde-0003Sn-VH
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 16:08:22 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lotdc-00073z-7R
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 16:08:22 -0400
Received: by mail-pg1-x535.google.com with SMTP id i5so6040377pgm.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UA3W026wWvjUG2XmVjHJZBd9HirAYi0EKLar928B9g8=;
 b=ZORDsAXl9BKJoqP+KUPashYpZV14n9RVt8VbRUx5CEuXcOvko7drj2V2RYqfJ7vL3R
 3Fw04G3A9LLMe/bYi/WJJ8jK29P5hw2DGIES3+N3inTf152ASqWFl8n7HiGD5v0qq5s0
 BjxRSqenlr6EY2ObRl0haWNcJrwSKptwg8hTb3s6yzy8lKx0BlTBSmYLsnVEiIkPF779
 cVXg00tyZtfAzAMdU6/Zr2nqEfLMMK19HMsWeOH5ZDReY5q3McWhUdL2E1khIOMq2Qlq
 JToBgbxuSzGUrBOa8qwVXUemJwWD8gIS/bC1JjkR6gjbSrFfh366BJTq/zhDY9/0rAX6
 cRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UA3W026wWvjUG2XmVjHJZBd9HirAYi0EKLar928B9g8=;
 b=PD2VVC45VnM+c+kJjdvn54W4BSLdSmgOdtNzefxvDR74CnRLy8jkriigpwu+8Ut5aN
 72/MnNR0DqfpTU7ckPsQHWZs8fdq6LNOENulXaQSSrDO0VPLa+vzVCbu8VA0OZTDZ7IR
 JnL9GUGRmZZ0qp9x9hupCzRojbqjou7jBOMBlq5PFatT2qoIw/ClVV7MmwWKBRIDerLl
 9u3EI9pyAJNFAEqnqnNE5wCQwlDZKSLzL9dhxrlN55ks6ycVjcMJhvnXDNy726O+1Ct2
 1Fgp0zWnpqqBXBIUazHAzhecGXQvi7nc0qVhNnJciWpzmPm01nJqoU1sQfil+lGfKycl
 YWMQ==
X-Gm-Message-State: AOAM533AzxxWKOaPOTqrlklQFYJFO441UGIWMMH3QdyHcm/Xzguygk1e
 aAdcVrSBa8DpgzfYI3K1z5+z6g==
X-Received: by 2002:a62:5f82:0:b029:2e9:760e:e9c8 with SMTP id
 t124-20020a625f820000b02902e9760ee9c8mr736260pfb.23.1622750897702; 
 Thu, 03 Jun 2021 13:08:17 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p20sm1718794pff.204.2021.06.03.13.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 13:08:17 -0700 (PDT)
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
 <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65323e52-789c-567a-3446-ccb7709877e2@linaro.org>
Date: Thu, 3 Jun 2021 13:08:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bq4t7RwHLyXt

On 6/3/21 1:17 AM, ishii.shuuichir@fujitsu.com wrote:
> Hi, Richard.
> 
> Thank you for your comment.
> 
>> My first thought is that -cpu max can simply enable the extensions, without
>> extra flags.  The max cpu has all of the features that we can enable, and as I
>> see it this is just one more.
> 
> Let me confirm a few things about the above comment.
> Does it mean that I don't need to explicitly enable individual extensions
> such as a64fx-hpc-sec, a64fx-hpc-hwpf, and a64fx-hpc-hwb,
> since all extensions can be enabled by specifying -cpu max?

Well, Peter disagreed with having them enabled by default in -cpu max, so we 
might need at least one extra property.  I see no reason to have three 
properties -- one property a64fx-hpc should be sufficient.  But we might not 
want any command-line properties, see below...

> 
>> The microarchitectural document provided does not list all of the system
>> register reset values for the A64FX, and I would be surprised if there were an
>> architectural id register that specified a non-standard extension like this.
>> Thus I would expect to add ARM_FEATURE_A64FX with which to enable these
>> extensions in helper.c.
> 
> As you said,
> some of the published specifications do not describe the reset values of the registers.
> I would like to implement this in QEMU by referring to a real machine with A64FX.

I presume there exists some documentation for this somewhere, though possibly 
only internal to Fujitsu so far.

For comparison, in the Arm Cortex-A76 manual,
   https://developer.arm.com/documentation/100798/0301/
section B2.4 "AArch64 registers by functional group", there is a concise 
listing of all of the system registers and their reset values.

The most important of these for QEMU to create '-cpu a64fx' are the 
ID_AA64{ISAR,MMFR,PFR} and MIDR values.  These values determine all of the 
standard architectural features, and from them we can tell what QEMU may (or 
may not) be missing for proper emulation of the cpu.  For comparison, look at 
aarch64_a72_initfn in target/arm/cpu64.c.

Peter is suggesting that if full support for -cpu a64fx apart from the hpc 
extensions is close, then we shouldn't implementing a property for -cpu max, 
but only implement -cpu a64fx.  (Because how does the OS detect the hpc 
feature, apart from the MIDR value?)


r~
