Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1895907ejc;
        Mon, 6 May 2024 15:34:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbcx36IFQbfpw4YWfrgK4xUz1RFvKyNDHTJML1muKH4RaQ4PC+voXgPpVRl/0D4aeQlocqhJWUjyp7/ziGQit86t65d3zJ
X-Google-Smtp-Source: AGHT+IEG0gbce/FNxlC7rBvQ7uaKXGJ7yCnc2ICUKNHZ3lVYRDxPtL+u1fZMMEEHfLihual0Anp9
X-Received: by 2002:a05:620a:2a0d:b0:790:ee02:1425 with SMTP id o13-20020a05620a2a0d00b00790ee021425mr14116736qkp.1.1715034847170;
        Mon, 06 May 2024 15:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715034847; cv=none;
        d=google.com; s=arc-20160816;
        b=DrJ5Vs9ALMKR1ZKQFvnxzno7PplDZoGhtvrjf4z9i/2SAmDeI+Qu9dY4RZkLzgJfyi
         OVk6DgqwMxsQFOwswjAUnArqHTsbrAYrurnbPv7DBkYiNAl+Mde1R4csJY/t+QSZUIaW
         DE6oeA3OKxB4G4ndt2ufnK7CZRIqAUQbJnLSHEnCSVbXgj860wfq5ch7Rn6HvV3O5G6H
         OmQr7dV/DW+wSZgn4jvvGscPe1khzj0pE3q7GGwoPK+SLsPl1D2vpPub0+AQpzWnLvvV
         L+/BBOCpNR5OZAofooWpwor05eNWAUBBpyhVyUGHpR4bXMaH6g7qiUI8bQAdX8M9JXxa
         WI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NKZK7GhS22Ca4xYjYmBUZmlou/jP7ZyWM7qv7q9Fwhk=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=tUDJWIxGR3ntVzHNjxW/dfG2hcQi4O2KbDVy7Z5LSSmSFnIIraOCow+LxeiyUcyh5d
         +AGBofVRkUWLxKBrA//HixUjvAWHiC+rObIKNBKWZGplLgUPoqTqJDHKTnYIpWD3DW8P
         nTIesSjT2cW/le3x91OXxKLZbk90Dx4x+Fe9f2V8jJ+DXO2OCTuRSD/pvxRVpmvK10TH
         7VTHbs+CBdQLF1X6pFq6l1HxU45hnf32SCvkA46Au8LMXG8zNqgJgIYur3NW3qcWOz/y
         p2GGvJ+HE5ko/6uyLmPOdL/5yE4zPfyCFxwBcq7jX1/xiX53+nyFld2ZG1URmWbM/DV/
         aoew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UjR9zyof;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv22-20020a05620a1b9600b0078d5e891645si11437325qkb.616.2024.05.06.15.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2024 15:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UjR9zyof;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s46uD-00037D-Um; Mon, 06 May 2024 18:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s46uB-00036Z-5T
 for qemu-arm@nongnu.org; Mon, 06 May 2024 18:33:56 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s46u8-0008BL-Kb
 for qemu-arm@nongnu.org; Mon, 06 May 2024 18:33:54 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e0933d3b5fso31809431fa.2
 for <qemu-arm@nongnu.org>; Mon, 06 May 2024 15:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715034831; x=1715639631; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NKZK7GhS22Ca4xYjYmBUZmlou/jP7ZyWM7qv7q9Fwhk=;
 b=UjR9zyofrSg2lflP+V1qug56Nb7aMiJYM2ltUt5nMzKOaLq3PYat1PwacFMW2s5owE
 7nHu+tu7BxXuad8Isegq8HmtCuu0vXon7kEDwaPFmy82F/Yuw3lAWbA0lNUY5uQ9358k
 //gx+AErIpG8OKnGEMQJRvZACOSSrFQCJdRiHI84x4pBfO5mPPmBVBYfIgExoS3CBZJ/
 PpkU7WsWSs5qHET8oZ+pmoCiK6zzD9Mws96J9yj7CDxEkPpmwWObHTND42hSRGrMuKtm
 yPtuLYWYgsxDoVaMXH3WfwyUfYB2GZi5cUt+1BMdJd1ecrbCOrwdNHb8qltYvpAp55y4
 iUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715034831; x=1715639631;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NKZK7GhS22Ca4xYjYmBUZmlou/jP7ZyWM7qv7q9Fwhk=;
 b=ZnxQrClpJ20GblxIWwLv1gAcbTIdIELAHP0PjtrMRkS8gzO+D9BLlxw4znSiFTuiWk
 Shb2yX4rK3IijKJsrBoJTiHoabhTcCRlU3/2yNM6iJSZZwLptsoElvhTHf9tiHnXhux7
 mrjeHIcl7narPROwZC2hgAl4xLrMUTV7ossqOTtpBkZQy4AAbx5/A1sDHeTZzRiUiHq2
 NyfGweZy5CdQ19Ftt1TyUmLvLpIXTvxj7FOUMQYpCLFtkFrexBTWaTCSrlO1T7u4e/kY
 rvaIfXdDr9TQH7yhEx309GHaGC2Fe3Uq8XAhHPmTdfkrIhSsSqmexLv5q+nFShEemdKI
 t2pw==
X-Gm-Message-State: AOJu0YxxrQ7YGPWJGJ9iQKyUIBIuvkCvAx8soF+7KK7FNp+QPbYyK9b5
 dsu38IUtqCngW5d0VM1DU5AtOxMgLqNi67ZbJbHLnM0w+/vgYjv/6kpR2lt5fdVILtK0iTM7BCg
 V
X-Received: by 2002:a05:651c:553:b0:2e2:12d1:bd6f with SMTP id
 q19-20020a05651c055300b002e212d1bd6fmr8181066ljp.46.1715034830749; 
 Mon, 06 May 2024 15:33:50 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b0041b61504565sm17609419wmq.28.2024.05.06.15.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 15:33:50 -0700 (PDT)
Message-ID: <3b612068-e407-4e3d-b344-6623268f262f@linaro.org>
Date: Tue, 7 May 2024 00:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/57] target/arm: Split out gengvec64.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240506010403.6204-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: R0izhZTptQkv

On 6/5/24 03:03, Richard Henderson wrote:
> Split some routines out of translate-a64.c and translate-sve.c
> that are used by both.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.h |   4 +
>   target/arm/tcg/gengvec64.c     | 190 +++++++++++++++++++++++++++++++++
>   target/arm/tcg/translate-a64.c |  26 -----
>   target/arm/tcg/translate-sve.c | 145 +------------------------
>   target/arm/tcg/meson.build     |   1 +
>   5 files changed, 197 insertions(+), 169 deletions(-)
>   create mode 100644 target/arm/tcg/gengvec64.c

Reviewed using git-diff --color-moved=dimmed-zebra

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

