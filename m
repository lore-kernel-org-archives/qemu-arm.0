Received: by 10.25.21.156 with SMTP id 28csp1960580lfv;
        Tue, 19 Jul 2016 22:03:55 -0700 (PDT)
X-Received: by 10.66.94.71 with SMTP id da7mr71423324pab.31.1468991025185;
        Tue, 19 Jul 2016 22:03:45 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id r71si1236963pfa.279.2016.07.19.22.03.44;
        Tue, 19 Jul 2016 22:03:45 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751579AbcGTFDl (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:41 -0400
Received: from mail-pa0-f65.google.com ([209.85.220.65]:32855 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346AbcGTFD1 (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:27 -0400
Received: by mail-pa0-f65.google.com with SMTP id q2so2577450pap.0
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:26 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KFES7X5TcEsOOde34zItxoSDMGKim4CyjLBZAyJvIKk=;
        b=PjwscXINGfEnHFciYXvEp4O4CvD2NhyLsfSwIDefum/uHWQNSr6RI9H6p0xvlDqhxA
         GaQBMvjhxI+KMJToJGqYV+qvXmYjmDVkcWF+WUOp4ofTKowrWaYuG3rUmdQXCcOt5tKK
         7yGVJB9g27v4Og0VgcgYVUb9lO1nSVboKr85B3pyjCaB6d4CNXLwl9QV/UOF78i8zPSR
         N9lsqhM1D7RZvD88azd48Jb0MTuFAtjVSHUyD9+30MpJ1ze4YSK235gkM3OVAZUVnyHh
         HNO4GfssPo+yg7zKjBpncmjRfLOmfkNTLELCVcwQLSbXM6JJq+JQDoWiPG5I7r42VN43
         +4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KFES7X5TcEsOOde34zItxoSDMGKim4CyjLBZAyJvIKk=;
        b=XSZtKCw5vYM9De0OCGE+HrnR2DVPRtxdxaxUKx1/F/jrsUsNEeBlIY4BRoMSeRMBfF
         ZT4koz7mxseYdn7W/k2Sd5+12X9/OMPa+4TRXfwZXo193FI6tF0R7FalAcjl39z+rFhn
         oheN79J+J6thOfLrjKXNGmFG55LN9z3NmDzXqdixY/rCIIkgfnLA+y0n7D0PLWnUqVcG
         X/TWaQg49xBtOVjcSYKamLwkAaGAqzMMOWSCoSZ1yJpVg/WY3OczR1YcZse/ryzYyVgi
         F+zWzus5M94dNoMgsyAeDUZDkvsd3TwO3+UtghP/JFrfX/l8YVPpjZhs5BU1FTjeacuF
         69xg==
X-Gm-Message-State: ALyK8tIChHXLyvPIakrZ8t2+4UTj5yCXrRFTbM6nSlnHgbrP9dtiFqAhuQPH0xOUf+UbvA==
X-Received: by 10.66.26.105 with SMTP id k9mr72974778pag.103.1468991006266;
        Tue, 19 Jul 2016 22:03:26 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:25 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 09/10] gdbstub: Convert target_memory_rw_debug to use MemoryAccessType
Date:	Tue, 19 Jul 2016 22:02:59 -0700
Message-Id: <1468990980-4598-10-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: UZR3aog1WHNw

Convert target_memory_rw_debug to use MemoryAccessType as to follow
similar conversion of cpu_memory_rw_debug.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 gdbstub.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 9c4cbe4..c215672 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -44,15 +44,17 @@
 #endif
 
 static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                                         uint8_t *buf, int len, bool is_write)
+                                         uint8_t *buf, int len,
+                                         MemoryAccessType access_type)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (cc->memory_rw_debug) {
+        const bool is_write = (access_type == MEM_DATA_STORE);
         return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
     }
-    return cpu_memory_rw_debug(cpu, addr, buf, len,
-                               is_write ? MEM_DATA_STORE : MEM_DATA_LOAD);
+
+    return cpu_memory_rw_debug(cpu, addr, buf, len, access_type);
 }
 
 enum {
@@ -966,7 +968,8 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
             break;
         }
 
-        if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len, false) != 0) {
+        if (target_memory_rw_debug(s->g_cpu, addr, mem_buf,
+                                   len, MEM_DATA_LOAD) != 0) {
             put_packet (s, "E14");
         } else {
             memtohex(buf, mem_buf, len);
@@ -988,7 +991,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
         hextomem(mem_buf, p, len);
         if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len,
-                                   true) != 0) {
+                                   MEM_DATA_STORE) != 0) {
             put_packet(s, "E14");
         } else {
             put_packet(s, "OK");
-- 
2.5.5

