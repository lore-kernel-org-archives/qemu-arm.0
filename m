Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp695491wrt;
        Thu, 22 Nov 2018 05:35:33 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X8a4jhOCyEDerRBqhPHNKf4M3feJJeb4Zc7iizrxTbQuW6tLmnmOnGuY9VAnvZHIlpBBGu
X-Received: by 2002:a81:e342:: with SMTP id w2mr1786930ywl.500.1542893733045;
        Thu, 22 Nov 2018 05:35:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542893733; cv=none;
        d=google.com; s=arc-20160816;
        b=tBmlZ/PE48+h3xG+IGUtYdsImos9cyaz1Beyta9WEicXof+d17BuuItNN2PwnK4sC9
         TtTHWESswKTBuf93HoeRSLa6AzzynQahGhImFdstUxiBTWqlNpA4qsHdshPfNnKTq7EF
         QBY6mNAFSrL7YowmN2K/85y8CxftBLtDsioo/llz87RZlXYc7P7sdPpfZ8wqZTKnURWQ
         Kk8XE21DOg4z3bBTSqsLvHM7BBqCJI8G4EuWfeSQ9gZVDuaLRw9bbCWktcSbzaOQ6K+3
         XvqRfbrkXFlwbPy2K0tHrH23f+DBR6x006vF0bApt9rEZY1ZC+sMx/kEGQuVbbhgbYkJ
         RLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=h7n0Cn+A2HvOZIXasth/mGAYtcrXaXWrYsXtxcBubLQ=;
        b=sUzz7G3Vb0wHu8dLpIJLDO8Sp8FMeLOq0gekEFAv4cLVgRYXg8AmscrgzqEHAJ4NDZ
         ubWY+Mimzu+iT4nY/9HVxA5aH+x+1UqJYpgYsWb+W0/9QXgPqJRnO1x05mOTGxqDQkd5
         OAifZ2tyFB5Cy/sIL6P72kpeYZfVwplJnL0QyywNpHUK3ktZHQiqUGAywwpwyLVDRJw9
         TAarHJP98Z2SWp6gbFWd11QsCnNcNrkwtDq/jbiZ5rL78DPXc4Esd5TMjntU2no9NX1q
         XfgJq2pqUVEi1vrUm2PZgw3LZKcsupdyXpB9uxGJfFPsOOXpmaukO6Vrn2GrXHAGsOI/
         Q65w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13si15349919ywg.150.2018.11.22.05.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 05:35:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPp8m-0007v4-34
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 08:35:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gPp8Y-0007sp-I2
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 08:35:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gPp8W-0001fX-Lz
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 08:35:18 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gPp8W-0001bx-An; Thu, 22 Nov 2018 08:35:16 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gPp8Q-0005AS-US; Thu, 22 Nov 2018 13:35:10 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 22 Nov 2018 13:35:06 +0000
Message-Id: <20181122133507.30950-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181122133507.30950-1-peter.maydell@linaro.org>
References: <20181122133507.30950-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-4.0 1/2] exec.c: Rename
 cpu_physical_memory_write_rom_internal()
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LyTGwION471I

Rename cpu_physical_memory_write_rom_internal() to
address_space_write_rom_internal(), and make it take
MemTxAttrs and return a MemTxResult. This brings its
API into line with address_space_write().

This is an internal function to exec.c; fixing its API
will allow us to change the global function
cpu_physical_memory_write_rom().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/exec.c b/exec.c
index bb6170dbffe..92679508ba3 100644
--- a/exec.c
+++ b/exec.c
@@ -3388,8 +3388,12 @@ enum write_rom_type {
     FLUSH_CACHE,
 };
 
-static inline void cpu_physical_memory_write_rom_internal(AddressSpace *as,
-    hwaddr addr, const uint8_t *buf, int len, enum write_rom_type type)
+static inline MemTxResult address_space_write_rom_internal(AddressSpace *as,
+                                                           hwaddr addr,
+                                                           MemTxAttrs attrs,
+                                                           const uint8_t *buf,
+                                                           int len,
+                                                           enum write_rom_type type)
 {
     hwaddr l;
     uint8_t *ptr;
@@ -3399,8 +3403,7 @@ static inline void cpu_physical_memory_write_rom_internal(AddressSpace *as,
     rcu_read_lock();
     while (len > 0) {
         l = len;
-        mr = address_space_translate(as, addr, &addr1, &l, true,
-                                     MEMTXATTRS_UNSPECIFIED);
+        mr = address_space_translate(as, addr, &addr1, &l, true, attrs);
 
         if (!(memory_region_is_ram(mr) ||
               memory_region_is_romd(mr))) {
@@ -3423,13 +3426,15 @@ static inline void cpu_physical_memory_write_rom_internal(AddressSpace *as,
         addr += l;
     }
     rcu_read_unlock();
+    return MEMTX_OK;
 }
 
 /* used for ROM loading : can write in RAM and ROM */
 void cpu_physical_memory_write_rom(AddressSpace *as, hwaddr addr,
                                    const uint8_t *buf, int len)
 {
-    cpu_physical_memory_write_rom_internal(as, addr, buf, len, WRITE_DATA);
+    address_space_write_rom_internal(as, addr, MEMTXATTRS_UNSPECIFIED,
+                                     buf, len, WRITE_DATA);
 }
 
 void cpu_flush_icache_range(hwaddr start, int len)
@@ -3444,8 +3449,9 @@ void cpu_flush_icache_range(hwaddr start, int len)
         return;
     }
 
-    cpu_physical_memory_write_rom_internal(&address_space_memory,
-                                           start, NULL, len, FLUSH_CACHE);
+    address_space_write_rom_internal(&address_space_memory,
+                                     start, MEMTXATTRS_UNSPECIFIED,
+                                     NULL, len, FLUSH_CACHE);
 }
 
 typedef struct {
-- 
2.19.1

