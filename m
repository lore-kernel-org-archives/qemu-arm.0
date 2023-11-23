Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp149458ejj;
        Wed, 22 Nov 2023 20:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENsRg3Q6BGXoIIMvFcxYWXkqAnJeTiFlKbFWzrPlmBNSuRAbRf6LduYqztvKDZtQZsvWUh
X-Received: by 2002:a05:6214:262e:b0:679:f711:fdf1 with SMTP id gv14-20020a056214262e00b00679f711fdf1mr4868861qvb.43.1700714555426;
        Wed, 22 Nov 2023 20:42:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714555; cv=none;
        d=google.com; s=arc-20160816;
        b=RQFLL2DAPZnDmoSSzUoUA38lDGW17KkQE9tXnHVxIWzj6eCSWfQYzsUNMBg4L3DrX1
         9ZLNbj0qpcv3154Yy+LDiM7+UxRzNsVZsc7qGt2S6vkA9cRfdqeWDK8LXNVIw5T6TdUP
         /6o46OfmsuhOI6a30pJawTR8pBgq+2/bMP4/OIa0Zx5udCxFY8fmUeseUdqpJHnkQkKH
         BPwOyjAm6MYfU0+WJ16yr/k3DpFu8JDZuKWEGyVGqN9sVOZhjLQIJqDzQMefZSzXCP7r
         2Q74fFFEmwrU7eBvUOR4DnrEmsZZ1u2NTYU6twMHgC45bLhhCcm5eqKszASKsNU6Bkya
         b+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NH7qrfCWzzImD63ZDY8zW+pyuXHpfd4KHpoGwFQ2aTE=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=ldIlWxlv27CttXSJhHbJ36vRc8gkzfKZyPgC9dLs6kw8u6iGXjLaW+KfgQJ/6M/1iN
         0PoWoqkUfojIzVJ69y0Gm3NesAftI/KFf4Ttxny/sPcElG7LkIKzwg+D16/9XDUaDBt/
         /U7ZYfIdT0aRH8eymC5nH13jihSBKvGRUPp6EnTfBqaz3YOSobg1G27lsbBYvnzMUJTy
         CDhSJkVjmsE7GfCEr0KuoH/38K5VlaTDKBSp6Lsv8tRttfMbr/yI9ndE6d76UdKnBYXT
         DlaTg7TnfOKp3pVi8Em5WCVMNoUzUnSbQUQ7ebeKRiYAyK0fvmPUQ8XRAC2tu4z96H9k
         SH/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C0mXLp+N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020a0ceb49000000b00668da56152csi419964qvq.506.2023.11.22.20.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:42:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C0mXLp+N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61Xo-0006L6-Vn; Wed, 22 Nov 2023 23:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xo-0006Kg-3W
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:28 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xl-00065B-Rq
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:27 -0500
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3b83398cfc7so326986b6e.3
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714544; x=1701319344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NH7qrfCWzzImD63ZDY8zW+pyuXHpfd4KHpoGwFQ2aTE=;
 b=C0mXLp+N/ir6oZPnPJOaQfni1Zcm5hcyzOGL4m7gq9l9pKRUiPwhE8gOpuHGk+INUX
 P2MlfbxFRo9nEP6uAt2TV/fHKigm0i4EN4PId3sXV4GtYHoeI3XwlJNU/hQs96vhbaW5
 IRE0ApQZcr8uQQ+C6Gnec0X/CS1CS87MexdHDHQTHAel5IFHTZcE5U73Y9se6YFA6/m+
 JzhfJi/wQjxVOBx3hDtobhQ2EktSJk7XPkFziaXb6i+iZfx9xPkV9NLPRP/Wa//g550w
 JGtt/f38da+RAlFAL9OvUh94MPzN63pAot+n0ouSEFCbe0AA/qjgxf0Zx1yS4nFDmFLE
 /6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714544; x=1701319344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NH7qrfCWzzImD63ZDY8zW+pyuXHpfd4KHpoGwFQ2aTE=;
 b=WHZMpQhUV6BpkvXCnjahQ9n4Bn2vypPa74cJSPRlxWwqj4oEP8lXANSnUMNv/73/Qz
 TRT1yf93CYYV+jfW9GAixqOoPTEx1aOzXYtSzPaFi36lfSSATf18uLQ0XLeMVkwc6PxL
 RLTG4znEu0y0uAhQsFIv/L46j7VArCitK+dvYKIhiOEuqPEl6M7Xel1f6WK67DqAi/Lf
 Tx8v85Sjv1cpmk4yFku+tJO1gYqg1qoCfI+ot+U8msMAg0VKORgQnZaCM0wE9u7WxKly
 pGrcBBu7hTnqYUzLmfBC4Pio+uazsynKYZRsOFEyTMxaFpapW9othxfWNa+dnrQfPbug
 yDnA==
X-Gm-Message-State: AOJu0YyXqB1vvWvQks0W7kunvWUlCLEoDtxAYQtNwynUm7JA8VK4gMli
 /zYXzU/eAMD+v1K6sV1SgOJArz3nMXnZu4nd7w23chTE
X-Received: by 2002:a05:6808:2392:b0:3a7:37ae:4a47 with SMTP id
 bp18-20020a056808239200b003a737ae4a47mr5852535oib.12.1700714544330; 
 Wed, 22 Nov 2023 20:42:24 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/21] target/arm/kvm: Merge kvm_arm_init_debug into
 kvm_arch_init
Date: Wed, 22 Nov 2023 22:42:01 -0600
Message-Id: <20231123044219.896776-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
X-TUID: mYPZDZ1vFe/x

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h |  8 --------
 target/arm/kvm.c     |  8 +++++++-
 target/arm/kvm64.c   | 12 ------------
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 051a0da41c..fe6d824a52 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -18,14 +18,6 @@
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
 
-/**
- * kvm_arm_init_debug() - initialize guest debug capabilities
- * @s: KVMState
- *
- * Should be called only once before using guest debug capabilities.
- */
-void kvm_arm_init_debug(KVMState *s);
-
 /**
  * kvm_arm_vcpu_init:
  * @cs: CPUState
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7903e2ddde..b4836da6b2 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -308,7 +308,13 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
-    kvm_arm_init_debug(s);
+    max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
+    hw_watchpoints = g_array_sized_new(true, true,
+                                       sizeof(HWWatchpoint), max_hw_wps);
+
+    max_hw_bps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
+    hw_breakpoints = g_array_sized_new(true, true,
+                                       sizeof(HWBreakpoint), max_hw_bps);
 
     return ret;
 }
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index b8bb25a1ea..40f459b786 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -33,18 +33,6 @@
 #include "hw/acpi/ghes.h"
 
 
-void kvm_arm_init_debug(KVMState *s)
-{
-    max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
-    hw_watchpoints = g_array_sized_new(true, true,
-                                       sizeof(HWWatchpoint), max_hw_wps);
-
-    max_hw_bps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
-    hw_breakpoints = g_array_sized_new(true, true,
-                                       sizeof(HWBreakpoint), max_hw_bps);
-    return;
-}
-
 int kvm_arch_insert_hw_breakpoint(vaddr addr, vaddr len, int type)
 {
     switch (type) {
-- 
2.34.1

