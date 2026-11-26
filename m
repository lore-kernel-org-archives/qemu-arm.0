Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DAC606A32A
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W9gCAPVY
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWihu-00088Y-Tl; Thu, 26 Nov 2026 18:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWihs-00086Z-QU
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWihr-00062a-7p
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795735006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5msL5Y3whH1wyPAcimr4/6A5hkAEK5pqKOOOJceBdzM=;
 b=W9gCAPVYe269Xn6F3hKkPdLG4qAxWSe2WuIxiROhYQdUKfuT/wZJIhpL32NYWV1/H+BC1c
 lPUx4CQT+3maGP1aA7wxWdQcYImjAPXwxntnBuFOjeTJregZkWVKu/DW9PatD4XaxyFRmP
 CBT1crUxxyf8CYNrpvVpLoNo1DQ7Wjs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-mDEFxqnsNlazBHDVoqdKag-1; Thu, 26 Nov 2026 23:16:43 +0000
X-MC-Unique: mDEFxqnsNlazBHDVoqdKag-1
X-Mimecast-MFC-AGG-ID: mDEFxqnsNlazBHDVoqdKag_1795735003
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93cb7f9bb86so1409545185a.2
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795735003; x=1796339803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5msL5Y3whH1wyPAcimr4/6A5hkAEK5pqKOOOJceBdzM=;
 b=g2Gpiw6T8o7Hs445kilxsYIa6ArOa4EZjtREtK38cd0U1IxM9x2E/7cl4wAMUhmDx6
 96tk7xnL+ExgO05unrXS/J4njVTmf7UEHxnbiuAQwqqlc4/i0f0o62oqviHh9roiUOsz
 +rt69CoMgkyYJmEoBnJBJWDjf9v68ww5TJWwOyHqqcDCRL/EdHHPLt/PYYNm5XoOF1t3
 RUGgs+rAzta76JwFHG1T7ug4zZDOtlXg63SpvJ+oSKCC/zdQF0DTGyVaHJztVe6/cHjD
 eKl4cwwu9iUI10/vrHfQl5cFMPJw19wdHYiI9FxQmdf2q5BPsLGYF4TvlbpB1lIV8Rvb
 te6g==
X-Forwarded-Encrypted: i=1;
 AL+hErF2gKZvTciKfjpgQRZVZZdaajfrtKa2aWI8Y/ZuCx5uIOVQASNTYDdzF5B74vMbQ9wO/LQFAfDKOw==@nongnu.org
X-Gm-Message-State: APuU4Z/nQKOldFsJhYJDt5cltCiGU67SF8N6L0xvzPy7VhMqzU7yEOvO
 IIluMT0X0Ikfs6h7dPhB+XlbMomJcUZwJuHJQYDDcF04F8tYEmY1dfjVEMfqldaRlYlOyAfmzzX
 CPV7l0sLpmIptK0YyXUAp5zNCgrSDToiKOIPis8qP/ClEM4K3eDd4/A==
X-Gm-Gg: AZFdTZftd85c8T4jeaLwXzxMexT34+ygL70Yqa1c6bb5DPAM0NxgIXK73YkvlKHUShu
 /QUAHgI1C+xbDVcTJy/jPQiysJQ4AQBpMbhFQg3s6/jLL5+5779zYSRUvslpl6cpC+lJMV/feA4
 ndPzceVHDW7pYUOUr8PMeqU0T7aj6XVr4uY/VIGU0v4b3LaItMtdDBffyv0ECrjqDxNZwHgAdZE
 N9/dLNweifiUomj0DR+CgsqAF6YsR/QQBcMGxODEAizs5WznFqvkrgyYt+uwoFSoQLkb36Xa5SG
 +mvJU3UBHKqMFYT2qlDBcDYv6HEDx49NhV6UJEPovXV1dsr+0z746sHzQoiJSOl+K4C8EZIoO93
 GWHQosUHvkY8e4lcnOLakw2bKm28YpT1xALCONKf6C/76
X-Received: by 2002:a05:620a:1d0b:b0:949:75f1:e5fe with SMTP id
 af79cd13be357-949bab1719cmr3745579585a.73.1795735003070; 
 Thu, 26 Nov 2026 15:16:43 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:949:75f1:e5fe with SMTP id
 af79cd13be357-949bab1719cmr3745575685a.73.1795735002525; 
 Thu, 26 Nov 2026 15:16:42 -0800 (PST)
Received: from localhost ([142.188.212.246]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb3a646fsm1697088985a.22.2026.11.26.15.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 15:16:42 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juraj Marcin <jmarcin@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, peterx@redhat.com,
 Fabiano Rosas <farosas@suse.de>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org
Subject: [PATCH for-12.0 v2 5/9] hw/gpio/zaurus: Move VMSTATE_VALIDATE() check
 into post_load_errp()
Date: Thu, 26 Nov 2026 18:16:27 -0500
Message-ID: <20261126231631.3392756-6-peterx@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126231631.3392756-1-peterx@redhat.com>
References: <20261126231631.3392756-1-peterx@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PsoSqEDdQaXnsRg94Z4MexpJ_6Nt11aKurKmO1wMIs0_1795735003
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To pave way for removing VMSTATE_VALIDATE(), remove the use in this file by
moving it into the post_load_errp().

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/gpio/zaurus.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 3cf626a550..ede28f0929 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -23,6 +23,7 @@
 #include "qemu/module.h"
 #include "qemu/log.h"
 #include "qom/object.h"
+#include "qapi/error.h"
 
 /* SCOOP devices */
 
@@ -188,12 +189,19 @@ static void scoop_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-static int scoop_post_load(void *opaque, int version_id)
+static bool scoop_post_load(void *opaque, int version_id, Error **errp)
 {
     ScoopInfo *s = (ScoopInfo *) opaque;
     int i;
     uint32_t level;
 
+    if (s->prev_level & 0xffff0000 ||
+        s->gpio_level & 0xffff0000 ||
+        s->gpio_dir & 0xffff0000) {
+        error_setg(errp, "irq levels are not 16-bits");
+        return false;
+    }
+
     level = s->gpio_level & s->gpio_dir;
 
     for (i = 0; i < 16; i++) {
@@ -202,7 +210,7 @@ static int scoop_post_load(void *opaque, int version_id)
 
     s->prev_level = level;
 
-    return 0;
+    return true;
 }
 
 static bool is_version_0(void *opaque, int version_id)
@@ -210,27 +218,17 @@ static bool is_version_0(void *opaque, int version_id)
     return version_id == 0;
 }
 
-static bool vmstate_scoop_validate(void *opaque, int version_id)
-{
-    ScoopInfo *s = opaque;
-
-    return !(s->prev_level & 0xffff0000) &&
-        !(s->gpio_level & 0xffff0000) &&
-        !(s->gpio_dir & 0xffff0000);
-}
-
 static const VMStateDescription vmstate_scoop_regs = {
     .name = "scoop",
     .version_id = 1,
     .minimum_version_id = 0,
-    .post_load = scoop_post_load,
+    .post_load_errp = scoop_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT16(status, ScoopInfo),
         VMSTATE_UINT16(power, ScoopInfo),
         VMSTATE_UINT32(gpio_level, ScoopInfo),
         VMSTATE_UINT32(gpio_dir, ScoopInfo),
         VMSTATE_UINT32(prev_level, ScoopInfo),
-        VMSTATE_VALIDATE("irq levels are 16 bit", vmstate_scoop_validate),
         VMSTATE_UINT16(mcr, ScoopInfo),
         VMSTATE_UINT16(cdr, ScoopInfo),
         VMSTATE_UINT16(ccr, ScoopInfo),
-- 
2.56.0


