Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0327FCA0EDC
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 17:29:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulsnt-000420-14; Tue, 12 Aug 2025 13:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsns-00041C-1c
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:28:52 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsnh-0003Sc-TT
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:28:51 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso56102165e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755019716; x=1755624516; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTgiDxRSLxB+/Dn7RyfAMOT6DRpkQW6SJaCX0ndx+MI=;
 b=m18sknxeIu25ojySwy9TVfk4g+yX8brAaXcjHrByeTWWk6Sf++idI9LVr+HnqfJEqW
 VB5TNhZvX8l6kvDcl4KgPTAdXWhI4Sfhlh66xxiRJ9ddHVzEo3vz8NRaxOSntDKIlg9n
 jVPFvB1gwWHGW5hEUZ6qhFTalgsq1X2/hJfcqZXPbPRqxTAHhlvAw2Bq0pl56m5kZBCw
 AQtEf1s6nVTQrWaqsUSAb0mWmh0MVtZSI9fzxg5d4jvK/fJdUfLAUq5JQ2qwB+cPh29b
 E/tCo7ccSbkS+8iOu4Wv+6fxM6YBwM+8NnE+5rJOdOhPeMV7yGg1RXN9tGEVyu9VtzW2
 6iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755019716; x=1755624516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sTgiDxRSLxB+/Dn7RyfAMOT6DRpkQW6SJaCX0ndx+MI=;
 b=adG7Qw8iFJvWqbbIbFUoRkqxKuPwx3NxfsUwlWgVDByrBe4oJG2TFotM8vBOe+MAfJ
 3d+4PNj6WiF6e3rFHEc1QeH5oQXE23R3+/cuCO24xyVBSFyZqVyzfoYh6nQZ21bhaBRq
 MhEcqmKqdklUN/PVM1/3SMiIdieVh3YFIBJlg3Xcs8Pnf4AVbAXn36mk2YqPf5qq4yEN
 yJ4H2H6FyGw7Wn45Kb/bUiuVLh2iTwgJhQ1pLfPqqLISgMpwddJWAqMXsTs67TbFg0bb
 KMkTcDn6zWWn2RwlzftLX1K4oHRr4SWG8lwUapt6al5nZ3ARpw0gpjRcXROGw4w89wJQ
 8LLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsODh6xk/1L5wxlsG+Z4j26qeMh1HORe0GwRRjrZeYbZKP5FU0Gn8PDH5OLm0VuqgWzbFAAYvdkA==@nongnu.org
X-Gm-Message-State: AOJu0YxottKm3Ml3u21ZD9Q8NI/ujYFvh+oHABM7I50JmHs2anitD6Hu
 VGH78rTF5/X7U3La8QqlPc4VE6n/4bCKrxELNFJ30bwXdgo6uOx/zrLWja/pFDnqEY0=
X-Gm-Gg: ASbGnctx4oa5PFIlxB7nyhoSNR+Q5Rh0HuQ8RnIjWN/wHuLfUSpj47lURHdPBuxRUZG
 rlxR1plZsjeD21Qx8TnG06OfC/w3LmPv/NtmE6PWOrSzexaZ9NEl5j2Y5avU4sisBpd8IEEb4wj
 SdowZ77cBYEQVGoRkq5gFqxwatGSG70PMUVUwRimhW8Fne4YNF96a6D88ZsxVGDkDcOOa5RcrZN
 yniX2bC7poRDVje1IOnYMA0me9CQIxo4ToH4AQ/ZgW9wRLuHNM5ENqx8H2uCjjdv7NG0Up4rqgk
 K3PX9djmhE1Op5vHl7Jckc0/Zor1/p5GifSzty717pXw2D8AWjFNy7lTtt1PlhnOiIkKqHNsQBx
 Gd/wjusACeQkC17rn/1nou0V55057Y/J25VsVRCfxzmQALG2GUENdr5H/+ZJM7umh5yozMZyj
X-Google-Smtp-Source: AGHT+IHCNB9liwRrzN1UA12Au2HxJQE1KeT6nD/BnW4UnE7bWMjAbGsN0eox/z70JQCzOYHqa8vdNQ==
X-Received: by 2002:a05:600c:35cb:b0:456:25e7:bed with SMTP id
 5b1f17b1804b1-45a165adbadmr219075e9.14.1755019715766; 
 Tue, 12 Aug 2025 10:28:35 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953eb7acsm545345755e9.28.2025.08.12.10.28.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 10:28:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 02/10] target/arm: Use generic hwaccel_enabled() to check
 'host' cpu type
Date: Tue, 12 Aug 2025 19:28:14 +0200
Message-ID: <20250812172823.86329-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812172823.86329-1-philmd@linaro.org>
References: <20250812172823.86329-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We should be able to use the 'host' CPU with any hardware accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/arm-qmp-cmds.c |  5 +++--
 target/arm/cpu.c          |  5 +++--
 target/arm/cpu64.c        | 11 ++++++-----
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index d292c974c44..1142e28cb76 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -31,6 +31,7 @@
 #include "qapi/qapi-commands-misc-arm.h"
 #include "qobject/qdict.h"
 #include "qom/qom-qobject.h"
+#include "system/hw_accel.h"
 #include "cpu.h"
 
 static GICCapability *gic_cap_new(int version)
@@ -117,8 +118,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         return NULL;
     }
 
-    if (!kvm_enabled() && !strcmp(model->name, "host")) {
-        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
+    if (!hwaccel_enabled() && !strcmp(model->name, "host")) {
+        error_setg(errp, "The CPU type 'host' requires hardware accelerator");
         return NULL;
     }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e2b2337399c..d9a8f62934d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1984,8 +1984,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      * this is the first point where we can report it.
      */
     if (cpu->host_cpu_probe_failed) {
-        if (!kvm_enabled() && !hvf_enabled()) {
-            error_setg(errp, "The 'host' CPU type can only be used with KVM or HVF");
+        if (!hwaccel_enabled()) {
+            error_setg(errp, "The 'host' CPU type can only be used with "
+                             "hardware accelator such KVM/HVF");
         } else {
             error_setg(errp, "Failed to retrieve host CPU features");
         }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 26cf7e6dfa2..034bbc504cd 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -26,6 +26,7 @@
 #include "qemu/units.h"
 #include "system/kvm.h"
 #include "system/hvf.h"
+#include "system/hw_accel.h"
 #include "system/qtest.h"
 #include "system/tcg.h"
 #include "kvm_arm.h"
@@ -522,7 +523,7 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
     isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, APA3, 0);
     isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, GPA3, 0);
 
-    if (kvm_enabled() || hvf_enabled()) {
+    if (hwaccel_enabled()) {
         /*
          * Exit early if PAuth is enabled and fall through to disable it.
          * The algorithm selection properties are not present.
@@ -599,10 +600,10 @@ void aarch64_add_pauth_properties(Object *obj)
 
     /* Default to PAUTH on, with the architected algorithm on TCG. */
     qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
-    if (kvm_enabled() || hvf_enabled()) {
+    if (hwaccel_enabled()) {
         /*
          * Mirror PAuth support from the probed sysregs back into the
-         * property for KVM or hvf. Is it just a bit backward? Yes it is!
+         * property for HW accel. Is it just a bit backward? Yes it is!
          * Note that prop_pauth is true whether the host CPU supports the
          * architected QARMA5 algorithm or the IMPDEF one. We don't
          * provide the separate pauth-impdef property for KVM or hvf,
@@ -780,8 +781,8 @@ static void aarch64_host_initfn(Object *obj)
 
 static void aarch64_max_initfn(Object *obj)
 {
-    if (kvm_enabled() || hvf_enabled()) {
-        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
+    if (hwaccel_enabled()) {
+        /* When hardware acceleration enabled, '-cpu max' is identical to '-cpu host' */
         aarch64_host_initfn(obj);
         return;
     }
-- 
2.49.0


