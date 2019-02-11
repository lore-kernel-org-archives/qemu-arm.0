Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp117434wrp;
        Mon, 11 Feb 2019 16:11:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaTfbVaxeU6kX8KJOEFJR8jaPeuSQ+tdxaVe/v+G5H97UFsJ3Gd2R4ICaSfPAPL86tm5uPI
X-Received: by 2002:a25:cf50:: with SMTP id f77mr694129ybg.518.1549930292390;
        Mon, 11 Feb 2019 16:11:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549930292; cv=none;
        d=google.com; s=arc-20160816;
        b=mA3PN/x4HqZkGVT+NM97DJSngAz+w6Yv2RmrANwS0rL3dni7yoz8U6Qo4IH19pcfah
         SZzAmhdgtWM0+jqL75KwstoIHJM3CSVGE8bDH31R9F4apFdb/eZcd0+OK4+mk2YVadGA
         0BJYUbsvUK5+VFZ3UQd+bf5z7/KaxSjfF+jfEP9WMlL4T/VG3S4U/kma/rYj8A33eOZU
         g0KC1N7+GIv6hxGOXsEuJmTtwYso7MilvSYTiCk/lwFw/uzKHFltiQIBV2uRrvYMpW70
         DD+oXyn7UxdpFsQLWGq8U1e+/ZEG2bTZMcICX8V63aGTFJu+d1oA4wFQ+V3UlUHE3uhd
         Mhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=D7zmCCEx4gtvzG1BwOiqP1rjcgbsuS/cyN2XMLs4c+Y=;
        b=BPYp5/hJmIUy1HIqKX/QZ033+PYHJm0X4NldjZ+x53kRvce7s0lDS3nGhj5XoIPBZF
         uEyk8jXShPKYhsEJmdCsM1WzvYKDapjJCZpl3Yhz4HN7mJdI/Tt7uaBkMualpwixlx1d
         3wjMAUxa56ha+Nvy9FIQZjCtbiNTIoaUeiZjbvMwaps5CtIycZmOoxkiTO5IELHJ30DW
         qfn65mHsADnQHyZisTfz/VH7YL9/4ChM6X15xZU81Zv17GN0TlvxZSTJY/TdfwJsh4Rc
         1TXhngyAST9zwymEQsLbIVMiHo2lMBjDLRxf+Y9YKbIVcbFK6NS21aKQD7qZzKGhXloH
         zkjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pgI8ttDa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d193si2680408ywe.152.2019.02.11.16.11.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:11:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pgI8ttDa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLff-0002gh-Oe
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:11:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOk-0005uT-0H
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOg-00054d-H0
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:54:01 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOf-0004kv-RB
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:58 -0500
Received: by mail-pf1-x444.google.com with SMTP id n74so325299pfi.9
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D7zmCCEx4gtvzG1BwOiqP1rjcgbsuS/cyN2XMLs4c+Y=;
	b=pgI8ttDajKS8JdLT5zP8lwNM99faP9uZ1tmJloLqdevbf17VZribCRNhvQEzHvSUrK
	FXIkhg5A7/eyj6+Vk7qZ/YvcUx/hwEEFkD6Du1re4JjZWNh2VaeQf/2O1IzZp+OCNMcn
	wNyo6AKgdBMyd8CQmzzMc4IMzxuHGFtaIXBaYEek94et2Y18yNKwfTH59AdMehqQ3s/L
	LnhysVhxbYEff0elORLV56DF4+33hdNvKlbzdJa8BV6wK7GoDprNctp9zcQo8nSOk100
	idDVhTgCdjqf9tAAC/eszmIGnEDdfrEb47mY4YYypqnJtOh3peU6E3BviII3U8yCwMhL
	AnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=D7zmCCEx4gtvzG1BwOiqP1rjcgbsuS/cyN2XMLs4c+Y=;
	b=OI/fwObeL/2db133zx8bY8b0w/BNIYi3v44CBOUo6KeJo2EG+PvewwddQb3reYDRzF
	Lv66m3mFHW8I+bMDrXXzdkKX94hajU+CSBKVjU1MqB9m2QBKBk/SjzvUedoFpg11Gd3K
	yIIfKFWmbe34jcjscPKKmdYU+9oDUX8Y9Qgbgnp1dS9cvxl/tM021l8h2O7BzIet2V02
	q3I8aUeUcPOl8dSxX9bj9w3YENcj8Bn7u0UMh5Iz3agIZo5EFOeo6DovrZcH+GV5dJlM
	m0KeHbYDT2HzTC24iIvVZDkI3U/5hwZpkMTY/Jgm9N73gMD6nECZBwJBTOj7zlmOygpr
	gwlQ==
X-Gm-Message-State: AHQUAubyqJN3jKCi/0mKWGaTBa/3mDgmdBDc9ykeCPTdaVrcR30Tjt9k
	5TPIQCCPiL+5l26MdO9BgvpxXA==
X-Received: by 2002:a63:5402:: with SMTP id i2mr805772pgb.79.1549929218052;
	Mon, 11 Feb 2019 15:53:38 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:58 -0800
Message-Id: <20190211235258.542-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v3 28/28] tests/tcg/aarch64: Add mte smoke tests
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d8DfkgLCpZM9

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte-1.c         | 27 +++++++++++++++++++++
 tests/tcg/aarch64/mte-2.c         | 39 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 ++++
 3 files changed, 70 insertions(+)
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c

diff --git a/tests/tcg/aarch64/mte-1.c b/tests/tcg/aarch64/mte-1.c
new file mode 100644
index 0000000000..18bfb1120f
--- /dev/null
+++ b/tests/tcg/aarch64/mte-1.c
@@ -0,0 +1,27 @@
+/*
+ * Memory tagging, basic pass cases.
+ */
+
+#include <assert.h>
+
+asm(".arch armv8.5-a+memtag");
+
+int data[16 / sizeof(int)] __attribute__((aligned(16)));
+
+int main(int ac, char **av)
+{
+    int *p0 = data;
+    int *p1, *p2;
+    long c;
+
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(1));
+    assert(p1 != p0);
+    asm("subp %0,%1,%2" : "=r"(c) : "r"(p0), "r"(p1));
+    assert(c == 0);
+
+    asm("stg %0, [%0]" : : "r"(p1));
+    asm("ldg %0, [%1]" : "=r"(p2) : "r"(p0), "0"(p0));
+    assert(p1 == p2);
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/mte-2.c b/tests/tcg/aarch64/mte-2.c
new file mode 100644
index 0000000000..2991b7df69
--- /dev/null
+++ b/tests/tcg/aarch64/mte-2.c
@@ -0,0 +1,39 @@
+/*
+ * Memory tagging, basic fail cases.
+ */
+
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+
+asm(".arch armv8.5-a+memtag");
+
+int data[16 / sizeof(int)] __attribute__((aligned(16)));
+
+void pass(int sig)
+{
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    int *p0 = data;
+    int *p1, *p2;
+    long excl = 1;
+
+    /* Create two differently tagged pointers.  */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    /* Store the tag from the first pointer.  */
+    asm("stg %0, [%0]" : : "r"(p1));
+
+    *p1 = 0;
+    signal(SIGSEGV, pass);
+    *p2 = 0;
+
+    assert(0);
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 55420aeea6..614dfcd14d 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -22,4 +22,8 @@ AARCH64_TESTS += bti-1
 bti-1: LDFLAGS += -nostartfiles -nodefaultlibs -nostdlib
 run-bti-1: QEMU += -cpu max,x-guarded-pages=on
 
+AARCH64_TESTS += mte-1 mte-2
+mte-%: CFLAGS += -O -g
+run-mte-%: QEMU += -cpu max,x-tagged-pages=on
+
 TESTS:=$(AARCH64_TESTS)
-- 
2.17.2

