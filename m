Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3530772njb;
        Tue, 10 Dec 2024 10:19:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWv6cIGNVBoSwnME4iuth4hajp8mj3tyh4NKebWqrxfG3sV3bcKHJkjHwcwev19wl9oJw06lC4KLjc5QA==@linaro.org
X-Google-Smtp-Source: AGHT+IFiY6wNemTC7g0YMC/0BLaszhpRnb+UdH8St6vsfJBZGO09qzMMh+1qfMGi9lybB00X6mf6
X-Received: by 2002:a05:622a:392:b0:467:5c17:e28a with SMTP id d75a77b69052e-467720929dbmr98021691cf.46.1733854790717;
        Tue, 10 Dec 2024 10:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733854790; cv=none;
        d=google.com; s=arc-20240605;
        b=TQsuCVieHPTtr+lVKqMil/34Q96tpglKZWoT1S1vQoQulyTJLDuwLe0M2c8RD9OBy9
         3zY4vEqhvkhcup8iGX6rCyPWNEHCJeorqyCUCQluOWp4EfA+qBn8flb4Y7YuHRAtMe1p
         Z5p4lbT7CztvrdQIvme0evnXPLMvxhBwSN0ZpjbfldfuJrjjpG260haAED5ldirs3a0X
         Cwuw9Yw0uMYdukci0kBGigoE/9+eVeev8Im50udD8Fy+ScEEqoT15TP+DIY2pEi5ujiE
         9rycx/9IPr15rZ1yKHn9KOFHEnIMrDqfV7NhuWidrslQLXKUMbeLihfslu7EH/1W3p81
         4xfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=v5vVpSaK0rwMrRGmrE82bb0OAKnJkCZfB5odOngnjZM=;
        fh=WicrpVZNZyuIqz6zvJI/vpKGgEM5q8ZEEHxJcKC3H6c=;
        b=G4hBdl4Rvq1oUutO85LN3AXMtG045BVHndqzIhCsyWoODppckVPPAwiF8aHPZaFCea
         yDXttUwkKYJJzfSpwwwnoizMPN/3dFRl1iXwS7dcxpcbktliaN2/iJ3GKCm8ZLf6pH6i
         8Hx0AsinnpCcZeQFKUyhCWPDDbF9UI2NxXPMSDTc80rYEbgNILSzA2YbV4pSiFaKm/zr
         mHNAu4xDeMl+z620sB2NDrwUi/UTPReMKAILhtDVhEyhMhcud+EFf/vh+9+NTr5vcE3u
         P0YuSzIJEsh7wdFMeTOM+I9Wf5Fn7Zhw6wmeJvB71JwhuOwq/27TD8PRyWhFk1CQ+H+E
         o3WQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WPI+sSWA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46784fc1c9dsi12118041cf.550.2024.12.10.10.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 10:19:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WPI+sSWA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL4pl-0002Jy-6H; Tue, 10 Dec 2024 13:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4pW-0002AG-P9
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:19:35 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4pR-0003Mh-PB
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:19:27 -0500
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7b6d6fe8b16so200817985a.1
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 10:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733854764; x=1734459564; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v5vVpSaK0rwMrRGmrE82bb0OAKnJkCZfB5odOngnjZM=;
 b=WPI+sSWAAW2OPoW7tgn7Cmw0Z0ujkIq1jx4yAvKuO47P/U676yICW45n6gbF5jpUUU
 jMod/mC2glv/lYS4zzghizhvqEOPXvH9dzczrp5eV+t+Y4QofHvnz5FH27fZYBfpbN7R
 LwXm5VasrSS2YwZuRVZ6huW+qbmICpR9Otcvvy8ZWNSj5V24jr2OPHhPAo6letHdHOS+
 lWN9w0tJpbKqkEKD/IOmAPp/sBlxBS1dOzqG6gkJXs2hqdkA8hAd+ZAGaLvRka3HkidK
 dQ4/JKyYlGXRHGloSxTahufgN5Ntvbkx1sny00Y1vwnkRQd1Wg6t9pcfTrYwy9XYfgFl
 teow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733854764; x=1734459564;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v5vVpSaK0rwMrRGmrE82bb0OAKnJkCZfB5odOngnjZM=;
 b=ZzouQrO+JpcNLWs/88sD1PbH++xXKDHDBgB+FuFeUi2cQafnwDIVhhycvBlRVXxtTM
 6W0feix/jG9Nf7zkHQv9hdeg59Ka5R0Hqt+laY01QHib+xiFWhwKBjpDbOAnS6i0q49c
 EH2PuehCjTKkzinzB81Fg2xJ6iRGiIEuxWB7YAN3WK2vqaJ4XwIk1L269lPjuvloHmiD
 y6XdWXBF9atUD/IDrlp9uiwn+ial5eyvb/AY0Lgrgjvd+obwt9/OIHS6nLIeQfsfY3em
 6NKcZUic718qMVCBiLujRUJHC+c5VKK6+0EtnfXR7ucgDmNzZzDbTTx1sfK5TQkRjBKX
 T9bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjN0zOSAvry7iqEGQe/cA1qOI7zqTBALhoRzcPEXHbeZTRLT7JUD51aFKiGBLKKlzkZgGrOjynEQ==@nongnu.org
X-Gm-Message-State: AOJu0Yym9fti5uRn1MUOC8BbDKd6J2ptm+E9NQl5dJE9yQ+wZxiG4ahQ
 aX+l2q4mfQiQfhU+PfBs3SMnPqXxSsTfySN3o9GqHaF29B3ZjPfYlBYQUb3moRw=
X-Gm-Gg: ASbGncuit/6iSavTe51eYgj+UCuLpFVs37AIckBhvb3lkzRW8KP2/SoxBTazTukNL0r
 b5TjGGhDcu2OrVR43B7JaFxgwe8hQvOLW5y8KJFf4QTSyX07phtIyleijD1w6va+sItsWd/U3ou
 NBYIwnZbwPGJ+nb10aHpnMmahJh5UPOL1VDldlLaHQjZNLxx4nykEXBzVp1aee2vYDmteyY6oVz
 EK979aNFsYnnTO6rlGHNakaDvdL21q8Fh1kG9wFFazM+yJoDFum5GTo0aRPwhiUyJ2tplM=
X-Received: by 2002:a05:620a:7189:b0:7b6:d026:293 with SMTP id
 af79cd13be357-7b6eb43085emr20421985a.9.1733854763995; 
 Tue, 10 Dec 2024 10:19:23 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6dbb3b67fsm143996485a.10.2024.12.10.10.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 10:19:23 -0800 (PST)
Message-ID: <d47f5a35-186d-4b18-9c06-c17bcc515067@linaro.org>
Date: Tue, 10 Dec 2024 12:19:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] target/arm: Move the TLBI OS insns to tlb-insns.c.
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
 <20241210160452.2427965-8-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241210160452.2427965-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
X-TUID: /6VpD137W4CS

On 12/10/24 10:04, Peter Maydell wrote:
> Move the TLBI OS insns across to tlb-insns.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c        | 80 --------------------------------------
>   target/arm/tcg/tlb-insns.c | 80 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 80 insertions(+), 80 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
