Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2786442wrg;
        Mon, 17 Jun 2019 10:55:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcAmM/j//2Blip7E2Y5/CXozT89Ysh49KqUoPUXatdtMz30J6/7xoNvKFJOlbSu2EBnYG0
X-Received: by 2002:ac2:5205:: with SMTP id a5mr1691040lfl.143.1560794140201;
        Mon, 17 Jun 2019 10:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560794140; cv=none;
        d=google.com; s=arc-20160816;
        b=HX4u3KYcc8jVUj9oiFWpJTI0BgvxEVLoluZR1c1LvdGlpAF5CEm11Av/pWOIlnK6tS
         XYdB7JGRb79IdiBXouHIv/tBDTwDoE6ag3Nui8nUsu3z74mwoNxB8Ot/wjLArcJeKeyq
         478Q9HJF06+8e4UgAZReeKfxqMQrOgoOS6hQlR22Q83skxre9VsxLHs5N6qJvMgannlD
         KHFlT3zqAXJyEB/IeM238yaC1+9gflblARuuW5/nAerbZOmWrB7R6hg+0pisI3xoFO9R
         tGcc8ou4sMgW0xrtlABxhm2IX+hNOOZVquu92J5xCsej+2v9l24wMQYaq+AexBXh7S46
         UOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=tkA5eV6B+7bWXMQLTUuNg6Ny6QzZoudF4r4qdXt2dKw=;
        b=RgCJjRPPzlsdxUSG54x3vVHm6g2foouScGji0XOQ0x0FUOBIkHH5CLL/r6/LF8rUmD
         APF0eamDXGI54RH0a1wtKYnmk2/6csjWCvCDN7H1U0VChIK5aMn6/wcvFNJGnAWAF6jR
         dKLAf9onMlNiKLuSyc257BWw4pw2CzXB8Q0U8xY7msy/gm9eiRmahmMCe2J0H8/Df+rz
         fcFrikFi9yc+3c9xDwCQYQlM1mJpLt/qUjPkAzFg7mVJYLxyUJ1HDk5/7xJKf62DChl5
         gAAeLkcUXcfMA5FM/5ybC5wa7uIJNLSD7AbxipM9f3Dw+zlKAWAKuvad1Tv/Zo6z8vU1
         n5BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nRp4TDwe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si4377750ejb.205.2019.06.17.10.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 10:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nRp4TDwe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcvr0-0002ts-Dl
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 13:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50689)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcvot-0007fJ-Sq
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcvos-0000cE-D8
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:27 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34350)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcvos-0000av-7Q
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:26 -0400
Received: by mail-wm1-x342.google.com with SMTP id w9so499816wmd.1
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tkA5eV6B+7bWXMQLTUuNg6Ny6QzZoudF4r4qdXt2dKw=;
 b=nRp4TDwedZ2bj3uvzCgOxbHGnnIMrSlYGOSYYiyHPYh1po1TWvybV6Pwlhl7Fq2Vby
 37y1NjDzBOxUP72RK+H8m6+/ciJ3epPK9nK1chEsySdwlhzBZgO6JqJUqhKSBsdnu90f
 lNXgKc0U/B/pBM8ZBS1VrHhce79nNl92Oi6InE1A9HvZDHhECJMYF9trq6ZPpSUL8Yn5
 KfH0mLxTTPLq22qX2DyQIRaA75ecrOOaKbYcQpfrMcsMBSbP/ReX40n+M0P4YINsNQ3y
 WsVmdC/B/c3RacMMyl+i1hjcES2ifsNFXqa1zjTbt4wG6jKCLO21neU0DvVSAuzO2XHo
 gOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkA5eV6B+7bWXMQLTUuNg6Ny6QzZoudF4r4qdXt2dKw=;
 b=Dql0qGW9k0ChnZL4kwmmjwGwSwq7s3PMzrX/Mx44irpIzCUiCeDJRLZm3my4hqX7Aq
 hWjc3fyfYY9amU6H7IrWMBBCWqYQoEGVJvwad6uC2ZiPIwzlvvR2LhZxQNRdmDRcKC3w
 W4CBqtWcexZIRvFM4JiYQm9RSzrBdOTTBiMQoWos9o5eK6zMS8NjIWSQx4B+h9q7Gsei
 u7caK0NXetL1mBshKvf33neNk9Mo1PkvP1CLNngmCpKh8K3z99cOJXJPrHkQ47cQcJjy
 UwynEhk4rK5TGejOLBkBbSgnHhoDyAl4CsQi3p621UYDPM2kr3hBXgOsEJQpgqITuLQc
 /PNw==
X-Gm-Message-State: APjAAAWOvb7rQ5bqdjwC7AhR3qP/0qhKElPDkfE3vka13CZF3PF9cVKQ
 1fwb2YRZWCmeZdJxYBK6jH1Y1IL9uWHlaA==
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr20220508wmm.153.1560794003623; 
 Mon, 17 Jun 2019 10:53:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t14sm8713619wrr.33.2019.06.17.10.53.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 10:53:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 18:53:14 +0100
Message-Id: <20190617175317.27557-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617175317.27557-1-peter.maydell@linaro.org>
References: <20190617175317.27557-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 3/6] target/arm: v8M: Check state of exception
 being returned from
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M6XkZrf8a3bS

In v8M, an attempt to return from an exception which is not
active is an illegal exception return. For this purpose,
exceptions which can configurably target either Secure or
NonSecure are not considered to be active if they are
configured for the opposite security state for the one
we're trying to return from (eg attempt to return from
an NS NMI but NMI targets Secure). In the pseudocode this
is handled by IsActiveForState().

Detect this case rather than counting an active exception
possibly of the wrong security state as being sufficient.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 330eb728dd5..9f8f0d3ff55 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -860,7 +860,19 @@ int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure)
         return -1;
     }
 
-    ret = nvic_rettobase(s);
+    /*
+     * If this is a configurable exception and it is currently
+     * targeting the opposite security state from the one we're trying
+     * to complete it for, this counts as an illegal exception return.
+     * We still need to deactivate whatever vector the logic above has
+     * selected, though, as it might not be the same as the one for the
+     * requested exception number.
+     */
+    if (!exc_is_banked(irq) && exc_targets_secure(s, irq) != secure) {
+        ret = -1;
+    } else {
+        ret = nvic_rettobase(s);
+    }
 
     vec->active = 0;
     if (vec->level) {
-- 
2.20.1

