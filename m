Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783724njd;
        Sun, 27 Apr 2025 23:41:07 -0700 (PDT)
X-Received: by 2002:a17:903:19c3:b0:224:2384:5b40 with SMTP id d9443c01a7336-22dc6a09678mr139409515ad.24.1745822467633;
        Sun, 27 Apr 2025 23:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822467; cv=none;
        d=google.com; s=arc-20240605;
        b=BdmJHblBSpZa5gGFTgFptJn7wjPy7ON0M6gzAJIDUyGRqIBH+XTcmp0pi0hb3uJA/d
         IZPOLicpAAzD7+lEUrYh8I3RVhoT0qO5IYbCiXnYuHcJ6AtNQ4QAHb9F6TPINzF38RN4
         raAQ9Wdtva2zxENopmJRoKKqneuSmmgbqRcZQ3GdZi5Ygzkhn1fXgosOJVn6eGCN6dyu
         FruuzQfaQsaSaOva31sM23O3IKBb2xax5Hk9X7Lsd1idM+vz0CA7dXUeIZ8KxbqV3iMA
         N0oaL37M8/NxrauBJ5IOC5mIo4YEeERh9XAr9Ty88BV+jvqlHpQsmeZFdJw9Syq4L/N5
         O75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+/nnk2ZOF1tW/MJazOrX1XPPavmSBWDJgIss4LsgUwQ=;
        fh=tkzlYQ8GddaWTq734p41KtA3rxs9bDytc7gdM8HccuE=;
        b=jR0ij96XNHAxIz9cYyvNz2jlobnAiksVhIOOVfLLNIU6hx4tnH9Eb7CRtqbKaS8mDD
         9CwP5Pq7d3jrenCOstNiPGRXrq3aOcItK6N0xNa4udpfRNY/K/KJ9+lds3ok9iytmqUm
         AC8Hgsd9+7TzZ5A17VZqucFwAADLpb8S5GzQhxUAiOjpAuQY1AcD05tYwynP2aMAy5iS
         4xlrNYUY35kgtc2Q8Pd4AkZe7Wun4CGG7XPVrtKInYLCRJiBKwZkNJTL1TVQ4C+40eJ3
         sZB5fplVD5XP8XTyi5IDAp3bxd98g7YxFpqBhGkRKUgduqOs5oaKF3eWQb2bNVv9rmCX
         vGBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=m1mUBZnt;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4e140a7sor57732525ad.9.2025.04.27.23.41.07
        (Google Transport Security);
        Sun, 27 Apr 2025 23:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=m1mUBZnt;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822467; x=1746427267; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/nnk2ZOF1tW/MJazOrX1XPPavmSBWDJgIss4LsgUwQ=;
        b=m1mUBZnt5mFh/DdtCIX3iAVqYuM2LSGcUnoe8NBXcm9ygXNoOpMTv50xfdtjEe8jy/
         tj+GsXNRGOv5m+tQTDHW4YKQx8F2JPHoaskmY9+OQEkvvOoyRqhjDg3hkMeuV6yCb3wa
         pcrdh/TzCGObJOyllE8le9JxNs92uynbmDSoaQq5x0YBagWqaesykXpTzzL/Yk6G38Gy
         erQqtBdWtjBVsHrp42r62V7LndsvIg5Bhm9pmSm0rwoL2LCDN9rCDs7Ski1n0ZkZZKFJ
         m83TjG35lg8/Iu9SR/ms/hvegPLY8BhB//UGLjo4+xF6PHzzqkAxE1lcKYrjbjDfxd5Z
         JgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822467; x=1746427267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/nnk2ZOF1tW/MJazOrX1XPPavmSBWDJgIss4LsgUwQ=;
        b=USM8b4gWAJ62+5M/m7x9PoWV7zqWof42KZNzkhBQjy/u/8lF3oXu7IeJ3N1GEuFkYt
         lv8ixQIhqi5EkXC7x42jz/GOHBJ7G4OjjCwGJUSYIFDXB3ES1dqFwBy5OHswJC+2V3EP
         PwaiNRmDc+0Dwv6TN+YrjGGNkYspQvHKP7lfzyeRRKhcuhr03rua6A9DwQuKA+Yl11mT
         0JVcvtcQwm/qNv8Ke2yY0BYIQVvqdKAhVmRB7187z4+Q2uwyipCVtEvTXqivkw17PCWx
         01X/pzMwf/mcfHuulaVP4MKvNfczrb9jPf6b/CuvOr2pyHIrI67Tg7ho1SQ+HV+vdchE
         s9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUsJlUBW6WQkE/Wy8D/OK6UAq0WSPUP7f+Dcqox8m9tkKYtKdBKIb+dlUme3mWguOaNkmBQJBu3SXsWL+2y@linaro.org, AJvYcCVw5xY0+IITXhX//a2aeBkRjm0QXOon4tIypHXcY884TH7Be1YtwXLaP8Va5gRw2NYgnIziHd0SLGIA4pqfPgGtpcw=@linaro.org, AJvYcCW7i0+H7/AhOhc5lMLQjj6pntkx5cM9XhtwTn4hF+pxFloK5cNQ3PdxRz03M+qAUF3ddTe8ns7B0JLtTXmQpEQfUA==@linaro.org, AJvYcCWxGqVq5WDgRKlCH3nhblDGs/63PEqDnV5/rIc51qIZ80ITyJgRvHuP6z8QWvxDaT5XrLRrteO/@linaro.org
X-Gm-Message-State: AOJu0YxIdwVzwbnp4+f/7cYz7OVRzBQhBTru6gCro4U3YZFWk/Qk8qp6
	xx3hGW1Q+uqjOq5o7KGjhjkQ4OMPJf67shLVxVurgU/eExWSl01SzufQwOiS
X-Gm-Gg: ASbGncvWdISn1JhzXOqfnAInA3SCcEnsiSYpK3XFNuoxv9v+ne692kvK5vxBkxNjujN
	PU7yCJJ6ZqfVWSxHdYogvO/R5olNdYsuzPPgmO3ddC8k47E+nht1AkrtUL9zbx/MZMmuqLvNU5K
	ZKsi534qFboHwTKrcMVfSVJRx5wzWgv7mAwOaAU3i9y3MEq92p1wwKcxmvWK4Uxdq0TJ1yZY91V
	M8j1xWdf2HS+gPNKuF/FHmNqJieZIAlW5kzIyktkb1jF2VtbjEbJodbGKVCjJXtBoTO3xCFxEiH
	2kxuik6Fp7zm/FCGWMWzrcXtUFYAy1BF93ZXD5ZSdanJE5eE
X-Google-Smtp-Source: AGHT+IHy8JC9peExQmw9o+e1dR7WVS5JuRxtg0fw7P70HK7P9CvHmfmRCy8fXoV4eVZdOOZik8y5Ig==
X-Received: by 2002:a17:902:cf4c:b0:22c:33b2:e410 with SMTP id d9443c01a7336-22dc69efab4mr115305535ad.2.1745822467072;
        Sun, 27 Apr 2025 23:41:07 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:41:06 -0700 (PDT)
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
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v3 11/20] util/cacheflush.c: Update cache flushing mechanism for Emscripten
Date: Mon, 28 Apr 2025 15:39:00 +0900
Message-ID: <2926a798fa52a3a5b11c3df4edd1643d2b7cdcb9.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UOwbX3W+8Vdl

Although __builtin___clear_cache is used to flush the instruction cache for
a specified memory region, this operation doesn't apply to wasm, as its
memory isn't executable. Moreover, Emscripten does not support this builtin
and fails to compile it with the following error.

> fatal error: error in backend: llvm.clear_cache is not supported on wasm

To resolve this, this commit removes the call to __builtin___clear_cache for
Emscripten build.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/cacheflush.h | 7 +++++++
 util/cacheflush.c         | 4 ++++
 2 files changed, 11 insertions(+)

V3:
- Fixed the commit message to remove a confusing link.

diff --git a/include/qemu/cacheflush.h b/include/qemu/cacheflush.h
index ae20bcda73..76eb55d818 100644
--- a/include/qemu/cacheflush.h
+++ b/include/qemu/cacheflush.h
@@ -26,6 +26,13 @@ static inline void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
     /* icache is coherent and does not require flushing. */
 }
 
+#elif defined(EMSCRIPTEN)
+
+static inline void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
+{
+    /* Wasm doesn't have executable region of memory. */
+}
+
 #else
 
 void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len);
diff --git a/util/cacheflush.c b/util/cacheflush.c
index 1d12899a39..17c58918de 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -229,6 +229,10 @@ static void __attribute__((constructor)) init_cache_info(void)
 
 /* Caches are coherent and do not require flushing; symbol inline. */
 
+#elif defined(EMSCRIPTEN)
+
+/* Wasm doesn't have executable region of memory. */
+
 #elif defined(__aarch64__) && !defined(CONFIG_WIN32)
 /*
  * For Windows, we use generic implementation of flush_idcache_range, that
-- 
2.43.0
