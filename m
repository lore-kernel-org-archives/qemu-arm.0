Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp728500lfp;
        Thu, 14 Jul 2022 08:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQv0O5+E8YrPxvphw/lSAa8EczGV4DLLSbmvE3YJo6F1oRxKyvI9huQc/tmex+uiVPCGb3
X-Received: by 2002:a05:622a:138e:b0:31e:a239:fccc with SMTP id o14-20020a05622a138e00b0031ea239fcccmr8386185qtk.523.1657813755502;
        Thu, 14 Jul 2022 08:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657813755; cv=none;
        d=google.com; s=arc-20160816;
        b=FmsFt/DpjT4ncqJKD5xwQQvF/L6btKc5GQ8rZpNFqyUyBp9dPwl14b6n2x0nBXcNdz
         un26z5qTPqVeNlLHjjwFKhtgCEL8LqhG/fbDDvKLfxy4V6qNZfJ2ozLAJFEZmhhT3obA
         Z9oarHtdoFQQC/p6ZksgqODz71q3PdoI6HninxAmP43dSkDP8S7v/c3x4chN0JRzavWM
         Q37n09f0eakDj5kjZSrVrRP8GjvENaL3An/mjnHTsnih17LvyOqKakuJFMVhgJC6tjxx
         dbHoNh9ofyUV69C7sDTz7ae2jN9aI55c5EkJYkZkIF/htFCdQTfYEe2CU8GhOR58ZAUj
         E/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=lzBu2EmAk2flyuG58o45+LkLNdpaWOaQD1OmN5Nu7sw=;
        b=RYMAk5+4YhEiRReaPpQ0fuPZxg+m8sgZOxFuZ7TcIgG/GEPB0cxdIiPq9162z/+H5t
         nR0tG0ybOnrWuogoRchsEMsaWaNEZeIFTQDB3DGjSdEJF8IXkOJRfS/ql8jYqs3iXBE7
         ItwzNKWyOloEsDq6LOpPLzUSCRT3FLotOyZpC2HPiyYLpGoS+eIHm0m3OLS7CI3cKpu9
         9ieuSJZG/AIebrliFoSRuKfi6CyS8uIRj3QCHcJl27oS6DstJcjZ7OK/qIJ4g6vAF2V/
         Qt0Nlyxmd4z9TR91jjH/OoQHYuoJlpDAFVKlGsAUMfrGYjVFaylQ/jtzPAYUpdPvCU3r
         LQ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05622a03cc00b0031a816f9d42si1444902qtx.641.2022.07.14.08.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC15W-0001vW-OJ
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11k-0005Fu-Km; Thu, 14 Jul 2022 11:45:21 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11i-0000X3-24; Thu, 14 Jul 2022 11:45:19 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJj528hhz4xRC;
 Fri, 15 Jul 2022 01:45:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJj31zZNz4xdJ;
 Fri, 15 Jul 2022 01:45:11 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 Titus Rwantare <titusr@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 04/19] hw/sensor: Add Renesas ISL69259 device model
Date: Thu, 14 Jul 2022 17:44:41 +0200
Message-Id: <20220714154456.2565189-5-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: XiWmtge7rcOE

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

