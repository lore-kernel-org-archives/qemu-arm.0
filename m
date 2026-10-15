Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBD5CC6B38
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:25:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIe9-0000vL-Do; Thu, 15 Oct 2026 06:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIe2-0000qZ-1S
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:25:06 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIdz-0003NQ-5a
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:25:05 -0400
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso48102285e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792059901; x=1792664701;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hRRN1JeUA7jwAaRlPA2bDBFjU7DAkrQAjmmVepzRcwY=;
 b=tUJQU6F2M916PRvXfiHk8ndAkPKKEA0QsoBupp+yxMlyq9kgPhVOLH+oONC/TNtz5F
 lEgEmP21sHbFF+0S31gT0tGjjj4rKDEZ9NjSU/Ww0fEWwQMPxVRr4ENImBal2bi9a4nG
 JXguhW25es56vfYgpdsD0jGUR7bri5mZGEPNe9g9X7exDis4zhK+kOeBO//jZt7ehEHY
 q/tt4ep1LvQrUV+t2lrWYtPnxMLNlwr0qmxBq2BhRLsOuCZi3UKiW6uZpq+QQ25bDnPF
 2VdnWKUQyWoyg1967AH8huzJzkDv48J0RDtbhaHZFKrY+LEoR5uu7cdBmB3TQVKRd36Y
 eKdA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6znLB55CFbunm/vwcoIhEJYHbF1XfUjPH4KFgSfk/rdrKTQ0exNX/Yd1iIzg9Ai9oNj86+WX3LQ==@nongnu.org
X-Gm-Message-State: AFq9FYISoMr29LcOchxbTJv53RXf7NO6BuTIZMRqlYl2xvQpBSTlz6F0
 hEOfzZXBaaIHZHRRV+7lHgIYJpL/LCsE50Fz8aVeoFtexfRIKAoojJ4H
X-Gm-Gg: AYBFou2k4r1ScsBAEdJ35dIHgMLt5kfz9aq9Vp8hX7fX+TIt+a0UsTRfjvixh1+Vriy
 ibt5jnZu//XVx0sw/+DSTR8qObRoZSVRFVv3meDyo4OdcSehyvglX9aMlMNtngY3K7wWNKeMMlc
 HirUq92d0m8RtTy4UkyWMhiLBCRsJxgRoAL2eutMHNSWi9zbz8mFOskqqABOCj1QK1tulO4+tb9
 gqdBlt2iA9bBY+2v7q7hfx2SQXVcgiedIxzcmgr3nsktn4xjt2Rf5TZAOh4HvY5l/O3qKq02w6L
 5Ei6NDj5F6/W3d2r2RxO7gFURg//qLDCZ+rZxkZIzqTJ//h8YKqLYgKwbStPrnzP8J+/w1TbpNU
 aWEk6kHNsyIp+5t9Lu9MqhF+rP+/2AO/M/0Fmzl44tXQRcJuYEIw1R9IoKQaRCIeAMXOBbkgggm
 kdBj6WBEYteH+dEgLZs+Y6WoRuvW8/I8wC8wlgOAydaCx4MeTpArlz6+MEyEVDIT3VuE31kJGpB
 ctNnQGB9NU9KCEFff6o2bjnXC7yw8hOYmJbscCd+UMfOnYIA0foBnDb
X-Received: by 2002:a05:600c:350b:b0:4a1:ad01:f8dc with SMTP id
 5b1f17b1804b1-4a1ad01f924mr164855695e9.21.1792059901206; 
 Thu, 15 Oct 2026 03:25:01 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de3f7f8b8sm16993684f8f.35.2026.10.15.03.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:25:00 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:27:55 +0200
Subject: [PATCH v3 08/50] hw/rtc: ds1338: move TYPE_DS1338 to a public header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-bmc-minerva-v3-8-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056475; l=1605;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=jNIbEw5Dx6rmzBocKs0idI42P74RBZ2J77WhR75yZGs=;
 b=69tmfEnX6XuLSGcxuI3K9dz2hqhVD3rFmws43ND5avNLLyg4HCGpgtxn6qpeFZDj3RGMoFQ2q
 NwLglTZbW+MCsGZ5bQR/5Yh3+PWECxOyhnYmfRh6WxpbQXw1w3gzV4E
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.48; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f48.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Move the TYPE_DS1338 type name definition from ds1338.c into a new
include/hw/rtc/ds1338.h header so that boards instantiating the device
no longer need to redefine the type name string locally.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c         |  2 +-
 include/hw/rtc/ds1338.h | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 5f1ee2e410..f8b3340bf0 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/i2c/i2c.h"
+#include "hw/rtc/ds1338.h"
 #include "migration/vmstate.h"
 #include "qemu/bcd.h"
 #include "qom/object.h"
@@ -29,7 +30,6 @@
 #define HOURS_PM   0x20
 #define CTRL_OSF   0x20
 
-#define TYPE_DS1338 "ds1338"
 OBJECT_DECLARE_SIMPLE_TYPE(DS1338State, DS1338)
 
 struct DS1338State {
diff --git a/include/hw/rtc/ds1338.h b/include/hw/rtc/ds1338.h
new file mode 100644
index 0000000000..f4cfe6a8e7
--- /dev/null
+++ b/include/hw/rtc/ds1338.h
@@ -0,0 +1,20 @@
+/*
+ * MAXIM DS1338 I2C RTC+NVRAM
+ *
+ * Copyright (c) 2009 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GNU GPL v2.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_RTC_DS1338_H
+#define HW_RTC_DS1338_H
+
+#define TYPE_DS1338 "ds1338"
+
+#endif

-- 
2.53.0-Meta


