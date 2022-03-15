Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2558042lfo;
        Mon, 14 Mar 2022 19:12:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWki9+qAv+ZtmbZX/mXyDujd8PfSAQxUAZt/ze+gZiDWJachX15ZhhXRO7e60nJFDD8bpN
X-Received: by 2002:a25:e0cc:0:b0:629:17d1:7ba9 with SMTP id x195-20020a25e0cc000000b0062917d17ba9mr20657169ybg.200.1647310340978;
        Mon, 14 Mar 2022 19:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647310340; cv=none;
        d=google.com; s=arc-20160816;
        b=dXnfBtz/Ly1OoKMJUp2AXFK/qdlKcQdWk/IofgbRtnUPD4hIebfWG9lTfCz36RXyct
         1pvdcA/OkuD3ZnSzSuCA0+F8MqZGgJKIoONKdiS8PIPBRTQly+W9JPe9qr9/tkHM64a8
         BCnNNglYn0y+0t0elQUZkEYQdkEVNsU2nCUdicD2ZaVj3PNjWdPckY3Mfz3Lx4QJvMLZ
         a8mSxo8fWERKAiiGw8FZkPmm2lJhOLYJ/w0jKaUEFgfsHjj8bYLU7WD+EO5WXPLenJo4
         ce8brLdAPrj5W8UcCSo3EBZmzbPNkzWFKSd0tVVEdWIBNB4jiKtXq+a2uqgpNY2/jHql
         NO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nPCyHm7z8svGYiIpoMfMBWpG43kIvw3IKZt4zZOcxVM=;
        b=eP8SN4QeuZqoOEg9nZB7ib6mmYqqVRkUOrp/v19Zyx0mUDHc6Ha2VXDRVbQzULg3jm
         HxZXj8Py8kcRQmZkmJDd4t6/Vo61Tf4BNZSwDgmuI5Z9XbFadwEjw73i2Bw625b+Rnyq
         CIVz+gLP+ew2w7btUcroy84qiS9kkLx5HNOt4YZ1o2C+1kzIJxK8EBFgMWZ6dCttcJr6
         RGGaN+Zvl4MPd5G2TmEprc1yIFVUcQSiPg8h7RAxUXqAUgXlR27YjUAWIJ1svjrSPC7A
         hMLqXweCfAYknMvPGupb6tNJx3E5kqy4zMDLmAsT7bEZG4IWDig8yefyL3NNWRoCRIPf
         PeuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esMDmjzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020a5b08c2000000b00628eb0793f1si10853650ybq.507.2022.03.14.19.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Mar 2022 19:12:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esMDmjzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTwfc-0007pA-C7
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 22:12:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTwfS-0007of-Em
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 22:12:10 -0400
Received: from [2607:f8b0:4864:20::431] (port=44585
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTwfQ-0001Vv-DT
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 22:12:09 -0400
Received: by mail-pf1-x431.google.com with SMTP id u17so15033723pfk.11
 for <qemu-arm@nongnu.org>; Mon, 14 Mar 2022 19:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nPCyHm7z8svGYiIpoMfMBWpG43kIvw3IKZt4zZOcxVM=;
 b=esMDmjzBs04dA7xZCyR2KqjXxrFbluzpRqqBgIWk85c6wQdIIfSHirInLMmPOHVpD1
 SVBL9awRcugYYkU1KIKLJb0PgWy2Tt1sK0pVMPGkDQ/ppTTsLpDv2hxq9qKDVzZ24FO6
 N6AZLf+ICLSHY9KV1vN7BrY72q9QrsUjhWa15UynRjNXa/iFmtztnMSzGqaA8JMSEX5k
 UF0y9FwEyZuDdRNNAQ6ci/xLUMaV+VkWguj0yb9AZ00UndzaSegYHLYN7JCvjhMRSqfv
 45oQ/jqHTKwO/SxEVTy7j8RBtxY3o0igf5fDJHBYFfcCT6MWSx9vlMDanu8iioq/uFL3
 4Ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nPCyHm7z8svGYiIpoMfMBWpG43kIvw3IKZt4zZOcxVM=;
 b=nqlOe+ujB4BEO9AtAcHhNcFKATonkroyY9DCpwecp+XClQ0OnDzivdhhc8UKFoFArb
 xoX0HwN/L6C8hzoxHKTkudcQuoNHNzbOWzY8lbe3cjSblxdjUhKJdvAjuLVxTQgVsMQE
 9BSiBpdnD1xm8iiMd7J7FG1yf0c5flTQQ4IPkQjW/LAGGbWGvyGD5K6ym64xMDQ/YY9l
 WivFTS1KyxBNr+2dX3u3AmjcrHdKF/TJ5pnpcEtfoVmTVKMmEPRF8akI1v/VNLVaqM0F
 Ncef+vuzGeIOZ85qTcT9t08rVg0uStl4TCEi/W+c2Bnq//6SttzyAdE9Tcm6CioxzZEm
 T22A==
X-Gm-Message-State: AOAM533lSCoR7dG/2M2wYF8an9qR/UXQBD3nIxf/F9VzlFByNP8juxfU
 qZtGiuDfy8soWAwQNaE6uhLIJ6FsZsGEQg==
X-Received: by 2002:a05:6a00:309c:b0:4f7:a5ca:4e20 with SMTP id
 bh28-20020a056a00309c00b004f7a5ca4e20mr14817106pfb.26.1647310326480; 
 Mon, 14 Mar 2022 19:12:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 10-20020a17090a004a00b001c44ffccebdsm802627pjb.43.2022.03.14.19.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 19:12:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix pauth_check_trap vs SEL2
Date: Mon, 14 Mar 2022 19:12:05 -0700
Message-Id: <20220315021205.342768-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ezjx34l6NmzN

When arm_is_el2_enabled was introduced, we missed
updating pauth_check_trap.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/788
Fixes: e6ef0169264b ("target/arm: use arm_is_el2_enabled() where applicable")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/pauth_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index cd6df18150..739aa520dd 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -390,7 +390,7 @@ static void QEMU_NORETURN pauth_trap(CPUARMState *env, int target_el,
 
 static void pauth_check_trap(CPUARMState *env, int el, uintptr_t ra)
 {
-    if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+    if (el < 2 && arm_is_el2_enabled(env)) {
         uint64_t hcr = arm_hcr_el2_eff(env);
         bool trap = !(hcr & HCR_API);
         if (el == 0) {
-- 
2.25.1

