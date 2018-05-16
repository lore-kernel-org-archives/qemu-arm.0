Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1145575wme;
        Wed, 16 May 2018 06:59:14 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqTX3VauVtMqZ2LwCapxXubjdKCu/qw2cLTO/Lcy/jTUzFeSILvZFRzxYhfdGUhyYNckarO
X-Received: by 2002:ac8:4a2:: with SMTP id s34-v6mr1005700qtg.129.1526479154378;
        Wed, 16 May 2018 06:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526479154; cv=none;
        d=google.com; s=arc-20160816;
        b=gLymp0QAiYqFwN7QuFU1TOCAG2c1ePJTC/jkoNoZkXDk/Lif6zNu/cRY30WRfF/mfT
         f1alHIq5bDI5PtERqLaT3xvCWsiynjq8C3ED/YNU3oqtIGVyQoWNvPdoTkHfT3IIpK7d
         porx3sPdCdCGU/KKzwx0BKPNkwBz+jnv1chy68VAvkpE0S6f9ipmvF1mcyW+4TK92Lc/
         dq6wWihg1s0/8cK/OLFJSCg6rUxuSynVi4+8U+Yzs3dvn/8DMHS8EP1DYUyJmB+dac6/
         Br3k4zIiPHoODFT0/bwQTEOxzC8s/5xdbdrpgEsr9YcifZh8kf+IM86gXLLQW5O8Jp1h
         R9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1w4QITIVfd74TLIjNWpem5N0IIvgM7EOVGM4wznTJmQ=;
        b=y+1tSAlBdSSVnmsUhmmz9lpN49MQNvd+d+TC1f+eQGGhr/xmUnJU6VKw0ZjLH2Zleo
         wJSvvE6A1XJT9aBIFTiOjqtYWi4AcHjn8xG3k/ZJAedTb2/gGX6ETwe5Km9V7rtqe7rR
         CM7N48vV/6kOuTaI1LKPT5JRpFXxZPJOOjqjSPkUH3V6qgtAR+llxs/wb4wjYsiDfxGy
         lhNr2Escw/UzwPKQb4678QaVmYWogNYTVVEBaLMYkS1WNz1U1HFNnPLsdtjfZ5kh/W/c
         0f0s8WE5zAeC5++IhT/pmfDUd33AjG0d/Z1Cl45X4rd/g4mSvKDyL3AL/rD7i6FyjaVk
         2YaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u37-v6si2704169qtj.37.2018.05.16.06.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 06:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIwxV-0007Ld-SX
	for alex.bennee@linaro.org; Wed, 16 May 2018 09:59:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fIwxF-0007E8-NC
	for qemu-arm@nongnu.org; Wed, 16 May 2018 09:59:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fIwxE-00060k-U2
	for qemu-arm@nongnu.org; Wed, 16 May 2018 09:58:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51178 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fIwxE-00060X-Ps; Wed, 16 May 2018 09:58:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39CC5402382B;
	Wed, 16 May 2018 13:58:56 +0000 (UTC)
Received: from dhcp19-241-177.khw3.lab.eng.bos.redhat.com
	(gigabyte-r120-16.khw3.lab.eng.bos.redhat.com [10.19.240.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E93BF2024CBB;
	Wed, 16 May 2018 13:58:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 16 May 2018 14:03:04 -0400
Message-Id: <1526493784-25328-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
References: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 16 May 2018 13:58:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 16 May 2018 13:58:56 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 2/2] hw/arm/smmu-common: Fix coverity issue in
 get_block_pte_address
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lu3u0KO5tFFy

Coverity points out that this can overflow if n > 31,
because it's only doing 32-bit arithmetic. Let's use 1ULL instead
of 1. Also the formulae used to compute n can be replaced by
the level_shift() macro.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 01c7be8..3c5f724 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -83,9 +83,9 @@ static inline hwaddr get_table_pte_address(uint64_t pte, int granule_sz)
 static inline hwaddr get_block_pte_address(uint64_t pte, int level,
                                            int granule_sz, uint64_t *bsz)
 {
-    int n = (granule_sz - 3) * (4 - level) + 3;
+    int n = level_shift(level, granule_sz);
 
-    *bsz = 1 << n;
+    *bsz = 1ULL << n;
     return PTE_ADDRESS(pte, n);
 }
 
-- 
1.8.3.1

