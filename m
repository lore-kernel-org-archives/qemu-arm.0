Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009D9CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:11:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAy4r-0006Sq-Bh; Mon, 20 Oct 2025 18:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy4p-0006S5-U4
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:10:03 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy4n-00063l-UN
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:10:03 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42701aa714aso2981786f8f.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998200; x=1761603000; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=peeMmEa9/4QTziWR6C9i27UArz/pXKVp77TsxavtYSE=;
 b=cnWjboAeQSEDolcr5doos21LBnosv0WOpUczgFbUk/G6y3MeRwYvys69V/8j1aEx+C
 6N6c37OqcpPH+wAnKg3C8v6l47MF0JRtVEf3wUyAIJch4+LItESowcagTAc18JNti/uY
 XYDKkFKlAMhq5uaNwFs960I0Y5FMAmt4sIAH1dvyGs5fdmHNVJeHLsn+xCaTmgGvJ7Cw
 occIqoE+v1NUOhhtR+60tdUvT7LTcJ2Z7pgI2FU+xJbTFQbnq8M6ydOYV0GTY+MEF1zN
 dsW3aGJJJAYotOvckot4+nWeAudiggX53fXyoIvKOYg8vXYaMNq8tEvBmk2tLuqlh/F7
 zN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998200; x=1761603000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=peeMmEa9/4QTziWR6C9i27UArz/pXKVp77TsxavtYSE=;
 b=BM5mDJtfp3Yp09I1UmJ+NJjF2XznNqq/ZdfU59OY7SlTcuCIGHyEV6PAlgqJf48tYP
 OLQ/Nw4fJDDwoa4WjlLsQP6HiCJwAILf9lGiHV8BA7/zt+Ftt5szY31IIigTKmECGxlN
 7NNkebsVQInZKEWiX1CroSASAFzszO2CrCDsyLFmrDWlpk6wJ9O2fVDidDIqJQ+vTfck
 CAL47S/b9GbLBLymvJ5QgK2RAsjQefiCXVlDMW1W7wxcPybnaOClbDgg+4lHJNK/AlnG
 9relOvvYgAJJrhEcG7OO0SMlJsMBoVJiaq4COT4UN3vivkiCAnAFJvtC2/1pkhKjZE3G
 em1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw2mQN4xlMrVYLA940zKP6Gbsn7MIizD1uQmtr4iSwVq21BR6d68SWYGg4VL/xTZVF28tl/JfsEA==@nongnu.org
X-Gm-Message-State: AOJu0Yy2sRsZo9cqgGTqtaWMMOWXb46RXsjb3lTxDbEtZLvVYs+xTDUJ
 u38oQpv6YrPqPx1OyKJrySYEtpkku19UEXqj/spakJY+0GCwJwQvUAKZ+ME3sOAsUIM=
X-Gm-Gg: ASbGncv2Z/QZ0KQf5kYU46O+mQa476sbF9EwrMYGAEaYr/3q2Os+Og6k+Ca8hegb01w
 K2CFN/min9djVOOZP2XxUH1b4oRPQNKd/WNqQ1nor3+5hDmfOovtn8NnbcYRwBN0OqbsM1zWasV
 Vbp3X6dB6+IQFx5ol2DHgm4MwAKIBFAJjFcAZmWeroazUCDaQZEf9e1sX0VE7mkJs+mI9LGqyxt
 /EKsoZA600Diu0gqRfYtqx65OE/J40fLvS0O1/YIcCrDKKZ54Rarlin1wFqI5Px/Iqtnh/Mpt4P
 SOm0K1fq+wKGUor25+0L3wdG2zqb34lztBmPkB/Gj/3v43QQ2o6M41m7LBonOceKEbGG+WBBdDB
 7KNBXgCDEBTza7okNpir6J2K/3xD24y4JZCkPtbLX52SA/WCar8Fz+RvNmxl59nvhIozFgvpY2a
 s1kwOkESKA5f6DQiyIVFaXoR1uIVZWzTC8IAOQ+MAusB/8tOTogdFOP21QRi9q
X-Google-Smtp-Source: AGHT+IEY9dGVhude0M+GcNa2jlGZLSxiMaf6S+dOd8BRUbbC+FnSri8tG8vaEaVMdmGvsI05jsd+nA==
X-Received: by 2002:a5d:59af:0:b0:427:60d:c50d with SMTP id
 ffacd0b85a97d-427060dc758mr9221403f8f.51.1760998200207; 
 Mon, 20 Oct 2025 15:10:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3f5esm17054127f8f.20.2025.10.20.15.09.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:09:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 03/30] hw/boards: Extend DEFINE_MACHINE macro to cover more
 use cases
Date: Tue, 21 Oct 2025 00:09:12 +0200
Message-ID: <20251020220941.65269-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Add a more general DEFINE_MACHINE_EXTENDED macro and define simpler
versions with less parameters based on that. This is inspired by how
the OBJECT_DEFINE macros do this in a similar way to allow using the
shortened definition in more complex cases too.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <d75c8bbed97650f1a4d2d675444582a240a335b4.1760798392.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/boards.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 67c94bff1c6..99292edf5a8 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -503,7 +503,8 @@ struct MachineState {
  *      DEFINE_VIRT_MACHINE_IMPL(false, major, minor, micro, _, tag)
  */
 
-#define DEFINE_MACHINE(namestr, machine_initfn) \
+#define DEFINE_MACHINE_EXTENDED(namestr, PARENT_NAME, InstanceName, \
+                                machine_initfn, ABSTRACT, ...) \
     static void machine_initfn##_class_init(ObjectClass *oc, const void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
@@ -511,8 +512,11 @@ struct MachineState {
     } \
     static const TypeInfo machine_initfn##_typeinfo = { \
         .name       = MACHINE_TYPE_NAME(namestr), \
-        .parent     = TYPE_MACHINE, \
+        .parent     = TYPE_##PARENT_NAME, \
         .class_init = machine_initfn##_class_init, \
+        .instance_size = sizeof(InstanceName), \
+        .abstract = ABSTRACT, \
+        .interfaces = (const InterfaceInfo[]) { __VA_ARGS__ }, \
     }; \
     static void machine_initfn##_register_types(void) \
     { \
@@ -520,6 +524,14 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+#define DEFINE_MACHINE(namestr, machine_initfn) \
+    DEFINE_MACHINE_EXTENDED(namestr, MACHINE, MachineState, machine_initfn, \
+                            false, { })
+
+#define DEFINE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, ...) \
+    DEFINE_MACHINE_EXTENDED(namestr, MACHINE, MachineState, machine_initfn, \
+                            false, __VA_ARGS__)
+
 /*
  * Helper for dispatching different macros based on how
  * many __VA_ARGS__ are passed. Supports 1 to 5 variadic
-- 
2.51.0


