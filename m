Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2750726njb;
        Tue, 18 Mar 2025 00:37:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmsk/yP9+YVTwtOAWPowgsRJ9wXrIuhMLT7kLLrAgIp+kfqzDboPqfmfx38TgVW21wJAYrAF3PHcaJpg==@linaro.org
X-Google-Smtp-Source: AGHT+IHyeALpcKYYk0It9YL412+DVC+PrfWHMjn9Hy/kgGOg1ku02K15lhvj8BnwYMB+U/PEz2af
X-Received: by 2002:ad4:5748:0:b0:6e8:f3af:ed44 with SMTP id 6a1803df08f44-6eaea9e9a8bmr209340226d6.12.1742283432117;
        Tue, 18 Mar 2025 00:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742283432; cv=none;
        d=google.com; s=arc-20240605;
        b=UKNBYdLcPxWsKvgQ+zmCU8VcNpcHqc4UAkg2tsODQo2ag1wckLEUosDwFvKelCUu26
         u9l60TIEePCOWQ456LZ4f+T4ltmb5HG1+/MINMmYeaXq63OgfSNQZINqgesRaxESiduO
         4tZa2+wijwdfOOHEQDzBHdgkP69W16aMpV16qLnt/YGG514FhRpBwio+DxX6xpz6ANJB
         bwYOzJD5hiu19Z4XVulUQkpoQGqqqj5bj2lOJ6KbiM3KG24O0QSHvBAH/Gdl3lKz1SxO
         K5SuS1PHF+SaZH42ESbthDatPFlc7SqcBBc8Xj9X8J8uVl6Fd0lpBFOzsxxjldx6IERX
         nC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/fRMP3gMl52AoP58CbToWvuE5l8CGfrdy2D4G5KqF0Y=;
        fh=aSNtLs5suhScUyjbM7mNyAkYrl+5f1iL3jtlM7w8uTE=;
        b=OtLmvl3pXWau9G0iMDydVbntqacI4K28eXOXVLNIPNDkRrpZhuamNbEY9oJAb8jYqR
         LjzNVZqDtQpUwS34fG+OKgzW8x4gihwABKhpsdrtJSstyg3WHRpeBxAoTYib2He3M2qw
         X9d28WDxrsMlcrMyTKH3Zt1oNMGS1mnVD+vbDZseoD4Rwb/p2tIDee5s7vVauJbC7r5r
         V0ndmmKWcIaV7iOTYh7LjRANAwOWM/o9lu1e83ygkFG7u1kdbceLU7g4HHGMdg7vnH9E
         AklL9OkkPjD2cInoUerN9gnmrWt2GOkwjPC1dM6B+geydc5o1+SCM2NKk5h8R4SqOeEY
         SvMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=zHaM88Oc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade3582c9si117161506d6.360.2025.03.18.00.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 00:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=zHaM88Oc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuRVO-0001pS-KW; Tue, 18 Mar 2025 03:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tuRVI-0001oj-Pa
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 03:36:50 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tuRVG-0005nl-QF
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 03:36:48 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so124998125ad.2
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 00:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742283405; x=1742888205;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/fRMP3gMl52AoP58CbToWvuE5l8CGfrdy2D4G5KqF0Y=;
 b=zHaM88OcqHtjWtRIlETL66jp9L3mxogKdVeymNQkCuha6tbrTqU1/J8UbZwCisHUHT
 iA4pmWnRTjfFDkse4YKNGHlvmQUT8A33dvcUM7GsPqYviCzC3KQELi6LeqGBeF7gjsia
 g0Un8dMtY64vJ8At3hNwE2XGEab3YvTp8N6exzXznaLZrbLCJYO3DV8u7M/tH474z9Ae
 0PwHlLQV/yL1aPwFTAdiOCBA03hKB50EKcX/cUpt+92O5RRcBuI58pr/GSK/9pw/2Uhe
 C2TKOVutvoCqQLc0kkSlcYNDnNpsLb0lr8cao48NrZ82e8pBF+k+DfwXPs/TBH0j4hLq
 qrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742283405; x=1742888205;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/fRMP3gMl52AoP58CbToWvuE5l8CGfrdy2D4G5KqF0Y=;
 b=J6dvF51xzsqjfGQbM66GcuAcKe38Zd3c88BlLLhnZN3iUy+iTvuMMW9CHKbt74GOHE
 gPKqXVviG8UZVHv9wPeoWh8wpl4RhnpQKPYBWEIefHXdjZLkxM4/krPsfZV1jv2GppDb
 m4l6QLD3iZIkbpyp/BclMcahdYUCZ66S2svU1KxDCj8eDHfM3jr8io+jstxKg8ZurHgr
 tu64gykZF7LbmQTn19yplbQinTGXgkSLzdGQ6VwHPfq/VXfzr2GZuLVcq7iz70jSoDPY
 XS0hCazu8sg+X6Pg6L8VSzcWcuq42Kh3IPF5m+7KDHnO+b1E2h+WHRi7KuPxplA5TaKh
 JOjw==
X-Gm-Message-State: AOJu0YwYiTwwSRLIQ604F5T30yB9mg/hZYxRwK04b4LOlITnLVAMj2dh
 ZcXLT5StthmFmbci9cwH/UbAT5MSqI/5GjnxZIuajGYiSDvVTWhA9LBNxMXZtS4=
X-Gm-Gg: ASbGncs1sLS6KxewHMDnEFa27fJLBXDTk6yzGYFSZ9dBglQDqhP+XM+CdzvaH5lWS42
 OWbjpSp1sYUo3tC8pubXcGsA40wI8SAgzAtgHjdi0wyf9IoIDJkJiP3+hnDt2QuXs0cdXgaU0+R
 kMYRuTI9jSaUj7ZpiRYH/fAbMscKtaf+x0UA/KK6EPxX+etpOGhKODh6czv7l7JH+YVLvHzuzE8
 7Hdg/vuAzwgbdM0o3m6HucTLc9YIC5WMmvrM5P5j6ZOTuwG+8mSFlJN34RkyXUEzu2mxzvna4Ac
 UJZ6IWt6r64ObNbpmMD/vCTJvhJ2gsN/gNDoTLML11tDyy0DQkmbzx8uFJD/uLRT5CT1
X-Received: by 2002:a17:903:8cd:b0:223:faf3:b9c2 with SMTP id
 d9443c01a7336-225e0a7a10bmr203109845ad.27.1742283404863; 
 Tue, 18 Mar 2025 00:36:44 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bd40f3sm87669895ad.219.2025.03.18.00.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 00:36:44 -0700 (PDT)
Message-ID: <f53a6183-c57b-45ed-8b97-49366fb30037@daynix.com>
Date: Tue, 18 Mar 2025 16:36:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system: Use the meson binary from the pyvenv
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-arm@nongnu.org, Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>
References: <20250318055415.16501-1-thuth@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250318055415.16501-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 8uAyzFooqBY3

On 2025/03/18 14:54, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> To avoid problems with the meson installation from the host
> system, we should always use the meson from our venv instead.
> Thus use this in the documentation, too.
> 
> While we're at it, also mention that it has to be run from
> the build folder (in the igb.rst file; the other two files
> were already fine).
> 
> Suggested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
