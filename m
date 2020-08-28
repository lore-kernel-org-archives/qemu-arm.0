Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1776722lfc;
        Fri, 28 Aug 2020 13:52:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrWD4NbDYKBzHVQMsUAc9736DzkUvemHcxdoijmxy97f1Gc1+PeAam+hlc1ZLtNr+i7eCS
X-Received: by 2002:a25:640e:: with SMTP id y14mr4729728ybb.340.1598647954158;
        Fri, 28 Aug 2020 13:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598647954; cv=none;
        d=google.com; s=arc-20160816;
        b=HwLSNfS1fwkeQ/4D29kID9ddN9acS2B5BVhvgy/EwIlfJPS2UHNs6NUJcAeZkS3o6x
         6MUe4bwA5GywQQOrkV0bBPJKOg0E0ReXgWncjV24STKkdSQ4hP8m4oQudq4LMtbePMuS
         F2xpzIo5t5W0j252Wrkq/itv8p1OYjHtIgdD6+/8syFRtHpKmZjp0X7wbOeqk4UIWY2O
         te88LbZQiMeondHS390743MC0/yfntXwce0vJLAYK+GNul541PO2UTpQjMCv/AJE6L2a
         pZJ8DYLPQOOFn/EzxfD5cN83iK3EcfmrKZWt4rVZS97Gbn5lGXuXLPGxF/fKIZScymlD
         Xj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6HWwyRBboB3mXOi4/h8P7lQHZuPp1wXKHBqsje7IBFA=;
        b=wULxNKxZNmlV8vSlUmaB16WNYIex4QOr3fR+/gGBCEwwNb73ZYdn3J4XXYx3vix4TG
         oeH4s/TE4NIFn2mN8GKDsDQyZZXdhU4qFgdBHmfp5Gg2RbMaHGMS208mKbqo1HWOm6Hh
         bcewT9e3Zghxz+XTB1cXUbETad2aZAg/UllGKg+0qI8nskbb8fPbnfgy4QppTMKUMZF1
         VdwCElwToLFGlw4O/ooOdsp6Z2w5Nd3ALef3PcvIp+Dwsum9dkQwPUYkJXEMhm/uwhS5
         o3n2k1XhwTN8M2Y0YpbDW9K0avfTHkQtn7pPt3IdVaGkx7edyAQcBnGjALXKkILqfm0t
         vvEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dUhr8pRJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si387522ybk.233.2020.08.28.13.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 13:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dUhr8pRJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBlMP-0005fg-Jj
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 16:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBlMI-0005fY-Ji
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:52:26 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBlMH-00060O-2j
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:52:26 -0400
Received: by mail-pf1-x442.google.com with SMTP id x143so1250028pfc.4
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 13:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6HWwyRBboB3mXOi4/h8P7lQHZuPp1wXKHBqsje7IBFA=;
 b=dUhr8pRJGmHCSPokSXLw+NpQBCmrhfKW6/+nHaCz3b5GMpDnW18CZmzwgZOrzsScim
 H1KRvtE8zAVz9CXupD3JE5VP9oWtayarQtZiGrXb4vJktN8KYzu8jd8VfBE6ekfUVKnE
 5KNUNqN8trHuy0np8hLCKo6Cjdkcjm4yJS5f76QyRLvP0oOczAmXoVfmfyIrQdFNPhGK
 pK3VxIhNanBqT5ttSZNM7gNa4Z2htdKVYr1/tF22ZwhWg84VcDzg2UkemaEEbCiP40iQ
 jzaXTkgW7kYCPndVqOr3emm1KN8YXkdh+toG5JWq4F75/Xp4cuMOBrKG4BMEsQF+pK9P
 Jwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6HWwyRBboB3mXOi4/h8P7lQHZuPp1wXKHBqsje7IBFA=;
 b=PHkZcCoZziLP6jtKe8WG4D7Ff6B6IOGv6hH9GF/sr0BFZhwm/7oHWNloD8MWGhVFZg
 /9mwCPGXrJ+388jRh9JNye3SD/Nm6M997b/7B8qsnPLmeoiPmAy/rkHuvfM9NDbu5JZD
 YmZHoge6IcliT7obz7jgAHG9Dou9jW5irtW/tdgc7KhkU4lnwrFTFwAugnohSsA9OWEK
 pjAZ6PbGD3SLu3sHWbbOyTfBB0EDduAAeMXdXb3DFyHZ6OKlwOBUab2C50gWwzA2v398
 DnQdQZ3Zx9MvTDfL/xRArfHvbW3dBsN02XP9jAj7JJO/UiRS2JY12a1e+B4XVnVeevwN
 6MZw==
X-Gm-Message-State: AOAM530vLwrLeoiL0Fm6wLaMx7ATY9vQj91Fo5N8/Mi+Uv77urf4PPUO
 2wlzszYJMfGf/Bckx11LBIDKFA==
X-Received: by 2002:a63:1a0c:: with SMTP id a12mr464532pga.24.1598647943426;
 Fri, 28 Aug 2020 13:52:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id n17sm354972pgg.6.2020.08.28.13.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:52:22 -0700 (PDT)
Subject: Re: [PATCH v2 29/45] target/arm: Implement fp16 for Neon VMAXNM,
 VMINNM
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62ad0946-d2bc-e287-6668-df7a1196fd95@linaro.org>
Date: Fri, 28 Aug 2020 13:52:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-TUID: +BLEhgeZEt5h

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon floating point VMAXNM and VMINNM insns to
> using a gvec helper and use this to implement the fp16 case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  6 ++++++
>  target/arm/vec_helper.c         |  6 ++++++
>  target/arm/translate-neon.c.inc | 23 +++++++++++++++--------
>  3 files changed, 27 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

