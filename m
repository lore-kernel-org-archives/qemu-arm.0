Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2310775wrq;
        Thu, 21 Jun 2018 11:09:34 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIeBwXm9Ix6e1f3XnYRQB44M8K33vk/pA/FtbOZBVL84xZxm+VZcPIgjlhVIWeXOmpq4T11
X-Received: by 2002:ac8:3251:: with SMTP id y17-v6mr24222543qta.86.1529604574247;
        Thu, 21 Jun 2018 11:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529604574; cv=none;
        d=google.com; s=arc-20160816;
        b=B/FYZAsFsQxYklwy3l1+6DnaPWQQIi7QEjPnb0TXsSBlsWFGTmNzE0/31wptcssra6
         hQY7a7KDMKLH+WQHgNH5uZCxkO+8Pje40+PYv+77CXtHm8NUQSp0fDF72Wt4s4FOivT5
         8AWKEwcw4CyhE0aVgEamoh7NDa+elOD6Hm9jBNn5g1mjyTOdrEoFGVmKfKs8zNZ5FrNb
         0Da+RfSYDFBY6QilGUTHJap8XMPByLHTDRH+nR25CHF2+AvHHLSleGfOIZtLb+WccsMT
         ayE+u1MCwXNLn9GulpReRNqSlBKy3NSlqYiTjfZxiAroFgFYzpFwpOZJe5s7cqDxIJSX
         y0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=P2cGOMv5XASCs/xIsDsvutILn8yhZDT+T0Q4s9XeIZQ=;
        b=Z7pcgRzafDIoWLWBJPxIWUfKg9zJFui3CZkKNX4i2IpVifyeOOn3yx+F3CHFHfCRFB
         VB9sWFAQzoN0K0O8WEv5+aPH2fzQEe07qNnSD0yN78blxUlkJs6V1OdJioOJkK7eOX0b
         O42owIasn7l03cK3OktJX18InELdBEENGaXNKn3oU1x93BhF12XI+2+7pHQqFQaaP1hM
         YUsM0vbiOOfAOhpySDOVTVWV8Q5Zs5wku6YPj/ml3Th9qNCfwENj2ka8Ouzj6QA8mnYy
         57w7htgxKqlFFeB3owekolhJlNVh9vOaA8Yry24XX1RN+iih1JEAxWgXiJyqmcFlRAjw
         Fvdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="XSV/S6tW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2-v6si4441876qtj.249.2018.06.21.11.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 11:09:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="XSV/S6tW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW41V-0005Bl-Ma
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 14:09:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v7-0000dI-OX
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:02:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v6-0006ZJ-MF
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 14:02:57 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v6-0006ZE-HO; Thu, 21 Jun 2018 14:02:56 -0400
Received: by mail-qt0-x241.google.com with SMTP id o9-v6so3670668qtp.3;
	Thu, 21 Jun 2018 11:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P2cGOMv5XASCs/xIsDsvutILn8yhZDT+T0Q4s9XeIZQ=;
	b=XSV/S6tWmTuiXzTO2MsW4mXTpWw1Z09En11/T7BUrh33txT3f7Y9P/N+8fSr7tkw0v
	fDGFk1UcZ+4snlQgVbcTPkWXTF2FZTEpr7EhGzwnF52ygvweVOxOma5rQXC/V2LQ0goL
	MmWau8xrds/aMJLRebZyFK+sjcUhZYAoXTg2N2K2aYF4FMbG2hKy+1FlZ66tyln9NuU5
	3m06cJSKLl8beq9YXZpprzwZ3cSA8pwNq1PPQUWs7yhLkcP0uVa65TQcj3Wan++0DdPD
	oDTeJmkDGus8N0MQj23nnYCxeb0ZLPnIajd1NpLYd77+aWUfTBGBbSyJewq6QeAd6QNx
	9AQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=P2cGOMv5XASCs/xIsDsvutILn8yhZDT+T0Q4s9XeIZQ=;
	b=Iybpm7AH63dN5YR9SKADtR58hKRJfzvL5QxTImFmkGE9bT3bCRVUnUFZbaFvTTfbIr
	oX5h/G0R8dMhI1Ktu6r6ZIpGL67L+fi1suGccDl0Ar62yNht4VZfjeh/8TEBwm8JTkpo
	+hql+Rx6tSxTvm+Fkxtsb8JjDgmXGw6HXw3AMAsLkKMT3hK83QqGJtV75kWzDdAAOjWj
	qZDLnjQcqtZnEHs0SprfiMr8BtPvdjGo2jUiOOCnhZGCxUbsHBbxGpcPyL+QJK29LlJX
	J1dta+t50Q4SM0YIbc2qRhklD+NKAz9+a0Y9P0NCQZVd9WaZSU2r4inT0gKpstTDhZT2
	oFwQ==
X-Gm-Message-State: APt69E1yuHFbJBsCN+rR1MDryRDQ1iIC1s/0ILZEZdcb2S43Qo6l0JbO
	9WiLUqouJwXUf384ka284xEcVjVR
X-Received: by 2002:a0c:ab18:: with SMTP id
	h24-v6mr23291616qvb.138.1529604175868; 
	Thu, 21 Jun 2018 11:02:55 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jun 2018 15:02:20 -0300
Message-Id: <20180621180224.8312-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH 07/11] hw/i2c/omap_i2c: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-TUID: CnxlyOqa9fN9

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/omap_i2c.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index 26e3e5ebf6..e6f34fe31f 100644
--- a/hw/i2c/omap_i2c.c
+++ b/hw/i2c/omap_i2c.c
@@ -17,6 +17,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/i2c/i2c.h"
 #include "hw/arm/omap.h"
@@ -339,14 +340,17 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
             }
             break;
         }
-        if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST */
-            fprintf(stderr, "%s: I^2C slave mode not supported\n",
-                            __func__);
+        if ((value & (1 << 15)) && !(value & (1 << 10))) {
+            /* MST */
+            qemu_log_mask(LOG_UNIMP, "%s: I^2C slave mode not supported\n",
+                          __func__);
             break;
         }
-        if ((value & (1 << 15)) && value & (1 << 8)) {		/* XA */
-            fprintf(stderr, "%s: 10-bit addressing mode not supported\n",
-                            __func__);
+        if ((value & (1 << 15)) && value & (1 << 8)) {
+            /* XA */
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: 10-bit addressing mode not supported\n",
+                          __func__);
             break;
         }
         if ((value & (1 << 15)) && value & (1 << 0)) {		/* STT */
@@ -392,8 +396,11 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
                 s->stat |= 0x3f;
                 omap_i2c_interrupts_update(s);
             }
-        if (value & (1 << 15))					/* ST_EN */
-            fprintf(stderr, "%s: System Test not supported\n", __func__);
+        if (value & (1 << 15)) {
+            /* ST_EN */
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: System Test not supported\n", __func__);
+        }
         break;
 
     default:
-- 
2.18.0.rc2

