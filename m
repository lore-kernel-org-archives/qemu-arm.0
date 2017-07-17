Received: by 10.25.44.15 with SMTP id s15csp4050411lfs;
        Sun, 16 Jul 2017 19:40:59 -0700 (PDT)
X-Received: by 10.55.36.141 with SMTP id k13mr24240823qkk.64.1500259250547;
        Sun, 16 Jul 2017 19:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500259250; cv=none;
        d=google.com; s=arc-20160816;
        b=ShoCXQvsT0HqeAlz+nYfSKNUZRQ/cSJ11QRvhvtbff7sB32ETrW8lKaS8ny/aXH0Sg
         tFnKS9h03jRk8tIXu8+vPHYQ45+theXIeNXaPJbHbNTh2B1PkH3h/mDG7mgxV8Ouf7XV
         8KfTaJxaUlDowHaJiDaZXBLGqulrqqploS9u9WafFnF8UJ2qZ8R1bx7geYK/+OPgGKSB
         6yShCf5d2xlVjWj26LYleQwoUVOAQTkKN22JLlomGCow6ROEUrQbGdC6XkmCCKB7uoaB
         L727WxfqWhv21ls4IB2mpzYzRDIFFeXivTgst/DP1VY3z19JMcpYI2Zl3T7I6ilkiAOh
         CqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=XaAW/UKQH4B0W8x+tOlNpwKZkm4tqBZLkhdEIru4ytQ=;
        b=h19tGuzhe6AA1rwVg195e/uF4QKC+9+BKCPGCskk+eKzKz6DO4KBv4jIirVs2ut0Fc
         9hWY07vONhP8As5IGydDE/6ewZoROJSYzE655mLtYJGlZVth6W7RhoavJaIHCVenVdOz
         q10nhwkTkIvZMJE655MMehSmKW9umjQue+tir0fbQDWLaMVmrCc7iZpajSkgGhJiz7vO
         eP39JuMBGmbrXdhg+J12tZMRdNUr8Jn4HAP4zZ7OtxOhUmw9v5shk9KfuTILn+y2YIWV
         VAmXFiRlnl6iwIbrwXd81de+r7bBk5OXUG7e7GoPdvn59f1HtZTEW3ct9lz5Be4mzQAa
         95fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y54si699334qtb.113.2017.07.16.19.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 19:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWvxn-0001mF-TD
	for alex.bennee@linaro.org; Sun, 16 Jul 2017 22:40:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvk-0000Wh-A5
	for qemu-devel@nongnu.org; Sun, 16 Jul 2017 22:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvj-0001YH-LF
	for qemu-devel@nongnu.org; Sun, 16 Jul 2017 22:38:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45626)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dWvvh-0001X6-Cu; Sun, 16 Jul 2017 22:38:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F30FC049D57;
	Mon, 17 Jul 2017 02:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5F30FC049D57
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5F30FC049D57
Received: from lemon.redhat.com (ovpn-12-94.pek2.redhat.com [10.72.12.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5B59600C8;
	Mon, 17 Jul 2017 02:38:34 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jul 2017 10:38:22 +0800
Message-Id: <20170717023824.18796-5-famz@redhat.com>
In-Reply-To: <20170717023824.18796-1-famz@redhat.com>
References: <20170717023824.18796-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 17 Jul 2017 02:38:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 4/6] xlnx_zynqmp: Convert to DEFINE_PROP_LINK
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jPdJBYvjiP04

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 hw/arm/xlnx-zynqmp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 64f52f8..cd8a4aa 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -140,11 +140,6 @@ static void xlnx_zynqmp_init(Object *obj)
                                   &error_abort);
     }
 
-    object_property_add_link(obj, "ddr-ram", TYPE_MEMORY_REGION,
-                             (Object **)&s->ddr_ram,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_UNREF_ON_RELEASE, &error_abort);
-
     object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
     qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
 
@@ -434,6 +429,8 @@ static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
     DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
     DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
+    DEFINE_PROP_LINK("ddr-ram", XlnxZynqMPState, ddr_ram, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.9.4

