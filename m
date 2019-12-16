Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4679070lff;
        Mon, 16 Dec 2019 07:17:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvcGKQjTU5p8fY+bowfUzPc9Pdl9yN0F8Lnw3/MrxU6G09ED7bE5Q2ZD0pFJVkEiot/DYO
X-Received: by 2002:aca:5fc1:: with SMTP id t184mr10313031oib.20.1576509474273;
        Mon, 16 Dec 2019 07:17:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576509474; cv=none;
        d=google.com; s=arc-20160816;
        b=uOmjYSd7XbY17yqD4FUWzHjtoA9NDuh9278St9f8E/QsXkZwm0p0hqX2QMt/Iqz/az
         sBuS1EAZ2gknW3W9yn2tbF+JknQj1Sx2Qws8fxezMKVo1DBX0A5SKhKQ4fuA/AgOH8LW
         MITDmVTW1GpYPsf2+4g2TqcnNgVt4ht8X1luWeJ8QAt2CJKj5Y6+EYQ8mEBnqH94UpO2
         OVTsvE+Rv4oJNdXl9CjW7ZOeP/RYbP0g7iCxr/01l1x+VRf3ujpH98t1Eo1EJea9yykT
         EDf8D1nKKYLa6THBbCV1/bjZCNkJHAtFRUJh6pwJHdpB3/NGaJsOLrKZ7k/SkznSF25k
         o7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=tRSad7WoTFOponF+G6UnpmzO4ecidPjoO2ZvHdSbdBA=;
        b=Y0H4KlbNY1AWfeGx9vMvvnbubFCzhdTfFYzgiPGwwar/c8qduGBTeMEQi661SF8i5f
         M/LCqai6ZwSqbRcbcp3+56STgs99E6vZkL1I2sm8rVM960W8urz6wC4hGRHIu53DehkX
         J/BumPKm2YkQbJ5/KuvKYPCIew9a4I2KQ5CpCiBi/2Yp2lFDb5HYBhl5WiNqLuHhgg43
         nzb8U0mUEDXXWkY+FUfswgCLCINEL8XMVsuxmUgNQ1Z1HdMxtXJ6BdVOSIb++y0djPCZ
         vqH9nzhOxNUpp7joJqaxH5152shGInopyKCf1ZrqxG4P9XwpN3WVCcoRUkmVxhB8FmdM
         KmIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=fewE8Ynt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si10698754oib.192.2019.12.16.07.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 07:17:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=fewE8Ynt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:55424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igs88-0004H3-NL
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 10:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7c-0003qI-CU
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:17:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7b-0001sf-85
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:17:20 -0500
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:53953)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7b-0001qs-12; Mon, 16 Dec 2019 10:17:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576509439; x=1608045439;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=tRSad7WoTFOponF+G6UnpmzO4ecidPjoO2ZvHdSbdBA=;
 b=fewE8YntJ/FWHnvYXTIByiEhniOkO0YmXv7icz6MzYmHYElgL1Vc72vm
 BvoMJrHD9k+p4vy0lSKLN2NqAH4GpLZHQ8HXWZC1RV6x/foeQZ41Pe+Wz
 iYBeKdToncyL/CidOzjXPwsjATn41ttlJt/SNwPW4SUHsP/CqUErRHLTP 4=;
IronPort-SDR: mnslBslxYJbZJhEZ8OcfCdpE+K3DZv88iBICrIRMc+gsWHv2RpDWm9BKNMwj/dAT/NS2JtydBw
 dcbjh0+KcVDg==
X-IronPort-AV: E=Sophos;i="5.69,322,1571702400"; d="scan'208";a="15161854"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Dec 2019 15:17:08 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan2.amazon.com [10.247.140.66])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id CE46AA1F39; Mon, 16 Dec 2019 15:17:06 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBGFH4NR014072; Mon, 16 Dec 2019 16:17:04 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBGFH3iK014070;
 Mon, 16 Dec 2019 16:17:03 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 4/6] hw/arm/smmuv3: Align stream table base address to
 table size
Date: Mon, 16 Dec 2019 16:15:10 +0100
Message-Id: <1576509312-13083-5-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576509312-13083-1-git-send-email-sveith@amazon.de>
References: <1576509312-13083-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 207.171.190.10
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: xlNeKht2PZsj

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

