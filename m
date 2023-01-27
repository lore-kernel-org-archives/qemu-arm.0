Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp931085ejc;
        Thu, 26 Jan 2023 21:44:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8MROjs2Bh7th26YedK87+6QZNBJyi5GhAEmFuFVBAW+QxJmqx8dQ+29WXywc5gqTrsfUy5
X-Received: by 2002:ad4:46d3:0:b0:537:791f:73d9 with SMTP id pm19-20020ad446d3000000b00537791f73d9mr9731775qvb.21.1674798297828;
        Thu, 26 Jan 2023 21:44:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674798297; cv=none;
        d=google.com; s=arc-20160816;
        b=A4Vr+KQJsVGk7rgM2XVOAXt67rEtGkxq0wWYpN37QLhNo6mqM2Hjna2hz0WnlNQHTG
         zYJbx2cuDNyixPy2OffQhEYhIcy714+GGkG7pax2IrAKxmqSi9VyaK84xSd4mNnGZ3Kk
         wVo+li9E3Cs2AW6zX0F9s87M8LL3SZGurye+WqiVwlmXNFgmhmLXtH91tg5IHaWZci6D
         EHep0Zi8DDRXuOXlCvGlsyjeYCmx/A0ehvyOPjbfFXaD+gIU7XsOZqKTuUAYPhp8WXkk
         uiXLACsanVsDKSuHbT0IMq+vPBUmpiVe6mWvLmb9XBLeFyi4vsXInSBgzSBIXvMQnkOh
         K56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BnnaWcXKSjqSCmfAC54VGbd+t0p9Rjn7KcnhAi0yR8I=;
        b=XlYCXo6rFpuCvYYyQeJlaoCiWNkeQNBO0zBmyXLxppKS+FEn7SNtRnNzFEZWVR616l
         VMh56AVYKJaQGxAfyqqATZyLfsoHrNOhbiNyLVV2zRWLIVFotht11cBXjYd1Y/ZDd+hG
         4heuH3I4GnTU3uk41d9bDIf8/Q18EXkbKIAlRkv7KaePbOWv7fS6qZrfzqImvLEoIL73
         fQaF3OLAJdBs8Q3ihVKbJs86fMye1aHMTubilxDWfYbCtfqtS5UznlD0cnz0YOaO64xJ
         A3AwCVy6QxFwDOHSBo015oUBHXfswyfoY4tZ/Gy3n0NL40ykJ0B1sH9Y0KQ21ccGk77g
         ItEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXNoliyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020ad44529000000b005346f37ca19si2078993qvu.395.2023.01.26.21.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jan 2023 21:44:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXNoliyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLHXf-0000iz-Eo; Fri, 27 Jan 2023 00:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLHXe-0000iq-MP
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 00:44:50 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLHXd-0003Jr-3k
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 00:44:50 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 h5-20020a17090a9c0500b0022bb85eb35dso3890581pjp.3
 for <qemu-arm@nongnu.org>; Thu, 26 Jan 2023 21:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BnnaWcXKSjqSCmfAC54VGbd+t0p9Rjn7KcnhAi0yR8I=;
 b=hXNoliyxlgk/btKWyiXf4LLMg/BN00vOrrbdDza52Hx9do8fdsQGVdvOkmeTp3Vvvg
 co6/qEdsjchSSzzxoniwl29Xxgl2UVYKzOaG4Vtei0dYVIrsCmSKkCUOYf9twn94LitV
 mlsQ1IstmVjtFBj/B1BOFoya0GoRCpuFi1TOteCimJvjNFAQlYsJTS7zkOAgVhSSZ2uu
 mlVPAKuQMexbJAMV9uvD3/uJaCBMTC6Hrmqj0b28/7yIR8CGb09f0Va9Xt9NzVugil2R
 jX5uWg1gVzshZtlIYlaOSGZ9EEMyFv8Rb/xYE6DEMhIiALGj/X60Mlg8lSUz83yPX95G
 6xAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BnnaWcXKSjqSCmfAC54VGbd+t0p9Rjn7KcnhAi0yR8I=;
 b=2eBGsYZXF6+sgLerulVuB11q5jXftAPft2PJmn3X3tri0VkzonRNbWv+ZIYa4RKUGB
 iQwC8TJeCauC+VihPzKJD5LCQJepFnpZnVanzasUpgA6PnwzhGBsK9NDvJL0OQ5yjYx5
 GAhn75R+zzBgYWOa/oqmJlV5CutTj7GOZpCEBKPwlaRvfDGoJZicgmzPkvUNgL5ZwKfE
 t+Q6CP9iUFeTccKlld7fpb5oLWMiIgAGqlcNBr49Ck4tn+pdokaZYmsGr4QsLG6FnYrL
 n1cZgdLK3zqzYTlxmhtQ9mAFboI6Eb+WTs7hOTR8TNzDq1cH824gXtReBLN2kWbCBlgi
 000Q==
X-Gm-Message-State: AO0yUKX63SM4sOEwZeDf63M2x2xbMFccNpUYda5dyR47yh3hm9yBiGDa
 t9qHQByJ8f7OW2Jlh2xA/r9Elw==
X-Received: by 2002:a17:902:ce82:b0:196:4328:a02c with SMTP id
 f2-20020a170902ce8200b001964328a02cmr5258863plg.69.1674798286846; 
 Thu, 26 Jan 2023 21:44:46 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b00196065e8d78sm1928239pln.50.2023.01.26.21.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 21:44:46 -0800 (PST)
Message-ID: <89d91085-1f57-17cf-5046-834f94b114f8@linaro.org>
Date: Thu, 26 Jan 2023 19:44:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] 2-stage translation emulation support for SMMUv3 on TCG
Content-Language: en-US
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 eric.auger@redhat.com
References: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b6a1427d-51b6-0daa-c4f1-b1e8ea145844@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: andk04tpF9L/

On 1/16/23 05:37, Evgeny Iakovlev wrote:
> Hi!
> 
> 
> We are using qemu-tcg-aarch64 to run Hyper-V test and debug builds for arm. Besides some 
> minor fixes that i have submitted over the last couple of weeks, one big compatibility 
> item for us is SMMUv3 2-stage translations support. We can do fine without it right now, 
> but having it would also allow us to test nested arm guests with SMMUv3, which is great.
> 
> One idea we have floating around is implementing 2-stage translations in SMMUv3 in Qemu. 
> We can't make a commitment yet, but before we consider it i think it would be wise to ask 
> the community about it, specifically:
> 
> * Do 2-stage translations sound like something qemu-arm would be keen on accepting? Are 
> there any other use-cases for it besides an arguably wild corner case of nesting an EL2 
> hypervisor on software-emulated arm64?

I've recently been looking at the requirements for the full ARM Confidential Computing 
Architecture stack, outside of the core cpu architecture extension just posted.

While it appears as if Hyp (and therefore stage2) is not explicitly required, it certainly 
looks like the Realm Management Monitor should be using it (since the guest OS running 
underneath in Realm EL1 is not necessarily trusted), and I would be surprised if real 
hardware lacks any of this support.

I would be delighted to review any patches for missing smmu features, and coordinate 
filling in all of SMMUv3.3 plus RME.


r~
