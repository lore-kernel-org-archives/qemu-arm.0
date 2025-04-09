Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7557878njd;
        Wed, 9 Apr 2025 01:08:13 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWiIHm0lkSH+V6bnC3d8Aiv7jKWwzGnUxwEHnoMa1rvw9VW/mVJD9oOBw2D3+Hu4Jguyoc+tBe0HNd9Pg==@linaro.org
X-Google-Smtp-Source: AGHT+IFrKcLKSB0CBJTpPLEJlvxaQMkj/DjGxDCr9Y8Op3bfLjcLid7DSe+0qofoVSJShPj5k+sP
X-Received: by 2002:a05:6a21:329a:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-2015919087dmr3170532637.10.1744186093088;
        Wed, 09 Apr 2025 01:08:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1744186093; cv=pass;
        d=google.com; s=arc-20240605;
        b=HMU8+rao4QZpF9snqweQA5CBrJhzND0E9g3XhuERp0EBh0Bxjq5bItmmH0x0k3zXLq
         2YE7qm7LAnuQBMSa2vWUb50TwlOrXHdsmXcMywFY0mjQ0qJ2pM1goic2jWYmoIrT2puf
         OZnoUdub1rxFoitfLJ5fucXvuAePB+tELbZl2qu0PMTHo0KJCGhF1zh034MrYOtuDuEj
         FoRGMoTAnfanBEokmP3YmPDLRyRK4iIGCQwNPlMzL7Fd2IyLJRJ5OuHp+1w6bDmcQDwk
         v6svCX/MofDoDeN8nNTIdAU38z+r/2ewPhQVQVhlU4/oDEmJlnPAxi/BbcEtvhxWKD6/
         kswA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=oWLoHP7zXcc0L6Y6yoEXphJfDLQEWJOL3nL8phlWy5Q=;
        fh=PtEDQrZFPZGDVFMumSdzEvkXT1K9aj+GDIdDBicI0gg=;
        b=hlJdg61E6QSMGOVTJbOf4IMi+3awphLgsDHY9v6xAY7zyf91STdtRuxIoFPcBj96yc
         N7fMubioSA1KARA3uOehN/CXP4X6E4llKBwbyI2Lduk+rdInS1MsF+NH/ExCPpy8CkvQ
         21qWhsmC9VuHvV3WUjJtLpZRti6lRU17EX96nmiZn4F7GEinmhiU/nR2arHnMvVIRVsG
         /gkwn2By7atjtTET4v2fx166dUJkAFPbAwHc7rprQqFsKCIZ5PLXnE2IprO7fO9JAelg
         48vmZvrAqJCmNME326SVqpo0jITCDdCRKOoqIIBe0lq3NoGgDZbmZxSHi5g6B/IoP6tz
         2RkA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mEWYnK57;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-42996-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-42996-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-42996-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b02a3becf16si864343a12.696.2025.04.09.01.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-42996-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mEWYnK57;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-42996-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-42996-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD99A7B5FD6
	for <alex.bennee@linaro.org>; Wed,  9 Apr 2025 08:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E797D25A656;
	Wed,  9 Apr 2025 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEWYnK57"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCB52405FD
	for <kvm@vger.kernel.org>; Wed,  9 Apr 2025 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744186003; cv=none; b=eOVdh7Q6qy5bETQ7Lng+KXpTerC0bJ62lMj5rZm3SFrAVXnpa8MXG7g4nJR3AIsBxy+zft8cD/MNVFyazs/04qppEI9DR/xTEuOV9FkDc6YeP3KsIKT/ebhnF/WlIv8jf8Ti6KnDpm14ceempOPuZ7aAB+tUBDPJs8nW8Nl2Sag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744186003; c=relaxed/simple;
	bh=UPJeKBU9B6lL8PCAg4txtntOoPDJJfc8C5kkR9P+OTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JsXsrUkX7aJPaUZL80XqXOWm1jip8KfTkUzd+0jxZKoAiEXR4ZnMtbYW3kIlws7fjLV4bfMTulD2rtS8Is1poDiX0OsVp1DM6k/nszr2ViQxzDYDr8BIp7+Y7A7yiOOyfeIWpepUHD4rN/xhfviuEjmKnfXSR+ktB2Qs7A8fQk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEWYnK57; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744186002; x=1775722002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UPJeKBU9B6lL8PCAg4txtntOoPDJJfc8C5kkR9P+OTA=;
  b=mEWYnK57c76e47VX10zmt/Jfno3bG9lJKESopkSgs7UtcMWA5N1JwO5u
   TrZSSdCvQ/Yjv8jsNwTzNnr+2znCoMwYVFEnA3tgDAI9mAVeSVGiQT98r
   qEjD92yfb0wXgPrHB+vGuy9Ljdn2Bh97Dcixef2GlQiqsITixoEM2RMld
   TODIQ/uEuE4DD3Y1HtUbhe+ll2ommxl2n06AC1Es5G66Ps1gceaI2btbN
   X40pehji+InSQDtKMFLpojj0v5wA1s+IqjgOIeet+3r7TDqMEuuXZxlfQ
   S5O55MUigS8AUkj3ghR4++LQwJnVcfdcFoIMRjF4AySWUrASCwlZiDT2L
   g==;
X-CSE-ConnectionGUID: sHiTK4o2Q9K+5JtmXQiA6Q==
X-CSE-MsgGUID: 6vE1OosRQEOvhiFRSdwbVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45810047"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45810047"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 01:06:41 -0700
X-CSE-ConnectionGUID: pKtH7y0SQuKiBQWP5t4yMQ==
X-CSE-MsgGUID: p6nLUmssSDqxwyFWnFhd/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="151702631"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.39])
  by fmviesa002.fm.intel.com with ESMTP; 09 Apr 2025 01:06:29 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Shaoqin Huang <shahuang@redhat.com>,
	Eric Auger <eauger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Gavin Shan <gshan@redhat.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Dapeng Mi <dapeng1.mi@intel.com>,
	Yi Lai <yi1.lai@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 3/5] i386/kvm: Support event with select & umask format in KVM PMU filter
Date: Wed,  9 Apr 2025 16:26:47 +0800
Message-Id: <20250409082649.14733-4-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409082649.14733-1-zhao1.liu@intel.com>
References: <20250409082649.14733-1-zhao1.liu@intel.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lrnN9yShs0CX

The select&umask is the common way for x86 to identify the PMU event,
so support this way as the "x86-default" format in kvm-pmu-filter
object.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Yi Lai <yi1.lai@intel.com>
---
Changes since RFC v2:
 * Drop hexadecimal variants and support numeric version in QAPI
   directly. (Daniel)
 * Rename "x86-default" format to "x86-select-umask". (Markus)
 * Add Tested-by from Yi.
 * Add documentation in qemu-options.hx.
 * QAPI style fix:
   - KVMPMU* stuff -> KvmPmu*.
 * Bump up the supported QAPI version to v10.1.

Changes since RFC v1:
 * Bump up the supported QAPI version to v10.0.
---
 accel/kvm/kvm-pmu.c      | 20 +++++++++++++++++++-
 include/system/kvm-pmu.h | 13 +++++++++++++
 qapi/kvm.json            | 21 +++++++++++++++++++--
 qemu-options.hx          |  3 +++
 target/i386/kvm/kvm.c    |  5 +++++
 5 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-pmu.c b/accel/kvm/kvm-pmu.c
index 22f749bf9183..fa73ef428e59 100644
--- a/accel/kvm/kvm-pmu.c
+++ b/accel/kvm/kvm-pmu.c
@@ -16,6 +16,8 @@
 #include "qom/object_interfaces.h"
 #include "system/kvm-pmu.h"
 
+#define UINT12_MAX (4095)
+
 static void kvm_pmu_filter_set_action(Object *obj, int value,
                                       Error **errp G_GNUC_UNUSED)
 {
@@ -53,9 +55,22 @@ static void kvm_pmu_filter_set_event(Object *obj, Visitor *v, const char *name,
     }
 
     for (node = head; node; node = node->next) {
-        switch (node->value->format) {
+        KvmPmuFilterEvent *event = node->value;
+
+        switch (event->format) {
         case KVM_PMU_EVENT_FORMAT_RAW:
             break;
+        case KVM_PMU_EVENT_FORMAT_X86_SELECT_UMASK: {
+            if (event->u.x86_select_umask.select > UINT12_MAX) {
+                error_setg(errp,
+                           "Parameter 'select' out of range (%d).",
+                           UINT12_MAX);
+                goto fail;
+            }
+
+            /* No need to check the range of umask since it's uint8_t. */
+            break;
+        }
         default:
             g_assert_not_reached();
         }
@@ -67,6 +82,9 @@ static void kvm_pmu_filter_set_event(Object *obj, Visitor *v, const char *name,
     filter->events = head;
     qapi_free_KvmPmuFilterEventList(old_head);
     return;
+
+fail:
+    qapi_free_KvmPmuFilterEventList(head);
 }
 
 static void kvm_pmu_filter_class_init(ObjectClass *oc, void *data)
diff --git a/include/system/kvm-pmu.h b/include/system/kvm-pmu.h
index 818fa309c191..6abc0d037aee 100644
--- a/include/system/kvm-pmu.h
+++ b/include/system/kvm-pmu.h
@@ -32,4 +32,17 @@ struct KVMPMUFilter {
     KvmPmuFilterEventList *events;
 };
 
+/*
+ * Stolen from Linux kernel (RAW_EVENT at tools/testing/selftests/kvm/include/
+ * x86_64/pmu.h).
+ *
+ * Encode an eventsel+umask pair into event-select MSR format.  Note, this is
+ * technically AMD's format, as Intel's format only supports 8 bits for the
+ * event selector, i.e. doesn't use bits 24:16 for the selector.  But, OR-ing
+ * in '0' is a nop and won't clobber the CMASK.
+ */
+#define X86_PMU_RAW_EVENT(eventsel, umask) (((eventsel & 0xf00UL) << 24) | \
+                                            ((eventsel) & 0xff) | \
+                                            ((umask) & 0xff) << 8)
+
 #endif /* KVM_PMU_H */
diff --git a/qapi/kvm.json b/qapi/kvm.json
index 1861d86a9726..cb151ca82e5c 100644
--- a/qapi/kvm.json
+++ b/qapi/kvm.json
@@ -36,10 +36,12 @@
 #
 # @raw: the encoded event code that KVM can directly consume.
 #
+# @x86-select-umask: standard x86 encoding format with select and umask.
+#
 # Since 10.1
 ##
 { 'enum': 'KvmPmuEventFormat',
-  'data': ['raw'] }
+  'data': ['raw', 'x86-select-umask'] }
 
 ##
 # @KvmPmuRawEvent:
@@ -54,6 +56,20 @@
 { 'struct': 'KvmPmuRawEvent',
   'data': { 'code': 'uint64' } }
 
+##
+# @KvmPmuX86SelectUmaskEvent:
+#
+# @select: x86 PMU event select field, which is a 12-bit unsigned
+#     number.
+#
+# @umask: x86 PMU event umask field.
+#
+# Since 10.1
+##
+{ 'struct': 'KvmPmuX86SelectUmaskEvent',
+  'data': { 'select': 'uint16',
+            'umask': 'uint8' } }
+
 ##
 # @KvmPmuFilterEvent:
 #
@@ -66,7 +82,8 @@
 { 'union': 'KvmPmuFilterEvent',
   'base': { 'format': 'KvmPmuEventFormat' },
   'discriminator': 'format',
-  'data': { 'raw': 'KvmPmuRawEvent' } }
+  'data': { 'raw': 'KvmPmuRawEvent',
+            'x86-select-umask': 'KvmPmuX86SelectUmaskEvent' } }
 
 ##
 # @KvmPmuFilterProperties:
diff --git a/qemu-options.hx b/qemu-options.hx
index 51a7c61ce0b0..5dcce067d8dd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -6180,6 +6180,9 @@ SRST
              ((select) & 0xff) | \
              ((umask) & 0xff) << 8)
 
+        ``{"format":"x86-select-umask","select":event_select,"umask":event_umask}``
+            Specify the single x86 PMU event with select and umask fields.
+
         An example KVM PMU filter object would look like:
 
         .. parsed-literal::
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index fa3a696654cb..0d36ccf250ed 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5974,6 +5974,10 @@ static bool kvm_config_pmu_event(KVMPMUFilter *filter,
         case KVM_PMU_EVENT_FORMAT_RAW:
             code = event->u.raw.code;
             break;
+        case KVM_PMU_EVENT_FORMAT_X86_SELECT_UMASK:
+            code = X86_PMU_RAW_EVENT(event->u.x86_select_umask.select,
+                                     event->u.x86_select_umask.umask);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -6644,6 +6648,7 @@ static void kvm_arch_check_pmu_filter(const Object *obj, const char *name,
 
         switch (event->format) {
         case KVM_PMU_EVENT_FORMAT_RAW:
+        case KVM_PMU_EVENT_FORMAT_X86_SELECT_UMASK:
             break;
         default:
             error_setg(errp,
-- 
2.34.1

