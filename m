Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778277njj;
        Mon, 5 May 2025 16:20:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWA6gXGBLgKHBgW4mWmbpJVhkMcDufzOeHsC76u7TExjYXTlsfe/scjG2Rl3G1b4T4N/EaA31ATRrz6Vg==@linaro.org
X-Received: by 2002:a17:90b:520d:b0:309:f46e:a67c with SMTP id 98e67ed59e1d1-30a7baf3d96mr2010757a91.11.1746487239776;
        Mon, 05 May 2025 16:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487239; cv=none;
        d=google.com; s=arc-20240605;
        b=UO0VMHRFoCKizoBjeWjSIJC7K4DPaxIC3+LRnXKxrwcCDWPJpESbXD1/18D6JUb6qv
         7e1S4dhRVI8U7uFglArPb4tJlRIkjYgWurwUNHY0gPV2wkxJsqGyAlrds+imKQD+zJE6
         8xnwKfJhAnkkrIUtu03SSTLmJUtX9INJBQaUfCZbwtzac59CO8gwjvk752mqXLGJYvaE
         MVVpwWv5ozp3FVU0pxZgblLH3qhg2BToi1/olACFVV8nM0E3O6CrUYg3bguucEzu8Wak
         vAT1a5QzVJ71BNGZChGLaJKDzmb9vAD8Vd539ftpprt5FxuFHXxcmaoZ5G3ZaTCCT6nJ
         ZYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oU3hP1IM611C1WkYpOLE6kbCej9Cg8bXJlI25SZwxm4=;
        fh=0lACjtNcOqWP5BbGQCEjsgF0+AGEQ9HkSwpRDvM9ULc=;
        b=CEnhW304wR7JhgOMLwSI9pocG0ULvzLcBif/QzcmFQz776Xc9UrA7S+q+gbtICZMZj
         OBP9iiOuNvtKLgeQa+2l7/mBP+C64cJFyhUYBeEdHNqQ34zyHp85AwIPuhmeeiIwimbu
         NUlDQRCsweOPqFprGVzRrLJMEgISp1tmmUAbqK7L6uncUwgGEkt+AEXzgEfvTu1wUjuW
         QkoNRrwIdQ5KzVy+HBzE+oRNE7fDOeLZARu9JnLGUttq6b7Fe30ojGq8ImVznNBarCzl
         mCmqTdkuFc+iEh7MxZsTkvDTuy7A6fvMnhAkV6A1TIaG1cESofXLqvT7J3FIrH4+8Pcg
         R6xA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A/VLRC8w";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a4762ceb3sor5109898a91.4.2025.05.05.16.20.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A/VLRC8w";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487239; x=1747092039; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oU3hP1IM611C1WkYpOLE6kbCej9Cg8bXJlI25SZwxm4=;
        b=A/VLRC8wX+EVgvy3/peWNvc26JTx1rsZ10OYkhQnpo3hPHwB2w1Y5ngHPsk/bUGijb
         ZD5/nlk+pEkpxI5XRBi1Q71yLQEc0KZSc09OemH9S7Wyw+YtSc6aRkRfdHEzBqYXnfQH
         njwzFQhzCdLB7IJ4fm304mbJwovxS3V+HnrUg648dAbuzv+JWdWMOKxGtP9lnHwhzmuL
         2Kv0anDMIdmNFdvRF40vWNFqiOFExDd3MVNyKYVO2zEVne/ChqzvhPc+3IMCSQn6+j0N
         uvClFJ6T+OT9TEO5kRzjSuRWsFnvl2vpcn9FC7ZrzYds66QHuVWycHqAXKC10z8JF25T
         VfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487239; x=1747092039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oU3hP1IM611C1WkYpOLE6kbCej9Cg8bXJlI25SZwxm4=;
        b=Y/cN1mP8wflYLdlydxMIuk6o3kjhOuw2KL4JhivYHpI7QcPz4XgDhxpb92/xIJjjRW
         I+dSzUNcjjy7cCKzd66CUXcMDrQNo7CsJLxsLarmxhTGz62blfwf+4ER7idhE2Mj05bP
         8DNLVLR0uw1hxJLgPyS7xRsRUJ88CAi4yg5OPSYnIKturAZxsY/Pp1p/qPX0gUFPCmXX
         ExGbr4vW8JOG0jeDe6IiiLWBrJiCutP6loQu9MF52vRm+8lvWdmBgi4WG3/SgQ++9s3F
         ENAKifZZbFGmvEUVyYjaQmVR4IDk7IFnq2Ab8KHzEjaAuWd6macwG6RYaq1TY+JUuK/m
         INvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnUL2KEX7RT4Ty6TNtsao3tp/jOzSVaaUSQGCgVcC6+F4JFuxrO5KoS1wBv/B3TmM2f5Nn10+4FCh0QQ==@linaro.org
X-Gm-Message-State: AOJu0YxYHqvJhNNdqiT41FirSmcMxn2ork+QnJVBmNnGo5IhxitwgHub
	+4sGOYEqdoQqIq4XXuEVQwKmSJdB3COu8hQiZ20HBowj2na7RXrahB3ccBC/Ckkn9w==
X-Gm-Gg: ASbGnctvSsJLeAA7i0h0rXTn5S4RwE7UxaAZoG7aE6dle0z100qomStAejMWhAyTAKz
	ZOYabBrF5L0ieAX8eFnN8X9Ua67QptM2fdn1SXJtSKKk03fVrXA4T3Oo+BuMUHlgFiU6DfE2uH6
	10noYfOsbfdUeo8MPr2BneRiTaXrjOpNPfXe8+rc5kVhRBshIvkBzNOnEevDBlZPet5UKqUvCL/
	BSoHtTzg55h96EoBHvRAcicKKzvEyeRxLrk7wqsQcjfnS8ynUZK72+27yKKIR8AuDi47d9MTX/9
	xq59c94BX6X6ALsShukcw5ZQ8sc6oyxJ/wZaQPHj
X-Google-Smtp-Source: AGHT+IEeQn5CnaDJkgJrvd4w2rWjGIxMS+SZ2bixNnuJIzYcZR/FEvQuhLkOTW8Ra8Q6iuMjA6Xc0A==
X-Received: by 2002:a17:90b:268e:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-30a7bad37a1mr1863711a91.2.1746487239310;
        Mon, 05 May 2025 16:20:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:38 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 21/50] target/arm/helper: restrict include to common helpers
Date: Mon,  5 May 2025 16:19:46 -0700
Message-ID: <20250505232015.130990-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Pfs8Kz/ha2Cn

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7fb6e886306..10384132090 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12,7 +12,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 #include "exec/page-protection.h"
 #include "exec/mmap-lock.h"
 #include "qemu/main-loop.h"
@@ -35,6 +34,9 @@
 #include "cpregs.h"
 #include "target/arm/gtimer.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 static void switch_mode(CPUARMState *env, int mode);
-- 
2.47.2
