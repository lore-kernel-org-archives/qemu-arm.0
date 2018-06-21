Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2310797wrq;
        Thu, 21 Jun 2018 11:09:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJn3B+VWy7yN/31kraAgT91o7DuEfgnlR9Q5fTWMPJ1HKyuzHI/D9PQ3Oz1gITjuwOB1UJL
X-Received: by 2002:a37:b4c3:: with SMTP id d186-v6mr22238408qkf.400.1529604575395;
        Thu, 21 Jun 2018 11:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529604575; cv=none;
        d=google.com; s=arc-20160816;
        b=BE/WNdNNiFBQBM7NfNJGr4qiZso8rZ8r4qYbHJf+kSAhkZphZ2vBYdI9fFdlHf3tpR
         K8mxRvQjFPeuP95mRXsFBzAPOaEo91SmgHvTCRS+DYnBOdqcnfOWXfElC1EDfP5oiGH9
         ZpaY20MncxxddGEXCqV11xla8+cvlTjKzbqzT0IaX0++PUCu2CF7Fg1y7WXS6WgDWoTk
         qRQxSGKlFKgvMubzTdr0gdJIQ4fbC0MRXtW6IMPdtQkt735UB0/hlWjOHOES0UvRbJq6
         6gifHzMApcaD4IffPmRKlKgoWL4zQlQFyvwKLpu6auPDS+HSnxRS34OfqYG3xtTby9Fe
         BIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zGA7Hc9q0oL5P8/T0PP2RkTpDI0zmJwsuY+vQQNtTZc=;
        b=AqUB7CPomh/JlaaMAboS5HIUei92YfIzW0+IQ5l771ccq0NBLCbsdcdxvH9CELRtzg
         mMEMmgEkjhprmF3XBXnOyJekCaTCst9qKcB1pzvKuLCHS1uTj6B4znXFBwdGdwPhoO5O
         Jk1DRIf7MUojExzHx/aftHl6B6CkSsor8DiNYO40Nh9Byt8UMuCHgFJz2CIrQVQFa+c/
         xgeZm3tQoT2RcHpg+SCwDS63RXRP82tR6KmjXKPbxlqAKoVNYmunNq6tnd6GB3w/tcSq
         bZGB2ZzY0yxn4SBnYDvnlbRmjPWvj/l2fYHjX+4S6NIDaOPU8Ie0vf2Eiui4jbgoHDl3
         w1nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lu0oe8BD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a56-v6si2565467qta.13.2018.06.21.11.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 11:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lu0oe8BD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW41W-0005kL-NO
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 14:09:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vG-0000iW-3w
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 14:03:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vE-0006fM-U3
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 14:03:06 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:43344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3v4-0006Y6-50; Thu, 21 Jun 2018 14:02:54 -0400
Received: by mail-qt0-x229.google.com with SMTP id y89-v6so3654524qtd.10;
	Thu, 21 Jun 2018 11:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zGA7Hc9q0oL5P8/T0PP2RkTpDI0zmJwsuY+vQQNtTZc=;
	b=lu0oe8BDLDxcM2JxR2p0cyeClXRsmjS/KjNlMuP9MjD1STX1YwHZqujO1NtdmIYdWB
	oYeubUT7HgV0R5YzvdmoJATGXQN5rWJlhvoHsPMz+t1k0uJDKmZZbltc/H0PsKCU70WO
	zeTp1xGcP+OQYsfDeBxpRxKBaq8dF2tunEBi+FKdqcfU8aKjgJ5v/cwbZaXeOjU5kdhe
	bAz+ZPnv/DOF2g0m5CDcBp3oOvAHY2RwQy7hVfejZgxmP3KCq6LJjoZebw5ZjERJhXV/
	wyteXY9l0GIhjAc/1oNpWqHtomtq+ZbUHvI+DQoal0eAuxlbxWK4OGWTl80s7dGcFtrt
	QrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zGA7Hc9q0oL5P8/T0PP2RkTpDI0zmJwsuY+vQQNtTZc=;
	b=Z5gISRYmPyQiOQOZSN0VElUmG0T0avtFfE3tLywXAkYglN4gjFbTHNHf00x6yNh0o5
	loZPc1iOqh6/+dUCl5k5Hb/W0S58kWJOTdlT3H1NlrHTPGoKSZnkkYM2lZvkXHZy2CPA
	I/OUM2GI6q+3c8MEBJ43wA4CuccTlUiBwQGRqYNJ7yad6dSytxgzVvFx7pNV9J27bpZm
	dhkygB82P6nKeOKuJZf9IoudBeUhndfG+ygIl+nqbhAs3L4YLT+P3A96uVrnoO+jeJ6y
	XYQKKNJALpij6vxj+ReJ1iEZkKeyfVOdxvjygyKK3ADKTqXIp5Ap8W/GV7lnRWQl7Wul
	2yRA==
X-Gm-Message-State: APt69E2omZdtiZsepthYXoAI6J5CPEDlO//a2he4DioX3nZXDGYKyz2Z
	I2LQ1m61BLjbHEnsI0Eblso=
X-Received: by 2002:aed:3f6d:: with SMTP id
	q42-v6mr24126262qtf.375.1529604173428; 
	Thu, 21 Jun 2018 11:02:53 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jun 2018 15:02:19 -0300
Message-Id: <20180621180224.8312-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-arm] [PATCH 06/11] hw/sd/omap_mmc: Use qemu_log_mask(UNIMP)
 instead of printf
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3zY74aZHOCJK

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/omap_mmc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 5b47cadf11..aa2a816f76 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -17,6 +17,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
 #include "hw/sd/sd.h"
@@ -449,10 +450,14 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
         s->enable = (value >> 11) & 1;
         s->be = (value >> 10) & 1;
         s->clkdiv = (value >> 0) & (s->rev >= 2 ? 0x3ff : 0xff);
-        if (s->mode != 0)
-            printf("SD mode %i unimplemented!\n", s->mode);
-        if (s->be != 0)
-            printf("SD FIFO byte sex unimplemented!\n");
+        if (s->mode != 0) {
+            qemu_log_mask(LOG_UNIMP,
+                          "omap_mmc_wr: mode #%i unimplemented\n", s->mode);
+        }
+        if (s->be != 0) {
+            qemu_log_mask(LOG_UNIMP,
+                          "omap_mmc_wr: Big Endian not implemented\n");
+        }
         if (s->dw != 0 && s->lines < 4)
             printf("4-bit SD bus enabled\n");
         if (!s->enable)
-- 
2.18.0.rc2

