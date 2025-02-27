Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp367822njb;
        Thu, 27 Feb 2025 09:03:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLmf4Hc/u5vuehcySdex9QTx5hLJZvYG/fCjOQv2NU839iZkxKLI2frsIMRTwEGO/kDcxIyNSFnoZe4A==@linaro.org
X-Google-Smtp-Source: AGHT+IE3ZSW7YWhF7aCyocNAD44kE9JLMGRngS3gyHPlDHQfjE7IP8QZIccHWl2hknY9NvTgsc5o
X-Received: by 2002:a5d:6d82:0:b0:38f:2b49:7bfe with SMTP id ffacd0b85a97d-38f6f0ae7eamr24123324f8f.47.1740675826038;
        Thu, 27 Feb 2025 09:03:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740675826; cv=none;
        d=google.com; s=arc-20240605;
        b=cxQEjLVKjmmfPEpOqg9b9n96HVAurm74WrAuVOd5bP42aaFLWqHVn5XgX6rYmHL7UA
         4Xc66xp4dWrrisRArYOqDHSWxf7hfCrwVgWB7GiiPbF4ob16SUjStsmeyoEW7gbEgW03
         xWV8QHt+7IA5By3M0MyK3S4T/0sf3KNy5uVJ5JCAJ6QSetUdtxDf6eIAENnKpYWYXbdZ
         7Uu6iKDScAVjSAR8XjL3W8MA+DPot0ggoav/x41IM4zP8Et9bYLEaHrG4YxHuqlvJ8SZ
         FrItaysDjQ/2yioYI4zx2D+KBT40cKXR6SuqgurqwR2mHDPYtrkXqAbmdMYRVEcW9I4H
         J4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3K/8zo+OPQ7fiQIh7CxNG3iVbX/8VRGnrPe58kHl2iU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=FU7bUAbYWvN/9q+OZSFLRv7w1gt62aeUI+zyLqmcrvFO0hj/hHVuElhnxs5Ts7NgIT
         KhMcqB+lJ/6HtOYnauk4DhSH1qz7XYzyhJppH5CTPQ4285At5JK1mRcx7chWay0nhmVV
         y/cDetUBQApkSx8RSORqxFw+Ai+L3eeuePeotIAPnou3r+a+Q9tMjQ1fsZyWdlaba/XG
         QroK7hPfjFrBxNz9ZQGl9C4KKEVuu/tgclxf+1DPjbZhqhPlUhdlBIYSuEDnA1JO08mO
         HOGQ3f0M6L3ovKsTrkfuIQSsWAi5y1iv+hiAAMSUMMFdFmwj7t1ZRvtY6aY/D8FSpzfb
         fXow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uyImSSoy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43b7a26838bsi13946895e9.101.2025.02.27.09.03.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 09:03:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uyImSSoy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnhIS-0006qi-3S; Thu, 27 Feb 2025 12:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhGX-0005D4-Hu
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 12:01:43 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhGR-0002Lq-4M
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 12:01:40 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43989226283so8492755e9.1
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 09:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740675686; x=1741280486; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3K/8zo+OPQ7fiQIh7CxNG3iVbX/8VRGnrPe58kHl2iU=;
 b=uyImSSoyNnxcxSJnKA2iwvKKvbEYpc4gM3bjIXFWP7laxmiU5he5YeLIxL70FuzS1k
 8w44UkOOqNYiD/R8GHWrQrSC3AqG2amU1NBndULtjFmJGzYX3cz412HCo6N/7C9BBV4/
 zJlUUDtuzqlr023XAzdxyBr0mfRU3ngbCasxa2muA0Zf0AIBd1jS74np+cmHnGb76miE
 ud2dMUae+wI9layQOSFro0L/dgu/JI7Hu9FsXqXG6eSj2tK+vkG+NzqzkpTAd2gynQfB
 3y9bKbttB3WLvmpdHOXT5I3RhSPngRzAI3KM++8n5eVwk9AB/L2r2KYgsysW9L6FBam+
 ClOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675686; x=1741280486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3K/8zo+OPQ7fiQIh7CxNG3iVbX/8VRGnrPe58kHl2iU=;
 b=vRy2vp7opTv0ToZFVKY6ttKRF73w8rO1JRpgdHD3f7F7cIhv/qf/mgz9Dah8/urv6e
 qeAdxNE3QQUscOAGaArkahcNFdxkXJlVLY9nftG2v9JOYY3Nn2A2gSH70rx2+Z7/HLAH
 QoIHH2zmjRwh8YCLZKxW3E4/JFQrHIEL5BXC/AKyh/nXyqH7rm8IQ4ROAJySZWC0ps4W
 OOdZtnWsHLZg0PLeR94rIy5VKE0ZyoXF8JAd2dJ0bT8eV709cVuqalxWplHN1QzM3swM
 BumBYLjFEpZXGm02ie9qs0JErjbPWXcS/+UrUsmRImfw1uHLtvHto6rxNYnNKTvgwc0g
 ed6Q==
X-Gm-Message-State: AOJu0YzfASDXybiD0QW4Tp7b/ClYI+kMVMhd64KRWfdtq81Xwt473+fn
 Scys6H8iZALuEn6Iw9fGnerUUJmUkpjO+THN2B1Z+BtJSK8ThNsk5rA4ZgMc74h476vK9VkmWRp
 /
X-Gm-Gg: ASbGnctzTfuXrbhSSvqVIU4TyemQBv9C/vbY4zSRcBE5rovJSKxSjHmksDsSgfY+YNV
 DC6IM5l4B8nfdN2svfhZRZrNL1tUXDElLZTjyTcpQdRf7/p/ME+6bO+Bl5F1++z3BYHMuoOArFT
 wH+kdfa18v2pkFcclA+SGeUdJjMh66e85qlpMgHuEOZIUxWfs78bgFfZEesAiXoTdVTZ8v/j82G
 G9BPybDoQHIIJbDOVt+94chRbb/XzzBJCbTtf+LNnSSFFF0E/lwnm1ZsKCuqHbzUASE5bLKC2Cj
 tRjvGhfjn5pRuuFRH6dPuN8LKUMDg3+I
X-Received: by 2002:a05:600c:4686:b0:439:a25b:e7d3 with SMTP id
 5b1f17b1804b1-439ae1f4153mr274745565e9.14.1740675685648; 
 Thu, 27 Feb 2025 09:01:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5871f4sm62747565e9.39.2025.02.27.09.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 09:01:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/arm/versatilepb: Convert printfs to LOG_GUEST_ERROR
Date: Thu, 27 Feb 2025 17:01:17 +0000
Message-ID: <20250227170117.1726895-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227170117.1726895-1-peter.maydell@linaro.org>
References: <20250227170117.1726895-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: R4sKUfdHCcRz

Convert some printf() calls for attempts to access nonexistent
registers into LOG_GUEST_ERROR logging.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/versatilepb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 941616cd25b..35766445fa4 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -27,6 +27,7 @@
 #include "qom/object.h"
 #include "audio/audio.h"
 #include "target/arm/cpu-qom.h"
+#include "qemu/log.h"
 
 #define VERSATILE_FLASH_ADDR 0x34000000
 #define VERSATILE_FLASH_SIZE (64 * 1024 * 1024)
@@ -110,7 +111,8 @@ static uint64_t vpb_sic_read(void *opaque, hwaddr offset,
     case 8: /* PICENABLE */
         return s->pic_enable;
     default:
-        printf ("vpb_sic_read: Bad register offset 0x%x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "vpb_sic_read: Bad register offset 0x%x\n", (int)offset);
         return 0;
     }
 }
@@ -144,7 +146,8 @@ static void vpb_sic_write(void *opaque, hwaddr offset,
         vpb_sic_update_pic(s);
         break;
     default:
-        printf ("vpb_sic_write: Bad register offset 0x%x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "vpb_sic_write: Bad register offset 0x%x\n", (int)offset);
         return;
     }
     vpb_sic_update(s);
-- 
2.43.0

