Received: by 10.25.221.202 with SMTP id w71csp2956623lfi;
        Mon, 7 Aug 2017 07:39:47 -0700 (PDT)
X-Received: by 10.237.37.107 with SMTP id w40mr1087008qtc.14.1502116787218;
        Mon, 07 Aug 2017 07:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502116787; cv=none;
        d=google.com; s=arc-20160816;
        b=zf54SvZ5DbwSeK0QQVTFmilO/lck9K7rsrB9IaNcAy4hExq9k2v1QhIACQ4d6HR1UR
         CE3Sul1QOxj4o6sNtHv696KYLPPGK9cO4Mboh5capXPhHoIeJjQ89v17/p3UjL/oQX/e
         IQBX21gOX1IZRszZ1eSKdr9BZKcpf84CD3RltqYR1TVV4TTnigms9qiL1w/sPK+yAj9n
         jtN9M4h//VU6Z37gSUMEwjKjmyIVDuGXUw0xjHcvkWTkIn5m6tgL2YmIWA9qSuZf3brC
         UCFpR3AR0lnk34uo7RQ8U9A8YIkO08HhVRhdqSZou2X50BPgMkThYy4bt56FnV4wI3aZ
         Shtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=X5bR0P81MlCdJtx7LYUUim6S1ZMxtu5DcqLjqeaE//Y=;
        b=wqXhG1PpK009JUaGY0Y9F4Pv5ggl6jyGmscPtqCWcDFODcGykeoDveqmJBE/Ub0oRo
         RCuS5AY1O18UGCvQQjdTOWMqPYcgayFvTgB1clBnXv+6vfdY2wt0oGGWP3ftoChsw3tX
         CFX+Tvj6LnDEwjPgGxFPwCHy6aUHYN6uLDck4rMLFjbUKCGxypQaiF5qLxcfNEnXaP7f
         1ZDEjFVlDNbwdvHRKvVUBDapqvdSDhz/fZzN7Mwv987AYsrwl9tJHqhAiufA/G+MPhvF
         UrlgIsPiJIoR7+hE2tWgV4UqH3BGOoVPmF8gDosFJgABH08SP5tSe5k3w3KJ5SEvQb8V
         z3YA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j94si7703234qtd.433.2017.08.07.07.39.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Aug 2017 07:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dejC4-0002ov-G7
	for alex.bennee@linaro.org; Mon, 07 Aug 2017 10:39:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dejBu-0002ha-A0
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 10:39:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dejBp-0006SF-CQ
	for qemu-arm@nongnu.org; Mon, 07 Aug 2017 10:39:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dejBp-0006M3-4x; Mon, 07 Aug 2017 10:39:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dejBc-0004PB-T6; Mon, 07 Aug 2017 15:39:16 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  7 Aug 2017 15:39:14 +0100
Message-Id: <1502116754-18867-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502116754-18867-1-git-send-email-peter.maydell@linaro.org>
References: <1502116754-18867-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/2] loader: Ignore zero-sized ELF segments
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
Cc: Hua Yanghao <huayanghao@gmail.com>, Richard Henderson <rth@twiddle.net>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fJfgI8Fby33g

Some ELF files have program headers that specify segments that
are of zero size. Ignore them, rather than trying to create
zero-length ROM blobs for them, because the zero-length blob
can falsely trigger the overlapping-ROM-blobs check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/elf_ops.h | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 2e526d3..d192e7e 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -451,14 +451,24 @@ static int glue(load_elf, SZ)(const char *name, int fd,
                 *pentry = ehdr.e_entry - ph->p_vaddr + ph->p_paddr;
             }
 
-            if (load_rom) {
-                snprintf(label, sizeof(label), "phdr #%d: %s", i, name);
-
-                /* rom_add_elf_program() seize the ownership of 'data' */
-                rom_add_elf_program(label, data, file_size, mem_size, addr, as);
-            } else {
-                cpu_physical_memory_write(addr, data, file_size);
+            if (mem_size == 0) {
+                /* Some ELF files really do have segments of zero size;
+                 * just ignore them rather than trying to create empty
+                 * ROM blobs, because the zero-length blob can falsely
+                 * trigger the overlapping-ROM-blobs check.
+                 */
                 g_free(data);
+            } else {
+                if (load_rom) {
+                    snprintf(label, sizeof(label), "phdr #%d: %s", i, name);
+
+                    /* rom_add_elf_program() seize the ownership of 'data' */
+                    rom_add_elf_program(label, data, file_size, mem_size,
+                                        addr, as);
+                } else {
+                    cpu_physical_memory_write(addr, data, file_size);
+                    g_free(data);
+                }
             }
 
             total_size += mem_size;
-- 
2.7.4

