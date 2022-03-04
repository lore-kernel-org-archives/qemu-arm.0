Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1758390lfo;
        Fri, 4 Mar 2022 09:38:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRl71gEKYLtu9r3qqIl0cQWCfvg2jz46HhHnEFRffMc16Xk1rWInlogfiB1cTwHt3uPGnf
X-Received: by 2002:a81:1e4f:0:b0:2dc:44b3:b3ce with SMTP id e76-20020a811e4f000000b002dc44b3b3cemr7807996ywe.295.1646415524889;
        Fri, 04 Mar 2022 09:38:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646415524; cv=none;
        d=google.com; s=arc-20160816;
        b=ufI8rAde0lkO7sNOwbxjOu0+bQ84WG2BXHLdH5vPgpLUc7M770JmwTcEPudBuoOfXa
         1QaRA0B1QjePEB2gtZek0LOGKjb56V7HsGMFv+NT3YKAX+4DYGJPIprZXpcBtW335QoJ
         cQN+HxFuiS2CgS9YTZR2f/iEhB8yTZEfkCQq3eLsHqIIFadK59q12rkLp4TgJnJ7/yFL
         uH0e7n7nEHBsskXT0/snbc39PTPjnT7bPSRGM8Rzya+CrVdlG0ej/cPGRPM/YLebQ/fS
         MSA+GI/UkGQWrlvfbThVYxOywVcNQ3eTuROD1GawGU5CZpHghq2rDwHd+ITyF/UvntYP
         6jfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=lW1wVbIgsonE1ioHNdUsJhPCSbGOTohXZ3VIQkAuHIM=;
        b=PKF26B4/8rI4Wxz1XignsNw3w3KK4V1c2BJSGh291cruyOVClD47wo2Jbk5yyizVss
         nvCLm8N84/YkRstTfg1uPmiwXucUsh1Pv+RIEGJkyWb+izmMsv2vtxwtxZy7smjNhTy4
         hpnL4P2EKf725PzvDok5NDze4SU74OBY10RrZbKmgwxo3gF/QHENsl0+/6U489QNsS4b
         vDemboTmlujpjniMyenyeZPyr3XZYvIJBU+B9XjF2AX/n7L9NMv/rg25UOVNMmF4ObTa
         3LTIpr+oi7Q2RJDyNspZrxq/soe/BpQ+j82Q9iPHj2nkZOS5aYbjPUMBBEBnhkYC9Kct
         33xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ALe1vIe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a817309000000b002dc2e54cc4esi4579911ywc.323.2022.03.04.09.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 09:38:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ALe1vIe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQBt6-0002uG-4A
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 12:38:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQBEJ-0004AA-HP
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 11:56:35 -0500
Received: from [2a00:1450:4864:20::42e] (port=38701
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQBEH-0005y5-9x
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 11:56:35 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t11so13592208wrm.5
 for <qemu-arm@nongnu.org>; Fri, 04 Mar 2022 08:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lW1wVbIgsonE1ioHNdUsJhPCSbGOTohXZ3VIQkAuHIM=;
 b=ALe1vIe2FO/zXsADzWlLcdY/wtiLdSVpOecrq8OmGic1weMeF7lEnUuyyNeucsVKvM
 MtfRAlTYrrdqxKKINXH30Bt++4Avr4DW0BcsSgzcljYWizON6c0zCNTGOtKn3pq9l1VM
 GhfC2memoEfS3Eahm0XOBEXWv5LnCkmd3V5GWgfGSlreV2WbpLTRqmxDCnCiURnbFL6y
 nd55g87adjsaeMEZxipwP4ifoG8yBtIPSkYOfWimZRVbsRoDJgqCQYl6OWcyFQPvnzwv
 UKZm7y4VqZG1etRyUYMhp89p2MEpIMSFE3VGJ/SD0R31fkRXUj9KDmzLki7Bj33Q0m6l
 z10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lW1wVbIgsonE1ioHNdUsJhPCSbGOTohXZ3VIQkAuHIM=;
 b=Q4IMVFgoYw0XT4qM5WGkUGmduStJCui7ceHeNv+YGGumTczIGta1c8ryyTrUVF61hK
 HilrIM8c56bnVdH8GmfhW7BX5vgklhudBFBIx40bXzs32PX1GXW0qIbVXHPYngddVL8a
 3BcwrAOTyrCDBziKuDWHV4yTC6trfreRfrLpLpupD4cGBcKXS/FxriCFyjFpbV1JsgCE
 nlqYxiQej48LvvvkQcr36+Q1a9ApphXQACROgwuv32BNys7+ZrRvESM8dV2UhGbOh3fh
 mzD5XQr6aNSdj+5Gm3mGhzlowH7cetktJ7NJUHIc1qA8+T14UBZqwLbrqn0C5excCyMj
 ToyA==
X-Gm-Message-State: AOAM531SScjzuOOAj0D4DaRAecVQlm0JzQDG1vgQT+HQlSVvsbjOjktz
 mWfiBSfMQIWeXS+mbKXpQQNayA2iNsN2Lg==
X-Received: by 2002:adf:aac6:0:b0:1f0:6848:54a3 with SMTP id
 i6-20020adfaac6000000b001f0684854a3mr3831986wrc.611.1646412990318; 
 Fri, 04 Mar 2022 08:56:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a5d498d000000b001f0587248c4sm4595427wrq.3.2022.03.04.08.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:56:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix handling of LPAE block descriptors
Date: Fri,  4 Mar 2022 16:56:28 +0000
Message-Id: <20220304165628.2345765-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RJp8qEiPtInh

LPAE descriptors come in three forms:

 * table descriptors, giving the address of the next level page table
 * page descriptors, which occur only at level 3 and describe the
   mapping of one page (which might be 4K, 16K or 64K)
 * block descriptors, which occur at higher page table levels, and
   describe the mapping of huge pages

QEMU's page-table-walk code treats block and page entries
identically, simply ORing in a number of bits from the input virtual
address that depends on the level of the page table that we stopped
at; we depend on the previous masking of descaddr with descaddrmask
to have already cleared out the low bits of the descriptor word.

This is not quite right: the address field in a block descriptor is
smaller, and so there are bits which are valid address bits in a page
descriptor or a table descriptor but which are not supposed to be
part of the address in a block descriptor, and descaddrmask does not
clear them.  We previously mostly got away with this because those
descriptor bits are RES0; however with FEAT_BBM (part of Armv8.4)
block descriptor bit 16 is defined to be the nT bit.  No emulated
QEMU CPU has FEAT_BBM yet, but if the host CPU has it then we might
see it when using KVM or hvf.

Explicitly zero out all the descaddr bits we're about to OR vaddr
bits into.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/790
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 088956eecf0..b5c8caafe84 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11706,11 +11706,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
             indexmask = indexmask_grainsize;
             continue;
         }
-        /* Block entry at level 1 or 2, or page entry at level 3.
+        /*
+         * Block entry at level 1 or 2, or page entry at level 3.
          * These are basically the same thing, although the number
-         * of bits we pull in from the vaddr varies.
+         * of bits we pull in from the vaddr varies. Note that although
+         * descaddrmask masks enough of the low bits of the descriptor
+         * to give a correct page or table address, the address field
+         * in a block descriptor is smaller; so we need to explicitly
+         * clear the lower bits here before ORing in the low vaddr bits.
          */
         page_size = (1ULL << ((stride * (4 - level)) + 3));
+        descaddr &= ~(page_size - 1);
         descaddr |= (address & (page_size - 1));
         /* Extract attributes from the descriptor */
         attrs = extract64(descriptor, 2, 10)
-- 
2.25.1

