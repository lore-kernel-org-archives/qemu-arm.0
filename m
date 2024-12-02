Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801540njk;
        Mon, 2 Dec 2024 05:13:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbmVzVU0E8Xc1NYxNdN22ZP0BL4VYD/E2U81Y5ADydaLu/7aHicNyTmP6MThWeFmwth5aCPVsybRTHwg==@linaro.org
X-Received: by 2002:a05:600c:35d1:b0:434:a923:9310 with SMTP id 5b1f17b1804b1-434a9dc7880mr211345485e9.15.1733145232778;
        Mon, 02 Dec 2024 05:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145232; cv=none;
        d=google.com; s=arc-20240605;
        b=eiYcK5Kg0zcAMfMpSQw3FMkv8jbDfvObPvjDixxm9OmhtUCrpMcUjF8lFs5baGT/cR
         7t7jTjUlB/ETc+eGUTBdbfMs+GDKtB5wFKWoKzq9H/DYlMIrEbqw0gozOWo56/x9vrt2
         WpfCCOV6fMjCH2WqA1uvgPNQdjvb8s4EIVF9P9nCgSNhmr5cP+GUtkvFYtWebi272eeK
         seVABC/06zGvjdlsXjSWXRiAEaOklnRopM7qc1bW26dHVFV1gfhPnJAtVj/L01YBTIqv
         QCmqf7J81OBRfJ3TlP7YvOVwoyBEBui70sFjcgCXTqZBJRAfFGObGUfk007zXj2w2sWA
         iGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uI1GHeNAVBACaAOyrekRei9EE5yyDUO5Im1pzl3+9DM=;
        fh=CVxF58ZL/r7hebvL7hao9DredciYgxmO5bjS+9xBUnU=;
        b=Fz1XPE9NN25/5h0vAft46YVuzZYKLSo/eX+n3GATb0unc1bcEqezbrCCbkOhJV4NkN
         s+pszu5o9gOme5XYxKpTHEkyFQv5wxGvYp+orJ5W3en7fFEIH54CgSZiZfSKlhEcREda
         FR5JLo+b9xsHEIDsEHSgQgdZ1XHZYUY4LCcQchzQ4NN+ouUIywitXWqUK1TaI52xOUFd
         9GJfejvE62cI7/ZPPewRNbtdo/bQIKcqp4Z/VmX4heN0/7maVIYA1Ia4FLSZw1luqrg7
         vAPOF9YZQxAH3lW6D42sFQ0Vnmhaa5Z+X9fhiS8ZskCvfPh9rLJFLirnfgonUVp38qTc
         sXSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5i3wTvA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b0fc775bsor33237935e9.0.2024.12.02.05.13.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5i3wTvA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145232; x=1733750032; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uI1GHeNAVBACaAOyrekRei9EE5yyDUO5Im1pzl3+9DM=;
        b=B5i3wTvAlluD6hFa512cB4PS3pBJzq4LC1+v1aJz84/5ANLbJitwZFjo4od1RfUyLC
         j4k6cor5VL2tcpaYE4ysl9pNSWQMzwAkKPWODLPtPDYN1sGR3wXt5fR73CTnJ9EnVcOS
         /plYarLxBuoZ/BlEjcY71Zj/g+8y+KbdM+OPv2JG+WX37hXNFRfb4kXV1FcbavIuJcWD
         ILbs8AhCZyugLgi/q5UBa3+a4vuInZxobcHzHxwGz8fHFFuRIunHGz76h8RZ+YhByjks
         f/6wF/lCzgHsr/2Frjw9cTdk035FQAyqU87pYsmc1zznDdtCyPtjHZ5RhfxvspyktMHp
         IMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145232; x=1733750032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uI1GHeNAVBACaAOyrekRei9EE5yyDUO5Im1pzl3+9DM=;
        b=QFniNehcuHKSnXtaTEdlHoDb+E3R5ElBrPRwOBDCB+CoAbfOVySKv3I9OTf4IeAp8/
         OQVrDaMxGHhVEwOtCgZvDC3+3dDTNn9Z4afeDFCiUfmo1eKjOHJ1ZIT5X6VbkFndvddJ
         4Qm3TH0dS0+bCin6XmjX6Sqpae9TfQ41puK4P6p7GmK/UeO7afHHwdKqlFjPuJgeDddz
         Qly0Wr7thR0iULiBs0Ze2LPuRz+cfXP7TaQCSSLjtECbJoUX4h5plVEVSd/OdiPiBRDy
         PKwCvZe/mpF+rCQY+nh1gz7dvfxUteGUigymVEYyVAz+K91BHsMxHoSuCql0bhP1k7KV
         l0Tg==
X-Forwarded-Encrypted: i=1; AJvYcCX5jek+ANuu5ol58bl/1ezbighYgVQVQ5epK0P787F6uGgA70sUEMfj1953CuG9uEIj7VxLVlPt6s2tyw==@linaro.org
X-Gm-Message-State: AOJu0Yz0YjNYKZ+lbUVjMkpgQVaV+JZU/6Og0p3iGzTDogxi3YlnBTya
	PHYePQ8rc/Qjky46TXkbeNsPBNUhM8kYgvTUpeYHQSG6orHFwRTw16upbdFFreXbZw==
X-Gm-Gg: ASbGncsvpISqQ+ghi6m1CbeVn3MkETDxr+9EQN7ZLvgePfcdpcQhe/kDBBbNJoTlYxR
	77nCDe6YTHKa7n4SVQjLwWCQ65qpKRR49FiKL+gfUgwr8FRQ/AtsZU2gXNjneO7uWU/bW81aUcn
	vtmVdePZQJ7zHEwFjMizMTSqzD0/SWUl2EPa29Cy/iFgRL4tfW9+8D+1p+ZXgk1c4vMzjuAjVQ+
	n7Ws7Dw4ncRhNPdlI6BefL2DuNvBWEAgznZlhD/naPOWtq4X/4RZZI=
X-Google-Smtp-Source: AGHT+IE3HY3Zmx7VHI2U1o+7kzmrqBCN6P/KD891ThH3cDUW8P24XUquBX9h9pjzJ8Nvf6/yFJ2y/g==
X-Received: by 2002:a05:600c:4fd6:b0:434:a781:f5d2 with SMTP id 5b1f17b1804b1-434a9db8483mr197860975e9.5.1733145232101;
        Mon, 02 Dec 2024 05:13:52 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:13:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 02/54] fpu: Check for default_nan_mode before calling pickNaNMulAdd
Date: Mon,  2 Dec 2024 13:12:55 +0000
Message-Id: <20241202131347.498124-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8glblAc+B6up

If the target sets default_nan_mode then we're always going to return
the default NaN, and pickNaNMulAdd() no longer has any side effects.
For consistency with pickNaN(), check for default_nan_mode before
calling pickNaNMulAdd().

When we convert pickNaNMulAdd() to allow runtime selection of the NaN
propagation rule, this means we won't have to make the targets which
use default_nan_mode also set a propagation rule.

Since RiscV always uses default_nan_mode, this allows us to remove
its ifdef case from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc      | 8 ++++++--
 fpu/softfloat-specialize.c.inc | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index d63cd957a19..aac1f9cd28c 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -77,9 +77,13 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
         float_raise(float_flag_invalid | float_flag_invalid_imz, s);
     }
 
-    which = pickNaNMulAdd(a->cls, b->cls, c->cls, infzero, s);
+    if (s->default_nan_mode) {
+        which = 3;
+    } else {
+        which = pickNaNMulAdd(a->cls, b->cls, c->cls, infzero, s);
+    }
 
-    if (s->default_nan_mode || which == 3) {
+    if (which == 3) {
         parts_default_nan(a, s);
         return a;
     }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index c557c41b2af..81a67eb67b5 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -475,6 +475,13 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
 static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
                          bool infzero, float_status *status)
 {
+    /*
+     * We guarantee not to require the target to tell us how to
+     * pick a NaN if we're always returning the default NaN.
+     * But if we're not in default-NaN mode then the target must
+     * specify.
+     */
+    assert(!status->default_nan_mode);
 #if defined(TARGET_ARM)
     /* For ARM, the (inf,zero,qnan) case sets InvalidOp and returns
      * the default NaN
@@ -578,8 +585,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     } else {
         return 1;
     }
-#elif defined(TARGET_RISCV)
-    return 3; /* default NaN */
 #elif defined(TARGET_S390X)
     if (infzero) {
         return 3;
-- 
2.34.1
