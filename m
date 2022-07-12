Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1703782lfp;
        Tue, 12 Jul 2022 14:59:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vwbYYoFuxUSmLhkTP7KTEjTlxtvvVuaKKHzi0X7AktoejTDoDdsxAitW+3ep3geKBXug2v
X-Received: by 2002:a05:620a:1008:b0:6b5:70c8:e2a1 with SMTP id z8-20020a05620a100800b006b570c8e2a1mr317266qkj.342.1657663192432;
        Tue, 12 Jul 2022 14:59:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657663192; cv=none;
        d=google.com; s=arc-20160816;
        b=Yz2H33KqTC1KHsmuW75SbAKTv0UBLsQ46/h/M7J600YmotIJq8khnhKar9JksvonEL
         TQJ3AabvqemmR90Ov/usAWBCF9Gb/tyZ23b6t3qRQa4w73k913+pt3JC9wqHdur5x6QF
         F36qA5lzKpMDv09c1IXsh2xaS1ifABzJfKVWBQ8WRp/johcQiFhzczqc/wRgpkHQGVbv
         Ke29xsKYu7pIcb0sgb/E5cpDYjLuejF9e44JKD26XgxYUcCIGsrPgquq0k6vJYErXmTI
         gRp0vfg1hYdy/G/xjCR+TrsBxIK7Umw9KEwTmfuIlbAUXa7WfAjxpAeuxux6mp4VnHTk
         ksyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=9y+Fhp33BhsQPg8m0LLJmcIdzq/PCsnONU1JLPoEowE=;
        b=yboJyS3wBgEDCWx9ZxNsZuzcut+qCTMaDsqmX+4IXbdHjOxXHo5fzkTLC8UBAb0m0s
         kkUwgTtp4AVtwSlUMhIzO1AAcEkvNfAhHuXLataMJV+1kv5ByYtu8GMbjukdDPFK1gb6
         LgE7zqHlUCYWhi1Wire74n5lvRhpwirs/J3vLkTWXucN46hdVPBAxAP3G2dkMIlTBtdv
         yYzv/mnQU2V8bgkKEDRPZqSqQmrtRAqrpaQ09kYZdpf3MmTXvR9KrPfbMERLsfFCOuo4
         /z3DQzVWsqzrM87VGPVJkqq+8HhBZyk29/TAyIwoAD4Es4Rz7SEaREMu/oHwqGHAB6V2
         Xtvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=n8ctcx87;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a05622a15d400b0031d3d5681e0si7428878qty.345.2022.07.12.14.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 14:59:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=n8ctcx87;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:40346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBNv5-0001dL-Kh
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 17:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpA-0000P5-Eu; Tue, 12 Jul 2022 17:53:44 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNp8-0007qx-Rb; Tue, 12 Jul 2022 17:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9y+Fhp33BhsQPg8m0LLJmcIdzq/PCsnONU1JLPoEowE=; b=n8ctcx873ZmIchiAcvSDnD3+Fo
 sBieY9E8ShuvznbLMoPggZc7H76MOQomaeIbDn2iLuZr9nN8+DYJPok8S1MPexbUKlpoVp4Q35iZ9
 TZr2jxCgVbYGuHiaNbIvJWbCVRLTeKvV+vV4Q/HHSELuhAjLMKHhIfJO5ddUs9IavGEWwBy5zO7xd
 dRjFeiCEzlU+MzhnGG77jKSCttLVxXNeN8RPlT4viWmgjoDFnJcsf6JMDaAOk9JnNI2FdXJZCq1qw
 NDLz7Is43WyGqiH7P1xY+5ftCI3Ap2sW3TagZZcn+btqrUwizEleYiJ/ebW+9AZtF16qbYbs3TKY5
 4+ClhOIZmYM2Kav0GAgX0Iy3XjRmLK3QyMuA1qo3PsONh8UUmOn2q+jxqDVirdgVVFFKMxj7uMYEl
 mg2pQrTX5PxemBSJRXP3CFxIxVykjNxacB+S1HUlb8fD1P1jhx/QU8pbL0xEbZSKRkoZrQk3/En8J
 b9CQ/9wdha6jdHaaNIpKwTIQT43jFvkLys3oQOMOHrQ5tlmD6OzOH4BJ+7NIklomkqqaJK/+eEHaP
 FxiliJhCqXOqaf/Obc5ufjU/SS5ESqbrM1PH6Xh0oBHvTNu6tGZ0zwel+qJKpHwdvD+mpfbmYtHpO
 O9MMZcgpCv2bhc6y2SiAyJ8gT9kvjJn7Op8hDsWfg=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnk-000Bqt-Lx; Tue, 12 Jul 2022 22:52:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:22 +0100
Message-Id: <20220712215251.7944-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 11/40] pl050: don't use legacy ps2_mouse_init() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ily6jTtkUN64

Instantiate the PS2 mouse device within PL050MouseState using
object_initialize_child() in pl050_mouse_init() and realize it in
pl050_mouse_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pl050.c         | 13 ++++++++++---
 include/hw/input/pl050.h |  2 ++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 64b579e877..ec5e19285e 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -183,17 +183,24 @@ static void pl050_kbd_init(Object *obj)
 static void pl050_mouse_realize(DeviceState *dev, Error **errp)
 {
     PL050DeviceClass *pdc = PL050_GET_CLASS(dev);
+    PL050MouseState *s = PL050_MOUSE_DEVICE(dev);
     PL050State *ps = PL050(dev);
 
-    ps->ps2dev = ps2_mouse_init();
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->mouse), errp)) {
+        return;
+    }
+
+    ps->ps2dev = PS2_DEVICE(&s->mouse);
     pdc->parent_realize(dev, errp);
 }
 
 static void pl050_mouse_init(Object *obj)
 {
-    PL050State *s = PL050(obj);
+    PL050MouseState *s = PL050_MOUSE_DEVICE(obj);
+    PL050State *ps = PL050(obj);
 
-    s->is_mouse = true;
+    ps->is_mouse = true;
+    object_initialize_child(obj, "mouse", &s->mouse, TYPE_PS2_MOUSE_DEVICE);
 }
 
 static void pl050_kbd_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index 28f6216dc3..89ec4fafc9 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -52,6 +52,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PL050MouseState, PL050_MOUSE_DEVICE)
 
 struct PL050MouseState {
     PL050State parent_obj;
+
+    PS2MouseState mouse;
 };
 
 #endif
-- 
2.30.2

