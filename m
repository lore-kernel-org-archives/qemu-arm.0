Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4678807lff;
        Mon, 16 Dec 2019 07:17:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzchOanJXTU2hoe7g6TG5/a54rvV7uy0NwEjAPgvbQw23mvtRNC5us/reLPZehNVTWCqfH
X-Received: by 2002:a05:6830:22ee:: with SMTP id t14mr31455048otc.236.1576509462028;
        Mon, 16 Dec 2019 07:17:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576509462; cv=none;
        d=google.com; s=arc-20160816;
        b=RzicCnup+XMUETUtxQBvyGuoQ5BH/y3bGEIP+tQKZc9AA7CZBZopLKNsa4wrLdeAf0
         NGK4911mi3RaGsHJ6Afh0A/2ScSqCIdY6IEOueBCiDdH73Yy9baLhMNxbo58D+e6y8IK
         1nNEyBv8njVbz1Yey6sDc4ExIs+gtfNhRbp7Ka3+0fqv5AhrPw05DdsW67KCsRSVpFnN
         CS6kci1nE9IyaU0KEZKkcLJEWfiGZpu+TCX00jqoAT97TeyymK0LIVFl/+Gj7wFqe64F
         6G9b2jsDHbk/uIZIZ95fks1nbuQg5IzYvIw24+f2odroNq2xYDaz0lDTqUeWI/7uj1D/
         cCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=PCOnbhJypslF5hM47QeKN1c0yopkDWzpKcTM5nMU8Xo=;
        b=NRYuo4r/u+sDfOUZ+G+Y2kAVTGYuTv4fmUBHeNTPUDcmVT1Z88YcYBF2Y929Oaoo+1
         gjBuRxoJ5VukkoNoKvHuAAu2lxr/h0J7SBGvcTZpJg7eMK2BBemDoSCxWXV0xqu+VM0B
         5tkUOGa5ul3gVzfBMZ0G7sL5f+hnhZ0FV8YkZQYdwdfen1UJas2nmDaDLpUhVGiusJ04
         J6QLDB2i9GnYwwn6h4Z56Qw5aA1BmSfHXfRSec43SIc5a3fnMHMvm8KXE15hEbxyRZlC
         dRylccLuBZrNR9Co41YJ989B6xRjH4N9W5f+ZsNRtlEfXk9tVqwK9edARAzVkupHCMoa
         +Clg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=JQJA9+u5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y130si10657859oiy.28.2019.12.16.07.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 07:17:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=JQJA9+u5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igs7w-0003xm-OB
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 10:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54271)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7N-0003Wc-ND
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:17:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7M-0001Za-M6
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:17:05 -0500
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:58507)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7M-0001X4-BE; Mon, 16 Dec 2019 10:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576509424; x=1608045424;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=PCOnbhJypslF5hM47QeKN1c0yopkDWzpKcTM5nMU8Xo=;
 b=JQJA9+u5KO1EVQ97mBzLioreIw1ZHq4WCHY6dgS/hJIhEE12kEikGV1+
 KN3cl16LGn9VI+HCEZL/JZU+76smRcOB8sMQeMOvyc4ontaCWBCqkquXt
 csrydVDtgnsiB3qNKlT64xj6qfDl4s89WprFn+AkH4bpZZsQ4Nch0lZtM Y=;
IronPort-SDR: 6xqwswH05mbkLO3HeKVn+kdonjZ3btRLADrYMNbSZTLnQl9BRVmgM4U6N92XGWUObfdsPZHebY
 fsmvPnGVKmZA==
X-IronPort-AV: E=Sophos;i="5.69,322,1571702400"; d="scan'208";a="13787967"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 16 Dec 2019 15:17:04 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (iad7-ws-svc-lb50-vlan3.amazon.com [10.0.93.214])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id F4185A1FE4; Mon, 16 Dec 2019 15:17:01 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBGFGxjA014019; Mon, 16 Dec 2019 16:16:59 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBGFGwne014013;
 Mon, 16 Dec 2019 16:16:58 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 3/6] hw/arm/smmuv3: Check stream IDs against actual table
 LOG2SIZE
Date: Mon, 16 Dec 2019 16:15:09 +0100
Message-Id: <1576509312-13083-4-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576509312-13083-1-git-send-email-sveith@amazon.de>
References: <1576509312-13083-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 207.171.184.29
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
X-TUID: KRYj+/+iYlFE

When checking whether a stream ID is in range of the stream table, we
have so far been only checking it against our implementation limit
(SMMU_IDR1_SIDSIZE). However, the guest can program the
STRTAB_BASE_CFG.LOG2SIZE field to a size that is smaller than this
limit.

Check the stream ID against this limit as well to match the hardware
behavior of raising C_BAD_STREAMID events in case the limit is exceeded.
Also, ensure that we do not go one entry beyond the end of the table by
checking that its index is strictly smaller than the table size.

ref. ARM IHI 0070C, section 6.3.24.

Signed-off-by: Simon Veith <sveith@amazon.de>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
Changed in v2:

* Also check that stream ID is strictly lower than the table size

 hw/arm/smmuv3.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index eef9a18..727558b 100644
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
+    if (sid >= (1 << MIN(log2size, SMMU_IDR1_SIDSIZE))) {
         event->type = SMMU_EVT_C_BAD_STREAMID;
         return -EINVAL;
     }
-- 
2.7.4

