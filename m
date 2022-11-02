Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2458821ejc;
        Tue, 1 Nov 2022 22:47:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+EopmNDhIZ4mnYZAyp6ggTCVJ3DplaZ1oeTFWhDu6rFlN6F+iXwnMWf1Aq6Trc6o9y5Hg
X-Received: by 2002:a37:f516:0:b0:6f9:b90a:2d34 with SMTP id l22-20020a37f516000000b006f9b90a2d34mr16398459qkk.606.1667368049860;
        Tue, 01 Nov 2022 22:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667368049; cv=none;
        d=google.com; s=arc-20160816;
        b=RHN4TtIl6aNxWeQdie3v53nX1rTHJqP6uKuFoek3dXEfZ9fxhNqUz41dRY/1rUjCgW
         EcK2+2qDSQ9Kb6mcLxfzxXuJdqhgI0OTMXJvvEPnNBnKAGeDGFsffaGRYQO4Jo1qDHVl
         nq88jutL/42HsyYzbfFTZkyt8piW1aYvXYDVomaGS3dofWdqRjibTTHb84bbl2wNJTen
         LYlBgZ9XOy+KWH8yz6sHtWSdFqnxqfqDygip8Q8+6aT9yxqvssdYzh531YXHdx8R/pQx
         cGlMOOPHUQ7PthuKuisKE/f8fpv3PL5JURpKsLeByTqfEMSHLqH+OK6tWMqUtGX+5eBJ
         rPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ULAXwT5VzMBCI1KaQ06N0fdiq7JAkC5SfEaYbtxC2vU=;
        b=pHE3tYXLbJD2Lmwi+uXP1QOIbqBvlrRjy5XvnOAr2k7mCSoy+Wse8SFA6cu22nxN98
         bvMcF2AjaivD/ip2pif9qaPv1eLJqFulv6+wkxF8XogTILDFCngOguHf+MFU0NGDya7P
         xZPdt5lRnvfhSsLP/A5Y2CIAhT5TCKkOfXCvO752GYsCniGucsBiAIYrcsCNz9JKPE6G
         alxvTGavg9wwqkhQjkAQgff9F9hkAq2B+1NXyKqY1sPZyqgKfYxXGlhhpMoV/az4VK0f
         v4sKS2JunzKiwpXRNRR3y8xVViIKxixuCLlZLZxXbMsEiKh+pMcEV87ip5GPPMTjMNQY
         Qy/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ftojNHF4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz11-20020a0562140e6b00b004bc074cf54csi4020022qvb.429.2022.11.01.22.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 22:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ftojNHF4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oq6as-0004vB-Qk; Wed, 02 Nov 2022 01:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6aq-0004ug-QI
 for qemu-arm@nongnu.org; Wed, 02 Nov 2022 01:47:16 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6ap-0005co-6p
 for qemu-arm@nongnu.org; Wed, 02 Nov 2022 01:47:16 -0400
Received: by mail-pl1-x62d.google.com with SMTP id k7so5863569pll.6
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ULAXwT5VzMBCI1KaQ06N0fdiq7JAkC5SfEaYbtxC2vU=;
 b=ftojNHF4D2Wc5nS1vAhXS5sk7n3+11OEqnSv7aentEeNDQOCpx9YRlniXw80ynRNE1
 A8YAdozQitcVCfyoKUNgd2r+napGsCv0sK311aS4Sg5pniSyghu5pWDlJzcdotLxzBJ6
 +A+nqSZIlFBlETt5EDF4jD4heudDri4fhb8LTyLcgVTB+j9ndeF/nFafejfFMMgAAuJQ
 /qFUTZ+SVJD8WCfn2dveOKRKrC4ZLLl7U5qYK/H32av3TJ7yLKmIyPTqjPBSBsNarJKf
 ewG+r5ZsEEnkAHWxLS/jKdOINfz7AwKL8L89G2PIoY6cEmumTnffNxYykdZcOSleQvcO
 snIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ULAXwT5VzMBCI1KaQ06N0fdiq7JAkC5SfEaYbtxC2vU=;
 b=rSK6NjRY7y4P5iKLuBjZ29m3A8rKsS+DVgp24KesyT91V25qOtecpQTRvq4WKlu7rG
 qQbTvuader59ZesekBIXBVovaQ8Hr9jJGtsm7QWOvmg21RLP7AuS2mRhmpvfKgYyVahi
 kZDweymuSlg2XH9OhKV91FgIoNw7BJPoyEy38hBPSp/mBynvaoeJk7W4PhGSgIzG0Ncq
 NsynM/3hr8i2B/sSWywRd7i16eHSUpeRQfsPtq6UT0hYpMc7yXx6JBA+emMrlEVUvufW
 Qo0eHHmvpca4ygVJ4S1PUnblYcK+GbglyoXEvd+wJDwVlDZ2/uXi62+qjaaCjxjQu0SJ
 Av5A==
X-Gm-Message-State: ACrzQf34U/5USxEd4fd3+/gagcv4EhNJQD+/hu50cjAalz/OvdnMg2DZ
 +aSDxVpiyMfVvtU2w142fzaTdg==
X-Received: by 2002:a17:902:ccc2:b0:178:29e1:899e with SMTP id
 z2-20020a170902ccc200b0017829e1899emr22802065ple.114.1667368033464; 
 Tue, 01 Nov 2022 22:47:13 -0700 (PDT)
Received: from stoup.. (mur1374950.lnk.telstra.net. [139.130.176.43])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a17090a788500b0020ad53b5883sm551575pjk.14.2022.11.01.22.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 22:47:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] target/arm: Two fixes for secure ptw
Date: Wed,  2 Nov 2022 16:47:06 +1100
Message-Id: <20221102054706.1015830-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Lpvwq+9eQDUz

Reversed the sense of non-secure in get_phys_addr_lpae,
and failed to initialize attrs.secure for ARMMMUIdx_Phys_S.

Fixes: 48da29e4 ("target/arm: Add ptw_idx to S1Translate")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1293
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 58a7bbda50..df3573f150 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1357,7 +1357,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
     nstable = extract32(tableattrs, 4, 1);
-    if (!nstable) {
+    if (nstable) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
          * Assert that the non-secure idx are even, and relative order.
@@ -2671,6 +2671,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     bool is_secure = ptw->in_secure;
     ARMMMUIdx s1_mmu_idx;
 
+    /*
+     * The page table entries may downgrade secure to non-secure, but
+     * cannot upgrade an non-secure translation regime's attributes
+     * to secure.
+     */
+    result->f.attrs.secure = is_secure;
+
     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_Phys_NS:
@@ -2712,12 +2719,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
         break;
     }
 
-    /*
-     * The page table entries may downgrade secure to non-secure, but
-     * cannot upgrade an non-secure translation regime's attributes
-     * to secure.
-     */
-    result->f.attrs.secure = is_secure;
     result->f.attrs.user = regime_is_user(env, mmu_idx);
 
     /*
-- 
2.34.1

