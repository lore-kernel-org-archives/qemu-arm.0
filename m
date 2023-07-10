Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1259967eje;
        Mon, 10 Jul 2023 08:22:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHG6vOc2rEC2lFtJ+RuSP2tbDmwO7QsKjCBBjeOFXukdgeC8Qa72zwAY8F8st4lCCYuTfvJ
X-Received: by 2002:a05:620a:4514:b0:767:3799:fa98 with SMTP id t20-20020a05620a451400b007673799fa98mr17248527qkp.25.1689002540090;
        Mon, 10 Jul 2023 08:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689002540; cv=none;
        d=google.com; s=arc-20160816;
        b=mYzML2un8FSaEb0Oaz5zEbgBML9h4vfS+Hw7LFaWOFj4M3NNRPTTRkYN9T4DmZOEKI
         Sli0G59/ly0noEGQXsjJzS+By4Romcwr10eXxTrhkYxBV6uY5cKgmGI7FjqT0zQj1Uou
         V/cp1TALgbaQdHxVPFeHHuawnUQTNiEtukVeMeVJj0rqLEEINWvZHRPt2+uUc6l5ZOG6
         NtbfE6TcOIA2JTsAgo7r7fUfupe3blsfMrCANLMoA8nJPjsvVcG3apr2PmI71mNQS2F7
         hkeWlKZPUR9OLeceUzq+EbSBzR+jUfrvcrSTwG09Mn6MZxedSqNPW57h+FRtYKuG3I3e
         tphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5UcR4FHg9WVcPft9HxBo42jo6Qco7ragFk7gzsy3OlA=;
        fh=DjFcf5x540nYnyRj+nrzzvmu8+sx0bTdo0fYzBaWDzs=;
        b=aY07UpWp2wV1i5o3Z09t0qS9wC0chdyc2hkuUYDnRH+MGrkTLoW6CMG87vJXqENQ8a
         WGJ3tvxGI4crnLbWpb9TKrYN8A9L5HEAf1dnma3K92YVxVTG7ESLX7uF0iAy0i8of7kr
         mmGC7nlU4sip0kgxwtLBvh2R8oVAA8zt5HG9sDKzjKoiw/l5vf/IPS0MJ0lIabyn9AOh
         63xjVAdCEyNMH0jSYuZbxqJCq/hYQPZyZHfxW96OwqGPIc54hlv4WTZ4fLs7nw7BUUnT
         Pf2dDA7fU0OvVI9RqSeCxOgGNuAo8CnPjuXRgUpiqbJAim3oEe0suZXPv4O4wg2v2IjQ
         ggTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSoQ4+jC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020a05620a2a0500b00767cc1bbf59si1542044qkp.62.2023.07.10.08.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 08:22:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSoQ4+jC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qIshw-0007lm-2N; Mon, 10 Jul 2023 11:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qIshp-0007k6-B8
 for qemu-devel@nongnu.org; Mon, 10 Jul 2023 11:21:43 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qIshl-0007ve-Es
 for qemu-devel@nongnu.org; Mon, 10 Jul 2023 11:21:41 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf107so18317165e9.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jul 2023 08:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689002493; x=1691594493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UcR4FHg9WVcPft9HxBo42jo6Qco7ragFk7gzsy3OlA=;
 b=WSoQ4+jCE/H44aGUgoGWpIn8FMihv4CdBuyTu+ycFzTQUa9GUOZiu8LNvB+7X/EP+i
 6Dl9sGKSCfFNCFIOJ6DIAyiH2HwCDZZ8e7IxbjHuhmq7zISjIb498yL2nbUw0ZGIOaHz
 dB5Gb1CTeXFEFUmMg9AtBkX97DxINzZXFkuNgysGv81cqIoxjKneePn45f5No4v0Ah3V
 +h+cnZPWkUSNmm4V7A1Tk932AiPZ2kO9j1+vO76fB9USjWicHQ6WjGBrXvxhJOhCykiM
 Z/rCsHR0Tg4aC42uZvbU+L9j9tsBcnaA9Sxe3EsACzxKSvlqFlv6ipB7W1hbYa1m2qS7
 84Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689002493; x=1691594493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5UcR4FHg9WVcPft9HxBo42jo6Qco7ragFk7gzsy3OlA=;
 b=fbCBn0uyTKKLlEKGk85UtUOEljI3Kx6VesJZsPyMLdAZvui366ND7o3ed47WJK/POM
 9hAfvFW/ONcTw7x6RvNSaOiNmckTlembwC6Hgdu93DqVnL/dzSGfawIwgrjWVp4U+Peo
 Z0lX6O575LYbSCnvEzn5Xb0DG+OpWwgHrJDiOEAI599/TLHbVQ6SBN4cvLDw53xgltG+
 BlrNlrIhAnYjMRiRwaSMCbG8xaSzoxLn6C11HMX2QQhd/m6Z+mLHMw0IA0/a7fmqJlF6
 OFax80LY2wnk75KR1PHNvtc1VLcObfp0twxtTjSG/rMVPsOpjgGSmR8eUSiotBbHMbO8
 dM3w==
X-Gm-Message-State: ABy/qLa4bb2CyJeUscn2zq/ZtxTG29+J9QYTmnXBnb8UVGWe8CLKBiGn
 pMZMtuG4tp0R/kqSQTBErSJF7A==
X-Received: by 2002:a7b:c8cd:0:b0:3fc:5d2:1f47 with SMTP id
 f13-20020a7bc8cd000000b003fc05d21f47mr6559620wml.20.1689002493255; 
 Mon, 10 Jul 2023 08:21:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a05600c215800b003fa95f328afsm10578798wml.29.2023.07.10.08.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 08:21:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-8.1 1/3] target/arm/ptw.c: Add comments to S1Translate
 struct fields
Date: Mon, 10 Jul 2023 16:21:28 +0100
Message-Id: <20230710152130.3928330-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710152130.3928330-1-peter.maydell@linaro.org>
References: <20230710152130.3928330-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A2Xw9Qoni4Bj

Add comments to the in_* fields in the S1Translate struct
that explain what they're doing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I figured some of this out when writing commit fcc0b0418fff,
and then I found I'd forgotten it all when I was trying
to fix this new bug. So this time I'm writing this down :-)
---
 target/arm/ptw.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9aaff1546a6..21749375f97 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -19,10 +19,50 @@
 #endif
 
 typedef struct S1Translate {
+    /*
+     * in_mmu_idx : specifies which TTBR, TCR, etc to use for the walk.
+     * Together with in_space, specifies the architectural translation regime.
+     */
     ARMMMUIdx in_mmu_idx;
+    /*
+     * in_ptw_idx: specifies which mmuidx to use for the actual
+     * page table descriptor load operations. This will be one of the
+     * ARMMMUIdx_Stage2* or one of the ARMMMUIdx_Phys_* indexes.
+     * If a Secure ptw is "downgraded" to NonSecure by an NSTable bit,
+     * this field is updated accordingly.
+     */
     ARMMMUIdx in_ptw_idx;
+    /*
+     * in_space: the security space for this walk. This plus
+     * the in_mmu_idx specify the architectural translation regime.
+     * If a Secure ptw is "downgraded" to NonSecure by an NSTable bit,
+     * this field is updated accordingly.
+     *
+     * Note that the security space for the in_ptw_idx may be different
+     * from that for the in_mmu_idx. We do not need to explicitly track
+     * the in_ptw_idx security space because:
+     *  - if the in_ptw_idx is an ARMMMUIdx_Phys_* then the mmuidx
+     *    itself specifies the security space
+     *  - if the in_ptw_idx is an ARMMMUIdx_Stage2* then the security
+     *    space used for ptw reads is the same as that of the security
+     *    space of the stage 1 translation for all cases except where
+     *    stage 1 is Secure; in that case the only possibilities for
+     *    the ptw read are Secure and NonSecure, and the in_ptw_idx
+     *    value being Stage2 vs Stage2_S distinguishes those.
+     */
     ARMSecuritySpace in_space;
+    /*
+     * in_secure: whether the translation regime is a Secure one.
+     * This is always equal to arm_space_is_secure(in_space).
+     * If a Secure ptw is "downgraded" to NonSecure by an NSTable bit,
+     * this field is updated accordingly.
+     */
     bool in_secure;
+    /*
+     * in_debug: is this a QEMU debug access (gdbstub, etc)? Debug
+     * accesses will not update the guest page table access flags
+     * and will not change the state of the softmmu TLBs.
+     */
     bool in_debug;
     /*
      * If this is stage 2 of a stage 1+2 page table walk, then this must
-- 
2.34.1

