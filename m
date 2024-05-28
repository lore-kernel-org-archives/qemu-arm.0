Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp27767ejk;
        Tue, 28 May 2024 08:26:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+1Myrngsb7rb+Tf8grABK8W9M5aTEfGpbcidf0DKskCr2Uye3ow6aX5y365do0Xc+R3qj9R6cQ5DRO9gCpjsA/oJqGgq9
X-Google-Smtp-Source: AGHT+IEmFEhZtVJkoD/zhsR3U55jwigUlRgi0szYljQt2s6bJvaQ+zgNnAreS0244QWXS5ph/AP9
X-Received: by 2002:a05:6102:244c:b0:48b:9258:9b37 with SMTP id ada2fe7eead31-48b92589c1amr1573443137.35.1716909965195;
        Tue, 28 May 2024 08:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716909965; cv=none;
        d=google.com; s=arc-20160816;
        b=xehTV4bbHRxgyEyJzSuBPtMilhL0c7h5Fj2DFCBZmekSQopMqd2RXfe8IPzkfc8ZE7
         ftPK4QdV4Uw9W+dGSsvfcZBSfmnDN2xdCZfaKH99UNYKIx9nfJnt9tB3vFkm+9/ZHw14
         i6tT3ZXkpDyQwxZOcyHH94wPRMpon52X3tGXF+PXkhRCF+8WOcNBeKVLcSuozs4MTnPH
         xbspS87AwLK6aeURk1vBZx6E9E6gdEknpC1kzyUW/aOJ0cOx8ECc20GdJx0jQ8oDkduB
         lnaBxzl4GvguH8DRAbXsiBlS+LVRvtemNsEOA9UREazRjutbqiJLLdw/PVE55EPnc85l
         p67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tuYbUX0jEKAJo497J8aCi9EQcdhBOOBJ9uU6ueA4eYw=;
        fh=8XCpCLf97U/YxILO7iUnA5k5VHHiVk3A44VHqQ0iIDM=;
        b=WXvMg3pF7tNkHHgPnvHa+RJ/RJnUEWi0g9QWBBY9IwlyFRybxj91OltBH+93t2URST
         +kpk9LuOQ4mrjQuI08PYvyd0npqMqfok4oauIAx7cA7+2fnmnpWSQdEN/wLKq+vD5wRd
         ZJr3jucwmczkavBDPCOrmIA8QbqMBJg/6jPHaMvkBIUgx+T8t/U0GcS8p4Wg+uDexsKx
         P6yr6AqN/A3BkWW3XvYk5SH4Ydss8D0pf5HlwPdFfszUK3purpRfeGOt0vG9n5ShZL/z
         2XgLuW5JEfBlz2/GZHX3XuWV3MFIxtyEs/7aF6h4c1+3n8xrVRTXVRnX138NpP26cUBy
         LOfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9tyGIwA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48a3a399486si1748426137.572.2024.05.28.08.26.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:26:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9tyGIwA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sByhm-0001q2-1I; Tue, 28 May 2024 11:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sByhO-0001kJ-8X
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:25:14 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sByhJ-0002W4-Io
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:25:12 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5785f861868so1317941a12.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716909906; x=1717514706; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tuYbUX0jEKAJo497J8aCi9EQcdhBOOBJ9uU6ueA4eYw=;
 b=e9tyGIwAvx5iMoWI8G3mnNYl1sV8M0WOOpskyr1jGGzYSvyeZ37+groFuaqdyALw/P
 X9v9E7GehDDZWsFAZzt3xxSOl2U3f3H4vJNJTvHNMGgXpa6YQUaenaa6igLlnbK0BlSz
 t4dYLloJGK5C52XeQEr0k2hVBDUYs6BVZ3Fj8QoAZChb7wc/d/A2+IxOGdE+x30R/Po+
 WtsBoR5p0RkTovqgp0x6vkcQlXj+fh5han+McfK1+/1HNPtGxPwDJpdmE65laoXF1HMl
 x8S+xd0YayvTK2zGkNyD7TeSZqmaFn5ANQBDtEa4sMeoWM+17x/Ong69ykpQoW/hp9tr
 GaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716909906; x=1717514706;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tuYbUX0jEKAJo497J8aCi9EQcdhBOOBJ9uU6ueA4eYw=;
 b=lf0CvJ3WA2+P8h1s73U1HZdZ+01dlOu+y65EPheKrBTtQB4/qDbYEGyqHhQZe5nWoc
 yWoNLyUBIXe6izxa3wro47fHD5tvUJx42YwW6C0suQq++dz1mbdYybyRkPHSSOpU+vJb
 3FrKJhLX30FNXFAaZhiNwdUSz+GZOaNDOixz7UCkhKIKbx+Y3OeLsq1LEeElhW3Lh0R3
 UvgfSSqNV36WnRvnSrrBf74RFWhmjUjIMRI9ccBVuYgeCoVb8HKvjSk6kdDEi9WgWlC0
 PYd1iLoZszir0AyoPV1KhabYYfJXuTWiwv12l/yQRtFltFR8hlzTcBbFjd08v6baniHU
 lD3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp+p5USqdggmDxCLpU0B9NI5vTAegA2UWF4Saspy/6RqiEWIhPMsxxmSkrfO7IBt59sROXyUBpGwyHTNxzzrFJ9xOM
X-Gm-Message-State: AOJu0YzuP9VuzFpuedJRtRGp4zLlByTRyejlpVLyCZueo12CnmCKNwGV
 2gjXGBK3FLBFtgqcwJ2VR1xluu6uRHpzp8z4lRWPOcpLx3eSagHKAPGT46LwrC3Zofkx+7AHSrA
 TzjFtjZDQS+6qy95mijfPncmisCci27nF3/o35A==
X-Received: by 2002:a50:c94d:0:b0:574:eb22:3629 with SMTP id
 4fb4d7f45d1cf-57851962420mr7365309a12.19.1716909906677; Tue, 28 May 2024
 08:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-38-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:24:55 +0100
Message-ID: <CAFEAcA9yfzS_SGH0v83gb3VtY5UXGBSdM56PoRHWRLewhvzOVQ@mail.gmail.com>
Subject: Re: [PATCH v2 37/67] target/arm: Improve vector UQADD, UQSUB, SQADD,
 SQSUB
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: TdjFAfOQCkUW

On Sat, 25 May 2024 at 00:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> No need for a full comparison; xor produces non-zero bits
> for QC just fine.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
