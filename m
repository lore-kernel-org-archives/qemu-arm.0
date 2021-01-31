Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2761411lfo;
        Sun, 31 Jan 2021 08:49:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyn335SaKkuc7WAVUONP+XIrKNFUpqq5OrUcbaxufDjwKnaTWH+ZzJPLTD0w/Km2aMNEbE
X-Received: by 2002:a25:2a93:: with SMTP id q141mr15240313ybq.48.1612111744064;
        Sun, 31 Jan 2021 08:49:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612111744; cv=none;
        d=google.com; s=arc-20160816;
        b=Sx/zIn1CtgIre3HNlShCBs6MnrAu3Eoh7nfNstL1tHu6ySXZEYP+7t8di/ZNEANJDC
         K3/CHLCsdqVtOD7VYjqeucPgE8M9Xw4AvQ+AgRznjJpnU9QfWqYzH02NGRsDX6/CY7kU
         fo7azWl3yv4X1DDf20Njyrnu1zNFOrCRbn99q8ZIvyy03SmVgxa7qsNgw9goluchCj2f
         UwlewgCN6FafGxMU8+f0maL0g3nQV9qwMswkUYnXiZOLA7fhQlpj3Kifp61YIX8EpIW2
         rQFrVjIPXC6ck//m8wCiIosxw5nf6o02tIXCGDJwzDxeWwt3hCsBYHdszvl9/n77W8dv
         XGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A+TdNI5pWxQ6NaQfL/aha6oCVCEm83H0PFBTmvUQ5ms=;
        b=i/v1CAXIbOgZoNGncSHBI03pO30tcBpVJVfnfij3d2xSRMWHlfUFztyx9DYnzESr5v
         t7VIBpen2s4ZAVo9LdJ3x9whpHjbiPM1NgXOnbuXLJoV5Xn+nvCMI3pw51/VhX2sHCOo
         6MNl8PwojzU8CPNfzaZVwPmEWXRLlTaYW1KM/jaQnpVvCQGVUCCmyZmbIzcB7f3UyJ/P
         cN0LrnoZAIQn0J2+Emvc1UChZhN1FbvxtLm756ja1LN76vlg5pXn06BboXdo8hv0mvGp
         mxh/81Zv04D6HF/IriVDsFRkkFbGQ2gIbkHtA/DfrwRzxZ9VB3Fp3PaHMAUTqZxwPDwO
         xdFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SznLTWif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si12866014ybh.449.2021.01.31.08.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 08:49:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SznLTWif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6FuJ-00041m-6g
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 11:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpt-0008RP-9f; Sun, 31 Jan 2021 11:44:29 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpr-0001X4-Sr; Sun, 31 Jan 2021 11:44:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id q7so13986419wre.13;
 Sun, 31 Jan 2021 08:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A+TdNI5pWxQ6NaQfL/aha6oCVCEm83H0PFBTmvUQ5ms=;
 b=SznLTWifMrDliGHi8VQAsrfbKvE0Mzhx+KuzQNsXJVmm0AVFRXm678y5WMozpfyPsO
 dpCMEsUSlzErF6ULbuo316ffU54Q+hQZQ6H6Bhc7A8GDjif2ewnoH0MbDhiUwuvvOc7z
 ULSxH3b5+EcfYFlnUbtRm3cvD5qwArsIiExEtovw1py5XOPeNSOfq+LL18CoB+TeHnK9
 P+OTZm70y3ykKutL6f/IpwXiWhV0vdhzf5321HH0fiMhOJdB5cHDv9LXUdkV4vkGiHDc
 XwbQ7Pp5pj+AVtNXcK0tKNI99Rjg4zg79JJ7ci9u+m46GX6wIaZBT9YkZ1YoZJKetGsD
 ibfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A+TdNI5pWxQ6NaQfL/aha6oCVCEm83H0PFBTmvUQ5ms=;
 b=dTMVTe2KGOQ0AjWNvitR/gwkRPK8QfFjwIRJyDHB0MkcQwaaueaDKSj9VNHppjdEfP
 k1OWx/eG7CnSz/hT8zrunorbafhuPfFliD97uHOonKDb3PnInBB54Fde9oCvON9CbRVF
 C+VmFhuRL+DnKwmzNWJ0zG08lsjQFkfkHMfJ7rcGnPVMrih0TxeU8W+XaJgRLjrJeaG9
 V8gI75LGTfxkUt4J+BQKICAqjJrawNlY0Sr3kQrava8kbaQca0POt/G2T5LAopRWLG1V
 NYBB+Jqe6NUB0Cj1kVjoVm7xHFcyO5TEBAIo8ReL+Fo6LrNPlPjsow8+ufUsHWVq/4Jc
 SXPg==
X-Gm-Message-State: AOAM532vh4//5LqPY8ZJlMFvBwsNs18++FbIhzOhoSpkEvpGK3tOTWt4
 dnEFovBSm2KrBpodX/FP4Xzmd8uMUs8=
X-Received: by 2002:a5d:4242:: with SMTP id s2mr14449388wrr.108.1612111466023; 
 Sun, 31 Jan 2021 08:44:26 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id v126sm19002105wma.22.2021.01.31.08.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 08:44:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/arm: Restrict v8M IDAU to TCG
Date: Sun, 31 Jan 2021 17:44:04 +0100
Message-Id: <20210131164406.349825-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131164406.349825-1-f4bug@amsat.org>
References: <20210131164406.349825-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2yHHyfxDj8i8

IDAU is specific to M-profile. KVM only supports A-profile.
Restrict this interface to TCG, as it is pointless (and
confusing) on a KVM-only build.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c     | 7 -------
 target/arm/cpu_tcg.c | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40142ac141e..d0853fae5ae 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2352,12 +2352,6 @@ static const TypeInfo arm_cpu_type_info = {
     .class_init = arm_cpu_class_init,
 };
 
-static const TypeInfo idau_interface_type_info = {
-    .name = TYPE_IDAU_INTERFACE,
-    .parent = TYPE_INTERFACE,
-    .class_size = sizeof(IDAUInterfaceClass),
-};
-
 static void arm_cpu_register_types(void)
 {
     const size_t cpu_count = ARRAY_SIZE(arm_cpus);
@@ -2371,7 +2365,6 @@ static void arm_cpu_register_types(void)
     if (cpu_count) {
         size_t i;
 
-        type_register_static(&idau_interface_type_info);
         for (i = 0; i < cpu_count; ++i) {
             arm_cpu_register(&arm_cpus[i]);
         }
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 3e1c9b40353..bddfbf5e3a9 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internals.h"
+#include "target/arm/idau.h"
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
@@ -719,10 +720,17 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
 };
 
+static const TypeInfo idau_interface_type_info = {
+    .name = TYPE_IDAU_INTERFACE,
+    .parent = TYPE_INTERFACE,
+    .class_size = sizeof(IDAUInterfaceClass),
+};
+
 static void arm_tcg_cpu_register_types(void)
 {
     size_t i;
 
+    type_register_static(&idau_interface_type_info);
     for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
         arm_cpu_register(&arm_tcg_cpus[i]);
     }
-- 
2.26.2

