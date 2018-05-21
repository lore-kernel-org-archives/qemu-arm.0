Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311272wme;
        Mon, 21 May 2018 07:04:12 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo1ilvVEe0ZAfvYCbfZNuFYhvjLksmYJniMgIPW3PILvWeGXI3KOodHnK+SXObBQu0EePuh
X-Received: by 2002:a1c:7cf:: with SMTP id 198-v6mr11665690wmh.149.1526911452608;
        Mon, 21 May 2018 07:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911452; cv=none;
        d=google.com; s=arc-20160816;
        b=szReUMYREUIq9SM3LyVXN+1zhhcHHiHFmm+B9c4aKfFOfMesAlQoVwGpYNYTeLwuIX
         y4Lb20/R264uNY6F+S53Ih7XywpTL7l1e3Bkwc3tsQu2RW+UTU3m5wyrVHzl5q90DRtD
         gmWeSyiVS7yKj1iAEeFx0plU+wq/z/RatdfiCWmsEiREn50dQuuWWgE6y6fzF/kAmFlJ
         U5+yMKxuht3GHob3LRlo3OZH7Iuwzs72pfEvUaam2KljdSuSTGpFJwiazXFCbRu8umt3
         pR9df4gi2nVVpe0lMI+GIOeODoAR6bX2BFQgfY4D8H0kb3szTZe2QHOJYzk5jNSYCyuq
         A/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=jOBSFgfmkLIYu248llRvedu6w9I/v9HVekUWEGcLTQg=;
        b=LBw7mjURdnPp9M/OL695f4j5TTt4LDlxQTpmzRbKiRhMM4MeXnpTbqkGJB8wqNfF0W
         Q8w+ji9ZPY8ZyRvwX2gpxGrF/1k2fZEMgquVFhpRAZhXCBTC7AHEyubQO32CHKgDQjJN
         CPvv9uVE2g2Fxb9c1B7fkHBNcIdjsa0veGqbCE5WoDt8aK7e7JPhera/5kc8RLNBdX19
         bIpN6S0s6P1qjn1bUkob/76Lxjw650957cB3hWY8IlgMG0NnWSNdodvd3inaN9dvr8wa
         kSsGCZHqXf2aLQbcMqEsvL9LFaRwvbc8EjkQ6YmPh97n+Dg7TTGJFWK8wT6J0NyqnruL
         HbEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id n68-v6si12530141wrb.262.2018.05.21.07.04.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ4-0007i0-2B; Mon, 21 May 2018 15:04:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 12/27] Make flatview_do_translate() take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:47 +0100
Message-Id: <20180521140402.23318-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: 7vMg4o0Fdkrx

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to flatview_do_translate().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/exec.c b/exec.c
index 84f2c21ecb..af2b82d154 100644
--- a/exec.c
+++ b/exec.c
@@ -541,6 +541,7 @@ unassigned:
  * @is_write: whether the translation operation is for write
  * @is_mmio: whether this can be MMIO, set true if it can
  * @target_as: the address space targeted by the IOMMU
+ * @attrs: memory transaction attributes
  *
  * This function is called from RCU critical section
  */
@@ -551,7 +552,8 @@ static MemoryRegionSection flatview_do_translate(FlatView *fv,
                                                  hwaddr *page_mask_out,
                                                  bool is_write,
                                                  bool is_mmio,
-                                                 AddressSpace **target_as)
+                                                 AddressSpace **target_as,
+                                                 MemTxAttrs attrs)
 {
     MemoryRegionSection *section;
     IOMMUMemoryRegion *iommu_mr;
@@ -592,7 +594,8 @@ IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
      * but page mask.
      */
     section = flatview_do_translate(address_space_to_flatview(as), addr, &xlat,
-                                    NULL, &page_mask, is_write, false, &as);
+                                    NULL, &page_mask, is_write, false, &as,
+                                    attrs);
 
     /* Illegal translation */
     if (section.mr == &io_mem_unassigned) {
@@ -627,7 +630,7 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
 
     /* This can be MMIO, so setup MMIO bit. */
     section = flatview_do_translate(fv, addr, xlat, plen, NULL,
-                                    is_write, true, &as);
+                                    is_write, true, &as, attrs);
     mr = section.mr;
 
     if (xen_enabled() && memory_access_is_direct(mr, is_write)) {
-- 
2.17.0
