Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3864404dye;
        Wed, 2 Jul 2025 07:49:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgPYtmwBfSilfHy5XCtGxIch4IQMI6PXo7oPOvhS+VuyJTlyZJ175Hl5rGJ8V7zgDW0B0NeovHKQEaZA==@linaro.org
X-Google-Smtp-Source: AGHT+IFm1NKa90rTRUAaO6z4oZKlVBvn0vV6XySpjO7UKnbxxxT1SAOJexXB/fZdmv8gWdbojo9i
X-Received: by 2002:ac8:590e:0:b0:48b:4f9b:fcfc with SMTP id d75a77b69052e-4a976932409mr44803841cf.22.1751467742872;
        Wed, 02 Jul 2025 07:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751467742; cv=none;
        d=google.com; s=arc-20240605;
        b=TqPIQgYv3eVwOmhMSRC8yTjgC9vGlnI9BXHPnGMImq91dyPpqiV6jvleaPlYq8p/Kt
         GEwwl4oKDofyYqwGawa4H9VJFQ8QHvhNmgMiUILh+9Zbeg6NxDzphTcr91+eX421K0Ff
         5/Yc0qxLOIsMTX57dLUvm8H0G6xSVdDGc9sznGxujFkq/zhkJP7ZXYXYjIC6E7/dE5G/
         3/lLjsESWdAM+dXAImKpsLz5SfMeD7mZWA8HHRNKyqQ+WxwnSCEvOOHJJsLMZhp+sOYv
         hFTXVO4WK7Qgi3X6p+BtD1AyTbJ4EqxHDLttukPQ3YfU63O3s0FCoZ/0A6gcaVUv86a+
         xenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BspX5VTDt51GDPvJ9KkTMMhE7EclRby1bg8SbnA2MYo=;
        fh=K8RmQkZs2I9zle7Aa5z0l3X10eJ/FTISqvukTovycCQ=;
        b=PumQ/5VCQf+09MeC8ogKpZ0DH9sItoYe+eEhV5BBK1XNFKW7JY2lAwt66bEEpucE0y
         D2rTYRGiSRw3kID0DjRS9qJIqKhxwed6ypEb+QxvskzXZSZ8CYOW61vZKCeAXNSmqNS4
         SHPAK0Ob3/jBiDYNs2HswwqxJ89fAIYu4O2FPUvcyb3R8WM75u91H2Oj39844sBgo4SX
         jAFKvJ3+yrFGN+eQcwUaLpVvmmdsiAeZTdfV9gdRD333gSIWt0rxW7H6EyC6oF6geXsl
         h7tm6+xNnWvE1d+4QQ6UBohe+CvmsDgau/WbeeJw38GBYx0r2ig0hrREhiTBkDneNvBs
         U0Eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmjYwxN2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc232c67si138860271cf.317.2025.07.02.07.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 07:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmjYwxN2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWylW-0005Ij-VN; Wed, 02 Jul 2025 10:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWylI-0005GE-8N
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:48:36 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWylE-0008Ey-Gh
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 10:48:36 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-40a55314d06so2360534b6e.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751467709; x=1752072509; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BspX5VTDt51GDPvJ9KkTMMhE7EclRby1bg8SbnA2MYo=;
 b=DmjYwxN2VUSePgaYtRl3nkGAZDr/j9vnHtNEuvNzM0HQMZSlmTvp6E9Dar358cqdUN
 9vGE0ENnwq1ckMFuAeScy50G6GggC0Ku0zNJH87Y498GJMSfVUGDvs23YGxIYstPZkQD
 UVvQqpv70xQqDqlC0GflwraX7UsMpRP6oy5uF7/h9mwRnpJT5FnrmKO1Xaf12+rr27og
 Vxqx9tu6SiRFi1zWxZu8ehs+JgBj4QnIc/D7gDr2Kgn8yiEkwMqvH9oV64M86YTVn1jR
 2dQ2uf0hMLF2fQvUVWfITKHzZ2LJj+xBfoEqB45m0UWCJN1a6i8MJGuP8EEyeJahcChg
 nZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751467709; x=1752072509;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BspX5VTDt51GDPvJ9KkTMMhE7EclRby1bg8SbnA2MYo=;
 b=RWmUfyhTLlg3EE+R6dTigjt/J+ipacqJivxsfMeMDQv8goP9Mk6VLoPovssw5jFdxV
 CLTb95VjYf+ifyWSQkgilLLeiTgbfVgFkGerOK0Zh69gxFRCb+8ERywuW9tMhu5GcbZ2
 xHlcT29CdRDjMdcsLDt4yAKpvKmaQ+BjbJkU3JXllpzhpD70nwLne1Wp7JfgpOrl2hzi
 kSn9vrlVQ0vQ51ryL6lbjXC3TgED/sCQwVBIpOnM+j8Zdp7s+hlzchPGgsKAYsAeQtt+
 pTcKLduvnDnEO90LV1PO808fnk6DW6zXqNzDxm+yuTbTz7vCbkd3a3fMjM3HLWOyv/F9
 aE1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0coD5+5cijYWn+xrtpNjcsQkLaCbe/otOP+QwQHLzyamI/m5sdDUOgAYajWUaqFl0cHr2Ch5dFg==@nongnu.org
X-Gm-Message-State: AOJu0YxAJh2IYtDOnzAUz7HDjBWySBJXnJnjDvAHKX1PAuFCDhSPfivP
 +9YSzbbvKwoZ0v2xuwLrJsMuFck8iHNfohG1rz6qSx7AiGwGhKtwgFgMgv5jmNCFtsk=
X-Gm-Gg: ASbGncuYTXzdHxa5EqrdZ9lvGm1unTQEUCUIabrdoI1om8Z0uveBL7Cc6mQrh0zhspr
 srfg31AJhYn8VnCEu48DQjfjSIf2+c5KsdrjSGZUMj73MTvJtLcNXTzDHIe77Ddrun16hYNvdMo
 NHwyCVnmxKh6/UOW1VZRsVzKeP6eW4SUufFKmfFvdJJMX4rVY+TW5SAjBfH/jk0opuc19FSa5Xk
 HoP+fhzl0PHZPlwALIiU3vJYiPc9lBSwsWPMGH+MiuHYnd1kiR/TmCZ4PC/Zdofk9mV0Z1nl/78
 YhwgfljSJ5UvJGY1d1x133wYQnx+T9SeqL45ET7hvdiL38aaJn7nqfCaKv10XRUDeyDxuemObpR
 u
X-Received: by 2002:a05:6808:1406:b0:401:e98b:ee41 with SMTP id
 5614622812f47-40b88e0f17fmr2622540b6e.21.1751467709591; 
 Wed, 02 Jul 2025 07:48:29 -0700 (PDT)
Received: from [10.25.7.74] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40b3241f829sm2569909b6e.35.2025.07.02.07.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:48:29 -0700 (PDT)
Message-ID: <89c4b55f-1da1-4d73-a6dc-0adb7cc68bd0@linaro.org>
Date: Wed, 2 Jul 2025 08:48:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] target/arm: Fix VLD4 helper load alignment checks
To: William Kosasih <kosasihwilliam4@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
 <20250702111954.128563-9-kosasihwilliam4@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250702111954.128563-9-kosasihwilliam4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
X-TUID: G90ZwDkSTcZG

On 7/2/25 05:19, William Kosasih wrote:
> This patch adds alignment checks in the load operations in the VLD4
> instruction.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
> ---
>   target/arm/tcg/mve_helper.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
