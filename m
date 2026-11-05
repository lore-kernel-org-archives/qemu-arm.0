Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90CE606A31B
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:29:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtmS-0007fc-C5; Thu, 05 Nov 2026 04:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtmP-0007T7-8X
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:29:09 -0500
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtmM-0006yo-Vw
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:29:08 -0500
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-8a05f2d5cd3so800707b3a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870945; x=1794475745;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4Ikq5dso/tV2KB9ZjIepHD6lIEC4kho5MyhHbP8Uxvg=;
 b=MDvpaHz1wIBOKJCkp5/rjjd7zAIUbyVVZYYsLhYMXnfKXPC4umFKFG6WGOF+rjJxwq
 +mgGB2t9yO/AvViO+Y/bh3lI4lzl9nNto1XwkJyKoDXYGYI5DL5A4+au9QrRCks2rlxE
 VXWwvfzNA0bQe9zlhl6XwkFx0K1kmBwTYHj2OqcDJ7SnXuJEKncaWb+JNRlyv4ssosWC
 FfLvS5TipNAJunjnbO6HvztLOP/kxoF8L3mNjs+x0DdMODxcvETIBLButNpPF12R8Yq/
 x0r4muC3tGTEuZtGgHn25NWA8H98imDwX26etpScqoX+oiLCR5Z5hd9bZK7t/AHh+owk
 KhsA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzgIDxyUR30KSMneklzCwhmr+Mzqn22o2dX4pcY4bq6IbmMAg/VbctrV+rIbaEE3z09byOB4gmoCA==@nongnu.org
X-Gm-Message-State: APuU4Z/z464LaUFMgFQiXt/SJrT9QfoKAuxcOal0Y+dLDmMB53QrE2zP
 6U7qWy0sJbZ0SJu1VV6xdaPWn1a1IEYl8866vJH1RgGWjJ72of9r8L2g2FFuID5re/A=
X-Gm-Gg: AYBFou2f7ux6cLFJsR9leVrW4rD3GDfiMSidxDvKrMTOJOyJlytl0jXZtrp4qbsyl75
 km6ICeiw/ThLNSH7BtOvKhRoToF9daQ5FD9XmyFPlAFxl41wqmL+4rNUu7RqwhHTRWNEHZiTYKt
 bDccLulVh3cyEBNtK4mipwucU57t3YoNhLoMGvPmbZ5Mffd1hkiifVqQct4UqWLLRBvmaeCzdzZ
 RPU5azxFfpTScQGkRvjiTXKziNFgNjCnhclc9dw8sJ6kPqnwMh2zNKm60beJrZJWeV2QN14jXhG
 XFDe8mdHlfOP3CtqexrhEZfKgt7EWjM01+qP0+qc7W8gWiYcfLS+wL4BBegMj8VB/AGb1Y2oQMF
 DqwF5EBgyZFfUVPabZpN+9XpNCxQftwkgiWWLTGZUypftR/+y4aGoDABLAWpsAKZ1m2OOjd56Pd
 1H9DQdRRSQwGWLCECRA0fFlkZWTOKev9b5GxxKXu9kawmAk6r9yjAVSKrOtY53r+C24g+tXOYhE
 Cpc8811CFHadXn1H2JTL93/QakVrGMG7yybuW05HexcJnnZhy6JFP4unTJQ2y7/C03jjx+voTif
 YHsD5ITVp6c54WN7Pkmy5zriq2LSn9Mf7s6FzJ5a7DVyjG1HT7QFOzP/FmIb5/5WXZRKIEp7PEH
 K
X-Received: by 2002:a05:6a00:98c:b0:8a7:917:43a0 with SMTP id
 d2e1a72fcca58-8a9bcff6a1bmr15696322b3a.15.1793870945064; 
 Thu, 05 Nov 2026 01:29:05 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8b09af91d32sm1791343b3a.25.2026.11.05.01.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:29:04 -0800 (PST)
Date: Thu, 05 Nov 2026 17:25:49 +0800
Subject: [PATCH 10/16] hw/sensor: tmp421: publish the variant type names
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-tmp421-v1-10-c46853f5e1f0@free.fr>
References: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
In-Reply-To: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, eblot@meta.com, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793870743; l=1627;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=SMWdOalFbioPmdcZYsqzKWLV2yaatF5BDs26GQ0sHwM=;
 b=JVBN6QuDqwdWKorHhNIkWw3kZvVmPBkVQCddKfiSwym3OahJtmobBCAVa8p9XMSn3Y2jkd4oX
 7cr4U844s4ODAuOqT9BGh52azuxKX8gWKK3sF+lS1U5ZjObish+Qvlg
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.210.180; envelope-from=eblot.ml@gmail.com;
 helo=mail-pf1-f180.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move TYPE_TMP421/TYPE_TMP422/TYPE_TMP423 from tmp421.c into a new
include/hw/sensor/tmp421.h, so boards instantiating the device share
one definition instead of repeating the type strings locally.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c         |  4 +---
 include/hw/sensor/tmp421.h | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index 1966301d7a..1d3d526d4a 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -42,6 +42,7 @@
 #include "qapi/visitor.h"
 #include "qemu/module.h"
 #include "qom/object.h"
+#include "hw/sensor/tmp421.h"
 
 /* Manufacturer / Device ID's */
 #define TMP421_MANUFACTURER_ID          0x55
@@ -80,9 +81,6 @@ struct TMP421Class {
     uint8_t config2_reset;
 };
 
-#define TYPE_TMP421 "tmp421"
-#define TYPE_TMP422 "tmp422"
-#define TYPE_TMP423 "tmp423"
 OBJECT_DECLARE_TYPE(TMP421State, TMP421Class, TMP421)
 
 
diff --git a/include/hw/sensor/tmp421.h b/include/hw/sensor/tmp421.h
new file mode 100644
index 0000000000..fbfdd87b7a
--- /dev/null
+++ b/include/hw/sensor/tmp421.h
@@ -0,0 +1,19 @@
+/*
+ * Texas Instruments TMP421/TMP422/TMP423 temperature sensor
+ *
+ * Browse the data sheet:
+ *
+ *    https://www.ti.com/lit/gpn/tmp421
+ *
+ * Copyright (c) 2016 IBM Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_SENSOR_TMP421_H
+#define HW_SENSOR_TMP421_H
+
+#define TYPE_TMP421 "tmp421"
+#define TYPE_TMP422 "tmp422"
+#define TYPE_TMP423 "tmp423"
+
+#endif

-- 
2.53.0-Meta


