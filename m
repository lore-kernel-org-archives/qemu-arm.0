Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086129njx;
        Fri, 25 Oct 2024 07:13:07 -0700 (PDT)
X-Received: by 2002:adf:f487:0:b0:376:dbb5:10c2 with SMTP id ffacd0b85a97d-3803ac68a35mr4314218f8f.29.1729865587459;
        Fri, 25 Oct 2024 07:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865587; cv=none;
        d=google.com; s=arc-20240605;
        b=jqpYRHofyOkNjTMUN/brG07tPXaKcBL57usTgMl/jalfexOoGpXVKSEv1n1rofOAIG
         jbXkWCo2ECgtMZcone5xXk6W0VgEPf5O3enoBtNq8RpUFh2uXTusfaQu0uBx4xYwSaJw
         iKOof9QGQBM98tqnZvxiGX0JP/5RjQGrz2vzwLc+eClUlnt+DGYuDgZE9WLwMSCdy+Oz
         /HYa+8aopJqQLKPizVQLnZhbrIcT0+tPGaYxbkBZR40z6x33ML1d0t+3y24kLhwluV7z
         7u7IsS7BXh7lJ9NFBEXZz73ZpOGRJE5/jxGs9SEvYEU0NFEq+wfuw2dsAKk1uAt3tZeS
         AA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+3N7Gh5ykD6QxUXP4fouNsk3DmkKRJ2QzcoWCfXISHI=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=dLzV24D9ptqlEXvh3Pxy+H5yqHJMcoANOKZ7+k9TwNZSbxFzbkuHnUi/zQzIVUd0l9
         3akusHfbRVDP7YY2jC15ethhi9NrLumklmwm4I309YwaiNmHunRIJ5AOopdBn7YXwGHR
         E96mRms2UR8+W5MNrRuUNhJxA9Lax6ZORh66+Zso9nE6YliwhmxYhzBAIfcSTUbttjHP
         9u/wSvV6YEKVEw/9JI8/aBT6OpsMtHr/g4BOWAD7bgE8TnPTucgWh4SqriDnX1pTuI/d
         DN2VTuXTmzbzXk/J3Elz5qQhuiTUoR0A02CUIYCUt91ScosAz9aH6Y6z75jWzk224jp4
         epQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d4/wq20g";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-380580ff028sor405373f8f.0.2024.10.25.07.13.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d4/wq20g";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865587; x=1730470387; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3N7Gh5ykD6QxUXP4fouNsk3DmkKRJ2QzcoWCfXISHI=;
        b=d4/wq20gHAiWdd0UBNyF56x2AQVdA1znr97qP2fYv9aQ8Duxeea90XPEzvIJGl1PW7
         Bo2hGdoFlu5XecryH9mJ1buU6azylrwVTLULQAKkDEqSlP9W8SLvnJlX2B2kOtshG8gT
         TyPurcK9uNRFftCFAGuK2hidqlwNKSyp0AFS7XOwUW3OEw01ApMQ5pBucOVYgX08XVLC
         BHmjc0c7SYW1AL4p2C2XeuxKZRROWezp+XcKRrffMArd8gNg9E3u0hk8BfrXCMPm8Fp6
         ieJ2SrplU69n4F/M4iw6j1N98EJqnIbR2ZtJrsBhtM4tw4K5RuPIuvigc41iI71dpQ7R
         xT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865587; x=1730470387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3N7Gh5ykD6QxUXP4fouNsk3DmkKRJ2QzcoWCfXISHI=;
        b=hmV25GPPHp0MDoyGz9m1KD3dwRK+C2RI+oAZ9Ae+giNHfdD3Ao+xNO8iPwryFdro/c
         fDmQVmo4HTvTM5uc3EBy6mPoylY1/Hr9Fy61KNFoxWdfA+3QEev7l0ojOQEk1Xeab5uj
         o67EWZ1oXILv4uXWCqi8xCQRIAntmYh3NAfzQhSexTKE7WBxegNNbff36Q728MKypd03
         g800WswTurwkaRonymuxdkKXcmraB1kKchUX0w3KG85aCsKiVDsWQ3WCxWKmJnKBKqXA
         MYtVbtBlIHp3uY+wjsc9rf3IAweNUqn2hPN/YdD6XoakQX/tNgcYDwysjgdWSeoWXQbn
         wzpA==
X-Gm-Message-State: AOJu0YzrNQPkrFcyuj75+svhFnOfhUtovc9ybmZEvwxiBFe8rbPwYkL/
	oJtFYUEbEx+PU5PtYJR3/jVcXClor7OHvX7/2JBNwV0fMXdvluff/IDpTWvMFLmH4Q==
X-Google-Smtp-Source: AGHT+IFELKEdswjTGifEl1YHesJLSbvwyrbGh5IhwQ+SHELG0FMMmzYmcW2PCs8GDLSYanzPnyZ5mg==
X-Received: by 2002:a05:6000:d0b:b0:374:bd00:d1e with SMTP id ffacd0b85a97d-3803abc2879mr4856955f8f.3.1729865586918;
        Fri, 25 Oct 2024 07:13:06 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 12/21] target/sparc: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:45 +0100
Message-Id: <20241025141254.2141506-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YzXRCNambAp+

Set the NaN propagation rule explicitly in the float_status
words we use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sparc/cpu.c             |  8 ++++++++
 target/sparc/fop_helper.c      | 10 ++++++++--
 fpu/softfloat-specialize.c.inc |  6 ++----
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index e7f4068a162..dd7af86de73 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -26,6 +26,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/visitor.h"
 #include "tcg/tcg.h"
+#include "fpu/softfloat.h"
 
 //#define DEBUG_FEATURES
 
@@ -807,6 +808,13 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
     env->version |= env->def.nwindows - 1;
 #endif
 
+    /*
+     * Prefer SNaN over QNaN, order B then A. It's OK to do this in realize
+     * rather than reset, because fp_status is after 'end_reset_fields' in
+     * the CPU state struct so it won't get zeroed on reset.
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_s_ba, &env->fp_status);
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
diff --git a/target/sparc/fop_helper.c b/target/sparc/fop_helper.c
index b6692382b3b..6f9ccc008a0 100644
--- a/target/sparc/fop_helper.c
+++ b/target/sparc/fop_helper.c
@@ -497,7 +497,10 @@ uint32_t helper_flcmps(float32 src1, float32 src2)
      * Perform the comparison with a dummy fp environment.
      */
     float_status discard = { };
-    FloatRelation r = float32_compare_quiet(src1, src2, &discard);
+    FloatRelation r;
+
+    set_float_2nan_prop_rule(float_2nan_prop_s_ba, &discard);
+    r = float32_compare_quiet(src1, src2, &discard);
 
     switch (r) {
     case float_relation_equal:
@@ -518,7 +521,10 @@ uint32_t helper_flcmps(float32 src1, float32 src2)
 uint32_t helper_flcmpd(float64 src1, float64 src2)
 {
     float_status discard = { };
-    FloatRelation r = float64_compare_quiet(src1, src2, &discard);
+    FloatRelation r;
+
+    set_float_2nan_prop_rule(float_2nan_prop_s_ba, &discard);
+    r = float64_compare_quiet(src1, src2, &discard);
 
     switch (r) {
     case float_relation_equal:
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 226632a4d10..8bc95187178 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -404,11 +404,9 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     || defined(TARGET_RISCV) || defined(TARGET_SH4) \
     || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS) \
     || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA) \
-    || defined(TARGET_S390X) || defined(TARGET_PPC) || defined(TARGET_M68K)
+    || defined(TARGET_S390X) || defined(TARGET_PPC) || defined(TARGET_M68K) \
+    || defined(TARGET_SPARC)
         g_assert_not_reached();
-#elif defined(TARGET_SPARC)
-        /* Prefer SNaN over QNaN, order B then A. */
-        rule = float_2nan_prop_s_ba;
 #elif defined(TARGET_XTENSA)
         /*
          * Xtensa has two NaN propagation modes.
-- 
2.34.1
