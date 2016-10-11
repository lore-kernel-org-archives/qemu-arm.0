Received: by 10.80.166.35 with SMTP id d32csp102275edc;
        Tue, 11 Oct 2016 10:08:43 -0700 (PDT)
X-Received: by 10.55.17.234 with SMTP id 103mr4033539qkr.294.1476205723169;
        Tue, 11 Oct 2016 10:08:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1si1896888qte.78.2016.10.11.10.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 10:08:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu0Xi-0001Es-HF
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 13:08:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bu0XZ-0001C0-QF
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bu0XY-00044L-Qy
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:08:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bu0XY-00043i-Kl; Tue, 11 Oct 2016 13:08:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bu0XN-00016C-4W; Tue, 11 Oct 2016 18:08:21 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Oct 2016 18:08:13 +0100
Message-Id: <1476205699-28857-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v3 1/7] migration: Remove static allocation of
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
Cc: patches@linaro.org, Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, paolo@archaic.org.uk,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1f4hZ0uGM6lo

From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>

Allocate xzblre zero page cache buffer dynamically.
Remove dependency on TARGET_PAGE_SIZE to make run-time
page size detection for arm platforms.

Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
Message-id: 1465808915-4887-2-git-send-email-vijayak@caviumnetworks.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 migration/ram.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index c8ec9f2..b5bde00 100644
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
2.7.4

