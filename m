Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1745475lfg;
        Fri, 2 Apr 2021 14:42:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6jRg7K+FMBfCKbQhk+mTKVfWgBXNCg1ZcVYxNn94zqAkT9JTVH1logrI55E2M0qLdEZpm
X-Received: by 2002:a25:600a:: with SMTP id u10mr12559334ybb.392.1617399760479;
        Fri, 02 Apr 2021 14:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617399760; cv=none;
        d=google.com; s=arc-20160816;
        b=vENDut4kwGAd10EaESwrOPwahTMvv07VKMUTjy1FScwtgw0e6UJRq9Rcb1TSKqHQuG
         saFoYJGKnleHsIqsO8thAHl7pG6VBecxUL93WoSgbrEMlY9ctOJ3Y08WdSkhKifRy5+5
         Tn9yxFKiArE2GQnhAUNPoJyf9EuhKWUwMwTlFP5eRwEfxAvQG3GrkqR3ScXcTYpEnNVr
         t3JgtUg4Ot43P9uxZXQkfts5uWb0DUaquOl1ufoYYYwciFPwgx8mOaNuLuRY6m4Y140q
         Xey5fnduUf+Ou5vyMgONaVE54pYELjIqJ+agiwnF3zFC6dOrDfMFaiVlZTnA+Z8O3Un9
         pkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
        b=uKzBoAA5sKKVk8GPdSHsvIpPLEDicIE9QXDynRG7bx2JRobZd21YqRagwErPLDKu0h
         pr2KJVuBGJrhi60+J4iH3Gch6rHL4RjdNnTlS5ob5crDVimRgNakXY75OsETt2RtRk/t
         Y0npT3hJi15znaNOaFdVUtuHhNmefQr4+NIaC389Q8F1la7dQ3cVZjwFqto20cuyXfT+
         wnKr83LkbXpIHS4KU40pN5AzJ7XCAnUHQXTkowtUh6F35xkSWjYcE05BU2krkz2l6SEQ
         PJ38TL2ffSCXwOQeIUOPILw4KKef4OspzAiXSJHhedyG51rClPcCtAhiiChzcgXoctuQ
         LP5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hLAgx1JV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4si10646188ybm.220.2021.04.02.14.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 14:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hLAgx1JV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSRYt-0000F3-OV
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 17:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYf-0000D6-Rs
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:25 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYe-0007gF-8V
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso5122213pji.3
 for <qemu-arm@nongnu.org>; Fri, 02 Apr 2021 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=hLAgx1JVOhYAcJL9otyWbmwpWTmOyjSybBwxjW5y6nQJNKCYJEFEm4yPcTfRTdd8ch
 76w/7QBUQxbJLa/NbOAG4Lzq7UdeJ1yHFOCcAVANZx/IxUXx5p9m00yu5S1+LeqcvfT1
 LNzl+goP+LXE8QlqdjLnlbmh7f9lqnjm2HGwgxnB2CggfNamhp/UZ0lfJu+ixkiY3nfN
 qNWh2C6XfCJS5s4rtotaUIvKfaRpUigVs4xlZWAgxwV+U8TPjpGyh9CbWebluUfeQyTy
 dqBol5D/NhtnsIJL/BfK4KXYnsCKrexcK8MQAtKBPNOqjTiCGxXVk6EYWJFgm6TvN1fF
 Mnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=CyOYL/mVYsHy+cyWZJ3Mzzgl2c/DOPNpOBYpqn5/fZqsD7MKVzBePkXQy4/fnS7o27
 ijr4YRK+6kYKXqFZr72KAT4qMjrMVgqT3LVGGamIQ5CuMoBPlyOZBN9mfuHIC/i6SaIl
 2IEnpOIlmeh73n9Fs0l0zDdzhGTG8zpyuuIn1scSxa1Iwcq6pPExUbff3Cs52nQPmWcP
 1hmk5fwHAn//WWJLpH8F9LlMeBSl0jMHZUDKqwVVvt2GBi/CVvK0un+IQTeFkE9K6Pln
 uAMEROlP5xSulKCrBQ7Tjt29YKK0lf3Tu0ZAb7Dd0cPsIxF5swxd6htQ2zjb94fRq6FG
 htnA==
X-Gm-Message-State: AOAM530yjDyemyJqtmSu5PJeJk2wi9jDnsZ89NrW0x/PakjJhBZYVpoS
 8JutUvx1/N7PlVu6fj6f5+Zdfg==
X-Received: by 2002:a17:90a:1f49:: with SMTP id
 y9mr16122803pjy.69.1617399742926; 
 Fri, 02 Apr 2021 14:42:22 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/11] target/arm: Check PAGE_WRITE_ORG for MTE writeability
Date: Fri,  2 Apr 2021 14:42:08 -0700
Message-Id: <20210402214217.422585-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gOYxEe6KAfM+

We can remove PAGE_WRITE when (internally) marking a page
read-only because it contains translated code.

This can be triggered by tests/tcg/aarch64/bti-2, after
having serviced SIGILL trampolines on the stack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 0bbb9ec346..8be17e1b70 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -83,7 +83,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uint8_t *tags;
     uintptr_t index;
 
-    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
         /* SIGSEGV */
         arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
                          ptr_mmu_idx, false, ra);
-- 
2.25.1

