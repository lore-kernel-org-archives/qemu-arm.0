Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509842dyb;
        Mon, 23 Jun 2025 05:20:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXr1REbDT5swGS6gedOC/A7h4MDi/jUPuXGq5TIQDS+cMV5y/vSNQCmRZnJDNYEu05cfT3QgbyvmDYW/Q==@linaro.org
X-Received: by 2002:a05:600c:138e:b0:453:6150:de41 with SMTP id 5b1f17b1804b1-453659ccfafmr121919195e9.17.1750681200014;
        Mon, 23 Jun 2025 05:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681200; cv=none;
        d=google.com; s=arc-20240605;
        b=LnIXtdPx0b1ax5zC9pxtgppGI04IAgBU+8jP+Z53GpX937GTyhot2qj4Vocj/O17lX
         7A3e0i51wQbDUQ5pFr/prGpMxQFPjY/MhZoNTQMqftrzS+B05E/gfUVdAdAdScON64wW
         Rk71MNfRG5JywY7aKYKuDkTJ7kSBisJNoVEEcjZ5Id+FQe+fXM9P7inyxtaV9SHhrjSO
         LyJ5jsNd0JTOIi53MPz9+WVuhc+zsPsEda0byZaTBr0Izc4//D74CrYl1wYGzjWa+1Z5
         C5EPvhx3HegbEg3DQtMnrO8du2fEfUU7/sqEqLmUe1R0JnQuIs2PZ0xYXmqlcz2P0+h9
         8IzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FOQFF5IHVggEpZxvhH4Dg2y5NDppFE2+idPk4kXeUTw=;
        fh=7CvNJvRY1eH1HCpHFHZO2ntXpRr8ICg3W/Zb0ANyQXk=;
        b=V3xm+6dK7FBQ3jyAwuQM7eqLp3lSMmGCMMwb3x9NQrkvCjYpD7ZMHcgxrkyy/8I8Cq
         6mgIiju0uy3GLdwoHOhfGkJxI9F6imORfSDFUnPnBbEN2778ytYZFIeis3GKR731mlnr
         Xp/LF82U91RUxY4HgKOI9S2+Iy21G/QYkHW+bBCAyYgNDpdJbgSTdbr9ns3q+ZfMFzjL
         3flJLMg+BP5bbZJYZO6RUcM0AT5/4VcJ/JiqgwBsO9aiIYgwToMOkAlWEUnp21jzmI/N
         Wbl6qSr/ycS1EySPaj/V3WQyH2Omgt/0XHIUcLnuv3UFvJ+60qwu8oG3YsxyeaPb/oe5
         rl+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uKIcwA5m;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45364708157sor25192575e9.10.2025.06.23.05.19.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uKIcwA5m;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681199; x=1751285999; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOQFF5IHVggEpZxvhH4Dg2y5NDppFE2+idPk4kXeUTw=;
        b=uKIcwA5mDQm5kUTDzRF9JALjTIrnzzvo1YfD//d9IQgMqK2/4R16X4ScSN9slk/5jc
         vtvPYvY2AURYyn2h5w7h5oUiLRhpe7HNrXLFvdKGJWSrvqxEsDfhhsG6yodhSRyhgyys
         Q0zuWScLvMfBk2b/rxv1BkSPTPrznRN6APvcjj730sltX4xJN25Gq7tada/5MCC1u3HR
         TuwdActJaqmubFQkU5/Puw0F2zplWPbtGcWlunU7Bs0cDgMhxM+vTho4kqvmp8EF1k01
         BgXnWET3F+IuK2mtknWw/icMZr6GcC8rwMA0gjmbczO9w5jySxEyMNraty6SWcXQByDQ
         IiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681199; x=1751285999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOQFF5IHVggEpZxvhH4Dg2y5NDppFE2+idPk4kXeUTw=;
        b=txyt6vN7XMVdff8XRlHKsHlpxBCh/mCkpNPTWbse5Dd6BbymfeD1zyaHzhfaXa4F2F
         l/eeRewm4vbt9+LMLDzGO71qfzkt4Zm9PvkWyouG0B40oRnwGad4YYTsLPxXPcE8gxK+
         P+slnhThnJGAySiM04pQG9VXi6dUWRcXgRYzh05E58bMAaMiZpYaBsIPibrCryL26oBF
         yxOdj+EuAxplNEqnWvfUPoj8LfaK3vgQ4VI2V259W1Fa+ZhV2ZCgePHe+3qFvkhUOau+
         aGuvE8uCNkqja18raO39TXqOtfFLodxFmgQNVUR5fxrlq786nNX2psFAygSCy2IZHjwK
         P/NA==
X-Forwarded-Encrypted: i=1; AJvYcCXdgXJt1FCFRI7yZq83cH6evuwIk40pwmrR7OO2DCyyTmPNL+ARj9gu4z57kCihFyosI8YFXSqIVS4heg==@linaro.org
X-Gm-Message-State: AOJu0YzyTYEPEDYyIYKhro8eeiE72rOpRLtyxPdGcW02ifzaUmVpe2Pz
	9UQTfBtBnkTGAAQkLweZQ/ipRiRxe9KQl4ZGJSkv8Eekw0n1kQ/QJMw/k48ts9S+vanfLg==
X-Gm-Gg: ASbGncsr0DobldELZv/P+jb5bRmTxoVyCovd95YwCGNoTL3HP2ZC9KNXUZgQbJpMPVf
	KTXdqr1K7Iotpp4gHwa2I2vgN5nTjw9otooDQAP8lSSHXKiulCwmppltoGbBsOcitg0ByGJfUs0
	HDJ7Qh3oVWZza22Dd6CjiGX5P8KTkXlgsK9l/fWeOa2McZSWE9YQiVLu48UfoFAv/kMFXs2BPf8
	zj6qKhB7wJJ7RiSpX9dD0v421VMrqvGpq8eo7pfX0pwruD8sjKeQcdG255wtcFTeXregOYeC2mT
	ZhMaaQq8YUkiZ8f5Ir6ankKme+fiVFEg4VwWCuuJPsmgfqyIWkbxRq8o7PlraquDpBWPRnyo4Z+
	0Z+EpU0vV28UHSvyzb/Nt9jKYbR2WhzaEPwx8
X-Google-Smtp-Source: AGHT+IFwQfth961QDPwmcQSOPunexZxZtRH6B1UX0+3skNQVMIAOIVx+CTDwFZCmfuogwrFQqEjVTQ==
X-Received: by 2002:a05:600c:1c28:b0:442:ccf0:41e6 with SMTP id 5b1f17b1804b1-453656c2172mr118658905e9.3.1750681199364;
        Mon, 23 Jun 2025 05:19:59 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e983a4bsm143750295e9.13.2025.06.23.05.19.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 14/26] accel: Keep reference to AccelOpsClass in AccelClass
Date: Mon, 23 Jun 2025 14:18:33 +0200
Message-ID: <20250623121845.7214-15-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XLqx4HwHxuwp

Allow dereferencing AccelOpsClass outside of accel/accel-system.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/accel.h       | 3 +++
 include/system/accel-ops.h | 3 ++-
 accel/accel-common.c       | 1 +
 accel/accel-system.c       | 3 ++-
 accel/tcg/tcg-accel-ops.c  | 4 +++-
 5 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index fbd3d897fef..9dea3145429 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -37,6 +37,9 @@ typedef struct AccelClass {
     /*< public >*/
 
     const char *name;
+    /* Cached by accel_init_ops_interfaces() when created */
+    AccelOpsClass *ops;
+
     int (*init_machine)(MachineState *ms);
     bool (*cpu_common_realize)(CPUState *cpu, Error **errp);
     void (*cpu_common_unrealize)(CPUState *cpu);
diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 4c99d25aeff..44b37592d02 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -10,6 +10,7 @@
 #ifndef ACCEL_OPS_H
 #define ACCEL_OPS_H
 
+#include "qemu/accel.h"
 #include "exec/vaddr.h"
 #include "qom/object.h"
 
@@ -31,7 +32,7 @@ struct AccelOpsClass {
     /*< public >*/
 
     /* initialization function called when accel is chosen */
-    void (*ops_init)(AccelOpsClass *ops);
+    void (*ops_init)(AccelClass *ac);
 
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 4894b98d64a..56d88940f92 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "qemu/accel.h"
 #include "qemu/target-info.h"
+#include "system/accel-ops.h"
 #include "accel/accel-cpu.h"
 #include "accel-internal.h"
 
diff --git a/accel/accel-system.c b/accel/accel-system.c
index a0f562ae9ff..64bc991b1ce 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -85,8 +85,9 @@ void accel_init_ops_interfaces(AccelClass *ac)
      * non-NULL create_vcpu_thread operation.
      */
     ops = ACCEL_OPS_CLASS(oc);
+    ac->ops = ops;
     if (ops->ops_init) {
-        ops->ops_init(ops);
+        ops->ops_init(ac);
     }
     cpus_register_accel(ops);
 }
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index b24d6a75625..da2e22a7dff 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -198,8 +198,10 @@ static inline void tcg_remove_all_breakpoints(CPUState *cpu)
     cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
 
-static void tcg_accel_ops_init(AccelOpsClass *ops)
+static void tcg_accel_ops_init(AccelClass *ac)
 {
+    AccelOpsClass *ops = ac->ops;
+
     if (qemu_tcg_mttcg_enabled()) {
         ops->create_vcpu_thread = mttcg_start_vcpu_thread;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
-- 
2.49.0
