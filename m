Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4479909ejb;
        Mon, 6 Feb 2023 11:01:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/X+RTgDQ6/nQtJ3BX393qnZeyXU+nZD9isMQX7ikBtpZpcrzfN3lqOjhY6WelBh6WDHARm
X-Received: by 2002:a05:6214:e81:b0:537:649f:747c with SMTP id hf1-20020a0562140e8100b00537649f747cmr277647qvb.11.1675710069423;
        Mon, 06 Feb 2023 11:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675710069; cv=none;
        d=google.com; s=arc-20160816;
        b=eCi960V71m2EnKPT3Wy4YuzQFV2TnKIGqQBG9zwzeYbERGQ8Ow9XMDyGhZIrMSg5kz
         7M8yS+GkkrIcsJJJluI6qlY3YYbEMKd1Zx/03P+WRrbR3apiZOHHfZ/BBvSrjbJ0oDKx
         jOS24TqnDJZmYFZ2ILrmdSPuS9HFf1txEVSq8xJqHjrxfdrQL1e+MbxGy3Y3rCzzUAgs
         jzPLRNK1zJmUEPUttVF8hv3AXppKC+5SGIP8JjztoE55DfFKuopffCxgtblBFPK1/UtT
         g5DVJNQcwHWo0cUsysVzgUyHTcbJ9j1e0GmPCOYxDkCa8sOhd/g9opnfvMRJ7RFSoJcz
         6X/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sh+zRdZjqnzdHsztzozyzvh2mHcmb+rVWQloRpkidLo=;
        b=GaEjKg42kcGh/c3+cweZ+B5yf+XticgdJpvRECD52CY0hd2bLEG1Tz8Pc/Dt+TDGO2
         Bsl3lAh4b7LBUoN0E8SZiI0YGrcLYLUwaCJjl4sxnToQ7o1m/Jws8CvIBGiXjXmW1B+q
         5NRBd10ZCNgJFC4Yp1VG0eGSGbPOv8r73TL9IFdbIu6Qw78AlHYhLyc/aNBaX/CqRj73
         cqUqf1MlUFMgWdlc7QIoPrJV082h8HiDW7lsLss3lcqAmDx5Y+zZkxDOjnd706ETT3f6
         Pen9X9fzPaUT6N0SKOmLeOygdY34vv0/E8RqPLycyWSW4wJE0+lCfhX2IBHntzEjZRom
         lJfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S8rRBXUw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pt5-20020a056214048500b00534c0382230si9626441qvb.332.2023.02.06.11.01.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 11:01:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S8rRBXUw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP6jb-00022K-LQ; Mon, 06 Feb 2023 14:00:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP6jP-0001wn-NX
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 14:00:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP6jK-00074U-Bg
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 14:00:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so11510424wma.1
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 11:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sh+zRdZjqnzdHsztzozyzvh2mHcmb+rVWQloRpkidLo=;
 b=S8rRBXUwf+vME6a7H6sLbKh4unJtEBImJfY+ltPgh8gDYbxCLktRqZSMVwLvYcMRH1
 1bAg9rbtu5AcYwEfvfUOD9hWlyNUMh7ePgeEhJ0StaPzJ5H+zvDGqlpTIO5V+cGqTSq1
 VZSYxB6ORi+pqwi2hZZRVojeH8TLglmtSDXf4rieh1G0oxkRb4u5myL0pPoFTgoVK5km
 PumefimQjJPlQL86BpurCCE3DV9DArBy4ApWAwz1KCeOukjzFvnRFFQcV8oZsW/eJWme
 l5HvcIrxagFzbmKps8CxFRKciyh5GLPmlEDa8/B04OkpRLAQG5hcdyS8A7jAk/XELmJp
 ZmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sh+zRdZjqnzdHsztzozyzvh2mHcmb+rVWQloRpkidLo=;
 b=jPQV+vvXaJoRoCZTgLy91rX0yQAAjTqXqcZqWro8wtIFm8H95arNQNjX59q2CFlSw8
 I4BA7//0Jr3xNpQY4MwC/9FZEsEo8svC3tCWBSf33zphGt401ukyu/UoioFmoOAsKHRd
 pRApx4sNEcyfAUzYAYbkirjLk1bT5nuOnY7i6j6HeTCqhUGr56G781mC4bTtBgdYk29x
 mOn2kdtHFHfFnfPf26Pit5QsBh6RjJ4rQfM/PSTY2yRt2Bl62tR9TYjfbl2K20TO8L1e
 llLMTpNK12V5Fn63AWM2NnEKFhX9Vs5G9+ILUA27klbS2grlC2WbrgK5ps7X4Gu/ts4N
 3igA==
X-Gm-Message-State: AO0yUKXVDNI6+DEMsT64Vq2hbEuL3cMWhneoVscTDriPhPux+a+HO35N
 Qh6vhJVdhBiPczKmx72y54VErw==
X-Received: by 2002:a05:600c:16d6:b0:3db:14d0:65be with SMTP id
 l22-20020a05600c16d600b003db14d065bemr667805wmn.34.1675710040636; 
 Mon, 06 Feb 2023 11:00:40 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm10957016wmf.42.2023.02.06.11.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:00:40 -0800 (PST)
Message-ID: <55a05bd4-5dd9-6880-2d61-22c31298d1bf@linaro.org>
Date: Mon, 6 Feb 2023 20:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/9] target/arm: Restrict CPUARMState::nvic to sysemu and
 store as NVICState*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-7-philmd@linaro.org>
 <888efe85-b495-41c6-742e-70e9a0a5dfe1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <888efe85-b495-41c6-742e-70e9a0a5dfe1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: hT+fKG8za7qA

On 6/2/23 19:57, Richard Henderson wrote:
> On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
>> There is no point in using a void pointer to access the NVIC.
>> Use the real type to avoid casting it while debugging.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> 
> This is doing several things at once.  The nvic interface change needn't 
> be done simultaneously.

You mean this change?

-typedef struct NVICState NVICState;
-DECLARE_INSTANCE_CHECKER(NVICState, NVIC,
-                         TYPE_NVIC)
+OBJECT_DECLARE_SIMPLE_TYPE(NVICState, NVIC)

This is a No-OP, converting from the older DECLARE_INSTANCE_CHECKER
style to the newer OBJECT_DECLARE_SIMPLE_TYPE. But OK, unrelated, I'll
remove it from the patch.
