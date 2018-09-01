Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp538581wrd;
        Sat, 1 Sep 2018 05:47:35 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbiYxffezmUoOv/lKDQtU67z7KJzz4KmecKJRHXAFILrZj54RTlOKZOxlwhPfZ7lcPjqtY5
X-Received: by 2002:a37:6458:: with SMTP id y85-v6mr18589808qkb.59.1535806055609;
        Sat, 01 Sep 2018 05:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806055; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1hRDG+DuFgzq6JOyakJvZOshnc/gfulP/0/BJhRAVRhMu9cENDGLye2HJVJM87aMs
         B5SrlrHtK6oyTqZZ62WM6vluQn4Jdabe+DKS6nY9jtgpNBdQr1NcxhU+mmn3AzflfvbU
         Izq/+B1TaAufbAw3sOgdI8Rhc3UyY0l6T7S+VExTPEif9fTdtZ8+ncWXK6hf+4k8DfyO
         al4/tE3HEdZRzbTxEoU5amnJZzshEAqZUtQyY/RMUlEQP0MLn+y6LZFhKwJxpoZLwj9Q
         Ml+do5X0JJu5ttlecGBcOZcMaFwIb4pabfyH+/rz7HLp+hvOjP3SkktNDFc4pK30ujbK
         Dydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=sW+F8DBUESv95puGlyar1MMUXisP5ec7qqU94BwGqVM=;
        b=PAi1RRpWQ06UL8Uu6OEJFBBICIhBVYOYHN6QXbFRWXBb9xwXJEjye3tUVeRyIyGm7Q
         gF7spqTvA05vjyHcZqR4dF2SN366eqDJVO4i4Qm65nv3mvkqw3xnXFeQPfARCneSNPqZ
         ItVpwAhQBk6ZIbfAEeVkaiqPojHLgRfnYnOFRAOhIq0f0awkgBd0MC990nq+QY7/9T1g
         DvsJXUy39lTX8Rhbxqpn7MACDV0ufD0lGHj0N9FiRh7h6WDKLVdmtD4R0/RtpZNkLcov
         jhrAVAfrw2C76ZMQNDVLbZGPzW5PP2PAf9tSVp2bFGmwxyQLqR7+Lo0iXmQQj6DQHbcw
         uJbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=hg9pbPVk;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nYCSzsnw;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nYCSzsnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q82-v6si2546672qkl.312.2018.09.01.05.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=hg9pbPVk;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nYCSzsnw;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nYCSzsnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5JP-0004qK-1Z
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:47:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004gC-Fa
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J7-0007lS-AU
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40642)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J6-0007kQ-UU; Sat, 01 Sep 2018 08:47:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 457B8DFFE9;
	Sat,  1 Sep 2018 14:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806032;
	bh=KAY+hWMxatC8pmfXSdjygTJWll949e3yUyuZVOI52lM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hg9pbPVkWmf+zn5vpZ0zmruzJEBUBWJU3nio27MXYgQj89nnMjkwOAbgXxi//kUzK
	t8ivYRJS7NUmtWOaFmBZThosY6sE249Y5uWvKx0+uRqAEuZ0YlLakU1WLcsvbg4QPl
	b0SnYwYqg/IUQvvxvEfG/Wc5HGNFOB1SHJAnrt5I=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=nYCSzsnw;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=nYCSzsnw
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jATZo9TXSgjj; Sat,  1 Sep 2018 14:47:11 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 70AD9521AB0; Sat,  1 Sep 2018 14:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806031;
	bh=KAY+hWMxatC8pmfXSdjygTJWll949e3yUyuZVOI52lM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nYCSzsnw6lbKqt9134oAhYVA9rK7gec0R1FTOHcf4xGEiZ8kbn8cpVPdkKZ2UQ9ft
	cX1KLOUozd5gRdjNJ2upaVsRAB1ojlaofg0oQKTP135hssA57rkPisFhbsvF3NkYFZ
	8zbQNTCKhxN7Ncbb9IWV8XjFelb0lnPpvr4grBMY=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id BEA45521AAF;
	Sat,  1 Sep 2018 14:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806031;
	bh=KAY+hWMxatC8pmfXSdjygTJWll949e3yUyuZVOI52lM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nYCSzsnw6lbKqt9134oAhYVA9rK7gec0R1FTOHcf4xGEiZ8kbn8cpVPdkKZ2UQ9ft
	cX1KLOUozd5gRdjNJ2upaVsRAB1ojlaofg0oQKTP135hssA57rkPisFhbsvF3NkYFZ
	8zbQNTCKhxN7Ncbb9IWV8XjFelb0lnPpvr4grBMY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:36 +0200
Message-Id: <20180901124639.19735-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 12/15] gdbstub: processes initialization on new
 peer connection
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
X-TUID: NzNO5t67XeKQ

When a new connection is established, we set the first process to be
attached, and the others detached. The first CPU of the first process
is selected as the current CPU.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 4874d65a30..36ed7081ea 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2217,13 +2217,14 @@ static bool gdb_accept(void)
         close(fd);
         return false;
     }
 
     s = g_malloc0(sizeof(GDBState));
-    s->c_cpu = first_cpu;
-    s->g_cpu = first_cpu;
     create_unique_process(s);
+    s->processes[0].attached = true;
+    s->c_cpu = gdb_first_cpu(s);
+    s->g_cpu = s->c_cpu;
     s->fd = fd;
     gdb_has_xml = false;
 
     gdbserver_state = s;
     return true;
@@ -2305,12 +2306,23 @@ static void gdb_chr_receive(void *opaque, const uint8_t *buf, int size)
     }
 }
 
 static void gdb_chr_event(void *opaque, int event)
 {
+    int i;
+    GDBState *s = (GDBState *) opaque;
+
     switch (event) {
     case CHR_EVENT_OPENED:
+        /* Start with first process attached, others detached */
+        for (i = 0; i < s->process_num; i++) {
+            s->processes[i].attached = !i;
+        }
+
+        s->c_cpu = gdb_first_cpu(s);
+        s->g_cpu = s->c_cpu;
+
         vm_stop(RUN_STATE_PAUSED);
         gdb_has_xml = false;
         break;
     default:
         break;
@@ -2470,19 +2482,17 @@ int gdbserver_start(const char *device)
         mon_chr = s->mon_chr;
         cleanup_processes(s);
         memset(s, 0, sizeof(GDBState));
         s->mon_chr = mon_chr;
     }
-    s->c_cpu = first_cpu;
-    s->g_cpu = first_cpu;
 
     create_processes(s);
 
     if (chr) {
         qemu_chr_fe_init(&s->chr, chr, &error_abort);
         qemu_chr_fe_set_handlers(&s->chr, gdb_chr_can_receive, gdb_chr_receive,
-                                 gdb_chr_event, NULL, NULL, NULL, true);
+                                 gdb_chr_event, NULL, s, NULL, true);
     }
     s->state = chr ? RS_IDLE : RS_INACTIVE;
     s->mon_chr = mon_chr;
     s->current_syscall_cb = NULL;
 
-- 
2.18.0

