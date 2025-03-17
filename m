Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2334189njb;
        Mon, 17 Mar 2025 08:40:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFA5VcyS5aoqb1KhQUXbwz26gFWwUZ4jJzaUSSxDhvYLGstazT1ybGAWeSAba3HPSPSd9R9IUUlNgMJA==@linaro.org
X-Google-Smtp-Source: AGHT+IG7ot/8iI9ETNhLhO1hMcrWTdwUCfdg8DPDYEEU0QdhpSxSBTrtYPavMk1PEStZmljVPCgK
X-Received: by 2002:a05:622a:64c:b0:476:850a:5b34 with SMTP id d75a77b69052e-476c81529a0mr186980861cf.30.1742226002549;
        Mon, 17 Mar 2025 08:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742226002; cv=none;
        d=google.com; s=arc-20240605;
        b=frlE1/rICdm1xqK/ZR6vZEjIcUs9HUg09cC6Ww1FGz/qRSNXGHVUY5190QyaKjmxxc
         H07DRu3FPMF/MeYPwCUsXzOKUSyEghYHf7CtF4XXHsPyQspETF1J10A4HWarEgaq9H2B
         4Y9q5ZL6wuDhoiX6NCJwoinP9kZ4dPd+atCEIjF0KNvDUMQ22qpAkTvZlrfeHKybb+uc
         Vs2CqjbvL1fCdXpKqYOBf9t42i/DHG/FE5YWYzMhUkzi+uODTTpKrCMmY+cxAjlf5bL+
         XMfo5cj8v5F5USbkDBuKYrJudUoiIXaolH4DvjKo7qcd0eN8ptjlDPVheB1wHpgw+y5s
         55XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=dnU1iaIjyphAuTTJ24Wz/YJtJ7FKCuQp+pKPpgYiNA8=;
        fh=FbbZ6EWy6DBaXEKyOvgFOCXMMnVRsrPnHKoATksH3y8=;
        b=CX/MQkrqFH4WtsNfT5A+uvfjjB5EQd+0nJ5WOMyYbFtGoTNdnV5o9CgGX7a4rgLpGI
         9/WnrqWmvT3tb5rA5k9QB3vbsSkqZpWWvLTpP6rOEEa5J6HfcBZQRYnLyNgoEf9iO2ta
         Itm42/VAjxUe3Ly8H00DFOaUntvIkiVPCrbPBrb/m4JsqgOe4dP6DYLQa/TlxXhkxbbS
         jbNd2uzz4BeGrvyGypQhWpQvKlhTAWlcLFh7ziUSn6wABh6UViD+9qY3p89oH5joBs6m
         m2X/r8ENJM6JRhNYyaYLKCJV7DtTUi2+a8vz9qcnLochzktKAmc/2S+K2pnfO4kQu+nP
         XVhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wr8ZrRoM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb885abasi102877621cf.662.2025.03.17.08.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 08:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wr8ZrRoM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuCZG-0001uU-Ha; Mon, 17 Mar 2025 11:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCZD-0001oj-FA
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:39:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCZA-00061z-Pm
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:39:51 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso22653995e9.2
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742225987; x=1742830787; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dnU1iaIjyphAuTTJ24Wz/YJtJ7FKCuQp+pKPpgYiNA8=;
 b=wr8ZrRoMoI21f7T8scilD0mi4HbFigpquG1ZYv3ddT84AGN+veldmifIY0TIkXXLeJ
 Fd1tFEyZqyzZtqRb31+RjSyCtuuedEqm0cG+cc+ylbNXwEdV30btG5MiRR0dcQsm6bAs
 y4ZZBJwGu1P/jJ6ZR/EqR4QOskAxtIAvry+RbXY6RRNAbpO7TfuWP6a5Zw1MXQzuYJ4/
 ES/1Ua5XpMwle/1ZJ/qSKDaMpz4qcaZFLZAZWoXEe9o/ZXRCuk1FicecYT1jd6YGukOb
 GTMNJ3QQdzlJRb4hV83VAvb8MwpVqfyCFLKBNPjD0B1CLlF33njbc946eAfjFgNJiG/8
 LRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742225987; x=1742830787;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dnU1iaIjyphAuTTJ24Wz/YJtJ7FKCuQp+pKPpgYiNA8=;
 b=rqQV9r86CwYXNQUNLWZk+SvuRMEKKG4xt3HoMSMbz4JUN7Dw7lKBU+tmV8pp3TdT+q
 7WKTzoiBCXlkXjZmJ5qPt/uyl5o4+yc1qGyCeUXWYRdKBzNM79sEwX+TitjBnvbUXgdO
 +gU+q+MkO14Hnd1Uu2SqzsjEa7wbQyBTmqkgQXqcnqFvN4mAvVQ6vlD91WAnCR19v6Jw
 R/BMZf20U4jqvBOEGhmepisiNzNrVEQmXfMUJvn87TJ0TDzfxuIne4pvCYgqNIcr3M0n
 vsA99FFYCZEq3PGEPgpv4PVR2KY0uQ4MAf//S20HNJQLOf7dwHPCb94Em4/IWkqi3VvK
 dE4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Ko9ddWmscuNwZdjYNR6lihKsoYYV3T0VrFE0VmyKqeUtfo/aQ581X7ezRvEFnFUaAwjfsb4g3A==@nongnu.org
X-Gm-Message-State: AOJu0YzUkdAcIFVTYjvgbDL1PaMYTfaMKj9sXZkSkS2nX/yyf6+evKC/
 RJuYB3Qu1xrBYA/3SxOFL23Vrnfl8hLRvr+3N5vH3FF9Xs+7rXIWvZLlifL8D/iTBu0YzQVsfwL
 Z
X-Gm-Gg: ASbGnct9GVOmotPQnAc86DUNUxN0yIZsbwzjCKhy09KTSVkvR2uDQvNLmG2B34VWnnb
 btdbZ8fW1Eb7EKEYZ7uu3gcGHiBdbn7sVpuAnxSrJBJFakHhnDpg1E+0XCpzOO63qzI7GwXFOli
 eGI6ctR87zU9uqvcz0Ku+RF7YK0VzMatwjzvEBTnRtVFvJbXXglnr622PgSs3b5JbFBs686b5vx
 KWwn7BJA1g5/3XTnXQqV72zAxgtuSQuatT4WOAlN0/eqsn82miJ1YUmZuaw4fxWzsQ3omyZ14q4
 MuO6GR/uB46gmH1ENCfXGUKKRz8wSQo1m9d6GzDkgVcoRK6CC55fX4h8SN+09+VEhLvH+nYG2V5
 BlQlx1rwXnw==
X-Received: by 2002:a05:6000:4011:b0:391:3124:f287 with SMTP id
 ffacd0b85a97d-3971e2add48mr12939402f8f.16.1742225987020; 
 Mon, 17 Mar 2025 08:39:47 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318afbsm15770725f8f.72.2025.03.17.08.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:39:46 -0700 (PDT)
Message-ID: <77a5875d-f9a7-4eb8-a090-4863ea9af36b@linaro.org>
Date: Mon, 17 Mar 2025 16:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 9/9] target/arm: Remove TYPE_AARCH64_CPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-10-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250317142819.900029-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Q+CIce/j1I6b

On 17/3/25 15:28, Peter Maydell wrote:
> The TYPE_AARCH64_CPU class is an abstract type that is the parent of
> all the AArch64 CPUs.  It now has no special behaviour of its own, so
> we can eliminate it and make the AArch64 CPUs directly inherit from
> TYPE_ARM_CPU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu-qom.h   |  5 -----
>   target/arm/cpu.h       |  4 ----
>   target/arm/internals.h |  1 -
>   target/arm/cpu64.c     | 49 +-----------------------------------------
>   target/arm/tcg/cpu64.c |  2 +-
>   5 files changed, 2 insertions(+), 59 deletions(-)

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

