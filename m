Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509324dyb;
        Mon, 23 Jun 2025 05:19:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUG98hwtybHyyWbZvEwU4chiLZCzD0LvS12RfE4cGnj9rIgzQgBU2ZWDNSvhT6KgDVtvP1IJJnKtnRaoA==@linaro.org
X-Received: by 2002:a05:600c:3b1e:b0:43d:fa5d:9315 with SMTP id 5b1f17b1804b1-453659c43b2mr102157375e9.33.1750681143686;
        Mon, 23 Jun 2025 05:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681143; cv=none;
        d=google.com; s=arc-20240605;
        b=IhVQGZDGv+9+zt8NzjlqcepHYOxvEpLHbDHza4Y2I9t7F2DQDtvbjT6oLijumq6D4f
         dZ0mO910zvC4P9BW/o1giNGQJv/cqUHEWh2krP1fK1kNtrkyy/3G/nmhoG90GcicixyJ
         iAMU1vUvhNVavvWYIDjGHQTMFG1tB26M2u5+Q7AgNvqV+sVgLczYepeDifnoknPadbO9
         52EWay8vA50AAp+11A4oKH2DTNCVD+nVazwKhopSLyz52Df9cNuj8tLWXOLQRKzs62gT
         QQx/4xi6RMazN+jYLjsH9f1OkqQ7IM8iZy6gKUyykYtgptuOBE9083cRVTOu1ZNNcFAP
         9FcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g4jpPoIjWAnN20gltB2a/vOsrmaIk3+mmplMj5/YsrY=;
        fh=shUeVy5u6TvwGJ4KF2FZAptnN6psAf2btFKUQp1BMB0=;
        b=FtEfG+p9ba8mE3a5W1S5esgv9P8bU2ARVRe/JRaWJ+8qgfp9CcEwCDQhihrSW9qhiC
         0+pGAXmlaApRuWQS5iS4mMKpK4SHfE5b/VlfpJX5EYsstbXajzGmRu5FGcJE3DYxSpHP
         eLEwDb8D2sJLPA1czJ4j8yeZtNETquuWPqJWAWxR+Ri3RS4zyp+hfccjGSi+g4M5pJM/
         B9Bn02HJxYLJN5yKtynVHcWRR3M0or1YQgeGPkFkZU+UOssglCRd8aG0e887JVKv3Bc6
         dZ6sZAE0pOHdsbGv4NMZ1E/FoYQW5882AqnHIXUe6wZ10EKl/HvzT0d25tdqtAgnGUAS
         9Uwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lmicznGr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453659dbabbsor21478295e9.1.2025.06.23.05.19.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lmicznGr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681143; x=1751285943; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4jpPoIjWAnN20gltB2a/vOsrmaIk3+mmplMj5/YsrY=;
        b=lmicznGrZi7yKIAyxb+fxOrfB0EAFdxcul1PGFIRuLdorYGKYiI1n5OrUSJsR97gxC
         nd8zcNJ8b4V0l/yS1q7nFJW/78xYQjyx4Y25OZk47iyhw+sfIIWlRVOs/YsK8HFwlDPv
         sbq1tlw4s+Vr5VP03HlS8/ap91aF9N+VxsY0M+1YML4Cy4wdRaO1juunNjcsMSC1Es4f
         wQ/n7t83GCBe5PFMFcnm91wQETY7pzmfS9jhR57yGRRPnqaIxDj8q6MP/2E0DWXbXmQu
         fpSW3cCHySQj1ij0y3/2o/azVFj8lPALJ5Kyo1lI8emT3FZaQmylu5nQyWVpK2Doks3Y
         0AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681143; x=1751285943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4jpPoIjWAnN20gltB2a/vOsrmaIk3+mmplMj5/YsrY=;
        b=kbr9yXt3xgMzPHhq4OXOj9aYpCj604vV5WwG/dTZ06UchP633Wk6Ekm8P2H3/CLWXm
         6KaU0Scl8wJcC7Ti2U74qSOoqEzMWU36II3XD9k3fZPKXTTGWD/LfqMT7DfhO2h3h1tG
         qteEUyufg4Cv0l8e4Cg8PsSAlAaOKWOFVkBBeQU7/jPQxVfPyKCzHfpd1lSBdq2FodFK
         8gaBXVDrhkSnJLACy37IseXVJ1CKDICcbm4aR3Z7rd1un5u4Uu2OFxmzy2+YpjUlV4kT
         JjBbYHhqKPSTR/hOXBPse61vNZsvJ+5VNZrc9qpfgFIyit4XjitrsItg7E4E/M/l0OBK
         42vg==
X-Forwarded-Encrypted: i=1; AJvYcCXzemCNW91vd9Dc/+f3+uL4fmsE7xwdE8K3krJ16BIsl9pkEIKcKAmA2+zNSpM+4jcQv77Gy1Bnh75jUA==@linaro.org
X-Gm-Message-State: AOJu0YyyHjrY/aHn9EyaSzM/lSG3cGe/H04w8uy38nOp7WeQP2/+JxoU
	C5zzigD78J7m++j2VOWWk+aErcd91sg1hSLZV6vEqKM1+qB9ov8IU0S3/DqH8wEHkLKQy2yrMAu
	d0KEWbiA=
X-Gm-Gg: ASbGncvru5xWf149bfQ/FACYTk5VHiw2+P01N0C72iR24Ex7oVBtkd1AsmwxLVZnjhj
	XE03azUeDtKABQOUJ9GUk6M4tkRwnrw3SBWN6Ovp/zFGkfNm3ugZ91epA0KAjhTqnG7RgkTiB8y
	JhPFWpmKLl2XUsYmc3GqNjjwLCdjGI6GUSopXl6vVdrHWsPlwQlED7k3mkFSyruGQF7vu0A1ucu
	2LRjz49CrGPYbHlFJz+vZltZ8HCQPeGx1iDKG3/fEeRKH1wxjFlnkGL+zbV/OJSLsQnBewar/l3
	szxlttbHpghqjNkfaDcYavmdOkFl1BztjmQZWI19YgHzz1IWQ4DYzCsdqS+aLBTzdG19tT+GxG2
	BlA5InrHhDU7RCoptjuOiAKiIoP5i3xn2DE0wTiyRTFyHgmQ=
X-Google-Smtp-Source: AGHT+IErlri5hkyOBSvRe8fCS9DDCc0yz8mXpTeS1g951cmKKKfzy6/tEWFiO/Q3SrTle+JMSQITVA==
X-Received: by 2002:a05:600c:3ac7:b0:450:d019:263 with SMTP id 5b1f17b1804b1-453659aef70mr119085105e9.18.1750681143141;
        Mon, 23 Jun 2025 05:19:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f189cdsm9443362f8f.35.2025.06.23.05.19.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 03/26] target/arm: Unify gen_exception_internal()
Date: Mon, 23 Jun 2025 14:18:22 +0200
Message-ID: <20250623121845.7214-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZtcjOorI0uxv

Same code, use the generic variant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     | 1 +
 target/arm/tcg/translate-a64.c | 6 ------
 target/arm/tcg/translate.c     | 2 +-
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 1bfdb0fb9bb..0004a97219b 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -347,6 +347,7 @@ void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
+void gen_exception_internal(int excp);
 void gen_exception_insn_el(DisasContext *s, target_long pc_diff, int excp,
                            uint32_t syn, uint32_t target_el);
 void gen_exception_insn(DisasContext *s, target_long pc_diff,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ac80f572a2d..7c79b8c4401 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -433,12 +433,6 @@ static void gen_rebuild_hflags(DisasContext *s)
     gen_helper_rebuild_hflags_a64(tcg_env, tcg_constant_i32(s->current_el));
 }
 
-static void gen_exception_internal(int excp)
-{
-    assert(excp_is_internal(excp));
-    gen_helper_exception_internal(tcg_env, tcg_constant_i32(excp));
-}
-
 static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
     gen_a64_update_pc(s, 0);
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 9962f43b1d0..f7d6d8ce196 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -372,7 +372,7 @@ static void gen_rebuild_hflags(DisasContext *s, bool new_el)
     }
 }
 
-static void gen_exception_internal(int excp)
+void gen_exception_internal(int excp)
 {
     assert(excp_is_internal(excp));
     gen_helper_exception_internal(tcg_env, tcg_constant_i32(excp));
-- 
2.49.0
