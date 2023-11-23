Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp150020ejj;
        Wed, 22 Nov 2023 20:44:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEH7sb/UDM3UjMRyLvis3aSSYQvJPw+yToIdasYEFktuV609VJp09z/hqS3PEvPrH31TmK
X-Received: by 2002:a05:622a:650:b0:41c:dbd9:ad3e with SMTP id a16-20020a05622a065000b0041cdbd9ad3emr5046747qtb.57.1700714666561;
        Wed, 22 Nov 2023 20:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714666; cv=none;
        d=google.com; s=arc-20160816;
        b=djNDqYSUOvZmupwioqX//rZ71TqHljuIfrI+DnnXBE0a+7f7fKiFiiMzqm0oHLlbdl
         HJp3NZRoK4jq6+ifFuB6JimcKjtnW4T4fHSNFwD21/XHX6tGtsMeJfcoTSRMk61A0rLo
         Hcs21bebMnXypnOevKtrVzOPaz2aCu9exF1LdV7KOcvWNqWIJxBUbyu3LEQVT+Av4+uu
         B9LHY0zEgC+NlBauXFA/9xQPO/oe5fFhCzW1hf1COPn9amI/TCjZuOxkkP5spDW50+gB
         YMKS+X6Qn+MWp+2blzvMk8NTT7JDW2kdJeVFW3UbIaPaAd8MUlnzZb82mNSKDv13LmqA
         /Awg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j7rKkgtczML1NQeakIsfiyCwMRWbdPg9sIsXXpiAu1I=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=w+tl1w0jNkl6IwMJNN2qzNJt0R9P0AJmu5+Now3SqjXx6fJ8gRxPrSJUaAJ6WHvQap
         x8nDTIPnGGq3zxmhr173eQBhM3HtMAnTIYF4u4MzVexifj9JH82AoG8T65g5LDkn6lJv
         pN7XqQkcshY5bohKTD53/mW5ZA/A+ACvMgkp++q1gYU8f2iKByYkB6/PdvP9BNuUbfSm
         rCuFKIdlG1ZQfT5QPOFRVVnyg45aAhAOVHO+6lQLMrPt45es1BMqAKl+B7T0IR8MnboA
         7ltWj2vq5LDrfsSODyJZFzTBv1njxTVkuSYnYyvzEYzqTF5nK4bceNR7BymlVzI4XbiX
         p0bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JzqWrOQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2-20020a05620a0b4200b007759f944c0fsi392234qkg.156.2023.11.22.20.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JzqWrOQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61Y4-0006Ox-KV; Wed, 22 Nov 2023 23:42:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xr-0006LY-1L
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:31 -0500
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xo-00065o-0N
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:30 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-586753b0ab0so280556eaf.0
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714546; x=1701319346; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7rKkgtczML1NQeakIsfiyCwMRWbdPg9sIsXXpiAu1I=;
 b=JzqWrOQuRz/RP8kncI5n7BjiX+ETLw7ampPShW0MlwkWZ2pvHiqcTjbd7oVNZQLexu
 UM5mIN4M6TdjXzXF4X0Uy1qYH6deAYLMhssdlM8VH930E1W8fJcHMk15AjyjIAcy0n+4
 M9l6a2AM8JCG26hte7iUD1vsOIYrSY9hDRA0VR/YxpT5VgMCk01M5sezzW8k9ot8GHIl
 G6tOTn/WsceUXR8nVr13KxAbQG3QKsturgPAR1rbmYhJgrH02V8aZTT8jlHn/Hr2p7r8
 r3suwswTb0ESk4xVzOy+kaSt/cHfgvKLfXDYLulesAkILo7YpfRYgU4GIa+j+0M49Q4B
 DxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714546; x=1701319346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7rKkgtczML1NQeakIsfiyCwMRWbdPg9sIsXXpiAu1I=;
 b=wLRFDEc5e3PfShnkltAJTZlr/wT1kMrZ6K6qjKFiM/NVYGXjK/ZbGPWF2yY4bl/klG
 XmfkC0+EiLXmXW0KTx/FP364sazQX9TgNwl5oZqCLEgF7wdXc1xKFqhFMbr4EOQfycYY
 OWFHda84xfKjaccGr3MbvWGCIoJ/i4UHmaPXA1/zLjf4Um8ZKMCQzGzj0PVG5ZG5OgJr
 m5WnZOa3TnA8VkdXYc0CRDzTgTyRNFVX96QxnUKtfypg3OSgEiAf7fweqGmRibXJgKph
 mLdKHzEcnebLZHAZIGrfjckToO9irt8yZaa4/OMOVXjWphKunh52oEs4f9CUPl3eNIjP
 kACg==
X-Gm-Message-State: AOJu0YyzejN3DJlv+cs+rBG7WwhEdKSWfGvjBteRU7xrvyTw0VN6Nb5F
 rBDcxjBQ+04hGLr2rcY2OX5IG67x/FslpTdz4Cqvvjwy
X-Received: by 2002:a05:6870:44d2:b0:1f5:ef2a:9dee with SMTP id
 t18-20020a05687044d200b001f5ef2a9deemr6246529oai.37.1700714546373; 
 Wed, 22 Nov 2023 20:42:26 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/21] target/arm/kvm: Move kvm_arm_copy_hw_debug_data and
 unexport
Date: Wed, 22 Nov 2023 22:42:03 -0600
Message-Id: <20231123044219.896776-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BFfI42MKAkQy

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 10 ----------
 target/arm/kvm.c     | 24 ++++++++++++++++++++++++
 target/arm/kvm64.c   | 17 -----------------
 3 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index bb284a47de..207b7f21b0 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -462,14 +462,4 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit);
  */
 bool kvm_arm_hw_debug_active(CPUState *cs);
 
-/**
- * kvm_arm_copy_hw_debug_data:
- * @ptr: kvm_guest_debug_arch structure
- *
- * Copy the architecture specific debug registers into the
- * kvm_guest_debug ioctl structure.
- */
-struct kvm_guest_debug_arch;
-void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr);
-
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 696bc63e86..2898e680fc 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1021,6 +1021,30 @@ int kvm_arch_process_async_events(CPUState *cs)
     return 0;
 }
 
+/**
+ * kvm_arm_copy_hw_debug_data:
+ * @ptr: kvm_guest_debug_arch structure
+ *
+ * Copy the architecture specific debug registers into the
+ * kvm_guest_debug ioctl structure.
+ */
+static void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr)
+{
+    int i;
+    memset(ptr, 0, sizeof(struct kvm_guest_debug_arch));
+
+    for (i = 0; i < max_hw_wps; i++) {
+        HWWatchpoint *wp = get_hw_wp(i);
+        ptr->dbg_wcr[i] = wp->wcr;
+        ptr->dbg_wvr[i] = wp->wvr;
+    }
+    for (i = 0; i < max_hw_bps; i++) {
+        HWBreakpoint *bp = get_hw_bp(i);
+        ptr->dbg_bcr[i] = bp->bcr;
+        ptr->dbg_bvr[i] = bp->bvr;
+    }
+}
+
 void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *dbg)
 {
     if (kvm_sw_breakpoints_active(cs)) {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 7d937e2539..ac3120adaf 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -73,23 +73,6 @@ void kvm_arch_remove_all_hw_breakpoints(void)
     }
 }
 
-void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr)
-{
-    int i;
-    memset(ptr, 0, sizeof(struct kvm_guest_debug_arch));
-
-    for (i = 0; i < max_hw_wps; i++) {
-        HWWatchpoint *wp = get_hw_wp(i);
-        ptr->dbg_wcr[i] = wp->wcr;
-        ptr->dbg_wvr[i] = wp->wvr;
-    }
-    for (i = 0; i < max_hw_bps; i++) {
-        HWBreakpoint *bp = get_hw_bp(i);
-        ptr->dbg_bcr[i] = bp->bcr;
-        ptr->dbg_bvr[i] = bp->bvr;
-    }
-}
-
 bool kvm_arm_hw_debug_active(CPUState *cs)
 {
     return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
-- 
2.34.1

