Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp738847wrw;
        Tue, 6 Nov 2018 03:06:51 -0800 (PST)
X-Google-Smtp-Source: AJdET5dQa6+RFFZWy1Pi7aQ2ydjP0rFygTEtm+JxW2ATgNhBCu2UR20AQwqyEQmxnbtck7K5CWUh
X-Received: by 2002:aed:3c0c:: with SMTP id t12mr25515690qte.226.1541502411466;
        Tue, 06 Nov 2018 03:06:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502411; cv=none;
        d=google.com; s=arc-20160816;
        b=DW3KvXEhEaNzYqyMH/Dg0c3VOYMJK9+RysIeLIezEltU4YxeNU5cT+WZkC+WCaiJwm
         Yfzt5DTlcVYJwCC5gDcPI/A11Hz+Bef4xr5ABh43h1X/m9Mukbry75g/WYsVSdxxl8UR
         mMI9KLAg43/RPfCpjpyjOTrYhKMvPvDnLZFpTiZZCahX5C4X6ivaHLEmHLRNynlAv0Az
         +IM/5Kpr+bNJdOemjWgUQSaZp7dot5gqH+krgbE8idesKdrBDcD52hApVAOUTu79zBIL
         v7j5H0mWAusIyYxPMP2LdAwEj4u6nErnLfpOpucpTNN41yfP+TIYU43/+4eAGWau06D8
         tn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=zcBaI+pRF72rAndb2ajEh3xsuiynZzDLLDLLye+Dks8=;
        b=0Xn8wiEEUiJ9x+VJOlVcnzE3nymMWHqtm1q2PW1BLVsYlQRjT1DgdZ9T6mvkwFx1jR
         YxBo3F5PIR1dcQvbPQ5JG5ft8jlooD80L/YpNP+upWtLvUTYE0CYv8t7mPuWJLR7SLMB
         X8qzlDKKfLiABO4H7/+LEQm/axlKiFrjT4UzuQ3fmBJE2quTA/MYKyvpmuKE8Npj3+bA
         9e3kZ/GcVDn6ncsAxJuHZTmQ4AUHSu6vBqzD51NDwMtSg868kx/OFC2NmuOCVGlg7Mkc
         VL5DyDNnepwRHFO2JiBXLS8FFXcp8U1Eb+e9vqnW7ocOj2K+AO9J0OgrwSU8GF87kDAB
         BiYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="sS/oFJhh";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iDzyXRJU;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iDzyXRJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si8087170qva.47.2018.11.06.03.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:06:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="sS/oFJhh";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iDzyXRJU;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iDzyXRJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzC7-0006Um-0I
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:06:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBZ-0006Eu-Ev
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBW-0000qI-9H
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:17 -0500
Received: from greensocs.com ([193.104.36.180]:46713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBV-0000or-VO; Tue, 06 Nov 2018 06:06:14 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A69024F7670;
	Tue,  6 Nov 2018 12:06:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502373;
	bh=fC05Ss4NtDnlUcYu1G7ZDk22A00EuZP6bFkSpzrSNxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sS/oFJhhSgpqNsSokL790zBPD50ntRa78lvFuQcalr2r8OpmslcIsIJ7MBKsz1sDs
	ucTJtMRg8EI0086yUjsYZ+HuKmYM7rNz62u/yDaZf4qXNFI4OZ8sLa9mJsDQf6waPW
	VpOK3bYyFazllwr6jm3MWOskK1px8QY4X6SVoT7o=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=iDzyXRJU;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=iDzyXRJU
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Pi-k8flFZ3F; Tue,  6 Nov 2018 12:06:12 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id C1AC45C024F; Tue,  6 Nov 2018 12:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502368;
	bh=fC05Ss4NtDnlUcYu1G7ZDk22A00EuZP6bFkSpzrSNxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iDzyXRJU7XjuU/doTqw9KOhLggJBeq51zK3YBxDxXl5CK8oJK0OcEn3T7kmAsCHsF
	yR4cvTf+pFRE5YxksJsWh4qgRBkYf8sxMN1WyRKKuGBOSYNC1EI8whqyNE5KouEjJS
	5FRzK6f92xclJw5eMHf1nXe/t4dOxK1+d2Jyk39k=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 585825C024F;
	Tue,  6 Nov 2018 12:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502368;
	bh=fC05Ss4NtDnlUcYu1G7ZDk22A00EuZP6bFkSpzrSNxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iDzyXRJU7XjuU/doTqw9KOhLggJBeq51zK3YBxDxXl5CK8oJK0OcEn3T7kmAsCHsF
	yR4cvTf+pFRE5YxksJsWh4qgRBkYf8sxMN1WyRKKuGBOSYNC1EI8whqyNE5KouEjJS
	5FRzK6f92xclJw5eMHf1nXe/t4dOxK1+d2Jyk39k=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:41 +0100
Message-Id: <20181106110548.4209-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 09/16] gdbstub: add multiprocess support to
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WM7460VJTEAv

Add support for multiprocess extension in gdb_vm_state_change()
function.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index aae3cce01a..decf56c610 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1713,10 +1713,11 @@ void gdb_set_stop_cpu(CPUState *cpu)
 static void gdb_vm_state_change(void *opaque, int running, RunState stat=
e)
 {
     GDBState *s =3D gdbserver_state;
     CPUState *cpu =3D s->c_cpu;
     char buf[256];
+    char thread_id[16];
     const char *type;
     int ret;
=20
     if (running || s->state =3D=3D RS_INACTIVE) {
         return;
@@ -1724,10 +1725,18 @@ static void gdb_vm_state_change(void *opaque, int=
 running, RunState state)
     /* Is there a GDB syscall waiting to be sent?  */
     if (s->current_syscall_cb) {
         put_packet(s, s->syscall_buf);
         return;
     }
+
+    if (cpu =3D=3D NULL) {
+        /* No process attached */
+        return;
+    }
+
+    gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id));
+
     switch (state) {
     case RUN_STATE_DEBUG:
         if (cpu->watchpoint_hit) {
             switch (cpu->watchpoint_hit->flags & BP_MEM_ACCESS) {
             case BP_MEM_READ:
@@ -1741,12 +1750,12 @@ static void gdb_vm_state_change(void *opaque, int=
 running, RunState state)
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
             cpu->watchpoint_hit =3D NULL;
             goto send_packet;
         } else {
             trace_gdbstub_hit_break();
@@ -1784,11 +1793,11 @@ static void gdb_vm_state_change(void *opaque, int=
 running, RunState state)
         trace_gdbstub_hit_unknown(state);
         ret =3D GDB_SIGNAL_UNKNOWN;
         break;
     }
     gdb_set_stop_cpu(cpu);
-    snprintf(buf, sizeof(buf), "T%02xthread:%02x;", ret, cpu_gdb_index(c=
pu));
+    snprintf(buf, sizeof(buf), "T%02xthread:%s;", ret, thread_id);
=20
 send_packet:
     put_packet(s, buf);
=20
     /* disable single step if it was enabled */
--=20
2.19.1

