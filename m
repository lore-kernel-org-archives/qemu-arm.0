Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp507829lfo;
        Wed, 3 Feb 2021 11:41:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5S0Wf1zd0LqNZnCNSWOtw3qZQ76atAg5PHGItTQTZYyjOlgFYajjWxO2gfYAhuiEifXIx
X-Received: by 2002:a25:cc89:: with SMTP id l131mr6718363ybf.346.1612381317565;
        Wed, 03 Feb 2021 11:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612381317; cv=none;
        d=google.com; s=arc-20160816;
        b=icWhy54QBgVzO8OLHGPZxjCdnRSsiRaqIlyXhMvXByT+tMrNb1CNWxVRai1Y2n794x
         JU4OEqBJIXf6SisdEwzQmw827ihLHxdEYDYcAkWjuxxp4yNrI+mauu/tSjJbg223WXF7
         ZT8eQYwyBiS+piuNtk+XZ8pH/inrQnt0X+V6ru+gfEM57H0CkORejW5nRytrCK8hNCNE
         e/iq/DcFBdlP9Imoyqb2IJTviKuvGPlGwTkS+uwHBOpvFr4XW/ya1+ikWtJLKmOP4BpY
         ycEMpUYVZGgB4/CAaUVOsxFAIv9AUMHLrvm+9pPzQTMpSDg9dri1w3kJFAfYp2PGH9V/
         qBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EwcrKH1NrGFZArzgiK/QBy4uHtN2oVX1PxAv1FeIOOw=;
        b=MFMtVdkRATpqJ32OXVSzTflBPDl6znIp/RV3SOWSWaF8891mosnXceflZLoHuyPmmx
         Q1gBREdbLd0Kqh0ERey7kS6P2hb+LwN9sIH1IPra/Ub1QBb5kKYODaqAFol/EucKzrK1
         VUkokXyBWu9/S1+Km9CFLXeEj8Fzsb8a3mFb3bf+4QpQ/456hl2o10x/ChkyVkB4sgR1
         gtoX8NZ9t/kjDHSfgkqiXFv+6nWvyjfGRB8uhq3ZM8zzp61IObvSnx4vSmD/RrA0W/zM
         9hYTAXtrae8QcMQZG59Uv6xQcLz5Q820zkK8DnS4Ix/bwnO/RwVu4Wy5z6vP5IRDgFD6
         OB0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KGxnUJ9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13si2894788ybh.229.2021.02.03.11.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KGxnUJ9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7O2G-0000dP-VA
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOz-0007b8-8a
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:21 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001ph-He
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:20 -0500
Received: by mail-pf1-x432.google.com with SMTP id q131so410406pfq.10
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EwcrKH1NrGFZArzgiK/QBy4uHtN2oVX1PxAv1FeIOOw=;
 b=KGxnUJ9qDsrFTKjk25EcVGJVMOzNbvgfGFRnhNksKCNKzfP5n1ZcHlfOs+onsCkE0L
 5LblwcCxDCMqhe80Rw6nm/MPkAs/cK5uO0iMYYKjh3nfly3MPmUWkSZ5tHnKBgHBVqMk
 Bt9T2VExF9ZC4sqdL/P1kIME/764hsiFKool2hciqRS9Cg+rW1MZFtRI603Q4C893DlV
 g/CoNCR2idriTiyWabyPH5jEhOJtNFXf7Na2GhEGee89t+jvN46J5/I+y4SoZQg0gbUW
 1htMXB0g3fASjSNShqpS4aJFCgZWLoIFrtos4MMdF5JdV2cBjCRcRERCY3LbTLKFfOMP
 rflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EwcrKH1NrGFZArzgiK/QBy4uHtN2oVX1PxAv1FeIOOw=;
 b=Srn266y+qkl+xcSrNRgoIRBJYGBAPS5cf74xsnyn6sRfaPvU2heP4/I5ncBg3mxA47
 B9sqa5ty7f+PHcdVqGdXgT8szHTseP+aqb8PmkTDSiVzkL851QrtuQ5NN9CgovkVS9FN
 ca9ozebNUXYegZVwBfCfYwA/9mKon4532MwBDjlPSxUeEBO0oEcjTcnv6ARp6Cc2wfak
 i9rIt9JnzsQoR55qjBEcW6iaR8/6P7t/a4IwXwAanIuY/ISzuXMj+0zd3Ts67/CIdQbG
 MhP5rFmRnjqFfcy7SH6PjBB1cnBY1RepID+wGuqMnUSheGK+vtuaWZFFYV+q00yS9gnY
 okWQ==
X-Gm-Message-State: AOAM533WIvcH1Zx1rvoLRRc3WReJe+IdvVAhQ9Rd9MjxDUkCKVOOF7vH
 pagZ8PfQVhcL04T6imzq4ORnDw==
X-Received: by 2002:aa7:9585:0:b029:1c5:10ce:ba7f with SMTP id
 z5-20020aa795850000b02901c510ceba7fmr4354677pfj.79.1612378869073; 
 Wed, 03 Feb 2021 11:01:09 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/31] linux-user/aarch64: Signal SEGV_MTESERR for sync tag
 check fault
Date: Wed,  3 Feb 2021 09:00:06 -1000
Message-Id: <20210203190010.759771-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nKcuE2c5SiEr

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h | 2 ++
 linux-user/aarch64/cpu_loop.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index ddd73169f0..777fb667fe 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,5 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
+
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 4e43906e66..b6a2e65593 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -134,6 +134,9 @@ void cpu_loop(CPUARMState *env)
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
                 info.si_code = TARGET_SEGV_ACCERR;
                 break;
+            case 0x11: /* Synchronous Tag Check Fault */
+                info.si_code = TARGET_SEGV_MTESERR;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.25.1

