Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1425290ejb;
        Tue, 14 Feb 2023 08:32:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/CcQo90yOd2fsxn9pCz9BjihUL45XVynmJh3r9ff7t7e+Rw7srT70N6DnfouCcYKRrwfPq
X-Received: by 2002:a05:6214:1bcc:b0:56e:b4f7:114f with SMTP id m12-20020a0562141bcc00b0056eb4f7114fmr6169233qvc.21.1676392337016;
        Tue, 14 Feb 2023 08:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676392337; cv=none;
        d=google.com; s=arc-20160816;
        b=dJJXfK64USpJWKEzx/e5zfGIoN2qs04vWrNYPwiR3n8iJTxeGTnxae8xELOEsDfp9Z
         df9kr8jB6AeSwf6xTvguVLk0opQdMJ6gVtDsL+HXy+YZh/8LA7ThFN15VE8vUeA+C2jE
         5a0Ls5rdn/qtHEotOn2cUp/oKtQKT4IoJp5eNWDZcKwzg2AeqNrno/wakIq8hhZTcU8p
         R8rHnOzd6vKq1L+zsLFclO0kTWMwIDf+PBB3LLDroXe0agVx4ke7P5fKfP4N8wQWhNfm
         lRFMX3t5+Y8qL3WBVRdm246hkq6omgMEoARUWpbbeTzbl7wzHtV77lwIEPyEHc4FagI8
         vBsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5U6nLfif2wOhX5Oed2Osbgbcfi6KWrVp6W4p+qPIqc0=;
        b=Q8JhXK7QovDNV3mZOUE8ssiyRBoPLyvG0Bla4WlqdoiY48dnJv2ex33QHClu1pj6wB
         sHntsAU9Nt9k2X73f3S22KTiN6q1mEC9s7FCg222IuHvJAOxgwK8CiwHO3azyWxYxAfP
         3uU5bKFYW0l/gQuHys4oRwf7lE/IOMSjgSlAxtXXZ1GAaauJya5GY+o6fRTpct3V/GyC
         2gaKKGnstyDi3s3MSLM0wABASaM53F1pn+ot12aSRmVewmVUD4BI4vT0JpDj+i/VSFef
         46ZvSNCMkPyOZijWMZOGdiZUMEZ6eEPUSUzTrHr8UtLS+Wvb1HOy7g0CZHrxIpfXK95s
         XhCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7Sbpvi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26-20020a0caada000000b0056c2114c8a7si11660502qvb.510.2023.02.14.08.32.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 08:32:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7Sbpvi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRyD2-0006aj-By; Tue, 14 Feb 2023 11:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCw-0006U3-KM
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:31:08 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCu-00029d-Vg
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 11:31:06 -0500
Received: by mail-pj1-x102e.google.com with SMTP id bx22so15606699pjb.3
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 08:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5U6nLfif2wOhX5Oed2Osbgbcfi6KWrVp6W4p+qPIqc0=;
 b=s7Sbpvi1x4KFz8X1u42VgCuTs0I5lffWQgHWaT4+sLah1SSQOz8gy4IaTPyiFPkKqB
 ES5TfK2Te+d3wHfXGHPYPw9XaA2Zd9TY2r/4EJPdx8SHhA6hcPLuP3BGX0MuBg7YqMfx
 oSD/b/zT0R8pqdNXrVLrdzOpO7gCsVVEaXDb/uAS9qJFSeUok44l4xemhDBkZI1z/VGG
 9esjCx+yjORiES/rNGRrE/hEC95JFPpQl5efYL1BZe3mNsnSZmaDqibTCiJv6yahuk1Y
 ofjBwK1/BN4fqQzoR+rAiMfnUlR/lmE0wXZbBi6oeVwrj1rNfQnd0NFzSqjRSICMB0iJ
 LgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5U6nLfif2wOhX5Oed2Osbgbcfi6KWrVp6W4p+qPIqc0=;
 b=s7ykfyNp7z/IPqnAbPSTTG+hKCe1JtNFneXg/5guSUi90DaqhvvCp9DQ8V3VunU9Yz
 ExK6tTqv7VZ+tHHlh8J1NLdHlfdLlr9eNmf7CJxhgMSJaR4UgPVDjfhSkHWzDyDZGN+m
 l6sChU9qSB/TuLWYR46zocg1g3gBdL1vIXPvk3JIjCZIFhIVdayaMDMWO7q2yMJlKkcx
 eAHD/3pdgctQ527J6rXUlgBNjSIixEF6Yx5Vpl5C3sL+LFq6oOmq2eiw6t7GLk/zxeyn
 KuU85pY3/VXJNu+kw6m8ERtjA1m9m5134E614dDrkOqbJbclXgJOJr3jKhlsYlo0361l
 g3fw==
X-Gm-Message-State: AO0yUKVfilf5+l1cx0ZcqATHqfolNukqKcICT9oaQHeqfuit05QbvMcr
 WwA8xWhwfbdzHEF0Z6w7TZxXkQ==
X-Received: by 2002:a05:6a21:3397:b0:bc:b98c:a8b3 with SMTP id
 yy23-20020a056a21339700b000bcb98ca8b3mr3401198pzb.32.1676392263607; 
 Tue, 14 Feb 2023 08:31:03 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/14] target/arm: Add name argument to
 output_vector_union_type
Date: Tue, 14 Feb 2023 06:30:42 -1000
Message-Id: <20230214163048.903964-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: cNd+hmOkQCIu

This will make the function usable between SVE and SME.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index ec61211949..166cb288cd 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -210,7 +210,8 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-static void output_vector_union_type(GString *s, int reg_width)
+static void output_vector_union_type(GString *s, int reg_width,
+                                     const char *name)
 {
     struct TypeSize {
         const char *gdb_type;
@@ -240,39 +241,38 @@ static void output_vector_union_type(GString *s, int reg_width)
     };
 
     static const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-
-    g_autoptr(GString) ts = g_string_new("");
     int i, j, bits;
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        int count = reg_width / vec_lanes[i].size;
-        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
         g_string_append_printf(s,
-                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
-                               ts->str, vec_lanes[i].gdb_type, count);
+                               "<vector id=\"%s%c%c\" type=\"%s\" count=\"%d\"/>",
+                               name, vec_lanes[i].sz, vec_lanes[i].suffix,
+                               vec_lanes[i].gdb_type, reg_width / vec_lanes[i].size);
     }
+
     /*
      * Now define a union for each size group containing unsigned and
      * signed and potentially float versions of each size from 128 to
      * 8 bits.
      */
     for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
+        g_string_append_printf(s, "<union id=\"%sn%c\">", name, suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
-                                       vec_lanes[j].suffix,
+                g_string_append_printf(s, "<field name=\"%c\" type=\"%s%c%c\"/>",
+                                       vec_lanes[j].suffix, name,
                                        vec_lanes[j].sz, vec_lanes[j].suffix);
             }
         }
         g_string_append(s, "</union>");
     }
+
     /* And now the final union of unions */
-    g_string_append(s, "<union id=\"svev\">");
+    g_string_append_printf(s, "<union id=\"%s\">", name);
     for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
-                               suf[i], suf[i]);
+        g_string_append_printf(s, "<field name=\"%c\" type=\"%sn%c\"/>",
+                               suf[i], name, suf[i]);
     }
     g_string_append(s, "</union>");
 }
@@ -292,7 +292,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
 
     /* Create the vector union type. */
-    output_vector_union_type(s, reg_width);
+    output_vector_union_type(s, reg_width, "svev");
 
     /* Create the predicate vector type. */
     g_string_append_printf(s,
-- 
2.34.1

