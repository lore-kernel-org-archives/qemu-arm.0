Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5053553ejc;
        Mon, 27 Feb 2023 13:35:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9JGsOdZyOSJ3URNXFO6N7CCcRHvLv2R+y8a8tuIIzaEmn4P1XygMIFDsDMrESVBNpyVK5T
X-Received: by 2002:a05:622a:50:b0:3b8:5bc6:deab with SMTP id y16-20020a05622a005000b003b85bc6deabmr1650124qtw.8.1677533720799;
        Mon, 27 Feb 2023 13:35:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533720; cv=none;
        d=google.com; s=arc-20160816;
        b=Vi1U2aAWiNQBnTo4k6Wuuv1bARv2iyzPcrIG3QhoGAWkyFQrHwpItWVLf9AizJyheG
         uxVhwtbiWDsL8Gf+ZKqT4R3Ek0Wyx0Erh1aCn9fUFkiW60Cf7AVfaYDoc39v7mppT5s+
         fEEXU7+wj4DN+sACKBcjWnQiIDvcm2GsfQcNP2Scz1hR4qpjokoYbl+xXXVVRjwEzHxe
         t5DArPGno+4BW3AJZt7DUXmgxB51CYzO3kgmtCKHHMT292TE1IjjKgH5ZGeHfTrWZrCq
         3UKLnzvGglDEZB0/sx8UCGmsLFsRjkjnGeSikXEt6ydBta5UGtjasRA88mt1BsULpgBb
         Dtbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ktLcLczpC5J61u+Wz7S4IYVLAaoqvKihU89wRw7bX20=;
        b=h4Cyvt5rnHQzQcXqLNCBs5XH2/0lBOFw+Ge8M+ZCCWWt1g2ZPbtdGzhuvxPqOBabNn
         qk3q/6nWnDkI8J2pFpMMwXU3v2nVi5Ruq5bViJ5qV0tc5Sy1swjdNSQlBImAPjQjU0pG
         NO3CkpVHtNxbmyoYwO9Eypa7qJ09Dk3fuhJozVjPLzKJp0EZnlDr6PA97VLzDrQujnmx
         VY1WK71qNsKwfXk2PX5gH6pwG+/zFn5IeRGGNq/fm7CAG1K/MxAzOT7aZ/cp4WtoVt9l
         PC54u0b7Jw0eToRmMfKuZ0UNJJlyI+YhLkcgRUdpnsfoxd3AoyT1gRZtxbSOcuZrC81F
         yNXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p63P1GiZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020ac85ccf000000b003b68cab30a1si7029972qta.741.2023.02.27.13.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:35:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p63P1GiZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWl82-0007EB-5V; Mon, 27 Feb 2023 16:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl80-0007DB-Ql
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:48 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7z-0004Jj-Co
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:48 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so7615225pjq.0
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 13:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ktLcLczpC5J61u+Wz7S4IYVLAaoqvKihU89wRw7bX20=;
 b=p63P1GiZPmiY8xvzMOADD+GWqI2H568kbhWRm5rtCG+A/8yhcYfqA8m/I79BDsdvp/
 Ktn6gtA4Bt8egk+vfdZsuVIvfv0dwpuSiPcMXaaeXBLR91gkmvtDDJaQwVutQkqSCfJO
 oZfeCM2+f+q+8VXHR4T0tn7gg5Hv4AzHu0N066Qo7HjkWJgbMBVMCQWYpnfa3wNT/vC8
 u5j53McfRhkl2HaNKl48dtAEhOwHBP0UqVDE0pD7ap4+GsWfyN4tMQ7ExJe/FmC3aTr5
 3woO7vUrUlthqXyFtCcMfvjzsyz21IkCDr8gEEMO/OV36IFMEZBtvPCmc0y78T1r5xjr
 Z0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktLcLczpC5J61u+Wz7S4IYVLAaoqvKihU89wRw7bX20=;
 b=x+bRacJMgaVRwAu64fR7M6W7qGizPsMPMO2nQBqsQWQZ/yTdXrRbRVMmPvuUt0Etk4
 /oTtTqiMtMyZXzxjvZtluEha1Bcn574RlH+WmJXfue/6iNL5B6R25oiL55ugRW21AK9d
 94zp7vZ6dhGlpSzzVW37Q3MKm5jnN0nycpZeQjSmYx3GczjGlpM6d8y3V4TwujpeVvPd
 +roj1wjcfFdZlmUgJCGuAfgdi2re/34HnyZuWCOGTqPZiHWPiuGCGwj+shY4myQJMnPB
 k9XG+pOIS/hFNy0JTchtZP/cg9cuqZdpUEDamivbzOdyJxfRILqaqCNmD2biclVG0T/r
 9ObA==
X-Gm-Message-State: AO0yUKWxmx8L5eUuua2ooC6Jp9raW3TCCStlR8LJJwBv4xGFZk4qIMhG
 BzfUTHuWVv+N5va+V7WiACN4/gDLMwnXGaPTXgo=
X-Received: by 2002:a17:903:283:b0:19c:ac9d:f682 with SMTP id
 j3-20020a170903028300b0019cac9df682mr430578plr.25.1677533626115; 
 Mon, 27 Feb 2023 13:33:46 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 09/14] target/arm: Simplify iteration over bit widths
Date: Mon, 27 Feb 2023 11:33:24 -1000
Message-Id: <20230227213329.793795-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: /7S7bFQ+g2BY

Order suf[] by the log8 of the width.
Use ARRAY_SIZE instead of hard-coding 128.

This changes the order of the union definitions,
but retains the order of the union-of-union members.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 36166bf81e..3d9e9e97c8 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -240,8 +240,8 @@ static void output_vector_union_type(GString *s, int reg_width,
         { "int8", 8, 'b', 's' },
     };
 
-    static const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-    int i, j, bits;
+    static const char suf[] = { 'b', 'h', 's', 'd', 'q' };
+    int i, j;
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
@@ -256,7 +256,9 @@ static void output_vector_union_type(GString *s, int reg_width,
      * signed and potentially float versions of each size from 128 to
      * 8 bits.
      */
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+    for (i = 0; i < ARRAY_SIZE(suf); i++) {
+        int bits = 8 << i;
+
         g_string_append_printf(s, "<union id=\"%sn%c\">", name, suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
@@ -270,7 +272,7 @@ static void output_vector_union_type(GString *s, int reg_width,
 
     /* And now the final union of unions */
     g_string_append_printf(s, "<union id=\"%s\">", name);
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+    for (i = ARRAY_SIZE(suf) - 1; i >= 0; i--) {
         g_string_append_printf(s, "<field name=\"%c\" type=\"%sn%c\"/>",
                                suf[i], name, suf[i]);
     }
-- 
2.34.1

