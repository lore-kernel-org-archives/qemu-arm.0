Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp858787wrq;
        Fri, 22 Jun 2018 06:52:56 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIq/j9Hyix8q1HQBzavbIFqgTDsa4XF2r5WpxtB6eIKvRPTx1l6RBc4lJbkgBqS/7mYFpk9
X-Received: by 2002:a37:8f45:: with SMTP id r66-v6mr1339768qkd.47.1529675576800;
        Fri, 22 Jun 2018 06:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529675576; cv=none;
        d=google.com; s=arc-20160816;
        b=j9vV3oojp+gyI3jUuq9A/TeyH9RFy7AVeq/jJHJCStFpCZEalOOAq68uRDWVH99RQY
         UjT4iLcrM19glxeyG6FuIzbK4AfbUhH98kUvo94CHbG1rhy4Ol0niP4paNOTpL6V4q+x
         MOzg69XKpaqyuuDMPgDJ8TwOXVr1ODLgnjlGeIfigmi34q9LpKZPUqZ+DhDKtIYIL3/u
         VbkyK5yyLImxh3KzjBx7gbkq3TRUk+ZpFAP6rwdOhPyU0FMA5D1Ocdv4Qi2wHxlJwcol
         +6mt9OyhULC3009NWKKcMkCAEuBeMVgKxeVlx4FG7gGOQ+B+gHJFSg5WcpkagLyD4sZF
         M1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=pfJpIm8zi7ra13uUzO7wM7N/UlRPWWku/UzRGCt+ygE=;
        b=YW1/1s89T59m8uc9IxhSz8t9YfGmbZqljPYq3ytZrHG/JsiCjUIajXvf0q82fhzHYu
         SllYRJH0SpdeAT0sZkxedNUJsJRYiwZt6xSsvX0UESd01sD0zwS6IBgD5NTfiwfl0mY7
         BGT9qJWwMkv67tsPG2aitRpw3NWvnzuxP3kwt9Xv2MKsM3sODixkGZemqNO9Pd9TNJWr
         btAp87uhHGQ0VJyuzT2qOAsVmiIDQETszfnfsqJ2auMVIinqwwksMikIvoisMs1EknM9
         zZdt6k8MFmGvnYM3Wcu/LoOd3+ZxvtxffhmwizF0LM2dw4bQXnYn/jBBBb/2/A+YzoB1
         VTyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hIjR83rn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m32-v6si4332876qte.306.2018.06.22.06.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hIjR83rn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMUi-00077C-3G
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:52:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJQ-0006IH-Ue
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJQ-0003cT-7x
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:17 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:43858)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJJ-0003UJ-GF; Fri, 22 Jun 2018 09:41:09 -0400
Received: by mail-qk0-x244.google.com with SMTP id s190-v6so3653711qke.10;
	Fri, 22 Jun 2018 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pfJpIm8zi7ra13uUzO7wM7N/UlRPWWku/UzRGCt+ygE=;
	b=hIjR83rnnsLlF+ejaBQQamvy1nrqUnmZiOCnFCxkCnET35TcALWssiK46ImVrKoM8p
	+KFjTM7cvhUZXmYlp4MXh0a07OAlZA/yO1BVcaEl13Bp5GblIeN70BkATtEP4HwiphGQ
	FHsrlMyfeMf7ik4eF8n75S0IFuxgyHoKYhtgiBWBorFNk+J4hsMsTDrhMMR5fObTR9iM
	BWkjpCe4nylrzCRy+oHHm/Sa0eVySzL/ciU2EfYN4VKPqLKW8VPZjfeWOrXJ8DyS0bfi
	k/Mj1FmJW1eJPbitt+ovNWI8X7TNdS6xQqfaC7mGyjVxHP93dVBd/wGtTud0zEkge8ND
	VfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pfJpIm8zi7ra13uUzO7wM7N/UlRPWWku/UzRGCt+ygE=;
	b=GhxUCG6pVCigfc8fpVTZrh3yQEuNmopLPsf+mkm2hVmoWJaDgI92SKZ+Ty4Oo/afmY
	xoJMQRYF0+/zeLcsGoJWd+AaSVQBVVavPa11GURy86kZJBJS+7MPb6a/UzUHYKCCTCcK
	LiMnrYULkK+Z28L0l2KlHborWag+Y29HleATRHXno9NcmkO8eC7eeJLu6jUT1kZyzx+p
	h/uZBDtw+B1Co7/nMFb0XiDglq8LeIaxUoMrVMIbrThUTbRJKHJKTdB8kYru+fOkYbN7
	PWvjqpcNfPQV1HX4m7YJLlu3hjIw8f48TsdUZGMSzti5acTmYNal4pzdllSeflmaVLcf
	SVMg==
X-Gm-Message-State: APt69E0Nxf25SA0b2exuTT+mvQ6ebF2O2YXu7rQNN+EMra7GA5aITTuN
	+a1kSDF3kRlE1kJ6YeigODc=
X-Received: by 2002:a37:17e3:: with SMTP id
	96-v6mr1329886qkx.304.1529674868892; 
	Fri, 22 Jun 2018 06:41:08 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 22 Jun 2018 10:40:31 -0300
Message-Id: <20180622134036.23182-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH v2 09/14] hw/arm/omap: Use
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
X-TUID: KUV12fV39f57

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/omap.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 39abba753d..3867687b8c 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -21,6 +21,7 @@
 # define hw_omap_h		"omap.h"
 #include "hw/irq.h"
 #include "target/arm/cpu-qom.h"
+#include "qemu/log.h"
 
 # define OMAP_EMIFS_BASE	0x00000000
 # define OMAP2_Q0_BASE		0x00000000
@@ -962,8 +963,8 @@ void omap_mpu_wakeup(void *opaque, int irq, int req);
         fprintf(stderr, "%s: Bad register " OMAP_FMT_plx "\n",	\
                         __func__, paddr)
 # define OMAP_RO_REG(paddr)		\
-        fprintf(stderr, "%s: Read-only register " OMAP_FMT_plx "\n",	\
-                        __func__, paddr)
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Read-only register " OMAP_FMT_plx \
+                      "\n", __func__, paddr)
 
 /* OMAP-specific Linux bootloader tags for the ATAG_BOARD area
    (Board-specifc tags are not here)  */
-- 
2.18.0.rc2

