Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2811451ejb;
        Mon, 20 Feb 2023 18:20:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+J0UuNpk7ydzwxHPIzyUN2sNuv495cpR3cMTiPnCJ26EPoYVj7MJ2VlFEueDLCg2jx5iFy
X-Received: by 2002:a05:6214:d83:b0:56b:7ec7:b158 with SMTP id e3-20020a0562140d8300b0056b7ec7b158mr3895592qve.36.1676946035921;
        Mon, 20 Feb 2023 18:20:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676946035; cv=none;
        d=google.com; s=arc-20160816;
        b=l+ta/TOO3XWgnFj/PTiiA/wmNvw1wmjPieWj2mAyZ3RfQpAM5HSgMbypQoNV4joDaH
         5uNQA1VilRMeSqSKcsOp645LwjhHbFsWstlbXo5DPJYoi5B6ycL1aTwPmZZo5P4DRvUr
         W0lmx0aXbVzRJ7wpqr+DMMD91V6nQud/e6QAtbJi0GNU2qHygsPjzMNAlHuzZue/zkaq
         +CsRtt8jyx1i67+5s9zVEDgPwm/z1YVfSJh5XVzdfjmz1ROXez/QJ81Z3fmzv6A0qtKl
         Ujd1DmFlg64r7f2CgC+LUDX8Wn0eOge5ucIrPt6TXmW+Tsdpd1rcnhjv2zT8H52Rf5+8
         wnjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4LhVgV9owJZbBsi1PlfoOSjvvO0vG/eElRpr1Mn0cSM=;
        b=aV/hMqP8wg0whVX8FECWn4oYefDXhch/1ZsbaNCyaeCHX5+n2FME6EeGR7BpEORCrm
         xISQ1ZpaTk0XYVxd5ZTQxqNnFDiPSDOlTqv9Zop4vB3gWdjV1qDA8q0AFTgtvQ0yvP7n
         a1lCxEkVtWE9SUjXKIRjX/qelFWR8toDKTaXcIbUGOJJZoRznvNMafc6ZR4Y4KVnYavY
         MfkEjNp4E5SaIoccyyNhwFwPIp4siNxWUObfYWuYllR5BtKURrH31g39MrikVLZ65DnA
         j5rnMmREceDIAK7a8+xAVA9g7eC+PrsqW7j6d9oYA876xlxwlh8ZrcJZI0fwn4eZ2eHF
         BByA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qEH/jBGM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1-20020a0cf541000000b004afaac2ce65si974393qvm.383.2023.02.20.18.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 18:20:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qEH/jBGM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUIGG-0001cu-3g; Mon, 20 Feb 2023 21:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGD-0001bW-MG
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:05 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGC-00084v-1n
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:05 -0500
Received: by mail-pl1-x635.google.com with SMTP id h14so3607003plf.10
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 18:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4LhVgV9owJZbBsi1PlfoOSjvvO0vG/eElRpr1Mn0cSM=;
 b=qEH/jBGMT8DA7uZFBN9gp4cryW6fRT4nQWTMLETuC5W4zvEUtmqVqVbTAa8kd2nWij
 M2gN5gvKox6EQUrzijCKdesjYLrR/NNjQFMD+FDSSbwbQyhcZqGLifcgQtOsNbDV+PRI
 0jp6jaUm97LWiSfMjsH9u9feobKI4RIA79qskRyOzIaOkJzrGov7lWQjrCnr0Ymfofav
 mDl86/9/9fuV/FfxjN+deUAHF7KHaSY8ICENzgFJtDYd6MWfqbU6PTy/ilHagfDPXCTQ
 qQ8RXFlu/0SsDUyFo3YBwEiHGrQEKgPm+gqQEXG3u65s8zUyoIwzmUVfZQA7HhUz5Pxf
 i1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4LhVgV9owJZbBsi1PlfoOSjvvO0vG/eElRpr1Mn0cSM=;
 b=39u+D0Iah0McYauFg0vfiOCsRdvwJK468Ktvcv0ue6KhGhvr1Q0bbuCXA2qxQJfcqv
 5QX1hM72Ycntg1GwoM8DRXuwJImlD/CbIwf5tI0r5lKR2YPGptlD12K7WoOP5cdWEg/r
 T89J0zMYXzvnd94H+pJmIN2qjMB855nu3nXJD8oHqjn3jYyedPSBn/GLkvM7eAX9ZNjL
 oYoF27P5fFF/iJMPcpkl8WitFF+UdQbkGwPYmF3TYYD+asQ33XykoirCCLKGfUTIxmpH
 gPMFHindJKEoR11Xrj4t4etu2z40uwvxwEuREodm3y9oJ8Y/0hPoQplhliPL2VDDxgWC
 tj5w==
X-Gm-Message-State: AO0yUKW3SMHGzdc+KNfkoI//gsWk8QI8+44sDAXRhot01QAiYtWYiY81
 w8Xl6K37bQ/feReJKsBsxiB8tA==
X-Received: by 2002:a17:903:24e:b0:19a:b2ee:cf41 with SMTP id
 j14-20020a170903024e00b0019ab2eecf41mr3241982plh.59.1676946002630; 
 Mon, 20 Feb 2023 18:20:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
Date: Mon, 20 Feb 2023 16:19:42 -1000
Message-Id: <20230221021951.453601-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VED6f4bp9j9I

Rather than increment base_reg and num, compute num
from the change to base_reg at the end.  Clean up some
nearby comments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 811833d8de..070ba20d99 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -277,32 +277,35 @@ static void output_vector_union_type(GString *s, int reg_width)
     g_string_append(s, "</union>");
 }
 
-int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
-    int i, reg_width = (cpu->sve_max_vq * 128);
-    info->num = 0;
+    int reg_width = cpu->sve_max_vq * 128;
+    int base_reg = orig_base_reg;
+    int i;
+
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
 
+    /* Create the vector union type. */
     output_vector_union_type(s, reg_width);
 
-    /* Finally the sve prefix type */
+    /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
                            reg_width / 8);
 
-    /* Then define each register in parts for each vq */
+    /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
         g_string_append_printf(s,
                                "<reg name=\"z%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svev\"/>",
                                i, reg_width, base_reg++);
-        info->num++;
     }
+
     /* fpscr & status registers */
     g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
@@ -310,27 +313,29 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
                            " type=\"int\"/>", base_reg++);
-    info->num += 2;
 
+    /* Define the predicate registers. */
     for (i = 0; i < 16; i++) {
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
                                i, cpu->sve_max_vq * 16, base_reg++);
-        info->num++;
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
                            cpu->sve_max_vq * 16, base_reg++);
+
+    /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
                            "<reg name=\"vg\" bitsize=\"64\""
                            " regnum=\"%d\" type=\"int\"/>",
                            base_reg++);
-    info->num += 2;
-    g_string_append_printf(s, "</feature>");
-    info->desc = g_string_free(s, false);
 
+    g_string_append_printf(s, "</feature>");
+
+    info->desc = g_string_free(s, false);
+    info->num = base_reg - orig_base_reg;
     return info->num;
 }
-- 
2.34.1

