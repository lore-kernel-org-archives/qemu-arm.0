Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp816705wrw;
        Sat, 10 Nov 2018 00:26:58 -0800 (PST)
X-Google-Smtp-Source: AJdET5cKaEmUodLaI4FTzdzq46lG99SZbNcYTNngWbIh5j/cIEfnwpMN1eXsGiikAQeHUOTCvo8V
X-Received: by 2002:aed:3425:: with SMTP id w34mr11563527qtd.358.1541838418565;
        Sat, 10 Nov 2018 00:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541838418; cv=none;
        d=google.com; s=arc-20160816;
        b=rHH5yf0qIRihAZ47/L7VMZIDPwk6oQNvJpwIO098gd70xcC3YWrRdQNFuXCtbmREoC
         RmtCuy1Hr5VnrLJB/1dt4PpbbsdE1qnnUJfQ7PIKoWp46Mo88rW58Ohd2xlJ/9i3LxTU
         LGiB3xaK9uFOCpWWTEpHpeYBTDwijJJjjFaCzVKAroZj/xMDB9xHzdBTRPxm5e21esUu
         eUOgvnjnBCbXDj6GXKRf4wMJYxfn2TQjd1fllWn2UiOncDzIO+d02qBpTxIgi+Xa9bFs
         Fjm9cmnmCX3KcrVQxc+80YYN/V3ptHYM0uoyrV00dOUr1k0j7ZRiUhHUztKuy4sFhJ2g
         4Jiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=zcBaI+pRF72rAndb2ajEh3xsuiynZzDLLDLLye+Dks8=;
        b=Iv93sawdSTWo9FGdkBmTODl6QN1p6rgt4qnhOUfQBUi71TqnLPDHXnkWAWKYjLV/Uc
         dISIH+pS64qbL1xvT4day3JVHuevyciXj6L4ZA8CIBLK1RrfDvmW+W+7WlXJuyydCHiU
         HQOFRvrs3M7qwAK/KDgJLP+T4MYh+oSBffBdkRNXJdvspePlrLYp2v8+9IBjyK6BjsMY
         NrM+dX/sZgbIvoBDQD5pvuPmOhzHXzCiEqHccMHImEkwb2Tehapy3Kyjopt420HsPRqe
         rnIJF/J9E/QsgK+NilAW1L8DKblHkAYnujSA84tr5mebh1b+Z5KZSxcQt52cJAKDv9XA
         nr0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rRzt18uE;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="us0jv/hB";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="us0jv/hB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v20si3026660qvc.134.2018.11.10.00.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:26:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rRzt18uE;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="us0jv/hB";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="us0jv/hB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOba-0000tF-2d
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:26:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP3-00040Y-OG
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:14:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOy-0000tU-C9
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:14:01 -0500
Received: from greensocs.com ([193.104.36.180]:43680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOx-0000TF-5V; Sat, 10 Nov 2018 03:13:56 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B97F45D19AC;
	Sat, 10 Nov 2018 09:13:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837608;
	bh=fC05Ss4NtDnlUcYu1G7ZDk22A00EuZP6bFkSpzrSNxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rRzt18uEDNh3exA2IxRCpe+qMHGGDCmBWodDE+3S26F4g+7xclVKXXiJE4qdVbeg1
	wMgUH+dAjpuqEm8/tS+0tLAXU0F9bJ+pCJPDZeHmwjBHjkBUSBf5383injQwSkp6v+
	OXz3kgUAGuV6H2P3LRAdX4U7QvxDz9El+olSY/d8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=us0jv/hB;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=us0jv/hB
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3S7m9kyaHn6; Sat, 10 Nov 2018 09:13:28 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 320BB44325F; Sat, 10 Nov 2018 09:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837605;
	bh=fC05Ss4NtDnlUcYu1G7ZDk22A00EuZP6bFkSpzrSNxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=us0jv/hBajZAONcD+SwzxZb3njoVD20maKdl+UC2XAxvk/393quQ3xz6s0KGzNEFG
	BfP+imnQnDh8MSmnPBIxOTgV+ghFX3p65+qlat3wWnULLhji3mkGXZTgzHlmSxCuU3
	b2UCHNoMuYZMlRnNk5M95WCVUMJPRf8CaYv5Mnd0=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B10CC44325E;
	Sat, 10 Nov 2018 09:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837605;
	bh=fC05Ss4NtDnlUcYu1G7ZDk22A00EuZP6bFkSpzrSNxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=us0jv/hBajZAONcD+SwzxZb3njoVD20maKdl+UC2XAxvk/393quQ3xz6s0KGzNEFG
	BfP+imnQnDh8MSmnPBIxOTgV+ghFX3p65+qlat3wWnULLhji3mkGXZTgzHlmSxCuU3
	b2UCHNoMuYZMlRnNk5M95WCVUMJPRf8CaYv5Mnd0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:40 +0100
Message-Id: <20181110081147.4027-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 09/16] gdbstub: add multiprocess support to
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
X-TUID: 3/K5HqOEn/2B

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

