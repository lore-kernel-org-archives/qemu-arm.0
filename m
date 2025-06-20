Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877595njc;
        Fri, 20 Jun 2025 06:07:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9K91Z5BS5Zkx6NR8gSvCqgfSzjtq6xrz0eyNKAcvYMP0ile5YjI60iVRs6ySLznzfbsRHdojStkS2GA==@linaro.org
X-Received: by 2002:a05:600c:840f:b0:442:dc6f:7a21 with SMTP id 5b1f17b1804b1-453653cf3b8mr25422495e9.3.1750424871582;
        Fri, 20 Jun 2025 06:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424871; cv=none;
        d=google.com; s=arc-20240605;
        b=ampo6MigLKbfIwnxzuT2X9KpNi8pnqU9sz4mgM9EL7iyAeoqDeCluTW6sx9c7labAa
         fV9AhAGmIWA2aaPR6xuMhiQ3ke3xzEMSQjEiNBJ51J+FtFGofvYCmaUkyc+sHyfxFud7
         Hr3dvLHBT94lN844U+gb1/K5S9KMPXxdfp17R5TYZzVSLWp5chnujYURLdd2WkFz1zBe
         79gIc0HEokqHdsk4ZWu2LhAuiC1n5Oyn+ak+F4gDVHnjgvpvS5TyMO+I+ehG6CUbomF1
         a5VLzA4Wsr9HVdq1sGxd9kkw+Kt994V5EPPiYJX8DGrjqXtNiSQVN2GVABlOc58cgsqo
         Q5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q43gncpn959Q6vZG2TfwFzrP1CTDyk3SKCOoBpm/1fs=;
        fh=lSMKfr34qV7QycKP18sQQ6GzmgQgOYjWs7HCpBR6Gg0=;
        b=Fb3xaUfCvk3tfT0aDledu3hKa3DJwqDiFZCtdsPuZVSn8QMVEn5cSp2FMIXtr7qRLA
         Z26ynHWTyffeoKv5h/rZkRoTYvxAXG6IVDnUqptsUhNBAx7IkzR5tRvyetebbH5pMAoC
         4ntuKftMWPs6XlqnMK+dLZOSrh+4Ol60ESboCntFHmN390YidgJgcAbJcWnQY5sIxpiv
         /06wX9v12GfAeGHS/7neWAYENLlXE8Wy2gMqDgiT4bbco2uARlVPrcSS7WxDM8le/X8x
         hIVBxzjUgkyFX2wJs+ASQt5zO8a5iy8FTBckaOOucAzKNFFJneGmpIrm4Xh1YV0sUhZF
         IgkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kvorARAU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453656c3689sor5832775e9.0.2025.06.20.06.07.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kvorARAU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424871; x=1751029671; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q43gncpn959Q6vZG2TfwFzrP1CTDyk3SKCOoBpm/1fs=;
        b=kvorARAUHloQklDik64MSsoKZ+HM7yyllTMBVWYZZ84ICRaRGm5ly2Z2vyreoAiCcF
         UKsaFr1lr9zdSPjT1tntq3elVE9o8SjCqsXAjhzvj4D9C1J2AhOWuUhk4sRW37plmxtc
         CwhyqMMNKxzg3qQ1xfIrbLqc0VHjFRQaFALcuKzs1XIxn2I4uLAvzThGR6eFh1xQkzwe
         cJ2VatWA2OvQ1yJPRF1KwiR5VdyLrF97wWBrh9jddmLtKOfXdQhCsPqvBb/IxBwsJkei
         cDDxiCDAzo7SCA9ZurD6LI6EI1+XVoaks/K3jEGM3DtfyceHnlSItvycpQgahfXtZ1Dc
         Ca2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424871; x=1751029671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q43gncpn959Q6vZG2TfwFzrP1CTDyk3SKCOoBpm/1fs=;
        b=SW9oKgZRbkOIfqoM1kBuJ7u0s85sM7seoIe9iO9tV8jueQMLa/nCOCf6L0K67H1Z4i
         l3MQ9Tl9EQaBtbI9Ea/o8xVkFDrlW+fHl6dHs4rNpGCcF9J54gmFUmX13hcV4co5Ux9F
         au5OI3TYmE4yltdlwzybGYpg4bCPYxX5DyKKVhZD9Px8bRKkIUhg6myR6v8EUH5eEhG5
         G3SO4ylNZY8xPE2ICglJOu8dKPkeKxfkli686x8J0AIf8IbFfjaXq2U8h+7w9pi2wzQG
         u1KL7iqIG/LCQqPkENMv9agDBVF50AqmFIR+bWJwTsDduIT3fvuDyQk0pvhOKMIi9Uof
         UfQw==
X-Forwarded-Encrypted: i=1; AJvYcCW0CSI8hkzLZvVg94TcY9f0eGYa/W3NHIfX9Nnj0TuZmSS/wCVRGkoiiLbHTd6rmu6BSFP7BQ3yGyq6Rw==@linaro.org
X-Gm-Message-State: AOJu0YyK/TvcywG2p901VdrGNw3UFiPvNx3y1+wmK/cFuFnS+wPGBy4l
	o0JnfEcovmzlRihYmODurUwYQZLL/DkBb9+4Jmfd52Jp9cRe2BGJSnimV2zsfxjuDHItwA==
X-Gm-Gg: ASbGncs/paHmHzuXABt25z8VdE3hzhbsJrQTLqSHcfN2g6uEEl9HnhCkL3tv/APDOov
	RcqT/nv+RU3j73Nxch41L8w93c+4OTxmvmos2IhRiNu9YcTP0BAViLVHzkoXV43EuvJN5DDo+UN
	mRp2jbdi+/sIGz5aDa25ekFsNE2SXu+oWncFaGPL1r9G4P07qNdO+aH+bturA4KJ5z+QdzdaCOL
	BtzKO5rkl2ztf+4etYLqx7oYDTdUXfims7ndd4uWDdpLpaWNH9Ttnbx5w+y3p/Hb7JV91KSIs10
	uyqMUB02efvjp9FFVc6/h/D885PbjL5d4/a+M9SWSVw9Xzck/2NtMhppYorkj3Am1D9XuBnIF6W
	KF9mU629S+mQ96hmTWDxn7SuGGboDpC3uL855
X-Google-Smtp-Source: AGHT+IEV1rnW6Q6vc9usSp2h/xg/oNVsZIj/bM4fFPHRe8OtleGcivh/UCl8l6pejkhU6VSf44Ctdg==
X-Received: by 2002:a05:600c:3545:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-453654cc009mr23346725e9.8.1750424870729;
        Fri, 20 Jun 2025 06:07:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117e520sm2053595f8f.56.2025.06.20.06.07.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:07:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 07/26] accel/hvf: Trace VM memory mapping
Date: Fri, 20 Jun 2025 15:06:50 +0200
Message-ID: <20250620130709.31073-8-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pk/edxVTqy5E

Trace memory mapped / unmapped in the guest.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build               | 1 +
 accel/hvf/trace.h         | 2 ++
 accel/hvf/hvf-accel-ops.c | 6 ++++++
 accel/hvf/trace-events    | 7 +++++++
 4 files changed, 16 insertions(+)
 create mode 100644 accel/hvf/trace.h
 create mode 100644 accel/hvf/trace-events

diff --git a/meson.build b/meson.build
index 34729c2a3dd..5004678a26b 100644
--- a/meson.build
+++ b/meson.build
@@ -3633,6 +3633,7 @@ if have_block
 endif
 if have_system
   trace_events_subdirs += [
+    'accel/hvf',
     'accel/kvm',
     'audio',
     'backends',
diff --git a/accel/hvf/trace.h b/accel/hvf/trace.h
new file mode 100644
index 00000000000..83a1883343a
--- /dev/null
+++ b/accel/hvf/trace.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include "trace/trace-accel_hvf.h"
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d60446b85b8..b38977207d2 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -59,6 +59,7 @@
 #include "system/hvf_int.h"
 #include "system/runstate.h"
 #include "qemu/guest-random.h"
+#include "trace.h"
 
 HVFState *hvf_state;
 
@@ -97,6 +98,7 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
     if (macslot->present) {
         if (macslot->size != slot->size) {
             macslot->present = 0;
+            trace_hvf_vm_unmap(macslot->gpa_start, macslot->size);
             ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
             assert_hvf_ok(ret);
         }
@@ -109,6 +111,10 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
     macslot->present = 1;
     macslot->gpa_start = slot->start;
     macslot->size = slot->size;
+    trace_hvf_vm_map(slot->start, slot->size, slot->mem, flags,
+                     flags & HV_MEMORY_READ ?  'R' : '-',
+                     flags & HV_MEMORY_WRITE ? 'W' : '-',
+                     flags & HV_MEMORY_EXEC ?  'E' : '-');
     ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);
     assert_hvf_ok(ret);
     return 0;
diff --git a/accel/hvf/trace-events b/accel/hvf/trace-events
new file mode 100644
index 00000000000..2fd3e127c74
--- /dev/null
+++ b/accel/hvf/trace-events
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# See docs/devel/tracing.rst for syntax documentation.
+
+# hvf-accel-ops.c
+hvf_vm_map(uint64_t paddr, uint64_t size, void *vaddr, uint8_t flags, const char r, const char w, const char e) "paddr:0x%016"PRIx64" size:0x%08"PRIx64" vaddr:%p flags:0x%02x/%c%c%c"
+hvf_vm_unmap(uint64_t paddr, uint64_t size) "paddr:0x%016"PRIx64" size:0x%08"PRIx64
-- 
2.49.0
