Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4444114njb;
        Wed, 11 Dec 2024 16:02:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+cN3Co9HlAVHpBHOx8kAQC2ypNG5hGRBa6khDQW/nRC9SFhZ2wo88o6MST8JpIG+WzTGQBlychYjcsA==@linaro.org
X-Google-Smtp-Source: AGHT+IEDTE8DXkhhkecnuGXYM+HhLivrTe3nHl+tu2y5F7nRaV1vUtDOrYCaUryaw5L6b56KVXbC
X-Received: by 2002:ad4:5aa5:0:b0:6d8:9832:75d0 with SMTP id 6a1803df08f44-6dae390cc04mr21976446d6.17.1733961766842;
        Wed, 11 Dec 2024 16:02:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733961766; cv=none;
        d=google.com; s=arc-20240605;
        b=RaEMse1X5QrmVPc7AsC/ZadIJdXZTqmwHhrLDmWEzWWousmBHiwc+6NPMJa0JbMRrB
         ydkYeeu1Uvuv8N3KFIAE8CYEUHRyB8y8lStNlw0szYeCQYB3Bj8iiEU634+AxOenXTg6
         oWtZgygUpkU0LA3T1uH2uPdDtyd+yyodAsc9LdAEikTmMAt+rgGOuVbpxHonCkhMfTup
         BYVMnmijIboNIcPoie7QfYMDA+owTTCo9mh48EFp8zS4GkH4/8c2Cyp8GZZRY8/J6yxf
         0qkzoIXah6nc5vqWmTWzJU0AT4V9+T4lDLDMQAqku1ie254KKUgvwdrbw+8NiQ1u+9Cr
         nEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=asKUsggT+0F56nh+WUR2TT5crj5xSwZ64CEeuaa2E1U=;
        fh=L1DpBR7Hn+bt0kQEN8+uBHYIXUFydxAKTW5TgdoFCzY=;
        b=iEQ1jC1Kf18g7jTL3rJ9g7LTa84SYFWqgBqFhC0nfnSBGWb248cp4OQzx8WN51PYmJ
         Mg3cVeP7vNLoe/NIC0CQ5VetixewCI/hftcf4JGS3ohW49k6sXrC3SHLq7IWEHNKqk/A
         sRSM533AM339Xsuz3xhVXRqztavHKlFvRNS+Fsx4fjJBfQSDDmkilZi+vVHgLgdEKbRV
         VOjEdjBO3MWYcXQtrgTt5HdYFLZhCv4CY6U72QApHIbMrXcR6tP7Gc/WyIKJphJl98Ji
         sMTfoe1dS6R9q6KlSWIJguL44j2V2E8C9R3U07ctDwUl0G4dsaKEGlBd8rVTfiTgK3eb
         1Thw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mHx3rwF5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8e6fae9fdsi159199556d6.286.2024.12.11.16.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 16:02:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mHx3rwF5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLWf6-0004Pi-Iu; Wed, 11 Dec 2024 19:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWez-0004IP-8d
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 19:02:29 -0500
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWex-00036C-Rk
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 19:02:29 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5f2e13cb356so23707eaf.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 16:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733961746; x=1734566546; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=asKUsggT+0F56nh+WUR2TT5crj5xSwZ64CEeuaa2E1U=;
 b=mHx3rwF5BcF9MTg+bKOTycXe62OMnqb162mPkmglBXM8ImNkcK217w0fJXxjcfi29N
 s1/t9bFlP7fVTSVdd0IdCwfaQxuGJig6EyUQ3Zp7PmyXFbX206JaL8p5ljGVSQtMTY7i
 8eBZSuJu4q/VXTtBck8dttBcZaine8dhJSexiYMHB/sFZy4TV/ewXIT8LWKzxGUXBAKu
 0SrSPYlW9zYpPWEBoEgxtucYf1LjS3eU3Lt5x3c2Qup5XQAmErlPK1z5CsO6O2I1fPMu
 PGjnb1TdnTtKEp9VO/MaLwKFRp9VWmGyKW3yf00WuZmeFpisL6Y40ESpbjClZQd2k3pY
 NKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733961746; x=1734566546;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=asKUsggT+0F56nh+WUR2TT5crj5xSwZ64CEeuaa2E1U=;
 b=fDW3Ttct0E2X9l0oFY9vdUqUmPHQzwnyl0/27Q9YC6AzLF8E3ziY0enZT+hjPnC8Ny
 R9te2w2byGg8t/+8c5AMuPtjCZQZQu5Mz/EaGnMCdXXDLrNstyO1Z3qC3l8VOf3w3nZu
 B0erYXKNXjAH3V7XdTzBbmtpU9XnevASUcA/M7vcB/+2l9nO/DUhRSFCE9dsDTzJPQs3
 yw+u5afNF1ylaBx77iGPHxYXg1dBQ5XONTOwOWXFm5gTZ0KH6UhjXNxPAMIPoDFndTql
 8JHt2xTtoGFQ5uufddOhvfw0l7U9iHeBmI1rhb5LxNcr5P42aOg3das7gSVgFfCT4ajs
 e9Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJJcUnB9C7ox2VEFbzye5Rd7C3wKyPocLKZmQICGa33vD5U9PJ2tf+QuohArYC0GKhec7abhyHdQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy+XF0mLINux1zOrSJiy5s2k4GYkXYgOKlTGW+/xRsXe4Qo+zzC
 +U0sH72+zA4aWnoar4cQ616PdkVZDin63q05bwnh58pHRMA4uWgF71D9iAbzA94=
X-Gm-Gg: ASbGncs6nsNfC5A+WavD4qHhfAy1ZZV/zZsh9jZOj2ZVI1FRu0DGQ6tqd+DdsjTMTtX
 BL9dJ9yWO3XEoedIr3fsy31JcNjNNj2OgHiDu0bbBWp3+NFbSY/fr9ZNWI0sQV+IPXhlFK1FHF9
 xhgLH2b6SsuwPcgEf/K2yYXueA89fYUcrNWbBVvf+hHZjEkgPc46ux+epyfNLf0sRwHV89OaaY4
 kHzlrxZNvATsdJXvk0UYRmufK+HzFWkcUlWzzZnMXvi90gLhWK4a9edetauwdISw4yjC+269S8A
 pswbsV+9l8JgffPCbfbT10bMYca1WTgj
X-Received: by 2002:a4a:ec41:0:b0:5f2:c5e0:453a with SMTP id
 006d021491bc7-5f2efc5dee7mr939781eaf.8.1733961746532; 
 Wed, 11 Dec 2024 16:02:26 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f2a9d525f2sm2179300eaf.4.2024.12.11.16.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 16:02:26 -0800 (PST)
Message-ID: <75d1d73a-3e9a-41bc-832c-c88e8b0d1c44@linaro.org>
Date: Wed, 11 Dec 2024 18:02:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] hw/xtensa: Include missing 'exec/tswap.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20241211230357.97036-1-philmd@linaro.org>
 <20241211230357.97036-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241211230357.97036-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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
X-TUID: BDGfXR/pLnFP

On 12/11/24 17:03, Philippe Mathieu-Daudé wrote:
> Some files indirectly get "exec/tswap.h" declarations via
> "exec/cpu-all.h". Include it directly to be able to remove
> the former from the latter, otherwise we get:
> 
>    hw/xtensa/bootparam.h:40:16: error: call to undeclared function 'tswap16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       40 |         .tag = tswap16(tag),
>          |                ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/xtensa/bootparam.h | 1 +
>   hw/xtensa/xtfpga.c    | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
