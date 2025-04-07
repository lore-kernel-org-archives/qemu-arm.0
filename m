Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6426294njd;
        Mon, 7 Apr 2025 07:47:51 -0700 (PDT)
X-Received: by 2002:a17:903:1b0c:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-22a8a866dc9mr173462965ad.14.1744037271617;
        Mon, 07 Apr 2025 07:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744037271; cv=none;
        d=google.com; s=arc-20240605;
        b=Kxto9o9UBFs/kJDPKkzmsq76HsPzWVDHy8RES5bzii3RO+SfAimMXLcKxhzwvJqiiC
         dgwb33nOHLFK4ctI5y9QwAiPqr/JikMn2bPmyfCZXzcWRbxQuuU2EUfoYZLs62L+LylP
         51/8iSu5lY8pG0q7wBS3dGxMnYe+tUwh0ZJr9eLIisjFWYB0ZvyL9hD0oFRS3/tvW+j5
         0qCarEEfIrLAt8Wy4tWQ7qHIUvbMMk0zV8qzeTeK5bROqPA0On6wmNPeQ6uQSx/84Ckk
         PTcyaZPIONLvyaCJYDF14bobaa0OJbCJSg0Bev6mkZX5KArP9g1WTBlCU7aACgoR2vMt
         EFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=maq8DmxjYyAbXMCny/cpZJZoQ4BH2LZVoK9JgpK4scU=;
        fh=wq/lMT/FRV05jdh242aqn4MWIFLnaqr/btyM4uw1Tpg=;
        b=KTcpWF1sepqCLYBCM1bfksmqA/zh+Q7DhuMjR7r0EAk41WPhiyVKKxFim3AuSp/Eol
         XXdyRiHfYO6Tohd71mN2MsouPyF0bGpJTz8AYZv/Vw8vtTvrsXwpMPeoJqWUHxdRPRr5
         2GMW6vLoHZRPCkN3BsIg1+cSlnneV9kj7JZvP0YzsCk9lggA9LjRXF/So1HxO9OYbXtY
         vxsjePuOs1ItLnMykEGcQ/DgH/LVl+x65DgU+mo3im0nRR4lpM2rzM/9zDIdWcFXqqh1
         urgPDakkJizGs+plTMgxp1zFKiN4EExwkM5xOvi6DtyKSxquWh0XWadCwxvAqzUDEaYw
         D1Hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NzYI63zf;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-229b78bfe17sor51278355ad.12.2025.04.07.07.47.51
        (Google Transport Security);
        Mon, 07 Apr 2025 07:47:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NzYI63zf;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037271; x=1744642071; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maq8DmxjYyAbXMCny/cpZJZoQ4BH2LZVoK9JgpK4scU=;
        b=NzYI63zfS61pkrGk3b5w8yPflf+M3Pjud5LE6n1n4tA3qdX4OG5P71nbCcbArAXmF4
         of5kzg72BkbcQkMHzVa/cep6yeifbJFUzMtSlvFHGpwEavCeggJJWfInMcHQd/oUNymS
         b2oTqCA9HoSsV5gAYg+d3Gv+yrrjPPuPzwDKEsJY1YM/BVMd1FxQT1WvrFWg0BYDFkgz
         VcD7tfjWCJfShiKOvwn3E3PcFpJ0/JwDTdGItjWfwp6eWM9XtHxhA+0HMUQcsA5q6Bk9
         rOq3FUuhJXWcA8ngxfDEkRKcfUZwj9QZFLL8dIe5Q2S+pfNrcH4Ptdv8EsKu92PNLnE9
         TVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037271; x=1744642071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maq8DmxjYyAbXMCny/cpZJZoQ4BH2LZVoK9JgpK4scU=;
        b=jSimELKQ4QsFVoITUQ4/NsKAhwzzPrC0T1v9DUiJCDVE6jYttXJt+I1cfTpECVJhEI
         +5n4S9rC0wMDjrEBzHea0qi7Sf2gNF7B6YnOSvDHPv1yXX1aZnyYdbQb4x/bW1U5qvBH
         5KPNOupOy1Bfh5JqmrPN+x361xd8xtTITMpBd/WBV4dnysmexMihzhMspArb+MWfQyzq
         PXhG6Uti7eaRX64RKFdkIPQ1ai/nHw8BmzYFJjNhl7OvmPfpYC/Bm/Z3WHTzKNjXpUnc
         YLIVSWtROGTOBCrxPxfFRhFAllkzsUKUDHT90c/s8GU8ljWBFF1daeBsN9A+ATPFflbL
         t7lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUacxS1kD1wn+g9p7NRmB2sLINgPYXDkdqLc8FNIw9JLPIWhoYMzaHv/Cki/FtY9PqWLyXbkTalPpdLd/u3U8WWpCM=@linaro.org, AJvYcCUxAzkIGsugUho/Uj56QHYjV91RYDYn00sIB+OXcy/oYzbSxH5q+Mpmlevk2Ihl3xZHVqaYhL6tyCykLOA1@linaro.org, AJvYcCVQv60xk/B5jxwEWypCebPFmmIlc9CkuiVS2u6zbVqPWyq2V1pf2IklfBjtE0vOIMD3Mf67ePw2@linaro.org
X-Gm-Message-State: AOJu0YxBoRRRutA2xDaObRG7DtDttqqShojPIgUle9N6qWQSQjJ6j4yp
	qQXwPhFyiZtgv4LSQCrISJdPABbIRZ9XIgJUp9ZrGNmcssXHVKvx
X-Gm-Gg: ASbGncu9gHEsQhgXLEgZaqhDEN13UUpg8kGN+5fW2Q2W0XQPR02Pydwq6q9ns8TRuhH
	JAlUufpuE+swLmA2a/ANu3AGB02JNdVT7tNRhUl3TuuI1fe+Km77quQP1UcagMoMHjJXQyLdlcy
	Po6iBPfdaGXmdgD2Yr2OciGG8a/6MZAEZ0Gbai8VsMuVgzZNyfaadyvr+e/2I3CdniGd5QcjKE1
	r0Idjr3mk0lXsFzReq9OJdsRqn+hg/rrLImKgAJO/nRvVlJahtMVyZKc2lE3tlUMv7znH6Ltf0J
	EjZnPWZ9w1Xb3YNofQ9Wl8U+MmQHXKlqVDLZOnBPSgz6SBe/lMio3IvaPXvCGA==
X-Google-Smtp-Source: AGHT+IGnRlE1J9xAQ8on+RsP6dF3OMiTxnoLy+/62yPs6hp1pQvN2FypIbgjstfQKJKk6OT9jCncrw==
X-Received: by 2002:a17:903:3bc6:b0:220:d79f:60f1 with SMTP id d9443c01a7336-22a8a8ced77mr165846205ad.42.1744037270688;
        Mon, 07 Apr 2025 07:47:50 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:8768:486:6a8e:e855])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ef3c2sm8856960b3a.59.2025.04.07.07.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:47:50 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 02/10] various: Define macros for dependencies on emscripten
Date: Mon,  7 Apr 2025 23:45:53 +0900
Message-Id: <5f2a8fa2d7116b1d65b79fbb3a95244096fb7308.1744032780.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744032780.git.ktokunaga.mail@gmail.com>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1zDn2mng8jlw

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 block/file-posix.c        | 18 ++++++++++++++++++
 include/qemu/cacheflush.h |  3 ++-
 os-posix.c                |  5 +++++
 util/cacheflush.c         |  3 ++-
 4 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 56d1972d15..69f54505bd 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -110,6 +110,10 @@
 #include <sys/diskslice.h>
 #endif
 
+#ifdef EMSCRIPTEN
+#include <sys/ioctl.h>
+#endif
+
 /* OS X does not have O_DSYNC */
 #ifndef O_DSYNC
 #ifdef O_SYNC
@@ -2011,6 +2015,19 @@ static int handle_aiocb_write_zeroes_unmap(void *opaque)
 }
 
 #ifndef HAVE_COPY_FILE_RANGE
+#ifdef EMSCRIPTEN
+/*
+ * emscripten exposes copy_file_range declaration but doesn't provide the
+ * implementation in the final link. Define the stub here but avoid type
+ * conflict with the emscripten's header.
+ */
+ssize_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
+                             off_t *out_off, size_t len, unsigned int flags)
+{
+    errno = ENOSYS;
+    return -1;
+}
+#else
 static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
                              off_t *out_off, size_t len, unsigned int flags)
 {
@@ -2023,6 +2040,7 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
 #endif
 }
 #endif
+#endif
 
 /*
  * parse_zone - Fill a zone descriptor
diff --git a/include/qemu/cacheflush.h b/include/qemu/cacheflush.h
index ae20bcda73..84969801e3 100644
--- a/include/qemu/cacheflush.h
+++ b/include/qemu/cacheflush.h
@@ -19,7 +19,8 @@
  * mappings of the same physical page(s).
  */
 
-#if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__s390__) \
+    || defined(EMSCRIPTEN)
 
 static inline void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 {
diff --git a/os-posix.c b/os-posix.c
index 52925c23d3..9a7099e279 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -148,11 +148,16 @@ static void change_process_uid(void)
             exit(1);
         }
         if (user_pwd) {
+#ifdef EMSCRIPTEN
+            error_report("initgroups unsupported");
+            exit(1);
+#else
             if (initgroups(user_pwd->pw_name, user_pwd->pw_gid) < 0) {
                 error_report("Failed to initgroups(\"%s\", %d)",
                         user_pwd->pw_name, user_pwd->pw_gid);
                 exit(1);
             }
+#endif
         } else {
             if (setgroups(1, &user_gid) < 0) {
                 error_report("Failed to setgroups(1, [%d])",
diff --git a/util/cacheflush.c b/util/cacheflush.c
index 1d12899a39..e5aa256cd8 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -225,7 +225,8 @@ static void __attribute__((constructor)) init_cache_info(void)
  * Architecture (+ OS) specific cache flushing mechanisms.
  */
 
-#if defined(__i386__) || defined(__x86_64__) || defined(__s390__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__s390__) || \
+    defined(EMSCRIPTEN)
 
 /* Caches are coherent and do not require flushing; symbol inline. */
 
-- 
2.25.1
