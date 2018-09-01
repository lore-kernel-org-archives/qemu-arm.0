Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp539073wrd;
        Sat, 1 Sep 2018 05:48:11 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZK6l48/Q7SH5BMvayUGVkGFQKoy7/082W5qJ6pMGXLuLF9edSGzYyFqs8TnOYJeJvrf/mp
X-Received: by 2002:a37:3609:: with SMTP id d9-v6mr19025312qka.117.1535806091156;
        Sat, 01 Sep 2018 05:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806091; cv=none;
        d=google.com; s=arc-20160816;
        b=dlLp8xygbCcpJwmtPihU6aHpdZJIdRCo9f7aPEPs5c2/vstVZqlVuZVZsf/e+7bLYJ
         ynavfx/ryHbLTkId++9vLZCRLnmKsto0dLfHpDSu+i3VSv6I5Eqxw2RlV1v7Zdajz/H4
         pUXZ/noFawnn2+1/Ib/M7DUveqLXKo53A4HVvKll8LuyszOxm65nOcyvr2z2SCpboGTJ
         qtni19RQUOqGhshqke1BNDqLSS0+kjQASnjyf1CsQBdV3vV43PSKPQAGKOklO8vQDDtS
         ipq2xkih+llra5AnU+Dhr5ZTqpuoKO88cD/6/++O/fBux5U1I7J3Lhm41bXBOkCFyUzA
         uqVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=P6XxRqJaTDZcRQXpxa27eFhzIgjri6hikc01pXTV7Ng=;
        b=OMEjLYX0G4LdGOCniF9VrYmLDiHBYnJhncjzyAI2+nw2LmbEymXgThuw7O7zL/2Zy7
         15FdnWjde6ypfI5VspbkTkC1OKE3FaN72srLuLiehHw5XJfPxUgMd4T8aTTN5tkCdveS
         sHm8YJg0KFxut8NIsCHrHmqH4nq53uCkSE7B9vit2dGAhPJIOR8gjr50OCTU03onuh6e
         XYm0ZbjDT0xM32O9Iwq492RpeAMo3bZMBXRV8OGBaZKpNs5r7y6h7zP+ZrKWZcXyQ/dJ
         hY47anrnmQPPeuePXf10Esj9xTILEVulreVTMXnWm9z5L931vBkk8SmSUF9ap8aOfkAo
         qgGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nMklebHu;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=W5Jkye6U;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=W5Jkye6U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z24-v6si2267498qtq.37.2018.09.01.05.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nMklebHu;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=W5Jkye6U;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=W5Jkye6U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5Jy-0006bS-KJ
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:48:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004gE-GL
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J6-0007js-59
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J5-0007hQ-Lv; Sat, 01 Sep 2018 08:47:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id EF598521AB5;
	Sat,  1 Sep 2018 14:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806026;
	bh=T5Qf/ncLIV1hRTTx9h9gQWecUf91vnvMwkOiWtNcGIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nMklebHuq4vZLI5SulHvxEPAqS3RMPSGjQI9cZArj1imOQtr80/NXniSACX0esw5z
	g9gsVUo4BuSUvtI8WD4mSOZ1VdjLtELpeS5faZ4cZCHEb6fSD5rrso2hL5YaJ+fE9V
	fXQQOboNsHl1VE4g35N0hkAsPDLVnPt/s17VMKtY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=W5Jkye6U;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=W5Jkye6U
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHk2tiE9aaOx; Sat,  1 Sep 2018 14:47:05 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id F1668521AAF; Sat,  1 Sep 2018 14:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806024;
	bh=T5Qf/ncLIV1hRTTx9h9gQWecUf91vnvMwkOiWtNcGIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W5Jkye6Uj3ekwWO47VP0Hupt94gZloPdbYPYzHpfZ1sJ6OBeMbWAtKClWwxCNNgxR
	MOfPaWKkS8EAbsFIYobG230xyCSJS6zxNRRiEQhgckfBRgmnx03vmOvEzpMM9ZfN9d
	aDVuQ34VZks4ox81693hM4gzjHjDzfdMaFrfczCI=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 99C74521AAA;
	Sat,  1 Sep 2018 14:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806024;
	bh=T5Qf/ncLIV1hRTTx9h9gQWecUf91vnvMwkOiWtNcGIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W5Jkye6Uj3ekwWO47VP0Hupt94gZloPdbYPYzHpfZ1sJ6OBeMbWAtKClWwxCNNgxR
	MOfPaWKkS8EAbsFIYobG230xyCSJS6zxNRRiEQhgckfBRgmnx03vmOvEzpMM9ZfN9d
	aDVuQ34VZks4ox81693hM4gzjHjDzfdMaFrfczCI=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:26 +0200
Message-Id: <20180901124639.19735-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 02/15] gdbstub: add multiprocess support to '?'
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
X-TUID: 17jpE5O/Y19q

The gdb_get_cpu_pid() function does the PID lookup for the given CPU. It
checks if the CPU is in a QOM container named after the
GDB_CPU_GROUP_NAME macro. If found, it returns the correponding PID,
which is the group ID plus one (group IDs start at 0, GDB PIDs at 1).
When the CPU is not a child of such a container, PID 1 is returned.

The get_thread_id() function generates the string to be used to identify
a given thread, in a response packet for the peer. This function
supports generating thread IDs when multiprocess mode is enabled (in the
form `p<pid>.<tid>').

Use it in the reply to a '?' request.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 5c86218f49..ec3105dbc1 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -640,10 +640,37 @@ static int memtox(char *buf, const char *mem, int len)
         }
     }
     return p - buf;
 }
 
+static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
+{
+    gchar *path;
+    gchar *cont;
+    const char *left;
+    unsigned long pid;
+
+    if (!s->multiprocess || (s->process_num == 1)) {
+        return 1;
+    }
+
+    path = object_get_canonical_path(OBJECT(cpu));
+    cont = g_strrstr(path, "/" GDB_CPU_GROUP_NAME "[");
+
+    if (cont == NULL) {
+        return 1;
+    }
+
+    cont += strlen("/" GDB_CPU_GROUP_NAME "[");
+
+    if (qemu_strtoul(cont, &left, 10, &pid)) {
+        return 1;
+    }
+
+    return pid + 1;
+}
+
 static const char *get_feature_xml(const char *p, const char **newp,
                                    CPUClass *cc)
 {
     size_t len;
     int i;
@@ -909,10 +936,24 @@ static CPUState *find_cpu(uint32_t thread_id)
     }
 
     return NULL;
 }
 
+static char *get_thread_id(const GDBState *s, CPUState *cpu,
+                           char *buf, size_t buf_size)
+{
+    if (s->multiprocess) {
+        snprintf(buf, buf_size, "p%02x.%02x",
+                 gdb_get_cpu_pid(s, cpu), cpu_gdb_index(cpu));
+    } else {
+        snprintf(buf, buf_size, "%02x", cpu_gdb_index(cpu));
+
+    }
+
+    return buf;
+}
+
 static int is_query_packet(const char *p, const char *query, char separator)
 {
     unsigned int query_len = strlen(query);
 
     return strncmp(p, query, query_len) == 0 &&
@@ -1020,22 +1061,23 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
     const char *p;
     uint32_t thread;
     int ch, reg_size, type, res;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
     char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
+    char thread_id[16];
     uint8_t *registers;
     target_ulong addr, len;
 
     trace_gdbstub_io_command(line_buf);
 
     p = line_buf;
     ch = *p++;
     switch(ch) {
     case '?':
         /* TODO: Make this return the correct value for user-mode.  */
-        snprintf(buf, sizeof(buf), "T%02xthread:%02x;", GDB_SIGNAL_TRAP,
-                 cpu_gdb_index(s->c_cpu));
+        snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
+                 get_thread_id(s, s->c_cpu, thread_id, sizeof(thread_id)));
         put_packet(s, buf);
         /* Remove all the breakpoints when this query is issued,
          * because gdb is doing and initial connect and the state
          * should be cleaned up.
          */
-- 
2.18.0

