Received: by 10.182.158.201 with SMTP id ww9csp2003986obb;
        Thu, 19 Nov 2015 06:56:09 -0800 (PST)
X-Received: by 10.31.163.85 with SMTP id m82mr5270402vke.158.1447944969207;
        Thu, 19 Nov 2015 06:56:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 80si4357369vkc.100.2015.11.19.06.56.09
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 19 Nov 2015 06:56:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzQd6-0003eU-QC
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 09:56:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ZzQb5-0008KN-45
	for qemu-arm@nongnu.org; Thu, 19 Nov 2015 09:54:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ZzQb4-00017x-2H
	for qemu-arm@nongnu.org; Thu, 19 Nov 2015 09:54:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1ZzQb3-00017l-T3; Thu, 19 Nov 2015 09:54:01 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 79CE765665;
	Thu, 19 Nov 2015 14:54:01 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-116-106.ams2.redhat.com
	[10.36.116.106])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAJEreNM000808; Thu, 19 Nov 2015 09:53:57 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 19 Nov 2015 09:53:36 -0500
Message-Id: <1447944817-13286-5-git-send-email-drjones@redhat.com>
In-Reply-To: <1447944817-13286-1-git-send-email-drjones@redhat.com>
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH 4/5] dump: allow target to set the physical base
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZHMj0hJPFbJq

crash assumes the physical base in the kdump subheader of
makedumpfile formatted dumps is correct. Zero is not correct
for all architectures, so allow it to be changed.

(No functional change.)

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 dump.c                     | 4 ++--
 include/sysemu/dump-arch.h | 1 +
 include/sysemu/dump.h      | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/dump.c b/dump.c
index e1d9bae9e89d1..2d4892bec2672 100644
--- a/dump.c
+++ b/dump.c
@@ -775,7 +775,7 @@ static void create_header32(DumpState *s, Error **errp)
 
     /* 64bit max_mapnr_64 */
     kh->max_mapnr_64 = cpu_to_dump64(s, s->max_mapnr);
-    kh->phys_base = cpu_to_dump32(s, PHYS_BASE);
+    kh->phys_base = cpu_to_dump32(s, s->dump_info.phys_base);
     kh->dump_level = cpu_to_dump32(s, DUMP_LEVEL);
 
     offset_note = DISKDUMP_HEADER_BLOCKS * block_size + size;
@@ -875,7 +875,7 @@ static void create_header64(DumpState *s, Error **errp)
 
     /* 64bit max_mapnr_64 */
     kh->max_mapnr_64 = cpu_to_dump64(s, s->max_mapnr);
-    kh->phys_base = cpu_to_dump64(s, PHYS_BASE);
+    kh->phys_base = cpu_to_dump64(s, s->dump_info.phys_base);
     kh->dump_level = cpu_to_dump32(s, DUMP_LEVEL);
 
     offset_note = DISKDUMP_HEADER_BLOCKS * block_size + size;
diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h
index 43358396ea81a..e25b02e99013c 100644
--- a/include/sysemu/dump-arch.h
+++ b/include/sysemu/dump-arch.h
@@ -20,6 +20,7 @@ typedef struct ArchDumpInfo {
     int d_class;             /* ELFCLASS32 or ELFCLASS64 */
     uint32_t page_size;      /* The target's page size. If it's variable and
                               * unknown, then this should be the maximum. */
+    uint64_t phys_base;      /* The target's physmem base. */
 } ArchDumpInfo;
 
 struct GuestPhysBlockList; /* memory_mapping.h */
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 16cbd8d881fd6..2f04b247bed1b 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -33,7 +33,6 @@
 
 #define KDUMP_SIGNATURE             "KDUMP   "
 #define SIG_LEN                     (sizeof(KDUMP_SIGNATURE) - 1)
-#define PHYS_BASE                   (0)
 #define DUMP_LEVEL                  (1)
 #define DISKDUMP_HEADER_BLOCKS      (1)
 
-- 
2.4.3

