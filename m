Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179295njc;
        Wed, 16 Apr 2025 01:16:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c1:b0:736:51a6:78b1 with SMTP id d2e1a72fcca58-73c26722c77mr1221669b3a.11.1744791396558;
        Wed, 16 Apr 2025 01:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791396; cv=none;
        d=google.com; s=arc-20240605;
        b=KxmDUJFAr0YI+c8AiDUQfOynI/K+gQqc7OxvDwoz91E36DFbxHpqoxWe3flcL1Iom0
         5P5hvBHxKWsDA2U3ylmXhMMI+PgiWZ3O+8R4BXMHNs1UUPQaSrzqaFejYthiIgon4kDA
         5uC9L6Crdm8brxvoT1LYUJvTorApfSS3/2TwBDv7rTaMbStu+ov5lE7zTiGlwBtjtoKM
         tOYDhzEmOD/qBnu6S1YS+z3/o0EQQrloQ7j94DCaaj1Tg7EM8S4dtW/UeEHwGbOTsRQA
         Ch6cowHx7k80LY44CXyRLh42fTknBb3wLpZi7wxPHNfbWQtBhkYgeHuc3eon6LFbrGly
         mOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kXW9TkBOCeygIoZUCLTmx3/WoYw9rEQTC6TItKA27ak=;
        fh=09pUH8K0DtbkYVwp8+2+DmQVUXfIHDv5ssQ+GX2tUfk=;
        b=SI0J1H/kyksQ0QzCbi5hEthmWKfWAmumNngvxUfufJQVdPR1HO6BDJKexQBYRz06lv
         v78bARmCF5hScTy8sxZvpM3EnR/yexOpYOjnMbnEZwnLeGKVd64XGKUwkP+jqMCpNqFc
         bZgB6dYCrcggay+EoxTdedoX+ywsrrWmUlvQuAiO+84C6HXz75Zrta3PDkD0vPjM9MPs
         I9zgRqg2gAWaoxkpI8IIq0WrQnDIVyHDGi0K8pMvH5MT+O6jnNlkHTS1nrFCLd+6iLK9
         6gZKtNh7St+f83P7E7pqD0RSbxKsdUe9Iof4U/dpCQI6kc5NVxyVhFdRqeqh/j+GjD8b
         +PoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y3opjWdR;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1c47247sor9017616b3a.0.2025.04.16.01.16.36
        (Google Transport Security);
        Wed, 16 Apr 2025 01:16:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y3opjWdR;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791396; x=1745396196; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXW9TkBOCeygIoZUCLTmx3/WoYw9rEQTC6TItKA27ak=;
        b=Y3opjWdRcm3HlbfhCh43Y6ObbTybO7yXvr+cTj71mU2LRGWILaTNLt+TaBiLNEOTFn
         MYj+d0Fvrl8OuGAiVtI55Djn4IpO09PRFCZgVXZfXj/Ffyc53+5paK7lxyYHz3mfkRb5
         FnyuM2lhqgFPFyZ0j9pJthnW9IdBIuU/o8o6IGPifAL2mIMjbmrZ1eDrBRIXiXlA0KzE
         HNJ6C3emTQn3r4fM5QEKHpArMCZBebOxH8Ep0x7aBqNE1l7LKhgVgYV3qzbntFiw7SU8
         de4H1F67oArI31ys0URrkIJjip/94sEet81tOiHc5BuDmFeyAwP5g/mhDSmq/cic3Nh/
         ALlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791396; x=1745396196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXW9TkBOCeygIoZUCLTmx3/WoYw9rEQTC6TItKA27ak=;
        b=BjMCTWMko3cAlpXI70sLh1VitUhHTIXJkX3vgjV+l2cOP4MokzoplSGzvAShqX8Cqp
         mEfDrsHXZ36sEuF88qIjmFWP2/rVp+7i9jeGeoTIy110kTmek49pN4AXMT2/dxIQRlpR
         dmvlPRXd88e/NfjL7ucJwDjV8vgNilimHTv0ONwWdLViRDWiJvPSQ1Nu14gvfj6OVmGb
         6HDPduHjGJF45NJ6rfkUePNKqZibEMOhHbTIrKSsL3vbcVS1ixV45CvQljxG2f/zrIvq
         HTZ8RDjtvs9iF2sR91gYYtWSNBe+ZOFpMsV3WJS8jUst+jKyqdHp3SXD8X4dN6FTDw/B
         ZgDA==
X-Forwarded-Encrypted: i=1; AJvYcCV1o1uqc3lvpG3JhORKY0JZb8gV5xJYzCgEOsW5aUVDVRFTwTtLa9FGMjhjITsrs8Duxv0juo4Alv7DfEzSQUmXaCE=@linaro.org, AJvYcCV9RAuk2wWJGtLBJTfYqavUhBCIfn+Lnk3TcFGrzJM2OCJyWTYEfc0B8p/lFl9bSWbO7tRm/7kS@linaro.org, AJvYcCWNaQIFeg1eMhqlbA4WJdzoiLSzsdQAlRuwJC5ckuKWeAOw4MBAvfwTUAhR60H/Fv6QRQTJo2L5K3fV3x5+jud1Uw==@linaro.org, AJvYcCXjfoXckzaIkpKAW4jebQI80WNxlQ38X57NWZW1hLFXJ6/9opV8zxkIZJ50G8S+OP3F7f+K4/nq+XJwwEXP@linaro.org
X-Gm-Message-State: AOJu0YywlgPD08Yux+8HlDpBLIyfJpvXNGodVpYzQLC2gav9XLGmzht6
	Q6ZgUGvbGsSSvKMb/9HIF43MEFscL4x+PQV+RaUFdqZ4YENnYwzN
X-Gm-Gg: ASbGnctCrPVFdkUcMpoZus6sv/289BVwWvI2BWJkdeSdaZegkFHzGIhy0/UMRafCx8h
	Rt6lrMiMsPDdJBX0cB/QFjKX0+OZPvNi0ToRXuaUbuURMFp7v3u0BZBU/GQK795SAUKinARIuxR
	IA3UV0qzK8smpL+g4zcyoNEiOam2N/q8qbBCO0WUsOx7LdWUuPsd2doHLrY0Xx5PKG4EwAyQQfD
	TIPG3ZsuQrVgiPuhRYS7j3qUUzfEj1UBTXQIlS7riVoqOjR6gw/I0s/tZ5eK4Drs6OBU0nFOdR3
	cLcEddeHiq5Qcx5jomL2AtbStKPo2and/qcmQCEysppzRGJBh+BIsGT6HA==
X-Google-Smtp-Source: AGHT+IFot2Prutev9vQh238P3Y8Qu6FWMP21RaEkJWIAAcrPZLBNFGYxFnfgXEoks8g52jfCfyjKGg==
X-Received: by 2002:a05:6a00:ac2:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-73c267c9faemr1430041b3a.16.1744791395895;
        Wed, 16 Apr 2025 01:16:35 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:16:35 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 12/19] block: Update block to compile with Emscripten
Date: Wed, 16 Apr 2025 17:14:17 +0900
Message-Id: <9da41d784991f77e2c1f38d0781cd047b593e053.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: g9IEr1pUwboM

emscripten exposes copy_file_range declaration but doesn't provide the
implementation in the final link. Define the emscripten-specific stub
function to avoid type conflict with the emscripten's header.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 block/file-posix.c |  6 ++++++
 stubs/emscripten.c | 13 +++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 stubs/emscripten.c

diff --git a/block/file-posix.c b/block/file-posix.c
index 56d1972d15..22e0ed5069 100644
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
@@ -2010,6 +2014,7 @@ static int handle_aiocb_write_zeroes_unmap(void *opaque)
     return handle_aiocb_write_zeroes(aiocb);
 }
 
+#ifndef EMSCRIPTEN
 #ifndef HAVE_COPY_FILE_RANGE
 static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
                              off_t *out_off, size_t len, unsigned int flags)
@@ -2023,6 +2028,7 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
 #endif
 }
 #endif
+#endif
 
 /*
  * parse_zone - Fill a zone descriptor
diff --git a/stubs/emscripten.c b/stubs/emscripten.c
new file mode 100644
index 0000000000..2157d6349b
--- /dev/null
+++ b/stubs/emscripten.c
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include "qemu/osdep.h"
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
-- 
2.25.1
