Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp249735lfe;
        Mon, 16 Mar 2020 09:06:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsKZf8fc5txYWVqt/+aA49gTFb6my4+h68y5g0GEBvM2OKkROVvk6+jjyqS/yTlJJO+B18W
X-Received: by 2002:a5d:540c:: with SMTP id g12mr97341wrv.230.1584374812679;
        Mon, 16 Mar 2020 09:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374812; cv=none;
        d=google.com; s=arc-20160816;
        b=CJQKHcOyYVOEfN3AYms/dZVUZrAGJGETmOq1O/SSC4kSzabALwalAnQwbB/AMFX3Ay
         G9tBz5OaF/YRKL/xB1KQZ2hXe6iqGcNfen1gwNfArjhjD0yHug46ZzT9BAEgOnxQQVxP
         WN35M7VIvxioWsypCZAFiA98rst5k+rKJv1EaE9GgMYdb7oIJQ4gxZT7UcAIqjKl0A14
         th0zGCRKcdv7+S6E3e1Cf0HydOPHV5kc7HTrd72UjX/xn1dmcNAOIbmLZQnjpqufNJxk
         8xS7muw1BUGgOz3Btsc4yUrfBTNZgmUAtq0aocVO5L8rKgHYjyYxA9Sujhd7QgE5mdpu
         1Ncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ecct8qM9CQq9wafb4H/DdqFCaIbWp3zdOza4EOqH9I4=;
        b=Nuy27MGUu90el4fb8RD5o+R1diRvhLIMMetankaFOPHDAMUiHvLq3G86zWExUVD3O9
         6BtK7j9HRt3YWVwjHFU+R9oQqgXVbPnGMYWz3kT48dla4ktDZUcul5DV3+1rtSWx7RKJ
         lJfYoJkZobIyBfrD0T/jQBtir8erGMqAbGURKFYKPqfWnKTUxsWtjohvc5J+6kgXpN13
         xTxDzvOivl2Y4HdQrCQa/iSuFljn5Kiwo8D4QPwjhAOKY9pgneVB0ugvBWwoiapdSa9Z
         uvAf41KplZs2ip5o+xE1c4NXPAtNXWrq+2pVPlP9FMBM1a5Os0B46rYHrcI3TiaQpaVu
         mN3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c95YFYMk;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id 93si290597wrc.40.2020.03.16.09.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c95YFYMk;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ecct8qM9CQq9wafb4H/DdqFCaIbWp3zdOza4EOqH9I4=;
	b=c95YFYMkfCRaVN+sBlJNYP59oneTP5J978NZXe6kzWU3HRPrA/P3U4zustSTbGdWNutv5b
	sgYuvGmUSLdYOiFirMRDqrhWZXDMwMco8kL9PNTjZRJHwhgf/nKflkvQUDySM3o0D3C9Qi
	tfIVR2tThEqfzXrE/P9RffEtaOvRnqc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-pT_x-czaMHyMK2pMSXmfUw-1; Mon, 16 Mar 2020 12:06:49 -0400
X-MC-Unique: pT_x-czaMHyMK2pMSXmfUw-1
Received: by mail-wr1-f69.google.com with SMTP id s4so3848252wrb.19
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZypQ8Ym2m02m1znfiemKRznaDVP8zp+ewV5H3Kv12cs=;
        b=bEcbt69b/EC8IviamVHUbiUu8/kNNMYdguzKBR6Ud3+Qgcyswe2xvpCHRZ7kotaEtg
         nfncTDDq6JJ9UHC4OlgRyk0CdSPDj72j351NSy4FazMWlQ0asivwJ4paC5BrJngP+Y2d
         JowYDztPpFdRRyPgr51/I2b32QSqNfamJl55sD9N63Sgjze09yEGYOpZzzpFh/9QR/rU
         8Xjdz50KzUDt5OSi6dQEYyV5RFlcVUj0fcNENpF83ZHA+MnSgq3E7AuEEHNjqvl8J8jc
         FyX2/e/TdWTTr4ZZsv6bkzEHeaKNSspzd3vPu2QMobxkDAjQ5ALdB1sYVLugNAD28On1
         oObQ==
X-Gm-Message-State: ANhLgQ0QjYkin81gJ/3psbtAg2ed4IhfL2aw87qd0LqcAegmCOqTBGsn
	tSyVkUn/kgBGVHjFE+VLFh6zAB6wY6TpEw3QSSM/GB0TrmhG6Z1SLWhQh4DosUie8Sg53duU1/q
	e/0kglpEYUM6z4CaG
X-Received: by 2002:a5d:6287:: with SMTP id k7mr52974wru.195.1584374808595;
        Mon, 16 Mar 2020 09:06:48 -0700 (PDT)
X-Received: by 2002:a5d:6287:: with SMTP id k7mr52955wru.195.1584374808384;
        Mon, 16 Mar 2020 09:06:48 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id b15sm498970wru.70.2020.03.16.09.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:06:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 02/19] target/arm: Make set_feature() available for other files
Date: Mon, 16 Mar 2020 17:06:17 +0100
Message-Id: <20200316160634.3386-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: O+wg2ocfOlUN

From: Thomas Huth <thuth@redhat.com>

Move the common set_feature() and unset_feature() functions
from cpu.c and cpu64.c to internals.h.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190921150420.30743-2-thuth@redhat.com>
[PMD: Split Thomas's patch in two: set_feature, cpu_register (later)]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/internals.h | 10 ++++++++++
 target/arm/cpu.c       | 10 ----------
 target/arm/cpu64.c     | 11 +----------
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e633aff36e..7341848e1d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -27,6 +27,16 @@
=20
 #include "hw/registerfields.h"
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
 /* register banks for CPU modes */
 #define BANK_USRSYS 0
 #define BANK_SVC    1
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3623ecefbd..c074364542 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -723,16 +723,6 @@ static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
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
