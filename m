Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp855227wrq;
        Fri, 22 Jun 2018 06:49:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKw3bug5jmfo+ZVUo1kmF1cQiewn+FfOEg+dQEjSLB9H0u7ECdTb8fQolUtIa1tF8pKCSNv
X-Received: by 2002:a37:8483:: with SMTP id g125-v6mr1300768qkd.392.1529675362651;
        Fri, 22 Jun 2018 06:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529675362; cv=none;
        d=google.com; s=arc-20160816;
        b=oBFQljTEGP+4BXho66TK2jVXTC0W1ZYTyVqrs3+MS2H+crsK6UU/aEY2WRHytHy74/
         5EVhvdD/nx+Rv8bUIi4DdVo7Y0G4AQeNwepQD+ujCeBZzM6uSdzmk4T2tjQa+tndCLLO
         3AO6ObT0SEpXkhGPTEytgVUbb+0NfeZ4W2O/kHnugXDIWcc6qfkBFSBeodT0tvkOU7SW
         bInwrlwaKvhqkqU7Ge9B4SJQrlg/7R9oeDYjIKjzzfrZ/tsl6nGkYHekSyH2SiekD6bP
         Jym+8uwnar4lp6j62dk3zRxetIpGyqUL2j0wank0Z307IGiqLReagawHNgCKmTqrzLAW
         NVag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=2Rc5TAl46HafWUsGlR1lgCO1U+OFpadWowwoZjTJ3L0=;
        b=CU39ZMomkmXMuNziu18eZI76lD0tmO7nluStmLktS4wL40QWAUaBrPC/h8wYeE3w26
         WhR9K5kcWsQ+POk0hjTQNu689Mmywh+1IbZGYfMm+xdTyFb5AxzYvK2gu+HUFCDR59xe
         pyjwKAU+DRaRSSvL2MjmtgP7cMRR13eXtOkXQ4MiB3BxClFnSjrWYhQCuKO2HrvDpuei
         o18KrRGOCC81CpbGYdPj4aHWG2AzUKWxBUSytTy+A4jaAN2TAhYUP82Lg47FlzzcyZNF
         X7QINolkkxOiQLFZtezWSuiGTJs1qGbxFDE4gVAqpgZGeEB+e/rd6LaELvVAZsyy/L6C
         bn0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B4n3h7kL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w28-v6si954918qtj.123.2018.06.22.06.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B4n3h7kL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMRG-00040u-3T
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:49:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJV-0006Mf-4w
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJU-0003j2-Cu
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:41:21 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:34695)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJU-0003ib-8r; Fri, 22 Jun 2018 09:41:20 -0400
Received: by mail-qt0-x236.google.com with SMTP id d3-v6so5938063qto.1;
	Fri, 22 Jun 2018 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2Rc5TAl46HafWUsGlR1lgCO1U+OFpadWowwoZjTJ3L0=;
	b=B4n3h7kLsaaPHmNHddM/x3CK6hEnb4viQPRXplCplFte+rQcGdPvAqAlAopbzmY1eN
	XPgsNw9ay+bNkBrFYh7ip3lumyMMdWXdiwsxwBmcwzs4bjgGedUVz/IKTx38NG413gEo
	bnc4qImTJ6cUGNLGNol+tW8knc6nnskPNuvxjXOgUIzGNIgHskDJq/nX3IEVru99VqVH
	+hx0GA+RRZn/lwlvDl7MiF/I+y0MrozsHG/hoNP91LRrhJ9B6nEZ2OyEcNrvv6OfL9ah
	OWiMYHLRiDJsYDKnPIkHelSCx37mQkXlO/KWiFQKCEiMkWNUmxXJtHPrf4PWz0hN9/G/
	zOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2Rc5TAl46HafWUsGlR1lgCO1U+OFpadWowwoZjTJ3L0=;
	b=kyIeU2pTZnlq8FJrwUzdTuA3R/pf9M2CK4UtOc7O1+AR0c0tP14n9gzW6b49j5OCtR
	sjF2HKkRhEMky4EySR/flMapKtnvTd8Vga6HxwZp/VII66lsZCWWUXdrX8cEp84sZNDz
	E8GU8g8OZ5zszaQdnvEMgYVVVrAbL5Rer/h4vTzphDHhV56ZDYcSuMG/J8crufkW5hEM
	p+/wpaHxcmOaJkDWBdB/IuZbdcYzlvecEJ/d/y+yo1wM3l8UMofCDyq1NPbeaTANjkOs
	qLl+8PFrXIr6XB7TUDt+WVfxyxVdwe9vHFpC/osy3Wuvs/aoFgbBIO4mYRbU4okIrLq0
	InDQ==
X-Gm-Message-State: APt69E3uET2D55oSNdnLE7IWw8/+1e5+Xnp8wZuv0giCwpi8Wr9md+NT
	bgWi4EUZz4+RBc24ihkm0FE=
X-Received: by 2002:ac8:1285:: with SMTP id
	y5-v6mr1395122qti.164.1529674879570; 
	Fri, 22 Jun 2018 06:41:19 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 22 Jun 2018 10:40:35 -0300
Message-Id: <20180622134036.23182-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-devel] [PATCH v2 13/14] hw/net/smc91c111: Use
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LZyVEOIRb3xw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/smc91c111.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 9094c0b47c..d2fd2040e8 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -362,10 +362,14 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
             SET_HIGH(gpr, value);
             return;
         case 12: /* Control */
-            if (value & 1)
-                fprintf(stderr, "smc91c111:EEPROM store not implemented\n");
-            if (value & 2)
-                fprintf(stderr, "smc91c111:EEPROM reload not implemented\n");
+            if (value & 1) {
+                qemu_log_mask(LOG_UNIMP,
+                              "smc91c111: EEPROM store not implemented\n");
+            }
+            if (value & 2) {
+                qemu_log_mask(LOG_UNIMP,
+                              "smc91c111: EEPROM reload not implemented\n");
+            }
             value &= ~3;
             SET_LOW(ctr, value);
             return;
-- 
2.18.0.rc2

