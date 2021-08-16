Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1392048lfg;
        Mon, 16 Aug 2021 07:01:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYdThAxYdfdTZkxOjDo/d7HF7qv+H0tvqHyLw7LSFLn7h+ZBIRYsF7EKiV4r1ixbMMcmiJ
X-Received: by 2002:ab0:76d0:: with SMTP id w16mr9046406uaq.15.1629122481349;
        Mon, 16 Aug 2021 07:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629122481; cv=none;
        d=google.com; s=arc-20160816;
        b=EZ7J6xIfZo/nF+mp9LKlzGX9AVhmf2W0QSzj240XXnQ6ErC62zwa/e+fTXWj021O+/
         AgEd+g4GX6GnDaeZZ6A2KTxd514+fjGPTW9LOIEYGET24GJcszUgKAG/ANBL0tN6p/gj
         nJuh7NVb8+bUFy3ygYXwxl8OuFVg9cj9ZeAGARRDZOIUesPbNzsb6T58rnFg30E2lgIr
         KLcUYYi/NFrqSnNbuRFf/t2Qz3BG08t/dxCULdEpdVqyEhwQLORDMtxhWN3xUxQ6TXAM
         wh9ki3Q122YlJhI4aqKqITKxuI6FxWi7jiXkCGf3iMJj2C4boLOEBfqeb9JXJohIfxDf
         +yoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=t/udaJMwa5qZbLWXNvr9taHHSSvraZWWiRbg1Mycy2Y=;
        b=0Zoy7EBSD58oVstGMPE5lnVfsUw6QKdcP9jh3fdXd+5sG6aAMpVXfjZFiB9zT2Smbk
         NrN+rOxxzeLM/yzOIV7xYtxM9wGNThUvKvj6kK4mshf9ixXavhb1IqSUyVglBScsluXJ
         LBzxuoFcK7gW2F6Bki+Kko8utpi7gN6rMXnVbqLngJuKedCIao4pwtRsV+UHd/Lb+FUZ
         jTiZJmLSQxQlUxFmtius/wC1sNfbQJ0gCWGx02kW2tuOgduM+UcoN9t8IyXDOMZNidaj
         AaK3hGOV2ad5qzBUxjo+gI56VdGeTY5++l6nLcxQEFwiEagvEu+T3uUikZt7iegMZH9R
         vPRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bhJDtEvx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si3758441vse.44.2021.08.16.07.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 07:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bhJDtEvx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFdB2-0005wa-IP
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 10:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8c-0003Ek-Dt
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:58:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8Z-00062G-Db
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:58:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso2332732wmb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t/udaJMwa5qZbLWXNvr9taHHSSvraZWWiRbg1Mycy2Y=;
 b=bhJDtEvxK+TjglUBdhkAzbtdaJ3JJRaEmp/woMuxnqpXmNdAvHNRqMLhQ4IZLR5eCY
 gGt4yc+CFtfeC8sVtc1vHnRK5KArpWPwYMA0WndyA/P59rr7EdBy7sl6z89CPHaSyY0F
 o2Qc2to8YuBHswWnHGBqS3PcV0KC1s03fkH1XQ22vi9zjHLVDfiy57C4iMtGhCjtgBmr
 bmjzjPBjX64Pt2Jznbl4MKULOauZMenwcE/kfgi/kHY/n+Yw0iIHSFLVOckjxsJ064bM
 i+okrdCmbsKCPwUomhPlVmG227QszlZrvnQ4R8zrP0AiuPY2GNVCDPNMR4XYB75OTEq1
 h7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t/udaJMwa5qZbLWXNvr9taHHSSvraZWWiRbg1Mycy2Y=;
 b=ECVkA4gRkVsbEM50p8oic7F0ayf7+mtj38ikb0V0xfieTMf7QA3rydS4y5653aEaT5
 8q0YBJ58hfrsaDNz4gxjqelrlm7vmgnIhqN4r5wUv2rViZYSJPM55MzZpLUIFmJ6okLA
 wlCRuv3DYvxFcQlzXR75ZCxCmzqFpmDHHQt8Jl4DZW8UGu/AW55FFKSIxwD+e297WFuc
 kHeejVGAwkjPetfGalYfQJLfjy2zNkOH2MLZVVZNk13/X6uOb/CKH1v3b3WebiPM3Smz
 N46YAOV1mN73f6GpPhCI3W5IexaK9Yc0HtcrMAz7OXPxnwObRR56QD4sRPxmadBBD1E3
 tO+A==
X-Gm-Message-State: AOAM532amSwYonP9BJA+vAtkWoJoQw+ePVJn5Jeog9HkzwHV7JJOMD0S
 aGrxy9vvp0jkxqe4lL6YnybSmw==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr9047399wmc.41.1629122326081; 
 Mon, 16 Aug 2021 06:58:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm11855631wrs.29.2021.08.16.06.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 06:58:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Avoid assertion trying to use KVM and
 multiple ASes
Date: Mon, 16 Aug 2021 14:58:41 +0100
Message-Id: <20210816135842.25302-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816135842.25302-1-peter.maydell@linaro.org>
References: <20210816135842.25302-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bvkGdX5ZttMC

KVM cannot support multiple address spaces per CPU; if you try to
create more than one then cpu_address_space_init() will assert.

In the Arm CPU realize function, detect the configurations which
would cause us to need more than one AS, and cleanly fail the
realize rather than blundering on into the assertion. This
turns this:
  $ qemu-system-aarch64  -enable-kvm -display none -cpu max -machine raspi3b
  qemu-system-aarch64: ../../softmmu/physmem.c:747: cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()' failed.
  Aborted

into:
  $ qemu-system-aarch64  -enable-kvm -display none -machine raspi3b
  qemu-system-aarch64: Cannot enable KVM when guest CPU has EL3 enabled

and this:
  $ qemu-system-aarch64  -enable-kvm -display none -machine mps3-an524
  qemu-system-aarch64: ../../softmmu/physmem.c:747: cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()' failed.
  Aborted

into:
  $ qemu-system-aarch64  -enable-kvm -display none -machine mps3-an524
  qemu-system-aarch64: Cannot enable KVM when using an M-profile guest CPU

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/528
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2866dd76588..4377f3211c8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1419,6 +1419,29 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+    if (kvm_enabled()) {
+        /*
+         * Catch all the cases which might cause us to create more than one
+         * address space for the CPU (otherwise we will assert() later in
+         * cpu_address_space_init()).
+         */
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            error_setg(errp,
+                       "Cannot enable KVM when using an M-profile guest CPU");
+            return;
+        }
+        if (cpu->has_el3) {
+            error_setg(errp,
+                       "Cannot enable KVM when guest CPU has EL3 enabled");
+            return;
+        }
+        if (cpu->tag_memory) {
+            error_setg(errp,
+                       "Cannot enable KVM when guest CPUs has MTE enabled");
+            return;
+        }
+    }
+
     {
         uint64_t scale;
 
-- 
2.20.1

