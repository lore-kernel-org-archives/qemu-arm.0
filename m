Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2447334wrq;
        Sat, 23 Jun 2018 21:10:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcA15JXYYsN4g6HZ3aW2ab2rrtqNKoWsYx1ZRIySAJqAPeitHcnOun6BkJ4eC9wCdWrPT/B
X-Received: by 2002:a0c:bd0e:: with SMTP id m14-v6mr6736115qvg.164.1529813448640;
        Sat, 23 Jun 2018 21:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813448; cv=none;
        d=google.com; s=arc-20160816;
        b=g6gfeb+TlW0jIJHjp4lGyAQyIdrkwfAN0swbe3jNzphdKjI1io9gwZetNhBE1f1I3V
         fMtgF2DCZqnsq4h6UG2DV+O2YYAClFZ5g1nvLr0B0UEyy56113lquaJFP1nlMndJXn6G
         meGjvxMDJ3jZUa7AsEY4qssBo7IL5qV2gDgCfB1lAt8uFdgtRthJ8YL9Ae2L4qGvAqwK
         TtgO7PpCOAuNuJcbsnJBkho8tEVGjskAVLBfMXnCA3YPtIl5kzLSreaXhKU8ez0rpi2c
         G5YwDECqBkLPqWP3jghUDyh5LrFKTBSgyVqz6aqAmN0FEtyZdXJcSFbY0lG5UnTq0+Au
         DgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=hK9QEGg5qg6ckCjOXMcitnFzKOYf48jdhPmYlKTayek=;
        b=vuRDCCpuyAun6qmMW/rmUv0rxkBsnAfitxaGHuhJ8XmVAY+3WcaMCPGPUEWCgGsMyf
         ZuHroVmkpYKNJEFx6wovoI4f8KasZ1feoGWEFnJtEIIUi2L8THyHFkgB00feGMCVl62k
         jjI6jX2SPqpWlBd5k5PM0MH/tK1f1ltALDzxpI7GiogIFSsr45QcbrGlZ3vOFZlVjJ7I
         JyvQV2WhDRZJdxrErjb7hZku/58M+JrlQoCHI/PhKfF9KJa43Yx0oA0NKLysdHHmjkjK
         UI1rKz7zh1Kam+V6dowAJbn8z4rLZcO2vlqgyhL3T9VPAO1l8TCk/4qei282RXF5Qjpq
         4Fvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=siNHgui5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h47-v6si7874436qvi.184.2018.06.23.21.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=siNHgui5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwMS-0007AS-4P
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:10:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIe-00044o-77
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIZ-0003y6-8M
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:52 -0400
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:33964)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIU-0003r6-5S; Sun, 24 Jun 2018 00:06:42 -0400
Received: by mail-qk0-x22a.google.com with SMTP id b66-v6so348540qkj.1;
	Sat, 23 Jun 2018 21:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hK9QEGg5qg6ckCjOXMcitnFzKOYf48jdhPmYlKTayek=;
	b=siNHgui5LVnwZh9ZfjiZyOGzJLyoVhHIr7vRxeVzBM8N742Ng6lqDepB5iml6pDI1k
	+7NN/yDWOFU927YGy4u923Vv56MgVJnLxAaOxrip8Rck6V9z1uevf4WdGqULFgqIFAbe
	lykaVitHxaPC40cS/O7wZkwTkjmoF+N3RSvxUMIcoI1Q9O7hRGyL8igBfiJpeSCZOGUz
	c8iszncxMHscwMCWFtDpM6qkn/T23cxGX2d4phV6RrjarFX6fdhyGOYwIPnqkH/Kp06D
	l0jFbEvU19HI8yv7hhHyA0S7IyFjdB6TylOXq7B/PkCyAtzmivYV0S2CGXgqWzXLzMd4
	5Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=hK9QEGg5qg6ckCjOXMcitnFzKOYf48jdhPmYlKTayek=;
	b=jbtH6lYGPrhUAm9hlInqUyY+mDiPjARAKGAeftw6WMv4TUr4MMIZYRJMN2VKqF68Bu
	2CRyMIk0Z2wMJhR2sk7jm3u0sXpZRusd5XZzlH8JhJpb70ruOZPh9kA+xv73yNzPPchA
	WHdAGrenK02Pf3kaXDQsWj8oINtkg6/lsY4Mi8v+acCd6hM5Y8ziAOMsbswT1VX9Vw0I
	mBinajcJwFSm71p+AGntZNGDwu+7uyU54ftlrgGuujRrLY7OjiFxmgAiI81T0JSoDiae
	/hLQfwGI3n3QCp+XIpMfpnhOKDqifKvFeIZRi+Beebz0yUvQH812tdWx0Y4hyQlT2fCb
	IUBg==
X-Gm-Message-State: APt69E0qmUUR2L4WoWpQFkWIDs9BbptWGhx7bn+Yfmn7EmwUG1o4AkLm
	ec72uEaSnx/X4OHRtUcJa3k=
X-Received: by 2002:a37:a3d2:: with SMTP id
	m201-v6mr6460403qke.121.1529813201676; 
	Sat, 23 Jun 2018 21:06:41 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:05:59 -0300
Message-Id: <20180624040609.17572-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22a
Subject: [Qemu-arm] [PATCH v3 06/16] hw/sd/omap_mmc: Use
 qemu_log_mask(UNIMP) instead of printf
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
X-TUID: XJNVgKagrYqt

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
2.18.0

