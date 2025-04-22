Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136511njd;
        Mon, 21 Apr 2025 22:28:12 -0700 (PDT)
X-Received: by 2002:a17:903:19e3:b0:224:1af1:87f4 with SMTP id d9443c01a7336-22c5358625amr246623775ad.22.1745299691952;
        Mon, 21 Apr 2025 22:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299691; cv=none;
        d=google.com; s=arc-20240605;
        b=D/xcFlizfbT7l5uVxhKI7MeYqatJSGet+Ge2glIyPDLA+7aJdIJGqnjfSKweVNOTDy
         UgJ1z+jksqj+awLevTzbLQhbKGVX1s5p7lzF8n8lbCY8L/T/ZUbR5xpAC87KUlxcnHEr
         brfzDfaZknYqg5Is/khnG/aae0badydwOsbxRZs7ioTPo2NOXGbqtnuzWMrVJMzeHP76
         UfQbLTvTbTz57mBzQaC0r94HkHWutVfSnkcenv4os7Uhiir+eLjsturKh1pFPfL8cg5z
         fNcESnuoHoPvbRm3x9QOWPZEsvO7N++4FSjK05I0EEQh13MXZHyoXU+lhWEPPoPE4dqD
         Bz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9NQ7+0cp0B4BZ+F+1DEhH1LfKFVn/DFHA6zpy9bi3Vg=;
        fh=RkJn3yksa/kY7FL1YYoYeN9W+t+fqvZZrY9sMGGY90s=;
        b=Cy/MBRq8/2nl4C1LdEgwaoP1fjEB99s7zmujuVPJGIa0/8bsD3Rl3GcPinIzD+9PTH
         jt+VHLVYxKxT3u1iYW3R500jV012RlNDJyLRxtNx/wdjFcekmU14YHtNf8vev3cV03IB
         H4wHftJ8Y5bUeIvK7HIYP/hVfVG5i8hYvHxFRB0vECTNxU06JwjmrnbMN0Kw0/JX6MbK
         ZW9aFhCwjUzRSmmR2TPYzbtvUbXbXIunQwjODS5YgJ7kT+v7mdfwLBQ7B13e9qHrZUSS
         CEIxuK3F7PL4yhhKjq083vI5MW88JGMtwPJqXRnZhg3OrA/axD5SvZ2EkjploTXd12cR
         0O5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KYoyKjry;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50d8093fsor52970495ad.15.2025.04.21.22.28.11
        (Google Transport Security);
        Mon, 21 Apr 2025 22:28:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KYoyKjry;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299691; x=1745904491; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NQ7+0cp0B4BZ+F+1DEhH1LfKFVn/DFHA6zpy9bi3Vg=;
        b=KYoyKjrycr50X30Dfv/U8rEaoB2isJp34Hy01QayqTNlHrhYdoTI9oVkqcyTcVCtku
         ddlS7pnyfT44mEls1Uz9CEPBJpZh8C8VN8XWPytawWaPdMIRhXNdxWp0ZRbXKkIPK/XT
         SIrUxvyTbxcWnQWLIIvOOLI5nYi22MPGHJWl/2BpJfZN7Q1NOWudaPyUYXmHqvjmV8VN
         LidCCvz4c88zCzB+lcOw+HjO5ho8kfai0wG2XYwXZh9YU/VUzjDs0tNF8b30cPyMp850
         UA6+v9hRiBMc18yjm4zVG0vltaD2TdcXQgJhoXFPG2g1wUznyZYhzdvPllc5rOzpWvkF
         emsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299691; x=1745904491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NQ7+0cp0B4BZ+F+1DEhH1LfKFVn/DFHA6zpy9bi3Vg=;
        b=w0K4YPiu6SzZbetsIjezH8/t5jmjzRdFQlHixHME6erDhqYQGzZnEP9Rcbn285JvjX
         TFam/AHiHU5eaE+pRsDAvONk2NJaOaI5iOJNO84t6SGdeCnx87UmflCWPUuJ6m6A68xf
         uml1arhd6hIAI6ukiuTkYo1NR5hQb9udTYsyPMpKV+t8AzeujNqLwne/lxZSk1i5siwx
         id27I1SPRI4yH9MP06I8TAzTqVEKdOqSz6T6twTLaZAcrAuBMFpn3W79/QokkEYi/W4E
         3GJEjNFKD4sLIAshmHMwp7dUtguzr6Hwn1Ynd56Zw9TWSVXVn9b/cJhPJo2pVlMHE0xc
         m1zg==
X-Forwarded-Encrypted: i=1; AJvYcCUFyP2q45vkJb3ITO/YHpGJClfnmdaFe3gwahZQT29auUmkCpqTyqSr959e/H7fuyUr1wMl7QPd/zC4jM57@linaro.org, AJvYcCUQ39H7Zp2nn6VYXkJ+9ds1rLSNM3ICfjo3NDjWBn19Qb4QcGwf61MILID9beYQSUbAkTI7xXmkJ/kBcOHuTB0aqA==@linaro.org, AJvYcCV3YiH7YzOFLPMtGK+94erCPCAZ1O7fNFTFtJAUZPyrHrzq+bA0GGr5kNEG0sxtwIv8IqsP/gkbAkzbGFLpXlQdo9w=@linaro.org, AJvYcCWVcH5OvULqZSC1EDLbSVEcS01kQ2aE/9XiewCoB7h6EJbhrH5s0LN9boMgLMN5AxUWGraTmYbK@linaro.org
X-Gm-Message-State: AOJu0YydQP2VpXqd8GUoKFbXpvPPAafZQ7omlXVYY+CxLfIf3aaQIOWm
	Ud5B7HJQnPkT2Qd0P8QHEqfDvQZZHXfFwhqCR4o3xF4DbbZyDrCT
X-Gm-Gg: ASbGnctQvoORrsX8TU78nTILru/FZMjtg98P+mDPKV1vvKEpti4Pbrboi0uI5M9nm5e
	GEBcbQOXdTm1v0L9jPsKxV8nOAbUtK1PflN9oaRk1V4lER1ew0BC2iFoQNu5bDlYZC2tqsYnyJH
	+40kkdzDh/A1DR4q3+lU2kk2uEcOZtAr2Ikd/Nkd2alfyGOVbOlEGafcafVwxOXFB8QEXoxp7ZO
	FtfnDnEGZFkEUVmb/4NbW+ftIvQ+9fDm3TmJF01wp592/mnyWN20bEqsEuiS78Dzui32kr5bUM6
	TVhGlr75BWBtY1Gep7NjwnoUPxSGHkQxZAXTYui7j2TbI2u+l0wyHl6Lyec=
X-Google-Smtp-Source: AGHT+IFQZuSA5UEEZIfqmUdfgADL4wO5YWoqm3vdhDf1L+aFr2jGRlrpu12P1/0vzKEaAX8X39f6sA==
X-Received: by 2002:a17:902:d4c2:b0:224:de2:7fd0 with SMTP id d9443c01a7336-22c535b2b3bmr201215225ad.25.1745299691273;
        Mon, 21 Apr 2025 22:28:11 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:28:10 -0700 (PDT)
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
Subject: [PATCH v2 01/20] hw/core/loader.c: Fix type conflict of GLib function pointers
Date: Tue, 22 Apr 2025 14:27:05 +0900
Message-Id: <26dfe9191154ca65dca6ef51ce768ad2a0c30d5f.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ya+2/+FfT+Jy

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 hw/core/loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

V2:
- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 2e35f0aa90..93a8b45d28 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1410,7 +1410,7 @@ typedef struct RomSec {
  * work, but this way saves a little work later by avoiding
  * dealing with "gaps" of 0 length.
  */
-static gint sort_secs(gconstpointer a, gconstpointer b)
+static gint sort_secs(gconstpointer a, gconstpointer b, gpointer d)
 {
     RomSec *ra = (RomSec *) a;
     RomSec *rb = (RomSec *) b;
@@ -1463,7 +1463,7 @@ RomGap rom_find_largest_gap_between(hwaddr base, size_t size)
     /* sentinel */
     secs = add_romsec_to_list(secs, base + size, 1);
 
-    secs = g_list_sort(secs, sort_secs);
+    secs = g_list_sort_with_data(secs, sort_secs, NULL);
 
     for (it = g_list_first(secs); it; it = g_list_next(it)) {
         cand = (RomSec *) it->data;
-- 
2.25.1
