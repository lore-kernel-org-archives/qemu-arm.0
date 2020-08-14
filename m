Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp447451lfy;
        Fri, 14 Aug 2020 06:30:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydB/zlfmTDUHcwjQdz78NKEF6OqiQr1RBIrUOIDt/Rdpcj5tOlP6f8IPtGM0klni1TEZql
X-Received: by 2002:a25:6808:: with SMTP id d8mr3687726ybc.265.1597411823843;
        Fri, 14 Aug 2020 06:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597411823; cv=none;
        d=google.com; s=arc-20160816;
        b=OGEug+YQl8CB31MN7qHEv5CWguO8R7/pPbFahofpe6kt6THle51wMvE4owiG0ioxKe
         uWV1oroSRnoFLQAUeKS0PvM/QAA374JuS3x9VnvhZMcvT6SX15vH3KjjdoUmoPurfnn/
         kVIfOBMYELdgTeS4LIOsRSuP81j3/bUiMSsIgjrAi4DeeaPFzXNzg0aJW7vrO9TiU/bo
         1PVx5eIYm0T/ppD8elQp25DFVJvUtLVlVKsTkMhu6SxtmyfT6pFvEZEMrLlwlhoNYocM
         BXewhiw0plO6STUMYoS4tslr8HhT9SjikBkOOHicW4lf7iDEpE47fNFgIwFqBiOaj3PW
         iIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+WN5+x/S52yPuJmxO8+ZTxpwug077ztvG/3BJTOgOtQ=;
        b=CHt6l41yNavzu571fExLv/leWNMULlUFquIPt3MJ4+GYml9ZbIre4ORV+UXLc85tUL
         FrNAXEi2NIg6P8psY5ViK7/V3vUOFvFWMJ9Ok4wLLW7wmnjA0y2P/UL7HtuqOUV9Mcnx
         TfPSKmZ9MhHXFbfe2uGuyFO9PAeJEzxgfw0yCC/1OxXROqySU8Ao1Tl1ox4A+7YO+e+i
         r9lB5zYzkbdC1NVg5uudiSv7idyaele0q4XG1UX5wehYLOyTIzJdCDciCQQ8H5M0NhGF
         6b4+b11Hpni2aDHZV+ZIzNW3gPqOfm2HvySZQfjtzYAIt2RACFjU6cbYZrU9uF1I2hqq
         2BqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u3Pg4IoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n73si8412298ybf.0.2020.08.14.06.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 06:30:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u3Pg4IoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6Zmp-0002D8-4m
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 09:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6Zmg-0002Cv-Ma; Fri, 14 Aug 2020 09:30:14 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6Zmd-0001DY-UR; Fri, 14 Aug 2020 09:30:14 -0400
Received: by mail-wm1-x342.google.com with SMTP id c80so7493458wme.0;
 Fri, 14 Aug 2020 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+WN5+x/S52yPuJmxO8+ZTxpwug077ztvG/3BJTOgOtQ=;
 b=u3Pg4IoZRdTabEyPnFwUFrjkW18lkd9OvNH4S65UX57GRl2JJVQ7/wrjE1ASlJm3LR
 QHpopIwG8USNPwNLlfDAm/53eTXGSQJD77W/+q8FqsUE+0yVlPrBC8l35PeyYRn/MDWy
 kwVHcwElnxrZO/PIGtF2bQm27lMCn/NCbZ+YJn33yLVoFzqncjpU/EMNXJgAHkTSQpBJ
 kGJXh5NjaD0gKX23Bq//UOv9b1BG6LPq5auDNGNRDrUbVxK8x7sVrJmDZUQeeMA7SGyB
 7Yx76Qc5jlms5IUUFHjXZfUPtU/Nr0Gs7o4yeqg7NkGUUb91wdw8dwBHZ+HGve11/0te
 ohxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+WN5+x/S52yPuJmxO8+ZTxpwug077ztvG/3BJTOgOtQ=;
 b=plVJj51As/Eqtepn/8OVY247zPObN3BFmFClz7wblbTmH71JZUzjyQ2Dglc/rrKBBE
 sqVFf9Q6n6IHEBSge5mMdzGIK3BVPr3dP32Hbzp4XwwuvL1NhAzzETo+iI0h70puWkJO
 l5/HkRXSqIJ/llMZ28GYk4kcQVBTgw5pkaq8cjQjAPuT0gCx61vXEu1mSN01ALZbVwyb
 0mpxIELYqwJ3oT8Xo2UxT/XGKW6zViyYiSPNpLBIE/e3hCELU+X8F6P/KjM1WLyQMeOw
 usJMyMMqp+UTuytuKOcq/KgDj4fwvx/m0NOPypW0snkt4ZG3Zm5HZ62pkAJXfHc88mNO
 VGMQ==
X-Gm-Message-State: AOAM532lanCKKo0mFkTn1j+iIlZ61jodOOiSu+S32arFcZmfhZHXCC0o
 xcngQ9OoAyX3q9tVFCBn9oW4//BhZT4=
X-Received: by 2002:a1c:4e0d:: with SMTP id g13mr2542782wmh.177.1597411809547; 
 Fri, 14 Aug 2020 06:30:09 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id j4sm14708003wmi.48.2020.08.14.06.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 06:30:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/net/xilinx_axienet: Remove unused code
Date: Fri, 14 Aug 2020 15:30:07 +0200
Message-Id: <20200814133007.16850-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 30+bkHIUab0H

Most of the MDIOBus fields are unused.  The ADVERTISE_10HALF
definition is unused.  Remove unused code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/xilinx_axienet.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 1e48eb70c9..2e89f236b4 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -54,7 +54,6 @@
      TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
 
 /* Advertisement control register. */
-#define ADVERTISE_10HALF        0x0020  /* Try for 10mbps half-duplex  */
 #define ADVERTISE_10FULL        0x0040  /* Try for 10mbps full-duplex  */
 #define ADVERTISE_100HALF       0x0080  /* Try for 100mbps half-duplex */
 #define ADVERTISE_100FULL       0x0100  /* Try for 100mbps full-duplex */
@@ -169,28 +168,6 @@ tdk_init(struct PHY *phy)
 }
 
 struct MDIOBus {
-    /* bus.  */
-    int mdc;
-    int mdio;
-
-    /* decoder.  */
-    enum {
-        PREAMBLE,
-        SOF,
-        OPC,
-        ADDR,
-        REQ,
-        TURNAROUND,
-        DATA
-    } state;
-    unsigned int drive;
-
-    unsigned int cnt;
-    unsigned int addr;
-    unsigned int opc;
-    unsigned int req;
-    unsigned int data;
-
     struct PHY *devs[32];
 };
 
-- 
2.21.3

