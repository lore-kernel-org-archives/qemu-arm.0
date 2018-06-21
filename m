Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2304209wrq;
        Thu, 21 Jun 2018 11:03:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLYPqMp68IilXrzhe212N9ET+ezkgTdkDC5YQZFClaDpy+V/6c93KQq91bSVGa8k86UsKfm
X-Received: by 2002:ac8:440a:: with SMTP id j10-v6mr25127274qtn.113.1529604202040;
        Thu, 21 Jun 2018 11:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529604202; cv=none;
        d=google.com; s=arc-20160816;
        b=Qh3BRk382/uSeQaXnV1Tb/Ww9KUrYZb44n6ukpFjhhnMqSpXi+5GB8Ps0c5g9U5887
         8nLyXpO3O6RJeQ8vGcBwwfTrJkr5HKUen5I2HlLt4nrJ/JgYNrvSil5OO4Wd7u7Gu4AT
         qyC+S3GmKbF7MkA66C6eclAms4EzEqun9GaiGTaEmDyXzmfeRWm/lUIBnGinZcN6HZDq
         szv8ZJUV30Yf6jwELikihPC6V3axvG3NFuAbfLBTNPG5Fs5PQ5S3BEWvYj1V3CKQs7eh
         k32M2gT6iBdDRU2jcEtu3WkT5zg5JsdLVSmZ3WMpwjmsL0F0vLT0bOGUZYDvYs8DZ04S
         dG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xYIXHulijO1M0Y9+Sb6iuxRwYqw1AOB/7zw1n4GqS9s=;
        b=y99SVZk9etxyH1hGZbueDAgTUwlIpSqkYPVTrvKxZb31hywJMxJCZCFzFkxbLHzzPj
         ysxe7S3xn0VApFICgqC6ZOVCfSjNIeZl6BMoRwkV7FwpJCU/DRhXeJ02/jtirTMIvGOy
         71PUAwf6FzDGP+yAEcdkUdTqoK6PLJiO+2AvMhqbLcYGOtYG4ysavJUq9ypBDN2/4Nt5
         UFCjK52gfGJEZd+cnqNnst3yZ8FJKzLiXhClvDHah62lSDPlkwk/Gv7XCKgTPldBuNv0
         Q674tRH6mWDKQKjkvpmbkJuaziCvFZQfzkIaMShIo8ap9FAuuYo6yCTRTTgXOsXDCRGy
         Vf+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oFq8lDtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n10-v6si3851752qtn.198.2018.06.21.11.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 11:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oFq8lDtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW3vV-0000kI-Gz
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 14:03:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3uu-0000R2-EB
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 14:02:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3ut-0006Sb-Lt
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 14:02:44 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:42909)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3up-0006Ql-Jq; Thu, 21 Jun 2018 14:02:39 -0400
Received: by mail-qt0-x242.google.com with SMTP id y31-v6so3656070qty.9;
	Thu, 21 Jun 2018 11:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xYIXHulijO1M0Y9+Sb6iuxRwYqw1AOB/7zw1n4GqS9s=;
	b=oFq8lDtfVmPPjQXZMF+I+0AYjqMI85NVxIdAliILq4i5pkKDOlwau+VL6GZrSs8HTl
	wfuP8FF9VPaPTAunedt/21M7TabEMxKXy80s0eId05Zu18ht5KmCv/7xJFHD1zzvntYl
	/Gf95L9JGcySpueo8y52eu1JsY+x1AEGXOxju41PqxAMugjddAHkkRLh30sAF5nIDZPg
	QheTbQGBb+sdSnFiGIL6rlfyoETY1o5vQH+tbIzDBFxmFzsWRnrrjYCzTjhUjh0r59+9
	duQHuP7w/RvlGQ2PNJ3hHCsYvrDk/vo3mhgx+PC1A3lALKvfPG6jEpjy0skuUqRnHn5c
	I4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xYIXHulijO1M0Y9+Sb6iuxRwYqw1AOB/7zw1n4GqS9s=;
	b=GGIyP+ckregmeDEQXwkjtDa/hW251GCsERv/suIL1ZQcLyYe6l3MHN5IVTxKpXfsc7
	v2kuqNglHvDsA3t2ZT6qA1hw+nd8Afg/OKd7O1v0IAgHNZfoG+khr/+rgVLtnl75p//K
	nXKv9Ta9rzKHGqXABfydsJO76c+3kTUBDKjth8S4WSE2USWqa+TvrYgXwSfIG8SMBaVL
	G8j/kOPrQOaJ83ufA6ENXNQ59nW6XqKfkYP0W6YAuhJB49DuQqMyttbBfqpPBx5yiTOd
	+9mxGFcnaVCGTZlknC1TOLJpcCy1aHVtam/2Q5iyGAtQN4SbiP8hirnXhJUojUlk9dOM
	Ha0w==
X-Gm-Message-State: APt69E3q1YcN7T3FuktjGIiKyWLmSXfoRtN7FEEL3AccLuluuvyr694u
	Z0s2Kq8R3uOv1D1GQz2l22c=
X-Received: by 2002:ac8:4a0:: with SMTP id s32-v6mr24217615qtg.2.1529604158920;
	Thu, 21 Jun 2018 11:02:38 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.02.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:02:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jun 2018 15:02:14 -0300
Message-Id: <20180621180224.8312-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH 01/11] hw/input/pckbd: Use
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aIeFpLC9pMNF

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pckbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index f33e3fc63d..1102d2a31b 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/isa/isa.h"
 #include "hw/i386/pc.h"
@@ -308,7 +309,8 @@ static void kbd_write_command(void *opaque, hwaddr addr,
         /* ignore that */
         break;
     default:
-        fprintf(stderr, "qemu: unsupported keyboard cmd=0x%02x\n", (int)val);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "qemu: unsupported keyboard cmd=0x%02lx\n", val);
         break;
     }
 }
-- 
2.18.0.rc2

