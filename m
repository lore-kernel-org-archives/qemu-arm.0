Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp542855wrd;
        Sat, 1 Sep 2018 05:53:56 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZuTv7RRAdWgVbeNqU06ChRL/EefwaZ2pXTdJAYJQNuyZ2365q1lwNtiqD2PvYIELSGQzNP
X-Received: by 2002:a37:66d3:: with SMTP id a202-v6mr17980177qkc.20.1535806436286;
        Sat, 01 Sep 2018 05:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806436; cv=none;
        d=google.com; s=arc-20160816;
        b=aozsdHkTit455MrbAAYZi/84i4nPNK/jKJ7QRiPGewOfN0dnXWez9Ax+I1b2wx6t7r
         69TEGc3dJq4TP/8SW/JKJY/00WBXwnB3F5rODz38z9s8EkIX3sS0raoemrMEEug5YnXc
         v3GIBoq4C5P0Ll36rmRFKFWGHioFka8yiG0mr9w3OrqF6f65jPV2JTfZykX08uXlpXea
         BbfySRh+S/HStDjldcc4z2HaiYmRVFZ6H7svOTO45qyCxQqaic7g2rZN2SbEtmt8IS0n
         5dMiO9YWObm7ll0YyJaqwrp0C6f9V3rFvkCmlSOY0NcZlAT9xPrkPz0QAJlsJrzXg4Ci
         4zUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=EZlX5eQgpve1sHzO0HJe7vuuZ6sJRQZxsTTRFKQCWlE=;
        b=bbQ3kiJn3F8J0IcBNYF4MF9+DzfTLF4VLy6TWCcnwAtaHHH+Gc/SHTziqPbiGWBlrN
         aE++bKOwKjcHuuNh3uvDvbn9kmwK4O7N6U54whAYGIphB63KPwFHP2YKD/eCUDF2R4eR
         MLyvTLLcjTzJ4scA0B02y2Fnu4jKp4dbeGVp0VNXxPrky+GQauVfJ3eMgHNesPxp9Pnh
         dWboqyLbROtLJ5GS3YHyEYHV6egcwv2Z5evoqXMJU4aISFZUYJpC7YbYiue17IZxhZrM
         r5bcs/GegSNAysXB1r2IkEplq+P7opB32xJzotRfziSy4LMi1/mgOvyAD6PQ/OZthfS/
         bdPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=cMyushgZ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ucgxJoDk;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=0lJ0hqSO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d130-v6si66065qkb.313.2018.09.01.05.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=cMyushgZ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ucgxJoDk;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=0lJ0hqSO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5PX-0003Gu-Mn
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:53:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JZ-00068Q-7N
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 08:47:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JY-0007yF-6J
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 08:47:45 -0400
Received: from greensocs.com ([193.104.36.180]:40639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5JQ-0007kI-PS; Sat, 01 Sep 2018 08:47:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 826DAC7AF6;
	Sat,  1 Sep 2018 14:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806028;
	bh=enKqiXZ0cDdY2cDIYNFZB12+BPC+N/hVVcWV4c8b8TM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cMyushgZPeS9s11V9IuJmePdXYlGqvwzxNzydaFEh7zqn+Uhimr4NSjuc6ZOsHkyT
	7h8CNmvNiRsm1z9Vurb2TTSy4R1rdxlA35II8leHYkfWkg8AYEFOyoFKWt9B8hWiUQ
	lMF1I0XpUIGYh/Ycko4yz+T5ng7Mm2U+298meUks=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ucgxJoDk;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=0lJ0hqSO
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8nZ9Nww8v9M; Sat,  1 Sep 2018 14:47:07 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 53E86521AAA; Sat,  1 Sep 2018 14:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806027;
	bh=enKqiXZ0cDdY2cDIYNFZB12+BPC+N/hVVcWV4c8b8TM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ucgxJoDk3mtGw4c95Q+g7Lrx3xybK/+tjUSDChFCtAC0XlMIeN7EWzcRlxWJk2p9l
	3hAMhwE8AKWPzcBYsS5c3uUVXnFArGkxnSQObvXZ+DLWlhVa6khuyQ1FFv9uOb6dig
	smhc3ubrXYmqLxCfeP+KzL54NQINLhxYHUKfXO+0=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id A7511521AAF;
	Sat,  1 Sep 2018 14:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806026;
	bh=enKqiXZ0cDdY2cDIYNFZB12+BPC+N/hVVcWV4c8b8TM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=0lJ0hqSO5qrjUJ0rNbbfJklcRTIhlgkgItZMTf9p3jIg1zw4liKCJyazYFGCod9lG
	10ieGjH/dEz7TltTuHAAo7oabSsY8xFbbiUsD7IkcxtcGRBhDXpHSA8V3ZH8H8PJKI
	HrXPC2gzq+8KdgZq1yy5z2JouzRutOWcTWhmgjwI=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:30 +0200
Message-Id: <20180901124639.19735-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH 06/15] gdbstub: add multiprocess support to
 (f|s)ThreadInfo and ThreadExtraInfo
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sur8yhqH0SCb

Change the thread info related packets handling to support multiprocess
extension.

Add the CPUs class name in the extra info to help differentiate
them in multiprocess mode.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index c15250ce65..43015f7792 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1249,11 +1249,10 @@ out:
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
     CPUState *cpu;
     CPUClass *cc;
     const char *p;
-    uint32_t thread;
     uint32_t pid, tid;
     int ch, reg_size, type, res;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
     char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
     char thread_id[16];
@@ -1541,30 +1540,43 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
             snprintf(buf, sizeof(buf), "QC%s",
                      get_thread_id(s, cpu, thread_id, sizeof(thread_id)));
             put_packet(s, buf);
             break;
         } else if (strcmp(p,"fThreadInfo") == 0) {
-            s->query_cpu = first_cpu;
+            s->query_cpu = gdb_first_cpu(s);
             goto report_cpuinfo;
         } else if (strcmp(p,"sThreadInfo") == 0) {
         report_cpuinfo:
             if (s->query_cpu) {
-                snprintf(buf, sizeof(buf), "m%x", cpu_gdb_index(s->query_cpu));
+                snprintf(buf, sizeof(buf), "m%s",
+                         get_thread_id(s, s->query_cpu,
+                                       thread_id, sizeof(thread_id)));
                 put_packet(s, buf);
-                s->query_cpu = CPU_NEXT(s->query_cpu);
+                s->query_cpu = gdb_next_cpu(s, s->query_cpu);
             } else
                 put_packet(s, "l");
             break;
         } else if (strncmp(p,"ThreadExtraInfo,", 16) == 0) {
-            thread = strtoull(p+16, (char **)&p, 16);
-            cpu = find_cpu(thread);
+            read_thread_id(p + 16, &p, &pid, &tid);
+            cpu = gdb_get_cpu(s, pid, tid);
             if (cpu != NULL) {
                 cpu_synchronize_state(cpu);
-                /* memtohex() doubles the required space */
-                len = snprintf((char *)mem_buf, sizeof(buf) / 2,
-                               "CPU#%d [%s]", cpu->cpu_index,
-                               cpu->halted ? "halted " : "running");
+
+                if (s->multiprocess && (s->process_num > 1)) {
+                    /* Print the CPU model in multiprocess mode */
+                    ObjectClass *oc = object_get_class(OBJECT(cpu));
+                    const char *cpu_model = object_class_get_name(oc);
+                    len = snprintf((char *)mem_buf, sizeof(buf) / 2,
+                                   "CPU#%d %s [%s]", cpu->cpu_index,
+                                   cpu_model,
+                                   cpu->halted ? "halted " : "running");
+                } else {
+                    /* memtohex() doubles the required space */
+                    len = snprintf((char *)mem_buf, sizeof(buf) / 2,
+                                   "CPU#%d [%s]", cpu->cpu_index,
+                                   cpu->halted ? "halted " : "running");
+                }
                 trace_gdbstub_op_extra_info((char *)mem_buf);
                 memtohex(buf, mem_buf, len);
                 put_packet(s, buf);
             }
             break;
-- 
2.18.0

