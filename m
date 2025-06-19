Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp253053njc;
        Thu, 19 Jun 2025 06:14:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX23yRneqGuvgnri7oaSFjYi/FLfjzzC3yIR3bmVItVLOwD6GpGzWDjcDbQLpfwr6lHYzPDfpE6MwZf/g==@linaro.org
X-Received: by 2002:a05:6000:2b08:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3a6c9618e54mr2216926f8f.0.1750338867162;
        Thu, 19 Jun 2025 06:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338867; cv=none;
        d=google.com; s=arc-20240605;
        b=KWvE7y1Mur568Xcu+Y+hH3CDzxrKvpIF7Q/Zhww5NGkMO+DA2Nbz8ENqFljNZOoncS
         rvYHyvCL4TLxkAIRXVR4NdtwMQzX7W+j63w2NF+W4Oipmqct89W4Akw8X15FZmf7Ed31
         C9C9Iel5sVAz5HS16M1KdEurIQ/+OpACI895yZP279CX2JVB3qfeW4ZUdoq4wNOCcCd/
         LlVusTrqTM/y2jZ1NHKthFwrcOQOHpWa7Z7ZgdsXQ/+i08XMmofncM20KpGHMfidy946
         2KU9eRXN1ZaqcHWwYJqMl/7TyY1sR+lN6KIKj2w0k4r+dtNldH1PsKptScpfBb9KiYDb
         3rpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FOQFF5IHVggEpZxvhH4Dg2y5NDppFE2+idPk4kXeUTw=;
        fh=HJVCfl3cz7ITr7SZpmiY/HlH52rst30Zj3vElQ+ElgA=;
        b=YAMT+DpoXoBBOPPcI1cxCNTBSEKhcolY94ujc1JfYKaKs4t0Vo1QwfylfdaTeBWIsk
         dIxrjrqTdo3qKp1kkzV4A9mtnM4D13NK7KBGaZr16BJj+8NI6TSWSFFOF1kj2hHPPtSv
         c+i38cFHPRlQXMf7lG5WS56BCA+WwlglQvCZoS5f15mRFn6oTw0um3qSMqjEGcFzsz0Z
         OihNi1zNbDa2hD0hplv/rtKGwOKav51r+2OYJKIG0/2Fqo+33t6PXsPUtwrFcWN69rtC
         PR0G4btBWi251cXE2Zej1LqmudAeVkmGangHMXdk4OchJOKdV3RcKC2HLXODH/i4oXTE
         FUwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ce5m6eqq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4535e74268dsor6086615e9.0.2025.06.19.06.14.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ce5m6eqq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338866; x=1750943666; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOQFF5IHVggEpZxvhH4Dg2y5NDppFE2+idPk4kXeUTw=;
        b=ce5m6eqqj2aYmUMRwU6csh8DhcYIyXNB4Z2vNjNDJtQA7JW7wQq2+lSFw1j7ek2cCa
         rJm4vflkQF7js0NijHxG52p+w3sIHfK5JQ9K4iEmpGecoAUclFxV3oIwhrqlucJ68hux
         gGf8EOiEPJdVhPMY0nfIVFmddi59e9HxOLCT43CPMzW8YMYbPFmkMXDW2g25W9ZuX85E
         2OlurU82emZcd1gHR3LVQ2UCvdbP/Nw9zghE2xv/Mo4NYdZmVyEI1At9SFeoZvUbnRNe
         pnTsXJ/q5Ek2/czy3wFDqWBRZkEA56vU0FZCKpaHs4hierP+RcaCyxUUDOpXwzFzQYbk
         7TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338866; x=1750943666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOQFF5IHVggEpZxvhH4Dg2y5NDppFE2+idPk4kXeUTw=;
        b=YfsRdmUPdNBdCOFFj7pz62rfY1SN3pDsNx8qkGI8mKo4yRyIDWJQZ0gF3pH5JWIBZU
         MKkMsgPctIfhlW7q+2Shw+b9TRi2vRrvQoX7W0Zr1yGbvsWq1za9Ipl+jjoUR3dlRE3k
         tF7FKuYEe0miy0U7oXqi74n6galx5kKTSW8Vvj0HkWRgtdq52KsphKTSkcEu2zjz+jyw
         msoCMdVXq03DCOhD7HTLNfp0MW9GpKzFm7vA3pyDwqcmdnQvOthvagjbokByZgwnpEPw
         Iy3XY3q96M86zkVWCc4lLCzTz8clxHMTOBPNKViMIsRdIJBcbRmkpItsH4NOFsPOhb/9
         kSaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV76nAVCv2PpNg8sOv/z6+6+PYoE1MgxymVcjrCCYr61tdhzj4evnS+VoLgVKyrPLSHPLd5cUglOwhibw==@linaro.org
X-Gm-Message-State: AOJu0YwDfB3BM8NnU7arTByF8m4NIal5eHgii+yrLiSIh4Bd6C1WlcLc
	qCQkmZZ0SEznFvH9iIH+cKmsJCUBgHdinhDrvnaD/ZG0UKtDQ/cQJ1PiKMr0Yg+30ILUNA==
X-Gm-Gg: ASbGncvvavt+DqgXOZTE3AWDZjuRzbTcUaTuqQPRUBGiSqbF4no8HLtO4Su8vuOpecV
	dNEo9B7Jigo+GD1lUueLXM7jgRYKguxZTVegJLZLZE1pNBrLUlIc2vxenpECizwS7iCqKoeT19E
	Zh9D78Atz1r51M8EV9TUAK0NFQ+K7WHGLgrMcKQ543wNt/Qty9GC5KGk2OdcWRmC/rKjLpFrIQv
	6uXVBcfJ0rdalRm7U23NGXxjwUzay8av2qnliX52on2a5pNx//ftKMFOxKi1ck9yRcmD+wq/TBc
	mTF7wGOd9cN6lJHQWgG9MbbYk8NAo64+4EzuBStmip9mn0b1XwI55bvqMokWcWhcuo1gWpfZYnu
	P/DaR+pnd5turrjCkGwjVFTK+EYLTEjnWRoLJ
X-Google-Smtp-Source: AGHT+IEKAPBge8NVooEgnnBCRSTl7DwqXrW7+BrRtP165DuwJl3JVN8xsSMQZ37LDKLlIe59+hrX4g==
X-Received: by 2002:a05:600c:6388:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-4535fd55e92mr22427315e9.0.1750338866441;
        Thu, 19 Jun 2025 06:14:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97ab95sm29168365e9.7.2025.06.19.06.14.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 12/20] accel: Keep reference to AccelOpsClass in AccelClass
Date: Thu, 19 Jun 2025 15:13:11 +0200
Message-ID: <20250619131319.47301-13-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QFnXj3FQlWyY

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
