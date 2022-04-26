Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp357319lfu;
        Tue, 26 Apr 2022 09:33:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrt57C8ZnOmuDMC++McHg0vSmCiQSl7UBVN6kIzZmvY2/ai/BmWpRqC3k+ZeDm2HteHd/k
X-Received: by 2002:a05:6902:1202:b0:641:e3e1:8e2f with SMTP id s2-20020a056902120200b00641e3e18e2fmr21785594ybu.597.1650990801702;
        Tue, 26 Apr 2022 09:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650990801; cv=none;
        d=google.com; s=arc-20160816;
        b=yoeYKMcEnAkzDpdT7wOuBXLZeUEjGGsUINX12urG7jpH9ckgyDUNvXRZD/drpMxb+M
         z/Q+5UiJ1blYZYh3NHarH9EtPInZYXotPKJ+bCpLn8jFscHoPp3BuvCQNrIMfwuOiHws
         dMILpJ5RLuh0n8tezN9zagPpnq1ZObZMUOf7tvsdXJsLiaTn794CkihwBpwPME9LMx0Y
         63EnKnzXq5O/9JaWF5gPjFEV/jiEh5nUP4LNk6ayo/qYHHSriAnwNB+d0tmVrZBp8y1M
         ioK5UXIdESoRO4X4XhDYnRXIoT5f9jo5kd+IBG994BaIaifY5PXB2wfkDIfrtRmE4htP
         sFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IaB7fhzMyy2+IqbDxRpXo2ZA5fKxHogw6KAk6LVPn8c=;
        b=Gm9caRnc3RoS3qS9bLFdu/+iO8AqNnl7VDEhjGqyFd+wEBMqy9wO43Y4kzDrF75shl
         gbjzAkucqKVPOpPIzYrsrpn17nTtHV2l5BDtoxLQVZNRDi3ai3dc+DN+PmiGcQ5y8cap
         RA4URGTSH/rJNPC2wkh1shw+tEeEGaXzc9H35Jc89RjbReOS/YbmZJVzbY8v4rGnvzE8
         qqSNqTAMNUX1uyvDROvdk+uwOU70HVYx48mZVFy4RJL5mUCW94JnWhvqS6/q3+4Ca1vB
         w+ReOKLWITRTs1Q7gjo4bnbgDPyun1Ba5pLz/J9k0vBbY+QJbZYLb9IdIKiWZQmzHOhs
         Ue2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3graDJf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n78-20020a254051000000b0064586781c31si11959127yba.413.2022.04.26.09.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3graDJf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njO7t-0006JB-3L
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5U-0002vW-9c
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:56 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5Q-0003lF-49
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:49 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j17so18442209pfi.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IaB7fhzMyy2+IqbDxRpXo2ZA5fKxHogw6KAk6LVPn8c=;
 b=i3graDJfIREqFUYkftKwnhLy2jnE1kl0ib8UbRAgwNs/Vk6wLFQtP+JvjC12/pYWDJ
 8dSIDsHTdB2ze9ATUJQVS6xEGD8HPiuDQDkvXu6h4QfeW+Whf1dDM4uCVBZ41MF4czdI
 xMxuBhMqIb9VUjxFm8llU/G1DKVICnO85hiIupMfMLAsoFPxc6kyNZzIv70kadzER+UD
 m1tRxSggVNL80uCPAJWdgJXlVcTBb5yZngwCDqdcWqUcQErOu97GlCYSCWbQfFQ0YgzG
 sC/ldIOsND70468khiRJ/xuq4sTDAC4dhPLID+RWKPZUotk1BSfcryh3VvyLhYzU+Vki
 j6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IaB7fhzMyy2+IqbDxRpXo2ZA5fKxHogw6KAk6LVPn8c=;
 b=frJNW6t/oY2dj/VNye2sGSugpy7iagicK/xVxPxrX8UXGYNwtRzG/qwbTRmqYC6d9E
 X5VqdwFrYd34aY28PwX8CBWcuAH2TkPiRaG67BKf/pEGEYz+H7wVi5yaQ1L+6BNH8YoT
 bfhyr0Xrt4aiSrNe3JIj+hfjHeIEA4Pk9UP9B3YaLWo+puxqcEbo3Uc80iUl/mx5tWDr
 Id00UG055XoZ5fv2RCpZwAsg9iXhA6hvOR9t5GUPuygwV8sqe7cfvO4of7zSlaRSgm6V
 /b2tR/jFELn5vAkN9sd7aV5gM9i81a4a9rA1JbQazXKz0YJJLBo22J7gMtnawSz3ycR6
 9uoQ==
X-Gm-Message-State: AOAM531IaaSO7JXlQ1eaFMTGp9o9qtLlV4gbuYMlP9Dc9e/PTnItIIX9
 BuktpPSALs5o9qqg1XhygLXcTq/qfyEtKw==
X-Received: by 2002:aa7:8e44:0:b0:50c:fc0e:8d25 with SMTP id
 d4-20020aa78e44000000b0050cfc0e8d25mr20068157pfr.81.1650990646223; 
 Tue, 26 Apr 2022 09:30:46 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/47] target/arm: Use tcg_constant in gen_probe_access
Date: Tue, 26 Apr 2022 09:29:57 -0700
Message-Id: <20220426163043.100432-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wxSxWjEI3vBE

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index adbcd99941..c6ab0433af 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -240,14 +240,10 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
 static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
                              MMUAccessType acc, int log2_size)
 {
-    TCGv_i32 t_acc = tcg_const_i32(acc);
-    TCGv_i32 t_idx = tcg_const_i32(get_mem_index(s));
-    TCGv_i32 t_size = tcg_const_i32(1 << log2_size);
-
-    gen_helper_probe_access(cpu_env, ptr, t_acc, t_idx, t_size);
-    tcg_temp_free_i32(t_acc);
-    tcg_temp_free_i32(t_idx);
-    tcg_temp_free_i32(t_size);
+    gen_helper_probe_access(cpu_env, ptr,
+                            tcg_constant_i32(acc),
+                            tcg_constant_i32(get_mem_index(s)),
+                            tcg_constant_i32(1 << log2_size));
 }
 
 /*
-- 
2.34.1

