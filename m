Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2514000ejb;
        Wed, 4 Oct 2023 02:07:15 -0700 (PDT)
X-Received: by 2002:a05:600c:b91:b0:406:84cb:b014 with SMTP id fl17-20020a05600c0b9100b0040684cbb014mr977700wmb.22.1696410434737;
        Wed, 04 Oct 2023 02:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696410434; cv=none;
        d=google.com; s=arc-20160816;
        b=CeoCLWpm1tuvMbyXvs6Twz6fltoBeRy/oyS4Jt861Q9yE1/O/M+CD5Y1rvzYIeCKUt
         p/pZ2jA8SjlsK7Gpfw3Oy0QgEksBv89SOgxK4hX9BehkeHXMR7R9pIVNz1GHNIcowL3a
         Mga+ycZwp9oeOYzXYjFlVDwg8jKMDtSQmrvVfLlGQGyxTR6s6zSc7X3lsgjclRfHGo1W
         yN13fHgbeEBxW8gfPIJc/KvHDelmn7sKChw+bTxjacSpNJjNzC8ozTnaVQlWeZCdGD+v
         kE2vdMpsNdKqp8Lklj/eh7L3ezfWM3JqecrRPcgauhUnfdIwwHxfIP+HaUKtRoXckPuI
         9xMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vrY11rg/jZ5eShwKyE6eTnfciSU2dmuT97v3/Q0zg28=;
        fh=b8MHpxiFyRrsvNZAFZ7SVNj4/Ns7vOfJPXfRgQX3wJI=;
        b=Cm9uoire9WFwqh2lRFugt1rqaLEAZ3vC1wpDxkjKvvAxAwIJHAuAdT6CUVR9NTy1Zk
         usFnAXnZkHU0tNV+twNiP6yPlY0o2uka+dJHgIpVmn+ARGwFn9h8Rzd+yKgOOtLzjfLI
         LZBpZ5i/o2oJa/D8P2pthDRi+e1q8KE4kkWl+V7iaBSDfRZRCfHfoCODHKWSp1bWKh8K
         xSDESA/JMuBnhFzIqCkzSJgQM13L+8C45iIi5jk0xprEMIli7TXk95GjxYPeatbrYQLZ
         KCM9H4i+VLL7Ma81rBB76M1w/LhzRs7167SpdEE2HHJ4CfqYWEABvxJAm/4x0aAVvKcw
         ygpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CNEi7Oku;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l18-20020a1c7912000000b003fc055c4406sor1251025wme.5.2023.10.04.02.07.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Oct 2023 02:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CNEi7Oku;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696410434; x=1697015234; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrY11rg/jZ5eShwKyE6eTnfciSU2dmuT97v3/Q0zg28=;
        b=CNEi7OkuBDmtztA9AiioXRNgNlCUZCgfY/7VXAwF1E7uqWrBtWDw7HnumZMuNgMa3u
         wt5ert8aNdwSGy9cyVw9YoV+1+ddWBTmY25UB2A2YMCqe9UX5/EoLYAJhpvWfCXTtLlj
         LSjuwqxprz16LJkGDpdAYIel8f4idRxpayurn6a8Q/yuWSBbSdE9vYuMrgIoLWg6I7yb
         B9V/DQ5z3AZk9gY4FuBXhSL2jhNMkzp/D2NhUis/RRtHadeVTs4jIhvk0W5WTnI6j2UO
         NAfQJL7w7tAPf4MxFGqceePyXwlMag8UrVqml/jtRkJN198fhQXXCOs7naBsnwgNODEv
         Hy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696410434; x=1697015234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrY11rg/jZ5eShwKyE6eTnfciSU2dmuT97v3/Q0zg28=;
        b=V/KD+m/QfvS6X1qPaaoeQ8uCjgtGpSwiFKlYzjhrXWJ7CNqhwtSuWa5EHR2GeVlUH7
         VIMIQpztn/Roba3I8FrN2KszvjvDjT0yKjCkkTxQgD+T9Lg6vL52z41bzNeBxxIh4EIM
         vF/nVuPtbiJRu04v5UN0TI80cddvdethiq0fwFpbFchvkYRLu3wf4fClDjwGwRPdFS/j
         +oeue/4FCht3YRynjqGE4svpwG+6cHjY5zueUO/QZAc+Bqxhg0XYS/NL63BRKcCuB8zC
         +iN6cjM97I4tj65QMSH4xpNw9K8xWR/yp8N8CgSzvELNcjZwTZZxlUgqLW3e/Dmt0QHU
         pEdA==
X-Gm-Message-State: AOJu0YyYWyRPOyAJb3jal7Siy/XiR0giB1X3njfBq+b03a2ORLSgCTnX
	LRZmSKiSXdcHhJhUxSIGcnT9cLwg
X-Google-Smtp-Source: AGHT+IEo3i5t3ywTnsAD3IqdOPk4VbswRvct7A7kOK1jLTs7AhjTgC3fKHQKkeIpskcrxVRI13CX+Q==
X-Received: by 2002:a7b:c41a:0:b0:401:b2c7:349b with SMTP id k26-20020a7bc41a000000b00401b2c7349bmr1848081wmi.7.1696410434343;
        Wed, 04 Oct 2023 02:07:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr. [176.173.163.52])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b00323384e04e8sm3475947wru.111.2023.10.04.02.07.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Oct 2023 02:07:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 07/13] gdbstub: Rename 'softmmu' -> 'system'
Date: Wed,  4 Oct 2023 11:06:22 +0200
Message-ID: <20231004090629.37473-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nyN60Y1DTkLa

We have gdbstub/user.c for user emulation code,
use gdbstub/system.c for system emulation part.

Rename s/softmmu/system/ in meson and few comments.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 gdbstub/internals.h             |  4 ++--
 gdbstub/{softmmu.c => system.c} |  2 +-
 gdbstub/meson.build             | 10 +++++-----
 gdbstub/trace-events            |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename gdbstub/{softmmu.c => system.c} (99%)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index fee243081f..f7fd1bede5 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -103,7 +103,7 @@ static inline int tohex(int v)
 }
 
 /*
- * Connection helpers for both softmmu and user backends
+ * Connection helpers for both system and user backends
  */
 
 void gdb_put_strbuf(void);
@@ -229,7 +229,7 @@ void gdb_breakpoint_remove_all(CPUState *cs);
  * @is_write: is it a write operation
  *
  * This function is specialised depending on the mode we are running
- * in. For softmmu guests we can switch the interpretation of the
+ * in. For system guests we can switch the interpretation of the
  * address to a physical address.
  */
 int gdb_target_memory_rw_debug(CPUState *cs, hwaddr addr,
diff --git a/gdbstub/softmmu.c b/gdbstub/system.c
similarity index 99%
rename from gdbstub/softmmu.c
rename to gdbstub/system.c
index 9f0b8b5497..189975b1d6 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/system.c
@@ -104,7 +104,7 @@ static void gdb_chr_event(void *opaque, QEMUChrEvent event)
 }
 
 /*
- * In softmmu mode we stop the VM and wait to send the syscall packet
+ * In system-mode we stop the VM and wait to send the syscall packet
  * until notification that the CPU has stopped. This must be done
  * because if the packet is sent now the reply from the syscall
  * request could be received while the CPU is still in the running
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index a5a1f4e433..e5bccba34e 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -1,6 +1,6 @@
 #
 # The main gdbstub still relies on per-build definitions of various
-# types. The bits pushed to softmmu/user.c try to use guest agnostic
+# types. The bits pushed to system/user.c try to use guest agnostic
 # types such as hwaddr.
 #
 
@@ -12,7 +12,7 @@ gdb_system_ss = ss.source_set()
 
 # We build two versions of gdbstub, one for each mode
 gdb_user_ss.add(files('gdbstub.c', 'user.c'))
-gdb_system_ss.add(files('gdbstub.c', 'softmmu.c'))
+gdb_system_ss.add(files('gdbstub.c', 'system.c'))
 
 gdb_user_ss = gdb_user_ss.apply(config_targetos, strict: false)
 gdb_system_ss = gdb_system_ss.apply(config_targetos, strict: false)
@@ -23,15 +23,15 @@ libgdb_user = static_library('gdb_user',
                              c_args: '-DCONFIG_USER_ONLY',
                              build_by_default: false)
 
-libgdb_softmmu = static_library('gdb_softmmu',
+libgdb_system = static_library('gdb_system',
                                 gdb_system_ss.sources() + genh,
                                 name_suffix: 'fa',
                                 build_by_default: false)
 
 gdb_user = declare_dependency(link_whole: libgdb_user)
 user_ss.add(gdb_user)
-gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
-system_ss.add(gdb_softmmu)
+gdb_system = declare_dependency(link_whole: libgdb_system)
+system_ss.add(gdb_system)
 
 common_ss.add(files('syscalls.c'))
 
diff --git a/gdbstub/trace-events b/gdbstub/trace-events
index 7bc79a73c4..4fd126a38c 100644
--- a/gdbstub/trace-events
+++ b/gdbstub/trace-events
@@ -28,5 +28,5 @@ gdbstub_err_checksum_invalid(uint8_t ch) "got invalid command checksum digit: 0x
 gdbstub_err_checksum_incorrect(uint8_t expected, uint8_t got) "got command packet with incorrect checksum, expected=0x%02x, received=0x%02x"
 gdbstub_err_unexpected_runpkt(uint8_t ch) "unexpected packet (0x%02x) while target running"
 
-# softmmu.c
+# system.c
 gdbstub_hit_watchpoint(const char *type, int cpu_gdb_index, uint64_t vaddr) "Watchpoint hit, type=\"%s\" cpu=%d, vaddr=0x%" PRIx64 ""
-- 
2.41.0
