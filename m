Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp647493ejy;
        Tue, 21 Nov 2023 09:41:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGndSF2gWcnanwVmaDHHth3uhzXJch13TW779wAjRpy0PbElbx5oIZL+a9yzZ9zGtt4Sm9C
X-Received: by 2002:a05:6358:7e0d:b0:16c:499:bbbd with SMTP id o13-20020a0563587e0d00b0016c0499bbbdmr6045629rwm.21.1700588509731;
        Tue, 21 Nov 2023 09:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700588509; cv=none;
        d=google.com; s=arc-20160816;
        b=LQFwQ7qQmrP5Zc+8KUapfiHTnmA/v+zZFxccTKdJTdHW8C2ngbAik+vHZ4LrhMLrtr
         89WON8S6QnS8ieJQ0Sl4sw/MsgvsD1XZPFiuj6TEYSBHvRugx19aVuyb4B1T/xhmVD9S
         GtNzEQ3H5FVu+PSML3q5WAZGjkt6/Bsd9QtkBKs3qfOYAxtQAhk20mXS87nCiEUhyHU6
         vuLJ1mEe5gqoCp5B6mcvDcKZSm7Zz0nqTagmFeFTtYWG+ZMHPlqpsqHGPUFbTdz9g6Vo
         h+MWJ/3B5gChdUBdnkIlIT+/Shez33wnHo3UXJJgZ+t7w4bm6VS3xKdCo53yC6oj+6tE
         P9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iW4GbGx1UKeBuWo5IN5MHnetcyTDNo6L05KNntf8yQU=;
        fh=cL0kZojwLp2/+GG3A9WvbPyWHrvsxnhr8acLawhZl1M=;
        b=lKSagsLqr2qrW/pgf61A1WYQH4D+GTWMSwwXrjGHxVt53yz8DOGn62rnCieRA5Ny1c
         llH4XsX3NP9VINcyn4XQY1qDjQNlBUKeWvbVRmYYQDb5LWvZEeb+nl0dkXU0oO0cIXje
         TXIZ6WBEIyfpvJh3uTnVoTqoIgyhJu1MEY9AZa84QMHzK3HJrvWtE0Sq6jDJNFaeCgc6
         KeKeojk+FLfnr3Dukm4a63LNgWaoQKW+gBOumvgg601yB3e46qHVD9I7NKwsC1+yi4D5
         rl9iPNmwp0uEH00hH6IfWloz2LYIxyxdmHOqQgAKoeSVKNI+skNwL5VKy+nkbYJ0z2Ui
         1sPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWy8vfgf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r22-20020ab06dd6000000b007bf81fc6863si2304791uaf.166.2023.11.21.09.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 09:41:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWy8vfgf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5UkZ-0008Oy-Fj; Tue, 21 Nov 2023 12:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5UkX-0008L5-LP
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 12:41:25 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5UkW-0001JV-2T
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 12:41:25 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b2c9ee8ecso3635615e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 09:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700588482; x=1701193282; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iW4GbGx1UKeBuWo5IN5MHnetcyTDNo6L05KNntf8yQU=;
 b=NWy8vfgfZBsG0J+ip2DRxRSYOMiWo0btr/4KWGjGCod4LqmqvAdoLFPuQLCGt1KJyH
 LR+qo6ItxhRGYxz4FOdgHOhAYTC+KsB65DwFaoQIQtOWwQLWL9wF++OtRQbnN/3x9lJG
 a7hssCJSxeUoZsneG38NkkM4aVweoln6GMoe3zF3EeACmProssnz2SKUGLIZRkVm7KYo
 msp+Rc6U8bHSzbhD15WpwWwmKCHWLKPUKsUsAKhRbl0Kepsx31oDPUHdICT/XH/9jbKt
 fAKKCkMaNf0WuilBnMqK/TKIOkqAOXHrpIp6VEiMdsleX0o+924SMI7bVrZaRhDUtByd
 np9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700588482; x=1701193282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iW4GbGx1UKeBuWo5IN5MHnetcyTDNo6L05KNntf8yQU=;
 b=F0pTbxxO+HhmOhwos6sGqdzfIRnoVRSFP4PdK3sRD7Ayqm0h0hSsj9hYKjRKqS4UE5
 kaTcoYJ3av0DtXBlWER/rLbsVel5AcB9A7O9Qv7xMpRfcT2OTtvW0EPdfOGgqvstK41K
 tDjfsNLIiPF1swpnPev8gaPancBSZKUTH4QtqShlWV7iALEU/pGkm+Up3OLoC3wYXr4D
 gxhu/MxPoL9qaiEa8mX/Ql3zu7q0CG1FufWqkL2LBYn7FhP0XTk+rpxrz7ghf/7JOD6C
 sNLLLHPOEiBQkxmZU6Es7IiGATVeoPvXTA732kHvVXv0p5LcL0klb7tz6xkQVmRee3uA
 rt4A==
X-Gm-Message-State: AOJu0YyC1o3s/ELjAc6Nv7+4VQLl7kpriy3VXDkUqUW91a+CsRTHVOpm
 iyH7ozlWalzEcAdbfrCzXoUjCA==
X-Received: by 2002:a05:600c:5127:b0:409:79cb:1df6 with SMTP id
 o39-20020a05600c512700b0040979cb1df6mr44139wms.14.1700588482749; 
 Tue, 21 Nov 2023 09:41:22 -0800 (PST)
Received: from m1x-phil.lan (lgp44-h02-176-184-8-219.dsl.sta.abo.bbox.fr.
 [176.184.8.219]) by smtp.gmail.com with ESMTPSA id
 u3-20020a05600c00c300b0040648217f4fsm21512532wmm.39.2023.11.21.09.41.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Nov 2023 09:41:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
Subject: [PATCH-for-8.2? 5/6] hw/nvram/xlnx-efuse-ctrl: Free
 XlnxVersalEFuseCtrl[] "pg0-lock" array
Date: Tue, 21 Nov 2023 18:40:50 +0100
Message-ID: <20231121174051.63038-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231121174051.63038-1-philmd@linaro.org>
References: <20231121174051.63038-1-philmd@linaro.org>
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
X-TUID: ip+l3pVdnRy0

Commit 0be6bfac62 ("qdev: Implement variable length array properties")
added the DEFINE_PROP_ARRAY() macro with the following comment:

  * It is the responsibility of the device deinit code to free the
  * @_arrayfield memory.

Commit 9e4aa1fafe added:

  DEFINE_PROP_ARRAY("pg0-lock",
                    XlnxVersalEFuseCtrl, extra_pg0_lock_n16,
                    extra_pg0_lock_spec, qdev_prop_uint16, uint16_t),

but forgot to free the 'extra_pg0_lock_spec' array. Do it in the
instance_finalize() handler.

Cc: qemu-stable@nongnu.org
Fixes: 9e4aa1fafe ("hw/nvram: Xilinx Versal eFuse device") # v6.2.0+
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nvram/xlnx-versal-efuse-ctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/nvram/xlnx-versal-efuse-ctrl.c b/hw/nvram/xlnx-versal-efuse-ctrl.c
index beb5661c35..2480af35e1 100644
--- a/hw/nvram/xlnx-versal-efuse-ctrl.c
+++ b/hw/nvram/xlnx-versal-efuse-ctrl.c
@@ -726,6 +726,13 @@ static void efuse_ctrl_init(Object *obj)
     sysbus_init_irq(sbd, &s->irq_efuse_imr);
 }
 
+static void efuse_ctrl_finalize(Object *obj)
+{
+    XlnxVersalEFuseCtrl *s = XLNX_VERSAL_EFUSE_CTRL(obj);
+
+    g_free(s->extra_pg0_lock_spec);
+}
+
 static const VMStateDescription vmstate_efuse_ctrl = {
     .name = TYPE_XLNX_VERSAL_EFUSE_CTRL,
     .version_id = 1,
@@ -764,6 +771,7 @@ static const TypeInfo efuse_ctrl_info = {
     .instance_size = sizeof(XlnxVersalEFuseCtrl),
     .class_init    = efuse_ctrl_class_init,
     .instance_init = efuse_ctrl_init,
+    .instance_finalize = efuse_ctrl_finalize,
 };
 
 static void efuse_ctrl_register_types(void)
-- 
2.41.0

