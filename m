Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2453577wrq;
        Sat, 23 Jun 2018 21:23:06 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL0xMEhrig4rsgcEgsiZXX9WVIev6cPGD6KBIRfV5WJaV+5wVfklkCfsCCYnJi+rOSmGWkO
X-Received: by 2002:a37:b704:: with SMTP id h4-v6mr6707936qkf.398.1529814186159;
        Sat, 23 Jun 2018 21:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529814186; cv=none;
        d=google.com; s=arc-20160816;
        b=DwpAEtM+vJOByyFHL5pigg5W6ZOO9VIdgkgyAjn1gYMmxiqINrtIweS0ga1dW1sWQj
         R1mO986FcB9kGcutfF5qK7fS/GAX6wIFwcIPTzd/uDqH/8aMujxApMhhSaoX6Duw1bwm
         4tN9CfcN6VxrlJ2ZpeJgSapEY/WdbHMuO0tDB3i7T6Rdtlym9/Nn+MqMz5+3Zgiu9tk7
         K99zZ5MQkJ6/iCUE6acoMYu+zg28O3imUQbi+O7BrDRR/a+MZAS77c8CZSmdoCXcMb3O
         i7oGSocdPAi7SQn6QOdo+EtkbffF5gDXGQHULmz2nqaFmu5ouEb7SEd4kiU56CTxLMjS
         aLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=lC2KgKibY6az3lIzgB/X94MigFbMELVxcth2+cI2ggM=;
        b=YBOXqwlVeNqDDpx3sB1jZHo6isezD/mAS/o5pqgXZqB8+9VJgERL6hOO/0TkZz+zKv
         7KDyrRSj32FprcMhSBA3O+w5NJNSbjPndld8OR7yfVwJfA4Tz7h9PdfgW/WBXQkXT19R
         T8SYWa+r3OenTR97gn4Wdm7aC78RkZH1BBisp1d+3xrQGGAhUqoltIqsUK0M528sOLSB
         nvLquJzMs/9TDbGarx9dOKQ8H0xBXIQXbRsKXJbYgeCLXvpEmmnWlsde6pis2Qh2QtIz
         KmVkf97xmRJhpsjEoq0Kal6GVcU0NLz68NadzaTEMV8ek+F7rJXnu9NSdqUaU7PvJca2
         lOuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OUMgvQMw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5-v6si134867qtj.203.2018.06.23.21.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OUMgvQMw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwYL-0007Y5-NS
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:23:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIe-00044m-6s
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIZ-0003yk-F6
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:06:52 -0400
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:34952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIZ-0003xb-Aw; Sun, 24 Jun 2018 00:06:47 -0400
Received: by mail-qk0-x230.google.com with SMTP id u21-v6so244215qku.2;
	Sat, 23 Jun 2018 21:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lC2KgKibY6az3lIzgB/X94MigFbMELVxcth2+cI2ggM=;
	b=OUMgvQMw9RpMKChPiX/VVg+Uc2Y/7lzD8IUGIpsg5tQBM9TWGz+lUG4NdCQvASNc3a
	W89DO8qCeyrApzUlc+hB7W4a4O6m5lDK9BRj1lirop8FH8bacJplXZxeE16ceHubapKm
	0p5s6obvEutfdVmSO9qssfOfpS/ej2lTWVQoSTaNsq1+jFp7llHuyRoMiXR6K1JMjK/e
	NZoBUMM/QzwfZPFOi1p7AJw6DZPsfJSTFeo66iOKxDK7ShvJBdJLXZyxjyQowRdmxxQC
	wG0FEWfVRShsPsa1206h8Vs3hQpmRO2KQ+QWUPx7IyTe7/SmG1fmorl08/8uXQM+gjLc
	tP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=lC2KgKibY6az3lIzgB/X94MigFbMELVxcth2+cI2ggM=;
	b=S+UMVyYyBCo6qWpBKb1V2cPpIKoOP+Z6qA7+Y01uA8OR/ni8A/tv1vi2DIdlOFqbp6
	HJdHRDf6wgCV0DxwR2BEsGhjBBomP9lVwxn6oX9mxiXw0Dr6+lsIzOlS2bI055uTpGd2
	kyHTGBoafub4nVMHuk2TtR2lx6VmMnRYzhbU+kUeWga8jxbgiA1orYy/vSiLkbQWt22Z
	mw2NWJrsPgf+2pAQ58jfPGt6WAVP4QPKrvYWBguUbJn0fjjRBWxt2RPHYRcKgIKtFQtX
	RayrD/nexMLduX5/goBFUJj0WIBQwAreYfiS+n8v+IkApPA/j6qVPcfKMFXYiFLIJ8cl
	j5EQ==
X-Gm-Message-State: APt69E3d7aMqfRZ+uNo/mRr9xqBlXABwzWLyceEdCHtmErbAvu5CYb8W
	IgRuCOyHF46lWjm0FMJfl3Y=
X-Received: by 2002:a37:a4d1:: with SMTP id
	n200-v6mr999491qke.348.1529813206815; 
	Sat, 23 Jun 2018 21:06:46 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:06:01 -0300
Message-Id: <20180624040609.17572-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::230
Subject: [Qemu-devel] [PATCH v3 08/16] hw/arm/omap1: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RMBP2JYslHeN

TCMI_VERBOSE is no more used, drop the OMAP_8/16/32B_REG macros.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/arm/omap.h | 18 ------------------
 hw/arm/omap1.c        | 18 ++++++++++++------
 2 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index b398607b06..39abba753d 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -993,24 +993,6 @@ enum {
 #define OMAP_GPIOSW_INVERTED	0x0001
 #define OMAP_GPIOSW_OUTPUT	0x0002
 
-# define TCMI_VERBOSE			1
-
-# ifdef TCMI_VERBOSE
-#  define OMAP_8B_REG(paddr)		\
-        fprintf(stderr, "%s: 8-bit register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
-#  define OMAP_16B_REG(paddr)		\
-        fprintf(stderr, "%s: 16-bit register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
-#  define OMAP_32B_REG(paddr)		\
-        fprintf(stderr, "%s: 32-bit register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
-# else
-#  define OMAP_8B_REG(paddr)
-#  define OMAP_16B_REG(paddr)
-#  define OMAP_32B_REG(paddr)
-# endif
-
 # define OMAP_MPUI_REG_MASK		0x000007ff
 
 #endif /* hw_omap_h */
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 9af04728e3..539d29ef9c 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -34,12 +34,18 @@
 #include "qemu/cutils.h"
 #include "qemu/bcd.h"
 
+static inline void omap_log_badwidth(const char *funcname, hwaddr addr, int sz)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: %d-bit register %#08" HWADDR_PRIx "\n",
+                  funcname, 8 * sz, addr);
+}
+
 /* Should signal the TCMI/GPMC */
 uint32_t omap_badwidth_read8(void *opaque, hwaddr addr)
 {
     uint8_t ret;
 
-    OMAP_8B_REG(addr);
+    omap_log_badwidth(__func__, addr, 1);
     cpu_physical_memory_read(addr, &ret, 1);
     return ret;
 }
@@ -49,7 +55,7 @@ void omap_badwidth_write8(void *opaque, hwaddr addr,
 {
     uint8_t val8 = value;
 
-    OMAP_8B_REG(addr);
+    omap_log_badwidth(__func__, addr, 1);
     cpu_physical_memory_write(addr, &val8, 1);
 }
 
@@ -57,7 +63,7 @@ uint32_t omap_badwidth_read16(void *opaque, hwaddr addr)
 {
     uint16_t ret;
 
-    OMAP_16B_REG(addr);
+    omap_log_badwidth(__func__, addr, 2);
     cpu_physical_memory_read(addr, &ret, 2);
     return ret;
 }
@@ -67,7 +73,7 @@ void omap_badwidth_write16(void *opaque, hwaddr addr,
 {
     uint16_t val16 = value;
 
-    OMAP_16B_REG(addr);
+    omap_log_badwidth(__func__, addr, 2);
     cpu_physical_memory_write(addr, &val16, 2);
 }
 
@@ -75,7 +81,7 @@ uint32_t omap_badwidth_read32(void *opaque, hwaddr addr)
 {
     uint32_t ret;
 
-    OMAP_32B_REG(addr);
+    omap_log_badwidth(__func__, addr, 4);
     cpu_physical_memory_read(addr, &ret, 4);
     return ret;
 }
@@ -83,7 +89,7 @@ uint32_t omap_badwidth_read32(void *opaque, hwaddr addr)
 void omap_badwidth_write32(void *opaque, hwaddr addr,
                 uint32_t value)
 {
-    OMAP_32B_REG(addr);
+    omap_log_badwidth(__func__, addr, 4);
     cpu_physical_memory_write(addr, &value, 4);
 }
 
-- 
2.18.0

