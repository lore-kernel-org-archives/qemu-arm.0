Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp538610wrd;
        Sat, 1 Sep 2018 05:47:36 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdb8262lE1lDfD/nVkS3R0htBD+1A2B7zlroaSSvAepAhnb67BJ4Q1aqvInen9kX4u0yrWQq
X-Received: by 2002:a0c:9e2a:: with SMTP id p42-v6mr19050997qve.54.1535806056855;
        Sat, 01 Sep 2018 05:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806056; cv=none;
        d=google.com; s=arc-20160816;
        b=ksM1TuvPHH90zGM21niJPn9bQ/PAdhPmkV1ObPdEuX3GPeDqYXzKd/Odf1ShsVvgaR
         I2oC2mKu9NHSvFNatmPun8YJ67FMrpemtd4KrR5+yWy6wQWeACHYVwzcUciFbO2Qv7x4
         J8FNzVOlsc/1oEGL1zoJ+Yjf/abSJiLg6dTVOYQ/xbdU5pu+L8+6xl2lRX5Mr7IjV6pA
         4hWfEWLrxrT5neY4xj27bZyudZPJMPtRsYKeb/ipMfqWHP5nQXdYjakqRSNqHTVK+ppC
         cyNqfUGwdx5iYmLi57/TRJzTj6OFoai6fFl+wKwa+IeNjj1ddCdgp2X6w6ewCKSj31EL
         iC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=al47g+pB2Cpb4UZvfrfzbD5X477YlFF/MibtarzGGnA=;
        b=ONY551CnvwUZpsxi8ouGvQsSA9jRKVpnhChHEoOKZj0/5cCo3Ljlc45f74x/FnxyCH
         AAqGdTTPJDKCgeR0on7Mu3NfLWtAJB/cDeLRVW6/osqfA+lcnptn4VWw9UbBqM/4fttX
         36WmMkwh666Hl+e9o6AbMzPBeSkkX1vdayhJTI2HAi4KZfAKpTbLrOJkX1tDELBVAgTE
         hG8o6ZgFtZSirfvbvoPf5279v4T5kt5lxQoLVzCFMOqUvrXiXouu/GP/Ks8OMiFMre0C
         485ErqW2ht4VJdviXVsbac4mVINSyE+P+nvo0MLMZJLpZ/crGcql3gDbFX0L1vDUl/BZ
         9HCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2MVsRv3v;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=houbh2g0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=houbh2g0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11-v6si689806qtr.367.2018.09.01.05.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2MVsRv3v;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=houbh2g0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=houbh2g0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5JQ-00050Y-At
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:47:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004gA-FT
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J7-0007lA-5O
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J6-0007kD-OE; Sat, 01 Sep 2018 08:47:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A45A8C7AC5;
	Sat,  1 Sep 2018 14:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806029;
	bh=YEe+bSOHxip03b/mKVTpeg3rx6MLOFwKQBwCoNaRXg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2MVsRv3vJckeHMKmdxLzRYINYlDd2h9FSWp/ht+a0HNslNG/eCdl89oADVMfy1TQo
	3uLaIxSxBagcp/YBxDXTXh5Xs+e8rvEp7ry1q3YioA1Z1TvTiBo2Xaw7tamaeD6sMG
	Lg8PV8hJM/6KwsRVqpMuspzxMXq8KJDcBWa+zqcw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=houbh2g0;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=houbh2g0
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZcCImLprE-h; Sat,  1 Sep 2018 14:47:08 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id AA919521A9F; Sat,  1 Sep 2018 14:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806028;
	bh=YEe+bSOHxip03b/mKVTpeg3rx6MLOFwKQBwCoNaRXg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=houbh2g08bpcgk2ZVmw6SE71WN2gGseH88hM5pK0lPkUEAhgPPNaTw+6fqjp9Tg0D
	SkeNqwsVQboTkQonWzm/RtIZB4OtFt5yhY7JhgeDIIRHKVur6s1WE527cK6w2oLM4a
	TceQhRsU+vf/PzR90koGb8P0KMpmUHTYheS6bOck=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B9474C7AC5;
	Sat,  1 Sep 2018 14:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806028;
	bh=YEe+bSOHxip03b/mKVTpeg3rx6MLOFwKQBwCoNaRXg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=houbh2g08bpcgk2ZVmw6SE71WN2gGseH88hM5pK0lPkUEAhgPPNaTw+6fqjp9Tg0D
	SkeNqwsVQboTkQonWzm/RtIZB4OtFt5yhY7JhgeDIIRHKVur6s1WE527cK6w2oLM4a
	TceQhRsU+vf/PzR90koGb8P0KMpmUHTYheS6bOck=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:32 +0200
Message-Id: <20180901124639.19735-9-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 08/15] gdbstub: add multiprocess support to
 gdb_vm_state_change()
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
X-TUID: kDv+OLfhYhm3

Add support for multiprocess extension in gdb_vm_state_change()
function.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 761cb051c8..4ccd1153ce 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1693,10 +1693,11 @@ void gdb_set_stop_cpu(CPUState *cpu)
 static void gdb_vm_state_change(void *opaque, int running, RunState state)
 {
     GDBState *s = gdbserver_state;
     CPUState *cpu = s->c_cpu;
     char buf[256];
+    char thread_id[16];
     const char *type;
     int ret;
 
     if (running || s->state == RS_INACTIVE) {
         return;
@@ -1704,10 +1705,18 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
     /* Is there a GDB syscall waiting to be sent?  */
     if (s->current_syscall_cb) {
         put_packet(s, s->syscall_buf);
         return;
     }
+
+    if (cpu == NULL) {
+        /* No process attached */
+        return;
+    }
+
+    get_thread_id(s, cpu, thread_id, sizeof(thread_id));
+
     switch (state) {
     case RUN_STATE_DEBUG:
         if (cpu->watchpoint_hit) {
             switch (cpu->watchpoint_hit->flags & BP_MEM_ACCESS) {
             case BP_MEM_READ:
@@ -1721,12 +1730,12 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
                 break;
             }
             trace_gdbstub_hit_watchpoint(type, cpu_gdb_index(cpu),
                     (target_ulong)cpu->watchpoint_hit->vaddr);
             snprintf(buf, sizeof(buf),
-                     "T%02xthread:%02x;%swatch:" TARGET_FMT_lx ";",
-                     GDB_SIGNAL_TRAP, cpu_gdb_index(cpu), type,
+                     "T%02xthread:%s;%swatch:" TARGET_FMT_lx ";",
+                     GDB_SIGNAL_TRAP, thread_id, type,
                      (target_ulong)cpu->watchpoint_hit->vaddr);
             cpu->watchpoint_hit = NULL;
             goto send_packet;
         } else {
             trace_gdbstub_hit_break();
@@ -1764,11 +1773,11 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
         trace_gdbstub_hit_unknown(state);
         ret = GDB_SIGNAL_UNKNOWN;
         break;
     }
     gdb_set_stop_cpu(cpu);
-    snprintf(buf, sizeof(buf), "T%02xthread:%02x;", ret, cpu_gdb_index(cpu));
+    snprintf(buf, sizeof(buf), "T%02xthread:%s;", ret, thread_id);
 
 send_packet:
     put_packet(s, buf);
 
     /* disable single step if it was enabled */
-- 
2.18.0

