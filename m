Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413116njb;
        Thu, 28 Nov 2024 02:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUHpwE9w2tCC63LAl+nGpeXHLMHGfogdcNW9+i3wU9ZKVoK2SEKY2xMjC8TtB3uphQKXYgLSQSoImthzQ==@linaro.org
X-Received: by 2002:a05:600c:154f:b0:434:a706:c0fd with SMTP id 5b1f17b1804b1-434a9db8386mr61644985e9.2.1732790604308;
        Thu, 28 Nov 2024 02:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790604; cv=none;
        d=google.com; s=arc-20240605;
        b=MxXLRM1upuSRfmvYtBy6maFO321/5ksy4CG1ya4ssmAg46B+anhgGKhSPac9f5lmHV
         oGyDnrbtErqkSRqYe33v7CCNmRnmWNOdwwgrl0dAaRuwaokAcZRB4hjFAeEQ5VIEfZnw
         1F9BOPbTnNtU8HFwhQWOV8phoaivHf/y4wqFM4prgCKCanDqhKjLLRVelRi7AAlxNY7w
         r4Y54IXbcYifgUxnhQz2ACar3bt2iwDyhjeiURm1raoSifqyMNYOq9qR4l4Hr0nofXbd
         xg41c9n3H8VL9WYXyFFode8ezwZSWqETJ1d/7v7boOwtsqU1uZfzj761eMXdpKB6yGDJ
         pErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iZVybYeuTrOgtrqao8PQeLVJYcnLhthP9z/tircoyS0=;
        fh=/aAt3ZWTHmAH7dpf+e2oNIqLwBoCnUXufWo8IWl6JY8=;
        b=YdHhvzyOiT5PDGj53WDnHPXNF92QLXAsmxNKKK9COIs9iTIPFFbgkNgVDUWUN3uNVu
         GXSrsNmlrVlw3DiEmB4zlt4CrbKlSTXspgGU6Sb4asZhDjHxPJn6JDzttSkZpKcvJEw8
         LRbGEaqvhbEDUwFNt013fo/wRtxHXR9XRWqmdjplCyqH6l5oVq39rBaG5Gx0BuYcmV2c
         z2jkPFc9KeeudHApI0xx7JEAM/HYSJaXrq/+xj/sUd/r/96Aul8jRIZiP2vxX03d2kDQ
         oUiaNVRC9gr4Ryexen+YkdiWag0rSczHBOjHNdUi9xORUUlFY0Z66mF/WvLltsXKY8c4
         qHXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QX5v4+R7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a0a05sor5078865e9.11.2024.11.28.02.43.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QX5v4+R7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790604; x=1733395404; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZVybYeuTrOgtrqao8PQeLVJYcnLhthP9z/tircoyS0=;
        b=QX5v4+R76TMix9JWjiHnf3bJmtCzNqiuplA/gF5YHxotahH380yDXRA8h8wLkrqEXq
         tpCPeYPPkHobCOKvt4LRHmgMazrgTIFiSGWrrCXzHMGtsYyqe8fxglvffAWcrd1MtqMb
         bkaf7YsPibtgZjc3uatfsKqiJxPjACsVJbEyWjkXUi+j17JbP/MRJerXQb5wMkLTWC9d
         6WAf0QGoMrNtEufqYqsw41WRXBAeqLXmHS9HL4TCrWy2BQ3628vTSX+VCBswTI4s+4e4
         sZzsqKztW/wFcxS2kCnW2oW3dP3ldZbGFbbwU1il0e4nZ7edBDQ7elAk0EsrOYjopxeM
         bGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790604; x=1733395404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZVybYeuTrOgtrqao8PQeLVJYcnLhthP9z/tircoyS0=;
        b=S3MYDisMOGJv+c92ziK6SG7rYGv5gRL9JeXKgmBjyqxBi2AdNlWKJoHM3IiACEZepA
         tYDcM+fFzS3CdfX4coKOcRi7EwODGBzikuzH2Eb1o1IPmwBzrBRC7XBiYCfqL9+JVndB
         Fk8Yu89PMPXUIiPY9HbJ4LQd4aC65eh8bQyA6w49/c3uk2Y1Wiso91sJmp/e/mfKd38h
         R9RMZEN4Pw4Fp+W1yWMrZeClRRs8sdIYn3hiRR7hs1PAFxPaCm3DK8n+ZyMv9+iTQeTj
         MogC8YpL6h6muYZYHoJdNrrTOmSuFy/lLQtmBGY7i9jtHMYvY51W4bW4Tgabmmi04lMG
         A1bg==
X-Forwarded-Encrypted: i=1; AJvYcCU8zjn9EHrvCibE/p/UPyEs0/BtoDa/5q6K0kSGheSGr8Kmcayxs85o9CcycDVe4NRRpk4+y8/6HtdaUw==@linaro.org
X-Gm-Message-State: AOJu0YxUm1nPzk59HpOYwd20eZyZ6yK8VraOMyRR5yFr5t0ULinXSB7s
	eNhFOWlbTTsKQAaoTJOHDa0c+BL9IcgBH7+3/g5CrCd6+mWY8CzwHQx+z+nDnYQ9HA==
X-Gm-Gg: ASbGncscvxiW4ucB1Lb/oYX0hn1+5rhiSZZ0KFyGOoXEVHOe1J3YnyV2CHKqlzmp0XC
	5QFKW+RXmr6NVD/RnnyhWMbtEiVoC+QVckJNVbBfkiUhFuZ6FbPSiA79G/s5So1WdusYSdZhhfP
	hlIZQmJXiAsrZ5oab05GUa+qxmUr/Vk8R0/AzQ3qQ8gRKcVatmJpb9A1JYlDO8gkahgmhJjaedx
	qzSV0kCt/HWLYzTtQHmacfgi14lWOzh22bcqErq4Vn6QgEZP6XdSBo=
X-Google-Smtp-Source: AGHT+IGCTKRozhkWgjwMEGkUuizRTcex3BoClUrzEHGN3q3D3nUN2r90Xtnbg5I926y0Oe4UhmEuAQ==
X-Received: by 2002:a05:6000:4819:b0:382:464e:1ab4 with SMTP id ffacd0b85a97d-385c6eb850bmr6283508f8f.3.1732790603802;
        Thu, 28 Nov 2024 02:43:23 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:23 -0800 (PST)
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
Subject: [PATCH for-10.0 12/25] target/loongarch: Set FloatInfZeroNaNRule explicitly
Date: Thu, 28 Nov 2024 10:42:57 +0000
Message-Id: <20241128104310.3452934-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hNUF6Ttt8lmx

Set the FloatInfZeroNaNRule explicitly for the loongarch target.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/loongarch/tcg/fpu_helper.c | 5 +++++
 fpu/softfloat-specialize.c.inc    | 7 +------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/loongarch/tcg/fpu_helper.c b/target/loongarch/tcg/fpu_helper.c
index 21bc3b04a96..6a2c4b5b1db 100644
--- a/target/loongarch/tcg/fpu_helper.c
+++ b/target/loongarch/tcg/fpu_helper.c
@@ -32,6 +32,11 @@ void restore_fp_status(CPULoongArchState *env)
                             &env->fp_status);
     set_flush_to_zero(0, &env->fp_status);
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &env->fp_status);
+    /*
+     * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
+     * case sets InvalidOp and returns the input value 'c'
+     */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
 }
 
 int ieee_ex_to_loongarch(int xcpt)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index ad4f7096d09..05dec2fcb4c 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -489,12 +489,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         /*
          * Temporarily fall back to ifdef ladder
          */
-#if defined(TARGET_HPPA) || \
-    defined(TARGET_LOONGARCH)
-        /*
-         * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
-         * case sets InvalidOp and returns the input value 'c'
-         */
+#if defined(TARGET_HPPA)
         rule = float_infzeronan_dnan_never;
 #endif
     }
-- 
2.34.1
