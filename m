Received: by 10.28.173.206 with SMTP id w197csp3158476wme;
        Mon, 8 Jan 2018 18:01:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBovUwmB48X9ift4Fw3o89BfqZhHIojLVN6LAgCVD3sl2jvg0+0DkX5Z6il6uNwiRJEP4yJKW
X-Received: by 10.129.118.82 with SMTP id j18mr12432475ywk.420.1515463300797;
        Mon, 08 Jan 2018 18:01:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515463300; cv=none;
        d=google.com; s=arc-20160816;
        b=RYbjHghJMJ2oeNPKKpeWySpP1M6uX1Q3er6zmCRMM/SRI+w0wrzB1OXLXkTaL0HYtu
         fYyh8FUJuNK1f+pO0gFpywxwq96VKbcU/CSurMgBpqPcWPSAefwet9dj0nqC2f6dZvYN
         CfZSzIMIiuoqJvbIPm59H7wwfEGc1281Ryd9dA+VGlApjesZB87CeX7PCKiqvz7QgmXn
         RFHOA/gKkca3xyBYlt9CwvmN7qLCC87x/MGNqAC0h/WhheOr4QsppImphKBXzchFxvZD
         PywRhpmNQPGgvFCHfGPUgcpHh/M8JYJmAeupnep1SzvX8x1Rir2vRlYZPI4RfzTGXWU/
         +s6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=R4pEobxl0D6UTaKktHeyRPrZFv/lWkXEYDX+mhCbmCo=;
        b=Cq8VzxMZFjMcIwd7S/LOGN2+0HTtN7L27s1qZFZeWIkqcmGlFh6zyvkT8mC61+3dDf
         jSkB5Cf8rLRxktmQxYkmA2eGmRvbL6p9oomHJqOGa77EFf5ArLolbQ2lMhYalcYcLEbL
         gmseLp+Wnsz6sc1v1mDcJPRxWhCaqbXWm7muOEvJ3o6sob2K70Uy3fwtLFuzf+byuEzU
         DQwqUZORGKHrVdWMw2nApGxnMDdvZUd+miiL8ZVxk749GYjwlLt2Dp7qSdzcCPFL6iuU
         REGCMZ6mDGtZlsKq/vngVCiSxgvbBTMarDkzgzP1s2b9QVUQcDkMQcGuqvARhvjRLJVn
         heiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xse4pz4E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p1si2764110ywl.380.2018.01.08.18.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 18:01:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xse4pz4E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYjES-0001qN-5y
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 21:01:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEC-0001oA-Bz
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 21:01:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEB-00025V-GI
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 21:01:24 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33800)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjE8-00022S-L9; Mon, 08 Jan 2018 21:01:20 -0500
Received: by mail-qt0-x242.google.com with SMTP id 33so16097153qtv.1;
	Mon, 08 Jan 2018 18:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=R4pEobxl0D6UTaKktHeyRPrZFv/lWkXEYDX+mhCbmCo=;
	b=Xse4pz4E+ZkC9bR3l1JbKsBQ8yQLxG1WEEbkyilc9QYIvsoCxeABOlhfZuuCjaXzW1
	91bVEdCKeMW2BiXV3undneo0+vCcuZPuyoQ8t+S+OHBsMHKnOx4URflWjvbIocOQEUre
	+HAZSmP/ULim+pm45cvrwrENd/3ptGqCXo6i3h5D4/krpTYwlTB/xncQvnbsKjiFl9nj
	3stxZJpLQkg19A9l0Tr1eS7uNR22+H3Bj7Fzb3f1HBuQE6q3c4kUjoAs34xcMnR9yE6r
	wwjpjYP8GEXdee7+/QvSVV4IrjKjNkL7Gqn004PW8U7xwROdLupfBWtisd5m71gyf/MO
	h6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=R4pEobxl0D6UTaKktHeyRPrZFv/lWkXEYDX+mhCbmCo=;
	b=j9dI0tf4OuVOH5Cql4goak+01luygIFvmExeveBZCr1JL+VYN6kpgkQPQ72oN5NLhw
	I6mAG3kEImC6aeOvj9xrSUHk+xlg+jITT+x0sNRQGCGtuXLMkidzwNg4lFJtzU4LykhE
	h9uaxSi3H3kY3I4Mzfbd2N2/+LQMxdOc/39frivPQoA6LYr1QH06GUrMbHLhofm86OTy
	T8dZLph1KVyG3MIlWotlp6WX78TSs6RM2BwbwbVvKefc5cwna0iP4X7P0LUtqRxLQgoJ
	HwMKWTIC2ulgk7FkyJK/RHJUxCFo2yPHUel6D4HfGZu001b7ENCYlTxoNfpVky4NdYvM
	iNhg==
X-Gm-Message-State: AKwxytfbDYxuRRmV306HOBgpO/UxIryoISc1ezg7SROKMWmdJfIyKFxs
	/c2iLspCwnftccdn4+zlZnI=
X-Received: by 10.200.44.35 with SMTP id d32mr17933061qta.14.1515463280027;
	Mon, 08 Jan 2018 18:01:20 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	r22sm8605027qtc.71.2018.01.08.18.01.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 18:01:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Mon,  8 Jan 2018 23:00:46 -0300
Message-Id: <20180109020054.32553-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180109020054.32553-1-f4bug@amsat.org>
References: <20180109020054.32553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [RFC PATCH v2 1/9] hw/sysbus: add helpers to register
 FDT aliases
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KFKRc8iZXvac

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sysbus-fdt.h | 18 ++++++++++++++++++
 hw/core/sysbus-fdt.c    | 30 ++++++++++++++++++++++++++++++
 hw/core/Makefile.objs   |  1 +
 3 files changed, 49 insertions(+)
 create mode 100644 include/hw/sysbus-fdt.h
 create mode 100644 hw/core/sysbus-fdt.c

diff --git a/include/hw/sysbus-fdt.h b/include/hw/sysbus-fdt.h
new file mode 100644
index 0000000000..21f42dbbad
--- /dev/null
+++ b/include/hw/sysbus-fdt.h
@@ -0,0 +1,18 @@
+/*
+ * Flattened Device Tree alias helpers
+ *
+ * Copyright (C) 2018 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ */
+#ifndef HW_SYSBUS_FDT_H
+#define HW_SYSBUS_FDT_H
+
+void type_register_fdt_alias(const char *name, const char *alias);
+void type_register_fdt_aliases(const char *name, const char **aliases);
+
+const char *type_resolve_fdt_alias(const char *alias);
+
+#endif /* HW_SYSBUS_FDT_H */
diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
new file mode 100644
index 0000000000..0d817ba230
--- /dev/null
+++ b/hw/core/sysbus-fdt.c
@@ -0,0 +1,30 @@
+#include "qemu/osdep.h"
+#include "hw/sysbus-fdt.h"
+
+static GHashTable *fdt_aliases(void)
+{
+    static GHashTable *fdt_aliases_singleton;
+
+    if (!fdt_aliases_singleton) {
+        fdt_aliases_singleton = g_hash_table_new(g_str_hash, g_str_equal);
+    }
+    return fdt_aliases_singleton;
+}
+
+void type_register_fdt_alias(const char *name, const char *alias)
+{
+    g_hash_table_insert(fdt_aliases(), (gpointer)name, (gpointer)name);
+    g_hash_table_insert(fdt_aliases(), (gpointer)alias, (gpointer)name);
+}
+
+void type_register_fdt_aliases(const char *name, const char **aliases)
+{
+    for (; *aliases; aliases++) {
+        type_register_fdt_alias(name, *aliases);
+    }
+}
+
+const char *type_resolve_fdt_alias(const char *alias)
+{
+    return g_hash_table_lookup(fdt_aliases(), alias);
+}
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index f8d7a4aaed..f56f0755a5 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -11,6 +11,7 @@ common-obj-$(CONFIG_EMPTY_SLOT) += empty_slot.o
 common-obj-$(CONFIG_XILINX_AXI) += stream.o
 common-obj-$(CONFIG_PTIMER) += ptimer.o
 common-obj-$(CONFIG_SOFTMMU) += sysbus.o
+common-obj-$(CONFIG_SOFTMMU) += sysbus-fdt.o
 common-obj-$(CONFIG_SOFTMMU) += machine.o
 common-obj-$(CONFIG_SOFTMMU) += loader.o
 common-obj-$(CONFIG_FITLOADER) += loader-fit.o
-- 
2.15.1

