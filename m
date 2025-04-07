Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6426693njd;
        Mon, 7 Apr 2025 07:48:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:ace:b0:736:4b85:ee05 with SMTP id d2e1a72fcca58-739e7059451mr15847606b3a.11.1744037310899;
        Mon, 07 Apr 2025 07:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744037310; cv=none;
        d=google.com; s=arc-20240605;
        b=dUWhG/2Nd2fwUgqWljoSbS/gBtCnHj6pogWupllWUop7OFmKW+TBM9GSdmLQZ7CaJr
         ndoU2GaWn3FfscxqM2npsPHswUQ1aW/Vg3DiVQGVyL6eGumgqLokHTWGf841SfE1L7+T
         9ul301gJIalEYcC0T5WbC2G2Yl4end3qXIzvQrbBiyxXeEJ4zqRtpfqyR84vzSFnf1BU
         TTFkqqAA4NIijOhz/vQu3qGNopu0kZOsN5n8XOcOsuLFa0Xm+jEfAFMQpNc3jUukRkDM
         EUoDe6Rlk8RgQfOeUpYtejcXoJEC5543wmbGGNXSbKywO57PrnmmP1LB2jZljY3OGWuD
         y/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=50grsCyUNExDjQBR3M1QLWMMiStdz5s3sePxgxhYNa4=;
        fh=ET6r3+IqtrTIdsA5clahF5rvY4mJBvl1cjXRee+38VU=;
        b=eocTM3LAB7HthiLyYe15769JVig41MwxlAVRvPBHdy7ZpVwaa1L/EOsy6Dai7kLvC1
         N0GnwvCnF5Qy6vhaQFp83acSfVtWMIR8MX7AmyVLXDQQJ09PqT2Bc3+NLs08J16ntwJs
         1ZDkYN5d2UFptv0NQfHA9fkLexfLsZxcIcYka8bWVekBNX0ohiqmWVCbPcwXd8k+ag8i
         CWiZNFwmxhS9eZmomqYXiHPrwqO7UdTupsfGzBotriA4rpd39YxTZh6hZXQ/5XnjcLTo
         /0xHNwUA10MpXPaDRym5EnbMwLGSEVJxG6A+z0o0JveOtXnDHexsWMz9wuOBf+EMEl09
         KSbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UeH4qZuw;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739dac62ddbsor7738860b3a.3.2025.04.07.07.48.30
        (Google Transport Security);
        Mon, 07 Apr 2025 07:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UeH4qZuw;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037310; x=1744642110; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50grsCyUNExDjQBR3M1QLWMMiStdz5s3sePxgxhYNa4=;
        b=UeH4qZuwDLFQzzHdkYgZunhFmypvakIlBdl4CwTM71suYXFTscdSJWglwER2vAjiH9
         nXYjoJ2fka2/Sq/qkuXS6DYODSPIhXvk7IccP/6kim8Wo6EsyrXACp1cpbaNV66h0LlJ
         /DjWW5HHVOTu9dmb1MB4d3fAb7QAR/8v4/3Hnn6X3ab9gN59+87p3ZHogVWVaA2GYIvo
         HW2AechIHiwWNYqtirW3+StMwteruMxT2X95NQnFJnRZHTdlcwufZzfFCgDEnGKbGY9r
         xwOqEuqAeHVOHhdwShl7SJ7xRn6UCXA+7Tbfw8IefY+tur716EPUcWOAxjXzo6vHUPRT
         tS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037310; x=1744642110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50grsCyUNExDjQBR3M1QLWMMiStdz5s3sePxgxhYNa4=;
        b=jbkHjlD3PmpfAKBx64BjpbIy1TW4plnGd6SUkNrRryZ7FO9GsorTC5l3KYHN9EMKRp
         Kmm7eRnYtUPW68EImw5mFxxeT/SMMh1rmM3Imr4QgtFYmY6oMsctsCsaF9N8TBUWNQb1
         abhbww6/hn+hJdE+kjDc2Dw6yzUIhOxCUPefEXxxi7avnxkR5e21yI/HtEwz6Di9LShO
         nnOUbaZxiFzrfBGO3FBH16ctPpyXZ62B7a5uC9BUt4U2bnfc5bwqoxfY8JwmKBawaoMp
         KDYkn4Un4n59gDn2wH2Z8hMR3AzscThNiirVYrA+CFJc69eCnSO+cDxdqLzuiONSZ4JK
         ZuGw==
X-Forwarded-Encrypted: i=1; AJvYcCWh4dmz0MdXxYc1Xhx3vwwYVJU9JD+bpNDIQWk8UIG7/VER0AC44z8W8xA8xG3NfUJMQBMFvGvt7G/VdoLw@linaro.org, AJvYcCXKcB6OBhPRRR5AJiKdcSV+IA5d9LifSMa9engghI18DfbDMKOvJBs5bQ6g9khLDL2XLG58hN9W9KPfEi6sT9dQX+E=@linaro.org, AJvYcCXc2zd6GfOs2VaJhJEtRgjFZB+6EY01JLwWeLCSDyC4z2uQtYgUO9YCV/GTs7VbhgbDJJISSl7i@linaro.org
X-Gm-Message-State: AOJu0Yw2uYE6OK3YSrNkAltnQPp+9k5HuVF0NrG+9EW0eWqQzK+cqlXI
	odkUgmC5bOu2+rLfy5ynxDupM94GaXuEUCL/CaDEjhBcYBTbpZWs
X-Gm-Gg: ASbGncs8zL+cQB6rpcBKsLwR65YbnKRLfyq4qi3eEjfQmQ5Vr/f/QzHCW7vdy52Aokx
	i1xoPQDiXrHAYmObpm7qc8Aa00b4f/0SDsO/uMdur3YbwONlzrRFxnbNXrq+SQ7Xlg/WeKoy2dg
	DMZrQv5rZWGBKuxauc0tQOD0odAVWoaWNNLc2VJb6UnpUxKjAkkbjtQSugJ0ZrsrytlaMsHL6n6
	7c85bEzzwlp3ci+HZw2XVJrw6s/A1XN1EGg/qlxxHN2KPnfncKGgAZrWf8XbVa60d2opEYIYukd
	4yIljuhQoWmg3GaYaULdto00a5XpsAwJaIyXpWzHt2uEoXwqwYG/+5yycImDdA==
X-Google-Smtp-Source: AGHT+IEtdgebOWYfB7Ru5RkfAP3s2nGxPBFQ/5hJFI03pD4SFHdP8PDukDExTccgtz8IaaGtRQK4/Q==
X-Received: by 2002:a05:6a00:398d:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-739e6fbf853mr16492428b3a.1.1744037310339;
        Mon, 07 Apr 2025 07:48:30 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:8768:486:6a8e:e855])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ef3c2sm8856960b3a.59.2025.04.07.07.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:48:29 -0700 (PDT)
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
Subject: [PATCH 08/10] hw/9pfs: Allow using hw/9pfs with emscripten
Date: Mon,  7 Apr 2025 23:45:59 +0900
Message-Id: <16376e4b63fad6f847ceadb39b8f9780fc288198.1744032780.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744032780.git.ktokunaga.mail@gmail.com>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7p/qCiM0NiI8

Emscripten's fiber does not support submitting coroutines to other
threads. So this commit modifies hw/9pfs/coth.h to disable this behavior
when compiled with Emscripten.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 fsdev/file-op-9p.h     |  3 +++
 fsdev/meson.build      |  2 +-
 hw/9pfs/9p-util-stub.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p-util.h      | 18 ++++++++++++++++++
 hw/9pfs/9p.c           |  3 +++
 hw/9pfs/coth.h         | 12 ++++++++++++
 hw/9pfs/meson.build    |  2 ++
 meson.build            |  6 +++---
 8 files changed, 85 insertions(+), 4 deletions(-)
 create mode 100644 hw/9pfs/9p-util-stub.c

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 4997677460..b7ca2640ce 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -26,6 +26,9 @@
 # include <sys/param.h>
 # include <sys/mount.h>
 #endif
+#ifdef EMSCRIPTEN
+#include <sys/vfs.h>
+#endif
 
 #define SM_LOCAL_MODE_BITS    0600
 #define SM_LOCAL_DIR_MODE_BITS    0700
diff --git a/fsdev/meson.build b/fsdev/meson.build
index c751d8cb62..c3e92a29d7 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -5,6 +5,6 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
   '9p-marshal.c',
   'qemu-fsdev.c',
 ), if_false: files('qemu-fsdev-dummy.c'))
-if host_os in ['linux', 'darwin']
+if host_os in ['linux', 'darwin', 'emscripten']
   system_ss.add_all(fsdev_ss)
 endif
diff --git a/hw/9pfs/9p-util-stub.c b/hw/9pfs/9p-util-stub.c
new file mode 100644
index 0000000000..57c89902ab
--- /dev/null
+++ b/hw/9pfs/9p-util-stub.c
@@ -0,0 +1,43 @@
+/*
+ * 9p utilities stub functions
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "9p-util.h"
+
+ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *name,
+                             void *value, size_t size)
+{
+    return -1;
+}
+
+ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
+                              char *list, size_t size)
+{
+    return -1;
+}
+
+ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
+                                const char *name)
+{
+    return -1;
+}
+
+int fsetxattrat_nofollow(int dirfd, const char *path, const char *name,
+                         void *value, size_t size, int flags)
+{
+    return -1;
+
+}
+
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    return -1;
+}
+
+ssize_t fgetxattr(int fd, const char *name, void *value, size_t size)
+{
+    return -1;
+}
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 7bc4ec8e85..8c5006fcdc 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -84,6 +84,24 @@ static inline int errno_to_dotl(int err) {
     } else if (err == EOPNOTSUPP) {
         err = 95; /* ==EOPNOTSUPP on Linux */
     }
+#elif defined(EMSCRIPTEN)
+    /*
+     * FIXME: Only most important errnos translated here yet, this should be
+     * extended to as many errnos being translated as possible in future.
+     */
+    if (err == ENAMETOOLONG) {
+        err = 36; /* ==ENAMETOOLONG on Linux */
+    } else if (err == ENOTEMPTY) {
+        err = 39; /* ==ENOTEMPTY on Linux */
+    } else if (err == ELOOP) {
+        err = 40; /* ==ELOOP on Linux */
+    } else if (err == ENODATA) {
+        err = 61; /* ==ENODATA on Linux */
+    } else if (err == ENOTSUP) {
+        err = 95; /* ==EOPNOTSUPP on Linux */
+    } else if (err == EOPNOTSUPP) {
+        err = 95; /* ==EOPNOTSUPP on Linux */
+    }
 #else
 #error Missing errno translation to Linux for this host system
 #endif
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 7cad2bce62..4f45f0edd3 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -4013,6 +4013,9 @@ out_nofid:
  * Linux guests.
  */
 #define P9_XATTR_SIZE_MAX 65536
+#elif defined(EMSCRIPTEN)
+/* No support for xattr */
+#define P9_XATTR_SIZE_MAX 0
 #else
 #error Missing definition for P9_XATTR_SIZE_MAX for this host system
 #endif
diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index 2c54249b35..7b0d05ba1b 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -19,6 +19,7 @@
 #include "qemu/coroutine-core.h"
 #include "9p.h"
 
+#ifndef EMSCRIPTEN
 /*
  * we want to use bottom half because we want to make sure the below
  * sequence of events.
@@ -57,6 +58,17 @@
         /* re-enter back to qemu thread */                              \
         qemu_coroutine_yield();                                         \
     } while (0)
+#else
+/*
+ * FIXME: implement this on emscripten but emscripten's coroutine
+ * implementation (fiber) doesn't support submitting a coroutine to other
+ * threads.
+ */
+#define v9fs_co_run_in_worker(code_block)                               \
+    do {                                                                \
+        code_block;                                                     \
+    } while (0)
+#endif
 
 void co_run_in_worker_bh(void *);
 int coroutine_fn v9fs_co_readlink(V9fsPDU *, V9fsPath *, V9fsString *);
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index d35d4f44ff..04f85fb9e9 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -17,6 +17,8 @@ if host_os == 'darwin'
   fs_ss.add(files('9p-util-darwin.c'))
 elif host_os == 'linux'
   fs_ss.add(files('9p-util-linux.c'))
+elif host_os == 'emscripten'
+  fs_ss.add(files('9p-util-stub.c'))
 endif
 fs_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-9p-backend.c'))
 system_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
diff --git a/meson.build b/meson.build
index ab84820bc5..a3aadf8b59 100644
--- a/meson.build
+++ b/meson.build
@@ -2356,11 +2356,11 @@ dbus_display = get_option('dbus_display') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
-    .require(host_os == 'linux' or host_os == 'darwin',
+    .require(host_os == 'linux' or host_os == 'darwin' or host_os == 'emscripten',
              error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
-    .require(host_os == 'linux' or cc.has_function('pthread_fchdir_np'),
+    .require(host_os == 'linux' or host_os == 'emscripten' or cc.has_function('pthread_fchdir_np'),
              error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
-    .require(host_os == 'darwin' or libattr.found(),
+    .require(host_os == 'darwin' or host_os == 'emscripten' or libattr.found(),
              error_message: 'virtio-9p (virtfs) on Linux requires libattr-devel') \
     .disable_auto_if(not have_tools and not have_system) \
     .allowed()
-- 
2.25.1
