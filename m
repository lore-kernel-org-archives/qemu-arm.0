Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311294wme;
        Mon, 21 May 2018 07:04:13 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoeN+utXxp2qYGBKRzStfx4msIxt6KSgYOP78+aGjUyDtm6dyzvHsGO0u0lduk7vWpiOHaI
X-Received: by 2002:adf:99b5:: with SMTP id y50-v6mr14410809wrb.168.1526911453161;
        Mon, 21 May 2018 07:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911453; cv=none;
        d=google.com; s=arc-20160816;
        b=gRfzbPW4nsxiszGkE0mPeNQ5quuwdc70U+/i9mEwkwSwwI24ZLWw6KBOTGEtgsXid3
         /Fe1J13nHi6HLcmirv1Mlaf1HIh0mf2E8pxE3f6OiUeys78wGJNLzjdw2azsLBUiCWiU
         bCrydhTRwvpG156GMEfZSjF3DVwX0NFIUGnyCqJ8yKy94grSpt04QqhSpcbJ/7OC0qrT
         9Kezvn6UZfC18916waaC2u1CY3ub7Uvfgnk8kk1IGeyZj1EupkmZ0DJ/4eSyUmIXFudY
         ek+o/uGE6pu3M8IjPIfBy3q6iL25t4gTcEp8lP3t0fEB0vIVYnJmYUx1NSEtfKOYFX/A
         t9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=DQfFJzoJGipbur9asoYSEu/pFGJLlLUY34D0uAie9hk=;
        b=jszRo9RAh3lPjZI6Itw5gZM0+cDNZPuL763f/syKtiUuWePpMbSZ0C4AoSEVWxYBOl
         QwhyJZ1189vUTByGZglopugbfCAnxShzDZIoKMpbJUe7fX9MGW/r0cMD4WdeEmny47kh
         uNuG/avVjhhzPH401L8DthRtJUBWY8J37Zn4SL0ADnf6a2WbvZzmp/p9xTw4A4iEQrgx
         LZK0zK0c31LTiGOTRJg7khKqw2mqtgCewHmsVOVZtcPFvqiLYPQF/ef9RAAyte6MnZB5
         Mco+bcjVX9gZhWGMzrj7rUmayMbxQkvMevfQH2/Wf+QaUXbnjBBH7lx7fZdrxmFQ04hQ
         AVig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id d44-v6si12685303wrd.184.2018.05.21.07.04.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ4-0007ih-Mk; Mon, 21 May 2018 15:04:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 13/27] Make address_space_translate_iommu take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:48 +0100
Message-Id: <20180521140402.23318-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: bJUK9YGrGc2f

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to address_space_translate_iommu().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/exec.c b/exec.c
index af2b82d154..c3baadc349 100644
--- a/exec.c
+++ b/exec.c
@@ -478,6 +478,7 @@ address_space_translate_internal(AddressSpaceDispatch *d, hwaddr addr, hwaddr *x
  * @is_write: whether the translation operation is for write
  * @is_mmio: whether this can be MMIO, set true if it can
  * @target_as: the address space targeted by the IOMMU
+ * @attrs: transaction attributes
  *
  * This function is called from RCU critical section.  It is the common
  * part of flatview_do_translate and address_space_translate_cached.
@@ -488,7 +489,8 @@ static MemoryRegionSection address_space_translate_iommu(IOMMUMemoryRegion *iomm
                                                          hwaddr *page_mask_out,
                                                          bool is_write,
                                                          bool is_mmio,
-                                                         AddressSpace **target_as)
+                                                         AddressSpace **target_as,
+                                                         MemTxAttrs attrs)
 {
     MemoryRegionSection *section;
     hwaddr page_mask = (hwaddr)-1;
@@ -572,7 +574,7 @@ static MemoryRegionSection flatview_do_translate(FlatView *fv,
         return address_space_translate_iommu(iommu_mr, xlat,
                                              plen_out, page_mask_out,
                                              is_write, is_mmio,
-                                             target_as);
+                                             target_as, attrs);
     }
     if (page_mask_out) {
         /* Not behind an IOMMU, use default page size. */
@@ -3735,7 +3737,7 @@ static inline MemoryRegion *address_space_translate_cached(
 
     section = address_space_translate_iommu(iommu_mr, xlat, plen,
                                             NULL, is_write, true,
-                                            &target_as);
+                                            &target_as, attrs);
     return section.mr;
 }
 
-- 
2.17.0
