Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1092390njc;
        Fri, 15 Nov 2024 08:36:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjefmahIB3v5yxy8bIk1OGaU0fsPRYy17dAeAseb3vXgn4oVBxt4FuYsFZBS12gcEAdIN+ju3ACMLgPw==@linaro.org
X-Google-Smtp-Source: AGHT+IFcwwFlXXj9qY+jNb5GZbzJ/E+VYI/IpjzdvaNSq6axUCq93+3M9QBsYHTL0nPhQJD9OQde
X-Received: by 2002:a05:6122:1dac:b0:50d:4cb8:5afd with SMTP id 71dfb90a1353d-51477eeac94mr4038801e0c.4.1731688609961;
        Fri, 15 Nov 2024 08:36:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731688609; cv=none;
        d=google.com; s=arc-20240605;
        b=VRW3w/Kt/t/+andgSoW8mXmh3vskV8t9Har1qWmhFJ3TTWHmUZV+KAx1U/SUyS3BFj
         +OavZyO+X7qlXfpzB+GFpKSVijm3Jm/+1gqXoWs4h2Vp9HJ39efMibaS8UHmrn8Qeudy
         HiqhsVw0fUaIhgne+HtnLvpFzM6cdUUuph7yYJfdjm+lnujIyb/08y4tMsAsMdSzDNJv
         UVZwuMlDzNIN9NCEr9EOiqE7JAyOyfjgd+FTQ+l10YaqxsPuWx2PCp3QZkxNV9YLMgOj
         fZQ/3FSAtZKcbdkqb6NqrCvRAid0Qt4IkUrmJNA8dZvR6ZX14mAbpFMLh15CYc3J1Xxn
         BPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BYeXWb2q+HVZXGESukJ4gqLBNc9DefCyjtgcxN4LuNk=;
        fh=ccMYQXc52rPiTQRTDHppHqeRzCaoWS2B50gO21gYmxo=;
        b=BeouqgrNf4qs2BfT/i4HuRf1H90tRoXZX/bnezEiqEwNQ6mJMTcZrMAFgIwI0lhciT
         8gwEEHGwX4ib7LouFc4pEBpbMtDTig5ISd67Tft+tIhofRfcHov2W6nBxIjx2Ew/i8uj
         D/AYXV551Wh+7EySKVB5/HIu8FbGtXPKpnbphh7h1ACoFJf0H+ad9T8r4y9euBgfkhUR
         n8V9nAB74q/hNSWTgZZJRvS3P9nFSNxyyyt3/zlmE1UbahG2RBNIzi5nfG8QWUaZvXFy
         d64A7bqpIXkpYDrwHgW/NnEYQ769QnjdAvxfzj1tfXCKfKNEQDrhgip8agfflgrFTXt2
         mqwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQ16Sg7V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51479c5fae3si582143e0c.191.2024.11.15.08.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 08:36:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bQ16Sg7V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBzJE-0004na-Qi; Fri, 15 Nov 2024 11:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBzJC-0004mw-2l
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 11:36:34 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBzJ4-0001Mm-0T
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 11:36:28 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso288732966b.1
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 08:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731688583; x=1732293383; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BYeXWb2q+HVZXGESukJ4gqLBNc9DefCyjtgcxN4LuNk=;
 b=bQ16Sg7VjJJx+1Y1iOzsSKMo7v5/SxaU3sqM3KmTG7RUiejP6EZXIBfshOGrJNiHxs
 QoQeYYE8IGwHjjrpAtqstIcp4eZxDT89nM/U3UjmgwBkgVb30xa5mVeGH7i1gCCH5X2W
 xb6zfEHbu3ZN8mQd+nA1rXXPbb7ZttZU8blpgqfdpQXu+fzEUyBx6N9QV31RtcTVGD28
 ES1ARljdno8U4k1dztJjrSS774NUQmZHVpT6PTtIL0H2eFgUaZWnOARmi9FiSUtxiL28
 WAPfQiapVcwLZ3kMU8690MGW/1iMtgHHcJDT6zy9Fzy7ryotLQlCWQvfAM5xziWolvV0
 tChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731688583; x=1732293383;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BYeXWb2q+HVZXGESukJ4gqLBNc9DefCyjtgcxN4LuNk=;
 b=sT28if+SP9qKZmez4s4/k7Mda23Wn7rDWJ0hpz1Zdwp820AM3If5FEUggRykg1ssFz
 1Iin9c9llnWPg+D/b7B28xnaKla6bs64Unxy0z5ctYV1igoPLHyW/J0j4n1vNZwMXOpZ
 Wlse81kpsex0GNP0iuYEiyXcR1q/ZW/G4DHXCcJ1LJUUAw4q7C2jaaAXUrpp63M9tkpo
 rUOMZ10oQueGPlcKZIN3zneOdT1colGgjdjiAJm5S1xzC3hPv0MCBzqi45YaA3xxseCn
 om/+CWpZIe3XNoTpF1FQFgkqjF1bQWg5IGXAvRDMR7GGFeyI3LRicKsZjC+Wkpu+EyX0
 14EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgFdCx/G5wgKG6ez++QyL7w2emjQ6hS34JOjvze9lsVeoLk+dlCM6sJ+SCHraPBex4SVKyL3VIKA==@nongnu.org
X-Gm-Message-State: AOJu0YzuLYm7n6/bVrpm9z9NDT2TkoXuYY9GfuZCak/w9K5ffuHCmjvC
 EEE10yAPYirGMVmbq+HhqRU4lqR8gQDxKhfgxkIQHCsoqhBgfCiYK/nPcWW7VHc=
X-Received: by 2002:a17:907:2d93:b0:a9e:82f3:d4ab with SMTP id
 a640c23a62f3a-aa207687241mr715415166b.9.1731688582768; 
 Fri, 15 Nov 2024 08:36:22 -0800 (PST)
Received: from [192.168.69.174] ([176.187.214.209])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df271b7sm192885766b.41.2024.11.15.08.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 08:36:21 -0800 (PST)
Message-ID: <89547c36-94b5-457a-9a63-66c31c8c825d@linaro.org>
Date: Fri, 15 Nov 2024 17:36:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hw/watchdog/cmsdk_apb_watchdog: Fix broken link
To: Roque Arcudia Hernandez <roqueh@google.com>, peter.maydell@linaro.org,
 farosas@suse.de, lvivier@redhat.com, slongfield@google.com,
 komlodi@google.com, pbonzini@redhat.com, venture@google.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241115160328.1650269-1-roqueh@google.com>
 <20241115160328.1650269-2-roqueh@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241115160328.1650269-2-roqueh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: r6PVYoLH/EDp

On 15/11/24 16:03, Roque Arcudia Hernandez wrote:
> The patch changes the comments to point to the latest Design Kit
> Technical Reference Manual.
> 
> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> ---
>   hw/watchdog/cmsdk-apb-watchdog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


