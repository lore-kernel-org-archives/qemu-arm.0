Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4678274lff;
        Mon, 16 Dec 2019 07:17:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxV2cdBn86FOnZFG6dZCIlHJ4lVvB3sPDmoXPbMWtMiCb1wtidLTbjmoW+Kc+b3v5Oo6kkR
X-Received: by 2002:a54:4805:: with SMTP id j5mr9176064oij.165.1576509438558;
        Mon, 16 Dec 2019 07:17:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576509438; cv=none;
        d=google.com; s=arc-20160816;
        b=p8hxKqHI2ZyU5lwuO05Ssos307WSmUAmVO03lg3W2kcn5d7rI3gRcux0USqx2fEnz7
         C8X0f7Zl1OENEs2Gs7vAIWbXsTTowZ6rM0zm+x061BCEpocmyhIPYAakjokCcFcc3OBp
         jiReSmvuEhaktatOupl98SaTuCFQqZXOKn0NqAEWqOPdpqKbC5u1MwTW2nRqSgb5UFYH
         KW+Jy302zmw6XWWQS9lQQN4l4G72MVJ8UDd5we2QtGgDaXBpeIAELhPcV3pK3RFyQlrm
         DilWkROuDMLZVqFw6046EETEXfrt0MGbnTNTR+W8paDUxz1NZO6lNKpF7TPtY5BQrhVY
         w0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:ironport-sdr:dkim-signature;
        bh=v4g8z2qawcZIAo36aaIgjbmv/2+FuGBGNZSCoPqMp7I=;
        b=PwkdZEVlEsSR9nwhhxWGqyRw2OX5/sa9oerqFOHmBAO5p59T8AU3O2QqExWgGGs0tA
         wc+grcwmzJ6IPgtGcWM09d96W6Oo2FuAC7mhzZrOWkahJ/MZUUpBVZYiwycAIqbP2zoz
         VUundTZgX5CYMxlSEqby8povD9HEmke3xboojHpC0OkZx5ybbIayh9utsuQicMP6hqLR
         fVZA1jTzB7rOLEuV0a8Yi3JjyLu1+LA/YtAtAAp9wGCTYtpKnvjpg2QR+oiPo4+p1R5x
         EOK/FH7ZT9WzoaPUfkJeqHjATQLGh+3R+Zevy+3X2VRZsJ62DrXNSIBlrhjDZ5pIISJW
         h5NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=eanjws3F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n203si1793857oia.112.2019.12.16.07.17.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 07:17:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=eanjws3F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igs7Y-0003TO-SZ
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 10:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7G-0003TB-5A
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:16:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7E-0001Qd-Ry
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:16:58 -0500
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:41002)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7E-0001KS-L7; Mon, 16 Dec 2019 10:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576509417; x=1608045417;
 h=from:to:cc:subject:date:message-id;
 bh=v4g8z2qawcZIAo36aaIgjbmv/2+FuGBGNZSCoPqMp7I=;
 b=eanjws3FCdaf/iNuJine+az7Yy9gKUfZqfdRSuUx/ltX0HnKBPOvU4A7
 vtE6bqpGHlFmoO/Clwrr7v5bEi3ImrhdqUrm+9v6jC2qQB9+AnkguLpnI
 WoGGNkEm/fIC5A28RcGtT1eo+D5sHKmDTRfbBhnyLyBkbz+z5O3gf9aHx M=;
IronPort-SDR: D9EMSQn3Q0b/DY1KDgHleuWVth9wiiJEcGZ1hxYEYLvZzVt8HsRusqPSGasQHL7JYqUrvyX18f
 30DpgP7HYvzQ==
X-IronPort-AV: E=Sophos;i="5.69,322,1571702400"; 
   d="scan'208";a="5381324"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 16 Dec 2019 15:16:42 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan3.amazon.com [10.247.140.70])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7A5DFA2057; Mon, 16 Dec 2019 15:16:41 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBGFGcwp013847; Mon, 16 Dec 2019 16:16:39 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBGFGcei013845;
 Mon, 16 Dec 2019 16:16:38 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>
Subject: [PATCH v3 0/6] hw/arm/smmuv3: Correct stream ID and event address
 handling
Date: Mon, 16 Dec 2019 16:15:06 +0100
Message-Id: <1576509312-13083-1-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
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
X-TUID: bYCPM83lFeKe

While working on the Linux SMMUv3 driver, I noticed a few cases where the QEMU
SMMUv3 behavior relating to stream tables was inconsistent with our hardware.

Also, when debugging those differences, I found that the errors reported through
the QEMU SMMUv3 event queue contained the address fields in an incorrect
position.

These patches correct the QEMU SMMUv3 behavior to match the specification (and
the behavior that I observed in our hardware). Linux guests normally will not
notice these issues, but other SMMUv3 driver implementations might.

Changes in v2:

* New patch "hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value" added
* Updated patch "hw/arm/smmuv3: Check stream IDs against actual table LOG2SIZE"
* Updated patch "hw/arm/smmuv3: Align stream table base address to table size"

Changes in v3:

* No changes, but sending again to correct a patch submission mishap that
  confused Patchew

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

-- 
2.7.4

