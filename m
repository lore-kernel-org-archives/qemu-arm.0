Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179447njc;
        Wed, 16 Apr 2025 01:17:00 -0700 (PDT)
X-Received: by 2002:a17:903:2309:b0:223:517a:d5a9 with SMTP id d9443c01a7336-22c35d4df71mr14043235ad.15.1744791420069;
        Wed, 16 Apr 2025 01:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791420; cv=none;
        d=google.com; s=arc-20240605;
        b=kjMWQYG5sSOGZRMmGWddnc4j89Btnom8XQRn+wz9mXbYbihidSUfTBsriD/QFPQer0
         J3Qr8MgyR2R3RUKxilV1Uor23xtuMYjPSLoybgBoOLg5HMnZSdBfmvcdMTMMfP2l0Fvs
         FQ0ixHqJx+VrsBA8FtkovtEWh5MU6vhkBG4NRQF3G091TeNSwLE6nw6OTgfH2vm9eadN
         FNindgTqGhh7m0LWoYc4qkmRNSRFggt4oy8vdHoYzlODV/NC42QggzeAbaY/evyCOo1K
         Mr5R8gWIApVfBx35fQCjy0EXaTb/rj0wutgY+zr8m+IW6D6752+pPlgnkeWt3mEZOVrp
         JoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LeWm4gdwYX7Mpk2+jTOfSOTsV04a2XRASVxxD/NFs3U=;
        fh=znID5S7ITsfRppXH7pCblTQ1UwyXcdWfq9lER6Iav2w=;
        b=FWKPRQidAF/mst1i/NbjyCZffpCC5FkaUG5lhOrq7wWmFBkVXyVvOToSNvfjmUGKh0
         UqTG6U76kYUtHmuHNIACfZz4E7kyryVvAgwqZH1oLsbfuw7fq4Vp9JfbZ0Yt2iPbbpAa
         bMtpXqG6d/g/fdlmm1CZIZd0S7EnlXzMhwy41CDnpaUU8H+oPnwSGEaHoeXNRyfg/IKA
         3yy3FlfOls7nqinyeib8orvD9CO3F1GWcDnwscyuihP6N8636WyCDZ93Pg3WeCJ3ZmRL
         kpzR/iwu6rk+GDCHoIdSmO6vwbuFQ9JdbY16gIY8Jfmc54pZ5Xz3ut8oQclDKkFjPaiZ
         EBaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GmoyV3Ob;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73c22474f13sor671595b3a.1.2025.04.16.01.16.59
        (Google Transport Security);
        Wed, 16 Apr 2025 01:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GmoyV3Ob;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791419; x=1745396219; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeWm4gdwYX7Mpk2+jTOfSOTsV04a2XRASVxxD/NFs3U=;
        b=GmoyV3ObZVYCkLM9n5xFBV61eayThg+sv3GxYLpm47Z6KXnlPzIPyBX9oa0DLVqrdb
         wa9RYjLBjyidLzBqSLEj4t1+Q6QS9zKIgVj+SqtNoq2Wp3ncfUmkrkw6xYZknIKBY84f
         wzzP83ZLCioY4wgadvdS2cJ53NibBNOjudQ2k+/+7+jJ6tfRvxq95d+qCCGpj1h3NgUb
         g+c4kJFimKf7jVKDG8nEqOqLTNA+G/rSloGRZUNfl8/miKthog2XfNbQ7abVX9x+kGH5
         jeqy7ShxwtenbGse0WFJF3dVTK4sEMt2yt8zcrc9a3Y2LTR5hifELs2ABGnO8JwBgUbA
         MGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791419; x=1745396219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeWm4gdwYX7Mpk2+jTOfSOTsV04a2XRASVxxD/NFs3U=;
        b=ZzqrXnsfFAGQIbVvrDPXVFcOT+VvGakbIS85kHoghtYngLJCyTk5wpkADxqvj40ElN
         ZgXNymeWCpJRbMVrpMkMB4kkB1mma33Ygm8gVQxGQr6gHvO+J5Oi9prHfIeVRrK1W2Qu
         2eprYX+6Rniy2xMxsnQBkQrFpQgxg7WnCVGPKZlv3H3Pe5i/1ARSgdx1+4k2CmTWk0Dp
         HlmcpZbV+717eDLm9nScFc86py7gggjoNb3k95O+oIKWhTX5hpsTjnYc02ICA2bn0bTB
         6zBqrJEr2EXisNKy6ugCijkVJS8I9KwGy45eUzJVUoqnukQR0nOxeyy1KKYhG33GUi3D
         5/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU5QSumObUnc3aCy9JJSr54t9vno7Jl5eaY5Eg6b9vW0gOPhjSKbgC5chaTth/kMJi/oXwNjGyZ@linaro.org, AJvYcCV5IL4CTlNBE01scBhh7y9zrMnSfn03XTiJEttMMEzhg4MPBTH0J9g6gftnFnapNQniM8N67gz56YUVmc5w@linaro.org, AJvYcCX8audMCMaE1UIa9EUlwvjKnuCQJqGDRQ+TK3D0O+gv9LuiZ8TjJjr6e9wHbRg+8CzEVtZb5QMIBiqxxitdyLSp8Jw=@linaro.org, AJvYcCXUmvWAII/r+YOaRLsIpoiFbNDoVPfobGz8DTKCCg8QJ1ygIwpKYxfgZ4l8LReTx0b8nja+iDkH+kxFl2D2seth7g==@linaro.org
X-Gm-Message-State: AOJu0YxbCb5/Di0RkHuKRjbtbAd8JMUqlPaXqmvaQCoMeGQpJfpadURg
	lSSRiZnx8pASWJs9h8vsK7XB72EuhCUvy/BStTyuawwnE04TBr+0Ya+Ka3Vu
X-Gm-Gg: ASbGnctWKlOoFuhfEK3CjxbVy6qNMMGIGHNXvIX+qv0vVB/UxXody3CcpGAx5DiLjJ6
	z4hJNZnOu07Jh5cDryIFSDlOXhMAzpEzYCgL3oc1Gb40Hh2h22S/NpztKsqwIdUjT64zDpfPaIi
	Vi2hjqKV9gzaUJXKJ7rk/GLGvCmdV9WAs0il5n1R2TwzBEDSjtmxeDNOYNKO1WbuJwTr/7tC372
	R4t06jH6hX2kKKozubqq6SKGO4HyJtGE9XhXL51jDY9XwRzdzgDxTEvQxZYAPb0CoiwPo52minM
	u7W9jMou7BDVxMcUkH4P3K1+dnLcxSFsuAPgc9iGuC9u+RJsWBAvm8A/nw==
X-Google-Smtp-Source: AGHT+IEd5+lBFTcqmb1ye1d++AMi9QLiZpHeWhQhSUvm6Ej8uB7TB8VIvQgflEsDVgsqaenyzYpXOQ==
X-Received: by 2002:a05:6a00:391b:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-73c26d39553mr1508336b3a.5.1744791419205;
        Wed, 16 Apr 2025 01:16:59 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:16:58 -0700 (PDT)
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
Subject: [PATCH 15/19] util/mmap-alloc: Add qemu_ram_mmap implementation for emscripten
Date: Wed, 16 Apr 2025 17:14:20 +0900
Message-Id: <7ef485c860a0c26d2ddcf6a96430f5443deb5aee.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NcEvfZfgvaLh

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 util/mmap-alloc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index ed14f9c64d..91f33682e8 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -145,6 +145,7 @@ static bool map_noreserve_effective(int fd, uint32_t qemu_map_flags)
     return false;
 }
 
+#ifndef EMSCRIPTEN
 /*
  * Reserve a new memory region of the requested size to be used for mapping
  * from the given fd (if any).
@@ -176,6 +177,7 @@ static void *mmap_reserve(size_t size, int fd)
 
     return mmap(0, size, PROT_NONE, flags, fd, 0);
 }
+#endif
 
 /*
  * Activate memory in a reserved region from the given fd (if any), to make
@@ -244,6 +246,21 @@ static inline size_t mmap_guard_pagesize(int fd)
 #endif
 }
 
+#ifdef EMSCRIPTEN
+void *qemu_ram_mmap(int fd,
+                    size_t size,
+                    size_t align,
+                    uint32_t qemu_map_flags,
+                    off_t map_offset)
+{
+    /*
+     * emscripten doesn't support non-zero first argument for mmap so
+     * mmap a larger region without the hint and return an aligned pointer.
+     */
+    void *ptr = mmap_activate(0, size + align, fd, qemu_map_flags, map_offset);
+    return (void *)QEMU_ALIGN_UP((uintptr_t)ptr, align);
+}
+#else
 void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
@@ -293,6 +310,7 @@ void *qemu_ram_mmap(int fd,
 
     return ptr;
 }
+#endif /* EMSCRIPTEN */
 
 void qemu_ram_munmap(int fd, void *ptr, size_t size)
 {
-- 
2.25.1
