Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp760140lff;
        Wed, 11 Dec 2019 07:12:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyiSjQxQkradgW49dJVFhO1yVHooiYB5+RGBRVjcQBNzMXwIxSApuU9gFvwxt865ctFqSpm
X-Received: by 2002:a37:4047:: with SMTP id n68mr3439680qka.258.1576077145483;
        Wed, 11 Dec 2019 07:12:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576077145; cv=none;
        d=google.com; s=arc-20160816;
        b=BI+zfIEos6SiN6+/Da7ldQvEjWiFnwKJyBk9v+1hT6B9LTnxSeGK5CV190neq2lrLy
         rWyX5/Ac0JbnR3iYndbbQ9M5owe2fzFWl9iYIXfD3GCepmQGaJTF86fvu8dP/mxjiaaL
         8uPJ79H0Gke0gx2XB8+kN36SXcIZKAIXhVN1HXrUT/CazV5qxKA0IEujNmrAjp9MazA8
         8Cp+ROyVMDgyw36posH1k/0Ts27gP/k5SY+NouhxCFw3R1+Qdwi+7/4BPHo7z1y2RmDz
         tculmpxI/mz0G5axoVxAJMCn+WiRubCXfN6GJagPjcyO0FCxXo/DLC+1FVWli0ELSfGl
         Qh4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=Z0g33k0fJJlh3np7I7IZdcyVyzV2EJT6J7A5HaBP1Jc=;
        b=UkTDbNLq5N8CGu3Uopo7uXX5bYrwe7ikBcD1y4IPOL68XGbaH+KeIFb4wTBqzvvAIF
         ZS78V5BC6vWFOzivA7L4/vqdZ5AGQyOMaA/yKp9IImm+qBZONcmtCT8ZgSelZyr1QR7l
         IAZiiB7CbontBRAt/FLrm3/i4u5DfkN5SlEzp3Z4JXgLG9cG0Nml50lFEunYqrs8ei+l
         NT/quJTNVnuS/qWS87uTFUoqkJVUJbud/PUMY6jJQKUp2QReteKV4aIUQzztQZBIhbQW
         hP5cfFIqbTIZnXdHHrEbFw93j7jte+roOkDFQGBp6NKZ84mH7+oEZBtnxGZqcaXYYULe
         F4Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=GdHRVN08;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q53si1098605qtf.391.2019.12.11.07.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 07:12:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=GdHRVN08;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1if3f6-0007H1-Do
	for alex.bennee@linaro.org; Wed, 11 Dec 2019 10:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3b6-0002mF-IL
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 10:08:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3b5-00045W-GI
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 10:08:16 -0500
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:24873)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3b5-00045H-Be; Wed, 11 Dec 2019 10:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576076895; x=1607612895;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Z0g33k0fJJlh3np7I7IZdcyVyzV2EJT6J7A5HaBP1Jc=;
 b=GdHRVN08qKk7sweLlV/KaT4C5BvIdBKBQYeORpNQ4hdyp8xIr/0cYvN5
 oKNVE8JVB3qHzMoFIztrVHRjjD1Rx+3c6JNtTYLDSH/tLNpHHaiiDufeN
 X2YN6D6wWZNAg+5QAaIdTlEYOzU1Hng+7grYHuRIiL01jKxAky3dD6zfB I=;
IronPort-SDR: R/ypnAI5Yu/GywgLzK+GEv4XppaOVffQUDD1PP1XQyiQwFAWoJsxZkQXlC5weWe7zYDBizOnOq
 aDoz2tDNHIFQ==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="7181932"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 11 Dec 2019 15:08:14 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan3.amazon.com [10.247.140.70])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id C7E40C5D3E; Wed, 11 Dec 2019 15:08:13 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBBF8A04025082; Wed, 11 Dec 2019 16:08:11 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBBF8AFM025081;
 Wed, 11 Dec 2019 16:08:10 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 6/6] hw/arm/smmuv3: Report F_STE_FETCH fault address in
 correct word position
Date: Wed, 11 Dec 2019 16:07:40 +0100
Message-Id: <1576076860-24820-4-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576076860-24820-1-git-send-email-sveith@amazon.de>
References: <1576076260-18659-1-git-send-email-sveith@amazon.de>
 <1576076860-24820-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 52.95.49.90
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
X-TUID: UhYxuBdPA61v

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

