Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509482dyb;
        Mon, 23 Jun 2025 05:19:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXB0XYYt3E35ruBK+iUXQ5xn0J8uzz6Suq5ryRk4729UySmy/BqBAyjLAy/krbT6HiLQ1hWBcpjfC+DTQ==@linaro.org
X-Received: by 2002:a05:600c:620c:b0:453:cd0:903c with SMTP id 5b1f17b1804b1-4536bf3e60cmr66178875e9.2.1750681164486;
        Mon, 23 Jun 2025 05:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681164; cv=none;
        d=google.com; s=arc-20240605;
        b=LYqbaRfTTA1+uESVLpxfFPFCvCCyjEkQk6D7F+JD/4SOy+uoU9+rP3q/zWh7jgVlTg
         EIVq1awqPT8ps6bh6RXddE1T1Tq5vfWHQ7zDtYFlGmcmyJdi8L+Hbd8Pm9RMAps2QB0D
         vCtnnOi/fF6HQBlECCL1iPi0HKy1Hr3iBqxJMLEzM5FO0bi7/FRwzYwUDern94GQVmfR
         IeQX3WIEMJs01AQkZ+oqldQIzVK9cQ/n4WlA4UAK4xHCa08EFO74Q6eQ9oaF1l0muenK
         2nVHJ7Vq/PyPb6G4nVffP7t9nQvVPSm7GBNJrBhJkjnC9GC4v2xa4rULI3QxZp0dKomz
         bubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GyiBFk3PHsFTGgxQWIJAhORaZcy53iNw0vUcB4RUUDE=;
        fh=SYm1qJ/i8GeQH/ODV6U+5r9mNLjF61yuMsOb2LVgAFA=;
        b=RgUJ3mnnYxmY6ZpEmoAB+VkBYIeniTW9Fd0K6NBng84EMskMo13GQhNYYFAqiclLNy
         NblqKdUQiE2M+ARludTElXQNdbPQz77tkcFVLHPaiwypQLLlI/CAvqmfvVCgjjdiAwDn
         8m/Zz9moAFag8JdhJtYAnqvyXtkHu5W2OMhUQfUZlG23xsH0zq7OmBxR+FVIY0OhVXEf
         P7uXuYYODd6614YS1KQlRbZ7Hxoqoohn1G9mMvtn0ARZSMW/O0DM+Wp8ge1m0hGlORVy
         g34n0w/TnPDrZyiO35rFliisxj3m5IxLAfWZTQ1jplsjKc9qlVmDU4ZWDmZeTr3yvUvT
         y4aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ycpwxtf9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646d895dsor24223105e9.3.2025.06.23.05.19.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ycpwxtf9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681164; x=1751285964; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyiBFk3PHsFTGgxQWIJAhORaZcy53iNw0vUcB4RUUDE=;
        b=ycpwxtf9pecK9j7dfrwAlYm3/JXpvwCUlPX8HPGaZc0j3rVIvsZJmRT2cxCidbLEI9
         SAfLA6S+z8HzAaw5ptO2rS6+283QIpNdeuA7um5nYbCGA0I+ZlXL+Migp7Q/tubpaspB
         ziNS6CTzwL+HvmuTPtyg38A5CC6R20AiTEXZoiDXp8Dv9AcgBd1dD9bhhrfnwegnWWfo
         bqokVLjidCv7/3eAU4AsB1rY3TsPp8fLVMY6oC6Vnd/DOAtX6eDgq5AEjoc/ygqe09AR
         ZPipo8hJ6bWDkWaPmvu7HVx4qapBiMwIuffzr0LhTQmyyI76pMFprVmLKxGgDcV8Otuz
         lyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681164; x=1751285964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyiBFk3PHsFTGgxQWIJAhORaZcy53iNw0vUcB4RUUDE=;
        b=ou7hkJi7xTmLFlY+H1nAXs5CxFr80CyrwXN40kCY3WZw0bBuFYBSKRap3iKYZXmjHA
         vrZH+K3htV0BajjFlfkkZm2uRpMxdA2ohWMDKYnqAil66T1vR46izKsWGYerdGoi2/Vh
         TWiIJS0utlhs7ZqRjbXtHpCsxDuleKS7DpljDimvTwsjc4+Ft+uCXTmtrocOWLCXI3hd
         qSu6aL5XkRfUPehZCwcUFwjjkY6MHlbU23gNAldhPQqKQxiBS3RRfZK/pNRfPBVed8f4
         Twj43xr8HinyE5mUz+LcSGwwlBVZ2Yj+faunVlqXFjfb1xAqKCxK3mceuCKK8f2O6WVG
         h1fA==
X-Forwarded-Encrypted: i=1; AJvYcCUblKjB6/p2ttfZM2OsWpwvkO224VFIV2s8rxNb5jrOSJlmjeO4X296TiTlEsavsQ/QSuhvldFu4AoZCA==@linaro.org
X-Gm-Message-State: AOJu0Yz+ZjliIjzQcD/hwpiAiPxlnZVzUvSEiqQv0vh2kZB6fqnMxq/j
	Biov3E1QkGON3q6tRcGkaoir5xNqLODZhD9/WF6J3LGnV7A/cKSj9s5PXtgEL3KCYgqYgA==
X-Gm-Gg: ASbGncuYunYwFK8VHrB8DBpP68jMWBPCijXzDNK35Hg+o7WtsjfNFBZLXE5D6HJ6RXP
	UPHA3Z0wIgePt4YLswkn6HHhk3GSleZB+okgnnb3osOxJrkMAPfM4BW+oFszlK/McKaF9KpRUi+
	vICnYVMvQr1oW031KaIFu7/Hk0bq43+lAMOsznY4ps9eyJlQd6xqKk7cTc0+wPWoQ9aXnvJJPZx
	ajJYnRkqQKQObRqpNVWgFmyM1baNt3rwyc+7j6Wvmok6VrWjGGWC1493YEkSDq4cuwXwx+hFwaR
	iFxwZuI6KGcESG/3z3y2MyMIcfcEjoZGNfAglICF1L4hFd4zjuaXcDW8Zs85OrDW36Re9wnhmHo
	SgN/bei5aRvsqKWLpCCIUaced1Og9W9dAxT8E
X-Google-Smtp-Source: AGHT+IE/ShLC0BNfarjCGNMSpPGAS0rfS+vL7cCj12GXMkaCbIYQsstL056tugsSAblfUqd+SodRWA==
X-Received: by 2002:a05:6000:38e:b0:3a4:fc37:70e4 with SMTP id ffacd0b85a97d-3a6d1331ec7mr9866453f8f.58.1750681163851;
        Mon, 23 Jun 2025 05:19:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eada7adsm144615895e9.35.2025.06.23.05.19.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:23 -0700 (PDT)
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
Subject: [PATCH v3 07/26] accel/hvf: Trace VM memory mapping
Date: Mon, 23 Jun 2025 14:18:26 +0200
Message-ID: <20250623121845.7214-8-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qMt2A6Dx2pLp

Trace memory mapped / unmapped in the guest.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
