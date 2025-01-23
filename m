Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp484992njk;
        Thu, 23 Jan 2025 15:44:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZ2pKYawCf26+4U7LGre50CUbmECOQtGXcv1pUR3O+CClmh3i05aJgxNSGHDBLN2AQoR/Jv/sfsnWxVA==@linaro.org
X-Received: by 2002:a05:600c:1e18:b0:436:8a6f:b6db with SMTP id 5b1f17b1804b1-4389141c12emr225820715e9.22.1737675867586;
        Thu, 23 Jan 2025 15:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675867; cv=none;
        d=google.com; s=arc-20240605;
        b=OSJw4Q1zZbQ5tj1s3q8dbBwgG3kntUr+oPvO5Oj2gh4hhkVGDazxQecH1LqJMA52ht
         hzgCYj5CHTXL8ZnH6ICgtWdBvKp0DdCLAsm8GwoZKUt43d1QNmhHD6m5utEPv3JyR3Mv
         liA+1Ujz1Ra54ae/n0DpsSxhKYtAY14UCUJIA5+HmRufsm9v1x/kIrZbWQjnr4sgYhWt
         +QGVLmc+xw2UIVHokcdcOmz/sTfYR0EMOF1lIH4s9HGtlS2jBzRGuL6CGIBQE5dpyIEr
         O4/1Vn8pRs809KRTVHNxz5BvtWneX3YjlhrH6frcvJwYPc2EIJbjiMedJQtAJAomgeMc
         xldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4nuXtmGFXC6ord9LKCUcMBdqEKN9u5T/6Xkbf7Pq9+s=;
        fh=chcfqaG7+l8WUD7P+IqMRU7LgBXUlks4Cc7juyMJXe8=;
        b=HtoogMRWYdeuAY169Hs4tUQiVlMitmlzWPTPBxBIdevDuktvSG/Klk9F+5y4ycfnsK
         LBYI9HmnSVO8y0xOPcFFRWfsD0N+9UQjw03SGBtqW9fG54NeUsOsjp9E8ulJ8PY1Cgvz
         unr8k1um29RagTDuqTjS9X++TZpKFKXdPd9bzsqVSKkaEK+VrY0irIk4sOcbgmIoZ5JO
         PzGrlxu8f7ov0wkuw6AgMWenUFAfFaAJo5DLcXoYFkB6ny/A8hFqeiA1+gzsbEI72noR
         8uy5eEQRakSC2lV2GvvD7u52FghGQmaYToUq2w7pdWNtRoRUS/LNEfLV8MOxUSLoYsKw
         4hQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gTwk9On9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c2a1c8c2bsor390943f8f.8.2025.01.23.15.44.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:44:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gTwk9On9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675867; x=1738280667; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nuXtmGFXC6ord9LKCUcMBdqEKN9u5T/6Xkbf7Pq9+s=;
        b=gTwk9On9weDZ2C6MmZuGdUOh+jpf3igP2G2+n3tI70Byzz1AFTZV1+iYgLGSkDkkpq
         1jtjc0leuZIvF3FYrlSQ5nylXXdf/gQg7nkPXR6BZtBX/qYvfKyE0tvCoHaTbA4Sypah
         arrOrFGY99hB0GEjpWCN87U+uEYWpy2Y32O3dIUrWjw+EomYSIeZZkA9npiMh3z+tyRt
         E+/2SsUqoFi4T+MYVf+A0qzn9hz4SLm6D8wb6ptQmJnkxjJ6HDAz/03jxqof3pit03JA
         bgVY2N0AGiZd60D2zc1S5gZHgo7yJRfedV70WP4+B4KUP3JRqW4SN30CnnE/Iukskj2T
         Opwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675867; x=1738280667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nuXtmGFXC6ord9LKCUcMBdqEKN9u5T/6Xkbf7Pq9+s=;
        b=QgSsGyzSaik9xOx9P8XycfASPDSlgIlcHnHfxNmRqkWkOqDF3PV8VK6s/+P1H4esX+
         rfpYeNiBpafD8ZR9ws3iYC0nzZ+WCipVd/nzuqoBEbqbuy0x9EgG4TjaUvULCjlL2Ntf
         hTXwQ2fMnutEzCQ4zclVwZ1oD2yJxf9fSGdvsvE7cUAhpf/j0muVGogo5FdZMKDrP8N7
         riHiRyHYJsSuujAxhpjjYaXYUSb2Uo6GrRR+lwonp9KvUOLOe1srkqywUuzijyRce/Mw
         9xNmsHZmQzmNoSnFXVo8qI3xsip1FKRqp0REbAYD0fzZfrSCOMGUEM87pzJjPdtgFQQm
         uOvA==
X-Forwarded-Encrypted: i=1; AJvYcCU4dCFMrhcsNxKlWH1uRIv/OdhILf5E7z/MBBoyQkMwDDSOvdDjUoZkbOfQDgNIvzu1QicZea9tmLz6nQ==@linaro.org
X-Gm-Message-State: AOJu0Yw2oJVfA0iH8HCWSH1CxZaz/a1Ixxe0gqj/bKafLRyz7wMRv521
	mbXT/UyaQZPFDjrL3QMpAHbp1oSl0/1panuDaM9DOfUMSjW2ujh4nUO8bkQ3xbMNTw==
X-Gm-Gg: ASbGnctnWquItWVrJoYba8qXLDL2/lFndru0nUKnta37opMTr4lzJAAYHshBm5ALTZ2
	jeU2fUUkZZR8LGx+afNEofLFKlwXdlLtHZV+0CjNdozX0ygygW2B6KFQ73WKwGpy6N6v1nXExnY
	eRYQX6ywUYKJmy//IUXVFpQHIh26yNj3ws5Z2zkumomrTmpzwfIgAMfdY82VmiZbCEq91jYkz4O
	CrzK93X212Yt6Z96mvy21JZSLSH5mYF5lVb/NsT0yXnEXTc0cCPAHR/IAB2AcaOsuKfuJn9mYkE
	AUHIkRypt6AvPtrMngwFmHbSmBTpUL4XGcLFm4nRmrvxmvrd2XC1IzM=
X-Google-Smtp-Source: AGHT+IHv5zns5zWE/8mYKYb9FdwvG4F/GC7lN2DJcXXFDd0WLjCHyuvzadU0RlDxZ5dNLmoZuF9u5A==
X-Received: by 2002:a05:6000:1887:b0:38a:87cc:fb42 with SMTP id ffacd0b85a97d-38bf56639d5mr27205303f8f.21.1737675867076;
        Thu, 23 Jan 2025 15:44:27 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6e2sm989811f8f.23.2025.01.23.15.44.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:44:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/20] user: Extract common MMAP API to 'user/mmap.h'
Date: Fri, 24 Jan 2025 00:43:56 +0100
Message-ID: <20250123234415.59850-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dMSSMUmDO9SA

Keep common MMAP-related declarations in a single place.

Note, this disable ThreadSafetyAnalysis on Linux for:
- mmap_fork_start()
- mmap_fork_end().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 bsd-user/qemu.h        | 12 +-----------
 include/user/mmap.h    | 32 ++++++++++++++++++++++++++++++++
 linux-user/user-mmap.h | 19 ++-----------------
 3 files changed, 35 insertions(+), 28 deletions(-)
 create mode 100644 include/user/mmap.h

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 4e97c796318..c1c508281a8 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -32,6 +32,7 @@
 extern char **environ;
 
 #include "user/thunk.h"
+#include "user/mmap.h"
 #include "target_arch.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
@@ -233,19 +234,8 @@ void print_taken_signal(int target_signum, const target_siginfo_t *tinfo);
 extern int do_strace;
 
 /* mmap.c */
-int target_mprotect(abi_ulong start, abi_ulong len, int prot);
-abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
-                     int flags, int fd, off_t offset);
-int target_munmap(abi_ulong start, abi_ulong len);
-abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
-                       abi_ulong new_size, unsigned long flags,
-                       abi_ulong new_addr);
 int target_msync(abi_ulong start, abi_ulong len, int flags);
-extern abi_ulong mmap_next_start;
-abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size);
 void mmap_reserve(abi_ulong start, abi_ulong size);
-void TSA_NO_TSA mmap_fork_start(void);
-void TSA_NO_TSA mmap_fork_end(int child);
 
 /* main.c */
 extern char qemu_proc_pathname[];
diff --git a/include/user/mmap.h b/include/user/mmap.h
new file mode 100644
index 00000000000..4d004e6b822
--- /dev/null
+++ b/include/user/mmap.h
@@ -0,0 +1,32 @@
+/*
+ * MMAP declarations for QEMU user emulation
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef USER_MMAP_H
+#define USER_MMAP_H
+
+#include "user/abitypes.h"
+
+/*
+ * mmap_next_start: The base address for the next mmap without hint,
+ * increased after each successful map, starting at task_unmapped_base.
+ * This is an optimization within QEMU and not part of ADDR_COMPAT_LAYOUT.
+ */
+extern abi_ulong mmap_next_start;
+
+int target_mprotect(abi_ulong start, abi_ulong len, int prot);
+
+abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
+                     int flags, int fd, off_t offset);
+int target_munmap(abi_ulong start, abi_ulong len);
+abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+                       abi_ulong new_size, unsigned long flags,
+                       abi_ulong new_addr);
+
+abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
+
+void TSA_NO_TSA mmap_fork_start(void);
+void TSA_NO_TSA mmap_fork_end(int child);
+
+#endif
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
index b94bcdcf83c..dfc4477a720 100644
--- a/linux-user/user-mmap.h
+++ b/linux-user/user-mmap.h
@@ -18,6 +18,8 @@
 #ifndef LINUX_USER_USER_MMAP_H
 #define LINUX_USER_USER_MMAP_H
 
+#include "user/mmap.h"
+
 /*
  * Guest parameters for the ADDR_COMPAT_LAYOUT personality
  * (at present this is the only layout supported by QEMU).
@@ -39,24 +41,7 @@
 extern abi_ulong task_unmapped_base;
 extern abi_ulong elf_et_dyn_base;
 
-/*
- * mmap_next_start: The base address for the next mmap without hint,
- * increased after each successful map, starting at task_unmapped_base.
- * This is an optimization within QEMU and not part of ADDR_COMPAT_LAYOUT.
- */
-extern abi_ulong mmap_next_start;
-
-int target_mprotect(abi_ulong start, abi_ulong len, int prot);
-abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
-                     int flags, int fd, off_t offset);
-int target_munmap(abi_ulong start, abi_ulong len);
-abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
-                       abi_ulong new_size, unsigned long flags,
-                       abi_ulong new_addr);
 abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice);
-abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
-void mmap_fork_start(void);
-void mmap_fork_end(int child);
 
 abi_ulong target_shmat(CPUArchState *cpu_env, int shmid,
                        abi_ulong shmaddr, int shmflg);
-- 
2.47.1
