Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1722468njc;
        Thu, 22 May 2025 02:18:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmGFxSeQvI1m8YwAf7JuXL886om+UdQ05pU0ABC0BytvdEC8zVOH0ryQJMYGwf4eBXoBUbos5EBuiM2A==@linaro.org
X-Google-Smtp-Source: AGHT+IFThLE3edTyaF/q/XqRY5MPj3FPmkgJDSlfuSxIdYanwlGJtknOPA8FnjTbxezZQ5drzRRJ
X-Received: by 2002:a05:620a:4309:b0:7ca:df98:2d7 with SMTP id af79cd13be357-7cd46730187mr4160285985a.25.1747905534900;
        Thu, 22 May 2025 02:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747905534; cv=none;
        d=google.com; s=arc-20240605;
        b=ZcAGmunCv1feYSGZiuuf9Ce+ypAdoF6H5jN8jrmvAYUy9nQTs7C+d23+M4lUw1btTD
         NrlShM2pxpSAS+Noqv9kkSQGACqwr0pksx6zkWZtCG8CGzpMCX03wZu74uc6Afm/iWux
         p+y93rAhrQbf6nnmFsOmugTlVseI4dYFQz6XX3LW81fkDyzJiq5dNui2Bilkb8yLZyGE
         zLhdPi83nDZFqp+wHoCyEDCf9lBuYpx615fOLDV4X7HhliAIh3q1k+BB/ZGn8itzuSwB
         XMT4qSEKZCxzlBdPF/7TnmEKnR6P8mRMvbU8lXEo8mtXnMfopM3nkNetoT/mutb0Mmy3
         xT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/bA981Q/OwSwJ5SIlnzmEVlbfjt87Z0fFtJelAJ+yBo=;
        fh=vQPqsNMqoAlDx9Lray1TJhxW/ME1Lx6izgi/4Tj22z8=;
        b=K+2j088W2b3im5/F9FBM3jertn9rwqrmdWco9cL+6AI6cJj+Hvg13yBrXPii/U8SO7
         14XlsT/VwGv/rYaYnDwDGR4ZylBbaKSy0CN+5mSAcYwBR57+LDaaXdYxr1SUxcPtnO5W
         ztr7HP2FoVTU54LMiKVFBJRtX7I3CcC9luHjvfFcXQyqp7oWtKh7tJ3scWQVbA0fpRjo
         9YtSG031qh0FmFSSRO1+OJY0rGVcNgFilr53IwMxjvxLPmTsPhsaCgAXWtAV+lig9tDM
         uqaUZEmCIDMpJaVAvB89/XqQq/vA9x5kNfRCYBRqxQ9bWLC6anHNZGL8iC4lElAuN+x9
         hW+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b09d1bbasi149239696d6.468.2025.05.22.02.18.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 May 2025 02:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uI23O-0006ej-GS; Thu, 22 May 2025 05:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI23F-0006c7-RK; Thu, 22 May 2025 05:17:25 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uI23D-0003Jw-SM; Thu, 22 May 2025 05:17:21 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 17:17:02 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 17:17:02 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 4/6] hw/arm/aspeed_ast27x0-fc: Map ca35 memory into system
 memory
Date: Thu, 22 May 2025 17:16:58 +0800
Message-ID: <20250522091701.354185-5-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522091701.354185-1-steven_lee@aspeedtech.com>
References: <20250522091701.354185-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ogcLHg3WTkKp

Map the CA35 memory region as a subregion of system_memory to ensure
a valid FlatView. This prevents failures in APIs that rely on the
global memory view, such as rom_check_and_register_reset().

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0-fc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
index f8cb632bca..7087be4288 100644
--- a/hw/arm/aspeed_ast27x0-fc.c
+++ b/hw/arm/aspeed_ast27x0-fc.c
@@ -68,6 +68,7 @@ static void ast2700fc_ca35_init(MachineState *machine)
 
     memory_region_init(&s->ca35_memory, OBJECT(&s->ca35), "ca35-memory",
                        UINT64_MAX);
+    memory_region_add_subregion(get_system_memory(), 0, &s->ca35_memory);
 
     if (!memory_region_init_ram(&s->ca35_dram, OBJECT(&s->ca35), "ca35-dram",
                                 AST2700FC_BMC_RAM_SIZE, &error_abort)) {
-- 
2.43.0

