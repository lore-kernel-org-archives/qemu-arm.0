Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4678717lff;
        Mon, 16 Dec 2019 07:17:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAzDdBDrS9gzs9BbvrzrfxaY44oejGE88s6t0Kc7Oq8EI9nNMKEIlznBsT+6vUTZrUVgJT
X-Received: by 2002:a9d:3677:: with SMTP id w110mr26384354otb.139.1576509457685;
        Mon, 16 Dec 2019 07:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576509457; cv=none;
        d=google.com; s=arc-20160816;
        b=l/KJ/6E4Vq8sA07b4eZiCe0OtEOn6bgTIVM6o+l2TxqAThC9/Ar+dCxfrpFxkyUGdB
         Qjm5raCL5rQ/6RDxvsUGMIaiESuJdXoyHxJX/EsIW11I4vQ1w5zZGcqHCcU+cajOmdrO
         Qs8EJgblEUesZc3gf+NvhjksxQ2/HWEu86FFcFJ55RNgfI4jQlramzdf3UtgVLG/Fv/M
         ksvrG9cfE49yon+LAtqrq1UyPIsrsIKEMmD1l43bDui/R+XNAnijPPtltUOwA0G5014P
         a1v/TyRj9VSxow9o5tTQr3u2VFjObK5tgsnHDTAocVPrIgHbH1RuuqbMS5+FMJCb219z
         OJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=DnWdil9M/KHhlCYcqIHDhxnPOJB7mXEYpBcWYuPCZHo=;
        b=P9PCGycCwcUMJTI3o4Qf7cjKYLg4W6I8rYtV9i2occonEkXBBgS140tej4LRt0hW35
         5MJhyZ9gHphoV+A7BI1vGbEXxrotWexR4OLvc3hEeu+jrDYA6a0AxcF4WmHDDXgjwtEo
         rsGem0xnbFskA5pFSvgzNv6d3sv2GS/k/MX86XitriX/EJJIYDgePPNNg3i75prQvBfz
         ZlORm8Oi5vsQ+LcB9WhnnJfCumKYaUNQjXlpHR2hUpgc1TofTphDBWBBnIPJ4zgTmzSI
         wolXFQLIe88InCH7+YkcJJqwTi4VuusjM3n1gX+5dyrMPmDxzQpgYIZwclofcovTtlmq
         vfNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=ZjxCzYM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si10180917otq.72.2019.12.16.07.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 07:17:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=ZjxCzYM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:55410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igs7s-0003rs-F0
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 10:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54363)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7Z-0003ly-6W
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:17:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7Y-0001lq-76
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:17:17 -0500
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:28350)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7Y-0001l9-1o; Mon, 16 Dec 2019 10:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576509437; x=1608045437;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=DnWdil9M/KHhlCYcqIHDhxnPOJB7mXEYpBcWYuPCZHo=;
 b=ZjxCzYM84JfFSa9Z9sQVZU8v82yo+3mc/KYDf/dWicJneZqF6m7OCMLM
 i+a0bM0xCBKERFwoekgt3ujBOPS1Ihp8jf+5C3bQwX04CBUDm32Zh7lzW
 L/1x23CX6GEuGdvREjVSNeaGVl4t2XHXhkqIK7RVHvcMRqPpqqxQ+g/9f 4=;
IronPort-SDR: 7M0g3OtvPRRWfh9g4zkiGG3kZd7aWHFvz0OntyTUBMYpn+YRpnOA6OYJejATP9M7iTDGDeUOGx
 tzlI5LgVq5TQ==
X-IronPort-AV: E=Sophos;i="5.69,322,1571702400"; 
   d="scan'208";a="9275759"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 16 Dec 2019 15:17:15 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan2.amazon.com [10.247.140.66])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id 42F47A2651; Mon, 16 Dec 2019 15:17:13 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBGFHBbE014128; Mon, 16 Dec 2019 16:17:11 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBGFHAp4014106;
 Mon, 16 Dec 2019 16:17:10 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 5/6] hw/arm/smmuv3: Use correct bit positions in
 EVT_SET_ADDR2 macro
Date: Mon, 16 Dec 2019 16:15:11 +0100
Message-Id: <1576509312-13083-6-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576509312-13083-1-git-send-email-sveith@amazon.de>
References: <1576509312-13083-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 52.95.48.154
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
X-TUID: y/tV8MgE/sW4

The bit offsets in the EVT_SET_ADDR2 macro do not match those specified
in the ARM SMMUv3 Architecture Specification. In all events that use
this macro, e.g. F_WALK_EABT, the faulting fetch address or IPA actually
occupies the 32-bit words 6 and 7 in the event record contiguously, with
the upper and lower unused bits clear due to alignment or maximum
supported address bits. How many bits are clear depends on the
individual event type.

Update the macro to write to the correct words in the event record so
that guest drivers can obtain accurate address information on events.

ref. ARM IHI 0070C, sections 7.3.12 through 7.3.16.

Signed-off-by: Simon Veith <sveith@amazon.de>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Acked-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3-internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 042b435..4112394 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -461,8 +461,8 @@ typedef struct SMMUEventInfo {
     } while (0)
 #define EVT_SET_ADDR2(x, addr)                            \
     do {                                                  \
-            (x)->word[7] = deposit32((x)->word[7], 3, 29, addr >> 16);   \
-            (x)->word[7] = deposit32((x)->word[7], 0, 16, addr & 0xffff);\
+            (x)->word[7] = (uint32_t)(addr >> 32);        \
+            (x)->word[6] = (uint32_t)(addr & 0xffffffff); \
     } while (0)
 
 void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *event);
-- 
2.7.4

