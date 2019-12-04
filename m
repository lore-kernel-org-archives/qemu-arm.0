Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp666346lff;
        Wed, 4 Dec 2019 05:56:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1P7S0y9bP59zqpQYL1RpUvDy7ggOxW1v6sD8gamTMURAFikxGLse3t5GcS5W/LKs/r6rB
X-Received: by 2002:a50:ee0f:: with SMTP id g15mr2132698eds.295.1575467804301;
        Wed, 04 Dec 2019 05:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575467804; cv=none;
        d=google.com; s=arc-20160816;
        b=ngYqAyuvfQ+hXHUcRdTnvhPhSRrd2HiQi3lXewLGzRK6MjS7d/1PHKJ/6fpdpmdtVh
         tbJTKUZ/ee/z7anFZBcPQcSCJlvHUFh2JeOu9nE+nl4TwxUWJSyI3mbvf1910tb7+dvh
         qA+AZ87oPxjXSlN1TT4IZLCQyM5Hl/42JdeD48Bk+pJbjn72UgBa/fc9HghjQE44cIzc
         NpGaW/jrXTdkOhwg+gkCzrPoKJaPA2mH+88Jipu4eHMO3ZK/XD6FPuSs6ebneN1lMbc1
         Foti2JEVL7ffpK3FrN0LyhRWRLP72k5CCw4rwcl0WpqZohjFPAhNmpWgEwdx95dNIVGX
         +d3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=mGz2Hs159Z/4+8pT881Ub7PtsnSyXxiUtbVakc2yFWM=;
        b=B2USN2Jrcs7TBByM6fyrCWqwlc4xbzPteAkIee5iUiQ5yf18KoU79dqnYk6qYksbqn
         3Qoq8zWxL4/Mmr+TV3KxUKTigIe7wWFn7woQwyiZMe3B6bnAVJZFNHPjpodvoh/LyPJ/
         Uias4We+wlNH9gKJIYlBKrwBJNds9U7VAA+wjsD4kQ0WD8P8Fe+ouvlf5l31LjmLSGdb
         gfwvBcFsOr+CDU6ZdTixe16xENf4C/1w13JLEfyvLfExAodV67Lf6vB05HVsQeR0vQJx
         CuCD73oa5s+0uT+lddlPSPRELm9xFfZDI5rPpv3+5qIZJzvwDNW5fj9ZlE5gBUxbHkgL
         bSVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=F01Fw8CD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si4385440edt.272.2019.12.04.05.56.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2019 05:56:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=F01Fw8CD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:39246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icV90-0005Df-RN
	for alex.bennee@linaro.org; Wed, 04 Dec 2019 08:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38411)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8j-00057e-Tq
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 08:56:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8i-0005EG-OP
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 08:56:25 -0500
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:9490)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8i-0005BH-HB; Wed, 04 Dec 2019 08:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1575467784; x=1607003784;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=mGz2Hs159Z/4+8pT881Ub7PtsnSyXxiUtbVakc2yFWM=;
 b=F01Fw8CDIdq4GZyQntiadzGH2NBKnZufGKnyhlu0SaepjkVzIj2ywRhF
 LKkillroCAZhyWJ936gRjDDt6Z0uclr8LHaB8a8EJB1qJ9JQhPQz5aW9W
 oNpYkA8djhq8YcDRt0rAZOjqmMFoRQ008YA+nwZs0p8slBUziq1UPUA3z g=;
IronPort-SDR: 6smuSj9Iia7aCLpemJErFU3iL5nFjvhmsp19zr4FoSQ1qTYGbMstT+LPjGnZTaJLRGtz6d5vZL
 L9Kv8Oo6K72Q==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="3177677"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 04 Dec 2019 13:56:22 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan2.amazon.com [10.247.140.66])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 19EF7A2330; Wed,  4 Dec 2019 13:56:20 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xB4DuJbQ029389; Wed, 4 Dec 2019 14:56:19 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xB4DuJ65029388;
 Wed, 4 Dec 2019 14:56:19 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 2/5] hw/arm/smmuv3: Check stream IDs against actual table
 LOG2SIZE
Date: Wed,  4 Dec 2019 14:55:45 +0100
Message-Id: <1575467748-28898-3-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575467748-28898-1-git-send-email-sveith@amazon.de>
References: <1575467748-28898-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 207.171.184.25
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
X-TUID: U9a0Jx3NxnhP

When checking whether a stream ID is in range of the stream table, we
have so far been only checking it against our implementation limit
(SMMU_IDR1_SIDSIZE). However, the guest can program the
STRTAB_BASE_CFG.LOG2SIZE field to a size that is smaller than this
limit.

Check the stream ID against this limit as well to match the hardware
behavior of raising C_BAD_STREAMID events in case the limit is exceeded.

ref. ARM IHI 0070C, section 6.3.24.

Signed-off-by: Simon Veith <sveith@amazon.de>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 hw/arm/smmuv3.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index eef9a18..aad4639 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -377,11 +377,15 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
                          SMMUEventInfo *event)
 {
     dma_addr_t addr;
+    uint32_t log2size;
     int ret;
 
     trace_smmuv3_find_ste(sid, s->features, s->sid_split);
-    /* Check SID range */
-    if (sid > (1 << SMMU_IDR1_SIDSIZE)) {
+    log2size = FIELD_EX32(s->strtab_base_cfg, STRTAB_BASE_CFG, LOG2SIZE);
+    /*
+     * Check SID range against both guest-configured and implementation limits
+     */
+    if (sid > (1 << MIN(log2size, SMMU_IDR1_SIDSIZE))) {
         event->type = SMMU_EVT_C_BAD_STREAMID;
         return -EINVAL;
     }
-- 
2.7.4

