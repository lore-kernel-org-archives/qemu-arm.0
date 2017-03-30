Received: by 10.25.15.230 with SMTP id 99csp2721194lfp;
        Thu, 30 Mar 2017 12:42:46 -0700 (PDT)
X-Received: by 10.200.4.5 with SMTP id v5mr1534100qtg.54.1490902966733;
        Thu, 30 Mar 2017 12:42:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k66si2652998qkb.260.2017.03.30.12.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Mar 2017 12:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctfy2-0003F1-8O
	for alex.bennee@linaro.org; Thu, 30 Mar 2017 15:42:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ctfxq-00039J-JC
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 15:42:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ctfxp-00077S-MI
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 15:42:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45894)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ctfxp-000770-GG; Thu, 30 Mar 2017 15:42:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C489C05AA6F;
	Thu, 30 Mar 2017 19:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5C489C05AA6F
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5C489C05AA6F
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3222B77D53;
	Thu, 30 Mar 2017 19:42:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	edgar.iglesias@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	prem.mallappa@gmail.com
Date: Thu, 30 Mar 2017 21:42:14 +0200
Message-Id: <1490902938-9009-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1490902938-9009-1-git-send-email-eric.auger@redhat.com>
References: <1490902938-9009-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 30 Mar 2017 19:42:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 1/5] log: Add new IOMMU type
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, Radha.Chintakuntla@cavium.com,
	christoffer.dall@linaro.org, Sunil.Goutham@cavium.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ZOnDh4E7gki

From: Prem Mallappa <prem.mallappa@broadcom.com>

Add CPU_LOG_IOMMU to log traces related to the IOMMU.

Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

This may be replaced by dynamic traces later on
---
 include/qemu/log.h | 1 +
 util/log.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index a50e994..906913b 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -43,6 +43,7 @@ static inline bool qemu_log_separate(void)
 #define CPU_LOG_PAGE       (1 << 14)
 #define LOG_TRACE          (1 << 15)
 #define CPU_LOG_TB_OP_IND  (1 << 16)
+#define CPU_LOG_IOMMU      (1 << 17)
 
 /* Returns true if a bit is set in the current loglevel mask
  */
diff --git a/util/log.c b/util/log.c
index 96f30dd..76968d6 100644
--- a/util/log.c
+++ b/util/log.c
@@ -258,6 +258,8 @@ const QEMULogItem qemu_log_items[] = {
       "show CPU registers before entering a TB (lots of logs)" },
     { CPU_LOG_MMU, "mmu",
       "log MMU-related activities" },
+    { CPU_LOG_IOMMU, "iommu",
+      "log IOMMU-related activities" },
     { CPU_LOG_PCALL, "pcall",
       "x86 only: show protected mode far calls/returns/exceptions" },
     { CPU_LOG_RESET, "cpu_reset",
-- 
2.5.5

