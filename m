Received: by 10.223.159.82 with SMTP id f18csp1525180wrg;
        Fri, 1 Dec 2017 10:51:40 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbopXS2ufpM1/RCvcETeCLdArHT3UWeZxltBuRfzX83ryVzGodAMllqscBZxQjmNEk+FQlX
X-Received: by 10.28.13.212 with SMTP id 203mr1807560wmn.141.1512154300898;
        Fri, 01 Dec 2017 10:51:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512154300; cv=none;
        d=google.com; s=arc-20160816;
        b=uI3KmwwWh8BrzflSduJVxncm4higSi9MuAe7rIXVOdZqDR7WWbxgCC4unEJdqYp7T0
         zoJ7ahdooBsqtwozVswVgjLX6dolJ8VqYqXiy19d5VBBYHplLPU6/d2lQFCBdAmDD3gf
         w/LagIzeO+NQh41fYSnVUi4il7f9Uc5QKLsthSTAbIAWE2jdw/IBO1XTou822gWaWbW1
         SdZfiWy+ryI07ffsjbgA2bVRdCCzk3RmKDcJPYM+4IcaGBp4Z5esh3M0kUwt5rcc4VYa
         i93c5AciO4dVhAemp83t+Gz5SxRPtlVTTvu+QAB+rOaEy4i6GzOJWKKyvbBw4EzkJLDO
         +vzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=+b4ccRhHMY4ig1v1uVnTTJOfEPHcFzz19hm4rE0VzGc=;
        b=PDTMT0uf2J4WcoCm05PzUIWyWGdzyTBwBW49TQIFfkPl/xS7DoG/vs7Fxw8PmRh0R/
         hZjZfiHGIxs3ctP8I8IYkXoJULlWLL2H9THOwgX9m30cJqy3D8KEVWDlbk214SJWglTL
         kmyUVqjKsPMhp4alkAwU+fhH4vrNUFnol4ncAJ6OobSk0zjelH6oOSXfZLVqHHml+TyR
         ILc33/RlbJpBJfj4f9+eBfFeXo21tEYLlz2FWG8UQTXNDdJ2EgOiKVUVNv9ENCB5B494
         C3rL9VIs6kR3kcoejuLXh2ST4AQ6FdM8f+Gih6YHoCCucVYMTnH2YBMY2N70yT9CIgOF
         O4Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id k11si5587011wrd.429.2017.12.01.10.51.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:51:40 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqPR-0007Bs-RZ; Fri, 01 Dec 2017 18:51:37 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/2] nvic: Make nvic_sysreg_ns_ops work with any MemoryRegion
Date: Fri,  1 Dec 2017 18:51:35 +0000
Message-Id: <1512154296-5652-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512154296-5652-1-git-send-email-peter.maydell@linaro.org>
References: <1512154296-5652-1-git-send-email-peter.maydell@linaro.org>
X-TUID: YqA3beamubdA

Generalize nvic_sysreg_ns_ops so that we can pass it an
arbitrary MemoryRegion which it will use as the underlying
register implementation to apply the NS-alias behaviour
to. We'll want this so we can do the same with systick.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 5d9c883..63f2743 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1786,10 +1786,12 @@ static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
                                         uint64_t value, unsigned size,
                                         MemTxAttrs attrs)
 {
+    MemoryRegion *mr = opaque;
+
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
-        return nvic_sysreg_write(opaque, addr, value, size, attrs);
+        return memory_region_dispatch_write(mr, addr, value, size, attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -1803,10 +1805,12 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, hwaddr addr,
                                        uint64_t *data, unsigned size,
                                        MemTxAttrs attrs)
 {
+    MemoryRegion *mr = opaque;
+
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
-        return nvic_sysreg_read(opaque, addr, data, size, attrs);
+        return memory_region_dispatch_read(mr, addr, data, size, attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2075,7 +2079,7 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
 
     if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
         memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
-                              &nvic_sysreg_ns_ops, s,
+                              &nvic_sysreg_ns_ops, &s->sysregmem,
                               "nvic_sysregs_ns", 0x1000);
         memory_region_add_subregion(&s->container, 0x20000, &s->sysreg_ns_mem);
     }
-- 
2.7.4
