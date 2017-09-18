Received: by 10.223.172.38 with SMTP id v35csp4142580wrc;
        Mon, 18 Sep 2017 12:57:53 -0700 (PDT)
X-Received: by 10.200.37.136 with SMTP id e8mr41953891qte.112.1505764673259;
        Mon, 18 Sep 2017 12:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764673; cv=none;
        d=google.com; s=arc-20160816;
        b=FRiZU9InJAu5vlcVJ7xswVpWWpY2Nq1mHNenpVhvYZd9E1vjBNbjf+s97z1A/G3ajq
         inPHI/JLQKrdqEoB4FUekFPPTXXrQ5Q3e8534UUaY21LbZ8vyJdfQuT10sjXBghG6Z/l
         CCrLz+5QK1i8kwM1vmNdDOfpFeegxUEeEXL1htOUK/Fm3ECFQ0X3IHBz081tFWF/uEle
         0O2nOdV5gfFJdLPtowPJ+olr1LZQGEmMrphHGtKKw4trCFm5p4nd6eHLTLhbGSiBmAwF
         MoWgkw4azm/SumqT3AZTFWn1bjMw9GBUtqmGfcvVKWGNz1Dmr2Bc+/G8SS0hgiKh2Ytz
         Mhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=OvSm2WQLto3S8iKNUqJx4dnkbtei78yvcKLHS0BtU0g=;
        b=OxPxS54vzsLONeOApz6djxepAwFVzFot9doLmlhcGk/xkeA7jOT2HjHJ1r+UNokyXW
         Cuj30pNMPyuz7CJLUTAaFAhPLRLW+QPtwwskZGCBwIwZ8BYXdTNOt5Zp+/GJpv4hDZ/E
         vDKihEt2boTBa2a7bVGUWDHAbAGVAEM8cPzYAE2J2gENXm1ki0weyIIs5PvBsj1pMWpB
         N8Cn6kSbGCbdUz0eX1bJxEbVyJX6foGN+uG64t1aKb6FcAAXAB1tNli2E0IG8CGZYsBg
         folUJGfpPYTAgwJLxRh8jmpD8Gi5kOEQeHlCe5k8Q1dFJo4UB/TMTvsOiqaQMef1m4V1
         4CIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U+P9vWEm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t184si7406848qkc.66.2017.09.18.12.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U+P9vWEm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du2Aw-0003vp-Uk
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:57:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24x-0006tJ-B7
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24u-0006Jw-Vm
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:39 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36651)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24u-0006Je-QD; Mon, 18 Sep 2017 15:51:36 -0400
Received: by mail-pg0-x242.google.com with SMTP id d8so772008pgt.3;
	Mon, 18 Sep 2017 12:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OvSm2WQLto3S8iKNUqJx4dnkbtei78yvcKLHS0BtU0g=;
	b=U+P9vWEmGjkE4P8pJu/x7qjNrOVGahJgh7PoTmO4H2NMFYOTRXyU1jm0yq58ZHFXhs
	nGqLACQ4YS7rackzngw8c3esmdJ5eaj1u4qwjsCz4yBxXZ5ElSQcjc0G1JDfqEU/aDjm
	HdkQakZej3gLtp2XckeI/VNYh8gAbvKXgYkNPBQUkxdBh1758yLr7FOTZItXCO3dzkqR
	eNaFTjDR23x7R4W+fRkQyXSLPtIZWkpA50lGWKdtpjTUnwYeg0pd8ry2KLrPQGOEeNSC
	63Ao6X9OBlTR1g8DDkAXH7m2/KXtTWrnNRxP3pJy5Dd6cDXxOfCzK52UVUORwziY63Mk
	ak5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OvSm2WQLto3S8iKNUqJx4dnkbtei78yvcKLHS0BtU0g=;
	b=CuEqbpfyI9lmzos/UhpFzsck3TLiMK1JF7Wu1MJ7UyGIEQpurUvcPjhCHlXjYaPA+d
	yDrDiaP5m+9o0L3IFgD3JBE4mAqRWVeutUNLBSHIW3cmrA4ME9C/51t4avaE9/Sld5Bp
	4QxQ+g7b90e5SMNew3FRZMe4vx3t2nPVJhduFYPvATM4K9a/mwyLjimFyZ+GCKIBcntq
	Vg3FOUoYExEAv4GHM8CZtzBG/h907oKpW7q/r3HV9ELWF0cluD8/wyDQCoRcNRUJBXSt
	l/7t3MQ3egLXX4DE/qaTqwpHwFeESoProkLjI8CRZBQfKpWbDX/ZkYiCJLVO1Z9ooEn3
	5R7g==
X-Gm-Message-State: AHPjjUgqBY6KMP7JIM3TYmhZR/P825KAiwyGk91KD4kugV4cMCaNocsL
	7iJsK6pf0ch2Af/cU8Y=
X-Google-Smtp-Source: AOwi7QCLOTUSjIhd+GdoYlKaNe9krCfBH+YUSdVG1v31VCfop9vjPrXFnORdrn7nCSnHaaw32CxQzQ==
X-Received: by 10.84.252.129 with SMTP id y1mr22064619pll.107.1505764295655;
	Mon, 18 Sep 2017 12:51:35 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:35 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:54 -0700
Message-Id: <20170918195100.17593-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH 11/17] sdhci: Implement write method of
 ACMD12ERRSTS register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YmJtISD+68am

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/sd/sdhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 73e7910ba9..9249471957 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1139,6 +1139,9 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         s->admasysaddr = (s->admasysaddr & (0x00000000FFFFFFFFULL |
                 ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
         break;
+    case SDHC_ACMD12ERRSTS:
+        MASKED_WRITE(s->acmd12errsts, mask, value);
+        break;
     case SDHC_FEAER:
         s->acmd12errsts |= value;
         s->errintsts |= (value >> 16) & s->errintstsen;
-- 
2.13.5

