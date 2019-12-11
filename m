Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp739185lff;
        Wed, 11 Dec 2019 06:58:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5zhMzBINkYu+xUAmaUJw/3QKk/v6nCSkVZO41yobI95UmHpjDVUFVCW4q2X4soUFQbsgK
X-Received: by 2002:a37:ef07:: with SMTP id j7mr3332381qkk.354.1576076305818;
        Wed, 11 Dec 2019 06:58:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576076305; cv=none;
        d=google.com; s=arc-20160816;
        b=TsGYW0u0QLGKn7rG+fKEMedh9BrVCCsJun4DqUjB0GRGSSOZxVMKNPqV0UTH+2+phq
         /VF65VXappCgZ+65sV/EZ3uPCOcDho/SxuNmFhUgUpIC01Ejf5YgB79JPeTIQwQiO4fW
         OUOTgHmASO3S2nTVLmI26Pl/XJp+K865Jbq1nfKPYIhy7sZjeK7I+/6XI6dXv3oom+OK
         sLwWewPZHaUqvGVbKxJ0//j4VJrgr/n7h+lpChVCvQcgJQYDuqJlZmbiX8g+sCl+YToo
         sFzi19VRZUyi9sVzdNSwaU7WRqc9Rb+ETUI/PNF+lMfd6UqYgprXjzzDHzLB5pv8B2nn
         q4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:ironport-sdr:dkim-signature;
        bh=Asgepvkz4JWY1boo1mZHZcuk6CbY2wol3JthUOrMfrc=;
        b=alq0LT8kDmkS/ILshcZNYUX+gedu0BYaK92UzaTiV+964AZrbhUsEVahfdzsApOjpF
         Kif8Jn+5WKNjBgED0EU7D7aPG6EiATxtxYrl/Fu8S4aLcUE5z1gS2mTTzDUfXbgBZVO3
         YgiAGU97xeVzYnToxYIShkm+Ut0YcTc1GNieoG9Tgy8UAA81plUEcKi1a41Klwkrdwgx
         SDv/Jzl4vi+c5JoS1IcxepHpBbl8IXULBHH19x2U0zTtIK1m3YLGUUyzsdbmFr6B60m1
         p11zQ8xm8dONPW+RX87GBulk9QbbOvnNcKWEZfoUU2+EDouIYFNfKtgQXc4dK8KXuyf0
         B/9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=CK45ggbV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si1150043qtp.32.2019.12.11.06.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 06:58:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=CK45ggbV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:43732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1if3RZ-0005Jd-4j
	for alex.bennee@linaro.org; Wed, 11 Dec 2019 09:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3RP-0005JE-92
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 09:58:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3RO-0001NC-AA
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 09:58:15 -0500
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:4022)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=241120df0=sveith@amazon.com>)
 id 1if3RO-0001L7-3G; Wed, 11 Dec 2019 09:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576076294; x=1607612294;
 h=from:to:cc:subject:date:message-id;
 bh=Asgepvkz4JWY1boo1mZHZcuk6CbY2wol3JthUOrMfrc=;
 b=CK45ggbVoS9RhvKxrj2TftDhpII3QTWdj6dq3DyYrCjYySVm5nqzGUPi
 83crgAwk0dvVVyE8NIKR6YnS6/gN/Qy4ngi7c4BOrugM3RxOnbqEJvjKJ
 VqMHZsiuqgCYKEYepLi7eE6vqk9KAnW/m4QE8B1wKNYgjwhNA3Ze/cyZM 8=;
IronPort-SDR: V1DlAf1kmpv5BVH9Sv5ABk2JDoz0+W1WvkC4TXJo1RTRRkil1GcCiqsh1UGUq622yrq55sd4mW
 307Bmn/QaL+w==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="8041226"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 11 Dec 2019 14:58:12 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (iad7-ws-svc-lb50-vlan2.amazon.com [10.0.93.210])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8AFCE241D29; Wed, 11 Dec 2019 14:58:10 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBBEw52u018996; Wed, 11 Dec 2019 15:58:06 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBBEw4fi018992;
 Wed, 11 Dec 2019 15:58:04 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 0/6] hw/arm/smmuv3: Correct stream ID and event address
 handling
Date: Wed, 11 Dec 2019 15:57:34 +0100
Message-Id: <1576076260-18659-1-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 72.21.198.25
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
X-TUID: nfh7+KXPaOon

While working on the Linux SMMUv3 driver, I noticed a few cases where the QEMU
SMMUv3 behavior relating to stream tables was inconsistent with our hardware.

Also, when debugging those differences, I found that the errors reported through
the QEMU SMMUv3 event queue contained the address fields in an incorrect
position.

These patches correct the QEMU SMMUv3 behavior to match the specification (and
the behavior that I observed in our hardware). Linux guests normally will not
notice these issues, but other SMMUv3 driver implementations might.

Simon Veith (6):
  hw/arm/smmuv3: Apply address mask to linear strtab base address
  hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value
  hw/arm/smmuv3: Check stream IDs against actual table LOG2SIZE
  hw/arm/smmuv3: Align stream table base address to table size
  hw/arm/smmuv3: Use correct bit positions in EVT_SET_ADDR2 macro
  hw/arm/smmuv3: Report F_STE_FETCH fault address in correct word
    position

 hw/arm/smmuv3-internal.h |  6 +++---
 hw/arm/smmuv3.c          | 28 +++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 10 deletions(-)

Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org

-- 
2.7.4

