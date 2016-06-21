Received: by 10.25.21.96 with SMTP id l93csp2054010lfi;
        Tue, 21 Jun 2016 10:11:11 -0700 (PDT)
X-Received: by 10.200.42.200 with SMTP id c8mr14463218qta.8.1466529071526;
        Tue, 21 Jun 2016 10:11:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e189si638749qkc.145.2016.06.21.10.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 10:11:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFPCg-0005Gt-QY
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 13:11:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBJ-00046f-W6
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBH-00045B-SM
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:44 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBH-00044f-KN; Tue, 21 Jun 2016 13:09:43 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPB9-00024X-Pu; Tue, 21 Jun 2016 18:09:35 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Jun 2016 18:09:29 +0100
Message-Id: <1466528974-12183-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 1/6] migration: Remove static allocation of
 xzblre cache buffer
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /S/pkbTgI//n

From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>

Allocate xzblre zero page cache buffer dynamically.
Remove dependency on TARGET_PAGE_SIZE to make run-time
page size detection for arm platforms.

Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
Message-id: 1465808915-4887-2-git-send-email-vijayak@caviumnetworks.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 migration/ram.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 815bc0e..b665741 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -69,7 +69,7 @@ static uint64_t bitmap_sync_count;
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
 
-static const uint8_t ZERO_TARGET_PAGE[TARGET_PAGE_SIZE];
+static uint8_t *ZERO_TARGET_PAGE;
 
 static inline bool is_zero_range(uint8_t *p, uint64_t size)
 {
@@ -1429,6 +1429,7 @@ static void ram_migration_cleanup(void *opaque)
         cache_fini(XBZRLE.cache);
         g_free(XBZRLE.encoded_buf);
         g_free(XBZRLE.current_buf);
+        g_free(ZERO_TARGET_PAGE);
         XBZRLE.cache = NULL;
         XBZRLE.encoded_buf = NULL;
         XBZRLE.current_buf = NULL;
@@ -1887,6 +1888,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
 
     if (migrate_use_xbzrle()) {
         XBZRLE_cache_lock();
+        ZERO_TARGET_PAGE = g_malloc0(TARGET_PAGE_SIZE);
         XBZRLE.cache = cache_init(migrate_xbzrle_cache_size() /
                                   TARGET_PAGE_SIZE,
                                   TARGET_PAGE_SIZE);
-- 
1.9.1

