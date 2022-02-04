Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2705084lfk;
        Fri, 4 Feb 2022 08:56:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgeQX5X4sgHqinfioWNFhvv+AznQTpDJxpJ3LjB41Gs1TDrtq8IHYgmMgJvE4Y3eUdcDB8
X-Received: by 2002:a25:5387:: with SMTP id h129mr3480103ybb.669.1643993782439;
        Fri, 04 Feb 2022 08:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643993782; cv=none;
        d=google.com; s=arc-20160816;
        b=QMMJGhgvzu5VHtO88dRYwDZ3mL+GDUwI31533gugF599UMXkReBlTCtiH3jaK/X0C3
         J/K5VF4XbolsZNxFvY4rEuTp/QjI8bzWTFEXsiYc95xh5DWa5cKYLLW7TiJF8kHNhlMR
         XfXx364NLJrHFqLeajpGBDWb2LhZLkf67ERNMgIQortqHhAYXwd/GnAm8o6SJkY6GFx2
         WssyBuAFzoE7HYq9+J+1W1zNjIE97/aF7uwWUvhgYFv9PD9n9D5rX+dxEQZUS+DTpdcY
         eh2bkEQoHdWdigrXUmIEy4u8220S53Pfo/MGrU242D42t3DAH5ev9F67uOkXqXSWwW51
         iSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=umQ/WbOJUobh23pwZIc3MfhXaZpQDP+TCKjJpFme+9w=;
        b=uQIhUjkq04NGQV0hk588+5vvt8zH9kYbFWshyPC+eYEH8zINa0ColUESQF5u92dOSv
         kSmcHT8grmFJv3ECGYOPYC1vog6xMUP2vUwfT0ZSxTU4p3zKPd/PqFF7U52rb13LYJ3l
         8P59zOwHxtAg8xOypKtHNhbUQyt+JDyPD3pszt53/GGKhOxc7TAuNeXUxFdjpR16CJmi
         DcOKQgwrKBrkAVVE01uyrh0ykuiF6KmAfSWIotpWELfo3HzddDNPISBi0o9ky2k/MJ0N
         eb5UcABg8sHprSld3h3ZH/lCgncQ7XMg+QF3lA7RMFeoAEd+sVo21t0xxoqcX4Tf2pYA
         EUzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UgQd5pLl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si1770273yww.467.2022.02.04.08.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Feb 2022 08:56:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UgQd5pLl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nG1sj-00032c-Je
	for alex.bennee@linaro.org; Fri, 04 Feb 2022 11:56:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1s0-0002jO-Lm
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 11:55:36 -0500
Received: from [2a00:1450:4864:20::334] (port=36460
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rn-0003DJ-Mr
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 11:55:36 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso9831722wma.1
 for <qemu-arm@nongnu.org>; Fri, 04 Feb 2022 08:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=umQ/WbOJUobh23pwZIc3MfhXaZpQDP+TCKjJpFme+9w=;
 b=UgQd5pLlr/hCiydV0vb3UUenZR52JfqSNWK1Qrqd6/yOhqLigr73Peweyo/YQ/MBt5
 cuOZZH5U1Xn4USdnYMeld31IFI8I4LfWcbttMSwq5NgVAZy/EeH0yJkF6X4XiH/TxXBW
 K9alm0W3R1//WYTtGvwqeZDfGbiHRQCmfvqxxKFwfCD7OJShKS2BMhBufZbe8BugLCQz
 XSX0D9LDCXPUUrtmFdtLB32wurFYdme9JEbTh0A44oSJrHCRUrHGSLemkZxeT0gqFXJV
 C0kBUqSKiesz7709EIIiVb1WZpMpWwTY7LJAs19tRmQ1Q2E27X9L1aWXxrDLEiSJNy4A
 8Qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umQ/WbOJUobh23pwZIc3MfhXaZpQDP+TCKjJpFme+9w=;
 b=5EszTrMsyavsxtfgMEqI4Y5jXTsLAjRbeJImr0CXx12zfNMFkb5G+sVx3lqwRO4PqB
 2qRhp0xSGwTwOSRH9vNx1yVMtIabPgKtS/0zcpFJPGnEyEd3/opdYKYFH87+EO/ZsK/+
 /m9VlXoxXscVsvW463jF4B1eQ5d6nofIU7OHXB3+Rib94bLA1JmdSCJE+kWQi/ezDKVp
 WE+84tmR0uvVQFzZwd1dQSh/x+jsqMc/ka1IO79yCvvWXJRPaA1vbOh/3Fa+qUDxpza5
 5Zdeq4jbzrv9va5EOMiozNuLwH2tO1cf5+xiBHWYnpQuie6VddEwbXJGcU1767TlRklP
 ++OQ==
X-Gm-Message-State: AOAM5313cYAHM1mCCY7Yh104dDjQX6nbpWX9CoC5ldAy4860WS3q4B3g
 cqiHe9v89gBm+s0GVOgg7pItThXaVw9HOA==
X-Received: by 2002:a1c:4e09:: with SMTP id g9mr2972347wmh.188.1643993713025; 
 Fri, 04 Feb 2022 08:55:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/arm: Support PAuth extension for hvf
Date: Fri,  4 Feb 2022 16:55:06 +0000
Message-Id: <20220204165506.2846058-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I++yOMikmkT6

Currently we don't allow guests under hvf to use the PAuth extension,
because we didn't have any special code to handle that, and therefore
in arm_cpu_pauth_finalize() we will sanitize the ID_AA64ISAR1 value
the guest sees to clear the PAuth related fields.

Add support for this in the same way that KVM does it, by defaulting
to "PAuth enabled" if the host CPU has it and allowing the user to
disable it via '-cpu pauth=no' on the command line.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fd611c97116..5be5ade6c9d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -633,9 +633,10 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
     uint64_t t;
 
     /* Exit early if PAuth is enabled, and fall through to disable it */
-    if (kvm_enabled() && cpu->prop_pauth) {
+    if ((kvm_enabled() || hvf_enabled()) && cpu->prop_pauth) {
         if (!cpu_isar_feature(aa64_pauth, cpu)) {
-            error_setg(errp, "'pauth' feature not supported by KVM on this host");
+            error_setg(errp, "'pauth' feature not supported by %s on this host",
+                       kvm_enabled() ? "KVM" : "hvf");
         }
 
         return;
@@ -672,10 +673,14 @@ void aarch64_add_pauth_properties(Object *obj)
 
     /* Default to PAUTH on, with the architected algorithm on TCG. */
     qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
-    if (kvm_enabled()) {
+    if (kvm_enabled() || hvf_enabled()) {
         /*
          * Mirror PAuth support from the probed sysregs back into the
-         * property for KVM. Is it just a bit backward? Yes it is!
+         * property for KVM or hvf. Is it just a bit backward? Yes it is!
+         * Note that prop_pauth is true whether the host CPU supports the
+         * architected QARMA5 algorithm or the IMPDEF one. We don't
+         * provide the separate pauth-impdef property for KVM or hvf,
+         * only for TCG.
          */
         cpu->prop_pauth = cpu_isar_feature(aa64_pauth, cpu);
     } else {
@@ -695,6 +700,7 @@ static void aarch64_host_initfn(Object *obj)
 #elif defined(CONFIG_HVF)
     ARMCPU *cpu = ARM_CPU(obj);
     hvf_arm_set_cpu_features_from_host(cpu);
+    aarch64_add_pauth_properties(obj);
 #else
     g_assert_not_reached();
 #endif
-- 
2.25.1

