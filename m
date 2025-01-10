Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp255528njn;
        Fri, 10 Jan 2025 08:03:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjPsiNZ3GQqYQc5tcAx7QDTi6QWjg/JbLdRG/8P19SyeIhX7/UELcZ+fIjZfoMx3YTzvcmmRGCUjeQuA==@linaro.org
X-Google-Smtp-Source: AGHT+IEXOKQAF6wRLQfvdgIVzIQXZP3GAWeMmWenZpvYzIiBOv9rRyLfjSCldKfSsY7d0aIrUPnf
X-Received: by 2002:a05:6512:b9c:b0:53e:1b34:fed2 with SMTP id 2adb3069b0e04-542845af7f6mr3467653e87.8.1736524984231;
        Fri, 10 Jan 2025 08:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736524984; cv=none;
        d=google.com; s=arc-20240605;
        b=kKM3zlBZeyW2FE5aSxDWcvNaExBrf7MxApuXm6Wac816Orz6L1ndy/Z9cQkLwLVk/H
         RCP1uDlrQkElrzutRkSttGFdw02ZNfFsxpVxsf3uV+3NYFAFNMqrY4NEmdyErr33YJVD
         QGfrSKGLolGYPgaFqKPsP0Pswmw72B9yIxhL5fD0qjzPRQDp5bOGQWwuzUHeGE7wZgMw
         RHBXeDrxg/K5k19pqm5BQrqJLxz8O+x4+N2JKn+20g6OQUGGHuYQWeM6JfPtdwlSuG1K
         hubmFUWdYUON1MfYChFDhQsEqyzYRpItbe8ot9xxjqBi66njk1yR+8itxQsjWYYYlaB0
         r+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8OLaY6F/9sCWhpY75SuT5qJrpcYslGi6JHoV5OFmEC4=;
        fh=DGUtKwFlF0P/i6LrT3pB3syTnsJg1g5M7E4bobix+ks=;
        b=JB08BMQ54CmVr/MC5E8kg7JwP3N/QgJsDutbVddbp8peKAEmnx+20uwKxbW5koVbQx
         HsY32cpp0SCy/uoU32nCk4+0Rap+/ZRU//JVmSVeHP17JwfSSgYwc+QTt7PF7BKOG/Xe
         akw96JQBe9OGuQVyKbAQJBwRaVD3RcdcQRlZjtE0wZHzqBxwR3hBfMiqkdetGl0LJXNp
         WF5maVdSrcosutTAncW6Xlxh+Vpf3X/laTT1d0zH2/8QYHf846mAgAM7fGgWcWtD4ni2
         ToLk3lS/NGlQg4eOBPos7X+a8E19IUD0C56hk70z5krDQgr62KEpSzURd3r+wlTSa3RG
         N0oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T+FAA+ny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2adb3069b0e04-5428be3ea63si1447932e87.99.2025.01.10.08.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 08:03:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T+FAA+ny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWHTG-0007HL-0h; Fri, 10 Jan 2025 11:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHSj-0007EF-4c
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:18 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHSe-0004B6-SE
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so16755555e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 08:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736524931; x=1737129731; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OLaY6F/9sCWhpY75SuT5qJrpcYslGi6JHoV5OFmEC4=;
 b=T+FAA+nyOKwyshWmmtkrvFF1xwpqpnkjsmAHRpOoq/Aoj5rTl+VhR7dbtBW1nlzejQ
 s8CCyxsYIeVC7dZyr/YQEaVvW5sm5uCDIaRkNcLpzdfXytToRPNj2FVEvxyl8JqGMQ6O
 Pc9E/fMQZtLrtoUpzgxJQk0aSOefNktYJCzmeoEOMzLpFy893NOhTOCJrLfkMRap1VDM
 geRTJyqH822K/H5tkeXr7lbQJ7Lg0lWBiiQs62Cc4jZ55kZIm27YmZ4RqZK5DOfWtf7Z
 hACn6F2L61UvW6eMmG98XpFKxvjPsNDB5/jYNUNSc/4wP2Sbk6Q8r2KbhrxAxJZ49tEB
 H1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736524931; x=1737129731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OLaY6F/9sCWhpY75SuT5qJrpcYslGi6JHoV5OFmEC4=;
 b=XQPgKNmTiEHiYgtq0De6FdEcg8iMVqO24zPvpl6juKRgHgZdaSBKolHgmZVaFHcQWU
 C9alphjvldiRkQnu3Rbm0ch5NuLAelx1HELqrThM3zNZm8b+E2qPeDG6ui7yRlZ3yk7R
 Bfhzk58POczsF1w7FvSgko3siFf1CXrxs0QbP8pQcAZ6YjJBrIXfsHmHu4tpxtkJo809
 tBe3imiZcIYQxP4JW18NDKTMQObQ5HqEtMUmknbLKBcrndaPpGls+hjybTWBLdOm41iL
 Vi5WOlMLvIFQ6O0+ATfBRr+l8c8uQ4clEkG6oShNhkNTnSf6+7XAwTzVEYm2jpp3S/tu
 DE8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdJyw3ollgPNtB8OcuZ4ifjp7D9egKBOgFFjFBLc5QIP/yCFd/d739ZCtKK47cD4ay+GMkCJC72Q==@nongnu.org
X-Gm-Message-State: AOJu0YwbQ4NFtQVzI93SWCKWx0pVtO80bxpdwByQINexRoohE5F4dlib
 g3MCieWit7D5LtcErnkQskDNBx+M1IP4gdhNNprfLMal2WuUviaS3CormTH3qhSqPttxZOjCVg1
 a9Aw=
X-Gm-Gg: ASbGncvJjmqiO07QgzyECbdKFxWxrlFxb5G4eaDBcu1RaaUs6IA4L4+MV3GTUlzExsf
 QXTdR3zx76qD9Qx62u0ofmlWw494MdoQiaKFr1evPiWJM9vq21dhj39mDfI2JK7dmqhura157Po
 ybyU2XE1/pVGL9m/pQ1rQDBuYbo/zqKtlc3ua0WaNftiEpAG6QkHsmIwY7tkc70LqIH8sfbHa/K
 5Bx9Nd3rVOCw72otr9Pu7riyVkWU9KL7pfeFUGmlCfm3SQ3D9Cx5QN8ZlD2Sxl1Kp2AtoWoX3Kv
 utIpKxiJCyL3A5ml7WbvfL7VfidEQTQ=
X-Received: by 2002:a05:600c:45c3:b0:436:aaf:7eb9 with SMTP id
 5b1f17b1804b1-436e26f4ae1mr102177955e9.20.1736524930526; 
 Fri, 10 Jan 2025 08:02:10 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e384054sm4880929f8f.36.2025.01.10.08.02.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jan 2025 08:02:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/9] hw/arm/stellaris: Link each board schematic
Date: Fri, 10 Jan 2025 17:01:56 +0100
Message-ID: <20250110160204.74997-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110160204.74997-1-philmd@linaro.org>
References: <20250110160204.74997-1-philmd@linaro.org>
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
X-TUID: aVd3zNnUjpHD

Board schematic is useful to corroborate GPIOs/IRQs wiring.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 1bba96df14e..9b414ff9069 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1379,6 +1379,10 @@ static void lm3s6965evb_init(MachineState *machine)
     stellaris_init(machine, &stellaris_boards[1]);
 }
 
+/*
+ * Stellaris LM3S811 Evaluation Board Schematics:
+ * http://www.ti.com/lit/ug/symlink/spmu030.pdf
+ */
 static void lm3s811evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1395,6 +1399,10 @@ static const TypeInfo lm3s811evb_type = {
     .class_init = lm3s811evb_class_init,
 };
 
+/*
+ * Stellaris: LM3S6965 Evaluation Board Schematics:
+ * http://www.ti.com/lit/ug/symlink/spmu029.pdf
+ */
 static void lm3s6965evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
-- 
2.47.1

