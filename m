Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5052572ejc;
        Mon, 27 Feb 2023 13:33:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9Gbq6kxZVa8qsdeYuWDqyyBcmwg/y4Rb5xEDYopxVx5iLWXDLklea31v+CQeHyfNQ30sxE
X-Received: by 2002:a05:6214:2a82:b0:56c:15c9:b5f0 with SMTP id jr2-20020a0562142a8200b0056c15c9b5f0mr1729520qvb.17.1677533632968;
        Mon, 27 Feb 2023 13:33:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533632; cv=none;
        d=google.com; s=arc-20160816;
        b=JnXRXG9Qxuv07X9X7xEMmS4nMDhFgtM7PJRWPW8wOypyGU1o3Jczan344Y5G4YEm2t
         9n5WuzIJRKYmPYrUkUNfzK2bUzxP1tmGuijhreCOlhslSjKYpFGPm5AEg+U9deS3ZB83
         JMZZ5fBraOTM08fAFAfny4Qkm1S3KiJh5uLo3uPVDmxnzxq0xkWj8d8Bxn69YOhTS/Jp
         nxCMT5UomK7OtUGmLdEDSfBdgo72a0haeVcumO3oseZvmGbz13hCs+/2oWtJGL/fWn8F
         pFSNsfI2Z2ptJMvwat0dtv6m5GkgnxrWqX9e91iMurJwtOKlqo+1WPmtpMUKvOi6m/14
         WjlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iqRacT2tJoZKKdITfpeCSvUX7DLmXKR10MZm1Xd6FlQ=;
        b=twhgJ2geqwswOd4r0Kci9D7Nwb8PMZ20PvzU5yhyzc1r5W+R+xPnsEJzJEOjtGtIho
         6ti7dNxD8EWILaPfW3DG0y9WqUPvEdj9ndDFCoKUkL9SslWxtT9I0SwvDDAjKee83l/X
         Okmc8U/O0+8bDC29u96b88k9PoSoDHSTRzIfUcKzl8wy2p+YGhFwWbH5jGqaFZELBIZ0
         WDsPh6v8GrF5yRMkHjVOCWtlZXhoWSrvFG6OYCQ8Sk0Lqf4bUQY4rZpJbg8JTUPoXURy
         97uX02ZG+RhORJDX17y4GoWp/7bletrJ1NtNMKk7cVrIHovmgN+enU0KkJETaj65o3LL
         7W3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kJBf4+bT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20-20020a05620a295400b0073baa46e8c9si7642547qkp.660.2023.02.27.13.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:33:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kJBf4+bT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWl7w-0007AF-Ck; Mon, 27 Feb 2023 16:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7v-00079T-8O
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:43 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7t-0004I1-Ns
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:43 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso6504915pjs.3
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 13:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqRacT2tJoZKKdITfpeCSvUX7DLmXKR10MZm1Xd6FlQ=;
 b=kJBf4+bT/qbaY92b04U58ImKnfw5BQ8Aw524q3B++T0M+SK8H4RCkc5w1FlycdsVJp
 zdcWwnqD4e/WAIbSMVb8VGQ8aBaXAkJvmJvpyazRxJC993bKgVtKn2l9GPjGPjDfiDqS
 zRaXwvDUOYkGgfMlJ9WOz/Oar+ld5U6Ly2D3fbmOFgTtz7UpSTDmlCMMFajDDxE3fjEB
 zG6VLgfn+YO9cK8Vpg8RRFkR59mHgEYYKwEhzm6OgUtNfhp+IeXC7JE3OjhZvlJrWaP/
 JMQc5h05q3bT8rwyMX5rpSpkmiMSZoQvJ34GCBQMoZJRY9vz+1iYUaCIcICd1vC0OKJa
 MgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqRacT2tJoZKKdITfpeCSvUX7DLmXKR10MZm1Xd6FlQ=;
 b=Ag0WTKHbLGlV0+7e1GMPF62PyluPXdhbnoG9lGKT7YMrnfwBXE53rNNrs1gWdLNWMr
 1y9JUpHNXUZmUA50LZSsLyWxNNuthxy1XgDBGiGIwPPDflXcnmuLc0/m1OMPoTxU6i9N
 q5pQ54cutzxVK79QWt8t2u3dqQ6HXzYVhcYvKC2T8IV/lHLrs+aYXMpqYVZ59vtbuRFg
 IUP15AkI6/xSUwzXGEQrdI9gdXXCV1eSzW/kdatLslzrmbvpmJSj9bnXwNgEVAiSWx15
 XYlHGUT2HTyizqwbfioObkhnJIbLdOW25eOozzdu/k5UsusWNH4uOprhnWWfd42oUlJm
 90og==
X-Gm-Message-State: AO0yUKUvR/7D2EJSGvZBs6hpEITlm3Ck/CVTEvpXqOYpPzulFepoVA/k
 ncsd8sUXkcNT6TInjmp50l55OEC/Rwsl8rB/DMc=
X-Received: by 2002:a05:6a20:9389:b0:cb:2a12:b5bc with SMTP id
 x9-20020a056a20938900b000cb2a12b5bcmr1029435pzh.28.1677533620153; 
 Mon, 27 Feb 2023 13:33:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
Date: Mon, 27 Feb 2023 11:33:20 -1000
Message-Id: <20230227213329.793795-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: J0/H081ZrR30

Rather than increment base_reg and num, compute num from the change
to base_reg at the end.  Clean up some nearby comments.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

