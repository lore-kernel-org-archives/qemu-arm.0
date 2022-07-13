Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp369027lfp;
        Wed, 13 Jul 2022 13:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1snswDaLs12gNjZSnKi9A9n8hkDY8gClxbd3ygUQQ6LePZuMP5sDExdvBSVB47JgtPxnp5G
X-Received: by 2002:a05:622a:7:b0:31e:cd6a:899c with SMTP id x7-20020a05622a000700b0031ecd6a899cmr3411509qtw.43.1657745292015;
        Wed, 13 Jul 2022 13:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657745292; cv=none;
        d=google.com; s=arc-20160816;
        b=k58ktPrS/XMq8s7y34Oylo4XtBOSrtCszdCXvvQe92UoEo+LRNOopFQzHxrW3HnY2y
         ZnJl9ZqxLRuAzJbJce93duFcP5bP/hY/GiGsasXwmQHewvxHF3m0Pt5nVIEBB6dUeJqp
         Ugd+01M7hwgncSo4EEPevFsxTYcnITL/wkMNgQ0j8727jWvR+bw5dciqibgwf2TPVbED
         DhmMjcyRz4KJx5zkBobP1yZX5w7Pp/wmxGA52gNXN3poPUfUNtdUQU2k+SG8+ZJzXinP
         2y4e0HRWPxOFGUapuMWCVI6jemHB2TaLUdyMdGD8qNdXxaQdpMKobzKdkMC6pdzJgCd2
         FEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=6Tjc+ICaWvg56S8Liz4DYzWfFdFBZeGlc3iAJB+HmUY=;
        b=feojmc1SxSQX2dhPWmi97wTovxPAmV/i+jLyL9+IL6sYqyrI3PgSX9K7sTyYKp9f4E
         tVB5aFgk699gK4PnoO21qN5SbiUSOffaudUUzbllOdDrc4KZrY0pDGHc0be9sGAmyeql
         8AGGAAjhHdRjSjQmlU7rmkmf4rlQfS9stNA0WOuXeD1GlXZXkLj8rDKv6or3yDtJP8kd
         0l0gAkTliQGOxhVcdgqwmgtM5rffO201C9NULjbtPAyPBdNR0iAq6oPkN1h3+JTQgR2/
         vQSQP3vIMaG51P7CDicSRiw8d4MyPnASkkW6lZrhkAC9OIMz9rqNlmF50LIs/zuE4V00
         NZHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw7-20020a0562140f2700b00472c0a6e698si7274694qvb.233.2022.07.13.13.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 13:48:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBjHH-0008EB-I7
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 16:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwW-0006fD-68; Wed, 13 Jul 2022 13:14:32 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwU-0003DM-OB; Wed, 13 Jul 2022 13:14:31 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBfdU-003M8p-1I; Wed, 13 Jul 2022 17:54:51 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBfdS-0009kt-1o;
 Wed, 13 Jul 2022 17:54:50 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH 4/7] pci: designware: ignore new bits in ATU CR1
Date: Wed, 13 Jul 2022 17:54:46 +0100
Message-Id: <20220713165449.37433-5-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713165449.37433-1-ben.dooks@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jul 2022 16:45:07 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
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
X-TUID: yLgFsfGEYbfx

In version 4 and anver ATU CR1 has more bits in it than just the
viewport type. Make a guess at masking these out to avoid issues
where Linux writes these bits and fails to enable memory ATUs.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 hw/pci-host/designware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 6403416634..947547d153 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -276,10 +276,10 @@ static void designware_pcie_update_viewport(DesignwarePCIERoot *root,
     const uint64_t base   = viewport->base;
     const uint64_t size   = viewport->limit - base + 1;
     const bool enabled    = viewport->cr[1] & DESIGNWARE_PCIE_ATU_ENABLE;
-
+    uint32_t cr0          = viewport->cr[0];
     MemoryRegion *current, *other;
 
-    if (viewport->cr[0] == DESIGNWARE_PCIE_ATU_TYPE_MEM) {
+    if ((cr0 & 0xFF) == DESIGNWARE_PCIE_ATU_TYPE_MEM) {
         current = &viewport->mem;
         other   = &viewport->cfg;
         memory_region_set_alias_offset(current, target);
-- 
2.35.1

