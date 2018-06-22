Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp854864wrq;
        Fri, 22 Jun 2018 06:49:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ+i/rOKnvcVqzF/L03ffklf0DPWW7MvgosESYw+tH2DXglQTAgxuUfyZBzseQH4Ssbipc0
X-Received: by 2002:a37:d493:: with SMTP id s19-v6mr1350840qks.338.1529675340087;
        Fri, 22 Jun 2018 06:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529675340; cv=none;
        d=google.com; s=arc-20160816;
        b=ERZ29iuSuDIO/vXG05+OxnOGbfc5tjQ8NZ5gDUq+JUlrnuZfnbh39TaP0T+Rd72I/3
         y6bgtpotgDSH0Tvmml2YXf1Iwrn07Cai8NuwTzTtd8TJJxCeJF0jDhkOns2n1inlIx46
         r9DHubsN9Muhk+wWXi7Cw4ns5izq3Dqf+7xx65DNGhEgXa/TQ1E3ATa6nfWJk+vIB8uF
         LDIzhHi/GQ0WWS1AZefFH8zrLTBajyLC/3rHBbsPf2942afqxpil0I4Mexu5esMB/EA1
         uA4yB4lAScXQRbjEI6/LhLdEsGYBgq43QMN0eDtv8uCUIY2swIR7VrkPCNLfUtTBMtyT
         xdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=0mutGa0sDmrzFg5daZsr8Rt8Y88n2i/QbM/UUL4yJrc=;
        b=qq28NFA9grR3E+RC9R5LvZ9WOn5NnUg+i4Fd3ylTHsq921sY8CVxBucqR+f8PAPJCV
         SgPrRW7EjHgcg+BB670EEAnQVTKOonKQ4whkoOAKsCSbG8vvo37Cjfy3ooehd/ROe6f/
         mxcebceM+vYC6hyPgZuYNvnE5/4Qj2VZ4Kf3UcA/P7bi2OeU0+U0GTprZ+5O9aLyZ11y
         BA/2YO0yVMvRrgCVr0txfo7HyUOWdAykQpXfBpZthN0Gms0Z6eQlz7FWJanJYbhiniHc
         0bxpTXy/uZ33IebJMIqvLY5mC8q/CNlMicSEXggdlCl4NW13AjrAaU6/xgfETtadm9cy
         sV8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aDSkZroW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p38-v6si146323qtj.190.2018.06.22.06.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:49:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aDSkZroW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMQt-000401-AB
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:48:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJH-00067b-23
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJD-0003Mn-Bs
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:07 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:47057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ8-0003AW-QE; Fri, 22 Jun 2018 09:40:58 -0400
Received: by mail-qt0-x243.google.com with SMTP id h5-v6so5888896qtm.13;
	Fri, 22 Jun 2018 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0mutGa0sDmrzFg5daZsr8Rt8Y88n2i/QbM/UUL4yJrc=;
	b=aDSkZroWWSODVCXrLp7bVTWLYCuA+caAGKpgSKO/3tWUBDbgPkIK2gLDIU72FjbyK4
	rP1IxC6p0a/nkqvV96tIJCu0L21jK6MPuECfMe7/eo2iuT7zoTSShSZWT40JCnCuDCRN
	UqoUUrM3WNH4JCV7f6JyCKsu1vBfKi6H2hktmW8ord4KF33Z2nGGvy3bVeIFaybMGfPQ
	DrSACd1eQeHu0O+5GoFQeRdtaSJHBSDCHeu8pqTlWaFyZwGYJg5e++yUaNPQOTF3sQXO
	8+LGgwsQy/1O2fls/CukZRTClmAmC2Ii5Y4heJcilBkY6Dt6ydUHgdRZeiXAWFKT5w5S
	1T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0mutGa0sDmrzFg5daZsr8Rt8Y88n2i/QbM/UUL4yJrc=;
	b=hwh8Kdu43BfFQfDybZbywI5XDtEhZH6WWcJsrqtwdrwNS/D+nN6yjq/bsYh92YaRxB
	WZezwyG9mNh6LwjxgTKmT0FONF9iar1/6SjUK//pCEj93WdUFSwUEBmJhTO9kleZHdHY
	LnHiZA57S55R0J8iAh/kAaFJlZGGCRMozrarCPX9qauQ/buYRZ79y3PlZp/XutRUAYWt
	oPQU4E56T6/PByU8dpST4QMlhnvq7agGA+Ps9AUml+VjThuidX2lYoW+sduOJq770yzG
	bEgR71Y2H1P4HA0pqWzGsTEq3sDeC86IWFBeSHbyeA8ryN4tPoOs4XiYsWtqSmKCS8EU
	yxWw==
X-Gm-Message-State: APt69E0YY3fxWGPGsDL0HOT+iWh8CD5mgZad4cJM7I3rDgkr91ABGjoj
	wVBGhg1cn4iyjJhliwG3VsQ=
X-Received: by 2002:a0c:f54d:: with SMTP id
	p13-v6mr1404371qvm.149.1529674858134; 
	Fri, 22 Jun 2018 06:40:58 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.40.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:40:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 22 Jun 2018 10:40:27 -0300
Message-Id: <20180622134036.23182-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v2 05/14] hw/ssi/omap_spi: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
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
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7MVj67g0fhIq

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/ssi/omap_spi.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index 34163e5646..f278a55160 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -20,6 +20,7 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
 
@@ -294,11 +295,15 @@ static void omap_mcspi_write(void *opaque, hwaddr addr,
     case 0x2c:	/* MCSPI_CHCONF */
         if ((value ^ s->ch[ch].config) & (3 << 14))	/* DMAR | DMAW */
             omap_mcspi_dmarequest_update(s->ch + ch);
-        if (((value >> 12) & 3) == 3)			/* TRM */
-            fprintf(stderr, "%s: invalid TRM value (3)\n", __func__);
-        if (((value >> 7) & 0x1f) < 3)			/* WL */
-            fprintf(stderr, "%s: invalid WL value (%" PRIx64 ")\n",
-                            __func__, (value >> 7) & 0x1f);
+        if (((value >> 12) & 3) == 3) { /* TRM */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid TRM value (3)\n",
+                          __func__);
+        }
+        if (((value >> 7) & 0x1f) < 3) { /* WL */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid WL value (%" PRIx64 ")\n",
+                          __func__, (value >> 7) & 0x1f);
+        }
         s->ch[ch].config = value & 0x7fffff;
         break;
 
-- 
2.18.0.rc2

