Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp543128wrd;
        Sat, 1 Sep 2018 05:54:21 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYhNe7sc/MZYDLqho1JTiVRi3DWOFdoVwseblkzLYVjDqlthpadJkQ42wh/kpMeixZwkA7e
X-Received: by 2002:a37:4843:: with SMTP id v64-v6mr18781762qka.209.1535806461338;
        Sat, 01 Sep 2018 05:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806461; cv=none;
        d=google.com; s=arc-20160816;
        b=yJf+5s5uz94jVnczxbQdwsjZKz+7mcwXJD9ZanNnf1aYHaNsqN28fDwrY5J72a6SsS
         luc5hLjpbi1kJa81WKp39Nn/zQFTuAesyFNzDrBk49hwNCWp4ogcDqQR7mFYea0IDfcz
         m6x5NADrFfnRhJsfZncoS7xWon5XTr7fAj0zKIYoH4Lmud/oXdYBCsHoYzhf8k4LjtKX
         jgcJA1+s/C2/dGQBmYsBQJAb3139vyZp0feRGWguL0sg6dIuwww3zP7wZUWwBgkJdHqu
         W0YO1S+aVjEo7gKqcQx16VAr52rO4alxa2HC7N/qIJk/JI6Cy3+78MEp3zflbVaSdRtr
         FAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=w4TbNvYp+ZlsByNJrhG1gCoUrk14DSyK5QBWzPrZeiE=;
        b=dNCnANlOXt/AkVlrF6r4nFfqb489zSRtbVEvEW7AN1qNv3uc8G+ORe3neeTmcn17LC
         42QHbmCuKOcDJupCuDhsvp+d3QRg7JfJj+tGOzslzW7yLVXe8zteoHMxXqvnjVVo4wGU
         g/BSyia0xEA2/+7K3AqncgHN3AogvjtYC3e8piwuSZ4k+is9otW+Qy5njLaNPPONlT4k
         8yGRuxduSTHO4AVNILQNzKyrk/xeWRqbRMYW+3AztN3vWWUsc/SeW53hAAMuCCpMHKqO
         aXgB9m7GvcuGNW07Lu8TsyNJ9up2SLYCpB0+PiarHTQcjfEWohJQgPKhR+1fVWPKMHEP
         g0SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=DySiNmK2;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=GSxCpWW0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=MlM0jRIH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1-v6si246671qvh.212.2018.09.01.05.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=DySiNmK2;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=GSxCpWW0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=MlM0jRIH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5Pw-00051r-PV
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:54:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JW-00066o-96
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JR-0007up-5A
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:42 -0400
Received: from greensocs.com ([193.104.36.180]:40638)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5JQ-0007kG-Q3; Sat, 01 Sep 2018 08:47:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 021CF521ABB;
	Sat,  1 Sep 2018 14:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806030;
	bh=U7y+z5X4f9EQxSzlOdGa0ZG0HeuqrrIUt9MwzUb7h4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DySiNmK21+iTbx5wpRYICPysJC8g6XFp9Dm00FE4xvRaHvW1khwHJP6OdBn/gUpVl
	yXMW/e61KjcrStGiiaUnw/3rn+IkYsEtwd4xdaKLbS1wGgaUMmIRTn6HkTrypk8elf
	Z41C2iAljUIwgCUyRPHdXzBbjhjaAK2M8Tg4nCaQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=GSxCpWW0;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=MlM0jRIH
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiPcfbqhMoO3; Sat,  1 Sep 2018 14:47:09 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 19B8D521AAA; Sat,  1 Sep 2018 14:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806029;
	bh=U7y+z5X4f9EQxSzlOdGa0ZG0HeuqrrIUt9MwzUb7h4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GSxCpWW0MlgFXy8OO+3eCtyt+jorz/E4EXtKC8OGEdhS3yOnxj/dArtQgW7gqjBpS
	FgaYarLLPziSW48QuyoOcDOKUIQ0p8oweQlvxYmal0hAqz7tMV8p4sCGqyo2DFeAJ0
	Wn3xO3PkDBAYOEu+L6QcJwFMP5JPPW8OyOdozuYw=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 3D31F521AB0;
	Sat,  1 Sep 2018 14:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806028;
	bh=U7y+z5X4f9EQxSzlOdGa0ZG0HeuqrrIUt9MwzUb7h4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MlM0jRIHHOPlPez4Nd3/gangVsXx8AxWRNp/f6gvSms1ZYVsY2ULq/17BCb4w3qhv
	ghXzTmhIIFlJL00GoTEOVoiVOyXhbA7km5Asqu4kVOYwbE+JZRRnRTWEpkq4tcB1ZX
	gzLmhNNmgzjYaTJat4FXoG3ZAsHVUOrYmtcLJXE0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:33 +0200
Message-Id: <20180901124639.19735-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 09/15] gdbstub: add multiprocess support to 'D'
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
X-TUID: 7wmajmHoxoSz

'D' packets are used by GDB to detach from a process. In multiprocess
mode, the PID to detach from is sent in the request.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 4ccd1153ce..af8864e251 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1025,24 +1025,39 @@ static int gdb_breakpoint_remove(target_ulong addr, target_ulong len, int type)
     default:
         return -ENOSYS;
     }
 }
 
+static inline void gdb_cpu_breakpoint_remove_all(CPUState *cpu)
+{
+    cpu_breakpoint_remove_all(cpu, BP_GDB);
+#ifndef CONFIG_USER_ONLY
+    cpu_watchpoint_remove_all(cpu, BP_GDB);
+#endif
+}
+
+static void gdb_process_breakpoint_remove_all(const GDBState *s, GDBProcess *p)
+{
+    CPUState *cpu = get_first_cpu_in_process(s, p);
+
+    while (cpu) {
+        gdb_cpu_breakpoint_remove_all(cpu);
+        cpu = gdb_next_cpu_in_process(s, cpu);
+    }
+}
+
 static void gdb_breakpoint_remove_all(void)
 {
     CPUState *cpu;
 
     if (kvm_enabled()) {
         kvm_remove_all_breakpoints(gdbserver_state->c_cpu);
         return;
     }
 
     CPU_FOREACH(cpu) {
-        cpu_breakpoint_remove_all(cpu, BP_GDB);
-#ifndef CONFIG_USER_ONLY
-        cpu_watchpoint_remove_all(cpu, BP_GDB);
-#endif
+        gdb_cpu_breakpoint_remove_all(cpu);
     }
 }
 
 static void gdb_set_cpu_pc(GDBState *s, target_ulong pc)
 {
@@ -1318,13 +1333,39 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         /* Kill the target */
         error_report("QEMU: Terminated via GDBstub");
         exit(0);
     case 'D':
         /* Detach packet */
-        gdb_breakpoint_remove_all();
-        gdb_syscall_mode = GDB_SYS_DISABLED;
-        gdb_continue(s);
+        pid = 1;
+
+        if (s->multiprocess) {
+            unsigned long lpid;
+            if (*p != ';') {
+                put_packet(s, "E22");
+                break;
+            }
+            qemu_strtoul(p + 1, &p, 16, &lpid);
+            pid = lpid;
+        }
+
+        process = gdb_get_process(s, pid);
+        gdb_process_breakpoint_remove_all(s, process);
+        process->attached = false;
+
+        if (pid == gdb_get_cpu_pid(s, s->c_cpu)) {
+            s->c_cpu = gdb_first_cpu(s);
+        }
+
+        if (pid == gdb_get_cpu_pid(s, s->g_cpu)) {
+            s->g_cpu = gdb_first_cpu(s);
+        }
+
+        if (s->c_cpu == NULL) {
+            /* No more process attached */
+            gdb_syscall_mode = GDB_SYS_DISABLED;
+            gdb_continue(s);
+        }
         put_packet(s, "OK");
         break;
     case 's':
         if (*p != '\0') {
             addr = strtoull(p, (char **)&p, 16);
-- 
2.18.0

