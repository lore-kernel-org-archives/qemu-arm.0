Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2447563wrq;
        Sat, 23 Jun 2018 21:11:14 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfZSrPePZBJAR2PCAOrqtndNcqUlaA4xi+jRGApKEzaQ5t6x8jYYYAr9HKTl0TRE1QNixwH
X-Received: by 2002:aed:380a:: with SMTP id j10-v6mr5314509qte.223.1529813474013;
        Sat, 23 Jun 2018 21:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813474; cv=none;
        d=google.com; s=arc-20160816;
        b=lrcP2mQ6DBkPaCUz3fxAU8a1GzZVJjPJqL0SimnCHwFndDC7BkWpBedSJvchTtj1iY
         tWm2Taa8ygwbbUGPElpxMWGN5b+prcnxtc2z/SJOVFX4M1BQv9JG4Cv+e/Vjvu7KUavf
         JInO7rRkdBTQmogsG4Pfz7pG1N1PR0kIyts94Zu9WsFoJTbUJ3VjDzp7fafEPjKpWi3I
         vAGNezwVobzB7na0YbYFauLHqcHEEIB0lzzza9gh5jqxAXz5ehGGlqVKi3oPMkhTftRH
         K97YehxaJm/RWU8hP0jIp70WKUCBmkaGWRzIfG4orCA1sDyV0jvP1Ia4H1qQIsCG6Ayj
         bCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zGB87WBZUxSYqYPuFSOnGGcEOOn/B+mDAgxK88CRyao=;
        b=MkUuSGp8XENYRAFI+aVtH/rxMgA827BkgMVkZ+yluVwVXp4fVAEzFHLhNmVfhLkvoq
         qCzROOdSQ4lscJyyRBw5pc1a6B5bZF7lxBQOkgHFjbmaHAdINne8cstiSA1BRS4isShR
         Q9VstHL8kTjhpPhn2iEYdmGVceIiZoRukJXI9kW9OhmUv7QuQ9QXWM3x0AjK8yTSKI0U
         sOPPpe++MIWXaNGU/zi1YYo9sKffPdQRmNZa6hi/w0PBwrRZ3Kzxq7F5dMXwvD6TInKQ
         RJZS1uGzidh8ZHE5G5h8JQjGSEPxBKiPYVEeHXY+acg4v4cMfVK7s+pXmt6jeG0M332h
         P3Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tV5T+H4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19-v6si656808qvk.212.2018.06.23.21.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:11:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tV5T+H4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwMr-0007Uz-Eb
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:11:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIg-000465-Fq
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIf-0004CY-JM
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:54 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:33965)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIW-0003tt-Ow; Sun, 24 Jun 2018 00:06:44 -0400
Received: by mail-qk0-x22b.google.com with SMTP id b66-v6so348569qkj.1;
	Sat, 23 Jun 2018 21:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zGB87WBZUxSYqYPuFSOnGGcEOOn/B+mDAgxK88CRyao=;
	b=tV5T+H4Dj8ANICMMuoasIMIFnuyPUBVIcbpjZLIpYM13neWGIp7M2mZO4zaRsSGFK/
	FHDHvVfvUz5faegE9Endy5Fc/rdo0fIcpmwPdwkkhTLKlCWpHIsW3TLdzwLDTe8wfbum
	WJUwfZcxYtkg5T76VRwxjiMELYi4MMkhzgWwqhZzIndwk7Be7AT5Rg4peefl8UVURFfO
	sGhsqfzc0HU34O+eyY15M48dLeYjGF7R3ofCHxpfYdZ2KMEpcCpBqk2CYm5U74VVuVEO
	qh6bMonvxSMi7w2kLZHq98DIqMhV9ujgCSX+yB3QSGupalVW1WMJT4nA5LMaoP+PdmCB
	ZbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zGB87WBZUxSYqYPuFSOnGGcEOOn/B+mDAgxK88CRyao=;
	b=QGbbvNFyOr8mVLig30QvEQKUL41KE7sWBXWkhNXL3TK2FJNFM2EBeWt8DYYdu4YAkR
	IvemWGLIhcCQCArshFechU0+4/67PxAWCBfw58lnhuZ/TStF4rgKX19aLA5vTqAK2B/b
	hlA4x7KtIm7CPKEDJ4PCKjplLTAJd+URCzRLn8T8qF2TIVoI6U7E+qSzN8RsfKzqoea/
	TBctpM0V96TpVhxzUbKiMimugSedCJ/4LvTnt8m7iPocsfc2biEk6SiCnIDgMBuDfMVg
	/BjYJkK1BK6WheDTskSUtjJ2FxJc3DzP9xqzC6/fC+jMk45QCvEx1nZ31Rswyl5mC8zk
	lQMA==
X-Gm-Message-State: APt69E2zFagdMlJqddrB/4dX19wP3MVOxo4QkZt305wNgv4/H+T7ewY9
	8McA4feFagBetymCSGFxkOk=
X-Received: by 2002:a37:9286:: with SMTP id
	u128-v6mr6189282qkd.29.1529813204279; 
	Sat, 23 Jun 2018 21:06:44 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:06:00 -0300
Message-Id: <20180624040609.17572-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: [Qemu-arm] [PATCH v3 07/16] hw/i2c/omap_i2c: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-TUID: nypyCxjFvFcE

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
Thomas: I used 4 <spaces> for 1 <tab> to keep checkpatch happy.

 hw/i2c/omap_i2c.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
index 26e3e5ebf6..cabd348b45 100644
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
@@ -339,14 +340,15 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
             }
             break;
         }
-        if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST */
-            fprintf(stderr, "%s: I^2C slave mode not supported\n",
-                            __func__);
+        if ((value & (1 << 15)) && !(value & (1 << 10))) {    /* MST */
+            qemu_log_mask(LOG_UNIMP, "%s: I^2C slave mode not supported\n",
+                          __func__);
             break;
         }
-        if ((value & (1 << 15)) && value & (1 << 8)) {		/* XA */
-            fprintf(stderr, "%s: 10-bit addressing mode not supported\n",
-                            __func__);
+        if ((value & (1 << 15)) && value & (1 << 8)) {        /* XA */
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: 10-bit addressing mode not supported\n",
+                          __func__);
             break;
         }
         if ((value & (1 << 15)) && value & (1 << 0)) {		/* STT */
@@ -392,8 +394,10 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
                 s->stat |= 0x3f;
                 omap_i2c_interrupts_update(s);
             }
-        if (value & (1 << 15))					/* ST_EN */
-            fprintf(stderr, "%s: System Test not supported\n", __func__);
+        if (value & (1 << 15)) {                    /* ST_EN */
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: System Test not supported\n", __func__);
+        }
         break;
 
     default:
-- 
2.18.0

