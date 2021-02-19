Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9103870lfc;
        Fri, 19 Feb 2021 07:20:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoku93/60rKmyPEzVdRwRzqzkd6sskctX1Ko7ywT5q3P0ivs0tSrm7sQPIH5zTjPgCyndv
X-Received: by 2002:a25:2f43:: with SMTP id v64mr14344200ybv.302.1613748058762;
        Fri, 19 Feb 2021 07:20:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613748058; cv=none;
        d=google.com; s=arc-20160816;
        b=a2nccaHk77gRIaaK8V1+bIh1+E8hBkg9aNKHqbs5LRBJ2rGbR+4BULjOW+3BjrJwgU
         I49vieVpXwPIpSLRsiC+AmpNrNZAnc1OkYWT8FlHHee/0C5Qm9rnS7EW9W1wTjcjLZiZ
         dn/oCU7+vvMsrk0MTHGJ3Vf4z1ZZi11e9AfSgBHRTt0zWyzGBNvvVsvHVesJuIR84IGT
         Z+giL62DvM0tRM8aoE48TN98r6rgp7s9skBQukLCGPJpP8HuhgVAFNzf68FLoDr5xOMM
         50OWH8PX3UsJmDvuxKCXGvlksujZ+ZymJ17zxpvO+0aGTWR03q5MzjAn+zTxXqMLq3Qo
         x5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LuIzTpv1K9soe7A7vEz88fSEr4MLHte1voPUCjxmGG8=;
        b=QLpp7aDnTI3cjJjNZwAljH3pMEMcEJ5daY+DIXv1aMVZzIKg8ifn19nb0tx87Wpy6/
         f1tZ9kJJ/Kx9YcphPq9TJfk7oSXbV8nkasRYl6qv5s9ZvsH8JfJMGCBYs/hnJEEXMkEm
         9bpIbo0Oba6jQOOQq6KneOY9zWwjK27r6b2Z5GZyB7PzyHRoo5ibphUUBexgsUM601Gl
         2lQWHD1yE7XM8PbmAh7tN/MEdQp+hWpU0H6ZrbJvW7DYyYA3F0RqECtFOnefkbYRNeeu
         c/B8pHuaco4Jc77ZahAXL2AcYKRD/mQ/GyhVYfKOiNvqt7u8btWPVqC4U/QiCWu9eHTE
         9T3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ttmgN8WX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si9468825ybp.359.2021.02.19.07.20.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:20:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ttmgN8WX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7aU-0005cx-1l
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD741-0002sy-Mx
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:27 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73U-0003gi-0a
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:25 -0500
Received: by mail-wm1-x32d.google.com with SMTP id v62so7870363wmg.4
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LuIzTpv1K9soe7A7vEz88fSEr4MLHte1voPUCjxmGG8=;
 b=ttmgN8WXfodvQ2pdgMfpyYBtddWI9FGGr8+qqJK2H7KxvaumT0QrnkkT2HY1HXvrsc
 ryrFL+4IwCXI9ZjzL1D1n9Tn8QXZb6DxFEHd9Sl8nzHWmaIUx8YlmLbNSuXmAxsR0HJl
 aAziqUDE45D6Xo2Xx11EVQQyTo4GVpc6x8jdvekkXLeOO1saSvBDYfNAImBJ6G5Lmvmy
 y9rlHusp4L5OX2KuaH1SJIq2e913ATV23EHYmaX7X+leggyu+W1zPm1bhcDP8bgHhygI
 Hm35yEpNdPSZ6C4IaBNjy5TsXeo2ncVj5Vnj7IhU6/nVtEtX1li1PNjGB6W2t7mu+WDV
 LKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LuIzTpv1K9soe7A7vEz88fSEr4MLHte1voPUCjxmGG8=;
 b=g13Wr1PwpKfk4FZdwHs78bvUoz7lqeCYejHwTuKc8Y3vsfeaz2F1VegP9n3ZbO4b/a
 7pTVcbt5YBD68mZPtdBXboaKswgtQKJ36aQFOk00y9z/BBJNC1Z9rJoSHrAcbMCE+YcT
 3pWfW08EJ0d8VHhnooMygXWLthlv714wmIRXg2clzBkLXjHyqWaKnZouBp3wsSZkGUm1
 txjElVAeqf58rz0QzSuz1NeGJASw60Z5wzrRfLlZBnRS/7dW/VJ5+mxnFJHyMYMjYdbT
 vUkNbR90HZKfhZe4E8u5GJ3Kcm2g5Mf30IHsbO3Ogd7OKV9SkPiG+u95aCbzRuRBvnKv
 rNCQ==
X-Gm-Message-State: AOAM530tpmnAEDbw8MeS8uO6hsdm2a6jWb22ietVr+mgPf0FzpnvRCbO
 Qe0mqx5a74o6XMGVSKNMyaNBeJUhV5WI9Q==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr8438318wmr.179.1613746010665; 
 Fri, 19 Feb 2021 06:46:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 41/44] hw/arm/mps2-tz: Make initsvtor0 setting board-specific
Date: Fri, 19 Feb 2021 14:46:14 +0000
Message-Id: <20210219144617.4782-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1IjIAqqj7lFn

The AN547 configures the SSE-300 with a different initsvtor0
setting from its default; make this a board-specific setting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 47215f1b97c..bb72f78fb55 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -114,6 +114,7 @@ struct MPS2TZMachineClass {
     bool fpgaio_has_dbgctrl; /* Does FPGAIO have DBGCTRL register? */
     int numirq; /* Number of external interrupts */
     int uart_overflow_irq; /* number of the combined UART overflow IRQ */
+    uint32_t init_svtor; /* init-svtor setting for SSE */
     const RAMInfo *raminfo;
     const char *armsse_type;
 };
@@ -690,6 +691,7 @@ static void mps2tz_common_init(MachineState *machine)
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", mmc->numirq);
+    qdev_prop_set_uint32(iotkitdev, "init-svtor", mmc->init_svtor);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
@@ -1043,6 +1045,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
+    mmc->init_svtor = 0x10000000;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
     mps2tz_set_default_ram_info(mmc);
@@ -1069,6 +1072,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
+    mmc->init_svtor = 0x10000000;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1095,6 +1099,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 95;
     mmc->uart_overflow_irq = 47;
+    mmc->init_svtor = 0x10000000;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
-- 
2.20.1

