Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85218606A325
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Nov 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FNAyD9BM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUO3c-0000pr-J9; Fri, 20 Nov 2026 07:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xUO3a-0000ou-Vs
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 07:49:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xUO3Y-0004l2-Mr
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 07:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795178971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqKxOcavRdkss7CvBdIIjsxzaXmG9yDTO0yKuff2+/I=;
 b=FNAyD9BM7Fi8tY+xRhKAn9/yKveA4sJIPywrtYMqAqN361m3itpN81s5NocGJwm//1AZyo
 EqssurjBS+1dwrbpLa35QHwXuxX3p1X0Ay/YJhATAYgxtBXr5PzHnUKbZntk7gYjiMSc0u
 j7TKT+74RgTvO0nFg9HTLsmyxkgm2xE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-AFH6eY9sMcGSNaeQkrEnoA-1; Fri, 20 Nov 2026 12:49:30 +0000
X-MC-Unique: AFH6eY9sMcGSNaeQkrEnoA-1
X-Mimecast-MFC-AGG-ID: AFH6eY9sMcGSNaeQkrEnoA_1795178969
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5363b06bcb2so17510551cf.2
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2026 04:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795178969; x=1795783769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IqKxOcavRdkss7CvBdIIjsxzaXmG9yDTO0yKuff2+/I=;
 b=iGgjHizJyCwRCdd5lr9anVy3F33YQqjidWj7FjQy7Ht1TWif5mwepy6Sv9libfnJrJ
 Gg025nH9b31pDZpvUkoQWJhMGaVR0pcxGnlgOqXeTa5ovJDy11Fhim1l698S8S2b5cwV
 Gtekr6hkhNkTr3ViIfa5KQRk5b15cda8Yl5uR+RqDMmdLZ7kV4wkzJPPVVtsSu79yEE/
 S3T15OwbReDi2ugQUS9b9ViyFnA+1H9CJANx+EzfTzUCnYwTz8XYUhBg3Ga3IYcwAhwf
 D6cyNO6QYII0lTgfALXb0BbREE9ywqHUHjtftmJzLC40uO4jpU5Q/xZaaZJ9gQCUxAJS
 5Opg==
X-Forwarded-Encrypted: i=1;
 AL+hErHvIiPN+RryzA1zJ3tfYNjzBuf5738j9iw+SqY0xOgs6/dDrp51aEK7dR1+WYj+5NZ5vIPvzEZFmg==@nongnu.org
X-Gm-Message-State: APuU4Z81Yf7YVVpRlwIYmC+1YBe/WVBPSfUFnfRD9DZKHqcpOVZ7Xbwm
 4dcpwycRoUmnTZopJbPYecrs6MZg0p8XidL/oFMAfjPn+uwbQyzcttustvRJmVNZVgleva+FhSd
 VLXSlw2zsgQ7d1/6iSLWimAU33nbBxCqrNuOHSALvZ8hABKVdnlwoKA==
X-Gm-Gg: AZFdTZd9yEkQFbEfLPAgDLDR8gCdIe4nUFo81psNjPUVP+1t232I63z8FUTs2jZBTn/
 W02A0fwcBNvtbgK0zAEYxel8y9vX40W5oX5MRqROpKsHfyNSkUIpbtJ4tnSM/oE92NOljTWfgxF
 cCAxB+PttqdKA/JXAES4ruCETGVwXkKidPR9cFroUnfVG3QZuDDEJR0jzyJu+AdO/70FCJyQGha
 7x0OD7eLEejGbf9tUHSyouAoWzYUbCSUuWdn38LKDfI9J+zhnzQMsIpHamKNKqGv86JXNL0H0Jo
 stVzb5SBSyrdl1Q1TK+aGL2Wq53+IDjd8V7m1eq7EoRS52pnFrzI/Qyt4ZX8g86lmkFoXaf9vjM
 uLbhPsv2kaorNf5WVVNpv0ISH29rWfz6R850mzukY0MNL
X-Received: by 2002:a05:622a:1f89:b0:55b:8a74:cfc4 with SMTP id
 d75a77b69052e-55d76b5e88cmr50298611cf.76.1795178969380; 
 Fri, 20 Nov 2026 04:49:29 -0800 (PST)
X-Received: by 2002:a05:622a:1f89:b0:55b:8a74:cfc4 with SMTP id
 d75a77b69052e-55d76b5e88cmr50298231cf.76.1795178968832; 
 Fri, 20 Nov 2026 04:49:28 -0800 (PST)
Received: from localhost ([142.188.212.246]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d7c654585sm13759661cf.5.2026.11.20.04.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 04:49:27 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 peterx@redhat.com, qemu-arm@nongnu.org
Subject: [PATCH for-12.0 2/6] hw/gpio/zaurus: Move VMSTATE_VALIDATE() check
 into post_load_errp()
Date: Fri, 20 Nov 2026 07:49:19 -0500
Message-ID: <20261120124923.1656220-3-peterx@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120124923.1656220-1-peterx@redhat.com>
References: <20261120124923.1656220-1-peterx@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eTArDOWmdpkt7e9eQIi-AdSQw72yc91oSIz4Fp2PPdo_1795178969
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To pave way for removing VMSTATE_VALIDATE(), remove the use in this file by
moving it into the post_load_errp().

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/gpio/zaurus.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 3cf626a550..a60f4d4393 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -23,6 +23,7 @@
 #include "qemu/module.h"
 #include "qemu/log.h"
 #include "qom/object.h"
+#include "qapi/error.h"
 
 /* SCOOP devices */
 
@@ -188,12 +189,24 @@ static void scoop_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-static int scoop_post_load(void *opaque, int version_id)
+static bool vmstate_scoop_validate(ScoopInfo *s)
+{
+    return !(s->prev_level & 0xffff0000) &&
+        !(s->gpio_level & 0xffff0000) &&
+        !(s->gpio_dir & 0xffff0000);
+}
+
+static bool scoop_post_load(void *opaque, int version_id, Error **errp)
 {
     ScoopInfo *s = (ScoopInfo *) opaque;
     int i;
     uint32_t level;
 
+    if (!vmstate_scoop_validate(s)) {
+        error_setg(errp, "irq levels are not 16-bits");
+        return false;
+    }
+
     level = s->gpio_level & s->gpio_dir;
 
     for (i = 0; i < 16; i++) {
@@ -202,7 +215,7 @@ static int scoop_post_load(void *opaque, int version_id)
 
     s->prev_level = level;
 
-    return 0;
+    return true;
 }
 
 static bool is_version_0(void *opaque, int version_id)
@@ -210,27 +223,17 @@ static bool is_version_0(void *opaque, int version_id)
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


