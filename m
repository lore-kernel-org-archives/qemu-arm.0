Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1200488ejc;
        Wed, 27 Dec 2023 14:33:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTVWSq1jS2jwsyGRfYXWfDtK5wQutBY5nFsJIYRyjEZTzvCcGX4A3XDAwrM/VB/mcYGyd2
X-Received: by 2002:a05:6214:dc8:b0:67f:143d:b8ca with SMTP id 8-20020a0562140dc800b0067f143db8camr17252914qvt.44.1703716401821;
        Wed, 27 Dec 2023 14:33:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703716401; cv=none;
        d=google.com; s=arc-20160816;
        b=Qek9QX90CbikklX7KOIFkfvWCtlcb77B29BdL6iJz4ly21CDNHFfkg3UHBJGM9Qonk
         Ld2keIWY7BoHAV/dAmgf+B1qHzBHJmS/qiBT1cyi7gmmEcNtTAhBjrMeIE44fl/ICZmO
         hkabVLp1n3FbJKE75eQEJjuNM7cQ1KJ/zyPz/RNsIHIpOIqIWCY6q8gTW7ZLmxlmFV8N
         gRRF0jSjWSg3+PDDmgH88TfjjL36Gf7FKr3CFsuIawcBJyLteG5I4IwbW0YZUUS+qgux
         zC03XA6jxf+cxIIS/3NP/R9+vVg9rewIu2S1XHlVzgS725/t0eMaOe5g0cSkYkHZt5//
         AGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=YVmNBzfd01K3/yqLIx7ADK8waWewlJixSbhMTYGpN+U=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=XKme2goN1IsgBBFfc1bG3sA2HVFZ8cp5o6K8pI4fGICF/Eoj747rN/Bq7kjVlDayc0
         vbB5mgAcluMV5IsQrI7khngyLGGi+GjT/fX0f8pq4cnbBAnm6wZvfjBeKAm/i5LDELAo
         WCQq0Uf39L+7Nr2oMkKcUgSg4wETI5ieI8xpXfk1CRHyHQJyVB0sUv7pJzXvWFeCtRaj
         GV1uG1fC0RSVlLB6W5ODtUIEn1s7xZk0thAN8ZXRZiJaHWAXws8RwO4SVutxOLUsMxAG
         vuM9e6I4BqPDxM/d1V9Cg7Q7P4ukht5nO3/HhaWVihJeHW1TvpwOTXbIc5evIlBDLsHO
         KGqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cuEBpBj4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp40-20020a05620a45a800b0077d72b6ab70si16418019qkb.355.2023.12.27.14.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:33:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cuEBpBj4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rIcSU-0003Tc-Ju; Wed, 27 Dec 2023 17:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcSQ-0003PF-PN
 for qemu-devel@nongnu.org; Wed, 27 Dec 2023 17:33:00 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcSO-0003Xm-3M
 for qemu-devel@nongnu.org; Wed, 27 Dec 2023 17:32:57 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d3eae5c1d7so23283515ad.2
 for <qemu-devel@nongnu.org>; Wed, 27 Dec 2023 14:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703716374; x=1704321174; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YVmNBzfd01K3/yqLIx7ADK8waWewlJixSbhMTYGpN+U=;
 b=cuEBpBj4fyq4M4aLKmC7O9xvV87gkEp5qp5Oy7Phl/bZl/1EsTXAPbU2idKjsi65Da
 CzwRbjr9VxwGVBWghzQSXZhDnxme8MYd2jsGVZ2G9FxoDnw1qeKoRnYhULO4eNtScVDn
 WfyG+m2i9dPsa/rLJ8ZG2eJRwfCQ0PLpbWQ07ddFXcP58KBZCDIh+zRqIXL9j9u2Zzbg
 t2vN9Sj8gP1lQQ+W5gLbw59aLFXS+HkiXfyUo5yia31+q6q9Srk9kK/OJ9SiQkqT3kjf
 VIrdboWdFOcz1ytFiYcRI0my8sAo0PX8Zrx7lWClpXpuzv2+yJ6k4TqoJseiwx9SZut1
 8TVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703716374; x=1704321174;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YVmNBzfd01K3/yqLIx7ADK8waWewlJixSbhMTYGpN+U=;
 b=AYLSMEgbmvtSSH873fcvblmPQptYG+3be2x20zZBqwZJjGUv1oD9hCWquJ8WEo6nPb
 3BzjQfXm/omd1dnk+rQo8PpJEfiAz3JaZHv64YMpUZe2p86r95casVoL1ra2Bz3ar9+D
 FKM9FkrxP61AEYeJH8dQ+p53J436z3aeBL2RB8dCRLEH0bNKMiSIdcEgRn5Fbq2GWU/Q
 yGcixPD1+Nyn/2Du9bqng8KMh9KCDtFHbzaZvJNVlTrTjlQCp5ZUDZA9aOOTCcW1IPBj
 Nf7o/PPpauAIDLR/awoIMRYI3tuzjxC2gyaM9EC83x/I09PRTNWLjkncc0R/wIpbLHxM
 u5UA==
X-Gm-Message-State: AOJu0YwL4U/MRSdu+7NfPocYG93gOvnu5V/2GSxJaR28v0e0v0Pj0tNI
 9LXeJLyT3xIr9gi3CP3QZmUsC33J5RUh1Q==
X-Received: by 2002:a17:902:ce88:b0:1d3:deea:f722 with SMTP id
 f8-20020a170902ce8800b001d3deeaf722mr4759154plg.128.1703716374568; 
 Wed, 27 Dec 2023 14:32:54 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902e9cc00b001d473e4f451sm3618340plk.201.2023.12.27.14.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:32:54 -0800 (PST)
Message-ID: <3f702bb3-5787-4596-98b9-5c61bc7618ba@linaro.org>
Date: Thu, 28 Dec 2023 09:32:51 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/35] target/arm: Move FPU/SVE/SME access checks up above
 ARM_CP_SPECIAL_MASK check
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AzAPYuojWAgg

On 12/18/23 22:32, Peter Maydell wrote:
> In handle_sys() we don't do the check for whether the register is
> marked as needing an FPU/SVE/SME access check until after we've
> handled the special cases covered by ARM_CP_SPECIAL_MASK.  This is
> conceptually the wrong way around, because if for example we happen
> to implement an FPU-access-checked register as ARM_CP_NOP, we should
> do the access check first.
> 
> Move the access checks up so they are with all the other access
> checks, not sandwiched between the special-case read/write handling
> and the normal-case read/write handling. This doesn't change
> behaviour at the moment, because we happen not to define any
> cpregs with both ARM_CPU_{FPU,SVE,SME} and one of the cases
> dealt with by ARM_CP_SPECIAL_MASK.
> 
> Moving this code also means we have the correct place to put the
> FEAT_NV/FEAT_NV2 access handling, which should come after the access
> checks and before we try to do any read/write action.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
