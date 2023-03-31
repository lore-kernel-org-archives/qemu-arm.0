Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp690135ejb;
        Fri, 31 Mar 2023 07:51:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350ba8v90cYr/aRmCc+Mzuf7FMjQgzOsMxrUJuceSdq5/60hpYglxXjvz5DcgmO/ZE3YB+J/x
X-Received: by 2002:a05:622a:1a12:b0:3bf:c423:c384 with SMTP id f18-20020a05622a1a1200b003bfc423c384mr16925830qtb.15.1680274277411;
        Fri, 31 Mar 2023 07:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680274277; cv=none;
        d=google.com; s=arc-20160816;
        b=Ebaffu51tv+2QfAJbksdTx3QYHSC49eBVKU87vB2yDIEbBWYQReq5P542aeM0rgx3Q
         IAauwh4s2r/xoXE1pRJLZ8YiylafJuLsW9LJid/O5/N12lckKKBjKUlmKhW8axV01PQc
         l1O42Oo6wfp3l+cbi+Z9TgtMi6iDnhXdjE7GMG1NB/Hfi40yjZiHdmxahovMt68o4yFV
         W05di/G2C2d0Ac/75nETrgweVBaO5GbfHC1uq4Q0tREkbo3Mym06BC3bc7tYJ3ROZsst
         n6TLmKyemH7ZbqDxtA6z1FinzHelfYYNBKtWIeQNmqUBOV8he1PTC/NFGCYG2qyrIg7z
         r0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lxHwKmEkcI9a9cB3NtBeKtlKzdxzWz/JBHE/okIH9Ik=;
        b=cwGjcnHlP7G0SnkLMGTzRzav4uK4GiFRafZEiLkh3ZwZ5m/YWPjKr76PxdAn/bGXEx
         /NoyJbP9tIxA+5SjYJiLiKLfZ95fXafEodGIFWxGmSNLpjHUYPGB5UVoZJkjo4dRMAZK
         MWWqfSr1lhDIfeRThsOkWHp7yiPxdLgoErycGrdB/zhx0m1+QWu51umma98oP4qc2VsT
         9iHKbL5pZtAi9Yc5HBh8b1dphRdhp5/lMpdmxM1SSaSHfund1L5zqpA3zJtL1GxTtydc
         qvOE+ZrhffnXI7oqi4+SfiqvW3COrD6vb5ryzJ9C593GRCqn9VuWNVOi40s3TtYPolR2
         2QnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VoCODkxF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de13-20020a05620a370d00b00746aa74f17bsi1668967qkb.743.2023.03.31.07.51.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 07:51:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VoCODkxF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piG5e-0000ai-Rg; Fri, 31 Mar 2023 10:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5c-0000ZJ-A9
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 10:50:52 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5Y-0000bX-Tx
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 10:50:51 -0400
Received: by mail-wr1-x431.google.com with SMTP id d17so22675268wrb.11
 for <qemu-arm@nongnu.org>; Fri, 31 Mar 2023 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lxHwKmEkcI9a9cB3NtBeKtlKzdxzWz/JBHE/okIH9Ik=;
 b=VoCODkxFyuo15LAlwYAAEIujOQypvws9LzQ2YyxyCutoHMnGkjwW7WukAvKVuIeL81
 KYt0nZ+zHQu4HjpBLVrvv1hjxlgmg/1aJnCnbZeqp6ML27C7arO/r6g9+bCJNKsYQe8k
 /RtIy0JKxhGjwSjB8uotvSWRRLmj7Enn0kZwhZMGxEWCjKS9msNuuA8CRh8LfZzk5TJH
 rbwrqGhcw4ENHtJR3htctdyEzcFtycj9/zY+GPkKqpKCHxwILgHq0ua+LvzNkEIIvBT5
 OiHAZeTH295TgYZaw8g8iAoopVmYZnDxaKRWbgyNs4g8lj05ELLAerOFyqaTj1S6iyUF
 ywgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxHwKmEkcI9a9cB3NtBeKtlKzdxzWz/JBHE/okIH9Ik=;
 b=uO3dfxhIjbXDqH++9rt+rY2YPp1Mpv1R3hKKxNsUN1M9Ihn9Wd+x/ElwV4UjBzmmDH
 YGgCjlOi8zJHYZQZ9E2h0UWMUwnWUsbxe3+LMZ+jzXB1l9pMMCdWgHg9biBu/DOUNdZM
 j2QNRWGfIAmzVQZpQyBxltnJcpK7x5Ss/dEEkWHMWKaCMOXwU8GKjr2TchdqtVBbUI56
 Q5EQqUfLl+toC17SmjSChGpab0Sp57C8gWyhVy9tj2n3Td4M5kaDVis93lCWS4OfCMec
 nDju8CR7RaoPAvUDaeAeYoZ5VykOPyxQCa13mwBDYbEezhdKhqRHY+6WPvVJVy21QWde
 tWCQ==
X-Gm-Message-State: AAQBX9fj/GFRbOocfP5VdnP1zZ6nH2Z4vilInjiSZpE2FI4FaUGJoa0w
 eW37KqVrPr1frJ1Frp91eR83FYnCWGtldKriQ7k=
X-Received: by 2002:a5d:62cd:0:b0:2e4:f53a:45a1 with SMTP id
 o13-20020a5d62cd000000b002e4f53a45a1mr3982609wrv.57.1680274247270; 
 Fri, 31 Mar 2023 07:50:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b002cfe685bfd6sm2339831wrv.108.2023.03.31.07.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:50:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Pass ARMMMUFaultInfo to merge_syn_data_abort()
Date: Fri, 31 Mar 2023 15:50:43 +0100
Message-Id: <20230331145045.2584941-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331145045.2584941-1-peter.maydell@linaro.org>
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: IDLQtBuk4+Ve

We already pass merge_syn_data_abort() two fields from the
ARMMMUFaultInfo struct, and we're about to want to use a third field.
Refactor to just pass a pointer to the fault info.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 31eb77f7df9..1a61adb8a68 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -24,9 +24,9 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
 }
 
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
+                                            ARMMMUFaultInfo *fi,
                                             unsigned int target_el,
-                                            bool same_el, bool ea,
-                                            bool s1ptw, bool is_write,
+                                            bool same_el, bool is_write,
                                             int fsc)
 {
     uint32_t syn;
@@ -43,9 +43,9 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
      * ISS encoding for an exception from a Data Abort, the
      * ISV field.
      */
-    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
+    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || fi->s1ptw) {
         syn = syn_data_abort_no_iss(same_el, 0,
-                                    ea, 0, s1ptw, is_write, fsc);
+                                    fi->ea, 0, fi->s1ptw, is_write, fsc);
     } else {
         /*
          * Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
@@ -54,7 +54,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
          */
         syn = syn_data_abort_with_iss(same_el,
                                       0, 0, 0, 0, 0,
-                                      ea, 0, s1ptw, is_write, fsc,
+                                      fi->ea, 0, fi->s1ptw, is_write, fsc,
                                       true);
         /* Merge the runtime syndrome with the template syndrome.  */
         syn |= template_syn;
@@ -117,9 +117,8 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
         syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
         exc = EXCP_PREFETCH_ABORT;
     } else {
-        syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                                   same_el, fi->ea, fi->s1ptw,
-                                   access_type == MMU_DATA_STORE,
+        syn = merge_syn_data_abort(env->exception.syndrome, fi, target_el,
+                                   same_el, access_type == MMU_DATA_STORE,
                                    fsc);
         if (access_type == MMU_DATA_STORE
             && arm_feature(env, ARM_FEATURE_V6)) {
-- 
2.34.1

