Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2959890ejy;
        Tue, 4 Jul 2023 07:52:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEMGymugu1O6n1XZJM1i0HicJTqAjnMPJa60uRzVarKuMaQVMY6ZZEZ1I0P0OcBT4Jsu8KJ
X-Received: by 2002:a05:6214:d69:b0:630:2117:9628 with SMTP id 9-20020a0562140d6900b0063021179628mr17666617qvs.8.1688482365175;
        Tue, 04 Jul 2023 07:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482365; cv=none;
        d=google.com; s=arc-20160816;
        b=A/06zC56GmiaO7yyimeVPVipHt5GZ/bKZB1TklJYza14aiH+srVH2ht9czbkGEhx1E
         692ZTv0lOpj1K//ykmXNf/7q0jW2Z0CyLxeX84FWO5k3VAVXxPza0u+j7vGr0HzytgYC
         hGSQJMzhNQiMfNcIWDrx9LYCGaBtTysFu5sEOCgHZbiXUtOIC/k2H9AJtl5LVQYMpnYP
         X7sMq5QJuO/eWNhGn1V3fouPAzMOc9fUAUVzWWqhzcnYkkoWvvTXQCmo4t8vjcsDGLrZ
         dQzkAjogHy6iVBDgGMroP+gTRX6eGvHUglmVc8fHzpaEfH9ffPcYTWSdndaITWBWtYc+
         h/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SzuTpH2SlaRUugw0Q+vEokTxq/EmNFEx2lClbuErT5w=;
        fh=Lngrjms14biHE1uwg3hJItOsHUc/fKOP3kWz84zgU0I=;
        b=Mqig+a14Xq8nrmyo/dY6/nkcD3TzWhejy7Fw86iQYUftN1RmIzauJU1NXHu1kvAOk4
         sby1ZcnXw+OfOBpIuer3PeL5pJ+VuWKM5tb1jDiiIvlRZgLw5UebNmSeScVTqCbL+7lR
         QTURzQrMd3o0trxB00c2kghUl8flZeEse0hRXtApFBT85yRA+O33fCXVnO+Aoycp5iqS
         pShAX0LMY3WKcRujk5IIJOtzIkZxNoqwPYLKeJjRhduJPGsUVydON9A8e2uFgC3jeKsI
         MsXhsVrU/5hhurvsdP1MgD5grOaYlpSW0hd/foycAMgSYt+/bAww60pku00RyuBOZ0v9
         2r5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L6bJC9PZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020ad45c8e000000b006287923b3e7si9289186qvh.40.2023.07.04.07.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L6bJC9PZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGhNP-0005KS-Gm; Tue, 04 Jul 2023 10:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhNG-0004Ql-8v
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:51:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhND-0003Bc-RW
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:51:25 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbc63c2e84so55667825e9.3
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482282; x=1691074282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzuTpH2SlaRUugw0Q+vEokTxq/EmNFEx2lClbuErT5w=;
 b=L6bJC9PZWfO98ArDSxA87MfqXDAV1km1gyimivtbcW6qe7QO5mhX54b5JnyCDjP8X2
 35aADaIydszdNk3dOMps6sjKAjRZHfZ+cA1mdos0Xn4hS45Bwvp2UwgFvRlRQc6yjQ6q
 AVpE8JDFRdmJX0+zxrusSmJf7Xe79Kjy1bDSC3tP/W7FCS5z9CHNImrhAoVyPxQNlKDR
 SBlhozuiJC+dgOACsw66GOaM29ijB/SdFft8pgxui0wiprP83mPPKtH9mb91CrVCrywF
 mIp6jOBvxS+y+YQCq0h0AYuqpWZo9cE4JCY2OHluNct6+Nl8Idrit1zl0pjVUoHej81L
 HPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482282; x=1691074282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzuTpH2SlaRUugw0Q+vEokTxq/EmNFEx2lClbuErT5w=;
 b=kkKr3CT63gb0KPmnmx5xA/mw7S5vAFj+HGS2LaZ7DcHAE05NgJ8xdDbh+/qcA2YHpm
 HkWakhdjwD96XzsF9uLajaLKAIs1m6NRR311mzYf9yXlPI9eDEuJ2vxUwZaewZTDAFhv
 iiMM/7T3DfmYR9HtIV8DDIvyZIAo+fTC6Q6u2oH6qIa5wa4P//MfQ0PhS3KMRidfYG/P
 LGNhujx64h/MtRNH8wVsAa5V2p8py+imlBYJz2/78yvJCYtxPAfFYdwMmIaKQEeDo7NO
 7Eas/c/900Mil2apwaNBJOULb8cQSJEEO6JHjK5sEWSshMNTk+cr1iPHZfiBeJrRDmF+
 uKuA==
X-Gm-Message-State: ABy/qLYTIwKK4uz+eZmYxgs9k4hbxlQ+ExZAnf4Xgr2ReaVKTnx0Slzf
 W+LcyHXsUsiMPcJbSJdI2M5ZYg==
X-Received: by 2002:a05:6000:52:b0:313:ec93:c1c1 with SMTP id
 k18-20020a056000005200b00313ec93c1c1mr11251095wrx.32.1688482282139; 
 Tue, 04 Jul 2023 07:51:22 -0700 (PDT)
Received: from localhost.localdomain ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 q18-20020adfcd92000000b003140f47224csm16103787wrj.15.2023.07.04.07.51.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jul 2023 07:51:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 13/19] hw/timer/arm_timer: Iterate on timers using for()
 loop statement
Date: Tue,  4 Jul 2023 16:50:06 +0200
Message-Id: <20230704145012.49870-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230704145012.49870-1-philmd@linaro.org>
References: <20230704145012.49870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: TD5SIuOKVshy

The same pattern is used for each timer, 2 or 3 times. To avoid
too much code churn in the next commits, iterate on the number
of timers using a for() loop statement.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/arm_timer.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 0ad0e55df8..68cd50314f 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -310,10 +310,10 @@ static void sp804_realize(DeviceState *dev, Error **errp)
 {
     SP804Timer *s = SP804_TIMER(dev);
 
-    s->timer[0] = arm_timer_new(s->freq[0]);
-    s->timer[1] = arm_timer_new(s->freq[1]);
-    s->timer[0]->irq = qemu_allocate_irq(sp804_set_irq, s, 0);
-    s->timer[1]->irq = qemu_allocate_irq(sp804_set_irq, s, 1);
+    for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
+        s->timer[i] = arm_timer_new(s->freq[i]);
+        s->timer[i]->irq = qemu_allocate_irq(sp804_set_irq, s, i);
+    }
 }
 
 static Property sp804_properties[] = {
@@ -382,18 +382,19 @@ static const MemoryRegionOps icp_pit_ops = {
 
 static void icp_pit_init(Object *obj)
 {
+    static const uint32_t tmr_freq[] = {
+        /* Timer 0 runs at the system clock speed (40MHz).  */
+        40000000,
+        /* The other two timers run at 1MHz.  */
+        1000000, 1000000
+    };
     IntegratorPIT *s = INTEGRATOR_PIT(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
-    /* Timer 0 runs at the system clock speed (40MHz).  */
-    s->timer[0] = arm_timer_new(40000000);
-    /* The other two timers run at 1MHz.  */
-    s->timer[1] = arm_timer_new(1000000);
-    s->timer[2] = arm_timer_new(1000000);
-
-    sysbus_init_irq(dev, &s->timer[0]->irq);
-    sysbus_init_irq(dev, &s->timer[1]->irq);
-    sysbus_init_irq(dev, &s->timer[2]->irq);
+    for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
+        s->timer[i] = arm_timer_new(tmr_freq[i]);
+        sysbus_init_irq(dev, &s->timer[i]->irq);
+    }
 
     memory_region_init_io(&s->iomem, obj, &icp_pit_ops, s,
                           "icp_pit", 0x1000);
-- 
2.38.1

