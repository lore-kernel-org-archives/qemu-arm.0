Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp699736njd;
        Fri, 28 Mar 2025 11:14:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9NoZy3sKVgBzD+8fT5S8jSAzWGAHLHrD2Dzzo7Z9PP9KBg0uS+awDCWO09kXEdzxTTsp2iSZOAlUQ0A==@linaro.org
X-Google-Smtp-Source: AGHT+IELKWhupk5PRfkFGOnnf0I/uuKj387e0p0c7TPoMIB/+MutYZoVIvYyluMvT89SktFEUnYg
X-Received: by 2002:a05:6214:2248:b0:6e2:485d:fddd with SMTP id 6a1803df08f44-6eed517468emr8520626d6.1.1743185679867;
        Fri, 28 Mar 2025 11:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743185679; cv=none;
        d=google.com; s=arc-20240605;
        b=g6XVKi9fA5WXl8B8fch8Il8pn8CsEfSAsGg8lHqtS0Wtsn0fkOWYdtt2rUOL+4q3x+
         tE4WjzmL8CpH2k7wCDbrWqiK0RZFG3YbZoXq/XVZp/hKjxXRYd19gGQQXVfj8Be/+stO
         CYvturbn+3LEmZnmWfnIMmq+e1pBg/qi/8+k40MPEf2+zGLA4ptDJxf8UENsA4gca6+i
         jZqXoVoYBpjdRVQsxEkfEzTyDInPAi9Ukrd+rb7Alchacj0reJkr208XIrOuOgMAINUs
         mNRSCFbx6r3f/3BerD5K+leSy9khL/+ha/YHZU+6by8d7ZnU8dNYTg5BGklFlJCFuXBK
         +7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PWmjWbJTtIAYNYUQ2u82us1cHERqhSJInUITv5oEV0M=;
        fh=1zqluPBAJrQauR1QNY7q3D64X9R9YJPTn179fxZRjfw=;
        b=NKwVYXstRQQY1bI0D90P4SZxrN2gg0Bt9AbarJQmffot7WDSmVbxtyrL/3wk12yTgU
         QtwJliL86Wte7E4Va11Md/f1WyhfmHAhPNa4ge1W1vUWdRu1d0kPGDk60CLs519qIK3U
         ZdpOL/3Py0BxVkAdUoErk5bx72xANtTE5qLsMYHwvdP5pDeSNkUdgZzd1hXwpdF/9oHG
         +9fI/6P3WWF3BfKTF2PnnW191jt6cl9TYiWlwcG0w4DvrF/5kfo457ZQnbZ27oK2tdEZ
         1PuDgw4UGTQOH98mXAKcp/3peEoUimC61nbaDVUNiUmku8hWT7s2c/GMbQBgj5bZU7QZ
         rMYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cJ4Be6ku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec9788f2bsi21917416d6.241.2025.03.28.11.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Mar 2025 11:14:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cJ4Be6ku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tyEDY-0003vn-Fx; Fri, 28 Mar 2025 14:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tyEDP-0003uy-UO
 for qemu-arm@nongnu.org; Fri, 28 Mar 2025 14:14:01 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tyEDN-0006y8-Lt
 for qemu-arm@nongnu.org; Fri, 28 Mar 2025 14:13:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso1831071f8f.0
 for <qemu-arm@nongnu.org>; Fri, 28 Mar 2025 11:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743185635; x=1743790435; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PWmjWbJTtIAYNYUQ2u82us1cHERqhSJInUITv5oEV0M=;
 b=cJ4Be6kuc4IJzmpcuwFh+GjuXFuekiklw8XqAX1xs19ZUN8O6Jx1ir9Pds9Otldxme
 BICQjmmgIRtxlNeu1Al6SOY0xTkCX3qzXT4+GK8+FxZuBJRH98+JaFiOL2KB1pqrOawU
 +CDaYxiUWGg75EUdu+42uFZClymIXQa5Tec8iexQcDyroNnAuXlD/pe+N56pX14lVLTr
 hJW8c+M0Z7WX+2SwEiiQCA0u5qEz/izuEUsQh830sgaLycnZtpDld8Qwy34eavc0NX59
 UpBmkfYpJ0wA+hCAiZebAFjNUZHbN8QZcn6k18VsRRz7pwvGcn7Rzx4RQXJNnYk8Wtrz
 GhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185635; x=1743790435;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PWmjWbJTtIAYNYUQ2u82us1cHERqhSJInUITv5oEV0M=;
 b=w/OwXO73Cv+tKx8S9ZOJcNj6uHlGBjqZaNL9btdfhzPizPXUGCTCZb3+jTi63uqI/i
 SLjSuR7ommY0U8BQ8qKiJBE8s8Zw/8CzfdF3r8NDY99sa9z/Bh+yh9K8KZWqUlgHgWZb
 97/jF2x8NFcGkkP7PRjh1nzAk+jsg94uIDAocYB76hgySXbsRpFtIisoU12FXrf13kef
 WSk1OA43aLDoda+qZoaZ6QF2fLVyO7ffKIkTyzhyQNFFbMnD3WIWK7z4SO8KYS5EqLNv
 kpNFELnbLZ0LDbg2kBkr0kkxtojDIWmN0SNt9JHhbeqIfShcrXmd2npynH6Zzt8PM57L
 wUHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5jcCbDQNLHYQfUxm//V+plFxgiOK0rmzl5y1689/3jbKrp9gTX8khJl1pYhGRMNnTI5yHpsjNEw==@nongnu.org
X-Gm-Message-State: AOJu0YwIgs47rNftEm5AfPXnXwAOW0kqyckRhJ6AQ91+9p55QC/lWwbP
 PN2GtBNOGgSwO3fEjpD3si+/tvCN7ITlxTjJfwI65OMqsLnOw8kN8mUqNaeOroI=
X-Gm-Gg: ASbGncun3nUKnI7yOFrlypY+URVvhImvuPCjS7qvU2pgwoLkkuAPmHtMqA09uLKgaq0
 TPk/2c5NzJsz32KZ4tJM+elHoCrVLegiwc3I2Rl0IfgfTA4prJmwb5k68NdJRTWXTzxAKFLl9c+
 Iq/h4vawPxoZG44mKstkq1Vk+fph/KGsBeEkVOI5sMMWUfMcVKVOMpHZCbSyjwa/vqQ60H2yS+w
 8pFfKZ7ETelVNxmAbrehuNGJwkN4wsUuWWBxj6uCbNYwcEzzgQ51psng7uwpiOE2QzArAL2Rqey
 E0Z0WjBxER9OoqQdit5KGXo7ruTakkNGV161F3qGrMd0ddonYvRxL5q8AgSGCfQAWCP6IIUPkDI
 IXDHDCjD39xI6
X-Received: by 2002:a05:6000:4203:b0:39b:3c96:80df with SMTP id
 ffacd0b85a97d-39c0bf2a117mr3414285f8f.11.1743185635212; 
 Fri, 28 Mar 2025 11:13:55 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a4351sm3363741f8f.98.2025.03.28.11.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 11:13:54 -0700 (PDT)
Message-ID: <b4f50fde-b339-4345-824c-98abcf62bf2f@linaro.org>
Date: Fri, 28 Mar 2025 19:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: Remove semicolons at the end of lines
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20250327201305.996241-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250327201305.996241-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: 5rmOkq9dgGMW

On 27/3/25 21:13, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Yes, we are all C coders who try to write Python code for testing...
> but still, let's better avoid semicolons at the end of the lines
> to keep "pylint" happy!

:)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/functional/aspeed.py                    |  2 +-
>   tests/functional/test_aarch64_aspeed.py       |  2 +-
>   tests/functional/test_arm_aspeed_ast2500.py   |  6 ++--
>   tests/functional/test_arm_aspeed_ast2600.py   | 36 +++++++++----------
>   tests/functional/test_arm_aspeed_bletchley.py |  4 +--
>   tests/functional/test_arm_aspeed_palmetto.py  |  4 +--
>   tests/functional/test_arm_aspeed_romulus.py   |  4 +--
>   .../functional/test_arm_aspeed_witherspoon.py |  4 +--
>   tests/functional/test_arm_bpim2u.py           |  2 +-
>   tests/functional/test_arm_cubieboard.py       |  2 +-
>   tests/functional/test_arm_orangepi.py         |  2 +-
>   tests/functional/test_s390x_topology.py       | 12 +++----
>   12 files changed, 40 insertions(+), 40 deletions(-)

