Received: by 10.25.159.19 with SMTP id i19csp857950lfe;
        Fri, 12 Feb 2016 06:37:04 -0800 (PST)
X-Received: by 10.67.6.10 with SMTP id cq10mr2597865pad.120.1455287824327;
        Fri, 12 Feb 2016 06:37:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com. [2607:f8b0:400e:c03::244])
        by mx.google.com with ESMTPS id 89si20405823pfr.21.2016.02.12.06.37.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2016 06:37:04 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::244 as permitted sender) client-ip=2607:f8b0:400e:c03::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x244.google.com with SMTP id gc2so140567pab.3;
        Fri, 12 Feb 2016 06:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gt6zuhY8go46uhbD6TiaaU4q+HV5eQo4Df2V8hqEju4=;
        b=O0d3kU1pNL9K6Tllk8dIcw9dl6GRIU/mKYoFNXvbnaOPJArM4AVrVuF2mGNboud/Ii
         eGFWGJj/OfMHZVBArx9eFmWE+dDPxVX5JRQKTt7uvZcm0y1so2mc/xsoJ6aUwNlm12//
         /VG+qgwPKgP1Tdw8DRBjhC+PLkLiw52K9zB9MED/+qh2965Sy4DPYaTcTKOoy1au2MSZ
         bS0v2br6wABaN3AZtwMJkYja0HJxRSy/1HdT/fY68Pn9jSJYrMwz7auT3knx86uoG1x8
         lLtWirkJtbLlNXs/ATU7JiTzqLx6Vum8DpvruTAgphqFxdtLrSRg3J3zixhbRZk1ryL4
         /3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gt6zuhY8go46uhbD6TiaaU4q+HV5eQo4Df2V8hqEju4=;
        b=gMLuN3vpgxO8r6YMsfHBUTsSulifQkWzBLpoIc2tneyHYBo0CJCbdlax2bza+oO6kb
         f9lfgAbtSmRoZdVxeHmXEmq8QHWxfVIQR/3YWCcPyTf0RI+Axvn60hzkUR+B+6uqp1hy
         2qfwysjGRFDptFVb9rAtaP54Jx5uG42VRRW8figm+oXav74iK5yNgiJqqz1a2BOzbMmt
         yHAUan/7S+AKHkRFPXNoJn8j3n9H8CYZ1BIXNof5FQuLdMmNaFw1bwOm0oAzLv3J5Y+z
         fFzpN+RJ64u3aDl8+v/SZ2AGqFPHds0qiNlqHk6hDn5wTbfjB7QRCjRN5sZGFlE7F1VV
         Fw9g==
X-Gm-Message-State: AG10YOSinsCthbnootA7LNvhtFCt+fvFD8dHVREc/mIHX8MNU4ZOb0h7+9idKkpEnglA7A==
X-Received: by 10.66.250.199 with SMTP id ze7mr2527936pac.103.1455287823977;
        Fri, 12 Feb 2016 06:37:03 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id f12sm19976759pfd.87.2016.02.12.06.37.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:37:03 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 7/9] target-arm: Add the ARMInsnSyndrome type
Date: Fri, 12 Feb 2016 15:34:00 +0100
Message-Id: <1455287642-28166-8-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: RskU3ruXh7ic

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add the ARMInsnSyndrome type including helper functions to
encode and decode it into an u32. This is in preparation for
Instruction Syndrome generation for Data Aborts.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/cpu.h       | 22 +++++++++++++++++++
 target-arm/translate.h | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 5137632..a00a121 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -123,6 +123,28 @@ typedef struct {
     uint32_t base_mask;
 } TCR;
 
+/* Holds the state needed to create an instruction syndrome.  */
+typedef struct ARMInsnSyndrome {
+    /* Data Abort section.  */
+    struct {
+        bool valid;
+        unsigned int sas;
+        bool sse;
+        unsigned int srt;
+        bool sf;
+        bool ar;
+    } dabt;
+
+    /* SWStep section.  */
+    struct {
+        /* True if the insn just emitted was a load-exclusive instruction
+         * (necessary for syndrome information for single step exceptions),
+         * ie A64 LDX*, LDAX*, A32/T32 LDREX*, LDAEX*.
+         */
+        bool ex;
+    } swstep;
+} ARMInsnSyndrome;
+
 typedef struct CPUARMState {
     /* Regs for current mode.  */
     uint32_t regs[16];
diff --git a/target-arm/translate.h b/target-arm/translate.h
index 53ef971..a94e17e 100644
--- a/target-arm/translate.h
+++ b/target-arm/translate.h
@@ -151,4 +151,61 @@ void arm_free_cc(DisasCompare *cmp);
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 
+
+/* The following describes the packing and unpacking of the Data Abort
+ * section of an ARMInsnSyndrome from/into an u32.
+ */
+
+/* Field widths.  */
+#define ISYN_WIDTH_valid 1
+#define ISYN_WIDTH_sas 2
+#define ISYN_WIDTH_sse 1
+#define ISYN_WIDTH_srt 5
+#define ISYN_WIDTH_sf  1
+#define ISYN_WIDTH_ar  1
+
+/* We use 64bit deposit to allow for overflow checking.  */
+#define ISYN_SHIFT_IN(val, isyn, field)                      \
+    {                                                        \
+        unsigned int width = xglue(ISYN_WIDTH_, field);      \
+        val <<= width;                                       \
+        val = deposit64(val, 0, width, (isyn).field);        \
+    } while (0)
+
+#define ISYN_SHIFT_OUT(val, isyn, field)                     \
+    {                                                        \
+        unsigned int width = xglue(ISYN_WIDTH_, field);      \
+        (isyn).field = extract32(val, 0, width);             \
+        val >>= width;                                       \
+    } while (0)
+
+static inline uint32_t arm_encode_dabt_isyn_u32(ARMInsnSyndrome *isyn)
+{
+    uint64_t v = 0;
+    uint32_t v32;
+
+    ISYN_SHIFT_IN(v, isyn->dabt, valid);
+    ISYN_SHIFT_IN(v, isyn->dabt, sas);
+    ISYN_SHIFT_IN(v, isyn->dabt, sse);
+    ISYN_SHIFT_IN(v, isyn->dabt, srt);
+    ISYN_SHIFT_IN(v, isyn->dabt, sf);
+    ISYN_SHIFT_IN(v, isyn->dabt, ar);
+    /* Check for overflows.  */
+    v32 = v;
+    assert(v32 == v);
+    return v32;
+}
+
+static inline void arm_decode_dabt_isyn_u32(ARMInsnSyndrome *isyn, uint32_t v)
+{
+    /* The fields must be shifted out in reverse order.  */
+    ISYN_SHIFT_OUT(v, isyn->dabt, ar);
+    ISYN_SHIFT_OUT(v, isyn->dabt, sf);
+    ISYN_SHIFT_OUT(v, isyn->dabt, srt);
+    ISYN_SHIFT_OUT(v, isyn->dabt, sse);
+    ISYN_SHIFT_OUT(v, isyn->dabt, sas);
+    ISYN_SHIFT_OUT(v, isyn->dabt, valid);
+    assert(v == 0);
+}
+
 #endif /* TARGET_ARM_TRANSLATE_H */
-- 
1.9.1
