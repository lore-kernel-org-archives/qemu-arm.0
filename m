Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp258803njn;
        Fri, 10 Jan 2025 08:06:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWiTs41NIHEov3kNY8RbKeSWnAgtLFFC+SYEOjx4ez0dl0+9RDSCRbiG1pexqSJKBezzbOOFKiz+/HE4g==@linaro.org
X-Google-Smtp-Source: AGHT+IEVnvFoKinyGi2CCTb9u0GJreAahAJsg7agOeawMk8azjZwGvshIKMEq+N5rLDz5JOdNLSD
X-Received: by 2002:a05:6214:5097:b0:6d8:d79c:1cb2 with SMTP id 6a1803df08f44-6df9b1f4714mr185379976d6.21.1736525185860;
        Fri, 10 Jan 2025 08:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736525185; cv=none;
        d=google.com; s=arc-20240605;
        b=SXddtv8ZLBaQkjHUSoovOO1lm9ipBK+SXn3o0UtNT0T2xfcu8P16SWm5+BNRdKkPET
         +mvenWzkQfJmS+xyBH9tiLkLcACZgZ9MbluU2RSVu4l4Va+PuZDCsUv9Y1/6uUxK/MeY
         C5PUz7t9Zq1jL+C98Y6ygIWlfPbbnrfGOCY6oc6tVkeSfwpY7FAnU9nU1ZdC9KoCayPV
         leIVA7gBkC+3EPeEUjtlu1IKz2Vgk6l84cFaBaTKBtyvh6K6PaRbBiPScbmYIX1jrcZH
         gYXIxeFVAs318StRvKimS/uMYcBK0oISRzIEkGu45ce6IS63NfUrMsgp321+aDr2/4XP
         XAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7A9IXq/spVXRimdeXf09n3U9AxOdbCQvvzQ3zUBrjYg=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=NfUF6PILSwPnJb7J3t0xpJP+tXlhzzU9uTUG5L6wY+/7XUwQqQmsNrppQO1YOJUPZ0
         8PbwdKlhZ1Xe7in525aT/WFe9Bu4PAVbI5SNgaAa94R3WILYoo3OgutM5gsJ5NjPoVdT
         dVzScyETYJ/zcHw7EQ+WpPPYrYtiyAyVML3nkAsm98E2Gk3XdChOtobZ8bcMbRX1w+N/
         9sRz5AsyE9vflpmyJLiQ4Q/b4VVMLMRnBunvPXlzpK917ps/gRiyrE8emnYe1Tn2J9bH
         HSRIXpHssVAO8UJ5MSHrJn7pEIsNXaG9uyMMP1gL4+tD8HEpbZjFWPUJb92EO3MKH55I
         1yFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NrvxBTpI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfae0157a8si22728186d6.458.2025.01.10.08.06.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 08:06:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NrvxBTpI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tWHTr-0007m1-UI; Fri, 10 Jan 2025 11:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHTG-0007LR-VV
 for qemu-devel@nongnu.org; Fri, 10 Jan 2025 11:02:52 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHTC-0004J7-5q
 for qemu-devel@nongnu.org; Fri, 10 Jan 2025 11:02:48 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436202dd730so16589995e9.2
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2025 08:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736524963; x=1737129763; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7A9IXq/spVXRimdeXf09n3U9AxOdbCQvvzQ3zUBrjYg=;
 b=NrvxBTpIYecmEp+OC5FxLT1oIMagjrbHBH9hjuUQoSnMyW70GfOJKuzw/R2UmwU07k
 YJ2p+V8e/rFsWNrB+sQuY0jje090jnkByFJw9+0KxTBUwpYQk5bZPS61N8t9UKoYfRKk
 FQ9reIGvN6z4BxgOQALGFxu2h5Hft9w2kQyGhYRZJgJoMcnRJklvsxdHH3zx/Zu9uxMY
 up2d8MHXVABEtfJeM4m54nbRDyZNcVN2dJqfWCcLXJaYqLLLUnjySE+4vPuUDn7+OSKz
 gBastfbd2YV+7vBCj1EEk2H6UZuRpa8Sl2CiT4VvVhdG9HHPkUtBmhfYNrKYGHW+F9Rr
 uiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736524963; x=1737129763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7A9IXq/spVXRimdeXf09n3U9AxOdbCQvvzQ3zUBrjYg=;
 b=krsPARw093K5AvT1CPGcpzjjbiOpNJI493clO4oGGu9lsJNnVQeBBtXwSBgtf82fog
 kqPFGdB8ab0UiNIs2jdm+1OJfpfvLKUr8Z8i+QGdde7wHScThOh0eAYfWAw7cy9UIKzd
 YWQR+nzw1pkIXdm1Qwvkzm4LQHiLKxr0l+EtQdaqvAHbwSv7kWdUBY/3sk/c5lvtywrA
 38iWzFhJXQDW5uq72i+3QjyX2KYZ4PnHhjHrnrTYmQ5jCkgFOImL1PDV3YOUW5h6tC4/
 hbDLzpp5RpMedZDAaPzTjzvprv7pwBZkkzd3RcaEKkKTNbMufC4zeW6uO2V2bo0uoDUc
 ODxA==
X-Gm-Message-State: AOJu0YxcQxZUZYC3HvqU7d7Se4k1tLdMqZkvon6Kope2LpOeJB8A8OxE
 fJrQ0O6kDytTcfdyJx4Kr2TCm1fQW8QFs7eEk3PNelWj/VU8Kq3G1GfApLrhgwetpiFaxbv8MXt
 TP2Q=
X-Gm-Gg: ASbGncv2g964JwyCm/gsYs875F2jI3pURaGDsRsyV51ssNu2exxvqpqFmRNVJNaPJGF
 wuBKwTAlaRdHKmnxlvM353DxMpbHgfnztaYf9Pgmyi4is3s/wuNXFUFJmqvATc3J/ZIBR82Ocq8
 ZuNkN7mAzKqRhXEPlmPks+C8no1TNSO+cwz2hsVu6YrCYD+6yIisHjrQqff7jy976hQkbzF/WCC
 qFZ/61RU1VdDSN2G/otjwIcI7l6UsFG2lKi5e/m/SGh2FX2pTQZVQVVGyIGh59Y7H1Qy0nylqRV
 Me/ipwJY+vKbwC5s4ciuSpg6fy2PIno=
X-Received: by 2002:a05:6000:4714:b0:374:c4e2:3ca7 with SMTP id
 ffacd0b85a97d-38a872f673cmr10174513f8f.5.1736524962661; 
 Fri, 10 Jan 2025 08:02:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38397csm4794123f8f.24.2025.01.10.08.02.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jan 2025 08:02:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/9] hw/arm/stellaris: Only map existing devices as
 unimplemented
Date: Fri, 10 Jan 2025 17:02:03 +0100
Message-ID: <20250110160204.74997-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110160204.74997-1-philmd@linaro.org>
References: <20250110160204.74997-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: q1XvGzjg3w5a

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index d87587225c2..c89522332e2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1390,11 +1390,21 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     /* Add dummy regions for the devices we don't implement yet,
      * so guest accesses don't cause unlogged crashes.
      */
-    create_unimplemented_device("PWM", 0x40028000, 0x1000);
-    create_unimplemented_device("QEI-0", 0x4002c000, 0x1000);
-    create_unimplemented_device("QEI-1", 0x4002d000, 0x1000);
-    create_unimplemented_device("analogue-comparator", 0x4003c000, 0x1000);
-    create_unimplemented_device("hibernation", 0x400fc000, 0x1000);
+    if (DEV_CAP(1, PWM)) {
+        create_unimplemented_device("PWM", 0x40028000, 0x1000);
+    }
+    if (DEV_CAP(2, QEI(0))) {
+        create_unimplemented_device("QEI-0", 0x4002c000, 0x1000);
+    }
+    if (DEV_CAP(2, QEI(0))) {
+        create_unimplemented_device("QEI-1", 0x4002d000, 0x1000);
+    }
+    if (DEV_CAP(2, COMP(0))) {
+        create_unimplemented_device("analogue-comparator", 0x4003c000, 0x1000);
+    }
+    if (DEV_CAP(1, HIB)) {
+        create_unimplemented_device("hibernation", 0x400fc000, 0x1000);
+    }
     create_unimplemented_device("flash-control", 0x400fd000, 0x1000);
 
     armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, 0, flash_size);
-- 
2.47.1

