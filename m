Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3730215wrt;
        Mon, 1 Oct 2018 04:58:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62ivtb1FyoVGsbhxS1ZE4+eySeQK1q+yeJaSN5cmmxVAsDMlMfLZNrOKPNHHo0fjjNrx2V5
X-Received: by 2002:ac8:3567:: with SMTP id z36-v6mr7856160qtb.272.1538395081526;
        Mon, 01 Oct 2018 04:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538395081; cv=none;
        d=google.com; s=arc-20160816;
        b=G06MYDc0SD/7GwyHdPQ/6z1MiiEcOnylv7hZkjjUiM2lMZ0spATYfr8lffyJy36E5c
         NlJFT6yKQPn1z8b/jxJyNCjsZ1rexBGD4i8ckaYRFSHjGZpYczc6+87HUQqSOs5iZGyg
         lah6tjCYCSt90/Uveq3LzXTG273Te1QEJQ86qbvVdXud+FUrz1Fy5toEPyfhQe4VS31v
         tt/hQrR2RwQd/Te8g09S5+McO/bE/XidkYvmHAPzBKlYVaDB/LS8qBXp+VZ2vyBqNPEj
         nuOoKj9gcofGtIAv1JN+bGwQTOTrsVWqRVvw6xrr5guD4C7DEDGOTsiXYRLxbKjmC2eC
         0q1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=lhj+2AqSA8wUsnQT04BEsExZFB2+GRPquiAh+t6ArgU=;
        b=xsmARn6cXB8XAe/b3epkc2uIa87RtJDmFuOQlQ4PkAr/YU7Fp6GAwi0yYgZHlmBRGG
         9wY91XDIs/dXH62kKwa4kFceubVjn34MhB33cr5PiKeTnt2pzXPIZ+DukMniXH4ZxQsM
         1EBdBHD1T4BLG2ecsKsffFuI7ngMMLYxzmttkFGmXl64IMR2JJae9/L/E937WCiTaBRy
         qk4T51x3jrKj/+FG4dTDaRm8se0cVWiUT4SNMmC5eWFQ450Vcza1N83VEXZDVcf+wI5T
         kYebnOdRKyQz1C5n1h38vgkCGi8HsQ//LLaEt3gVZXTr1HtW1TlzqBEYujeNyg707FPx
         kWmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=D3ecuqbH;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=N6pDGiDj;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=N6pDGiDj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18-v6si6102299qkg.117.2018.10.01.04.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 04:58:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=D3ecuqbH;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=N6pDGiDj;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=N6pDGiDj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6wpt-0002fJ-1q
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 07:58:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpO-0002NV-JU
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g6wpK-0005gG-Bo
	for qemu-arm@nongnu.org; Mon, 01 Oct 2018 07:57:30 -0400
Received: from greensocs.com ([193.104.36.180]:40040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g6wpG-0005SR-2s; Mon, 01 Oct 2018 07:57:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C20E0511C74;
	Mon,  1 Oct 2018 13:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395028;
	bh=CZDV+nwNooxk+V+II5p/pzKlDVhCtkeY4U7VPDETTBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D3ecuqbHWKf8D+1LPrpBLuxE2C8OAmjaAavOYp3wA8LBNcv7x4Vw2KQQxLy6q0ZzO
	HArFRVlG7vwOdEAaYwKTH7aJPIqQHxM3SyMYmtY9bQ3sq5Udrr0vB2SFOSpmbPqyfz
	B4C8ds1vukWGc2FCPu/NEGoVT6qOILsCSBs/8lV0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=N6pDGiDj;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=N6pDGiDj
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EhjVCXGYCR9b; Mon,  1 Oct 2018 13:57:08 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E0D47511C65; Mon,  1 Oct 2018 13:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395026;
	bh=CZDV+nwNooxk+V+II5p/pzKlDVhCtkeY4U7VPDETTBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N6pDGiDjsemAxATb7juswwz8L8QbZ4LFP7faEfJ5/4CU+vViYshtPyJfK0mlWLU2V
	AU5VEDqum+9/3AfitV8aZAaWjHmCyTBHiLT+XZVD74ilXEANskw1BqZyqaBFkqtMrK
	LqmaCBSnKoAllOBpOqnVWR3QpAwPbPuyFAsQJSRY=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 84613511C69;
	Mon,  1 Oct 2018 13:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538395026;
	bh=CZDV+nwNooxk+V+II5p/pzKlDVhCtkeY4U7VPDETTBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N6pDGiDjsemAxATb7juswwz8L8QbZ4LFP7faEfJ5/4CU+vViYshtPyJfK0mlWLU2V
	AU5VEDqum+9/3AfitV8aZAaWjHmCyTBHiLT+XZVD74ilXEANskw1BqZyqaBFkqtMrK
	LqmaCBSnKoAllOBpOqnVWR3QpAwPbPuyFAsQJSRY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 13:56:51 +0200
Message-Id: <20181001115704.701-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181001115704.701-1-luc.michel@greensocs.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 02/15] gdbstub: add multiprocess support to
 '?' packets
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
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JkJTWjFE64Vp

The gdb_get_cpu_pid() function does the PID lookup for the given CPU. It
checks if the CPU is in a QOM container named after the
GDB_CPU_GROUP_NAME macro. If found, it returns the correponding PID,
which is the group ID plus one (group IDs start at 0, GDB PIDs at 1).
When the CPU is not a child of such a container, PID 1 is returned.

The gdb_fmt_thread_id() function generates the string to be used to ident=
ify
a given thread, in a response packet for the peer. This function
supports generating thread IDs when multiprocess mode is enabled (in the
form `p<pid>.<tid>').

Use it in the reply to a '?' request.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 gdbstub.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 5c86218f49..ac9d540fda 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -640,10 +640,37 @@ static int memtox(char *buf, const char *mem, int l=
en)
         }
     }
     return p - buf;
 }
=20
+static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
+{
+    gchar *path;
+    gchar *cont;
+    const char *left;
+    unsigned long pid;
+
+    if (!s->multiprocess || (s->process_num =3D=3D 1)) {
+        return 1;
+    }
+
+    path =3D object_get_canonical_path(OBJECT(cpu));
+    cont =3D g_strrstr(path, "/" GDB_CPU_GROUP_NAME "[");
+
+    if (cont =3D=3D NULL) {
+        return 1;
+    }
+
+    cont +=3D strlen("/" GDB_CPU_GROUP_NAME "[");
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
@@ -909,10 +936,23 @@ static CPUState *find_cpu(uint32_t thread_id)
     }
=20
     return NULL;
 }
=20
+static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
+                           char *buf, size_t buf_size)
+{
+    if (s->multiprocess) {
+        snprintf(buf, buf_size, "p%02x.%02x",
+                 gdb_get_cpu_pid(s, cpu), cpu_gdb_index(cpu));
+    } else {
+        snprintf(buf, buf_size, "%02x", cpu_gdb_index(cpu));
+    }
+
+    return buf;
+}
+
 static int is_query_packet(const char *p, const char *query, char separa=
tor)
 {
     unsigned int query_len =3D strlen(query);
=20
     return strncmp(p, query, query_len) =3D=3D 0 &&
@@ -1020,22 +1060,23 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
     const char *p;
     uint32_t thread;
     int ch, reg_size, type, res;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
     char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
+    char thread_id[16];
     uint8_t *registers;
     target_ulong addr, len;
=20
     trace_gdbstub_io_command(line_buf);
=20
     p =3D line_buf;
     ch =3D *p++;
     switch(ch) {
     case '?':
         /* TODO: Make this return the correct value for user-mode.  */
-        snprintf(buf, sizeof(buf), "T%02xthread:%02x;", GDB_SIGNAL_TRAP,
-                 cpu_gdb_index(s->c_cpu));
+        snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
+                 gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread=
_id)));
         put_packet(s, buf);
         /* Remove all the breakpoints when this query is issued,
          * because gdb is doing and initial connect and the state
          * should be cleaned up.
          */
--=20
2.19.0

