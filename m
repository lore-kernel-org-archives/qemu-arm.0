Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp697038njb;
        Fri, 6 Dec 2024 00:36:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRf8rx9IoHdtsKVpzCbEaXGNdJNafLqpwSoPQWBshpBzRTStlCGfw2NmDHToVrtCVNDkg7i+0tYZlPWg==@linaro.org
X-Google-Smtp-Source: AGHT+IHdHVDeHHUntkRxwH4m/ISP66prQ+uBkx4TVFGBfH7pPz2FqZ5ree/WoJkq1222C5EgWebQ
X-Received: by 2002:a05:620a:472c:b0:7b6:6a3b:53af with SMTP id af79cd13be357-7b6bcad37a1mr317384885a.14.1733474162961;
        Fri, 06 Dec 2024 00:36:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733474162; cv=none;
        d=google.com; s=arc-20240605;
        b=WJFhwzNe0vo6T6TvwZxdCvaK0oTdkTreiTn/GmHG7BtVQrOyVMF7lwAahqR3pc5gbI
         XBqSsa1y4E8W6OnpZFcls4BZyYnZJhxhWBLcDxWg72EYas45ww8yN3WGCsotfc4FfBnS
         qjnFBofnz55uV4acgr7Hl3FTYC6GqZI2GuGzoLPf0LyJZj3CtJm5pYOMP6y1SCj0CyVl
         ssch4qmxIZtd2pOBa2BqLoCwc4p4IhhYK9ejossyaE3ZKgPhCd5L18ArbIsdJ40PTZ7a
         IeyIwqT7ZAJVBQSGfqMwtxYfE0ptqzl6ERds3JYJlSI4yu0pd+CspTYrOjQHol/GV2bm
         h84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=n11WyXKWvid612dQI3SmR7GwE09/moDRs0zM225VZ08=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=Nn+8i7HVUjVg+LBcbAX3qf0qFjw5+Y1IusKBIjcfINRmyQil/47e84Xp0tXWfhVhlU
         kHhLA2vQ/vUiMKNYQT4LtLLf5s8iWxz1MRhxkHGjF6nyXu83TZuv1PZObWLccC3ZTDGK
         dKe/e2sne5FKScqHRffwym0N5XpibCDEf2N37iMQ5XJE3JBCaY2m6g9mr7XD5R9YFhEd
         +B74+Q++XTgU8yccIE7/jPzjFWVhihcpUlTPM6YYo6G8adCHZxNT1ouoLwq1LoEM/yf+
         aB1+YTplrKoFgCE6RqUG99lpvm5zxoAkiP3lggVL5FsgdVKjxY9Oy2lcnjAlvDu6E72V
         vjIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rM2pCeNB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5abf4dfsi381610385a.601.2024.12.06.00.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 00:36:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rM2pCeNB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJTod-00006M-AS; Fri, 06 Dec 2024 03:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJToX-0008RL-U8
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:35:54 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJToW-0000Vt-JJ
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:35:53 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434a83c6b01so12100615e9.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 00:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474151; x=1734078951; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n11WyXKWvid612dQI3SmR7GwE09/moDRs0zM225VZ08=;
 b=rM2pCeNBG5ixFFhNLdJRmbsqIyUDO+oc3uzJbt+CwSSJ4F1Jjqfea/hmRkVm2d4/d+
 x9dNLBLnB0DLnX0TCoCxxZ31oPUtrWxIMJJjylLULzTKDrHprcg0xUN0WXQFZUJwMOkz
 KbrrQ7P2vCXmlq4i8d4THu+Lma3nTFFmaPvjogNQcwk2gTkisK/X7v+11W7CBsuRinmq
 Wgl2sT1shmSbhgYDmdHoZGgP8qFu0dkz3ZKFhShSc1vhSzjVlbYPTzCXeJpuAzWo2uti
 iQ0fTU5TjlVt3/sHev6SpsJoGN7Kr3OR0AH27RTlFLopH+fn++nx0IJLMowS+CKPARl0
 Sjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474151; x=1734078951;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n11WyXKWvid612dQI3SmR7GwE09/moDRs0zM225VZ08=;
 b=HTf4rpWUaTVAwv6fHExWHeY8zcfhlzzrlF9QgVSB/imcYVCqnmpDtLoO0wJmObpV01
 JLCeZUemJrN9HTFBFe8PGw0wluxter5WZzkmxUs9Sc6ynq2qJj5bwPPWrYdsniU26USs
 RmkTDtRMa19eyI9GRkaSUshSYwsKbr2p0h3GAywJxWNlaICn+N/kOrX7Y30fbzGE38L9
 +VhaUEAvQDVsCBPsFE9flngpQj4/s8YC1BidYqQ7Wi4gW8b3OdVWws5u+HSehZnt1ODs
 E+dWIc/Nhp3CnQN9sW+bcBSvzptw+jyI9lRGcGW7g/bYnKhvxQTv318v2+aAE/A7cULr
 D0Zw==
X-Gm-Message-State: AOJu0YzdEcIfGOWiQgFBgEU3LZzLV5li33hon1AbsFoaYIwXVwcrQXGP
 kZCL6jJP0R+yapmjSeveZ6UUWqqlCzi6K72C/AETgCK+AhE++Q0s0tqu34mqX9M=
X-Gm-Gg: ASbGnctmdzdgLkF904zEjleMWocjizpYPt2lmFMSVv+IQLKMXnIoR+nXu2dcinGhuqV
 54mKs0YePc1HXq5skZfJPqm0MfrT90Axneg1Hj0T0yj/wI1gbPdIA4G50Q6pAgV6eudAF+dnLok
 CEeAgLvTzAZwgKwCfBJIG9+Q5m+QkNC3i/45G/rU/xU9W86cuz4Eq31MS7zow2XfibZP8KEzs1i
 rcNBJfEMdqmrXZP9nLSKZ+vk7nc0wJyQ0Kut8JhczdgeAZW7TRoVlshKxqyhctpFMN/FO5WTmMY
 PAFKUSQRZzUgJxZYJQ==
X-Received: by 2002:a05:6000:1a86:b0:385:f1df:2502 with SMTP id
 ffacd0b85a97d-3862b3d4974mr1158644f8f.36.1733474151012; 
 Fri, 06 Dec 2024 00:35:51 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862190989fsm4084152f8f.73.2024.12.06.00.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 00:35:50 -0800 (PST)
Message-ID: <3d1caec6-8806-46aa-b41d-cea2390a2375@linaro.org>
Date: Fri, 6 Dec 2024 09:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] target/arm: Convert helper-a64.c to fpst alias
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-4-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241206031224.78525-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: mblA3qwXXrJ6

On 6/12/24 04:12, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/helper-a64.h | 94 +++++++++++++++++------------------
>   target/arm/tcg/helper-a64.c | 98 +++++++++++++------------------------
>   2 files changed, 80 insertions(+), 112 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

