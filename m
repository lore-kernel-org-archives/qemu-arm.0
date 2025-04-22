Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136882njd;
        Mon, 21 Apr 2025 22:29:29 -0700 (PDT)
X-Received: by 2002:a17:903:1ca:b0:223:5ada:88ff with SMTP id d9443c01a7336-22c535a9d87mr218572915ad.24.1745299768867;
        Mon, 21 Apr 2025 22:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299768; cv=none;
        d=google.com; s=arc-20240605;
        b=FxInf4eceWXFRuxYp5/kdUJzs5M7AK0b2j0hJb4JpVZTiGTmNazm+UjAvnleznntc2
         j34R9OftH7nfXjcOSGcv1f0n/RfwENM7NOI0SgcONRg+bSB6HZPbnBs0Q/LsWJF7yPOO
         vkAeKpBUG4XzoOEMaGrJTg95RVqG/+Z4t0S+llXF6oWacuvI2uxhXoCqPOjlrasc//qk
         Dv8A9CAkW/hliS3Mwar7bt3y9Io9dVhxMlrz5iCixUkOL9I7H+Ja7zLksS6I69iYj1V6
         eO+bk13GGGQlrPiiBts3+XtRpn7qqzqObW582O8HopS/UVIQ+zcbtFWSGyPpSgLUReeV
         NSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OcMrqg+AK4CG6FhWc+/PAoET2DJRr80sNz7sCzalahY=;
        fh=EDGT6OaUgnExbnWAUsec2fAQ76RWgmRATZjta686nTw=;
        b=eXHtXR4zBkfzumsVW03Jv9MUr02XrNs0jEaiS1b99Il04BSq+pQVfdcVwmoS9zvptY
         Co92qicg1CbaahyDSotLbP7iTzVhOdbAF3GI24lofpQtnd1flzUSgLeA2ViNqhHOKUxi
         512t9ecFj1TJbnAbFBWcASMfMtxOr5tlPpR/ZeKtUtmP8X0MTEV4oF03WnZzsq9Ejjyr
         XDfTJCVef0osXT8eTNLkFodus/V2fhc5hvHTZ5vTq9M2PSuroSMDnY9LDgmOaHcA+zvl
         Nc/5eETa61RjiMAukJKYnuoujYsiuyvGjzlaI0FNPL+3Jojhy1bnmvb2EfZNBBesvr1/
         1d3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=HGihztEC;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50d09366sor54756395ad.9.2025.04.21.22.29.28
        (Google Transport Security);
        Mon, 21 Apr 2025 22:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=HGihztEC;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299768; x=1745904568; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcMrqg+AK4CG6FhWc+/PAoET2DJRr80sNz7sCzalahY=;
        b=HGihztECfqzY8EPBHzjm9HOoCcM1d7EM+VuwdDVpc8rdejR4XdLnTqbR73nclnSRNx
         CwLAYl4ZBy7X8TWIq1wPfn6QO4MEKVZHUpc4dvfwRPhFqBy3R9qBL3CO9LGR8kSFfKXT
         uGmKFX2AKYiKxJJDHBmvQeXnySTnMX7DSYrfM8kQ/hH+uBfvlrLEFpQLPBdSA3p5zsqe
         4FnZtaQsXOXnydf2Ede30K/yj4EtyWgb6jOS8k6SCyjIHUJ3WE3DEzMb3Errubc30PY1
         aSnWTt1lSmVAvVzjI6PV8+CpzLST5UUQxn1r53ArBOEHmvH6hhjS5XD+h+dxOuBGYlSf
         VTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299768; x=1745904568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcMrqg+AK4CG6FhWc+/PAoET2DJRr80sNz7sCzalahY=;
        b=IlndglnxvuIa8JOoCTzicIBRNe1WElZcl/z9QHFGHuo5nQmx7Du8aJiR6XkH4FL8Nu
         8zSa1gr6B5lPcLNiE2RenbxBEVMBHRt68leDAUGpfs/WCSUqZP3hev3388GuA6H4BAuA
         o9oy6QDaSxK/S9jy9khBvrVDoJQXUgTqSqdUuQMniezsAhgywYt7PSIhX6ctJWxMPOYM
         5xw6LAJDYpljBT5jvuvjldbiQcqQbVQ7AHXke5QyY5IuwHlc6XhSfp5U4ChIWfllJMjh
         c04rb7eqJ3scV5mx6kw8cWekPUOt+eUggbQEMcibQs+z/EZA6DmLXLiI9BPqToYEY1Lu
         1zdg==
X-Forwarded-Encrypted: i=1; AJvYcCUENybbryanc37kggl+TL7KKbbouGSpIA7kDg0yLb5Zaz96tGqj3lhihQIQEgOy46uo1wUKlyvK@linaro.org, AJvYcCV8lnlmcz7HU5GKYVU9Hgu8MBR7eL1ylEeb/xWXtbG+qEVI1njqVb8byivbxWThiSU1okajM6HIbflXrLLv@linaro.org, AJvYcCVTS1E/5IX+ALmuK4hKFloQiHqcqXLrfjtB5cqIGM5K9jFSupoEBfUlNpxwlInvrqwC+bxa3chpnDyQ3b1P3WR/cVA=@linaro.org, AJvYcCVwwYvPhDE61MEO3tY6/lz6OPpYpkgDoXzoEniTXGiX0yMRnG/sWbp768vTOHiWdWL6Fnzl5bUG246YHH6DcRBerQ==@linaro.org
X-Gm-Message-State: AOJu0YyUr3cnDxxa2y+R/CMW+jhx4N7M07eIFJafbffUWpcHUf3sH6zf
	ROdXvxaafrNPTxznEG4/zQCaawQJszHqtoNI/szva504nMP8lqftePIqORPu
X-Gm-Gg: ASbGncuK45A/PPpZPViRi79Dk1yAotLzCo4T/Jx0s7PbTQG6eAm4IXNB899kzm9CWzU
	wpZINqBw3Trg9E+UxsNkHn3gl9iddr7N1V7urMZDHB9yfsC7H1uOvKFm1bwz++TRq5du5UZjRmc
	NLoBpC0UHN2XmHF8YfJfp4VuiHZEViwyxBOyXlkaD7gDV1AKIaiQbosGGwBgKGLNCSJqgcnEfTf
	o21UV5+U1Fz51UQ1dXZhl4TvKb31JWZaJYW98zDlufgQt2N/prVw+EMdJ4In06iTtFxXTv6PR2n
	MhqKdItiUjKZ3PSB3cdMZ/qypTmfVrL/tqQhX8AqpDQuWaYlXkVDHkgjGRI=
X-Google-Smtp-Source: AGHT+IGRZvEetiyqa+fm/MRvQqrwC4kyd4L2y1DWQfWnFLGfwS9xzLmNLqSqcW3bp/SNxhoA9tvehg==
X-Received: by 2002:a17:903:298c:b0:224:1d1c:8837 with SMTP id d9443c01a7336-22c535830d6mr189707265ad.19.1745299768184;
        Mon, 21 Apr 2025 22:29:28 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:29:27 -0700 (PDT)
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
Subject: [PATCH v2 11/20] util/cacheflush.c: Update cache flushing mechanism for Emscripten
Date: Tue, 22 Apr 2025 14:27:15 +0900
Message-Id: <73301cc216217d5c3e0d7acdd32482e36f4f045c.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0mEMETerj+2O

Although __builtin___clear_cache is used to flush the instruction cache for
a specified memory region[1], this operation doesn't apply to wasm, as its
memory isn't executable. Moreover, Emscripten does not support this builtin
and fails to compile it with the following error.

> fatal error: error in backend: llvm.clear_cache is not supported on wasm

To resolve this, this commit removes the call to __builtin___clear_cache for
Emscripten build.

[1] https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005f_005f_005fclear_005fcache

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 include/qemu/cacheflush.h | 7 +++++++
 util/cacheflush.c         | 4 ++++
 2 files changed, 11 insertions(+)

V2:
- Added an explanation for the change to both the code comment and the
  commit message.

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
2.25.1
