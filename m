Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2185935ejc;
        Mon, 9 Jan 2023 03:54:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXul6hbmItDwkHQ+gwQ2Ow7izVxoAI+ujuqk04hQadrvGAMOfWnGWO0RRhOAWdIQodMln3cv
X-Received: by 2002:ad4:4152:0:b0:532:2d6c:5deb with SMTP id z18-20020ad44152000000b005322d6c5debmr5653734qvp.27.1673265289055;
        Mon, 09 Jan 2023 03:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673265289; cv=none;
        d=google.com; s=arc-20160816;
        b=a876b1DVp3sQWkJWvBGnfe2UiWfCtYaRJr19KDn7YEvQ2QrjX+vrofdeGCnhfQdWhM
         myAoclFnkOnEIjgY5SE8qOu+zmCeEBZqlT4kwRJ6felm3Zv6m8a0GC0XAiZhzo8vPDUK
         qXkeN3594yMrOlViqHRPDJe2C6IuoSrqyojx8WpSkAaHIDULbF4iuxtgMkY99+ME8u7r
         xp9tUWLkMNPKqNyY6eF6upiwtWv0/rO+q/YSpINP9WstxKsnn67nKf10ckAHB+U3E/Kg
         LPhEEz1je3iK27GLEUNLdWmaqIsUVWKTHf4saahZWO0fXU06DcDc6cO423OYiykcDgnk
         CF9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5Ex3NPUGvPkrE4NbytzYcH01U3eur12SK2WO3g4Dkuc=;
        b=GdoN3h9p6dOrNpHbgMyqgSF/v4enyrziJ+meKL/tWXgZufXG+Re1vQQsRVRMuk2RKR
         idShfwHh7TpAfPG7qdmP6l68yaiQ3M+N24lVtaTRwizPWVM/J8b/1wh0tfdlx3Uqy3Zk
         m8hZ2CkKcUCBTYTkDlzz85y7tzJ/GKEw70yDjN7cgn+0TtdjxEFZUuhpcz4Gjk8EQO+t
         9op6jOsLh7oPwb+Pxv0Ywaq1mZMd7+mombJw1d4xqHYnZCF2wpg67xPMjG+Br/UpnJ7J
         RW9iRYLGZiX0wl371Qepj4tiBdDDC9e7gl1gp7L5B86HOwyZ2LZMjvZsRVhO2mkSngGS
         erIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=roX9pbyN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t28-20020a37ea1c000000b007023bb9a15dsi4320061qkj.530.2023.01.09.03.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 03:54:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=roX9pbyN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEqj7-000394-9L; Mon, 09 Jan 2023 06:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqj6-00038c-J3
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:54:04 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqj5-000894-05
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:54:04 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so8788537wms.0
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 03:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Ex3NPUGvPkrE4NbytzYcH01U3eur12SK2WO3g4Dkuc=;
 b=roX9pbyNuYzkTx5SFY4T28SUdC6McGy0ZFo+OU3EDN/uBL8CSDu0c/Jz4nzsxvSxC/
 PWl/ZbXVxMf76NngqO3p479YO0itIdX4kXx7+Fnx+kNOfhXfx6diBx27Xks/PYNL1Dkk
 PKSv+wiHAfuaIEef5sqMQrDUyyx0dKTb2Lj9/3z4GE/M22x7y6B8bfH1xeuJFwYhetQp
 ru9ouXwWk+tATYFui0G7bfilQAXhGSPoe+kjw47W+T9mKZQf2UpCC7SUKq5qr+ed2MeV
 k+Ytm0LmwBvYWKaifSN3Qf5tDtLgGLD1ggazYklEFtWotkmGNhkdhoZC/LdauWFPyHhk
 8IjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Ex3NPUGvPkrE4NbytzYcH01U3eur12SK2WO3g4Dkuc=;
 b=z9aF5Y23hX2apMAlf11EF6/SfsLwzli9JvX0f8MbFpgtRrxNS2jcF41mNO9/VrRmE+
 7JAIpT/WPb+4Ux4bF3Z+vkmjnoT3jJWZi6UIA5vs3vlFMiBzXMR0hTneJ+8Bc72O3Jwi
 xoe9Kit5Y3UNlkF1xccyzJMxqbF/PoT2lihZ5NalF1fZY12i5p5dtcRsdHS00fdE1bhL
 OtDxctwIthzLbUD3t3azZSxnYfTT6H5DKSp32GDtBl7nhjDggcDEFIGaj5F9zBpzSpJg
 XF5Evu5bS1ZxDva+S0BsoY94AuZoJq1aA+6s1qJ/488uReZ9l2hCFpbGlr9BnTUge7KD
 VgNA==
X-Gm-Message-State: AFqh2kr7k2KSBOXKVqlYeNckKL3DA7dc1RBZQlGTh3AlGYhZ7wuxHzBx
 8A8R0I7vEn66a4Tcl5J2gOyNjQ==
X-Received: by 2002:a05:600c:3545:b0:3d9:a145:9ab with SMTP id
 i5-20020a05600c354500b003d9a14509abmr26827508wmq.39.1673265241710; 
 Mon, 09 Jan 2023 03:54:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c458a00b003d35acb0fd7sm16646985wmo.34.2023.01.09.03.54.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:54:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/13] hw/arm/omap_sx1: Remove unused 'total_ram' definitions
Date: Mon,  9 Jan 2023 12:53:12 +0100
Message-Id: <20230109115316.2235-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: QlvjBwHDPdyl

The total_ram_v1/total_ram_v2 definitions were never used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/omap_sx1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 57829b3744..84b7059f7c 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -91,8 +91,6 @@ static const MemoryRegionOps static_ops = {
 #define flash0_size	(16 * 1024 * 1024)
 #define flash1_size	( 8 * 1024 * 1024)
 #define flash2_size	(32 * 1024 * 1024)
-#define total_ram_v1	(sdram_size + flash0_size + flash1_size + OMAP15XX_SRAM_SIZE)
-#define total_ram_v2	(sdram_size + flash2_size + OMAP15XX_SRAM_SIZE)
 
 static struct arm_boot_info sx1_binfo = {
     .loader_start = OMAP_EMIFF_BASE,
-- 
2.38.1

