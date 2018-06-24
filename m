Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2447211wrq;
        Sat, 23 Jun 2018 21:10:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJCIxdXJEgFm9nJlAZFFvffWeLRHoohTnW1DP7F+9Kl2vbi3Fav5Ye4p8krURvyWr0X1Ulo
X-Received: by 2002:ac8:26f7:: with SMTP id 52-v6mr6538789qtp.393.1529813436188;
        Sat, 23 Jun 2018 21:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813436; cv=none;
        d=google.com; s=arc-20160816;
        b=mcI65azHz279WgWRhigzbtKRQSp5as5goUwI0qcypLLY8wgV13idOt8jDITG2jhaPY
         aqEzid7Kmo/lKZeJNbrJcJQKK6o0WxsuROl3DeocwlIX7yIjS/5LVBS1tbqLrC5/AM8l
         nhTK+A109HzFHeybUkufu3yehdlC6QFOOnKRWzBa8jeBFi9OWJ0q4rBK8tgw+Maao6kt
         TpliY7YdzM9NTR/nSuV8NzcoywHUZBdtHzJYD+BjtaNZryNfGDb7RCQFY7cAsOvQwhUl
         cqsvO6AtNrfN9yuhQDTJjBAjn0Z7D8zTC6lZCYF5XWJ1qy127o/kPNs2If/A7GpZiQhf
         87aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=LBtULdpVGZHXXdJeP9a2uG196NqZT+OU//3yrTeMnA8=;
        b=xhwKIkML8nuXOnIeKT85Nz39n1aD7O3abKEcbnVWMiGnA89xn++pe2R1TG5Re+M1rL
         gVTGHxTQvMsISd2lD9HrUFP5Tn5g0paZ7ShcEGzf08MjOzZ49fPkElJQq5wYe8hSNGtx
         zthYLkScwc82JIXQhuSHTzwg3PtEvBhUPSHcKwoWUicg36ysmb3qHfPAFV8N5aq2hXyU
         0ot3TCRtVIpszQ74C2jHq5NlZNZKJRNDzUpXMMZEIs8sjuR0OmJXE2te+N99d4mThdIL
         4kpoXGwg4Z1b0Vw8okbr5m6isw86n1cQIZ9alFDTE8yDQWrC41/2PKvC0Fd7EAMG0mfL
         RAgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pOnkILMu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e194-v6si917311qka.150.2018.06.23.21.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:10:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pOnkILMu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwMF-00071d-LJ
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:10:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIY-0003wr-At
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIX-0003v6-IF
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:46 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:41520)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIR-0003q5-Hy; Sun, 24 Jun 2018 00:06:39 -0400
Received: by mail-qk0-x22c.google.com with SMTP id d22-v6so169262qkc.8;
	Sat, 23 Jun 2018 21:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LBtULdpVGZHXXdJeP9a2uG196NqZT+OU//3yrTeMnA8=;
	b=pOnkILMuWfO0HuAyo+XYeTUaMt2K6Qc75xN/WW+oUY3iEEab+Qbl4z3liVa6wc2WyQ
	8W7u/KsVqC/3tzOYDrUX1xaQISEBw9APaIKOqy64krxFsnCoV73XVWiDt+t5fyiGO9xW
	Jn45vvFox796GF39nwuHJL2mBdlr0Qq8v38lcChXPqJX+Ww7mDxHPtRzwRuWXLzTo870
	p9yOrt2iTQ7oKg2dEiypyAmlaXaB0fxYD++Ynj91+z3NxCu+b6Dc5ZLIypIasBEOGXUA
	QXIgOyvyFhO00lmQJCfDsw2xw21plWKTC5JIvR2Mm+bEw1lSFEaoQ3WjfvIB+p+KsPWG
	FOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=LBtULdpVGZHXXdJeP9a2uG196NqZT+OU//3yrTeMnA8=;
	b=cniuiamDKz+kMhVt+VG+jJZYy/6NI7xdm+uS6LZ2KzeGX+fAwYSe+zRNbIzP83mtxL
	TkCx84uVtfy74cZbQFtnVdGIZ2ju3LhofcmCkjgwqdTTkIwqaptHjfT/4WZsrDF1vHXI
	KmnqqgUHxL1WniTmU+C/9EQpT2GKu0lO09De3E0t4ZjZGqGbsGlaRSHhEHCqwwRCAv5M
	aDFr9s7mvx5o1GEs2ZFI5Tp3nXrx3eOj3+IrjjKRDeKzdpygj15gsdSmqmrICkyJn91K
	amVzaUVLhfooSHti7pkJlRR4VYlEeigm8UKSn65Xr702QlJfTqjnBQqERSNaw82XR8l/
	bSDw==
X-Gm-Message-State: APt69E1reYbEi/WHSUd+JPSdnmP+X75jmXsBnVWibGsGhYT+1N1saCZi
	0af7TOmH5jKnJzGd1xUM3GY=
X-Received: by 2002:a37:be06:: with SMTP id
	o6-v6mr6531255qkf.162.1529813199058; 
	Sat, 23 Jun 2018 21:06:39 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:05:58 -0300
Message-Id: <20180624040609.17572-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: [Qemu-arm] [PATCH v3 05/16] hw/ssi/omap_spi: Use
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
X-TUID: j2+723/YxqJt

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
2.18.0

