Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4049750lfm;
        Mon, 24 May 2021 19:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFx/V5SAYvVZJh0dmRuVm7TKxL2sWglALeCHqMgnzh10/zk62BaXmazvmox4LtbxbzBlXq
X-Received: by 2002:ad4:4c45:: with SMTP id cs5mr34085349qvb.6.1621908263168;
        Mon, 24 May 2021 19:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908263; cv=none;
        d=google.com; s=arc-20160816;
        b=H75hsv+Qf4V/XVFEbbT54AUlAEUoMHqaFtfYhwkOx20I5v5bUmd2DzrEZTLL/F2e9C
         vhkLcd0YQHjJvlkW+2Ridw6Pjyzd+CmrBR4Dt1KO21m4XRTM+cW4qte47mewybMv7wJw
         CoIwF/pDqKfy1WU++//LXe2Ka2YBVlJR0l1cY9aPkc3hcrksOz5aLwoXAqfZ0LtCXSzF
         qZBOxGB8hewub2wnQd2W0OlgjcIvIcbnl0Jp5ZbK8oThTHjqvj61JKpnQgaAHShQrK8D
         4Rex6vVZ4csknlb3kBZh3kE464s/YGcEdQo3ASUvqqhl6HsmGxgJXbjue1vyNQJ5bNbd
         nzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SH4+oKBkgsx+CH0p73raOV00OXwUsTnolQbkKecgOjI=;
        b=TH8xllZHkerXVMfUWDfRRLrSBLcok5bEFJKqcnqYImUkdSV62bioRJLFnhAoXXvbmR
         U8f37VEDLgoxu3MlWy8b4wbdGK7KEcmQAgk+h3dsZGBk9H9jr6vnSWzFhLxTkXsLjtqC
         G696Z3PkVDljXY6roJYS+0EB7QxaBFhlcMoOHIFK5Bx6rNOHg+YzK0UjRnXham3xHjHE
         7pOE7v58wSOHNGIDm1s+DzzbvxcJ7HhuDG7MrxybaKGQA5rntVicHoI1AoIyptEaDzYm
         9asSYHKKyyZX4wfyfKLaAyerjMrIXJtiz+WyaH8YmY4Lv0jJ+WKLMYmqcGxsiEjDDXwt
         7nRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cDVmUV1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si7872904qtw.167.2021.05.24.19.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cDVmUV1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMQg-0004Jf-Fn
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLaz-00065P-Jx
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:10:57 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLat-0005rd-J8
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:10:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id k5so15872679pjj.1
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SH4+oKBkgsx+CH0p73raOV00OXwUsTnolQbkKecgOjI=;
 b=cDVmUV1VHw/NAk9I3IxKUTMAuAg33gh6ZbN4ljcgs5SuuXAEOTb0j8VThrSsutSWFS
 DF30gPA1Qu7/haAWedrADSDihpYOoSyCnzIY2F/azNzdgflLw4Ew1JE4gmfxsnCzzSQo
 5rYGf/Lfwl8STenGDajcAK0754myqpsF8svK193cThBnK5pYwPYRAVf0MZRH63pSOzIn
 QMeMZPJcHbkZl49gTu7FnDqNZc43w++/4llEaEdBj8ds4L8pqb/ELWRm4KEoL4SNyDRE
 gESMwP+QYxK7sdc93NCm5uFdPDwUzku7ylAJQytsR3S9aQNMKYAf5GFKBIAosYlUUTTn
 sRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SH4+oKBkgsx+CH0p73raOV00OXwUsTnolQbkKecgOjI=;
 b=tEiBtA3ZiZ9L/Ew/cCPxXe1ae54uAsVGR+udDKp4xfXA2LYve4qjmA4o13Kw7dzlnW
 89vqChdpEkDjXDIJfhtRx3xz3KBxPAvz9k/Am/qGCftlzOybTb+ZOe+OTCD8s8jCVoXZ
 sTOUBloQgKyOXJnyO0Ozs9Dz8ZqWCm8kVBx0ePG/io9Zp4GIO9HqCusp3LEGBV2RvOdL
 mnV0qr2x3tFmzuOCeEqaN63LmMjRJ4e+slVCwXTrlNNAFSU+zAV0L3LwE7hICYFpNf12
 XpOxHKQLWA2egaJIyXcgtSBF03E3Bsn9HWs6an94Z1bbG74QZajLdKv1+U9kcbxZua6p
 DZjA==
X-Gm-Message-State: AOAM530bOq8RVYmPvXeGb26h+BUw8idNG2m6oaCMutFksqzlNbAtUsMx
 ocCs7Wo8mbnWX7cw98/mmHd+2w==
X-Received: by 2002:a17:903:1c3:b029:f4:9624:2c69 with SMTP id
 e3-20020a17090301c3b02900f496242c69mr28258002plh.51.1621905049956; 
 Mon, 24 May 2021 18:10:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 81/92] target/arm: Move endian adjustment macros to
 vec_internal.h
Date: Mon, 24 May 2021 18:03:47 -0700
Message-Id: <20210525010358.152808-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VIqJ49xHtH3e

We have two copies of these, one set of which is not complete.
Move them to a common header.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h | 24 ++++++++++++++++++++++++
 target/arm/sve_helper.c   | 16 ----------------
 target/arm/vec_helper.c   | 12 ------------
 3 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index ff694d870a..dba481e001 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -20,6 +20,30 @@
 #ifndef TARGET_ARM_VEC_INTERNALS_H
 #define TARGET_ARM_VEC_INTERNALS_H
 
+/*
+ * Note that vector data is stored in host-endian 64-bit chunks,
+ * so addressing units smaller than that needs a host-endian fixup.
+ *
+ * The H<N> macros are used when indexing an array of elements of size N.
+ *
+ * The H1_<N> macros are used when performing byte arithmetic and then
+ * casting the final pointer to a type of size N.
+ */
+#ifdef HOST_WORDS_BIGENDIAN
+#define H1(x)   ((x) ^ 7)
+#define H1_2(x) ((x) ^ 6)
+#define H1_4(x) ((x) ^ 4)
+#define H2(x)   ((x) ^ 3)
+#define H4(x)   ((x) ^ 1)
+#else
+#define H1(x)   (x)
+#define H1_2(x) (x)
+#define H1_4(x) (x)
+#define H2(x)   (x)
+#define H4(x)   (x)
+#endif
+
+
 static inline void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
 {
     uint64_t *d = vd + opr_sz;
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4afb06fb2a..40af3024df 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -29,22 +29,6 @@
 #include "vec_internal.h"
 
 
-/* Note that vector data is stored in host-endian 64-bit chunks,
-   so addressing units smaller than that needs a host-endian fixup.  */
-#ifdef HOST_WORDS_BIGENDIAN
-#define H1(x)   ((x) ^ 7)
-#define H1_2(x) ((x) ^ 6)
-#define H1_4(x) ((x) ^ 4)
-#define H2(x)   ((x) ^ 3)
-#define H4(x)   ((x) ^ 1)
-#else
-#define H1(x)   (x)
-#define H1_2(x) (x)
-#define H1_4(x) (x)
-#define H2(x)   (x)
-#define H4(x)   (x)
-#endif
-
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
  *
  * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 21ae1258f2..f5af45375d 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -25,18 +25,6 @@
 #include "qemu/int128.h"
 #include "vec_internal.h"
 
-/* Note that vector data is stored in host-endian 64-bit chunks,
-   so addressing units smaller than that needs a host-endian fixup.  */
-#ifdef HOST_WORDS_BIGENDIAN
-#define H1(x)  ((x) ^ 7)
-#define H2(x)  ((x) ^ 3)
-#define H4(x)  ((x) ^ 1)
-#else
-#define H1(x)  (x)
-#define H2(x)  (x)
-#define H4(x)  (x)
-#endif
-
 /* Signed saturating rounding doubling multiply-accumulate high half, 8-bit */
 int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
                      bool neg, bool round)
-- 
2.25.1

