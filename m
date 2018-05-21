Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311134wme;
        Mon, 21 May 2018 07:04:08 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpzkJG9BIpmOKEdKOCNvOhxt3m6yG7gFcVdHsWB7yVHWdPrePDpRxT0tkt/fof8oVoDFQJM
X-Received: by 2002:adf:8672:: with SMTP id 47-v6mr15105789wrw.102.1526911448007;
        Mon, 21 May 2018 07:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911448; cv=none;
        d=google.com; s=arc-20160816;
        b=gCpFXv/3FZkvhMyI+T70AJnYBZMXVPdXEwkqN3ufYEuc/FCRK7/nwdIt8DPcxDr+BO
         7VTH5PSbueeBXJGiJDEooFVwcSrIUhq8ZHuJCOQG3oiD6ynWfHDeJMfhA1JYSOo43in+
         gbXVDXEu6LEPbS8LZwWHaJew3bxpFwPI/q5KO5zDTA5f8BMpTE9lJdzjdIOE2xDm1KCE
         VrU3GzszEkySWtDLqiIBXPV6GTLxBjzjjyC9gUU+jOIRxn+UqlKirffZvM04sGmB3ohO
         2LfXRrNLhd8JFnkb91A9/lNnPul95UIDpiH59pDkWU3jxb68K296D0+8ye80VWuXuJQM
         3n4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=iyx/De1AGQYQ6ALfswHadxKz0csKafoUHl2t5sslU+Y=;
        b=jCGoc7V78Aedcg/nTsYUEjrFsz8lNjWlmGTETcjdF5T+YVvZZ9xUsUtFhuH6KHHyPl
         mltz2iefSCCRYUuTWqT4ieOPNk4sORgFVQB5+Sd23SefNkoHrSRfk1LvigSgt1g+2V2G
         hIglN08os7ZMnCtchdpWEqdYA4FnWvWZyE8cstyVSwLGdu+QARIEO6yF1AraegMGOEnx
         qKgCPBuR0q/+fcKTiB67JoTHZA6j4vcpQ18zqY99Z9qKHVffB2V7I6pKyw1sKIIh8pVI
         l1EdqoKjt5B7imU84U5CpTu/elNIldwBS2suMIqbWk8eFZkzl10ACK4/PGUnTJDoyXT8
         cDRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id l74-v6si11219498wma.101.2018.05.21.07.04.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlPz-0007fK-HO; Mon, 21 May 2018 15:04:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 06/27] Make flatview_extend_translation() take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:41 +0100
Message-Id: <20180521140402.23318-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: wbcwTeIwZg84

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to flatview_extend_translation().
Its callers either have an attrs value to hand, or don't care
and can use MEMTXATTRS_UNSPECIFIED.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/exec.c b/exec.c
index 22af4e8cb9..718b33921b 100644
--- a/exec.c
+++ b/exec.c
@@ -3495,9 +3495,9 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr,
 
 static hwaddr
 flatview_extend_translation(FlatView *fv, hwaddr addr,
-                                 hwaddr target_len,
-                                 MemoryRegion *mr, hwaddr base, hwaddr len,
-                                 bool is_write)
+                            hwaddr target_len,
+                            MemoryRegion *mr, hwaddr base, hwaddr len,
+                            bool is_write, MemTxAttrs attrs)
 {
     hwaddr done = 0;
     hwaddr xlat;
@@ -3574,7 +3574,7 @@ void *address_space_map(AddressSpace *as,
 
     memory_region_ref(mr);
     *plen = flatview_extend_translation(fv, addr, len, mr, xlat,
-                                             l, is_write);
+                                        l, is_write, attrs);
     ptr = qemu_ram_ptr_length(mr->ram_block, xlat, plen, true);
     rcu_read_unlock();
 
@@ -3659,8 +3659,13 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
     mr = cache->mrs.mr;
     memory_region_ref(mr);
     if (memory_access_is_direct(mr, is_write)) {
+        /* We don't care about the memory attributes here as we're only
+         * doing this if we found actual RAM, which behaves the same
+         * regardless of attributes; so UNSPECIFIED is fine.
+         */
         l = flatview_extend_translation(cache->fv, addr, len, mr,
-                                        cache->xlat, l, is_write);
+                                        cache->xlat, l, is_write,
+                                        MEMTXATTRS_UNSPECIFIED);
         cache->ptr = qemu_ram_ptr_length(mr->ram_block, cache->xlat, &l, true);
     } else {
         cache->ptr = NULL;
-- 
2.17.0
