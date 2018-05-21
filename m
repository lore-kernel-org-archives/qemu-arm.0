Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311163wme;
        Mon, 21 May 2018 07:04:09 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo57i+BlEtvMYTkl2IlErWoAzLZnGmyFGmTA6k0j3j/YDK5CxKUPiINgVRNO8bysxG614rf
X-Received: by 2002:a19:4355:: with SMTP id m21-v6mr922058lfj.21.1526911449079;
        Mon, 21 May 2018 07:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911449; cv=none;
        d=google.com; s=arc-20160816;
        b=V1/YGmYYWSucrKOpGLXG5ShrHgBfeCS2gS/MNk5tv3dUnKTNYIFv+JgqCmZJO3F/6R
         hTePgk5J3w69o2XVKBed/MWNs6XAjtnIGxshuhRVjRm+Ae22J9Xd3XIxSp+dKxTh26Dd
         NjfWMNEN/J5NHsu0lKvBga34vT8ZVhB9DbVN8gNBNxBAlaEHSBiy53xdTHNRr0JBVVV6
         IzUELCt8zfg8KZNbX/sqarNlKnjRZAX3/QUJrdrTo5gpfVAweG9re5MJtNR5k4bNwUec
         tXPk12HxFicXcpN274GTL4roFPGMQaNhB4mFTJf9Ax/BdXn9qkLKvKDUuAE9D3oZffFS
         o1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=H9+4xDwIc4jVdmkMrZqhsbAIHlPQ4wJmuJ+CLaw/xW0=;
        b=0d0CKUUhCne8jNBtfOZKcyNH1n3sbdNiS3jBJyEMFyImZ/91tkUOTfah0fOUjPhgO5
         E/ITFbfZQr0Jyf4QoDIw85jMD7AzIjvCv+/ykatjrjYXBI2x+WnN7QnbJ4tpmREkIERi
         MFYKkDExsqdyLWSMl7quZ/8aVDOQfH20v9Al2qpYICc9CEgN1bfhuFs4GVPw3f5AdewF
         fZYkzcC4p1MpAHdixwPSVhckOSSqgbUDTli7OrLP0q06GQJl9BE0F3beK6CsgARv80+9
         inFlsCef6HunRQkHEvIq4oxc9SE4T/SRDCEQlP9226MShi0ldXaDnWaARZGY2D8LejV7
         Qr1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 17-v6si5602388ljo.166.2018.05.21.07.04.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:09 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ0-0007fb-7y; Mon, 21 May 2018 15:04:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 07/27] Make memory_region_access_valid() take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:42 +0100
Message-Id: <20180521140402.23318-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: 1Hlla/d8C6lN

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to memory_region_access_valid().
Its callers either have an attrs value to hand, or don't care
and can use MEMTXATTRS_UNSPECIFIED.

The callsite in flatview_access_valid() is part of a recursive
loop flatview_access_valid() -> memory_region_access_valid() ->
 subpage_accepts() -> flatview_access_valid(); we make it pass
MEMTXATTRS_UNSPECIFIED for now, until the next several commits
have plumbed an attrs parameter through the rest of the loop
and we can add an attrs parameter to flatview_access_valid().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory-internal.h | 3 ++-
 exec.c                         | 4 +++-
 hw/s390x/s390-pci-inst.c       | 3 ++-
 memory.c                       | 7 ++++---
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index 58399b9318..56c25c0ef7 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -37,7 +37,8 @@ void flatview_unref(FlatView *view);
 extern const MemoryRegionOps unassigned_mem_ops;
 
 bool memory_region_access_valid(MemoryRegion *mr, hwaddr addr,
-                                unsigned size, bool is_write);
+                                unsigned size, bool is_write,
+                                MemTxAttrs attrs);
 
 void flatview_add_to_dispatch(FlatView *fv, MemoryRegionSection *section);
 AddressSpaceDispatch *address_space_dispatch_new(FlatView *fv);
diff --git a/exec.c b/exec.c
index 718b33921b..6cf97b5d28 100644
--- a/exec.c
+++ b/exec.c
@@ -3468,7 +3468,9 @@ static bool flatview_access_valid(FlatView *fv, hwaddr addr, int len,
         mr = flatview_translate(fv, addr, &xlat, &l, is_write);
         if (!memory_access_is_direct(mr, is_write)) {
             l = memory_access_size(mr, l, addr);
-            if (!memory_region_access_valid(mr, xlat, l, is_write)) {
+            /* When our callers all have attrs we'll pass them through here */
+            if (!memory_region_access_valid(mr, xlat, l, is_write,
+                                            MEMTXATTRS_UNSPECIFIED)) {
                 return false;
             }
         }
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 02a815fd31..d1a5f79678 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -762,7 +762,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
     mr = s390_get_subregion(mr, offset, len);
     offset -= mr->addr;
 
-    if (!memory_region_access_valid(mr, offset, len, true)) {
+    if (!memory_region_access_valid(mr, offset, len, true,
+                                    MEMTXATTRS_UNSPECIFIED)) {
         s390_program_interrupt(env, PGM_OPERAND, 6, ra);
         return 0;
     }
diff --git a/memory.c b/memory.c
index fc7f9b782b..279f7c9b4a 100644
--- a/memory.c
+++ b/memory.c
@@ -1347,7 +1347,8 @@ static const MemoryRegionOps ram_device_mem_ops = {
 bool memory_region_access_valid(MemoryRegion *mr,
                                 hwaddr addr,
                                 unsigned size,
-                                bool is_write)
+                                bool is_write,
+                                MemTxAttrs attrs)
 {
     int access_size_min, access_size_max;
     int access_size, i;
@@ -1416,7 +1417,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
 {
     MemTxResult r;
 
-    if (!memory_region_access_valid(mr, addr, size, false)) {
+    if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
         *pval = unassigned_mem_read(mr, addr, size);
         return MEMTX_DECODE_ERROR;
     }
@@ -1458,7 +1459,7 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          unsigned size,
                                          MemTxAttrs attrs)
 {
-    if (!memory_region_access_valid(mr, addr, size, true)) {
+    if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
         unassigned_mem_write(mr, addr, data, size);
         return MEMTX_DECODE_ERROR;
     }
-- 
2.17.0
