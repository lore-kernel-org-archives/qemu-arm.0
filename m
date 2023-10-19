Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp802006ejb;
        Thu, 19 Oct 2023 14:23:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3oDLDbcgvLTt9Yk/m4JU+JL8Y6iM/eSFQDOVbRpsS/Kq6b9sQzylQ7C258aa/zUpiYKDt
X-Received: by 2002:a05:620a:2887:b0:777:6631:85b6 with SMTP id j7-20020a05620a288700b00777663185b6mr3862149qkp.39.1697750614974;
        Thu, 19 Oct 2023 14:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750614; cv=none;
        d=google.com; s=arc-20160816;
        b=eHlJln/OZWd32bewJGCk1AhI+qUtBVojSzTj/Q+NGwrVzYVktriVqF22vQGyyLB985
         6MXgIMrxLUKkr3l7bVMR85PAJ0k6ii7Gr5qF2O24BISvSv2gOjti/epjQ2ZWLJoF+t4c
         ZQkFACu64E9tq4IIaKWjfqRHXRDRwGCx499CTu1BNPqfGqygcjEU5XieA4GDod5JPiyQ
         YRSUmzzKnL0ihvKR6lX4mFkDiNxH/EKoa93uwayrvLpw2LRw4YrapTvwJGLCQPGU+6/p
         enUFynjSSX/3B2ab27dyy/YBRo16TE6UdveWRViAWc8lDyBVKxlT8YNjn1SyePfPZrOO
         JUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QiDSBb1U1Y6ntpHTs6MX3TQXj3gIN80QBkiJrswp04U=;
        fh=/VuZmIqr4bR18HTgg1hSyedIsQzndzO0C0UCJ5egpbw=;
        b=0wLhR1/d5IMPOWzJD984aiVwgk5ICrQRUyJji+I6KoJni6Fgg9qJ2qyY9ppxHctQ4G
         Xd/p+QXSXrjsbvvnKRWXUjsrnNFGZrPP8sp5Iu1UK5wR3fzLRRasBcZvOihUdKB1Yf54
         l1TRDGV95G4cyjPe6OFWyhZTZw0noQvdyEjNRaNWMZFLk5xIxrcsTQXFQPkObC5Pi6Kb
         Ihaab3R1us22ODEeI0A+s5HrAiLaNtX3pR14GXJZVwMOh9VuEKGxOF/PzIllqKoAR223
         vTRCIu/NsTyWJn83jTmSvC4JXVTJRHr5hqkqHU8vNPNQZZ6yBPf2NEV3zHHnfrD6NzHT
         4Hag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UeTn10uh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a05620a110e00b0077421d5f27dsi250534qkk.571.2023.10.19.14.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:23:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UeTn10uh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaTV-0003wr-KV; Thu, 19 Oct 2023 17:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTT-0003q3-LS
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:22:35 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTR-0000eO-90
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:22:35 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c50cf61f6dso1792981fa.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750551; x=1698355351; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiDSBb1U1Y6ntpHTs6MX3TQXj3gIN80QBkiJrswp04U=;
 b=UeTn10uhHgomNxL3kTLEuknBBuI9wRb/rnqKau1RgOeWZd+1BQZN2O2t1brhCNFVgE
 KfQN1/r8P97CShIb0cT2+UKfhti03Z/lSVTGXhGzLfD0PsfkDW103m93xcj2rzKcwZJi
 zudwgENHSEr0PH14WuLOA2GXBDNh9FJj063Ych7oUrIEWsQNuc7zCPdpUXcVl8CnAvqH
 jlwkhl/6+/Cb86+rnp4VdO/uQAwRph67H5XJHBGL293M4TQOrlQn4NCPVTMsxhEydObr
 4NUfP+hzzUCh3y37dFk8O87WniJOoSID58NOvtti7GZHfE4KhZf06dI8jxcxyt02QT+0
 r2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750551; x=1698355351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QiDSBb1U1Y6ntpHTs6MX3TQXj3gIN80QBkiJrswp04U=;
 b=iF61H1jvJgW7Zma9iGvUHGLA2ubhvPEH/alloVANQqCJh5BuPjnca39TF+vLiEpbBK
 YNojimCxVaPGbprR36CGUDmb6t2ejOMNCMArjJxPg+NuvV0ov/DxqX9SDaLBpJ5ZL/wZ
 BwNRiIts+/l2aK9qhaqBKzkGczKT/h8mQHRODrSuy/QS0xkZGcuR3N7pnilJ+fjnz5Ma
 ZbT90AmtcNun5iSZTGIfTlPhns7F99O+Ioq4CZxmkKHzUJ5V6zLEGH8W5a+X6Rqxg4Az
 KekzeTWRudDdAnHRpCBs5kIaiydb44CJn9Y9IN59HOw9pWxJ04OCjj76PC9RD4/545Ug
 naTg==
X-Gm-Message-State: AOJu0YwwVJnagzxKd9J9Ot/Cq6v5pdr/LQVBdHeJsbF7dpOUphhXHWz4
 PKf7Q5CM7VlHFlLravZ9ZcLKHg==
X-Received: by 2002:a05:651c:1a29:b0:2b9:ee3e:2412 with SMTP id
 by41-20020a05651c1a2900b002b9ee3e2412mr122813ljb.22.1697750551506; 
 Thu, 19 Oct 2023 14:22:31 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c158900b0040776008abdsm508640wmf.40.2023.10.19.14.22.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:22:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 38/46] hw/isa: Realize ISA bridge device before accessing it
Date: Thu, 19 Oct 2023 23:18:03 +0200
Message-ID: <20231019211814.30576-39-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: 7Vs3BPHk1qid

qbus_new() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20231019071611.98885-9-philmd@linaro.org>
---
 hw/isa/isa-bus.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index a289eccfb1..f1e0f14007 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -52,18 +52,25 @@ static const TypeInfo isa_bus_info = {
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
                     MemoryRegion *address_space_io, Error **errp)
 {
+    DeviceState *bridge = NULL;
+
     if (isabus) {
         error_setg(errp, "Can't create a second ISA bus");
         return NULL;
     }
     if (!dev) {
-        dev = qdev_new("isabus-bridge");
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+        bridge = qdev_new("isabus-bridge");
+        dev = bridge;
     }
 
     isabus = ISA_BUS(qbus_new(TYPE_ISA_BUS, dev, NULL));
     isabus->address_space = address_space;
     isabus->address_space_io = address_space_io;
+
+    if (bridge) {
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(bridge), &error_fatal);
+    }
+
     return isabus;
 }
 
-- 
2.41.0

