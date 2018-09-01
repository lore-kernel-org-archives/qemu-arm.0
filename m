Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp538647wrd;
        Sat, 1 Sep 2018 05:47:39 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbZqwYk4NHLgqESFE9O72HI4rDgs9sX5jvO9Z5R9xfanpWiy1PMUEfJqKVkMUhj0XaKt6Nd
X-Received: by 2002:ac8:1846:: with SMTP id n6-v6mr20339346qtk.85.1535806059404;
        Sat, 01 Sep 2018 05:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806059; cv=none;
        d=google.com; s=arc-20160816;
        b=vC87ycbhl4xmpgWx8Ms2lJx3tImP4etCkLpFlG5H1+G+h0iLP1AJ5evxZi3qx41jt1
         hP/QCFhFwIDCoWO98+hgEo4n6outTUKpiHpBS9i9rjt1WfZuXpLLF0d1TUsekEorl4PN
         DJ0PkSNBy2YyM/bm6DV6cj4tKNvw6tTm91NVbJX6/hL8GC8JCTxrf9EuWONz0GDHWZbY
         qjUmxQyT2JN4H7Jk/i35LZDgEZAt7DuQbOpPffDCq75D1G6iGqktxqdQCO2B0VoSq8AJ
         TwOzdh5reNTnm/3+dt5a8OFAy/fUET029tHCQSMyy5pIovYDXayqbigw6/wB+GNBVFIA
         gIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=6o1X2+vkkaKxavUrrtk1/LV3pg95uGxeOSjnr/AOv7s=;
        b=Zjfoc9ZfDuTabfh73yh1azAbWCm6zDO/gycPBR4zgXYYQfCdvKjb9FsAoAw9yi0Wte
         pc8vpRx9F2BJ8z82YzrACXmTQy4GKb9kQCY+9DcfQKKhExOu1jkrxuEh2wlxEBse7cKt
         2we72W9t2YFV6pOEIWqV4u47XinPGFzDIoXlpuhHFRHcuYhPu3mzgP1fLGiZcqnJ9jZ2
         Fqazg8LeyRBgUCZcgzqmsJnVznzuULUT0P23o4UZ/gATNIVEnNR/aXneTbG2jq3eTuBO
         VZCbPZ+hLWTdBG/yXXqysPEqeLpgxvcmc9+tpr32stODNeOEfAGjAxmBTJQfnFIZieQu
         kJQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=fxecv5Lt;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yhecBxlm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yhecBxlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66-v6si273295qke.207.2018.09.01.05.47.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:47:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=fxecv5Lt;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yhecBxlm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yhecBxlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5JS-00051x-Sp
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:47:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004g4-Es
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J6-0007k6-7h
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J5-0007hU-Lu; Sat, 01 Sep 2018 08:47:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E9F2D521AAD;
	Sat,  1 Sep 2018 14:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806026;
	bh=TMmbprC/XeV+12usXTjnmKvjOgFUUNWeCg1c+GGHkvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fxecv5Lt8OufdrgnRnB1Y4kZgTU1+fWJXLmDXJ4LIKzomwoZ6pOy7rOQErKoQqVhX
	eO/VYkY8BQWEEPXzzMAm/E4PMCSJxTvffPm4F69QiPHMuoMB4JLx8yJLJ4k3IYjv4D
	zeH9JqqDpclevMgNuc0XtNnSMxuTlsxX38g6jpzg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=yhecBxlm;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=yhecBxlm
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BbR0I4vZEEcs; Sat,  1 Sep 2018 14:47:06 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E1E94521AAA; Sat,  1 Sep 2018 14:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806025;
	bh=TMmbprC/XeV+12usXTjnmKvjOgFUUNWeCg1c+GGHkvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yhecBxlmvid1/8vOBqyWTQW4fB6A8Aka0JwAIm5J2luKMc8Uz5UZwP1WBdmqrXJhI
	lhhLTaa2sqgMNAM472yQNaTrgXjLPOVDGTrbKynnor06XWoOGvW1eghzJVL9jSvzEt
	7hEU4AXcYLvcwWMsI/bFl5/dDWnDgBTJaal3yLSE=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6F6AB521AB5;
	Sat,  1 Sep 2018 14:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806025;
	bh=TMmbprC/XeV+12usXTjnmKvjOgFUUNWeCg1c+GGHkvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yhecBxlmvid1/8vOBqyWTQW4fB6A8Aka0JwAIm5J2luKMc8Uz5UZwP1WBdmqrXJhI
	lhhLTaa2sqgMNAM472yQNaTrgXjLPOVDGTrbKynnor06XWoOGvW1eghzJVL9jSvzEt
	7hEU4AXcYLvcwWMsI/bFl5/dDWnDgBTJaal3yLSE=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:28 +0200
Message-Id: <20180901124639.19735-5-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 04/15] gdbstub: add multiprocess support to vCont
 packets
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NEGDPVppC0qy

Add the gdb_first_cpu() and gdb_next_cpu() to iterate over all
the CPUs in currently attached processes.

Add the gdb_first_cpu_in_process() and gdb_next_cpu_in_process() to
iterate over CPUs of a given process.

Use them to add multiprocess extension support to vCont packets.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 15 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 33fa1b9c5f..2cb9cb6d97 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -704,10 +704,40 @@ static CPUState *find_cpu(uint32_t thread_id)
     }
 
     return NULL;
 }
 
+static CPUState *get_first_cpu_in_process(const GDBState *s,
+                                          GDBProcess *process)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        if (gdb_get_cpu_pid(s, cpu) == process->pid) {
+            return cpu;
+        }
+    }
+
+    return NULL;
+}
+
+static CPUState *gdb_next_cpu_in_process(const GDBState *s, CPUState *cpu)
+{
+    uint32_t pid = gdb_get_cpu_pid(s, cpu);
+    cpu = CPU_NEXT(cpu);
+
+    while (cpu) {
+        if (gdb_get_cpu_pid(s, cpu) == pid) {
+            break;
+        }
+
+        cpu = CPU_NEXT(cpu);
+    }
+
+    return cpu;
+}
+
 static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
 {
     GDBProcess *process;
     CPUState *cpu = find_cpu(tid);
 
@@ -731,10 +761,41 @@ static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
     }
 
     return cpu;
 }
 
+/* Return the cpu following @cpu, while ignoring
+ * unattached processes.
+ */
+static CPUState *gdb_next_cpu(const GDBState *s, CPUState *cpu)
+{
+    cpu = CPU_NEXT(cpu);
+
+    while (cpu) {
+        if (gdb_get_cpu_process(s, cpu)->attached) {
+            break;
+        }
+
+        cpu = CPU_NEXT(cpu);
+    }
+
+    return cpu;
+}
+
+/* Return the first attached cpu */
+static CPUState *gdb_first_cpu(const GDBState *s)
+{
+    CPUState *cpu = first_cpu;
+    GDBProcess *process = gdb_get_cpu_process(s, cpu);
+
+    if (!process->attached) {
+        return gdb_next_cpu(s, cpu);
+    }
+
+    return cpu;
+}
+
 static const char *get_feature_xml(const char *p, const char **newp,
                                    CPUClass *cc)
 {
     size_t len;
     int i;
@@ -1070,14 +1131,16 @@ static int is_query_packet(const char *p, const char *query, char separator)
  * returns -ENOTSUP if a command is unsupported, -EINVAL or -ERANGE if there is
  *         a format error, 0 on success.
  */
 static int gdb_handle_vcont(GDBState *s, const char *p)
 {
-    int res, idx, signal = 0;
+    int res, signal = 0;
     char cur_action;
     char *newstates;
     unsigned long tmp;
+    uint32_t pid, tid;
+    GDBProcess *process;
     CPUState *cpu;
 #ifdef CONFIG_USER_ONLY
     int max_cpus = 1; /* global variable max_cpus exists only in system mode */
 
     CPU_FOREACH(cpu) {
@@ -1116,29 +1179,52 @@ static int gdb_handle_vcont(GDBState *s, const char *p)
         } else if (cur_action != 'c' && cur_action != 's') {
             /* unknown/invalid/unsupported command */
             res = -ENOTSUP;
             goto out;
         }
-        /* thread specification. special values: (none), -1 = all; 0 = any */
-        if ((p[0] == ':' && p[1] == '-' && p[2] == '1') || (p[0] != ':')) {
-            if (*p == ':') {
-                p += 3;
-            }
-            for (idx = 0; idx < max_cpus; idx++) {
-                if (newstates[idx] == 1) {
-                    newstates[idx] = cur_action;
+
+        if (*p++ != ':') {
+            res = -ENOTSUP;
+            goto out;
+        }
+
+        switch (read_thread_id(p, &p, &pid, &tid)) {
+        case GDB_READ_THREAD_ERR:
+            res = -EINVAL;
+            goto out;
+
+        case GDB_ALL_PROCESSES:
+            cpu = gdb_first_cpu(s);
+            while (cpu) {
+                if (newstates[cpu->cpu_index] == 1) {
+                    newstates[cpu->cpu_index] = cur_action;
                 }
+
+                cpu = gdb_next_cpu(s, cpu);
             }
-        } else if (*p == ':') {
-            p++;
-            res = qemu_strtoul(p, &p, 16, &tmp);
-            if (res) {
+            break;
+
+        case GDB_ALL_THREADS:
+            process = gdb_get_process(s, pid);
+
+            if (!process->attached) {
+                res = -EINVAL;
                 goto out;
             }
 
-            /* 0 means any thread, so we pick the first valid CPU */
-            cpu = tmp ? find_cpu(tmp) : first_cpu;
+            cpu = get_first_cpu_in_process(s, process);
+            while (cpu) {
+                if (newstates[cpu->cpu_index] == 1) {
+                    newstates[cpu->cpu_index] = cur_action;
+                }
+
+                cpu = gdb_next_cpu_in_process(s, cpu);
+            }
+            break;
+
+        case GDB_ONE_THREAD:
+            cpu = gdb_get_cpu(s, pid, tid);
 
             /* invalid CPU/thread specified */
             if (!cpu) {
                 res = -EINVAL;
                 goto out;
@@ -1146,10 +1232,11 @@ static int gdb_handle_vcont(GDBState *s, const char *p)
 
             /* only use if no previous match occourred */
             if (newstates[cpu->cpu_index] == 1) {
                 newstates[cpu->cpu_index] = cur_action;
             }
+            break;
         }
     }
     s->signal = signal;
     gdb_continue_partial(s, newstates);
 
-- 
2.18.0

