Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp782109lft;
        Thu, 30 Jun 2022 17:08:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vVb5FRTPuYWK8kFy/2Mg/xDGT1aRs8QMwV+cC18kF0SmS7Iv1i6QBf2YuP9HFMStrK6uLx
X-Received: by 2002:a05:620a:40c6:b0:6b1:48e4:8784 with SMTP id g6-20020a05620a40c600b006b148e48784mr8377599qko.331.1656634089014;
        Thu, 30 Jun 2022 17:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656634089; cv=none;
        d=google.com; s=arc-20160816;
        b=yXAVzsT0pHGKsI9JntIJ0t2XQysC38RquhpiqNz98HjzQ1hR/SGMKtLPIvyja7jK5V
         8/GhXxpLWvbrR9j61ZGw98z4/jLstH/6bOKiy40+NphVVXI4kOJyRoAlz5hSOXiPCwI2
         DgLuc0Wsl6Jy1W5/xnZ95iWL69obl4d5qPD5mOUIe9I4xxH33Vtf8BDSQSY8VSJ5BT1t
         nT6Kq5qz0c7Kf4H0ccGz+YoUHv+ESvTUG0BMbhvmqDcPxpJhC4M/hehV6kIaasqd4D4f
         ic/WHwEavMEOM+NVrsnH9xrlSUvRw0IgfFPpyImjb3zCfZE9cDHPPTKYDWe79ReRX5wN
         kBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=8T91vyklQpOMbEUKpdAtNSvPzObg7QUUqlMzKtoU5uw=;
        b=KYin37ptnT5ylgTIAmgd33MK1B4Vd6A25xjFTrxcXTcl1IKIY/AVP8nk8RC8LpSjxu
         iZG+TiVo+YGJMYK8KXioLR6KBkSSvPt1ZdKj353KZzK+Efr4wYaLtixpO2Po1TsAufN2
         KXESz/5NA58vxBJYuK0+OZLLfaSEYZ8m4KnAE23sAJ1ZMZ4pXamTm+GsNLVx262224QA
         UZW0DnTQXxFFCcQTBOx+Xc/u9eR6uL6to6s61FZxh7s6uR47p/slcN+f4NYS8FJw6ntV
         EusouFuPio0r+w8WkGxIlUsZQCKelv3gl/sq6hs0Ga0pZVw6nDEqwWaCieN9Az82i5xK
         S7HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=uFieTF2f;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b="HJUY/zQo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im10-20020a056214246a00b0047059799e9bsi13590454qvb.70.2022.06.30.17.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 17:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=uFieTF2f;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b="HJUY/zQo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o74Cd-0006bc-Fo
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 20:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o74BF-0006Z6-IA; Thu, 30 Jun 2022 20:06:43 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:44467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o74BD-0001Mc-QX; Thu, 30 Jun 2022 20:06:41 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id E72DD2B05A07;
 Thu, 30 Jun 2022 20:06:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 30 Jun 2022 20:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656633997; x=1656637597; bh=8T
 91vyklQpOMbEUKpdAtNSvPzObg7QUUqlMzKtoU5uw=; b=uFieTF2fi2Iv/4dV2f
 G6myBakZCc9t6iI8O2+1cQhuyjXajgSjreiAB118wlx5BsOHXSqS5V1YDZXmRciQ
 muEYQF9hA36ipFlGr0S/LznLiLOuVGQA/DA5e2aXg+upP4xMFWm+yhV3LDCG4fTD
 Ojcgl5bFyQY8ev8/z4R0khpw47donzltgh2VkRQl5fGYUbW4Ivprj/v55SnT96a0
 uex5fXtrI+tSyAivn6HxR/XAz2tH6Ki0StwWYosb1Hap0WFfpO2IJ9/dK5gpJzRi
 ZfVROSfMfsz5PMgrbrqxDRT0AKclU9aNLUQKsMw/o87c1eaLS6QDWZvw2/hL0/Mh
 5cDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656633997; x=1656637597; bh=8T9
 1vyklQpOMbEUKpdAtNSvPzObg7QUUqlMzKtoU5uw=; b=HJUY/zQollb7crY0QG0
 LKXJAuCfekDnuBC+kDIrYSOdQ1X9H4rl98RtiXy+f6Ds+UcguW7rjV0lVwjFux3+
 L4dpgXp0+7L8lhi5Y9biOWuGEVjotsv2QZlUF5frYdwKWHCmL3YUsPigrYALDpNE
 ZG4qSyPHNtkxCBo+HSHEzEFsHh8crzqswYwmNLLqb44PSBwc2G0JtimQXYTZBj9J
 aOQ3+pDiAxp7sUaSRDoX21XvQcoaJH91VcaGhCZiX6x/OJ/hC3/MK+0BZwxy60vP
 MmVhGmcjFFbFYfxZn4tSA56+/s0gO+gkahRN1V46AQAODfS0aw777JLiukpZR1kW
 XLQ==
X-ME-Sender: <xms:jDq-YqdqlVMo9RQ6uoyCmC_nXhOygOl9qSm_kmDDNpgioPgEZWc4bQ>
 <xme:jDq-YkOPWkBU63vzhIdjoqSavGO1G6C_P_MFWjq4S0mMLOpBGrl8MNnl8wGZIrQLP
 fjm2o_MXuOhjHGCA8w>
X-ME-Received: <xmr:jDq-YriJaeaOfIvOuJMD2TOqtgIeo-iGvXzZ6ZZmsnHNL5PNf3pUzjggPjNsSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeektefhieevgfduvdeiueetteegtdeuueevieelffevueevveehhedukeejtdek
 teenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
 esphhjugdruggvvh
X-ME-Proxy: <xmx:jDq-Yn9fLre7KlwUzsYGpHRN6oj6GQu37T4xy30RXeffL8pM9BhBbg>
 <xmx:jDq-YmuH4g8gavUhgwZa_5pF3IFoKmHKUf7MmJKQm5I7VjC4ubjBTQ>
 <xmx:jDq-YuFmqGq9_MprlXh2n2oLTvkrtmrR0UGFY0UuuaK7KSVldnWvWA>
 <xmx:jTq-Yv72kIJ9lS8RZnaeRpfNOi332TlAvf0jko1VQMVITSJHsSY6HeVSlxQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 20:06:36 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: qemu-devel@nongnu.org, clg@kaod.org, titusr@google.com, qemu-arm@nongnu.org
Subject: [PATCH 3/3] hw/sensor: Add Renesas ISL69259 device model
Date: Thu, 30 Jun 2022 17:06:26 -0700
Message-Id: <20220701000626.77395-4-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701000626.77395-1-me@pjd.dev>
References: <20220701000626.77395-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=me@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: RffBvu3ozmJT

From: Peter Delevoryas <pdel@fb.com>

This adds the ISL69259, using all the same functionality as the existing
ISL69260 but overriding the IC_DEVICE_ID.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/sensor/isl_pmbus_vr.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index 799ea9d89e..eb344dd5a9 100644
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
2.37.0

