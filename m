Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp95691njb;
        Wed, 7 May 2025 16:46:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMcbXjQHmSK3t+nKXM96ZfzZybN1w+AbEZvEgxJl5vAvbrAEl44klgWnP2ymR4oVE/x8XCusQUsceKtg==@linaro.org
X-Received: by 2002:a17:903:1b6b:b0:21f:164d:93fe with SMTP id d9443c01a7336-22e9d3d15c5mr20337595ad.53.1746661619044;
        Wed, 07 May 2025 16:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661619; cv=none;
        d=google.com; s=arc-20240605;
        b=ixjQHG7S2//gSrxE9YJ5+T/Zr3dhA1j18B8wWytX3Xac8n5Uo9YpBRCZros4X4BCc8
         xY1fWRuFUTegvB+v6WPItVKUdUO642BKpqZ6kxiTMqUQPVZuM8zbpZtHi2iLyZzpDA9z
         KOdJu/e2XHVT+AUHwBBHZJjG2SecNS9+nhQmky9N9J7GCd4DrL1KzwtY7bkz4J+0dziF
         exXaXxGk5yy4x48YfT9Ofg1lANhWW38Olf/C+fbyfgfPpkrpl6nM8vLnk7bVdXzP5Qcr
         H0+dGhtBzPkjNRlbZmeMqEWVRYO26pGVOkPfEA8PcoN0P8UBN8y7KnBzbp6hWveKaxZW
         KUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D50FgSNi0pKqcQ8O05hlTOFeOSvMmvlw2mBrg4KVMZU=;
        fh=iXGVKszBpPyYAD3T5GkTSHef8kBCCwTn3iECY0XMNAM=;
        b=R5E8QE321Wv25VOCeyrAsYRlowc4Z+U3LxRdyx77yCG8cIvNjYMlkk0iAnUs2ordz/
         uktF0AJuSUsWfUfgmYr+eGmXbudw0Lq8NZwoQfA8xw6cjN3ucNrqqL2TeqXoM1jCXxyH
         ovl4p/hmxXpV+SAFMP87Y1uNFNm/lg0Kt5rTzjj/k00ed3WryQWIVoFamjJfcxkDKkPA
         gKnPoabAso+3wkz8b4YXBhXvNS1ibs8g93JNhXjkvlcy4NR2gkjtF4uWr5gP+/6KecAx
         kblRkwhTVGvYRmWriQ1O4Hn8QOk00pX/WgDea92AZitE86l3yQnxMOvIhXW68kaFqw/c
         q7gQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZY3iDasb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be8c60dsor121221265ad.17.2025.05.07.16.46.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZY3iDasb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661618; x=1747266418; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D50FgSNi0pKqcQ8O05hlTOFeOSvMmvlw2mBrg4KVMZU=;
        b=ZY3iDasbnf15qIEDFwxwB+F2CMhed6hJiQLObjnzC2x43Nx9hBAWs7O6bDWLPwqgdp
         1H20SxqqPohrDw/4XgcjUHAyhK8TEUyVX+Qa59GZ2ake7EBrBJOVI2yXRGizxD0Vo0f9
         TWJdl2gXy7/6KW2gFOQmo0QimD40H0dV1QV3DAUy+eKbXNEfdW/VLjTMP5g4sUv6obRe
         cji1q2iknbkJmatG+cU93P3S7bir1cMDKFKbykFMy6jPPchVBkIsTYmVBdQvtKmz+20u
         3+nAKgEOVFCz8Qo0/eAG94KSpmI5dwxUE5kWeqkM+PgwCtKQ4Gh5hmJq4VKi3mi3sKGh
         LQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661618; x=1747266418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D50FgSNi0pKqcQ8O05hlTOFeOSvMmvlw2mBrg4KVMZU=;
        b=ay4x9OssqAbxcdTeYmf8nWMk+dmoI/dWGsbfwzylmsTK5wpOREsGh3qGkJsvbxGkx2
         gok9RdxI7cZCAa+Rf8MGm/jdmwFfBtJM7djLy8Sp5fNYuSvhTEU3RcQ6fIhL9ovTaA/q
         06DrQtaTI4vpm9hkC5DKcJDl8QdOw2SjRUNus58AwgsMFzyzI2mV6CyqfHeeAfcqz9j4
         GN3GS+cFDib3s2SXzJyucWU8dBDlAb0in+Kc+w7UY/Q490YdqeKT22xXVWqLe3ouhKco
         9VKbgDymm3uv6Eov+vwzgXBdUP68wohSpZAdipBey0/xqxCqnXZO6qg0qvtqfQLNFVdU
         4gCw==
X-Forwarded-Encrypted: i=1; AJvYcCUF2xcqRT6qeOvxCC5gPqfu1+30lhsyEheXgGL7g9vp7YXqFwNgVvgIy4308Jw73DrHFsKW/dWB0Bqp4A==@linaro.org
X-Gm-Message-State: AOJu0YwNFmhdVkrUVMROPSDd8jR0XcYEA/zJBzjLhrjiDMwTyUHliO2R
	prAfXu7zewufOyZC29Aa9REbdID9S1wmf7Tgc+3fLRrHnKSYgvQnEPT5J5fNmUEgMQ==
X-Gm-Gg: ASbGncvYsZ1aWWiiaDmeohFRfCWmcyV27Hki8K8TOv9cQ1OH+jISEGdYxEriFuSzZ4u
	q0/fg5Itv5fjvxtAVKsZPX8tZqsmFjjaA+cnX82ioZRwJ6MN7n6YovT7BvREjtk2XVp1d7z5Stj
	kJeqvEgJ5/7x96E4X3ciNCc6QOTM/IryKbrX3XnEpz1IEp3V9f4myRiNzHgC45rghs5YniKSmtq
	VX+0qtYyWKYATzn1xHibeYym3Oe4oivnx103rqFgZlHPgx5UBdDK0SG1D5AJWIe2WTmDv5HiOH4
	jyKoZMyMWkQPW31+f9FNnnwXOujSKMQ7NNDd8RSj48CkPF4kcco=
X-Google-Smtp-Source: AGHT+IE28ol+YDSzIaHNx/fWYHVNSAxgPO8DVfTcMd3Ok+UpVl+BHuET78YD7yz4jHw8Fo5Kw2Cbmg==
X-Received: by 2002:a17:902:ec8a:b0:224:23be:c569 with SMTP id d9443c01a7336-22e863f13bdmr20015575ad.22.1746661618682;
        Wed, 07 May 2025 16:46:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm100792435ad.62.2025.05.07.16.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:46:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 48/49] target/arm/tcg/arith_helper: compile file once
Date: Wed,  7 May 2025 16:42:39 -0700
Message-ID: <20250507234241.957746-49-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UlbpTDVQ0sEn

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/arith_helper.c | 5 +++--
 target/arm/tcg/meson.build    | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/arith_helper.c b/target/arm/tcg/arith_helper.c
index 9a555c7966c..670139819df 100644
--- a/target/arm/tcg/arith_helper.c
+++ b/target/arm/tcg/arith_helper.c
@@ -6,11 +6,12 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 #include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/helper-proto.h"
 #include "qemu/crc32c.h"
 #include <zlib.h> /* for crc32 */
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 /*
  * Note that signed overflow is undefined in C.  The following routines are
  * careful to use unsigned types where modulo arithmetic is required.
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 5d326585401..7502c5cded6 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -34,7 +34,6 @@ arm_ss.add(files(
   'mve_helper.c',
   'op_helper.c',
   'vec_helper.c',
-  'arith_helper.c',
   'vfp_helper.c',
 ))
 
@@ -59,6 +58,7 @@ arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
 arm_common_ss.add(files(
+  'arith_helper.c',
   'crypto_helper.c',
 ))
 
-- 
2.47.2
