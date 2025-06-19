Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252787njc;
        Thu, 19 Jun 2025 06:14:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVklmAvYtazWGlb5CHixte5/E1ZRHuisWLa+HawTaCLKVwrh/FG9uQxYdYIGh3nDWzqLH2cTSQmhd+okQ==@linaro.org
X-Received: by 2002:a05:6000:71c:b0:3a4:dc80:b932 with SMTP id ffacd0b85a97d-3a572367dd8mr14807680f8f.8.1750338840929;
        Thu, 19 Jun 2025 06:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338840; cv=none;
        d=google.com; s=arc-20240605;
        b=EKzkXfLozJsW6JppuvgclHwna+L0radKKmFDhvGavf41rxE/FYFMZcyWN3ezLH3uU9
         H4sqTzJKzxopaWsSQC1waaKKJnt3dLgFgZ3tyvoQX0LfmYxMR93AFiiAQipqUEjIyK0m
         89NNXTn8lmBFDXDQXR8FzqkD0esFY/8oiV5EeG4s53kkqd+lZ28Zjq7eMpzHSX9RCOMh
         i4Kaz5QcK/ZvoHEQLsz+AYT1lthlUW7K8RzyS/Rc6vD21U28eqX2kNMXvE7nxSIIHvJx
         7OKsMBRgj2RNXWVBN+cMwuDwHqrJkjdETtqxkZuiu5ozcbaIr/2CzG/ZcA6p5hMFCBGL
         b/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zHGHBjHnm08XY2FWC1TeHuwJJyw8Eo3SwtB3aTyB57o=;
        fh=/zY8OA6CNfWpR6/wOZgLZf875gxlkbKM7ip6YvgL2as=;
        b=KfRvDmbWW8WL7KF8uZvoFMuB/80VTE454llPKHxQsRtQ9T6o1IpT0HJFMdV3d8zd4i
         W9xmuGXXGTGx+CsOSCawhXUz/PknTKsFPWjdM/8JfbROYxR3ARHrzfdzX03DC/b0+CST
         1QDDxf5GEOI8fdOPd881A77N7PtP35MuHW908xGTpcJ+fwLUHcjWISHJjo6DCBguPYNj
         dcJwVigIFRjyV7G6a9S7i2tegm+NYqYqeL25gk5yU3w+fHXtYWWZZ6+MFfglag20zQD1
         VkKdPIsBbHPpO7itInEFmvKHQVfnGujzOnbqvQGSv3KoGngKUfZE8fA4hU+7tk7glplz
         yzSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yoRGSeQz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a56aca41d0sor4274636f8f.9.2025.06.19.06.14.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yoRGSeQz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338840; x=1750943640; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHGHBjHnm08XY2FWC1TeHuwJJyw8Eo3SwtB3aTyB57o=;
        b=yoRGSeQzlJSqZRzwdgo9kt3OFxhRTIfy7SO3C0JgWJv7nG+5lZx7F12+rUOO9GCTuI
         VinxlT1rdkKEDJITQSEK8i6Ph3as6oz2n2iESmhw+LLTw8x+fNMXnCv05mVk+xsW+sXO
         tN3tn5D82gcLLOQiGSb3pvb69YuWsL20JPiB8C5tJ9ZE/9GVsWCNU4veZyGpGJqzBLSf
         PzAa9O/nA7fEEfuuHgjttpbj+aEsHLdHdv4TFJ3mUCthppzONoCFh5OTFG45swUgDPKe
         hcpNuGTNPxnTLWWlUxKPmGVjc+GjHmTX5ATQ1TjUGursCtT3MDJQ67GKXr3IQhJPWult
         HYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338840; x=1750943640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHGHBjHnm08XY2FWC1TeHuwJJyw8Eo3SwtB3aTyB57o=;
        b=b2DQ+9eqPYeTT8vDU93oMdfTwFeKTpUUJxBvRCeN/V3/BmLE5UizaZITDtaobsase7
         F/P4w30A8IcvYEPHXPQF9P0N2IvjMOQBqjk6qCHce/y4TKYo09uJqHLo2z/gXR6pOB7b
         qWFIrHMRypImTQ1i13jSmEqGlJWvJdUuH9cP+TBwO7x6q7at04e22ce/w3qYaI5AWHy/
         cWPwLEpPevT7JTY2KwB42TriHVp785dXrEHrbcxI4A2irZilMdympj0O1V4OiJwxa0XA
         bZrqLauud0UGRXfjww64JplNiMFp1Ow5cMT0G+ttipbBfs9xRG0thcdLcPQ2ZNROX7Zg
         mOQw==
X-Forwarded-Encrypted: i=1; AJvYcCXwgAkPO98GM6rYtzO6Wz8sfEvwExh/wJrPqubC3MW9Wve7YKdtP6cyjosVGyUzosPo18ByZ30V29uGIA==@linaro.org
X-Gm-Message-State: AOJu0YyXy+CBxZmH9klGTdnR0dwLgadZm7dwaDAkL/mQjUM/qS/9uMmd
	bzdBv2EffIvv7hdTktiYmtBgCadzMtXZcoDQEqiiBdjB9yMiT8rv5H6yTeS1MhxaYnOu/A==
X-Gm-Gg: ASbGnctMQ1c8IGLX1bWEd+Bgi1ShdkE3sF80P2Z9oUIKI7A/NoxTAdjiIE3UR5DhQIP
	4+WrOhy87GCZK+UWbbgMKT4z/an5T2FWJHg2/EERV4HuTEUAN/4VTyGSqA2XWv/vBrsB7wNsCBr
	Ml2tAciyEv+rCoRsi/F/V3iefrgBVQALckO70wyuVD5Xtk7wGZguTGDYtZ2WTHJ/Dhyg+JHqoRF
	DtsZvpF8e09NCeKPcRHlgFCEXO/+7dfkUjKlGTN6DwsxLkCSUDGk6z6Npgknss0Fs3opis5vZEO
	j0DpHeg3xkuiIj0fwgWQRkeeT1V+3p8rJEJssnoh42HXrme6Viuh5TmHN4JCjqqTUrc7wqM4emc
	vuMMa0TECGe/wBNd+b/sDXRZ0iUp8iG34KJbl
X-Google-Smtp-Source: AGHT+IH0dt4iGJr6FYYNqBSMaXpFrU7CwfQvkc2Mt1yc9XX3BrxWP2rVzSQNRIHBHoy4vELO8HZkLA==
X-Received: by 2002:a5d:5849:0:b0:3a4:dfc2:2a3e with SMTP id ffacd0b85a97d-3a5723aeb2cmr17281843f8f.39.1750338840330;
        Thu, 19 Jun 2025 06:14:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a547ecsm19782672f8f.17.2025.06.19.06.13.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:13:59 -0700 (PDT)
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
Subject: [PATCH 07/20] accel/hvf: Trace VM memory mapping
Date: Thu, 19 Jun 2025 15:13:06 +0200
Message-ID: <20250619131319.47301-8-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wC3FKP0Ikef4

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
index 00000000000..3c11f69f305
--- /dev/null
+++ b/accel/hvf/trace-events
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# See docs/devel/tracing.rst for syntax documentation.
+
+# hvf-accel-ops.c
+hvf_vm_map(uint64_t paddr, uint64_t size, void *vaddr, uint8_t flags, const char r, const char w, const char e) "paddr:0x%016llx size:0x%08llx vaddr:%p flags:0x%02x/%c%c%c"
+hvf_vm_unmap(uint64_t paddr, uint64_t size) "paddr:0x%016llx size:0x%08llx"
-- 
2.49.0
