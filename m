Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4679602lff;
        Mon, 16 Dec 2019 07:18:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqyEH6W9i5bmRAoGwCvXAHEWoarWq6NHgX27LPtD5H2WcQk+vgoMIa49Kjj0rlE+9Y3gfvbN
X-Received: by 2002:a05:6830:2081:: with SMTP id y1mr33055143otq.55.1576509497951;
        Mon, 16 Dec 2019 07:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576509497; cv=none;
        d=google.com; s=arc-20160816;
        b=s2rdYvW+s8fhPE6vr0OePlLQTPtCtn6QlGOFvTqrEvEUqkKFXPzCWYwMaWrgEne8+J
         BgMKJqElOWr9F7y6A5Nt7zl87gw+0MeeIdjGJkfsCcH6ueX0JilZ9nlQF9ptChyUJnLw
         Eva40MJcqFRxOjZE8kXxs1/+UOvvAhD8G5Usm4mlKgoRpJdHkvB4k8ny00i+c1ttmYro
         OkqGHYY5Oh8m31IlTEhk2oPUZ333mWKh15rN/5bWZYdxIlmfTf3x8C8cyTRNgmsvRfzE
         G9Fs3dhy4W865o36x2U0ntdRdozTo07s9kpgc52USU0BVnHfeXFlwjy9xq5bHl2l04oo
         lF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=Z0g33k0fJJlh3np7I7IZdcyVyzV2EJT6J7A5HaBP1Jc=;
        b=serMIwGlX0e6C0/SG8hhDAr+er1N9bTw0P78vpRj3vSZNeO1nW7Dwf2t7pifo0+MTJ
         BP+xM++2zQiLZSQicOb4DKNgl5toEwpJMpoUh8dA2KSHChVcyo2q5MnBtyP1bMyqoItk
         HPsj3SgyB5DKnI6KTCPWGTkX35obmRCOIt92DPEBI2X3qAHe4dCtm+VL1rSkm7DdLmny
         iwyj6927iHKp74C5MZo0OThZ7dMagb+kCLWmcyMtuDcF9i8hzQXlDwcXE4J3kBHcQVO6
         cU9pcJr3ZDYiGt6ByQT91N/PK/q39lcHnMPFwTOqneLxn9oAxyynhwaDbHzwMUO5Y5Qz
         nuzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=DdQXvSKh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si11164071otl.133.2019.12.16.07.18.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 07:18:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=DdQXvSKh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igs8W-0004cu-Hp
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 10:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7d-0003rC-5b
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:17:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7c-0001va-2V
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:17:21 -0500
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:28350)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7b-0001l9-Tf; Mon, 16 Dec 2019 10:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576509440; x=1608045440;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Z0g33k0fJJlh3np7I7IZdcyVyzV2EJT6J7A5HaBP1Jc=;
 b=DdQXvSKhl1V1Io4wkW879gc70VYua6X1AQQX1wvqDzEzaUxgvBtCcym2
 +pVKbLx7DUeH78UH38X6XNNjkrB28HAbMlJmgYROPCqnkB9eV3BQBQ/i7
 7bfY/5089iyGEjLfgBifrb2h5uOCUZ9Og0WHcGm9uyrztUEqZsckaEgSf I=;
IronPort-SDR: fw3ADRrLN+ng2QTpfC/KOk7ikWLls4Hna//RYlheOYRyO2E025gTqCHfcvS2suqr9aiNJiFeDx
 nUvjaVQR7u+g==
X-IronPort-AV: E=Sophos;i="5.69,322,1571702400"; 
   d="scan'208";a="9275773"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 16 Dec 2019 15:17:20 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan2.amazon.com [10.247.140.66])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3CCE3A2197; Mon, 16 Dec 2019 15:17:18 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBGFHGdw014168; Mon, 16 Dec 2019 16:17:16 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBGFHFLS014143;
 Mon, 16 Dec 2019 16:17:15 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 6/6] hw/arm/smmuv3: Report F_STE_FETCH fault address in
 correct word position
Date: Mon, 16 Dec 2019 16:15:12 +0100
Message-Id: <1576509312-13083-7-git-send-email-sveith@amazon.de>
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
X-TUID: uo+UQp+epxq0

The smmuv3_record_event() function that generates the F_STE_FETCH error
uses the EVT_SET_ADDR macro to record the fetch address, placing it in
32-bit words 4 and 5.

The correct position for this address is in words 6 and 7, per the
SMMUv3 Architecture Specification.

Update the function to use the EVT_SET_ADDR2 macro instead, which is the
macro intended for writing to these words.

ref. ARM IHI 0070C, section 7.3.4.

Signed-off-by: Simon Veith <sveith@amazon.de>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Acked-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 31ac3ca..8b5f157 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -172,7 +172,7 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
     case SMMU_EVT_F_STE_FETCH:
         EVT_SET_SSID(&evt, info->u.f_ste_fetch.ssid);
         EVT_SET_SSV(&evt,  info->u.f_ste_fetch.ssv);
-        EVT_SET_ADDR(&evt, info->u.f_ste_fetch.addr);
+        EVT_SET_ADDR2(&evt, info->u.f_ste_fetch.addr);
         break;
     case SMMU_EVT_C_BAD_STE:
         EVT_SET_SSID(&evt, info->u.c_bad_ste.ssid);
-- 
2.7.4

