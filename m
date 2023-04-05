Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp460581ejb;
        Wed, 5 Apr 2023 08:36:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350bNVKLLDXsNTelWXcO6V+osB8ZGzyE6HNVd4FwuzEjhyNcpBM1j1vGN6aJNRPKjGNjKeWY7
X-Received: by 2002:a17:90b:4acc:b0:23b:35f6:4ee6 with SMTP id mh12-20020a17090b4acc00b0023b35f64ee6mr7357011pjb.3.1680709016796;
        Wed, 05 Apr 2023 08:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680709016; cv=none;
        d=google.com; s=arc-20160816;
        b=SyXNGZBdYjJikYqGdKmBmL1Mgg5ZgxNxnW5hdNdQkSD0Ffdvnv5bD3JPjY9Bvub1KX
         UhTqh/EE/lptyS82ZME2UOS1yj3M0sYaWrPETeo0Ifv7aqBtO6HoOYVWo8+SLbvrQoZf
         Xn3+GuNzVuznim37hbIQkyrzEmJVp4D80w4XZVe0qTT6UQY6jCXAVU1Ky4bz2TFjS1/R
         75hJYQj8pZ9sz6zbEsTn4/3itNM5DZsqCRfhN+uiM7fDE4sxKuJBUGF7ivyS2/a7juxF
         Wwzu2v2WUabNAR6weBqe6DCj2IemVCKcL3eUxcn9RODvpbeuT/O9RIMmwB2FCdaN1I17
         /O+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:to:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:from:dkim-signature;
        bh=OiXmf18XEU9NEb+9nguIMlwRxC8lm/HhIDPla+UcLec=;
        b=MUHPyVq7ylzpKioyHuGNQlZEl2w8UaF8g8IOlttUjt4k+m7v2vR/1QMdyRV8b8pTSq
         A1gR7JttfhHyvWRC1QL4D/RTinHExPpkYsYnc4i5sJ07I4ubtX/v8i+RB2JfXYO35lyz
         U7AYpv88eG6uIn5XhRYcCyb0EMNDmzRwbgW9qTrRCTD3VB2sNCqv5Y5bQk1isy+eVOd2
         SZX2BqosB6M9ylJvB4WL3fKfxGl1EzJ8EJwEiPbAzjvmXxlfHZnrlZoxjmX94tUESnvm
         QpZiOLl5YZI98Eup2bqKbia+bUWYzWAuLM285/t9xJJiZJLSPPTWzrtWV7FynOxoh++i
         5UzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=KziuYhk9;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id 130-20020a630688000000b0050bd79d02b5si12437097pgg.113.2023.04.05.08.36.56;
        Wed, 05 Apr 2023 08:36:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=KziuYhk9;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238539AbjDEPgz (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Wed, 5 Apr 2023 11:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbjDEPgy (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 5 Apr 2023 11:36:54 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3A319B
        for <kvm@vger.kernel.org>; Wed,  5 Apr 2023 08:36:53 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id x15so34352324pjk.2
        for <kvm@vger.kernel.org>; Wed, 05 Apr 2023 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680709012; x=1683301012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OiXmf18XEU9NEb+9nguIMlwRxC8lm/HhIDPla+UcLec=;
        b=KziuYhk9r/IO9vtcxQqoniTloqieE9v9yREFUBwIiAXDLM7TAVQKZzruGuUtFoMOOI
         BHzgaMjTJGnChl2NzfCCobziCq3yDaMwKwEokMgYIOOBvgQCqHxlyfFqY45T4jNUb39J
         SCapwAsNMlRAlVWwjQptIoL2K7ucVFX8vYF2EEwMEEtKw7wVWdfRXga4Ziq/K848X8+l
         vaWLKi/5HUSOGEyt/ipnfQuLgrc9tJEEC6wZsDFFayRT/kMu9VdvUmLc0gotwM8VNmPR
         cBMTRoIjBRqCaAlQ8MOtZDwPiJ3R4MWND8oOyOjhqYxFwE6ufHkrtH694A+ZSq/4frtd
         d3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709012; x=1683301012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiXmf18XEU9NEb+9nguIMlwRxC8lm/HhIDPla+UcLec=;
        b=LKKpZS97BMMeb0i98iGtuihGnoTpdS3hyqU5DS8e1RgjbWXjbWhrjodoFRa01Oh3vy
         ljx2C3p0Y5ywrm7sR4JsKmKeOAncvGkjZZPqz384uKPP1CBFh70eKsryNaoA3XUzVI4f
         GJOJhHzPs9ZHd4iqvoi7HNn04ixZDqjyHG4z17cPZ4MB0eWstllcwcuXx23zdATC3ibw
         rXVxlhUXlZZB9rTbkkjdt0nIdwO5XyF3h8qfcoSqslHxpyG7qfHTcx0RnO8PnXPzWkBP
         6N3QsKjiUY1Xo7O3lIlxhYuSTUngZjcoU3p+O+BBxPvTtPiR/az3vJb4DajHFND7xYxp
         rb2w==
X-Gm-Message-State: AAQBX9erzmv9ciODTykWkYSRr2To9At5Dg0ZQHOBd3qStTJkPP5yNB+S
        MDrXqfvnd1yoG25D5iaGk/7Pew==
X-Received: by 2002:a05:6a20:2db0:b0:d9:237e:9d0b with SMTP id bf48-20020a056a202db000b000d9237e9d0bmr5042944pzb.3.1680709012639;
        Wed, 05 Apr 2023 08:36:52 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
        by smtp.gmail.com with ESMTPSA id e15-20020a62ee0f000000b00594235980e4sm10801456pfi.181.2023.04.05.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:36:52 -0700 (PDT)
From:   Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Akihiko Odaki <akihiko.odaki@daynix.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] target/arm: Initialize debug capabilities only once
Date:   Thu,  6 Apr 2023 00:36:44 +0900
Message-Id: <20230405153644.25300-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: zVtluk+l585O

kvm_arm_init_debug() used to be called several times on a SMP system as
kvm_arch_init_vcpu() calls it. Move the call to kvm_arch_init() to make
sure it will be called only once; otherwise it will overwrite pointers
to memory allocated with the previous call and leak it.

Fixes: e4482ab7e3 ("target-arm: kvm - add support for HW assisted debug")
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Supersedes: <20230405070244.23464-1-akihiko.odaki@daynix.com>
("[PATCH] target/arm: Check if debug is already initialized")

 target/arm/kvm.c     |  2 ++
 target/arm/kvm64.c   | 18 ++++--------------
 target/arm/kvm_arm.h |  8 ++++++++
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f022c644d2..84da49332c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -280,6 +280,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    kvm_arm_init_debug(s);
+
     return ret;
 }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..810db33ccb 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -74,24 +74,16 @@ GArray *hw_breakpoints, *hw_watchpoints;
 #define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
 #define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
 
-/**
- * kvm_arm_init_debug() - check for guest debug capabilities
- * @cs: CPUState
- *
- * kvm_check_extension returns the number of debug registers we have
- * or 0 if we have none.
- *
- */
-static void kvm_arm_init_debug(CPUState *cs)
+void kvm_arm_init_debug(KVMState *s)
 {
-    have_guest_debug = kvm_check_extension(cs->kvm_state,
+    have_guest_debug = kvm_check_extension(s,
                                            KVM_CAP_SET_GUEST_DEBUG);
 
-    max_hw_wps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_WPS);
+    max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
     hw_watchpoints = g_array_sized_new(true, true,
                                        sizeof(HWWatchpoint), max_hw_wps);
 
-    max_hw_bps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_BPS);
+    max_hw_bps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
     return;
@@ -920,8 +912,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
     cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
 
-    kvm_arm_init_debug(cs);
-
     /* Check whether user space can specify guest syndrome value */
     kvm_arm_init_serror_injection(cs);
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..330fbe5c72 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -18,6 +18,14 @@
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
 
+/**
+ * kvm_arm_init_debug() - initialize guest debug capabilities
+ * @s: KVMState
+ *
+ * Should be called only once before using guest debug capabilities.
+ */
+void kvm_arm_init_debug(KVMState *s);
+
 /**
  * kvm_arm_vcpu_init:
  * @cs: CPUState
-- 
2.40.0
