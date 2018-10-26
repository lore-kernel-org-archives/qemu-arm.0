Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp452671wro;
        Fri, 26 Oct 2018 01:44:48 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eyUVy/S9mLQqHKSCfUE+gTGDRKystQ/8Mk1t92DYDUIw3KIor21jlfs5JiHaIE7FSLD1vX
X-Received: by 2002:a0c:bf08:: with SMTP id m8mr2415485qvi.30.1540543488645;
        Fri, 26 Oct 2018 01:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543488; cv=none;
        d=google.com; s=arc-20160816;
        b=rCVWXN0tSIKX8ne8tQvvNYBaRBpHsnIKPI6aMlcDIK0FaWVuhncO+TyWC5QTEZ9z5R
         PxIB1rzn8WvwlJPF+NjkZOmXm+e0JWYxslGg/zkpFinqJQmsUKwlO71pFcb5j9+XtsbE
         WPXrFurTslFIWgCBhVeiuHL2ywEnH0LLLOjhhvJe6Y9bHkE295te7MD9DC/YnTrlQEi2
         5aGYvA+zaln4JZX4QjvGexGZCexDdv+/qNtckLp2kJnlJ8YdXR7bf2wJi+Jda0rmYZXE
         5RKGol9TpC8W6QAA6Njz84QUp7typ+/ka4Lrv+Yr7dS8lf9z6J94VGaaXSW84SqMtsfq
         KA3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=UikGDoaOpYLnCZON2lEDAPTcx8y5VJStjWgTGbN9byc=;
        b=YU52C3ML2XzILqKrHpdEDdaJa/GXBAaqkrMFPn+TgdofovlLFhNSs1CZQ9+4x4rNE6
         FEexRp6p5TNsaj+4z4eOiB3PU7tuAXHjPflnNic2Ppb1BkgUFTVD/dBJaKlBeX5Hsa9g
         bkSMMU7BxyBtvmVtGVhy0EAsYPMk6CY69t02KhMuiQrhIrD0/EMu1e9H6byUBlZuWMG4
         yF3nd2gZRL4MinhW2mxp1gWPXzvReGHNcix0HZGvjT45HcYxi8FnSjftW3D9wTPk6jAp
         BNoJeDcrFRUDHsEAhKhsh1tpn5IKnQwLFYkGybR4xViQMdl/LSR/JdHBjnnUDFx3WZZI
         ffUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DmAtSqYh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dbjZynMp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dbjZynMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7-v6si2870950qtm.71.2018.10.26.01.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DmAtSqYh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dbjZynMp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dbjZynMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxjb-0001iO-Vt
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:44:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUN-0000gX-BC
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:29:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJC-0004n1-Fy
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:17:31 -0400
Received: from greensocs.com ([193.104.36.180]:45407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ9-0004lb-K5; Fri, 26 Oct 2018 04:17:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 14E4C441B54;
	Fri, 26 Oct 2018 10:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541839;
	bh=Y3IS9iymOA/SZuoyxBm1kgEzXBvSr1gd1zJpQV1LzIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DmAtSqYhcl8iIev49JY49lXYg9wg3vTcuszyNVxjVm/oRWo6GKvRqBfJ4OSbKkG/h
	4bq+NX1UfKTnE9N3AIItwTwISmuKLk+F4YxtoiNC3c0uhv4VRs5+7O47UIVklodUU6
	xG0LvflXosfvnxxL7wA7GdlSn6X2iVxwghJ9/ZUk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=dbjZynMp;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=dbjZynMp
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3LR76BUzPNUY; Fri, 26 Oct 2018 10:17:18 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 371EC441B4E; Fri, 26 Oct 2018 10:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541836;
	bh=Y3IS9iymOA/SZuoyxBm1kgEzXBvSr1gd1zJpQV1LzIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dbjZynMp5U500DArADoGBMsr/OxVOlP2b2jNi1LUH2TLsV8VUdm07daNVTbY/hY+k
	dAX1tLlhGDgKr7IzK8oHhNJMqkMn++6SaDYG214z022zf905i6Kd3D9zmcJtkCUpf8
	7s+NQLcrkpfr2kjk5MD7iZuSDaqSBYapQToCcggE=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id ADCD4441B48;
	Fri, 26 Oct 2018 10:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541836;
	bh=Y3IS9iymOA/SZuoyxBm1kgEzXBvSr1gd1zJpQV1LzIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dbjZynMp5U500DArADoGBMsr/OxVOlP2b2jNi1LUH2TLsV8VUdm07daNVTbY/hY+k
	dAX1tLlhGDgKr7IzK8oHhNJMqkMn++6SaDYG214z022zf905i6Kd3D9zmcJtkCUpf8
	7s+NQLcrkpfr2kjk5MD7iZuSDaqSBYapQToCcggE=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:46 +0200
Message-Id: <20181026081653.24602-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 09/16] gdbstub: add multiprocess support to
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
X-TUID: VASYtVJCe+gL

Add support for multiprocess extension in gdb_vm_state_change()
function.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 gdbstub.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index b7079eff4a..39b1766f28 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1710,10 +1710,11 @@ void gdb_set_stop_cpu(CPUState *cpu)
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
@@ -1721,10 +1722,18 @@ static void gdb_vm_state_change(void *opaque, int=
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
@@ -1738,12 +1747,12 @@ static void gdb_vm_state_change(void *opaque, int=
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
@@ -1781,11 +1790,11 @@ static void gdb_vm_state_change(void *opaque, int=
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

