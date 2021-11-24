Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp10934558lfk;
        Wed, 24 Nov 2021 10:23:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGiG8Kij35JkfpkuiGXstr4vZuAxzUITrG/a/P0khFk/2GaRAKE9w/YRLS55jyoyybKu1i
X-Received: by 2002:a05:6102:32c3:: with SMTP id o3mr27877798vss.36.1637778184003;
        Wed, 24 Nov 2021 10:23:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637778184; cv=none;
        d=google.com; s=arc-20160816;
        b=ZpFs/HjS/Mp6RC5syjZphBlJm3O74id9CPFeenzyoHRm5mVuJY9NhIfUMzqY/Xim1b
         930gxBhO6wl4nP39uEli+p/4fzCyGQBh9anry7KD5DF4+RtI1xIn/XbON2J0XHL4gbOw
         u1DmX/n6Byxj2UwVaTnDEZlLqIqi65fZIoHvuuhjvGlL0vdYCA0uJkNRc3EN4lS3pjeN
         2KItRhyms47gWTfoSajyejWYzBtPked8+3sl3glYgua9FDXaiCbMc9J6pn566C69o0Zg
         CxNTVwT9oYZsH3kWAouDWBjuxi+CJrLx0kJp8V1pC8/RDuwoArLZB41DrEy1lEHCk9cn
         w1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=uvwqkwvKY1N2gxuH7VwfxvJ5mQx7rsbXP3TITiOVwJo=;
        b=PwAzamSgfa2Sg9QOV7iYCIRtN5QMKO6+XG6XJMECqipTu7BdGB3Qag850LX0KOV9aP
         JbgoG+lOqGrRLyus3ziBpCkqJDmgoWLj8ViofSu+iTp46DVeq8kYNatCQcG1kGzfFzLl
         Yli37v3UDB6yjvBtYJOtEmhE4QIpR2iXAkqFPBFC8oaMbYgxRlv00f2keqjbVffq0Bdo
         EpcCnFreZtrAOH5dtFN2yws171JoqVr6MkuqZSl7gcoNFNu2sZJrEOZB7y8EwT63KPeC
         pYHywV9iEQTAV3kZXmU7Kzm6WOU1yJQnUR4gFPFPLrNRGXVPh5gHTFP5WI2qdQ44tHyM
         QEyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qf6f3V0y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si1707548uau.53.2021.11.24.10.23.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Nov 2021 10:23:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qf6f3V0y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mpwv9-0006ny-Bk
	for alex.bennee@linaro.org; Wed, 24 Nov 2021 13:23:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mpwux-0006lP-0u
 for qemu-arm@nongnu.org; Wed, 24 Nov 2021 13:22:51 -0500
Received: from [2607:f8b0:4864:20::731] (port=40945
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mpwuv-00037l-8n
 for qemu-arm@nongnu.org; Wed, 24 Nov 2021 13:22:50 -0500
Received: by mail-qk1-x731.google.com with SMTP id p4so3795641qkm.7
 for <qemu-arm@nongnu.org>; Wed, 24 Nov 2021 10:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uvwqkwvKY1N2gxuH7VwfxvJ5mQx7rsbXP3TITiOVwJo=;
 b=Qf6f3V0yz1ZrX20U8SWFBGfUTx0bSYEte+8kSnaECy2pbnET/BmG+g5sDNSkrmufb/
 1atPv4tIMytQgcg8DXXfqxTlMh8O3aJOhbgl7/iDtQj5qaKg4bFLmCDPCIakPKxOKHmQ
 5WSN6Mr0t6Nw2+v/H9yvEq5b5h9PnIfknaQORUUUwL45OY7vXyhi8SVCSDn9U5lX+a3v
 4x1SMt75cBkj0uy3UMY/1So2owoYDuNShVo9GPXNqz/HOzdkpK3QrAPqXAKjHUaIuQTr
 mQuXPO5PNyChcZgY3tttZyNBcywbX5B81pin8rENciDQmSvOB9YPqQOKApAkclBe5ki/
 V4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uvwqkwvKY1N2gxuH7VwfxvJ5mQx7rsbXP3TITiOVwJo=;
 b=eTJIdKuzToAv3I0tw0pkXprTYrxjLo8VVBrosYhEQoHLD8oaOHZ3pQjvkFUtyKCnr6
 U3pf+WJgfW51uBn1GSpxIUUrth23X/78cTxNHj5eqQALNtU9zz+YY5U6FGDwDPVeNHPU
 Q8vziHguKjoKuSn+8BaKThGdPDpAbSDVYpr0hDReq1RZYfuaxt/rvFxc1w/Jut6gJLJ3
 LNEwGAi9tbBGniQMGl7ebzpJAltWD07HgSwG3uhaWBRElVrG+7jMK0fgszX6tCxEQ1nW
 9XIFU+SV0p4SyvPamuAlHSktfSiZOPHjaoJ33UjWUmAgr4j0/rv/gKP3GH9wSDnwspeA
 JF7Q==
X-Gm-Message-State: AOAM532GHALR4xzhoPyCLCIz2GLEjoXO2UpQJjt6vUQKuNCKNqFZ86yH
 OR9yv0S1nMj0g182pOYi1PuETA==
X-Received: by 2002:a37:5cc:: with SMTP id 195mr256484qkf.680.1637778168235;
 Wed, 24 Nov 2021 10:22:48 -0800 (PST)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-20-142-114-141-224.dsl.bell.ca. [142.114.141.224])
 by smtp.googlemail.com with ESMTPSA id h11sm267904qko.18.2021.11.24.10.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 10:22:47 -0800 (PST)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH] hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
Date: Wed, 24 Nov 2021 13:22:46 -0500
Message-Id: <20211124182246.67691-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GnoysqyKSHya

When Enabled bit is cleared in GITS_CTLR,ITS feature continues
to be enabled.This patch fixes the issue.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 84bcbb5f56..c929a9cb5c 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -896,13 +896,14 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
 
     switch (offset) {
     case GITS_CTLR:
-        s->ctlr |= (value & ~(s->ctlr));
-
-        if (s->ctlr & ITS_CTLR_ENABLED) {
+        if (value & R_GITS_CTLR_ENABLED_MASK) {
+            s->ctlr |= ITS_CTLR_ENABLED;
             extract_table_params(s);
             extract_cmdq_params(s);
             s->creadr = 0;
             process_cmdq(s);
+        } else {
+            s->ctlr &= ~ITS_CTLR_ENABLED;
         }
         break;
     case GITS_CBASER:
-- 
2.27.0

