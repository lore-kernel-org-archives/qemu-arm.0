Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp538921wrd;
        Sat, 1 Sep 2018 05:47:59 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYa7GuDSDvDBDsTsPdFx2yyS1OI3TRncG3cW/bzg8uNv0RJq4Aj8FPtWi7+UYBbcEPFa8bv
X-Received: by 2002:a0c:f78d:: with SMTP id s13-v6mr19275993qvn.194.1535806079756;
        Sat, 01 Sep 2018 05:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535806079; cv=none;
        d=google.com; s=arc-20160816;
        b=mT+SQ0M8A/J2sJ52WAK4Kbh8O+AFbCszNX2rrZWo1NPoi80mJ6axXYoKw6HdJkXO79
         dd+gTLn3negfn3NE30hbPCoDtGZZlJRoUAJQPJSzT2W4D1lmuvjlyuP8GdX6GZUDHRYl
         /5uBAgBuLf5gALLscZPwqubyzmJG9xDjbeOCEUAGVI3gnjGGrH6j9p9yk0K2faZryw0K
         IIZSGv1/HA4aMjJ/La1VpOeGT8gwET+rus/ixI9kSCZyC4/B5kTmGE0Nvn28Qii+SYVo
         4jWYdlT4JyvyIdzOU/NHWvZJyf9IlYM78BiWeQxl/t9LTgiakmeS55Mvkh5+0P08VJlQ
         aDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=32CWMnn5fM0LXU9H5YNHHt9+MtvOaewAgU8uWbHHL/A=;
        b=zXew+x+KD4PHsIV6rnbv0/WdGwZFrX52SxuuNZ/9RKXbIAiDUGe4ajw/UUUKAjuE9T
         XewqzXwUuNBAVxgZJBwcdk3oEC4Am7ZilDYzPKMIUdf6vnwrIAizp8ytZunJY1sKxRW+
         Wn97co2Ek1D1lkEcDL1yFfGUXzFpMtXFQAJ3cnWXikSXMBGtNrg1ph1pA7HfKbT0ASVD
         4FeAsAMgNV4hzx7NTdnQWHa5ymUiGt6NA0ooeEGKjNQFQaKxwDZbRvP9wQyrWP19+FhA
         2+G3DUSjrpB/TyTTN9tkZGgonEGlsxlLK/YDqbGTEVZoLj316EDK8gE4UBZFWZXMnoVI
         VnPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wMOLCfhw;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zDj8ohtD;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zDj8ohtD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 70-v6si9893482qta.94.2018.09.01.05.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 05:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wMOLCfhw;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zDj8ohtD;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zDj8ohtD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw5Jn-0005rE-6c
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 08:47:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5JB-0004g7-F6
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fw5J7-0007lM-94
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 08:47:21 -0400
Received: from greensocs.com ([193.104.36.180]:40635)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fw5J6-0007kE-Rc; Sat, 01 Sep 2018 08:47:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B7CAD521ABF;
	Sat,  1 Sep 2018 14:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806027;
	bh=WzVolxSjdch3Ooe617kmhtvstqYL1EBIaH5T3ZzYLP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wMOLCfhwZLAvJeopfy/W072j8jZg5vV66n5w1mj2ehfCZEiU64UlXtOe3w5B1hoHw
	6SSWeeniNcYhrlPrDtmgMCUTtELBnMqurBs7P7fS0dtEmCyxmAu7Sk4KPJn90sEc1U
	ZJRDXBgwz147aOk7aKdGlnprTh5niLCWi1pg/9fk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=zDj8ohtD;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=zDj8ohtD
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiIPGLW6qyBO; Sat,  1 Sep 2018 14:47:07 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id C625E521AB0; Sat,  1 Sep 2018 14:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806026;
	bh=WzVolxSjdch3Ooe617kmhtvstqYL1EBIaH5T3ZzYLP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zDj8ohtD8T0ZNNY6IdZvYGOsCm860BjWIQndVLF8wefUp+C5ZI93olqKzbNfez9I3
	pfpLmW/gcVnlbCHOQlWmOd0Oabz7KFipBoi3hH4aB2gs+7A5tUI3yI8M8t/in4IHpY
	xa8/FxxpY5NMbxBMTGp4W+DNCex9c8nVMysiGMxs=
Received: from michell-laptop.home.lmichel.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 114AA521AAD;
	Sat,  1 Sep 2018 14:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1535806026;
	bh=WzVolxSjdch3Ooe617kmhtvstqYL1EBIaH5T3ZzYLP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zDj8ohtD8T0ZNNY6IdZvYGOsCm860BjWIQndVLF8wefUp+C5ZI93olqKzbNfez9I3
	pfpLmW/gcVnlbCHOQlWmOd0Oabz7KFipBoi3hH4aB2gs+7A5tUI3yI8M8t/in4IHpY
	xa8/FxxpY5NMbxBMTGp4W+DNCex9c8nVMysiGMxs=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat,  1 Sep 2018 14:46:29 +0200
Message-Id: <20180901124639.19735-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180901124639.19735-1-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 05/15] gdbstub: add multiprocess support to 'sC'
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
X-TUID: QenpFM0ddfkA

Change the sC packet handling to support the multiprocess extension.
Instead of returning the first thread, we return the first thread of the
current process.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 gdbstub.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 2cb9cb6d97..c15250ce65 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1531,13 +1531,18 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
             type = strtoul(p, (char **)&p, 16);
             sstep_flags = type;
             put_packet(s, "OK");
             break;
         } else if (strcmp(p,"C") == 0) {
-            /* "Current thread" remains vague in the spec, so always return
-             *  the first CPU (gdb returns the first thread). */
-            put_packet(s, "QC1");
+            /* "Current thread" remains vague in the spec, so always return the
+             * first thread of the current process (gdb returns the first
+             * thread).
+             */
+            cpu = get_first_cpu_in_process(s, gdb_get_cpu_process(s, s->g_cpu));
+            snprintf(buf, sizeof(buf), "QC%s",
+                     get_thread_id(s, cpu, thread_id, sizeof(thread_id)));
+            put_packet(s, buf);
             break;
         } else if (strcmp(p,"fThreadInfo") == 0) {
             s->query_cpu = first_cpu;
             goto report_cpuinfo;
         } else if (strcmp(p,"sThreadInfo") == 0) {
-- 
2.18.0

