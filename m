Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2432918njd;
        Mon, 31 Mar 2025 16:05:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcypyl+3W8e15shV0bYVyJOVpvoE9Fveb+Nkmm8nIvmdJiXE1yd2yKSXI1atCRRRYrkGffCam6l5w7Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IFFlXarLWjAC0q3F5yXNO/vuPtMV/5cyW24ukEBslmyb4nACAg9Ixfxic3mx1IaPQvBCKHe
X-Received: by 2002:ac8:7f41:0:b0:477:e2d:2ec7 with SMTP id d75a77b69052e-477ed725cabmr149692191cf.33.1743462316529;
        Mon, 31 Mar 2025 16:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743462316; cv=none;
        d=google.com; s=arc-20240605;
        b=LawhZRlAyEpz+F7dVmYyamHsMRum4cB8hprfefgoS214j4/0ONeWZtWKPWP4SOJMfC
         YRTnnVRO7HG8tSjitRs7jAlt5wanYfWfN63p2VZLkoHOU6fHH+y4d50GbR4afBQaoe8a
         CDDAKXSeSYz0FzrELP3uAGYJ7KPeVwA/ucekCnaRBEWbP7/gevBQ7HzqFgJgcekHNp0N
         35J1dRGVNvbjZb3R4baTWm6fo+LLvdumGiyZY6LUMc2bPOLnLwJhiZMUaL8HpWMvqLyU
         mGVwUYqSgWiAiEddmuil1SHp1jaQ6kBZW2CgWiA5UTJAfxiH9U+RT9pvI+3yl5+Q1Ofd
         keuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=FSCM4rp57UZEJzLBnlz1xi9GYjXld1lLy219uTKGxdQ=;
        fh=ydYUy73DovgVQOa5qTlrknkDAsPNYa+Wsa4YCixDbPM=;
        b=Cra6TItEnEbWnGi8wqVvFNUVbgyeXedzG1GGm6yLa63p2nsXbZZ21C14DLwVOZiYFh
         OY2KeF/tlirWAFmlLgh2DS8r3jr1uDMF0Vet6W5XKN+mNbIIUbaBlvFkzUMvmKIzGghh
         2DEhvg+WQmm9osRzmIJG65DqXRm7NODSOi8ENKtMypJ6c/xI74H8sjnIImXu8NOzV++O
         x2Om0NSn8tWh0jTbcMF20MCBUJjhT2kMmTCGg+kPHWr17nrFB5NLn/calYFkMrs25XwY
         rlSFDJjtfmY0t3WbppvUoMbBZmSwMzkdscSbPzQC/dYzBhFZ7QhwI21raf7DzrVEkvNQ
         LFdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=swJ3EaDe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47782a19cc4si72253351cf.121.2025.03.31.16.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 16:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=swJ3EaDe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzOBX-0006jq-5P; Mon, 31 Mar 2025 19:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzOBW-0006jH-7P
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 19:04:50 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzOBU-0005ke-KY
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 19:04:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso32036705e9.0
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 16:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743462287; x=1744067087; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FSCM4rp57UZEJzLBnlz1xi9GYjXld1lLy219uTKGxdQ=;
 b=swJ3EaDexVh/ul/sPmoJMFcLPMfd/WCyP/8lg6X+is6tkYa10Ixi6/lwlbpqY2Whfz
 s8izHc539/YLysUO3H0XjQSDxQ/QFGIFyxm2TjAi7e1+gA2TuHst/pBXPXQbZjdE+A1t
 U86ri84Bj+oh8SobOwUJSX9uMFFVRVhl3mv8Ipr2gh4VRbmJm/EaMAffcSgX1PPRS5hY
 xegarXj/UAZ3ciA+Q+t3CfSRs1aW6/IdefeRqBJDeBKmEgXp8Z//F8qZDzrhKsQ7ZhDm
 Qxb5DyGbh+982zWBBQt5w+vlDniSFNTVEm6KVnROA4SlV+bRoaon/+2zFjoELuLHJqXz
 Ogig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743462287; x=1744067087;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FSCM4rp57UZEJzLBnlz1xi9GYjXld1lLy219uTKGxdQ=;
 b=CumnP6mIXki5UkRhNNXDqQXAUHGzHYXNvPwBGEk8mVm+BFrek5AhkWWGXN5RA6MdBt
 MCpGN3yN0llaqAzYrSMIJOdEusJgcKOwXinQNHVhsjiStVqSvPHj4lnCvjdKZyyyvyZP
 4TFjAxP2RVD+aL6NOMrweevsjUMMK9uqLGF9kYVUd6DuoCWrlhCU33/d3gAF254b9WP8
 QpqxbmGHwYu1c3nio+XE+f+S6dnVnt2Txui3uqD2PdQxVye2oPdT30kxJlLmaH2JRvhW
 +Bak7cp6BYP1b5bFg0CsPeLRWh8IgdwJjjOjyLuO16kSVGJClmvPrpogp2tiaZ5Ce82Y
 3O9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0Sc8egjc4rvSV/0nfBg0ikoNqj4RXgWTqaMjIYJwF+elP2F1031F+7PcXRHfLKj6LExJTcDc7tA==@nongnu.org
X-Gm-Message-State: AOJu0YySQSaUqY2uUh+wsbLuOS8a453H7fUlPH9p7zkzxXcXLLPGgUU6
 p0t4xPYb8pvTgdQNCQIW8vjkl/2EMTxr2rTtir2kkvj9xFVQmDCEFqDLCfA6CPU=
X-Gm-Gg: ASbGncvtomO1KbAkJmKOC3g7SPrShViwzhGqoIQ7S5F0xzmJ2R+gUW64KGWixw3USnZ
 YY8qkuuATtMEk1e42gnrwuLuQCMmw38sVe70V44Qq+EPQ6G5SCMg8qKeM5K9+GoC4dALSQr6tj+
 aE2PDEtfobh02NGkY4wKo4tMlDnitsa+AwYDgpEOeZTuMPg9DnSZAaNJ17selFT6Ls8Lp8NFZAZ
 P4csnpcMWcD37dCaLhmlpJYCKJoRxioWAJoThQwjPm/gEvl96TdrjskVWZvpODt9SBzSWB330qQ
 WthzEcPK2Jjh5oeDKgBDSPqnW0uF6aU0Anwfz7uPQ19EQEpJCStKI6qRcXQE3K5/8k/9U6Zi5I+
 VVlYdcgTrNTEXmaAKOvQ=
X-Received: by 2002:a05:600c:6dca:b0:43c:f509:2bbf with SMTP id
 5b1f17b1804b1-43d911902efmr121371275e9.15.1743462286834; 
 Mon, 31 Mar 2025 16:04:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fcd0738sm134952745e9.19.2025.03.31.16.04.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Mar 2025 16:04:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 0/2] hw/misc/aspeed_scu: Correct minimum access size
 for AST2500 / AST2600
Date: Tue,  1 Apr 2025 01:04:42 +0200
Message-ID: <20250331230444.88295-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: GN8VKPteVfR/

Mark SCU MemoryRegionOps read/write handler implementations
as 32-bit, then allow down to 8-bit accesses.

Joel Stanley (1):
  hw/misc/aspeed_scu: Correct minimum access size for AST2500 / AST2600

Philippe Mathieu-Daudé (1):
  hw/misc/aspeed_scu: Set MemoryRegionOps::impl::access_size to 32-bit

 hw/misc/aspeed_scu.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.47.1

