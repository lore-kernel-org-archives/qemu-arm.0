Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2893342ocg;
        Mon, 10 Oct 2022 20:45:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4CvO4+F/tSUAA5w4ACu5b0dq/Duv8rokOH/ik7dn8rrttwl8jxa2ZYtcReQXpxPTfoTUrP
X-Received: by 2002:a05:620a:244b:b0:6ce:8443:bda1 with SMTP id h11-20020a05620a244b00b006ce8443bda1mr14304907qkn.685.1665459952401;
        Mon, 10 Oct 2022 20:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665459952; cv=none;
        d=google.com; s=arc-20160816;
        b=YWlaZ5G/KJYDjLglwMp5KmGEpbUN938ZK4AX9iH+AOkTrjxGwTzpOIxWyOExZlSAgB
         K9jzuSiSuE6jJ8QvoENXQvyZxli+A8fIw3lQVSgj8B/bL/kwRr9FHYfnq+qLyZTA4Bzt
         16Ehk7pM+A+Nwu5wt+G7wICwz3L/h+b5a1vlsaZBRYJuSqrsR7kFYVA2Ka4FM+mr3Nej
         Tf5citNyiNgaNxsD6UZ5dVacRwZ4cypQW14Ikmh19HAWw3kuKP/Hhu4FjNQfDB3tkc91
         k9wNer7jx/ZhLBI6M3h9ZH0TjsxP1ksKFMtCvwpdlXkHh6bMXrTQmulM1jggzVuuEuJk
         38fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+7jRVgDoKz3lej+ZaMULQKKS6huX/14P3OCNEftnZ1M=;
        b=Yc7uN2XW7Zi7etM1KXLTwHjFpwiuKZhRSksISl4YL2cB2SWlofZPRb3hpkJkeJe4h1
         NVytUNA6zEkKv7YiNsq0u6ttCzUSu4Pwgl86bfC8PiQn+J4xXCN5P53ntvtvfUZu7LdI
         gQ8vGi2T6Vt6o7HW72scmm3snT5dV9qcVtJ9GDOxiOG4f6NP7uQDsjml+FwBWhVS6MYy
         Cgd4H7CCRBl9fFjdXPGA2f3S5WJ6jqfaxYQ5JOm+5OVZOxc8niVLoHA6/s5BUXEJFGoI
         C95N8uUI1TsV124TJFqCvNJXRRwKid3GsdosH9+0phDDWgG0j/fwzz2RaesmY2gQZAC/
         KC8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4bYr2XK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a27-20020a05620a439b00b006ee406bb808si1346025qkp.58.2022.10.10.20.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4bYr2XK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi6DI-0001ta-1L
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oQ-0003Bz-3T
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:20:14 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oO-0003Ll-Et
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:20:09 -0400
Received: by mail-pl1-x62b.google.com with SMTP id z20so12002325plb.10
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7jRVgDoKz3lej+ZaMULQKKS6huX/14P3OCNEftnZ1M=;
 b=j4bYr2XKuchTNZKteEefZpZt0QG45dJnXRNntSMEGb7Q5dbpJAOqHoUvnNJw4LkK7N
 VNCYqqQYVPYk95epRH9U4/Ixa2cc4yGg6xJMHGlvXzRIcNWlaVoXeydcMutHYyt4cmnO
 CNGVBqVjPcmoavwgFjG8FIfaa2uZVYu9FfFMsM9VnC+TOq9zaCYz0PNC340Kuu2LctOU
 UCEfHXcJgkqPysLi5lfHbyL17y2G2aIKffpIfLaA4ShbROtthk0vxiUQBl7W21vzqIW3
 kEEiwkVd1cs3mHptz3oYsDSTa6w8AvoqgGs3FEiWDojv6bUPKadSDDtZpDEOPp9BrGXl
 sLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7jRVgDoKz3lej+ZaMULQKKS6huX/14P3OCNEftnZ1M=;
 b=5st1TsWu6LDDwEIAYTM9TvSlgLZASWon9tUDy6fH2JQnR9fwRGMrJOHY3N3lz2j+f+
 Ir2IBrp/IoeSJoZCm7er9eBGaVdWvW8ILO03WsgmtyFmPUsQX4nPPnkgSNnjevdTjn4I
 XJ3VyH+VUvKNQnjBGooPdEiKPHHgSXHT26UpxPREyoPU2IV3W0sd9bkb7zWTpIgtS+9M
 UgPN3B8vr01NsBsTEYzdHGgLkoMqfWLJgftTCYHcJflvAMCcKDrZxKKphf+j+4ZQ33zn
 1d3ykie00ZH0g/eUnzRiBWPE8SoKJ6rFzD/bMPgLXQRxhEdTCJPBdk5K2Fz7oD2PEKU3
 f4UA==
X-Gm-Message-State: ACrzQf3CRV4lHMNsbM3AI20Q6FwwIcBC62df60l3lcmbNsL1fLIEq05B
 xy3VQWqhPw7J42fabTIwVMTB4A==
X-Received: by 2002:a17:902:ab1d:b0:180:4030:757d with SMTP id
 ik29-20020a170902ab1d00b001804030757dmr18384506plb.155.1665458402989; 
 Mon, 10 Oct 2022 20:20:02 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:20:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 24/24] target/arm: Use the max page size in a 2-stage ptw
Date: Mon, 10 Oct 2022 20:19:11 -0700
Message-Id: <20221011031911.2408754-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BBsO4XJxJgRI

We had only been reporting the stage2 page size.  This causes
problems if stage1 is using a larger page size (16k, 2M, etc),
but stage2 is using a smaller page size, because cputlb does
not set large_page_{addr,mask} properly.

Fix by using the max of the two page sizes.

Reported-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0dbbb7d4d4..b8934765ec 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2584,7 +2584,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
                                    ARMMMUFaultInfo *fi)
 {
     hwaddr ipa;
-    int s1_prot;
+    int s1_prot, s1_lgpgsz;
     bool is_secure = ptw->in_secure;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
@@ -2620,6 +2620,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
      * Save the stage1 results so that we may merge prot and cacheattrs later.
      */
     s1_prot = result->f.prot;
+    s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -2634,6 +2635,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         return ret;
     }
 
+    /*
+     * Use the maximum of the S1 & S2 page size, so that invalidation
+     * of pages > TARGET_PAGE_SIZE works correctly.
+     */
+    if (result->f.lg_page_size < s1_lgpgsz) {
+        result->f.lg_page_size = s1_lgpgsz;
+    }
+
     /* Combine the S1 and S2 cache attributes. */
     hcr = arm_hcr_el2_eff_secstate(env, is_secure);
     if (hcr & HCR_DC) {
-- 
2.34.1

