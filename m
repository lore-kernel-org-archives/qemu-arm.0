Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2172558lfc;
        Fri, 13 Mar 2020 06:59:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvuJ1lNiv5n1g92KF0z8sP5WyBenjwLxiyl0616PYfhmj/DagPkP5Zkjn2ud+7LfxQ3zy9H
X-Received: by 2002:a37:8645:: with SMTP id i66mr12928315qkd.91.1584107989579;
        Fri, 13 Mar 2020 06:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584107989; cv=none;
        d=google.com; s=arc-20160816;
        b=AwKdZG4HN5BCveuKp3Sr1vEvDCKvbp6dwlS10Yl2KNKZIIgSGAmqmtJT+L+zIUtMMF
         r0ggUwusvr8GyJX16hD9bhSNgqtvbHr3rsXOTt8UklXGEx4NK6R8Mtao7ZeN56H/oCGq
         owyFUO2FiJ5ljNDuyPNNQ2gTDfGISCyzfegPfdZ7NytAnxMw3Lf7Ri6G8yz+6LIv1E3G
         rDbIRvnD/+hDulzqX/ge6tanRHQVrYSL3HI9TyvIWTFqKupQIjFBTpnHBQsgha4dcXZJ
         Z8GZpuoZomVxpEBxwkpmPDRupNy2NWnvowLkVZdpdGbnLHZ3n7/gp4fj5LuWBcvkBjDb
         5DGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:message-id:date:subject:to:from;
        bh=6p9/jg2DOSzIV+A/dn/bAwWvNmAwVPzxuGbGN4NRF4g=;
        b=A4c8Vb/C0kBTyCihaSe+4rYEWgR+Akj3XMeYJXqTI+CA4jMfpxTylnlFV2L4qtAJ3I
         4uf0JTjNDP2GVBuxPPBnAjrn5XuaDbqwd2PcpbPGba/nfZqGt+RRUCooXEX6HeQqLTkp
         lgZdLoqg5gjDfNhGgntYdndBPQdnzvEeXM2RuKNJZPftDKoJrLzymNTV7iWx3zN7BNu7
         6Jo2jN893vBY2RwglMSRP8URf8RnV+x36QFkBC1NLpXkZwEcNjZS9jc3yAvImjSmqEAS
         RB/H5Ax627SKNNrIUUipkRI7u8IaDK3juKPWu4HcluJKVcejbxV8/1yGJ3MYgvRGfakb
         IQ4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c62si4575032qkg.93.2020.03.13.06.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 06:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCkqr-0004sX-0c
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 09:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1jCkqg-0004sQ-4i
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 09:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <remi@remlab.net>) id 1jCkqe-0005fV-Ur
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 09:59:37 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:49706
 helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <remi@remlab.net>)
 id 1jCkqe-0005KY-PC; Fri, 13 Mar 2020 09:59:36 -0400
Received: from basile.remlab.net (87-92-31-51.bb.dnainternet.fi [87.92.31.51])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id A19B85FAA2;
 Fri, 13 Mar 2020 14:59:30 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: [RFC] [PATCH 0/5] ARMv8.5-MemTag disassembly
Date: Fri, 13 Mar 2020 15:59:29 +0200
Message-ID: <2159383.tmy0LfLZHX@basile.remlab.net>
Organization: Remlab
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41d0:2:5a1a::
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sJ8DvGZ1Vs7M

	Hello,

The following changes since commit d4f7d56759f7c75270c13d5f3f5f736a9558929c:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200=
312' into staging (2020-03-12 17:34:34 +0000)

adds support for the ARM MTE compatibility subset (which does not seem to h=
ave
an official name) to QEMU user mode and system mode on "max" CPU. This
corresponds to MTE =3D=3D 1 in the instruction set feature field, and allows
running code with MTE instructions without actual tag storage.

Similar to the SP alignment checks, it also adds stubs for memory tag checks
that don't actually do anything at this point and would be optimized out by
the compiler.

=46or proper storage and checking of memory tags, MTE =3D=3D 2 would be
necessary. I have some code (on top of this RFC but not included) to add the
tag allocation logic. But I have no clue how to actually store the tags in =
QEMU
system mode at this point, so it's mostly dead code.

In user mode, it seems impossible anyway, as tags are indexed by physical, =
not
virtual address and QEMU cannot know which virtual memory address may
physically alias another within the user process.

=2D---------------------------------------------------------------
R=C3=A9mi Denis-Courmont (5):
      target/arm: MTE processor state
      target/arm: MTE user mode disassembly
      target/arm: MTE unprivileged system mode disassembly
      target/arm: MTE privileged system mode assembly
      target/arm: MTE tag check stubs

 target/arm/cpu.h           |  17 +++
 target/arm/cpu64.c         |   5 +
 target/arm/helper-a64.c    |   2 +
 target/arm/helper.c        | 118 +++++++++++++++
 target/arm/translate-a64.c | 370 +++++++++++++++++++++++++++++++++++++++++=
+---
 5 files changed, 494 insertions(+), 18 deletions(-)

=2D-=20
=D0=A0=D0=B5=D0=BC=D0=B8 =D0=94=D1=91=D0=BD=D0=B8-=D0=9A=D1=83=D1=80=D0=BC=
=D0=BE=D0=BD
http://www.remlab.net/



