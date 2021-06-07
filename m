Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3680999lfa;
        Mon, 7 Jun 2021 10:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX7wwVSs4dRHDGcbEvDHxXD2HmLfUuMBPIadzwUiMNbEgAUkU78ctia0t98os66YW2Vk2f
X-Received: by 2002:a05:600c:4f4a:: with SMTP id m10mr5779823wmq.51.1623085637079;
        Mon, 07 Jun 2021 10:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623085637; cv=none;
        d=google.com; s=arc-20160816;
        b=LWqaEnqVXcckc2hplPJdkVJPHM7qZWikbvvj4edF9l6HvA2zKdndG5kTVJMnbVJZDu
         a1HvMHbDAxrzAaFRWaZdf5eamvYlMBmPmyR5+oh/gChqk6mjvPNgZLVAfNh3la1IBp2w
         CYLez4oz63/59042Fx0hK9iPkeXGlQaO6DkwzFQxID9cXCthi7ls4VbOCmLrv29pVJ0Y
         GnYMLeaLJxtTxUE8ksOYoSneFRhBqUVb1Dyi1eU18h/USBgYEO/2wRA2tswDsa5GAYPG
         7ifIuy6xPJWlWjdCUWDCldGXq3i2qvV4BcZsBvyjfl7U2Rvks/trubnfFWZuDT8MtObd
         t1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qXvH1vi1pgLZA0WzTFhBoxaYbsc0kgsAP29TskDY8yA=;
        b=c5m/6nLSzJHGlu2uuinrEysBKIufOLNYssBToIn4HskTI+0V9TqaGCaalfH4lNvdVI
         Af0pdXUiC0t/k5+Nigbjt3mwaqysY7cKDz13L9FQaO9HUKFvDPNtmUsA41ZmmmOa4Dil
         9PVSEQXEe2FL2EEj1tLSnea06hoqLqGbmn5lgcHWKM/QfU5kJWSt3E2VEhNSDZuDIQAs
         WLowrvIX20LVtuBEIsHBPyr+puIjllLvaHV/qnYsKVLJnBgYjO6lgQfmskUCYhmDzRz+
         e+n5lijMtdmO6sjeAF6CvyTlj6H9yXtAygr/vygOPAxYbR1Gen4Kuwlf+jGEgoi3drU+
         GlSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=el2Ylv4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si13598905wmb.64.2021.06.07.10.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:07:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=el2Ylv4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIiZ-0003jh-KB
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaB-0007C3-2m
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa7-0007tC-9Y
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:34 -0400
Received: by mail-wr1-x430.google.com with SMTP id q5so18456504wrm.1
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qXvH1vi1pgLZA0WzTFhBoxaYbsc0kgsAP29TskDY8yA=;
 b=el2Ylv4+ZokDTvENqLinVNrcmlHyNM5+qdpwTk+SlKvOEehpu3N5nsIHJfrAOSIeHt
 q/VgSuwBe5/7pE8ZtAQ5LhEQh34AftGOHnU1j4OkzMgY08ljafCkT6fsx+hwDT2g5eqk
 BM4E9UDvqQ4J6XY+mpbJn1Z8qBZaj52FFOMo8rcGlzAsD4Kt3ZHyB5l3V3FCxadGz+AY
 LstDkr2Bx4bEdoTvUpjTxEEGuO3bTWBm3cTHHYTzmyXBJNs8Wd01QPG9UvadcJk9Yq5f
 wmFLgrac3yWvkdVTs7G+enMXYnMMVqz70S18qfB7/AergeKnmgyusrxtMjI+hxlB5PP+
 7ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qXvH1vi1pgLZA0WzTFhBoxaYbsc0kgsAP29TskDY8yA=;
 b=rB3rEwSSJahcQFevBRS1L8Ix0DoyQy5tzns4Y4zRVod1tHRyDa939/qDQ9wIVIIvkp
 E/2mu3K/uWQAgRI7c9+j4tJ3+2Rx5SwwZ/LBqD3zjf05G9LEXMXVvArXtjLpbwWUw9gd
 WsPoz9oflPNz08LAyRiXkvFhYEYFcft9oATrpmmG6QM45CH2f01lfEWm/Or9c31jw73d
 nU+0Va8cU+YQhc8bnxbUvqXaoQ3p/p10bQo+uh+UHWZilscmDqNJUtkJOG3PxhaVQ13p
 8BIKKMdVd2/fpR+6Euf/ovQY7Z+g5wH9j3k8YUhBgRh/CKuQ6qHBL0Ek+79MKHmjBe6Q
 rfvQ==
X-Gm-Message-State: AOAM531qwxLn506ddpV+hlFZ/ppzrsDkggDKi3aKRUQ43O3OgMaS0alM
 CYqOXfstug9SvSbXfqNGM3YDcvbbZRF7ZANU
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr17870285wrn.117.1623085109965; 
 Mon, 07 Jun 2021 09:58:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/55] target/arm: Implement MVE WLSTP insn
Date: Mon,  7 Jun 2021 17:57:33 +0100
Message-Id: <20210607165821.9892-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7u2QD2vEJFbT

Implement the MVE WLSTP insn; this is like the existing WLS insn,
except that it specifies a size value which is used to set
FPSCR.LTPSIZE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/t32.decode  |  8 ++++++--
 target/arm/translate.c | 36 +++++++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 087e514e0ac..4f0c686a3c3 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -672,8 +672,12 @@ BL               1111 0. .......... 11.1 ............         @branch24
     %lob_imm 1:10 11:1 !function=times_2
 
     DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001
-    WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm
-    LE           1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+    WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm size=4
+    {
+      # This is WLSTP
+      WLS        1111 0 0000 0 size:2 rn:4 1100 . .......... 1 imm=%lob_imm
+      LE         1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+    }
 
     LCTP         1111 0 0000 000     1111 1110 0000 0000 0001
   ]
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2f6c012f672..79ec185dd83 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8135,7 +8135,11 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
         return false;
     }
     if (a->rn == 13 || a->rn == 15) {
-        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
+        /*
+         * For WLSTP rn == 15 is a related encoding (LE); the
+         * other cases caught by this condition are all
+         * CONSTRAINED UNPREDICTABLE: we choose to UNDEF
+         */
         return false;
     }
     if (s->condexec_mask) {
@@ -8148,10 +8152,40 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          */
         return false;
     }
+    if (a->size != 4) {
+        /* WLSTP */
+        if (!dc_isar_feature(aa32_mve, s)) {
+            return false;
+        }
+        /*
+         * We need to check that the FPU is enabled here, but mustn't
+         * call vfp_access_check() to do that because we don't want to
+         * do the lazy state preservation in the "loop count is zero" case.
+         * Do the check-and-raise-exception by hand.
+         */
+        if (s->fp_excp_el) {
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+        }
+    }
+
     nextlabel = gen_new_label();
     tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_R[a->rn], 0, nextlabel);
     tmp = load_reg(s, a->rn);
     store_reg(s, 14, tmp);
+    if (a->size != 4) {
+        /*
+         * WLSTP: set FPSCR.LTPSIZE. This requires that we do the
+         * lazy state preservation, new FP context creation, etc,
+         * that vfp_access_check() does. We know that the actual
+         * access check will succeed (ie it won't generate code that
+         * throws an exception) because we did that check by hand earlier.
+         */
+        bool ok = vfp_access_check(s);
+        assert(ok);
+        tmp = tcg_const_i32(a->size);
+        store_cpu_field(tmp, v7m.ltpsize);
+    }
     gen_jmp_tb(s, s->base.pc_next, 1);
 
     gen_set_label(nextlabel);
-- 
2.20.1

