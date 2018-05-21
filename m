Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311197wme;
        Mon, 21 May 2018 07:04:10 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrAlMiTaMfewW5bYEfpvoBb7WAXkUl4xXLhni3fbu3MKQo6Y80vsm0KjjpBaQ2m37t/dm40
X-Received: by 2002:adf:a005:: with SMTP id k5-v6mr15414560wrk.202.1526911450184;
        Mon, 21 May 2018 07:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911450; cv=none;
        d=google.com; s=arc-20160816;
        b=CinxJuiKTgrNo+Hkf8+8Jshq6tl3fnp/3/c6FLYdsg10QZDojmlDNHBgq72BKWv4WD
         zEVHy6oQ0QIv2TuNc/0i1agUsvgP0ffQE9YvdMjnVk1KDiN934uSrWLCPcABoxhlB3Ki
         Tgf1hMTgKUFrTTM+HFN/rZhtr16oKdwuVNs/ZMIJ3ayEaGCEd+jCwuRLPQAhFtHYuLTf
         qPbS/5Xpzo+JTwr1u+V3uNiV4tJ0fUWBrqRpVy8YSRSSEMhjhHaTjQtr91dW3x692lTf
         dCdg6/RxId3dxB8f3cff4S1XqKMad5+8EJMfqdtVJysBbhHfDpkVxW6Yd2ZHX8tnkHgU
         b9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=QzYmlvT9U/s4ORl9r/qcB6AckNwO+FpUHuQPPoGcKwQ=;
        b=AqYNSWamMy67EbQDNfGiAvmKYxCE27SWgpRUEG+iy9WvlV2jCCqLMRCUKUYaVHH1Mb
         eKRR2GFyJRAPcnwyRKjQy0y3omkT2O16s9VGqKOUToTvquqa12sgMH8KHR1IzsvwEGzf
         Q2N9e4DgoxuBFMQ6rPTNkQS0UbUuNVe5aNQ9HB57XlS2rn0zSOu+1vHYST1DD//H+2ki
         /brkHdz+KDafkdDv/F76V6uPFJPugUyzrim2xoOr1zuMV6fkTQ3OYUo2Llbq4R//Ffcl
         /hz6UyvA4Cqvw1dJtPThZHMEjyfWoTzD0xfHW6wafWQb8SIcc4HT9xlA/vaLxxg8z4Bx
         kc7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id u3-v6si13060344wrm.444.2018.05.21.07.04.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ1-0007gU-Mb; Mon, 21 May 2018 15:04:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 09/27] Make flatview_access_valid() take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:44 +0100
Message-Id: <20180521140402.23318-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: oU3RSorOxlqL

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to flatview_access_valid().
Its callers now all have an attrs value to hand, so we can
correct our earlier temporary use of MEMTXATTRS_UNSPECIFIED.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/exec.c b/exec.c
index b58eb0fedd..9229fb4058 100644
--- a/exec.c
+++ b/exec.c
@@ -2697,7 +2697,7 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
 static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
                                   const uint8_t *buf, int len);
 static bool flatview_access_valid(FlatView *fv, hwaddr addr, int len,
-                                  bool is_write);
+                                  bool is_write, MemTxAttrs attrs);
 
 static MemTxResult subpage_read(void *opaque, hwaddr addr, uint64_t *data,
                                 unsigned len, MemTxAttrs attrs)
@@ -2773,7 +2773,7 @@ static bool subpage_accepts(void *opaque, hwaddr addr,
 #endif
 
     return flatview_access_valid(subpage->fv, addr + subpage->base,
-                                 len, is_write);
+                                 len, is_write, attrs);
 }
 
 static const MemoryRegionOps subpage_ops = {
@@ -3461,7 +3461,7 @@ static void cpu_notify_map_clients(void)
 }
 
 static bool flatview_access_valid(FlatView *fv, hwaddr addr, int len,
-                                  bool is_write)
+                                  bool is_write, MemTxAttrs attrs)
 {
     MemoryRegion *mr;
     hwaddr l, xlat;
@@ -3472,8 +3472,7 @@ static bool flatview_access_valid(FlatView *fv, hwaddr addr, int len,
         if (!memory_access_is_direct(mr, is_write)) {
             l = memory_access_size(mr, l, addr);
             /* When our callers all have attrs we'll pass them through here */
-            if (!memory_region_access_valid(mr, xlat, l, is_write,
-                                            MEMTXATTRS_UNSPECIFIED)) {
+            if (!memory_region_access_valid(mr, xlat, l, is_write, attrs)) {
                 return false;
             }
         }
@@ -3493,7 +3492,7 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr,
 
     rcu_read_lock();
     fv = address_space_to_flatview(as);
-    result = flatview_access_valid(fv, addr, len, is_write);
+    result = flatview_access_valid(fv, addr, len, is_write, attrs);
     rcu_read_unlock();
     return result;
 }
-- 
2.17.0
