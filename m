Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp405649wrt;
        Fri, 5 Oct 2018 06:30:38 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63U0vZuQZQzrP7v0coSkWDAQopNFdvQJFC9AxxliBsP9W7d0zl2x1bKlXz0NmWlinDca+BU
X-Received: by 2002:a37:30d4:: with SMTP id w203-v6mr8880914qkw.106.1538746238851;
        Fri, 05 Oct 2018 06:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538746238; cv=none;
        d=google.com; s=arc-20160816;
        b=SRkO9Y/9cIjz/t/TtiOm+g0UldGUnoHDlCSFCy+6rzsvvpxf2hkoEW94IAIkGQaLEq
         eL/qhtuNLvkAduK44RKfdMzX1WtLT3HLw+TRRGHjafwsVkNdASS3Fa3pfbEziFfDV8lQ
         3LfHSPCVdOGzY/UgajDhojq8bWNvicyvNbGB6NMg/5ZWxrA4OkfCDTVvpDLgITVcEmvO
         jhlB6Z5dgT2fofYEjUNZif7kz7cyy4HpWCK/iSDPWCOyLPvuQZMp+N49ihJ+7P4JPsl8
         9eithdwGGWlRp/V9vBReewtNYOBkSck1L0kHlAA3nWxfMVm3jabSRWHHz9ZjB0TKisAC
         oOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=mvQm36icIXjN7f7xulJMaX9qZ0k3CZyoZqUdsAh8ORo=;
        b=UGF4smOh9qWTva7ADy8eMAtUtQCrQgmtyzv9s+ZCMJJC9oOs6obiitSL5Hq7vcpRiV
         AYADeait/zQ9Pl/vjbvN7KWy2lbDeUIOn5Yk7oLnHUxunNElemBxfBAkHK47BeBjhcJj
         t3i980oqewMKAtzd5eFJLmYJlvOhsXp6oyOT4Hrmi0DVF3z4pAXhgxaY3ls01ddwoUUj
         g/atvkzF3xKVEifBebsrrOW9CdvG+a5ybO9FaDYmRB2amOy8aNncaG2P9leRgzU35MaF
         vjCc5UGjXwQU85bY3e3BoDnUB2JpshJxYb+jw6zRgEOlgMlO2FxwxUWqhXlMJ03BaOR1
         MA0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17-v6si720708qvo.77.2018.10.05.06.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 06:30:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8QBi-0001nV-DY
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 09:30:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g8QBb-0001nP-KV
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 09:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g8QBZ-0003qE-Lp
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 09:30:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51640)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g8QBZ-0003ds-CL; Fri, 05 Oct 2018 09:30:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g8QBM-0001CE-7R; Fri, 05 Oct 2018 14:30:16 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  5 Oct 2018 14:30:12 +0100
Message-Id: <20181005133012.26490-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] hw/display/bcm2835_fb: Silence Coverity warning
 about multiply overflow
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: po072KEM98G0

Coverity complains (CID 1395628) that the multiply in the calculation
of the framebuffer base is performed as 32x32 but then used in a
context that takes a 64-bit hwaddr. This can't actually ever
overflow the 32-bit result, because of the constraints placed on
the s->config values in bcm2835_fb_validate_config(). But we
can placate Coverity anyway, by explicitly casting one of the
inputs to a hwaddr, so the whole expression is calculated with
64-bit arithmetic.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is one of those cases where I was 50/50 about whether to just
mark the coverity issue as a false-positive.

 hw/display/bcm2835_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index d534d00a65f..599863e4e17 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -190,7 +190,7 @@ static void fb_update_display(void *opaque)
     }
 
     if (s->invalidate) {
-        hwaddr base = s->config.base + xoff + yoff * src_width;
+        hwaddr base = s->config.base + xoff + (hwaddr)yoff * src_width;
         framebuffer_update_memory_section(&s->fbsection, s->dma_mr,
                                           base,
                                           s->config.yres, src_width);
-- 
2.19.0

