Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp179907njc;
        Thu, 18 Jul 2024 18:08:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOdPJvdQXxIoLxkcJWegIzQidfPmA6Z21GEdI+ohd1ghs1T1U0Jhb48eq9DFsv/JzcU7oF8Oej9/3ls+sLmNSDhVct3K1b
X-Google-Smtp-Source: AGHT+IFdhy013yDgX0HGF/LA+OYcwfgRP7Q960UjnwSWN52sGMfVNFzcdJ/+8tNDO9sG1Eg0gERj
X-Received: by 2002:a05:622a:148b:b0:447:f68c:9963 with SMTP id d75a77b69052e-44f9698c907mr28429091cf.16.1721351300293;
        Thu, 18 Jul 2024 18:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721351300; cv=none;
        d=google.com; s=arc-20160816;
        b=gQeFuTUyT3u5Sy8G1ly8rKU3wHUMeJVT8fMDKW7nKRzDtNMZPxeZFqKvUts38pSMRJ
         yPi4dkGW+xYzbmqIpJPAo/3SdZ5JZu8csfNUahDOeIgCAJc2EnPrgvaffnRQ9hgA25Nt
         8xqjkINvujcIBNhk8k4r8wgjMBYXEFBbE+RMrKX9cXR//S3zmQ58kWoiYOyKj9/MLst3
         mPQK5w+UALSrwExtJA5iT8UhBIPRcpL0OBX7J1F3UEGgcWqdQ6qObaekddtHeqnIW31q
         2ucjz/q2kL+BLbeoe8YWKS8Kh19y7nb9N66vMlqirRAtHlLIMXMA1kTXI/0a5FKuefti
         NAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T/SUfCnTpRQkNLbtLFhLzUNUB0u06MHsZx7MB+lBLUc=;
        fh=yRLCku87Tm1ZVhWXmjCuh00faiCzdFZ7tm3MnwaPv5I=;
        b=jPuiJ7chfD3S/W36qjk1cnLIqC/aOH3/+jmut3TK+yJ5/if6ZO3u0km5pp/lQWZtPO
         RiyTEaaPu32k3R/l6TwVwl1YVXGxYd9aE5Ejs2W8u+03u9/biSSRUNLirGQKWJvJbinr
         x335u+U5YjYyGMxsbIYMi0TASkpUswhN1pGEkDF0pDLTdPadanrFMOB7aKDxXdYoW5V+
         QVPLxbVAIrinFwWxENBloztSD1NdromjHAtU5dRxB/p2fWtUEkuPHYZHJkIxtsQ2jZlw
         G0CbNsMXBGx2OI9k7myYW5lpRh1b7xHnjfCHP3Yt71q+N4xFf4WJa6yl1+fbvzvIGMN/
         +ROg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YjsquKBm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cf01dfesi4439031cf.651.2024.07.18.18.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 18:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YjsquKBm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUc6D-0003x8-Lh; Thu, 18 Jul 2024 21:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc5w-00038v-0F
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc5t-0000mC-QY
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:35 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1fc566ac769so11728675ad.1
 for <qemu-arm@nongnu.org>; Thu, 18 Jul 2024 18:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721351249; x=1721956049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/SUfCnTpRQkNLbtLFhLzUNUB0u06MHsZx7MB+lBLUc=;
 b=YjsquKBmU2OKdeWRj5y1IYkFT2Zoirmb0L1jzJ2KhT05hfp0dQxPUXj3ncMB+rttK3
 tGRQNXKhXH99C0UfDurBpmCPPUXkqb3y5BVnABvrtcfG4DX+rHE2W475Rn2lt8xBKEYy
 /K4Vy1QQurMEkFF43HQpn147EnpJWfTlK5CR3DKfwBxsEi9EMTNLRjv3vsbRMfRQhrlW
 Fu6WU2IPCHwSMnADfCo+wN2y/fV1+SWiCmgvU0k0CRkcJOT1GRtlzf2wwXP01rO7Rzc4
 e0i5090qUXSx3Cu/81TVh0upS0zVQLPAUvczuHwQotk1MEqoAUyOLrHHOtCFxkSKEOfF
 Fsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721351249; x=1721956049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/SUfCnTpRQkNLbtLFhLzUNUB0u06MHsZx7MB+lBLUc=;
 b=HXz+Auhz7ecJvy7jsC8gBpOJWOHd7d8jjTt7AkB02yajoDtrSq5LM71ptO6vyjWD38
 M5NDnUdBUoYtc5EFV95gmACyGkrvA1NKI+doWp0likvVGZq/m9aJpXqMzDUQvVWHR7xZ
 9HqkXhnB/D4ulz2GKWymxNPcW3R2DgYg+UxCxFY238S+sUQUUCb4STmkA4eF8ksEomZZ
 wg9RE+EcIYfF4yWfR0q7HVb35jD8y2gQ+71BADd+0aEFFtjjXdmk2G2U9U/ZYx0vMoCd
 8UlEi103Dc8Wifeln3kZbSn/D9Jj9iQLQk/AeZz//B4mQ4Asg9AsUOEOkVFYbe4OdrEp
 G/4Q==
X-Gm-Message-State: AOJu0YxmbWabZoK85Kxs1nsxxdabI1MHPvx2qZxz4nRlidZbj9BNkTZm
 9GJBjejW3Z7zXlluc+XqPlU4CKS1KR2ZqkP8uo87cBBwNegqamXcEQvIO2ienFk=
X-Received: by 2002:a17:902:db0d:b0:1fb:1b16:eb80 with SMTP id
 d9443c01a7336-1fc4e15c311mr52103855ad.26.1721351248839; 
 Thu, 18 Jul 2024 18:07:28 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd64d07ad9sm2067415ad.177.2024.07.18.18.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 18:07:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3 04/12] target/ppc/mem_helper.c: Remove a conditional from
 dcbz_common()
Date: Fri, 19 Jul 2024 11:06:59 +1000
Message-ID: <20240719010707.1319675-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719010707.1319675-1-richard.henderson@linaro.org>
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5rXWfV1Hicgx

From: BALATON Zoltan <balaton@eik.bme.hu>

Instead of passing a bool and select a value within dcbz_common() let
the callers pass in the right value to avoid this conditional
statement. On PPC dcbz is often used to zero memory and some code uses
it a lot. This change improves the run time of a test case that copies
memory with a dcbz call in every iteration from 6.23 to 5.83 seconds.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20240622204833.5F7C74E6000@zero.eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/mem_helper.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index f88155ad45..361fd72226 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -271,12 +271,11 @@ void helper_stsw(CPUPPCState *env, target_ulong addr, uint32_t nb,
 }
 
 static void dcbz_common(CPUPPCState *env, target_ulong addr,
-                        uint32_t opcode, bool epid, uintptr_t retaddr)
+                        uint32_t opcode, int mmu_idx, uintptr_t retaddr)
 {
     target_ulong mask, dcbz_size = env->dcache_line_size;
     uint32_t i;
     void *haddr;
-    int mmu_idx = epid ? PPC_TLB_EPID_STORE : ppc_env_mmu_index(env, false);
 
 #if defined(TARGET_PPC64)
     /* Check for dcbz vs dcbzl on 970 */
@@ -309,12 +308,12 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
 
 void helper_dcbz(CPUPPCState *env, target_ulong addr, uint32_t opcode)
 {
-    dcbz_common(env, addr, opcode, false, GETPC());
+    dcbz_common(env, addr, opcode, ppc_env_mmu_index(env, false), GETPC());
 }
 
 void helper_dcbzep(CPUPPCState *env, target_ulong addr, uint32_t opcode)
 {
-    dcbz_common(env, addr, opcode, true, GETPC());
+    dcbz_common(env, addr, opcode, PPC_TLB_EPID_STORE, GETPC());
 }
 
 void helper_icbi(CPUPPCState *env, target_ulong addr)
-- 
2.43.0

