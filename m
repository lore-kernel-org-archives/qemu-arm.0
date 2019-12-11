Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp761270lff;
        Wed, 11 Dec 2019 07:13:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxaIjNHoWjQZ2lf9Q9Z2pMpCjcdrbcLnGJcGLORdvtRhDmZ5V38lujS3mzklTYywud2WjE/
X-Received: by 2002:a9d:74c4:: with SMTP id a4mr2688589otl.119.1576077193365;
        Wed, 11 Dec 2019 07:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576077193; cv=none;
        d=google.com; s=arc-20160816;
        b=h1tcmxU8mP7vjkEF/6E4byEraJt7jFgFHyb6sNc9Hf51iKNMLzX6UVIMf+8fq4I0wR
         OtXy+dxCMwpcwssp3lw42se3URbZ8XDexu6pYiv0066Bg8RpH9Rtm5kAmTHYBOHPZyEM
         dbKU+1qLM3neLWJU45+K25uAENspW/H8ZH8p41cMNZfi2bZggDo4nuQYDnCn8PTHN/Ec
         nOiNi14GrkORfgfj5Zfm0ME6ark6+OGcXvSjTQq0wz6h3/X6TeMSWU/QlXd7wo9X1jo/
         laHMCmOi+jN0dLekOhdPrQZRMWPwTCXzPmCuC56jSOuqjUgmW3r12GacQvM4Nn4cvuFp
         5Ssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=tRSad7WoTFOponF+G6UnpmzO4ecidPjoO2ZvHdSbdBA=;
        b=SHkHBIRjqocYpTKfAVjtt88GcbvRgc36alAHow7er35w3M25uHaXjE8UnaXeEP72Zz
         ZgBXo4w/Kolc70n2oacwRvK05Og4sQTBaiAQ+BugT1VneCFT0yXEJ57vD8jCnzRHkEeD
         xxmNFuthvMTn76HI344ex25vRHuU+lQ7z+t49B49DgcNJSYtrnuCnsmsNg7yU8lJBKXy
         lov3Yfocyc2rvHj0JVkXhWBxxDdZscj/bqPSfTIQ/Y9vnsSiXN9KgQt4eZ2Mtheeq7NV
         1vbe4/viefgWWJml+693iIrsPZXkGbjUh5XFzpgQ+KlhrZU2mU+7ss/WKTZ1odswJ+34
         zs+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=ADdjV5nR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a93si1299464otc.24.2019.12.11.07.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 07:13:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=ADdjV5nR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1if3fs-0007V0-Ar
	for alex.bennee@linaro.org; Wed, 11 Dec 2019 10:13:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3bR-0003Hd-Fc
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:08:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3bM-0004RG-82
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:08:37 -0500
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:35431)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3bJ-0004Ly-Ih; Wed, 11 Dec 2019 10:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576076909; x=1607612909;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=tRSad7WoTFOponF+G6UnpmzO4ecidPjoO2ZvHdSbdBA=;
 b=ADdjV5nRf7ueNSkJrwFRwPbKPH7Y0xGYLQV/7IY2m/kldTBhPtvWMTTg
 OckHftdehF7aFAueqeUzRUsFo1H6nYgq0LBylKf9F6VNOaYcFE/3y1xUM
 CukiPkYuE9yfzHW3T4j/cBcRaqKFq/0FwVUnUs5/4QltWW/MuY4YHCg8+ 0=;
IronPort-SDR: JcPP2yMluJHY+DoWPRrIJwSu9G0JvoEXHllVdbQlyJy8CIHQQM9QB4XEHl0ggDQomO3RXbXyh1
 is0wASgBoSag==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; d="scan'208";a="12924716"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 11 Dec 2019 15:08:05 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (iad7-ws-svc-lb50-vlan3.amazon.com [10.0.93.214])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id B51A7A2362; Wed, 11 Dec 2019 15:08:03 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBBF80aL024989; Wed, 11 Dec 2019 16:08:00 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBBF7xqR024987;
 Wed, 11 Dec 2019 16:07:59 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 4/6] hw/arm/smmuv3: Align stream table base address to
 table size
Date: Wed, 11 Dec 2019 16:07:38 +0100
Message-Id: <1576076860-24820-2-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576076860-24820-1-git-send-email-sveith@amazon.de>
References: <1576076260-18659-1-git-send-email-sveith@amazon.de>
 <1576076860-24820-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 207.171.184.29
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: phqmeLw9hMk9

Per the specification, and as observed in hardware, the SMMUv3 aligns
the SMMU_STRTAB_BASE address to the size of the table by masking out the
respective least significant bits in the ADDR field.

Apply this masking logic to our smmu_find_ste() lookup function per the
specification.

ref. ARM IHI 0070C, section 6.3.23.

Signed-off-by: Simon Veith <sveith@amazon.de>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
Changed in v2:

* Now using MAKE_64BIT_MASK()
* Eliminated unnecessary branches by using MAX()
* Removed unnecessary range check against DMA_ADDR_BITS

 hw/arm/smmuv3.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 727558b..31ac3ca 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -376,8 +376,9 @@ bad_ste:
 static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
                          SMMUEventInfo *event)
 {
-    dma_addr_t addr;
+    dma_addr_t addr, strtab_base;
     uint32_t log2size;
+    int strtab_size_shift;
     int ret;
 
     trace_smmuv3_find_ste(sid, s->features, s->sid_split);
@@ -391,10 +392,16 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
     }
     if (s->features & SMMU_FEATURE_2LVL_STE) {
         int l1_ste_offset, l2_ste_offset, max_l2_ste, span;
-        dma_addr_t strtab_base, l1ptr, l2ptr;
+        dma_addr_t l1ptr, l2ptr;
         STEDesc l1std;
 
-        strtab_base = s->strtab_base & SMMU_BASE_ADDR_MASK;
+        /*
+         * Align strtab base address to table size. For this purpose, assume it
+         * is not bounded by SMMU_IDR1_SIDSIZE.
+         */
+        strtab_size_shift = MAX(5, (int)log2size - s->sid_split - 1 + 3);
+        strtab_base = s->strtab_base & SMMU_BASE_ADDR_MASK &
+                      ~MAKE_64BIT_MASK(0, strtab_size_shift);
         l1_ste_offset = sid >> s->sid_split;
         l2_ste_offset = sid & ((1 << s->sid_split) - 1);
         l1ptr = (dma_addr_t)(strtab_base + l1_ste_offset * sizeof(l1std));
@@ -433,7 +440,10 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
         }
         addr = l2ptr + l2_ste_offset * sizeof(*ste);
     } else {
-        addr = (s->strtab_base & SMMU_BASE_ADDR_MASK) + sid * sizeof(*ste);
+        strtab_size_shift = log2size + 5;
+        strtab_base = s->strtab_base & SMMU_BASE_ADDR_MASK &
+                      ~MAKE_64BIT_MASK(0, strtab_size_shift);
+        addr = strtab_base + sid * sizeof(*ste);
     }
 
     if (smmu_get_ste(s, addr, ste, event)) {
-- 
2.7.4

