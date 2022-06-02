Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5223729lfh;
        Thu, 2 Jun 2022 15:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPbPhUPW7Cz/9As6y/W2RYjSGxx4H0d9M4D16vB3vmqqby3DQlRB7dmF/JPFuVW+x6V5a2
X-Received: by 2002:a05:620a:2804:b0:6a6:7743:35c5 with SMTP id f4-20020a05620a280400b006a6774335c5mr3802914qkp.552.1654210195874;
        Thu, 02 Jun 2022 15:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654210195; cv=none;
        d=google.com; s=arc-20160816;
        b=rrEv8XU2kDotAAhk4AHHDAtr1EgYXhNSOs6rcpeBeLgZO9pSmeT+ZOFvEMQ23uZL2R
         nqc3/pPbblGpZJkpIrKhcJGesMYSP2gsYdU0B1NBYzmu+lNLK3GTWDfHTtlvlRarZoRA
         H503H7CDOwOm7AUoxjBzqqpqWuo5/aPlqWxrBZWIhSG8JkeU4UvhxMgVuZLThy4p/fnT
         xP+t8LMXKLQ7ggvELJt4ZFEos/J0KtMl37SGmWTDZ/z9VGJ6ihExrqdubLs9VIQe9ZXO
         51sGb7WU7EnPwEcy59SOdYiqcB8/2nV++DTUpdsnJYZ8nlVtddDvSijvXj6ZnGiUYWF/
         xDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fTTanV00VRUEDDRlC72SOtxqE7eMJfPYW/wq+3NK8Kc=;
        b=IArhwfGi+SLJGbR7iGRqdGGsl/j/NapSTdGmeBoOOZOi/otIGP9JeBOOWY7ycgNTNr
         5upUb2ZxqLyN7uObltndi3kTnxDX9erjFgphZaKT2lwcbhLuXdvwbu24NleFBg9GdJBf
         4mn1x4Ck6zEfrWXWyWxzrnzs6hBfT+O/9J3dkkfSBIWLefvi7Ren2bDOKTIZZAvFp567
         cpIMzDXJQxqzOQMh7lmunijdtSSQkxcS+k9jbxyWZEZx4rWwA/L1KAiJmqTyIeYV9tj6
         MHy+rm9bVPbHzTWkKCOxuR2n/7+eyyNAwnaWZ0yWKxifw4C/yG9BiI1eSM9W/UhAzJqf
         wfmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rj3C6XmP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7-20020a37dc07000000b006a106586d8bsi2759554qki.608.2022.06.02.15.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rj3C6XmP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtdb-0006HW-Bp
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0001ie-25
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskL-0000xH-EJ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:52 -0400
Received: by mail-pl1-x635.google.com with SMTP id o6so454906plg.2
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fTTanV00VRUEDDRlC72SOtxqE7eMJfPYW/wq+3NK8Kc=;
 b=Rj3C6XmPE62VN/vOznNbclSEGFkL7frNTgm42UpAuyE2uOcpb3N9dRaqOkEinqVzGi
 bThh3XLxAapareQ83mUCt59uxKK7xYFpS+YErTymS+8+2zjE7OvDO4pL6wZvl1mDmv5E
 usqDjJKQ0uzaw53rqnRmMYN/4+oKCICooZhV9jb2JHuNmOOwYQFGi5iIi1VWM6d4c+gu
 0cRSu46fRcNWpl+AMW6tnnTHmeX3J46TPLMu30O62EEtIubUXDJjtIkcxmAzn2wYh0Pc
 PF/OvjmAUwVlINedJE5FqS6q0sgoqhWp1k/+Zwb9mHPm29OqqZXTRXURZkEgJwNiFXUp
 q1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fTTanV00VRUEDDRlC72SOtxqE7eMJfPYW/wq+3NK8Kc=;
 b=vLpKmj/9vgbu2AjiRO/e1NKTmaQbIPtmn9kTs0OzJMwkXGLmhSD6wUhpD1TZ8kSBLH
 NRZx5WJP2FWSHFtPDbvecypkplyoRr91A9b9a2e55Y+t3klcn9368RHe7nlCo4JXhYHF
 oOBGlpOC71KJGe7UmEQujMn47cOcMQ9f8SYORjp7dco2Woh2tGCUYd3PeaW3QugfLB3C
 +YBQs03XhXidZm183ZNfIEXdLPrWiL3dUOHhLEgiNkEqnDiRkZIAFAlC7MoahD3n1G0X
 d5q2tZXYXEoH4ebZjomxWV7XpLCtB/Yx3Yh7b/IdsAMN8+bZxExpUyx78DBTf9pvbjKv
 TMew==
X-Gm-Message-State: AOAM531z4QBH9qCVgW2OeqJ1bmw4tZMs8KpBwCsHVdczuXyD+E07e1DK
 Wu0lt2210LOzGJdCcRFRPbtSctDKex57gg==
X-Received: by 2002:a17:902:9a42:b0:158:bf91:ecec with SMTP id
 x2-20020a1709029a4200b00158bf91ececmr7023731plv.115.1654206767820; 
 Thu, 02 Jun 2022 14:52:47 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 61/71] linux-user/aarch64: Add SM bit to SVE signal context
Date: Thu,  2 Jun 2022 14:48:43 -0700
Message-Id: <20220602214853.496211-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lccKimkiNz7y

Make sure to zero the currently reserved fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 30e89f67c8..08a9746ace 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -78,7 +78,8 @@ struct target_extra_context {
 struct target_sve_context {
     struct target_aarch64_ctx head;
     uint16_t vl;
-    uint16_t reserved[3];
+    uint16_t flags;
+    uint16_t reserved[2];
     /* The actual SVE data immediately follows.  It is laid out
      * according to TARGET_SVE_SIG_{Z,P}REG_OFFSET, based off of
      * the original struct pointer.
@@ -101,6 +102,8 @@ struct target_sve_context {
 #define TARGET_SVE_SIG_CONTEXT_SIZE(VQ) \
     (TARGET_SVE_SIG_PREG_OFFSET(VQ, 17))
 
+#define TARGET_SVE_SIG_FLAG_SM  1
+
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
@@ -177,9 +180,13 @@ static void target_setup_sve_record(struct target_sve_context *sve,
 {
     int i, j;
 
+    memset(sve, 0, sizeof(*sve));
     __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
     __put_user(size, &sve->head.size);
     __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
+    if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        __put_user(TARGET_SVE_SIG_FLAG_SM, &sve->flags);
+    }
 
     /* Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian store
-- 
2.34.1

