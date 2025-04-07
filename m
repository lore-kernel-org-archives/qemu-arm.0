Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6426182njd;
        Mon, 7 Apr 2025 07:47:37 -0700 (PDT)
X-Received: by 2002:aa7:888c:0:b0:739:4a93:a5df with SMTP id d2e1a72fcca58-73b6aa6c7c8mr13294744b3a.12.1744037257493;
        Mon, 07 Apr 2025 07:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744037257; cv=none;
        d=google.com; s=arc-20240605;
        b=PZ5saKt2SVKd4uNbrTbxUUuc4l7l5aRiJCTaSet27WRX97bPIGDu/blEtAcNwCEnh8
         JCRkOuVIcTNFW8p3i52S0fwlGptTDev2uqNQOcTjsrCNWScZFs1fA3APS00hllrhlgEH
         pJtX9E04dDWYixSxDocEm9d2wwZeFvJ2wabIgh63HxDBNsIHfNu8BUbvoweTZw8KgLWL
         x+CxuetogL2B/Xl+7c+Fwya0L5jnYYt//9trIiBJ5aqMHzVnQPDqROVlAa9hNWcJbMfa
         CkjsDF03sZEcG3JGgTojn86gU59slZDUb9bouDPCzDpXTwYFMdedQf10hgHIThJFArTE
         Fp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=303oU4ivEV4o+skcvNL6xtz8+P6ObO0/wi+L6EFBQWE=;
        fh=8on/HHdq9HZ3v/3BHWD7LCSN1FNlTLAZRByRW6zJtNk=;
        b=jzJbG775E8NwOTv5BIpvOIIIG0RL4bCEMcQ/aZoI4TLOk5dXGPv/MPOCEuBLenVzI8
         ZL/7AKsZpNWw/CP+I8DpJPTDwaB+LtFbKRPWw3SkXWzR/PRc02MypRWLB/nGzFo2KFcU
         bv0OoszgtwsP9m6IK/1AC1JKhHwFgBYanG2VyPz/FMGzB5I5CfhjatDUb9Gw51LlRA7T
         mzHXspG8QuISl5XGCScFcp2WX0c0bZOkZmMze9R/Yr2ZSswCC96rVRTOEgtrr4IACefd
         pgpRRdp5V2x7N5Aa/XP6hs8bwmJacAWqoRNgSiReVjvWAM3hswohNOnSWMN61PuXekot
         ilYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fFreMP3a;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739da0b2af3sor5307082b3a.9.2025.04.07.07.47.37
        (Google Transport Security);
        Mon, 07 Apr 2025 07:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=fFreMP3a;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037257; x=1744642057; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=303oU4ivEV4o+skcvNL6xtz8+P6ObO0/wi+L6EFBQWE=;
        b=fFreMP3aE73D7/Sxf7O7NHX3QIP5NvNKySJWhi1x0zic/zUCgNcb5Hv8jHNCJGgAa9
         AbpReBQYKLm51eSQ2IDdNhTqafDE+ODNzmIGpT4g4HQtS9jFtXENVuDvYVlbJ6B0n0x2
         NIAZg7JNVPNOytde8lZs+UpJW3Jh9f0u6hHWiIatC/EL6gzv7oEHlBo6mRxfp7iY6dvA
         G81bUP+kfhx1JRAucdQUSPk81UHQo1uYaciOmswICYkL4ySZJzVu4VAto2LOy49liS5g
         Ojo3WPEQTJlQ7gALgxklYSiQWtovBCk1HG0IrcX0Nc6eRX+7UkXhurMq/mWTynmQ3cbP
         nQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037257; x=1744642057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=303oU4ivEV4o+skcvNL6xtz8+P6ObO0/wi+L6EFBQWE=;
        b=qYZUlDT/ZkCc2TL4/huO5a5OHtv+Vx6LtJwliV6OtvLo/gBt+VlRImdBCAZDouKkF2
         q7Lyo/iQdZC5yOzqCZ13LxkOGq7Qgbe+RaiQRYnTbZGvTzAw5lNHkC/Z21N6PYKoCSft
         YU+jSOLWv8zqZPwIjYG/HHbsUhURmeywcaReZAao/MCMM4k0Hjj3IuH2JkpHODh9S5GG
         286kk44NwxtOGhRo6DZ0d2tWvLu6YZf+pxrqxV1C7D57wwdYMLdmjAr7s0VunDI0ukbH
         Dyg1RRDKhf/NiizqB4B5fUBSkZgifVDM6yml+5x4ca3X1cOBtgnq229wGu5NXRKdkx8H
         1dMA==
X-Forwarded-Encrypted: i=1; AJvYcCUmjwopVFYsa15auHILfHrpK6n1SclhyeAi+TNAwi7lRvwEHKe5x/OPWjBl3WlSox6z0L3FnHLklOF9wQGwJGv9ooU=@linaro.org, AJvYcCWdwXqMZyvW3ICOLilrZRO/l3ETHELJFEpz7gKN2CRlB31CYmBUh5baLTXV8I5FeqBnV2ZPjFCN@linaro.org, AJvYcCX7fDkY8pK2a75dlD9Q2nLnLbELdq/VTSfIG8Vz8Ac8JLD/WCdQexIvKqf+E7htB3dCso785WCorlAz5TIq@linaro.org
X-Gm-Message-State: AOJu0Ywbs6UlMQZiCjdzDN30Q8TCUxq9J/4bgOnmXimTDYVjxeiIhmMa
	7hDxwtI7HkvYI4hva0LvFM4bxL+l1Zck8nc5Kl8J+X5duOdL17a0
X-Gm-Gg: ASbGncvzUqEnVEnh/nXcXyKL2dxBZ7RBSvFK94JSVFXQTeJpUiMA3px12m3d4rzLVck
	KtPMfU+cjQ/WU/BPF5o0KQJDk4cBADwdEXGNpAkLZIjSZnSWrNjtpJT9i+yDM0kv/2awfXUH/jt
	Rt/LEuCqLcWJMJJTA1NzaViD55P4iUTPBVFVFb4VbJ9cgc9efnZDwQ3Xj9lNHNWRp3V21DSt9g7
	0hEC01l43qYQJ4SIYVA/Yy5PkSHW/98H9OQbQCNORjlZ4UPLmn6Xbh5EyGzGYoH25aekAi3pg98
	8dT6vDsUXkhkrE33YlSMBzjeG+6y5DIbnsK8y6cQU+64k+gFfL9lzwsjubfpFg==
X-Google-Smtp-Source: AGHT+IGZ2Wz0Y1VNTDZ7pixroI/TzMaEKIf24Xwu3jGbGdGuKfSQAcxOo2mpyOC9HsbIY+yWz/StLg==
X-Received: by 2002:a05:6a00:3a0a:b0:736:53ce:a32c with SMTP id d2e1a72fcca58-73b6b8c5773mr8623059b3a.17.1744037256768;
        Mon, 07 Apr 2025 07:47:36 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:8768:486:6a8e:e855])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ef3c2sm8856960b3a.59.2025.04.07.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:47:36 -0700 (PDT)
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
Subject: [PATCH 01/10] various: Fix type conflict of GLib function pointers
Date: Mon,  7 Apr 2025 23:45:52 +0900
Message-Id: <2be81d2f86704662c9fa33ceb46077804e34ac77.1744032780.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744032780.git.ktokunaga.mail@gmail.com>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lYpmIhmcwhyy

On emscripten, function pointer casts can cause function call failure.
This commit fixes the function definition to match to the type of the
function call.

- qtest_set_command_cb passed to g_once should match to GThreadFunc
- object_class_cmp and cpreg_key_compare are passed to g_list_sort as
  GCopmareFunc but GLib cast them to GCompareDataFunc.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 hw/riscv/riscv_hart.c | 9 ++++++++-
 qom/object.c          | 5 +++--
 target/arm/helper.c   | 4 ++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index a55d156668..e37317dcbd 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -102,10 +102,17 @@ static bool csr_qtest_callback(CharBackend *chr, gchar **words)
     return false;
 }
 
+static gpointer g_qtest_set_command_cb(
+    bool (*pc_cb)(CharBackend *chr, gchar **words))
+{
+    qtest_set_command_cb(pc_cb);
+    return NULL;
+}
+
 static void riscv_cpu_register_csr_qtest_callback(void)
 {
     static GOnce once;
-    g_once(&once, (GThreadFunc)qtest_set_command_cb, csr_qtest_callback);
+    g_once(&once, (GThreadFunc)g_qtest_set_command_cb, csr_qtest_callback);
 }
 #endif
 
diff --git a/qom/object.c b/qom/object.c
index 01618d06bd..19698aae4c 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1191,7 +1191,8 @@ GSList *object_class_get_list(const char *implements_type,
     return list;
 }
 
-static gint object_class_cmp(gconstpointer a, gconstpointer b)
+static gint object_class_cmp(gconstpointer a, gconstpointer b,
+                             gpointer user_data)
 {
     return strcasecmp(object_class_get_name((ObjectClass *)a),
                       object_class_get_name((ObjectClass *)b));
@@ -1201,7 +1202,7 @@ GSList *object_class_get_list_sorted(const char *implements_type,
                                      bool include_abstract)
 {
     return g_slist_sort(object_class_get_list(implements_type, include_abstract),
-                        object_class_cmp);
+                        (GCompareFunc)object_class_cmp);
 }
 
 Object *object_ref(void *objptr)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bb445e30cd..68f81fadfc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -220,7 +220,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
     }
 }
 
-static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
+static gint cpreg_key_compare(gconstpointer a, gconstpointer b, void *d)
 {
     uint64_t aidx = cpreg_to_kvm_id((uintptr_t)a);
     uint64_t bidx = cpreg_to_kvm_id((uintptr_t)b);
@@ -244,7 +244,7 @@ void init_cpreg_list(ARMCPU *cpu)
     int arraylen;
 
     keys = g_hash_table_get_keys(cpu->cp_regs);
-    keys = g_list_sort(keys, cpreg_key_compare);
+    keys = g_list_sort(keys, (GCompareFunc)cpreg_key_compare);
 
     cpu->cpreg_array_len = 0;
 
-- 
2.25.1
