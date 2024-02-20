Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1166614ejb;
        Tue, 20 Feb 2024 00:54:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWLbsnLxkM2R+KmkHc1BfJ5ibh0lDllNxc1kH8IfD270xjfFOwXNCvbzBNVZsuAtuOJBwXYCSVceesr7bQgw2qHDU3u80ln
X-Google-Smtp-Source: AGHT+IHHNuke7AZcum3uZdY1N7z6HG+D8IsRsi0EIuOdv7Pz8S4Cr6hII8Vi1KDsJe8zXfMFJAND
X-Received: by 2002:a0c:de09:0:b0:68f:2ebf:851d with SMTP id t9-20020a0cde09000000b0068f2ebf851dmr12146308qvk.1.1708419253531;
        Tue, 20 Feb 2024 00:54:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708419253; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8sPiv5nnoldy6JbrOwQfLMzwSDKVlRsMT0SYcNAPVsjmgLBE3hnwjwWAXRatppa+o
         7gYCd9RT8uNGt2FoqvtNELP5fwV9cgeunG3tFP8ikCTD/TT46VIQLab6Lu3dLxSpcT/o
         Vf7GPZin341PhRiPvFOPfy/QwC70kt6x02eWXMZ4TRxgXyhtgMO+7j1HBiUHKbNU6c/u
         LLvtkG+3Rrlb5bz2xcE41g1iZqZjPJzzYsXsEGOwSQ5irsoCawJCug1+IVIcH24ZBfPP
         za1eNk1P7eTVg8iYRjtL+BVN0l5WZP9bjo/o9UyUwszkp88JUdMFW7eewNQvz8zzhQi+
         NiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tZji5wyrV5xt58PDS30yI8Y6P72XZ/u9rGD8EwbSOro=;
        fh=0Q2k1n3WQTv6W9R/RWZKzQvQlBdkba0gr9m6nbLDQaE=;
        b=gkJscwIyv/YVYgP06yYND/1X64BCScUQ7lkbv3XxAAK1QHMp4eY5OTcYa4wirM0WIE
         x5oajOfAK3lqT8u+QucHHDJ1FGGS/wGkIFY8tYAMFercITgCm/u1bjJUgzx+hCX+pypw
         k7j7UtUVnzT8yl0Qc/CEH2BI1T/K9uKvFAnuBnnNVnGT65Km7S+0NbZ+px7gPP7iCnbD
         BSj2aYRUGQ85iX1WJwJxnfUKfx5kOfbuHkWLX+e3nx2+sSps84lv9LYmp9azAMnJS/B9
         tPHM1iqmSLJphy5cSDI0x6WlCOveuBK9COW8EyiioQlfl+E/yNtGnQW7TTzOhPpPcKZ7
         2tKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sbj+UnOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im12-20020a056214246c00b0068f2bb8bf9esi7933225qvb.65.2024.02.20.00.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Feb 2024 00:54:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sbj+UnOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcLsb-0000V8-9f; Tue, 20 Feb 2024 03:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsX-0000Nz-Qj
 for qemu-arm@nongnu.org; Tue, 20 Feb 2024 03:53:29 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsR-0008DO-Hn
 for qemu-arm@nongnu.org; Tue, 20 Feb 2024 03:53:29 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a30f7c9574eso664230966b.0
 for <qemu-arm@nongnu.org>; Tue, 20 Feb 2024 00:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419202; x=1709024002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZji5wyrV5xt58PDS30yI8Y6P72XZ/u9rGD8EwbSOro=;
 b=sbj+UnOzJtD3AikVf3btL27l8M86HLTS0o88w9xAZtXQHnnFeGno13Hqkt0eePKjDf
 t/ungRJjDezBPdNHBwPq4tUNu3t+5zqJZSELlGiGvhTJ1L+BioJP8CK8Tri7y3d17RUt
 G9KAOrHHZxM+Ad2LQO8lkRhjExKfefoke/9SiI7/bgUDM4O5frv9kGabrVceReXl3tQh
 ugGpVZi4x/7R89Nh8mGxAqP/10VFX5GYTc8lVPuE1+XX8ng07IVFtU9cZ/AwqR1dtEdD
 VVqkjooomPyPAQq8+pUVgtLssq4/GAMb9D6eRWHl5Ywkn/uDsXQNGuhyTexcW1x6HAZj
 MWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419202; x=1709024002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZji5wyrV5xt58PDS30yI8Y6P72XZ/u9rGD8EwbSOro=;
 b=gydEU/F+NAsq2id1wah2wet0e8DHF2NrqWJYfcvchO4BKDmILTUZbYk8iljjWB5mJ0
 b5k2NA7XA0ESDlHUlJ2ouoyru+GAJfq1h4RPsPMhLLeuvReL8yZdTDGAO6jj/Bexr153
 9CR4CTURreeWpv7HDVGdJhdq0wedkLhdoCw92tJMvqi6zfhaJ2pq8yj3PM6IPwiqEBqh
 6yAOZC1vp7deFGYWSpnQw5FM3Vv31XHIfSqgSNVXwsnEF0hcQEow2+uD4sDh/Wpj3IG7
 zWwSmgXf5NQ1O2LgHTVa8XSOcChHuhbTm9Ck/26cIrCPxd05csi7phOU6JcX8ifoB+Yy
 RNYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkkoclD9WMLeAOQxQMNdUYsPZF1LVXLggnLyqVeuKeCDVx5VC5OTsHYlq53Ux0cgxdUrafeeHLpE3+0bGtffDZYN69
X-Gm-Message-State: AOJu0YzyyUT7x6V8L1tsJ3i4LiH7/LedxEkgahS5bd5xTvYQVVqVRyt1
 1qoN2hTrjCYZwuHOvEwi8d2ZT/wHiAK/JhzLhhj+OgIy7ZLlwj/NNKMwCkHtTB0=
X-Received: by 2002:a17:906:ff52:b0:a3e:9c2e:40d5 with SMTP id
 zo18-20020a170906ff5200b00a3e9c2e40d5mr3099984ejb.5.1708419202262; 
 Tue, 20 Feb 2024 00:53:22 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:22 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH v1 12/21] hw/net/npcm_gmac.h: correct typos
Date: Tue, 20 Feb 2024 10:52:19 +0200
Message-Id: <c81005d5160a7f312d8e0f7120d601219e4e5e09.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: 7LnqimAZmhrv

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 include/hw/net/npcm_gmac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/net/npcm_gmac.h b/include/hw/net/npcm_gmac.h
index f2d9f08ec1..6340ffe92c 100644
--- a/include/hw/net/npcm_gmac.h
+++ b/include/hw/net/npcm_gmac.h
@@ -81,7 +81,7 @@ struct NPCMGMACRxDesc {
 
 /* Disable Interrupt on Completion */
 #define RX_DESC_RDES1_DIS_INTR_COMP_MASK BIT(31)
-/* Recieve end of ring */
+/* Receive end of ring */
 #define RX_DESC_RDES1_RC_END_RING_MASK BIT(25)
 /* Second Address Chained */
 #define RX_DESC_RDES1_SEC_ADDR_CHND_MASK BIT(24)
@@ -213,7 +213,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(NPCMGMACState, NPCM_GMAC)
 #define NPCM_DMA_STATUS_FBI BIT(13)
 /* Early transmit Interrupt */
 #define NPCM_DMA_STATUS_ETI BIT(10)
-/* Receive Watchdog Timout */
+/* Receive Watchdog Timeout */
 #define NPCM_DMA_STATUS_RWT BIT(9)
 /* Receive Process Stopped */
 #define NPCM_DMA_STATUS_RPS BIT(8)
-- 
γαῖα πυρί μιχθήτω

