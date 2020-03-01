Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1546697lfg;
        Sun, 1 Mar 2020 09:48:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqz3Ex1byKwdx8TeFhXp67v98NABIB3oCYb4J3M5adW+j0HnUvCvW4GkiAjE8HfYU9LpNAMK
X-Received: by 2002:a05:620a:1092:: with SMTP id g18mr12800330qkk.80.1583084931135;
        Sun, 01 Mar 2020 09:48:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583084931; cv=none;
        d=google.com; s=arc-20160816;
        b=VKZ6Htv8YHpq+eeq+dxoj//Y6RJGgjp2+owvBNeFTwz1Wzqd29wzk0GhGQZgFeJgOa
         8Ogc99PhhkrCNzJZe4f7s/3x4D+GpreI2Eb4R7D+0lNghgE+nFGiRr/beb0hRzAYygbm
         GsirmXQSUMvHAtKCWVtUFG7uh7wwhh5v3ufhmQ14JBJ6aeB2bTbnj/bECJDeMgBIk+bL
         MyNnOSEhRA3a60D3M7eL+tfH8hI1PzKyNc8oz8xn66e7o+sLc7oS5let8I9cyZ82mn5v
         EGHCzvp067q2rxIvAdzWtXAkCGWDHoqqhCnDkJwBP12RAnN/CPF6d1463byWTDyNGW5f
         QwVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jSlNKAMXmss8EhwJSP52lcTwTCKmOg/RvpndiWjJpRE=;
        b=TWPCRr5jjD36lrQxBKNCvubmLnM/Bpjro3/JlIQkK/ZASbnVZMtijYAjkVkYAToEsg
         wVGXRrHl0XRR1um5/1ejK5HMQjYsbwEPBn6d3H0RFvFPV1/Izuwm03mEjgkV7xy2xsnS
         1P/0bXL2h4kUGEM/vh0eRTj1PD5c3sYQz3XWNpTRHTWPQzk2Oflw+ecB0rwxx61a+o4j
         9MG1LyiWO0W+CqmCPWpAKDdXICQpumDH/eGJKEtWeftBVv2tDEkrNs4zUqEcwXVOxDih
         AYhOetvU5bY0iaAfV3V2simLWhenkkroeP7yMO3GzUbDDFhzlTgHBwwocC3Owy+1bZDU
         dXzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j+uXBj3k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si4157399qvs.186.2020.03.01.09.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 09:48:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j+uXBj3k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8Shu-0002CC-IA
	for alex.bennee@linaro.org; Sun, 01 Mar 2020 12:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8Sho-0002Bu-5z
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:48:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8Shn-0007mC-9Q
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:48:44 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42741)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8Shn-0007lu-2a
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:48:43 -0500
Received: by mail-pg1-x541.google.com with SMTP id h8so4204841pgs.9
 for <qemu-arm@nongnu.org>; Sun, 01 Mar 2020 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jSlNKAMXmss8EhwJSP52lcTwTCKmOg/RvpndiWjJpRE=;
 b=j+uXBj3kH31K9Dh2+SunVrj6mgli2QKyvg1WLdnKJicNr7kKxTvI9ea3MWb2NJiRyY
 nTIxE8B1ZXLMe8aU2EZHsWKPsAZVn//cPbpxCRcXXpwOt/q2kdoYdC0CJbykDyWh10lV
 BSlejWTE7cgovW5h0DQQyPYfNqTDO3fxeBRjnCjv+wruJxIHi1p4Q0QmU6naDQWS2Rxz
 qf75KeBslqMlMpMlJMsz3IN8fMNTXHmzL5Ne9lzwLSOMxYNFK9kCrdnNXq1074FoVVb0
 uWqCoAypHLMKqmM2YhSMXbnx8NlQLuz9RLkoJwVocRawsnuCjr0LsltwRKJwu+mqWPQw
 2Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSlNKAMXmss8EhwJSP52lcTwTCKmOg/RvpndiWjJpRE=;
 b=mOki+Kkh+o5KUTHrc9aHNoWGbXhVV7lj3iM0fLT4LUpi7X5x0HtoCRMhJ073K4PRHt
 77fgOPlpD++DrnbB7klou2iO5h9v9/siADpEoAh02WKbDLqb/9fs1YosZu1YCj4/Swat
 N+1VITyveYHsVQGwPKIJtFkk5QhzVNNf58FD4ZVv7GWS6jqxpKhGWxPOtODNCz9ttAcm
 HvWuDb05aLBo+3yaUKrXfMXHXj3wscAUoD2GB7upayexHKGGvi+59zW/2w+ByAqmktX/
 TmYfPIsXA5wdKFb69Sk/JVSmqQIPwMro+AVUO6FYzkan1OWeP/oNqhuQOoHlfjRWqflh
 uJXw==
X-Gm-Message-State: APjAAAXfTIS8UoIfD3Nm09x7y4yZCQKCOee1Z41QCNgUrhz4xL398IgJ
 dYnxYjwY9iTxgYssp2OHEXFaTg==
X-Received: by 2002:a63:a052:: with SMTP id u18mr15616653pgn.210.1583084921874; 
 Sun, 01 Mar 2020 09:48:41 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 y1sm14596637pgs.74.2020.03.01.09.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 09:48:41 -0800 (PST)
Subject: Re: [PATCH v2 3/6] hw/arm/virt: Introduce finalize_gic_version()
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200301104040.15186-1-eric.auger@redhat.com>
 <20200301104040.15186-4-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d887a5d4-8142-58a7-b500-c18ac3b78905@linaro.org>
Date: Sun, 1 Mar 2020 09:48:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301104040.15186-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kW4dsq03QdbI

On 3/1/20 2:40 AM, Eric Auger wrote:
> Let's move the code which freezes which gic-version to
> be applied in a dedicated function. We also now set by
> default the VIRT_GIC_VERSION_NO_SET. This eventually
> turns into the legacy v2 choice in the finalize() function.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c         | 54 ++++++++++++++++++++++++++-----------------
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 34 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

