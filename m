Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3478267wrq;
        Sun, 10 Jun 2018 18:22:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI4j1TIKA6/N3BMFKhJtd/qRArmbw74EdmNUb/yoYIJnXj+wk/icxGJlpyd8WdpJzLKMpmC
X-Received: by 2002:ac8:191d:: with SMTP id t29-v6mr14916665qtj.264.1528680157468;
        Sun, 10 Jun 2018 18:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528680157; cv=none;
        d=google.com; s=arc-20160816;
        b=nts25AKhLDt1FHNw4+ppUS9XzdneR168yoPHhasXCUYiMQIjWwIrYSZfdoqJhbP1iU
         T2aL3gFrgVNXsMc6PG4GmZaBXLspYSaCjLDg5lPvnLPxX3A9MYUbkWFJ6+lb7qkDY//2
         3b07IZdM3XTaEoIIFHsVdXhehtaySplowZ0Zp2qJmfyAWc12PXzIfH9SVfTswZynp+gr
         6Vd1/Yw8gJtH05lkGAk/UdbuYhYA4jn/r1vK0HCf1qa0kHYY+Gr+6r9faZ5QFyRZ8r+7
         HqczVPm31B/jocslhWc+TWamHteIjb3aaZWjfCCBxItsyU7XmXNJEwl8K7xcfKwklP6j
         cSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=CHj5nEG5wdEZBDfB0EoC2/TWxMav1mdYMU70/zVl+Wc=;
        b=pSd0B+T8LrGXlvY69Kc+AZcwCRVPBmwc8iLpzj2AVD1OYTyiVFtsxmT3hMy8c56tuR
         Zep3YYiIVuK8AxC1JZzfZ8/k9iK7zWV3HGiCG9k+WQdjrQLi2LnVj0evm9VG9OjWPWYM
         TmYO4yrMfmm/l1nxAKjP7zeA5wBmdSqiDc7eoLeG4iiUxNe0wWely+W0k9lF3tbZz65/
         0YbB7KIv9b4qvsQqiKRDpT0si5tOUlx8lxKL8Km2CQ/jnixTz06kdAKNNq4J13BnswFd
         nvD3s0MMupt8HKNtB+XWmfV8A0uAfTP27ILIcd9Rke57zEJRurRdnpXb741SopV+0Efz
         MkGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RmMViC/B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v20-v6si462810qvj.27.2018.06.10.18.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Jun 2018 18:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RmMViC/B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSBXY-0001R8-Sf
	for alex.bennee@linaro.org; Sun, 10 Jun 2018 21:22:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBR0-0004oG-Lg
	for qemu-devel@nongnu.org; Sun, 10 Jun 2018 21:15:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQz-0002aM-KS
	for qemu-devel@nongnu.org; Sun, 10 Jun 2018 21:15:50 -0400
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:43729)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQz-0002a0-FZ; Sun, 10 Jun 2018 21:15:49 -0400
Received: by mail-qk0-x233.google.com with SMTP id g126-v6so12065060qke.10;
	Sun, 10 Jun 2018 18:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CHj5nEG5wdEZBDfB0EoC2/TWxMav1mdYMU70/zVl+Wc=;
	b=RmMViC/B0BSufcZiPL2w5n2k/Ckezsyd6BFoHolYCcgGb8lUqMTHUmqVB6t+dYKu5h
	3sNf/PIDrZeup+9td5sSNl+LNxXtvP6tBE0GDECu2lyWJ0sKYDDVC7QJEHeTCmiiO0w7
	3SNfGqZA1MY8cK4VlZ4SHtNqh3ONTA7DzR2nS058WPAQqURnM5ojuZK3Rvz0DlRO0ga8
	Ektmx2gDMx6ZxKqdXUxHWtMZt8967iI/85luBt2Nsanp9jd0EMux4ORlbIF02JylVQ53
	CQebMzEQod5RymLJS3ufg8irNHdnP9uDp+DmgupwNnmTMDppaX+vMQztdJR6P5goT495
	A3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=CHj5nEG5wdEZBDfB0EoC2/TWxMav1mdYMU70/zVl+Wc=;
	b=X2UKgj6Xw7enHc4NGuI+XSvsfkDyCxSzCviYwAVxfeFr6SZQ9t3LPzPWuh6vQkwMCL
	l4042gkJcNb55uoI48sIBvDWq357UWYqKV1gjSENCmCOGfU4qMSKqL9Pyuf4GsrfL0Ns
	HTPNHIiufa/6TwU5+6dGVyKtt7nGrZSxPNLXubfrInYI2VvME4BBBi/E2dhXzEO0kNyc
	YHlq3wkAOjC3mTsAyQ/5qOoOXaULu7u5Nzx6U120s9fAAYAnwU0LnwkAPVYWG/IVUMhP
	+VekoOu/dKOJhhHFR9W8x4bQY+1XFcIl8purkJpe79evMqM6CIU8cZAZKoknCaNjcQVh
	gy3Q==
X-Gm-Message-State: APt69E0p2BgjrkLUfflB3gKzFTTpfD0Qs4/IdHDgwIpv8OHDT8jFFsqh
	cZ7iJ8M5eIGJyEhnLFbRMuw=
X-Received: by 2002:a37:285e:: with SMTP id
	o91-v6mr12743336qkh.129.1528679748979; 
	Sun, 10 Jun 2018 18:15:48 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.15.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:15:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Sun, 10 Jun 2018 22:14:27 -0300
Message-Id: <20180611011501.10235-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::233
Subject: [Qemu-devel] [PATCH v4 06/40] hw: Directly use "qemu/units.h"
 instead of "qemu/cutils.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kadCh31Y/otx

These files don't use anything exposed by "qemu/cutils.h",
simplify preprocessing including directly "qemu/units.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/msf2-soc.c  | 2 +-
 hw/arm/msf2-som.c  | 2 +-
 hw/core/machine.c  | 2 +-
 hw/display/sm501.c | 2 +-
 hw/mips/boston.c   | 2 +-
 hw/ppc/pnv.c       | 2 +-
 hw/ppc/ppc440_uc.c | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 530e461c42..edb3ba824f 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -23,13 +23,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "hw/arm/arm.h"
 #include "exec/address-spaces.h"
 #include "hw/char/serial.h"
 #include "hw/boards.h"
-#include "qemu/cutils.h"
 #include "hw/arm/msf2-soc.h"
 #include "hw/misc/unimp.h"
 
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index ed533bbde1..2432b5e935 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -23,12 +23,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
 #include "exec/address-spaces.h"
-#include "qemu/cutils.h"
 #include "hw/arm/msf2-soc.h"
 #include "cpu.h"
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index ccf3a4b9c7..2077328bcc 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/boards.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
@@ -19,7 +20,6 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/numa.h"
 #include "qemu/error-report.h"
-#include "qemu/cutils.h"
 #include "sysemu/qtest.h"
 
 static char *machine_get_accel(Object *obj, Error **errp)
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 1c6c9445c5..bbb9274886 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -24,7 +24,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/cutils.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 512c60c03e..b7bfeccf4c 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
 
 #include "exec/address-spaces.h"
@@ -32,7 +33,6 @@
 #include "hw/mips/cpudevs.h"
 #include "hw/pci-host/xilinx-pcie.h"
 #include "qapi/error.h"
-#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "chardev/char.h"
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index bdb6f63d2c..0df4a4fd74 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/numa.h"
@@ -31,7 +32,6 @@
 #include "hw/ppc/pnv_core.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
-#include "qemu/cutils.h"
 #include "qapi/visitor.h"
 #include "monitor/monitor.h"
 #include "hw/intc/intc.h"
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index b5b31b4b9b..1ab2235f20 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -9,8 +9,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
-#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "cpu.h"
-- 
2.17.1

