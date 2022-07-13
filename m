Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp70145lfp;
        Wed, 13 Jul 2022 00:58:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u3WAM3RzWYIDnRpGPusko58dcQY46RTp3i24y8FrPen+nhVrQUwMn0v+dvrJWYrKqqKT0P
X-Received: by 2002:a05:620a:254c:b0:6b4:85f3:8eec with SMTP id s12-20020a05620a254c00b006b485f38eecmr1449472qko.317.1657699104045;
        Wed, 13 Jul 2022 00:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657699104; cv=none;
        d=google.com; s=arc-20160816;
        b=PG1U2f3T14HIv8flYvM7iN0sBMQrJFuW0LXCq4afy0VX77mdincMzNd9cWo8FnrBgt
         68rMlIr75CozakZZHHGMxx+zwtb9kVeS51aBcXbazxHqbT3ejjf2wnFgaCco5iJOgQmv
         SoIY3pFgFmIMYYzQ3jQUXXVnWkbPT31IDx86JV1OFsHkNKYCpr0t4vl70Awn55x6HQZt
         A7vBPslI7+QcS6ZEaz/YZ0b3UobTEcv0UnDGJztpb7prwH4QmEXphxeG2PlUhTfaESnN
         PSWwQrPqv/WHa1nXcBcuyP90/aEAx3Ofgu2lWhvAwayck9o85gsVJHIrBwX/5Wxvha4n
         paoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=lzBu2EmAk2flyuG58o45+LkLNdpaWOaQD1OmN5Nu7sw=;
        b=aaOKpOvPmCMb8tzNIDR/gRT+k7R1fYyAWYoBJAH/3k9sBCBpHCcYKEKNv6AE4ca5DH
         zyOxcRtpzTLnf4DGhBmH95NrW4P0dXkhuJMTrrVIpk/CSBgtv/o5c/Yo004nv+Fz0OyV
         2pMmkMXyh7jM6+/Tdi/ivOJslznallsZV7oFXfM8+JsoHZ9oRWZxqjS/6gfBJJlWJJ+o
         DFDpIKnc/8pUl7Ta4/QI48OSLlhTu7iNJliKjN5ZuDcAtcXoX/C0si76fsb+Sptgn/0u
         YKegEzajENsFZ1DuOMvFkN8WeRXgHy6sW4+Mhepe0oiLQZN0D6fXPpUWqV2ZM1r4R+ow
         ajUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fd10-20020a05622a4d0a00b0031eab70c078si7102098qtb.436.2022.07.13.00.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 00:58:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXGJ-0006Dh-6N
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 03:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBU-000806-11; Wed, 13 Jul 2022 03:53:27 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBO-0002Xv-SG; Wed, 13 Jul 2022 03:53:23 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVGz3FLwz4yTF;
 Wed, 13 Jul 2022 17:53:15 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVGx0rG4z4ySW;
 Wed, 13 Jul 2022 17:53:12 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <pdel@fb.com>, Titus Rwantare <titusr@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 04/19] hw/sensor: Add Renesas ISL69259 device model
Date: Wed, 13 Jul 2022 09:52:40 +0200
Message-Id: <20220713075255.2248923-5-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EYPMzY7SYjMT

From: Peter Delevoryas <pdel@fb.com>

This adds the ISL69259, using all the same functionality as the existing
ISL69260 but overriding the IC_DEVICE_ID.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Message-Id: <20220701000626.77395-4-me@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sensor/isl_pmbus_vr.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index 799ea9d89edb..eb344dd5a9d5 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -119,6 +119,18 @@ static void raa228000_exit_reset(Object *obj)
     pmdev->pages[0].read_temperature_3 = 0;
 }
 
+static void isl69259_exit_reset(Object *obj)
+{
+    ISLState *s = ISL69260(obj);
+    static const uint8_t ic_device_id[] = {0x04, 0x00, 0x81, 0xD2, 0x49, 0x3c};
+    g_assert(sizeof(ic_device_id) <= sizeof(s->ic_device_id));
+
+    isl_pmbus_vr_exit_reset(obj);
+
+    s->ic_device_id_len = sizeof(ic_device_id);
+    memcpy(s->ic_device_id, ic_device_id, sizeof(ic_device_id));
+}
+
 static void isl_pmbus_vr_add_props(Object *obj, uint64_t *flags, uint8_t pages)
 {
     PMBusDevice *pmdev = PMBUS_DEVICE(obj);
@@ -257,6 +269,21 @@ static void raa229004_class_init(ObjectClass *klass, void *data)
     isl_pmbus_vr_class_init(klass, data, 2);
 }
 
+static void isl69259_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "Renesas ISL69259 Digital Multiphase Voltage Regulator";
+    rc->phases.exit = isl69259_exit_reset;
+    isl_pmbus_vr_class_init(klass, data, 2);
+}
+
+static const TypeInfo isl69259_info = {
+    .name = TYPE_ISL69259,
+    .parent = TYPE_ISL69260,
+    .class_init = isl69259_class_init,
+};
+
 static const TypeInfo isl69260_info = {
     .name = TYPE_ISL69260,
     .parent = TYPE_PMBUS_DEVICE,
@@ -283,6 +310,7 @@ static const TypeInfo raa228000_info = {
 
 static void isl_pmbus_vr_register_types(void)
 {
+    type_register_static(&isl69259_info);
     type_register_static(&isl69260_info);
     type_register_static(&raa228000_info);
     type_register_static(&raa229004_info);
-- 
2.35.3

