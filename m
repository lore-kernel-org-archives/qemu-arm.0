Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1945843wrq;
        Sun, 10 Feb 2019 17:15:12 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ2/NA+6JJCiby1ayESo81SKKh0ghSRN12MZf16MJx5Xl2AixQrDOA1clF+EbW+GY0h3tWm
X-Received: by 2002:a5d:414c:: with SMTP id c12mr24530645wrq.204.1549847712688;
        Sun, 10 Feb 2019 17:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847712; cv=none;
        d=google.com; s=arc-20160816;
        b=OqzJdgjfyiTbRf+3wPtv8n6DP3/DChrGe2bc3yf70Q6g2Vf9Rja3EE4TfBdehYH0C6
         beqjl4w4M8PmyNlftP4h+r4N0aE8wknPLvNywfx2E7GTlwilbQGCU29IYKcU2CLJ5kr6
         b5JEBeMF9VzH7FOi3jH4KcuGhZbLZLHa9itgnO6HuV4li1o89xbSdnneWoALFMySnZtz
         HmhnskBj3K+kEls9ihCRDx3gVfcuwvYTE0/VKRjrDDKFuVKAs5vTIpnZ0yfCZyTPrRUd
         HJX+5+eur9qEdVAA+mr1m1K5bkFS9+J6FMCCRQ5ye0xHrcH5ySJHf9lqNSVvzO5QHewV
         cSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=UEnsVDtpBAmvsaSmrhCYvPqLmi/uP/YwCQYnlJNxoOc=;
        b=QJk88ig60YsoU2VZGpgh7PetWb82hWWxSOEcaSAvnVaIVTmXSPxIsW+gV5oKD24UAW
         Kmg6zI4uTvg6MEBE7Nlo9rHw1eYrcmSApkGxoT2Cs0W92S+giFSi6Xl4nCEgGHQ+Zrkz
         /Us19jd4h08/xciHduzt4XhjQnbpLe2aQM4rEgzP5waZtXseBqJoE2shLgBmho5K9XkZ
         Gdb+/olZT8wqdOfn0LU78psPER45zfvwv8wNBkHPD9SQE4F0F989FAHqcZtR8g9cYiaR
         w0xkagbhYjJVBq0/A4kDKkMvqIsERen9qcMJxOu0vz5Bk4QG9/ffV9teie/l9rQVGIc1
         wUug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bOaQpOpN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si7678191wrs.108.2019.02.10.17.15.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:15:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bOaQpOpN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0Bj-0001nJ-MA
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:15:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05w-0005xT-8k
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05t-0000Bj-AV
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:12 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42318)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05s-0008WK-Tl
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:09 -0500
Received: by mail-pl1-x644.google.com with SMTP id s1so4492707plp.9
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UEnsVDtpBAmvsaSmrhCYvPqLmi/uP/YwCQYnlJNxoOc=;
	b=bOaQpOpNLY6zcJiw82mU4pcKXm3v94s4AVXRxplmL80v+w2cmLm/kprM+UOvezfQyf
	IO4KOzg6HBnabCIW5HpxVAFb9W0/hchMeX/c8ceyk8WCaNSCvs2iuiwdtibAMrcE2NNP
	qPtC6zCyGCHHxjAzxYFVUU7VzcQjFv4cNNFyL81MfHBwxZLRBOscilwvSEaP/dliFY90
	yaHT1qJmBA7SHdpjM1pcmAA4N1Jk7PU53Y+fsGfQk1FlUuM4hGHp4vuNauqq49Kimpsd
	Phfhy4en2E/KHPnUWK5Lb+h3bcWFIo7+OvOl6nBJXju9E3aSEvRv7NGnjJASpIN+C6X2
	q+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UEnsVDtpBAmvsaSmrhCYvPqLmi/uP/YwCQYnlJNxoOc=;
	b=OHS9Vn/UCGx1FFri2Ce/CebRHYSQqGNElkR6X4UDxSiL39IGVAUSKJE4wKGhW7XSCU
	sKTuvYJPkC4sW0cULXyiDFZNPZIqSUTFCs8QfzXhhnYRJFTjjHfY3zZDVJc76spe4HIS
	SX3YiiuWaXKf/F4G7H4fKVf516zzY3S/Gj3q/VidIHIgYKOI5SWxDQNG7DInxT0CEn4Y
	ehEOW+w/hLH7NMrQz7gfSKXfk/fR0I3NHGPLqc8waZFkx50XtnWz7JakfwFdEUZ1Hfg1
	uZZYtIgs8IVJGW1PXlP27D0yyzrr4hA6dErM3ViD5noJXCWmn0s36Tw6+MbTkULni/HG
	mbeQ==
X-Gm-Message-State: AHQUAuaCeWqvmw276Qo8CLyMwwXQD7THGNhwAS2XSmTq1BxjCpf6VcB1
	dvAMYM96cROAqQrteC4/5xuE3kxP4x8=
X-Received: by 2002:a17:902:e090:: with SMTP id
	cb16mr20567890plb.32.1549847345484; 
	Sun, 10 Feb 2019 17:09:05 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.09.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:09:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:29 -0800
Message-Id: <20190211010829.29869-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v2 26/26] tests/tcg/aarch64: Add mte smoke tests
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rvgHzajXPGNp

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
index 0000000000..740bf506f1
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
+    asm("stg [%0]" : : "r"(p1));
+    asm("ldg %0, [%1]" : "=r"(p2) : "r"(p0));
+    assert(p1 == p2);
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/mte-2.c b/tests/tcg/aarch64/mte-2.c
new file mode 100644
index 0000000000..4d2004ab41
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
+    asm("stg [%0]" : : "r"(p1));
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

