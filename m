Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp740668lfq;
        Wed, 16 Dec 2020 14:13:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyQdWMPqziM50a9P/m0UlYCVm+RSjo4e4Pz0Yj/q9pyzdHEHDKdFy2yVqG5QazMaXF0wCW
X-Received: by 2002:a25:ab30:: with SMTP id u45mr31567616ybi.516.1608156816822;
        Wed, 16 Dec 2020 14:13:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608156816; cv=none;
        d=google.com; s=arc-20160816;
        b=D3h8zQbjVe4iL8rwoWVPfp/qj2lJQKVy/zdMa3AKQyCwzOHfoLjLmQqNMeFnhFiOxO
         DjuJ04grrJVqOpWA/ceP3uZaEIb2Tl90jb+6QnDHHrPYnKrXDSo4mqnOyFIXh6evPPXY
         CP70YUDy5vCZSGaJx0J406hSeRtG+zXiT3BkJtNYI4Sutl4qRLRLKgByeJZvB2/SyCRv
         c7Qg2yJYTSDqo6LXpps2fiBNr8mSfJQ+6XaI3b/zHy3v2o4/0SizLS1BO5Xy8S28OdHI
         wY3ah3CJa+5qUZ/5UBn4Xok5zBuPAesrr6KpeplBfAYnY6zHW6uHUBErs6hqIZ3aAaCP
         myEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
        b=JriYwxG7UtZvtXyISGvP8NjWJQof/s5MxHOTx+gS9S86LqYhE1oUHL3iL2B3WWy9a5
         qrIdZdjUkTis3WUE0SjH22pXoq5e/L6gxA5G3gE5hkygJTiRTnDC3BAquxJAKbyt+M0k
         t80NDSrIGCSAs5sx3U1rmrszIedZrNPfIRCdz6YFeUaYuln/NC/agxfcS6p5uVEwBtpO
         F0sOHKl3mIihRH9lK1B4d0pISszc4QGQaa8AFu7Qm89JRSqUu+4t+QZf1YlqGxzL09CT
         7MGAYu1Plqvtw8zNIm5rtVJMgtUVVotW873qTRJXlxZU7xK8wty6xhhsfFqt08QkFT0D
         Rl5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dxIOMBqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si2419232ybp.117.2020.12.16.14.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 14:13:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dxIOMBqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpf3A-0003c3-5l
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 17:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf2c-000392-27
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 17:13:03 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf2U-0006D2-QM
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 17:13:01 -0500
Received: by mail-ot1-x329.google.com with SMTP id o11so24943507ote.4
 for <qemu-arm@nongnu.org>; Wed, 16 Dec 2020 14:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
 b=dxIOMBqKO4N9R61S6AxF8v+m7P/6y+HQXgn3JZPl3QG6O29um/a5KZ3aSQqGBfX7H6
 o/UaRPzhrpF3RlDMY1REFd/GViPEt64E5KrHTNW7v7qSj/8DdH6aJxLsSic/4s4kk1HP
 lbEOFSEfy9+IXZMyaQ/UFCn0Y2k22oi3i+rhkXsjESL5LxB8Q4fADjI2ZupIFZ1DGzgi
 4D616msUMuwLOZ9i3r6iIftqznGBLI3H3AVg/Fqm+zI/ECo8BfLBlpf3fOXEk7nq60h3
 d426sKQKnGFS1PGkuKErLBeWKP1Dicy9pVjzZnua669PtO9K8WsCy8a6atphuneO+wHb
 2usQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
 b=E1nb6y5rVNV4V3z77udWLkUOjzWafK6EjVSAV4ReLl4guFhhLh92mL8KyF9vpQiS5a
 JjbeYuUmKYaNAbYfZF8u9tRqwDl07l2Gwtx9deXZa1Pnw7ula3P+PZe67k9E4C6t2PIW
 qGzo1qT1ITzURD3c7IvJmOKcJ7BQQz++bJH1Sy1wWzRZcWJHL3pVXYC7Scc18AUkBkZP
 slCxL9bdgsrROO1RCj+G6Tpdbr4derE/jSm7rma0Htx9gfJF02l4ML9dXFg4HWh+Qfpw
 YB8s4FGejyZ8ptZd07wE7jJRkOidWKUZ3oAy+cHH9AMyYY0h/hDLnFdt54D5R+qq6nhz
 nqKQ==
X-Gm-Message-State: AOAM531MNmku0ZZScQ7eYd0eISfLUJx353ACWQ+mWgTjsf96d065S+bo
 cipv4x4jlMuxI8/+f8MVAEQPx0dS4FVxBGCJ
X-Received: by 2002:a05:6830:90f:: with SMTP id
 v15mr26891399ott.223.1608156773666; 
 Wed, 16 Dec 2020 14:12:53 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z9sm758965ote.13.2020.12.16.14.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 14:12:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] target/arm: Use object_property_add_bool for "sve"
 property
Date: Wed, 16 Dec 2020 16:12:47 -0600
Message-Id: <20201216221247.522686-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201216221247.522686-1-richard.henderson@linaro.org>
References: <20201216221247.522686-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WeiaabKNG4wY

The interface for object_property_add_bool is simpler,
making the code easier to understand.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d9feaa9cdb..8e1fad00bb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -488,6 +488,12 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
     cpu->sve_max_vq = max_vq;
 }
 
+/*
+ * Note that cpu_arm_get/set_sve_vq cannot use the simpler
+ * object_property_add_bool interface because they make use
+ * of the contents of "name" to determine which bit on which
+ * to operate.
+ */
 static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
@@ -529,26 +535,17 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
     set_bit(vq - 1, cpu->sve_vq_init);
 }
 
-static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
-                            void *opaque, Error **errp)
+static bool cpu_arm_get_sve(Object *obj, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    bool value = cpu_isar_feature(aa64_sve, cpu);
-
-    visit_type_bool(v, name, &value, errp);
+    return cpu_isar_feature(aa64_sve, cpu);
 }
 
-static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
-                            void *opaque, Error **errp)
+static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    bool value;
     uint64_t t;
 
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-
     if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
         error_setg(errp, "'sve' feature not supported by KVM on this host");
         return;
@@ -563,8 +560,7 @@ void aarch64_add_sve_properties(Object *obj)
 {
     uint32_t vq;
 
-    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                        cpu_arm_set_sve, NULL, NULL);
+    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
 
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
         char name[8];
-- 
2.25.1

