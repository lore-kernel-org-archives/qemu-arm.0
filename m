Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2448857wrq;
        Sat, 23 Jun 2018 21:13:40 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIXTXC9B8pxBWdR5X+7wzJRtMa9rPhhTqetnfcIuTNQxssGWhcEIioZcDzXPnj0/oKWzt/i
X-Received: by 2002:a37:7386:: with SMTP id o128-v6mr6290654qkc.356.1529813620533;
        Sat, 23 Jun 2018 21:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813620; cv=none;
        d=google.com; s=arc-20160816;
        b=rymF6iAshyXIejDxz1kRphRS89gzFgsA1vFRAspQPDRYkoA3d/ruZdctjtudNBVlVg
         HP9V1nWe1WL4JyiYececXs+tYYVGtyAlPIhtEOoql5J5/xoZifHuyciHqGYeaYWvcJO0
         slPHr3KTZ2QB3t94NIs5PSw8v5VlpfEMa8vj/FMlhSS+OjGTV2S+bwdAOKAlwu4g1oJd
         vCv9s+26pL2XamZU79Ih+HXMHaPSwl/RdZp74OcTnLkd36fBL1MivADdXUBk+iZI2pYD
         WAILGChEV/TWOXjO2LcjVU5Hq1Wz5sa86wUwL734mWQzaDCnan7qHYOP+pKfAZCwnY5/
         smHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=is7KX7DYXJQMvKVDeWgdn/GlkMgXVP6yLiPhgPPFzKY=;
        b=m0HPQgm+BqBAHD5khFkT8fex9S5/Lc+jbXT19qDyzCTwxuAD0ipFYQKbDYhl2jMipN
         oq1Z0aLDR0l8iuNoI801oO7FhHmzWG4oHgYPWOooGF0vv7ZLpSVp/yb0kIPALtKQXJ6c
         uL9nx4Wq4lMjFuUd1t4ld4SUEyP/cPCG3BMBmiqqKApmdCbUEplSuPMGKShsrGRLDI1y
         EHnkEihyleoqjaLJtuHmoE5LqsaBS/4XN/UdPhr5scE0Um5AbVR2y9/2CB3xROiEH6C2
         dBlVEr/cegaoxlNb8kmvx2zhsyi9Scr5Z1PYy34TXw3YG4ytfsOeDMyvO4ygZDUrSVMw
         MbbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hW+4ZUOc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a15-v6si3739894qkj.313.2018.06.23.21.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:13:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hW+4ZUOc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwPE-00011G-1X
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:13:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIj-00047j-OU
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:07:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIi-0004Ei-UC
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:57 -0400
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:37508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIc-00044W-04; Sun, 24 Jun 2018 00:06:50 -0400
Received: by mail-qk0-x235.google.com with SMTP id j12-v6so5833380qkk.4;
	Sat, 23 Jun 2018 21:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=is7KX7DYXJQMvKVDeWgdn/GlkMgXVP6yLiPhgPPFzKY=;
	b=hW+4ZUOccUFBnx6pVtMcooaBIlJ+hVoLrhHnAeZcE/f9x1vwegFNjZfg6RkNhYPcsz
	velHqR416ck3qfD3XMf6leptS60DrvCSxlEFqVAtr8fXzP8GK6ej9gjq0bLMSI1FsXV4
	btEMPycLiaDoJlJePfJ3H7tXcevbQ/VEFPtSQoP+LTwVCQvqcIJfdJ3lihNO1ahc3LFQ
	+3LJr4NvloMk5Xta+X1vsPu2SbvHHUgHdKRR9bq0JiMHbFzCTZQU9FC6izOznt11PmTM
	1yiAJKlTD/CTjLRqgzaERUdkEepriK5YME3KGOpp1Xo4ETmk0Vc8+sDwqzMmN/TiowHL
	d6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=is7KX7DYXJQMvKVDeWgdn/GlkMgXVP6yLiPhgPPFzKY=;
	b=KNZA1FlpzXfOSbbZzeQh5DaznTegiGXTS5t7HZdztHaU07AmhVc/k6sCpUJcVrA/HT
	dyxAwbDl63r14DMeheGlBYuyzvf4YSOnxyhCWXzX6/h66DSLS8zAsSPrzbdL4hZ/+JMh
	25nh55l7LtgLI7nq/V0s9dNPXOu7Bji5gSgXLBBDhf4JPiHksK8A+9lpj1Z3XiDSxB+E
	UmV4osjcUO5gfGQPiNTeQfoC+v7Dh4aGdMugcm8/OMXvDcctEEjDpE7oBSqitUK1L9uI
	8mWSN7mhlvGR28lBG1PYCc8sixlZDWCvxVYYT0NFfkV4pBoKqj93wd9LQL10wyZYL1CO
	yRiQ==
X-Gm-Message-State: APt69E2VthXLkihMZ8I/DK/k/zkQJGv+A2b6VjUK/40eI9Ebu0iq84Sv
	KX3gT7VbbzB+6jdHp2wBWjs=
X-Received: by 2002:a37:de02:: with SMTP id
	h2-v6mr6381027qkj.420.1529813209510; 
	Sat, 23 Jun 2018 21:06:49 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:06:02 -0300
Message-Id: <20180624040609.17572-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::235
Subject: [Qemu-arm] [PATCH v3 09/16] hw/arm/omap: Use
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +S08591tgnWT

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/omap.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 39abba753d..e7fbd340f3 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -21,6 +21,7 @@
 # define hw_omap_h		"omap.h"
 #include "hw/irq.h"
 #include "target/arm/cpu-qom.h"
+#include "qemu/log.h"
 
 # define OMAP_EMIFS_BASE	0x00000000
 # define OMAP2_Q0_BASE		0x00000000
@@ -944,8 +945,6 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sysmem,
                 unsigned long sdram_size,
                 const char *core);
 
-#define OMAP_FMT_plx "%#08" HWADDR_PRIx
-
 uint32_t omap_badwidth_read8(void *opaque, hwaddr addr);
 void omap_badwidth_write8(void *opaque, hwaddr addr,
                 uint32_t value);
@@ -959,11 +958,12 @@ void omap_badwidth_write32(void *opaque, hwaddr addr,
 void omap_mpu_wakeup(void *opaque, int irq, int req);
 
 # define OMAP_BAD_REG(paddr)		\
-        fprintf(stderr, "%s: Bad register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad register %#08"HWADDR_PRIx"\n", \
+                      __func__, paddr)
 # define OMAP_RO_REG(paddr)		\
-        fprintf(stderr, "%s: Read-only register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Read-only register %#08" \
+                                       HWADDR_PRIx "\n", \
+                      __func__, paddr)
 
 /* OMAP-specific Linux bootloader tags for the ATAG_BOARD area
    (Board-specifc tags are not here)  */
-- 
2.18.0

