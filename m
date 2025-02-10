Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1984377njb;
        Mon, 10 Feb 2025 06:43:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXbLk/tDY5eXCCgnLqFN3mGCKnZvcdVacSWy6+OIMljAHFUi3WowM6aaMIf9PGd/LUcF0HfyMsKDi1naA==@linaro.org
X-Google-Smtp-Source: AGHT+IESBvOY6wbymCh8Uf8nQJrGJS09PUgti8/lXnhp4SnN6zEBAMAsId+aWJHa4P6KOzmP+AMx
X-Received: by 2002:a05:6214:5008:b0:6e4:2f63:ba54 with SMTP id 6a1803df08f44-6e445660a1dmr222221266d6.20.1739198626828;
        Mon, 10 Feb 2025 06:43:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739198626; cv=none;
        d=google.com; s=arc-20240605;
        b=dHzGrvcmPk1TbCVz6iHTUlWKerDKzKVjApNuSSF1mDq6ZzaKPD0HUa7eguDDPPAvOY
         uGvuHiH6JiK63JsgkUxBjFCMvCOoGwEI6bhfox75Mkb84wBHRCyQbPi3/kLaOL6eq7Vx
         la6J+H2ns4iaFUv+ju+4Y4ylMAwIsjCVqLPEv6l3PbdZ1EYqLK8XLy4zJ8btMIK9tlxW
         4ff4eBhshb4Kfg6hwO4K0n+hGdNuBxqEMb7bo05BjGc+H1jMyAK5pLxLZi+KZcViHf6E
         1vRsE1LLePfYgU+sH8/KalWwyhkFsx1e5xxfCimpYC5/74wI42MyCcRU6lCdb9DHHaso
         rPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hXmwefOaCUdbJ19sp/F/xIw1GIIfmYbZZnFNqirItMY=;
        fh=JTCUXLLrMnrRFng5FNDEtodYxtuSJ1VN5D23+24As/A=;
        b=SLf5bLt+QqKWr7auLDnxcmr8n9eePF8BAhh9JHSewh2RZEa6gr8DyevoDPE01T9kXp
         WAHhkIRZmPkXV6JSjl3GZbPuo5vheTlAH3ePccnYpeDh618G6KmmHz6W7SXeuiUKdRau
         8f+ogs1jE+5puE4cqP7MX1dJ4M9nN/oZp48IO6n9pNFQa6Xzosj8kdQkDyUIur9jDyHs
         EZO2EYttjKCNZ4qdwFKGmnd22klOLw5BiesKX7WO34+H+RBFPWoL4S8b6pp4N8IXhT+F
         0ZmFO11S8BZetS3U1Lj3Ttd11XKpQDsIhcu8NGCXBXfl8s1ey628xMp1uOzfitGM8rOr
         HYXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PVoYdH3u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e45042750esi58889076d6.212.2025.02.10.06.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 06:43:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PVoYdH3u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1thV0Q-0002Z8-Rz; Mon, 10 Feb 2025 09:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thV0O-0002YO-Va
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 09:43:24 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thV0N-00020g-AL
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 09:43:24 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38de17a5fc9so429749f8f.3
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2025 06:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739198600; x=1739803400; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hXmwefOaCUdbJ19sp/F/xIw1GIIfmYbZZnFNqirItMY=;
 b=PVoYdH3uGhfoJS4kG0PNX7Qt5txSnqD27jyC5kFju8IJLCIh8aSt/26AvVGCyLqq4i
 gUOPwyIuUewJ0083jSMNf/Q+S7MxtIn/ph3u6JvDUn+/cnt8ex4MmE1Xr07xfDbSsGqX
 pacAZDo5LyPgen62rpyke5IkhTusMr/nLoRveqt84fNk3MALot2PZkLqcFOs6h7vhZQ9
 xg9b+bT1IBwXskZ9sVuhD1GDigazVtGaZ67aAzVVfI0r2YvA8tt6qXW/wZMEjaz5yMRc
 x7QA5uuVetW8uZejSW2yH/In3tDbksJcoa4iFqecsEXeD2g49uca4/7z81RdYJA0Q3qR
 aaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739198600; x=1739803400;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hXmwefOaCUdbJ19sp/F/xIw1GIIfmYbZZnFNqirItMY=;
 b=cGIesYOnxOQiuq52Te7gwMzDbaKHtvTKt5y4ZVFux9QRdj9oCa0nWEXaqV0mhVGaqg
 8IfV4DO56Y4KqDEOLxWcubqspThbxFIkUHvy8BIJfaawATZ/LRyH643i94v08yGYQg4I
 3QOPjqC06HV9AODUr7KYGvp7F2ylqabEKaRF5l0ySjXP+fKVdMozFapVhlsKKJ58Fche
 4AIYdCQtaSmXj3AlHsIrVqI4tpzv1K/JgZrP1tA9jBNgtvkC6D9P1h0diDukGWF+ccOd
 HIoavqAj5N7oEvbZRnzVlZeskrnADMWtD53tKOSL1z+tjkIn6XtTh+kKOuSqsph7uJbB
 +Ujg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQv0GVDCDiEZqDO4myXLbF6W8Xes/1r1+19QPuJdQAEovHNYNek8W96+GJ6e3aTU2wEAapfz6R2kX0@nongnu.org
X-Gm-Message-State: AOJu0YypmovOzc46wQKbpRB05tJ5SSvuz+inrPlzY0jF9oz3NSR8Ef7x
 arTIKnTwmCG/Ty3CLEcxzPd/xh1dFS/HwsJkdw5Ru4JXdEGp0y0PvYIfLOKAODs=
X-Gm-Gg: ASbGncu6TynTR7xVvF9YQCfGAQvH94XLB6qPbJ4wkhGBzk3ZxvTFtVhNBV3KTsEZir/
 3ipza087R+o0MmcwmpDEc3kRAajZagOJM7yJv6+fkIGRR5dTbALjuV5t84Qv/TbYc6eMXKzNs/k
 Bg6VnREKvSglgTvdCmYEckZlWYub6nQ+Ob0s2K3V+n7ddWvw9AQBIA+0fmoqiiFVC6jVDKS1x56
 08LZNDYKWAC/KSn/crPuxeDyaPhyxvp0Lw8VjG9KttariqTgtIgoGM2jzAmAHYyc9+lfjbcuPNu
 TRJFtwz2glkFX2augggwEaVoK/n7rfdv0KAhmLKLfoVq6RvYII2FT+7BXtk=
X-Received: by 2002:a5d:47ca:0:b0:38d:c557:1146 with SMTP id
 ffacd0b85a97d-38dc912339amr9143346f8f.20.1739198600407; 
 Mon, 10 Feb 2025 06:43:20 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43907f1b570sm154246085e9.1.2025.02.10.06.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 06:43:19 -0800 (PST)
Message-ID: <c1c915bd-a7ce-4b5a-8d76-2b95b2681bd9@linaro.org>
Date: Mon, 10 Feb 2025 15:43:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/17] hw/ssi: Make flash size a property in NPCM7XX FIU
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com, chli30@nuvoton.corp-partner.google.com,
 pbonzini@redhat.com, jasowang@redhat.com, alistair@alistair23.me
References: <20250206221203.4187217-1-wuhaotsh@google.com>
 <20250206221203.4187217-4-wuhaotsh@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250206221203.4187217-4-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wxaCvbWYzUn1

On 6/2/25 23:11, Hao Wu wrote:
> This allows different FIUs to have different flash sizes, useful
> in NPCM8XX which has multiple different sized FIU modules.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/arm/npcm7xx.c             |  6 ++++++
>   hw/ssi/npcm7xx_fiu.c         | 16 ++++++++++++++--
>   include/hw/ssi/npcm7xx_fiu.h |  1 +
>   3 files changed, 21 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

