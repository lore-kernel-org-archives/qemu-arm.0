Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2262646ejn;
        Mon, 17 Oct 2022 02:54:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7iX1pwpol7XCEEuE3I4JkS8s/M1I9GtkBe+vPdVq7YR6WF4szjCdDLVHnoNwjmBJydparg
X-Received: by 2002:a05:620a:244d:b0:6ee:7a23:dfa6 with SMTP id h13-20020a05620a244d00b006ee7a23dfa6mr7141765qkn.463.1666000440977;
        Mon, 17 Oct 2022 02:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666000440; cv=none;
        d=google.com; s=arc-20160816;
        b=B+bdUpxaUsgk/xevYhc9Lvq0N0FuqqP+hsSWfs+VsHkz7T7LwqQS8jVrVITkoj9fE1
         oCnXBjpgqjt7U/RcUllG2gDTFVlsxTQ0loTzocRSd9ArKnKSvFYVJH/tjEJzkM88qgMW
         f7JFs5cYuW1VhYLUHZNsuLOn8Wm7fEbBkLBbw7uR603AJXZrP2hVPQ3xx8D3QToA6uxU
         3ywKkJNNl8kLpM+ZS8wmXEqfggplaiLRaw5qHRoqVPuhIBOBwgTDqjGX/XgDV955h4qM
         GMBalJ67EZ/Aq6r36AY3hq9Okp5ZHpuZQS3+ra1xGZ451JK1PNqq/BKls1IQYov/JK+U
         fZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=q+1RkO68FpvgSIPW/GxFIFzaJUEnJFMWTGSdbMe0YJo=;
        b=TJF+u4wlivZOStdXZFXH1g5OGigf2lcWcx7rfmh0u8KFCt7iQgp+ter2Z8TRyJWwGh
         pwJqNwm4hO43DbpVkNW3S1UOgal82nJyaMVraZQGsSAcHnOormkMqtgV3XIzIwsa3ihk
         Xa6U7gPf4iYzLiVXQ8tzADFVa0NSmheW3n0DT5Az490yaiCpztjediTdkYpWID4zHdLe
         +pZG9wTo9eHaB4yb6I0sK5B9gJYOyVqyTuVHEtf3XZMpN4QP3Shdvukrmh55KTSAY9dK
         EDKK8Nc48eU5qKQU0Pg9x8HuDzEN7qM4G3YAUPfERDwI5WPqbZii5rZx0EULY0AcpD/X
         3pfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@igel-co-jp.20210112.gappssmtp.com header.s=20210112 header.b=qLFXfnz7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a37640b000000b006e17e3875a1si4889427qkb.203.2022.10.17.02.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 02:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@igel-co-jp.20210112.gappssmtp.com header.s=20210112 header.b=qLFXfnz7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okMoq-0005sv-92
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 05:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1okMSU-0005h6-3u
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:30:56 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1okMSQ-0003hq-SM
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:30:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y1so10563567pfr.3
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q+1RkO68FpvgSIPW/GxFIFzaJUEnJFMWTGSdbMe0YJo=;
 b=qLFXfnz7j+LndBZnNZTdzzuGXCciLpqS3QW0p7tygdc+BiTpphTosLDpWFYWt6F/6Q
 LNKRov+XptgZGXitC8v9qk2XgKpINqBwNGeTbfocs33otzfW1g5OKGvWDcS39Pv6Nd7Q
 JcOEDw/6I7nPWDTlOqKFwppaHz4U1AjJERpuC9120NmkI+xQEht8ku5x0P7rLbbLsac3
 204HDJ7Qs/6/9m2qYrEfnmEvPRRw/40jWLycbEbu4f5VIRtyvtrNBbD9Qok87WA8HXQ+
 dlOBwYhs3melP/pDQqmLcr/rkR5GkU3Guv9WsjVTgIV2xKRjb28UjCWRLVFo9duOKUTn
 jgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q+1RkO68FpvgSIPW/GxFIFzaJUEnJFMWTGSdbMe0YJo=;
 b=lqa2sxCl0Bw6UZUTAYsp+JizS1mJU0ayz9c7RawVbV8gXgDVnL51oR+nLxQhaLJz8E
 Y9FHcHj6LcmmPfBZmuJs5Aa1wg7q1cOXa9lSJbvtcEoezRGDl1MR5vlGHzDvTzmQj7cu
 AxEYF60Wx6EJko6ptt5QURfOuMND85Bn5xgrHKYK8RIgdpEwXqdRMqpHyGm9iPKqSCpI
 mlLTqwuw2O3pF5RPyz19w7qjDPe1aAZyMuT0P3PSCSFnLtmWWqEW0B6mPLi2DhmphMGT
 KRoRBidjv4Z8idKmA3k1El4yyBbu5C44jo6uFYQpMATsPv4WkpR9gcYxmcj9V33gBf1j
 Pfiw==
X-Gm-Message-State: ACrzQf0AfuoV7EX/9oJUoBGJ1fKt9PXqs+MFXJ/uN5wuZ7oQzdL7Yshk
 kn+lHS3kfXdDknOhb/KtcKxdvLDDef4alucP
X-Received: by 2002:a05:6a00:ad0:b0:555:ac02:433b with SMTP id
 c16-20020a056a000ad000b00555ac02433bmr11708557pfl.18.1665999049143; 
 Mon, 17 Oct 2022 02:30:49 -0700 (PDT)
Received: from ake-x260.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 16-20020a17090a0d5000b0020a71ca2cb8sm9261774pju.56.2022.10.17.02.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 02:30:48 -0700 (PDT)
From: Ake Koomsin <ake@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: Ake Koomsin <ake@igel.co.jp>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH] target/arm: honor HCR_E2H for AT S1E2R and AT S1E2W address
 translation
Date: Mon, 17 Oct 2022 18:30:03 +0900
Message-Id: <20221017093003.547009-1-ake@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=ake@igel.co.jp; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gF/gkJtJ87a5

When HCR_E2H is set, AT S1E2R and AT S1E2W should translate an address
based on both TTBR0_EL2 and TTBR1_EL2.

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dde64a487a..147f96e752 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3486,7 +3486,12 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
-            mmu_idx = ARMMMUIdx_E2;
+            if (arm_hcr_el2_eff(env) & HCR_E2H) {
+                mmu_idx = env->pstate & PSTATE_PAN ?
+                    ARMMMUIdx_E20_2_PAN : ARMMMUIdx_E20_2;
+            } else {
+                mmu_idx = ARMMMUIdx_E2;
+            }
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_E3;
-- 
2.25.1

