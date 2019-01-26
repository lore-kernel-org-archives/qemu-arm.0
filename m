Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1136611wrt;
        Fri, 25 Jan 2019 22:52:56 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6kIgiwrmcJAgNAucNVfT3yMG+hJH1ELSoytlH7CWqbI7ujx7aKp3rZD7jwhQEynDSykO48
X-Received: by 2002:adf:ec50:: with SMTP id w16mr14527751wrn.171.1548485576321;
        Fri, 25 Jan 2019 22:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548485576; cv=none;
        d=google.com; s=arc-20160816;
        b=UDNkeHNFnXHB/PBkZFUEJSxRUKVAf7sb3HD5YRaNE7/ovmwJP+jztpXlJh9JBIXAgA
         lz1ihurP8AGrSDopfgPdv97QhH/KbhwPapBzVToh40YYTA2DYVi3kft4b+mSi0O3vlDB
         KYk0nfuUdqWRfXAyYcZp9sqaNicH4s3xWz82ot+gecUDfGhpmSqS5KQYTggjaDHyEMNI
         hCeonAjbtE0viyagvoU6YffZBOI2SBLTmtxSQxIAl64YX85rbj51DLLkTwK81uXKj/Ly
         +UfFBlgh+TWcJT9wOELpwBJ/tX1SPVQEnaSfcUEftBiP3NwN7eXZygK6IpNEYD8s6yMU
         B0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=lKu3WMgbn9a9aKbXJerJfiMYxc8W5mShSYdQlqU6vYA=;
        b=fMvto5vmCkojlecS5WBsP2Lth7zafr1Q8AhErOE7yqOWShIL7b1ve5bZZbTUW+LXoo
         OzHgV+hfJxBwEPFXIUcER1aV7cT5NrMFJOm9pc6rz9I3JtGhYqL0XRIyZj0n06HIkhOu
         AVgC17DIns41FNqMdVy8Mew+SeI6zFQGGbMOigXJ2hlHgRdW7U9yJAS7nvgOx1Yk6+E7
         Qfy3lHR4X8Kmgd34Pnyx5J3Mkxygb9gdXVIL1K3GmxowLwONLbtYFCBH0zRPdmiAtfRR
         GCg3Zlz2lsNYWSlxBJke2GoyU7YrnXmLDsZbTZ3QMoNvsPXU6bbGwj1V3T0WIQ14FlVP
         9Leg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si75378901wrp.71.2019.01.25.22.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 22:52:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnHpn-0004SX-Bi
	for alex.bennee@linaro.org; Sat, 26 Jan 2019 01:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gnHpY-0004Rf-GB
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 01:52:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gnHpC-000162-9T
	for qemu-arm@nongnu.org; Sat, 26 Jan 2019 01:52:23 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:48102
	helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>)
	id 1gnHp8-0000z7-M1; Sat, 26 Jan 2019 01:52:14 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
	by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 9EEBD5FE59;
	Sat, 26 Jan 2019 07:52:12 +0100 (CET)
From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
To: qemu-arm@nongnu.org
Date: Sat, 26 Jan 2019 08:52:11 +0200
Message-Id: <20190126065211.3587-2-remi@remlab.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1648289.tQCHxfjYn9@basile.remlab.net>
References: <1648289.tQCHxfjYn9@basile.remlab.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:41d0:2:5a1a::
Subject: [Qemu-arm] [PATCHv2 2/3] target/arm: actually enable PAuth in user
 mode
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 84RgQWigjOp0

From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>

This always enables IA, IB, DA and DB keys in user mode on the maximum
CPU, in a manner that is consistent with the other CPUs. That is to say
redefining the reset value of SCTLR_ELx registers.

Without this patch, the PAC* and AUT* instructions have no effects
(except PACGA of course).

Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu64.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e9bc461c36..c8ed943c65 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -287,7 +287,7 @@ static void cpu_max_get_packey(Object *obj, Visitor *=
v, const char *name,
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
     const uint64_t *bit =3D opaque;
-    bool enabled =3D (cpu->env.cp15.sctlr_el[1] & *bit) !=3D 0;
+    bool enabled =3D (cpu->reset_sctlr & *bit) !=3D 0;
=20
     visit_type_bool(v, name, &enabled, errp);
 }
@@ -304,9 +304,9 @@ static void cpu_max_set_packey(Object *obj, Visitor *=
v, const char *name,
=20
     if (!err) {
         if (enabled) {
-            cpu->env.cp15.sctlr_el[1] |=3D *bit;
+            cpu->reset_sctlr |=3D *bit;
         } else {
-            cpu->env.cp15.sctlr_el[1] &=3D ~*bit;
+            cpu->reset_sctlr &=3D ~*bit;
         }
     }
     error_propagate(errp, err);
@@ -413,8 +413,8 @@ static void aarch64_max_initfn(Object *obj)
                                 (void *)&apdb_bit, &error_fatal);
=20
             /* Enable all PAC keys by default.  */
-            cpu->env.cp15.sctlr_el[1] |=3D SCTLR_EnIA | SCTLR_EnIB;
-            cpu->env.cp15.sctlr_el[1] |=3D SCTLR_EnDA | SCTLR_EnDB;
+            cpu->reset_sctlr |=3D SCTLR_EnIA | SCTLR_EnIB;
+            cpu->reset_sctlr |=3D SCTLR_EnDA | SCTLR_EnDB;
         }
 #endif
=20
--=20
2.20.1

