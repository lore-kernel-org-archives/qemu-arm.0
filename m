Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3834024lfb;
        Mon, 16 Nov 2020 08:12:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4TOxlPdK61979UR6vBu33pAQDVpNCKQaEhMR3MWOwNJgGutzSMJCScUIfeZCEOQ7s27VN
X-Received: by 2002:a25:7355:: with SMTP id o82mr21500057ybc.122.1605543178534;
        Mon, 16 Nov 2020 08:12:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605543178; cv=none;
        d=google.com; s=arc-20160816;
        b=YCrwj5xNWckqxiXmD99ydVXch6H+ZazsjToxxhVuoa6qU1OtGd3xGtf0NEnz2H4fjA
         hQkbNegkXhoz8NKqKbHT7qLSfQAEZDr1D3hAW2Lvisq1z9sxzjBnx3ogK1yuz8U0ceuK
         UEL4oadVbqyBugkXWbcLOO/nArtIdrUEj5Rz6SBTs28dq3M14nLCj7Wh8I5v6iSsmslm
         FtZMTrvcIB1UCt2ztgCOTCffaC3fxQsu5c1Uwmd94XWDd79lxEmwze+GDNlm5Piu6EtJ
         YidF9MEeGcABy5b2IAhRmyEAFFyEEIFkjF9i0WSRS0FVCylkeSyuG0xD6KGe8Bgda4Uj
         8ptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HNHlpd9eKe0R86UXf9IfUiC/GomRktWtpFHvObtXEPY=;
        b=KrB1jcdb5Ij9JGcbf/n5Wy2NdIN2NEIn4QaB1HBJ9++FrwQn2yyRDj8Lq1QhfkJK8a
         IRx7hHETjftsiLVW4c/i7E/zx2gO28vWRDLCEk6csmbfosjFSJmKmy1Db1QaTv7pOhP6
         Ydee5aPT68gtoPs/tHvp3535lnkeM/QPQWejYO5VXKs5CrxRN2r4jgfXXJhv3O1DXnzc
         Nv+odbI+S3cxUINo9sQZAYgIaqVvsExVxKWr17v6IUA4MspeEaW8IGpevOLa9wJZnAiy
         mUjEm9gHrzdqboodBbnD44GdXeICKaUVv2XVEx6+3CHpT9tcE6ra+GeUWDjFHlIv7ecS
         NPjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myxplUlx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si10850032ybl.404.2020.11.16.08.12.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:12:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myxplUlx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1keh7h-0003dY-Ue
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3Z-0008Hx-9E
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:41 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3V-0007o5-WC
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:40 -0500
Received: by mail-wm1-x341.google.com with SMTP id a3so24081648wmb.5
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2020 08:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HNHlpd9eKe0R86UXf9IfUiC/GomRktWtpFHvObtXEPY=;
 b=myxplUlxZsKwkLLtVQ825Qc/NM8+sa+JHfNov/B+Xt66IVg1tqUw7EprGZ8167BCqs
 aCXiUJjY4SXPmOG9NGN6ovh9KYJeIBBEbY1fVUryPqwuF9Wud6RBLydwIwkWkbDKGnyl
 bIh8m18O7ASRzDv/bKBD7eSKqhtn9yO8nxxabxiDN1fg37uc9hONthHUAjSVNtv3upbu
 juMnKgNTLl7CFqx1Pd10xdRNa1Ii5in0d1z4HPWaf/hohj6K7IMYYhqQERc1XdP6IJpi
 g70U+yFb5xZW8mGoxv1QFLSVNPFN9zGNMHhZ9v4zBe2hpCMHZjngCUTuafYhF3yYjlkb
 EDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNHlpd9eKe0R86UXf9IfUiC/GomRktWtpFHvObtXEPY=;
 b=hSks4zlEXBmuHgyEUkenHGWyVYT7nJq2+id8DNIl41rrUE4X1hR88/tj6/UPgp8X+E
 tv1zIl5BvecJN1SOxfsoWQWT6SRRKqhT40VnH5YUfNTQOw1toD1Yk7AnODqQy/PCtq9Z
 JQyhtCSqR8WnJsgXW/4ki08eTsvc3nLbtLqvQE1bgU31UgvMMND7Jzrzwby3onVbZZCM
 DYihUrtCfcKN5U0PkcuPsgKQgYBQy23YnYHRc0f8GseRuVkjF/h6L7wXWzz1ov5WEisa
 KWW/VXMYmZQxRmg2FOsQfv4O+fwrfPnXTU8LjBcRuxomcC0cCFZBll4GrsErhJ8FzrWF
 U4Wg==
X-Gm-Message-State: AOAM531K2JQ71Ra2kUNoVI1sVRJDPYwTxhkwviMSbR6Fpvty3ZIHleY5
 het982Xy2ysNRF5o0yKmXlONBEoaB/H2Zw==
X-Received: by 2002:a1c:964d:: with SMTP id y74mr15793545wmd.129.1605542915755; 
 Mon, 16 Nov 2020 08:08:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/15] target/arm: Implement v8.1M PXN extension
Date: Mon, 16 Nov 2020 16:08:18 +0000
Message-Id: <20201116160831.31000-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: cRnVO2ArclAM

In v8.1M the PXN architecture extension adds a new PXN bit to the
MPU_RLAR registers, which forbids execution of code in the region
from a privileged mode.

This is another feature which is just in the generic "in v8.1M" set
and has no ID register field indicating its presence.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 11b0803df72..abc470d9f17 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11754,6 +11754,11 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     } else {
         uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
         uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
+        bool pxn = false;
+
+        if (arm_feature(env, ARM_FEATURE_V8_1M)) {
+            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
+        }
 
         if (m_is_system_region(env, address)) {
             /* System space is always execute never */
@@ -11761,7 +11766,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         }
 
         *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (*prot && !xn) {
+        if (*prot && !xn && !(pxn && !is_user)) {
             *prot |= PAGE_EXEC;
         }
         /* We don't need to look the attribute up in the MAIR0/MAIR1
-- 
2.20.1

