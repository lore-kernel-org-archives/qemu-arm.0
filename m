Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5085470lfm;
        Tue, 21 Apr 2020 06:19:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypITIu130hE9O8sYx3UgDKccoL7RIqmk8kR+p9fgRwt/qIyoYvbdPekq3FHQtS5uaDyWSWkF
X-Received: by 2002:ad4:4812:: with SMTP id g18mr20875237qvy.120.1587475199754;
        Tue, 21 Apr 2020 06:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587475199; cv=none;
        d=google.com; s=arc-20160816;
        b=IUEPt8/Ci13/NOpEikkfwBWKS02+1l1RBDEafLEoRD8Lr2NN1PomGiKpaFA4dhFChk
         bSoZEVdvxBEgI3vHnGfKG2ZmvrJCEgXYvBBSHBVDtZoGu5cLJpBrux5A2katgA78i+yD
         u1f7AYVh80anN4Ah4X3ZTV2RTqSkm4nOSImKHs0TOYF6WIT2dZ2EemtRFGIBWPv8lHkM
         9xZYofWgHTKkpzzO0SLA5IV4WjEEPFufqmZDkg8gROHDl0NLZ7NHsa3OKhOHoa2qQGfR
         JQ9a2EtKaJQHjPDDQbyVzoTOL4axCRpBu1dEp39703gHBB9i6n+3RCRuR3tF797d6ras
         kEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MB+KcpzEineBQraMabNomRZxm0WGxSq/4mX06L66IW8=;
        b=WG1zwrshaTyHzn0WP/EdhFhf8ZKWENRqNllp9dppE3t1HtgVZ3bbso/FdZg86Wgjkr
         Ju3I9M8me5fSGtNRnRKlpjPZPng03zG21+ja/enyRB0DbwICBxgYuXuOp1Yjv9DTrMIi
         TEke3c/kUO9LxyWs6P+JAOrj6Ijrl03KVGWMqh0kNeG3Dth7Dwxv7jVVMaH802rCUS09
         4rSfGgwAO7t13mYolrynRwWMioZ+7mwRqQly/rPxzqSmexqj2rFw+ODwPeEB+qlLY5Mw
         /08gMw3g2fOvECVxfeEhQsMQlHSjIvqQPr9K6EkYyHOInlPC92MQMU6Wh1d+o8UQYiDd
         JVbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GYkYuLD4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11si1432374qtb.276.2020.04.21.06.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 06:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GYkYuLD4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQsog-000173-Vd
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 09:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsoU-00013A-0j
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsoT-0007Vf-JC
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32404
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jQsoT-0007Uf-26
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587475184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MB+KcpzEineBQraMabNomRZxm0WGxSq/4mX06L66IW8=;
 b=GYkYuLD4NOIsGla/i+Es1EcfIUHR9MLsoa++6eWnWiQ7lNrnyOtKGlrRI1u/FGr0YS4jhK
 /+LCjZHIADLTFmH/LfXP0EzrWDFhebfsptUefok7asflngEqIQVCEVpHRCTOSZoqaZgvQA
 ewgMG6w4dhoBHWz29NELnYGvpmn/FNY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-QuVdM4nZP7uf18wQ76Am1A-1; Tue, 21 Apr 2020 09:19:40 -0400
X-MC-Unique: QuVdM4nZP7uf18wQ76Am1A-1
Received: by mail-wr1-f71.google.com with SMTP id v9so4787131wrt.7
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 06:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tByUF6YONCD4gqGP4f3pAvFwLd8JVDzJFormU5gNpuE=;
 b=GeSB8Xhluv64du5ZkoakDz9Tg2A2nAk/tF67yOX9UFgD+v9TNkQWfkKMZnNYAUbvMb
 9xr2RwB2YogMs5jsWpufXmIkuQhiqMqFVXuqjXNI8UyqhRhNQo22jICRxHyne7D0I8Nr
 FDUZx1YGBnDUIPDtpTRhlb3BsKtC+YL4m5Iw0ZxPLAxq04Hqwx7bgk6kxGp3KYIewu3A
 0FMYK/xNAH2r7iUwJ42wfiB+xVsa6TAM5aBJfIv+LLIsBya4TG85kZLSYKQ34ruYyE1F
 Mfy91KtRVtLvSF3fcj5AhARZkosFL0IQf2t9znS9QOIv+SEA6hhp7eZgeLXQrLwcU5/7
 1U3Q==
X-Gm-Message-State: AGi0PuZZ5zdwnVM/NTk2MSIc3YHct145D10v5KtReEPTtNM+zh/UgD/S
 9y+70oPBtV+AJqdeW4iBR1GbSb6RSuPzzw4K/WKzjsUofpBROAhwNNBMl0nTWyXvMo8cAKYnb8a
 X2vYRGs0OVsa5
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr26222154wrn.0.1587475178632; 
 Tue, 21 Apr 2020 06:19:38 -0700 (PDT)
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr26222141wrn.0.1587475178468; 
 Tue, 21 Apr 2020 06:19:38 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id j11sm3780321wrr.62.2020.04.21.06.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:19:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/arm: Make set_feature() available for other files
Date: Tue, 21 Apr 2020 15:19:22 +0200
Message-Id: <20200421131926.12116-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421131926.12116-1-philmd@redhat.com>
References: <20200421131926.12116-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 01:28:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DwqgZQ3IetDu

From: Thomas Huth <thuth@redhat.com>

Move the common set_feature() and unset_feature() functions
from cpu.c and cpu64.c to cpu.h.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190921150420.30743-2-thuth@redhat.com>
[PMD: Split Thomas's patch in two: set_feature, cpu_register (later)]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.h   | 10 ++++++++++
 target/arm/cpu.c   | 10 ----------
 target/arm/cpu64.c | 11 +----------
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8b9f2961ba..5e32fe7518 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -696,6 +696,16 @@ typedef struct CPUARMState {
     void *gicv3state;
 } CPUARMState;
=20
+static inline void set_feature(CPUARMState *env, int feature)
+{
+    env->features |=3D 1ULL << feature;
+}
+
+static inline void unset_feature(CPUARMState *env, int feature)
+{
+    env->features &=3D ~(1ULL << feature);
+}
+
 /**
  * ARMELChangeHookFn:
  * type of a function which can be registered via arm_register_el_change_h=
ook()
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a79f233b17..37f18d1648 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -724,16 +724,6 @@ static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
=20
 #endif
=20
-static inline void set_feature(CPUARMState *env, int feature)
-{
-    env->features |=3D 1ULL << feature;
-}
-
-static inline void unset_feature(CPUARMState *env, int feature)
-{
-    env->features &=3D ~(1ULL << feature);
-}
-
 static int
 print_insn_thumb1(bfd_vma pc, disassemble_info *info)
 {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 62d36f9e8d..622082eae2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "internals.h"
 #include "qemu/module.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
@@ -29,16 +30,6 @@
 #include "kvm_arm.h"
 #include "qapi/visitor.h"
=20
-static inline void set_feature(CPUARMState *env, int feature)
-{
-    env->features |=3D 1ULL << feature;
-}
-
-static inline void unset_feature(CPUARMState *env, int feature)
-{
-    env->features &=3D ~(1ULL << feature);
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *=
ri)
 {
--=20
2.21.1

