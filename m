Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp538598wrd;
        Sat, 1 Sep 2018 05:47:36 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZyl2ZtQPhxnw4mvfbRqxNUnAQJlEdkvC3OfOv4F1+wW0Qs3RhsRa2E8vUOCLDIL9pjm9NM
X-Received: by 2002:ac8:2672:: with SMTP id v47-v6mr19448761qtv.287.1535806056450;
        Sat, 01 Sep 2018 05:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806056; cv=none;
        d=google.com; s=arc-20160816;
        b=uELF6zmRBErTEvhQdPnzsbeTczG2mUVBW03dDt/u9HoQ/pVGtCMkVFsGcbrXwjW8WY
         /Ns+lKEoT3YZsuhpclgcuALGdL8ZGh/CCQQQGM+WjMUPHefJM/vCgiFkZAWtcrfeDkCB
         bVtsgKWJSZZK3cknGe+fnj/AUJkXmz+/dGuy0MVvmBUlF5nXdnCIgN7MZcMlrr3H5Z/C
         m4B1DAtAZr8jvDjlEpP2HdRgLSVlyB4+n8AEsrWj5qMB3Cs6we8A+jzhjXrovOOMbMZD
         WtWLGZsqj/8MEhjYBDLuHfne+A3PAtaKC7D5a1ugL9kisISjMzJZwAWE6GHgCidakUyz
         DhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=PEeDxumFkRM8aewByiD18P8NypxLabKTp7F/tkG9w6Q=;
        b=ZMQnt8yekgMc/BN8FJtamg38lByQamIgKVh2R7c0EAZTq148N0vXv0sBq00kxFM80v
         M/WANp5bi7GArwgPCuuRLLKZ0j7Ln8Fv0OO5mSXFBLcvBvoOLw0IkyU+eyaHpIo97cuC
         0R9DwxQfcXwIbrVvGszn7oOUoox0p1rbHoyHMbMThU9sfQ1+ba4r5gabPF0/r8dgFQ08
         5P+txff30JY+I/sQIHH3pkyUGELZlaRbNA8ul+eFZjG37/rKk5WpqaBqjQFuJZEKx+8I
         d9Q+PfASoTp9p68Ar/8TzJmbay7IzM/2KzyPIGho3LnPM7+5rXHZgTYoJN+l7rOGMvQl
         +zSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=lIqRu3vv;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=uVJY3dJU;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=uVJY3dJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i43-v6si10985035qtf.22.2018.09.01.05.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=lIqRu3vv;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=uVJY3dJU;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=uVJY3dJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5JP-0004t0-VY
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:47:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004g8-F7
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J7-0007lH-8e
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40643)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J6-0007kR-QZ; Sat, 01 Sep 2018 08:47:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 7F297DFFE5;
	Sat,  1 Sep 2018 14:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806031;
	bh=YreZeTrW0Sv/0CWPHMxl5hdbM1k5LPGRr5JMFnrvDaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lIqRu3vv2TmQDGlX/cYIWtGT5J0gfJneMHlGjr9kpGhIsrcEfBJMkbgf2t3PCHGAl
	6bp5Vsv7Wb4oT6BQHZCinbyaaUTHPStK4fnTEGe7Slt9EOD9SUtlvyTE27GwQvi5ii
	PLXCNUGhFFCQ/XCcTRFBJVHy2OMuKE3ywI/pqVAU=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=uVJY3dJU;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=uVJY3dJU
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqsO6YAXV2_D; Sat,  1 Sep 2018 14:47:10 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A562F521AAA; Sat,  1 Sep 2018 14:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806030;
	bh=YreZeTrW0Sv/0CWPHMxl5hdbM1k5LPGRr5JMFnrvDaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uVJY3dJUHN/8JVXPGlEdChmD1YR4ARASr8kdn4kRzZL+vEjZM1+RswbmI1GJIksDe
	1tMfcUulADBlR67Ub2pVlIoevP1G2G92S5aD4LLLyeO965bgegOWYu4/D1se8mHpA5
	wQwSBnHEiUcTv7/8JK0oGQwNvwl+NhrulE9aj488=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id EA8FE521AAF;
	Sat,  1 Sep 2018 14:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806030;
	bh=YreZeTrW0Sv/0CWPHMxl5hdbM1k5LPGRr5JMFnrvDaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=uVJY3dJUHN/8JVXPGlEdChmD1YR4ARASr8kdn4kRzZL+vEjZM1+RswbmI1GJIksDe
	1tMfcUulADBlR67Ub2pVlIoevP1G2G92S5aD4LLLyeO965bgegOWYu4/D1se8mHpA5
	wQwSBnHEiUcTv7/8JK0oGQwNvwl+NhrulE9aj488=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:35 +0200
Message-Id: <20180901124639.19735-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 11/15] gdbstub: add support for vAttach packets
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
X-TUID: Tg5AyEhmLZbv

Add support for the vAttach packets. In multiprocess mode, GDB sends
them to attach to additional processes.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 4bed0a85f3..4874d65a30 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1327,10 +1327,42 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
                     break;
                 }
                 goto unknown_command;
             }
             break;
+        } else if (strncmp(p, "Attach", 6) == 0) {
+            unsigned long pid;
+
+            p += 7;
+
+            qemu_strtoul(p, &p, 16, &pid);
+
+            process = gdb_get_process(s, pid);
+
+            if (process == NULL) {
+                put_packet(s, "E22");
+                break;
+            }
+
+            cpu = get_first_cpu_in_process(s, process);
+
+            if (cpu == NULL) {
+                /* Refuse to attach an empty process */
+                put_packet(s, "E22");
+                break;
+            }
+
+            process->attached = true;
+
+            s->g_cpu = cpu;
+            s->c_cpu = cpu;
+
+            snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
+                     get_thread_id(s, cpu, thread_id, sizeof(thread_id)));
+
+            put_packet(s, buf);
+            break;
         } else {
             goto unknown_command;
         }
     case 'k':
         /* Kill the target */
-- 
2.18.0

