Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp813458ejc;
        Sat, 28 Oct 2023 05:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmXC6qp21dkDpvJ4xEuzws9NXqJGmeUg9XNvB49R44CpWGj7RWbgqj4F3Wp0uTjm8ZfM5c
X-Received: by 2002:a05:620a:1088:b0:778:9c01:5dcb with SMTP id g8-20020a05620a108800b007789c015dcbmr4996470qkk.20.1698495892519;
        Sat, 28 Oct 2023 05:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698495892; cv=none;
        d=google.com; s=arc-20160816;
        b=By2Svo3oU5/VIw4XxDzzCTi2X2maCzAVSsm1Sg4+ksEKtqpb4e/iG5VT0BZCK+vu7I
         34yKefxkbt++3W2GB/yDjr9sk5Vje8FYxnnavstQR8XRie9eA/sGeuBmGJrheQ7sEwHY
         nVNjMURV75Tz8t2pCTLFyXiCU3kiFkCxUcnr6jPljxf4PnzvLcXJyiuS5pWSjvkW80uu
         Wts8inJ/RcJ6GOnlEDjbL6S+FqGM9zBBrtvbII875dyj0M9m2FWf0xaTTiWnZEOYuvmD
         tBJnNZ+ChzLdL4fWXGmogatvMhy260XCLbpYmDJu9fwP60uNQ7T575h0mwohHEQp1W/F
         LEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3625XLI1M77/QNI0XDsoa+gao97xuom6mXxW++PFOrI=;
        fh=mPN9/WblWXCg2g59vjErH+E42ODcsdjD5KgDEJZDWAk=;
        b=t4mPI76Age0oaCc4N2bhP3pPD1L2COJb4+PCr40GBpywl0rYS/Fm3vNIQXhIcnYBHN
         lMsuVBg2XeVbceQoPc9ytQV60QCqGEIfgV6wdBI4ezxUyUZk0PcsEzuLIUhYY4art7GH
         /TOfnb0UBvXDcmGVv7orVD16c+F83IFhitpGHFwXwkmQ0O6MkSncwYFqbIFenrcZVPHS
         lqziRKq3w8qg9++8hwsyrhM2cv0yWkI7c31aQa3kRYiPQHb6NaZ5Vk4MKGGmPNHTUVs0
         KRPe7a+CRpab1PtMdF9/gkj75qW1wiyalYYFL0B3tkXd68sq/z1Nze28qcmSC4w7Ol4v
         hchg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rw24mKHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26-20020a05620a137a00b007741ee6ce02si2149564qkl.104.2023.10.28.05.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Oct 2023 05:24:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rw24mKHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwiMl-0006Lb-6O; Sat, 28 Oct 2023 08:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1qwiMj-0006Km-Qr; Sat, 28 Oct 2023 08:24:33 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1qwiMi-0006la-5o; Sat, 28 Oct 2023 08:24:33 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso185392166b.1; 
 Sat, 28 Oct 2023 05:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698495869; x=1699100669; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3625XLI1M77/QNI0XDsoa+gao97xuom6mXxW++PFOrI=;
 b=Rw24mKHxFlHKhVNRPzjOcT9CnTTyt8oCFbt2CYJ7esLoJUFHOHpz2g5wXDKm9lOLob
 m3tX7Am9pKNXZKFOM+gne13n+bWHBN2Vn7KW0i93BcbBFAWngJPbNQC+DcjiXzC6VrDR
 zNUAECk2rfwsqKhOXMgChxdgsf9GzuWoAAFUhzQs1nqibj1ZHKzO4zZWzFY3vnBNDKaM
 EKTt5LoQaTsKtDJp4JXDs++Idsk9Bk/kQLL/41n1OcI0/6h26XoJG3byQ+h+8goUj9mY
 HC47n6V9C87frxHA4DC6ubACzJDR5ZflVRjylOahv+ZHFBYIVLyi2Nt11RypIPN4jNww
 0U+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698495869; x=1699100669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3625XLI1M77/QNI0XDsoa+gao97xuom6mXxW++PFOrI=;
 b=BEAa/psDC0GcQFygQGiFQGHLAFFRQEdR1a3olsYLxnbxOtWjOxFpLqe3YNfhDXkVfF
 DWq3TtLQfOJbg5AQSWmWxKmR2zpxhRtLomT6ZC/8mtxNcNLOU6n5xvXzgVhfin/Vwc+c
 m9OkkWPM0+sIVCFiP63QEAngKzBjGUQpgo8dLWUdQuYaJRt//M16ogClur0YLmyQSFmO
 BYYMbV5khbcQDDbKTY6oo1LotkCr2TgX6Hz+piwMiHxB2HzDno1cEOOkwoutp3GieMPi
 rQ3et20J7Pdq+u4RB3lYtEQmk122ipeNEJ6XBXQ88DuLJVweHaB850npoujdlaQ2Z82L
 IG2Q==
X-Gm-Message-State: AOJu0Yy1jDqK5r57IRc/PoKIJdL6jZOPVNyvlhXZdZLa/94ZsDhejHHT
 5i3YEhQlzl7tOg/gvJ/yOiu6lb2OStY=
X-Received: by 2002:a17:906:c103:b0:9c1:4343:60ab with SMTP id
 do3-20020a170906c10300b009c1434360abmr4574571ejc.10.1698495869191; 
 Sat, 28 Oct 2023 05:24:29 -0700 (PDT)
Received: from archlinux.. (dynamic-089-012-044-170.89.12.pool.telefonica.de.
 [89.12.44.170]) by smtp.gmail.com with ESMTPSA id
 a13-20020a170906190d00b009ae3d711fd9sm2706687eje.69.2023.10.28.05.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 05:24:28 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/6] hw/watchdog/wdt_imx2: Trace timer activity
Date: Sat, 28 Oct 2023 14:24:11 +0200
Message-ID: <20231028122415.14869-3-shentey@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028122415.14869-1-shentey@gmail.com>
References: <20231028122415.14869-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: 11NNWnMCLgkU

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/watchdog/wdt_imx2.c   | 4 ++++
 hw/watchdog/trace-events | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index 885ebd3978..891d7beb2a 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -23,6 +23,8 @@ static void imx2_wdt_interrupt(void *opaque)
 {
     IMX2WdtState *s = IMX2_WDT(opaque);
 
+    trace_imx2_wdt_interrupt();
+
     s->wicr |= IMX2_WDT_WICR_WTIS;
     qemu_set_irq(s->irq, 1);
 }
@@ -31,6 +33,8 @@ static void imx2_wdt_expired(void *opaque)
 {
     IMX2WdtState *s = IMX2_WDT(opaque);
 
+    trace_imx2_wdt_expired();
+
     s->wrsr = IMX2_WDT_WRSR_TOUT;
 
     /* Perform watchdog action if watchdog is enabled */
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index 874968cc06..ad3be1e9bd 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -20,6 +20,8 @@ aspeed_wdt_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " si
 # wdt_imx2.c
 imx2_wdt_read(uint32_t addr, uint16_t data) "[0x%" PRIx32 "] -> 0x%" PRIx16
 imx2_wdt_write(uint32_t addr, uint16_t data) "[0x%" PRIx32 "] <- 0x%" PRIx16
+imx2_wdt_interrupt(void) ""
+imx2_wdt_expired(void) ""
 
 # spapr_watchdog.c
 spapr_watchdog_start(uint64_t flags, uint64_t num, uint64_t timeout) "Flags 0x%" PRIx64 " num=%" PRId64 " %" PRIu64 "ms"
-- 
2.42.0

