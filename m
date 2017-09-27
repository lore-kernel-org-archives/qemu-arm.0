Received: by 10.223.172.38 with SMTP id v35csp4802127wrc;
        Wed, 27 Sep 2017 08:00:54 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBj9mj+wFEcy0Y8JNDUTymcHcBtWrNxPU0FYimIrA446MGEasA6TcgjjwlgmllJP0qVcP1L
X-Received: by 10.200.42.2 with SMTP id k2mr2314695qtk.86.1506524453976;
        Wed, 27 Sep 2017 08:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506524453; cv=none;
        d=google.com; s=arc-20160816;
        b=qHFW3QFgZlcZDjlKO+8xekzue3etnBGjjEMEy/cz5taJdLOowYOdaFS6aSrexDdbLk
         sKYNGX/tsWPMT1WqYATJWTc/BEvd4zQVrgfTXEjrRWd9nym6Dv/jUjjoxSsJL42qR26t
         OGvpPU09AGWd8Y/87Ikbo/Bmz8xnwG8XC8Ufd/9915fNaaAaQaP7gY+TB46ZOfB/KQ3p
         1irxjXDltmYx8AX1pwto28MHiEizwNUqvQIMSIla/RO4/THwMb5Q3M+zDL3LBV9KLRWJ
         Zw1JkLlxVbCRFt+WtTUrjWXYr6F9Kr224qn//SSW5X6J3LSVqweTkiWmc6MMoSvoS0oK
         nTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=S2Zq64Y/cgCxc2fFF1wqMBea+W8ErKrqX/q62xaP1yg=;
        b=B8i8rDmMbJcpLOKrvqvCy6GkNhsaVHjOAEWB+bX8NppHXbfxYhOHiiuuXwn/19htLt
         68sd5I7kP08xvMjLmeB/M7EndhX6qM1j5Y5tq+N04bhshqe47BYh50voHxrisWrUgPrr
         Xn8UrE8C0m6/PsVTDYeW2obhrvXJ+ZfsOxcw/oqVyLMnpHLEH2MXS4kZokWZbSu7bSYQ
         DTRIqNmaBQTRsVahvBt27g8BqSQbaAJ14lHG65SyVvFfbVuPIx1RYRRU5wk2gsGBKIa4
         IYflHArbDHnVMpVjPAJWMsSJu3H2oYK3/9pa7l9aDWwM4W3ZeQ+SYZ3AG+D0sMX2l/xU
         PFmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e31si992295qtk.427.2017.09.27.08.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 08:00:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxDpT-0003UM-Oq
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 11:00:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dxDnN-0001k4-FV
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 10:58:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dxDnJ-0002Bp-Lm
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 10:58:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dxDnJ-0002BP-FR; Wed, 27 Sep 2017 10:58:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 573C88765D;
	Wed, 27 Sep 2017 14:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 573C88765D
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-117-38.ams2.redhat.com [10.36.117.38])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDF88C2282;
	Wed, 27 Sep 2017 14:58:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 27 Sep 2017 16:58:33 +0200
Message-Id: <1506524313-20037-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 27 Sep 2017 14:58:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] disas: Always initialize read_memory_inner_func
 properly
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
Cc: Julian Brown <julian@codesourcery.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A9TknGIc6Kvf

I've recently seen this with valgrind while running the HMP tester:

==22373== Conditional jump or move depends on uninitialised value(s)
==22373==    at 0x4A41FD: arm_disas_set_info (cpu.c:504)
==22373==    by 0x3867A7: monitor_disas (disas.c:390)
==22373==    by 0x38E80E: memory_dump (monitor.c:1339)
==22373==    by 0x38FA43: handle_hmp_command (monitor.c:3123)
==22373==    by 0x38FB9E: qmp_human_monitor_command (monitor.c:613)
==22373==    by 0x4E3124: qmp_marshal_human_monitor_command (qmp-marshal.c:1736)
==22373==    by 0x769678: do_qmp_dispatch (qmp-dispatch.c:104)
==22373==    by 0x769678: qmp_dispatch (qmp-dispatch.c:131)
==22373==    by 0x38B734: handle_qmp_command (monitor.c:3853)
==22373==    by 0x76ED07: json_message_process_token (json-streamer.c:105)
==22373==    by 0x78D40A: json_lexer_feed_char (json-lexer.c:323)
==22373==    by 0x78D4CD: json_lexer_feed (json-lexer.c:373)
==22373==    by 0x38A08D: monitor_qmp_read (monitor.c:3895)

And indeed, in monitor_disas, the read_memory_inner_func variable was
not initialized, but arm_disas_set_info() expects this to be NULL
or a valid pointer. Let's properly set this to NULL in the
INIT_DISASSEMBLE_INFO to fix it in all functions that use the
disassemble_info struct.

Fixes: f7478a92dd9ee2276bfaa5b7317140d3f9d6a53b ("Fix Thumb-1 BE32 execution")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 disas.c             | 1 -
 include/disas/bfd.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas.c b/disas.c
index d6a1eb9..54eea3f 100644
--- a/disas.c
+++ b/disas.c
@@ -190,7 +190,6 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
 
     s.cpu = cpu;
     s.info.read_memory_func = target_read_memory;
-    s.info.read_memory_inner_func = NULL;
     s.info.buffer_vma = code;
     s.info.buffer_length = size;
     s.info.print_address_func = generic_print_address;
diff --git a/include/disas/bfd.h b/include/disas/bfd.h
index b01e002..d99da68 100644
--- a/include/disas/bfd.h
+++ b/include/disas/bfd.h
@@ -479,6 +479,7 @@ int generic_symbol_at_address(bfd_vma, struct disassemble_info *);
   (INFO).buffer_vma = 0, \
   (INFO).buffer_length = 0, \
   (INFO).read_memory_func = buffer_read_memory, \
+  (INFO).read_memory_inner_func = NULL, \
   (INFO).memory_error_func = perror_memory, \
   (INFO).print_address_func = generic_print_address, \
   (INFO).print_insn = NULL, \
-- 
1.8.3.1

