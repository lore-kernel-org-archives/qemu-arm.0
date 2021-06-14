Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2061420lff;
        Mon, 14 Jun 2021 08:14:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPEoE9DDgCE4WLwmFSoIogyPnrLCSOSxXC6Ch+FdKsx6555bZUtsdrig/3F4O5IPgRNdV6
X-Received: by 2002:a05:6402:22d0:: with SMTP id dm16mr17421871edb.123.1623683647883;
        Mon, 14 Jun 2021 08:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623683647; cv=none;
        d=google.com; s=arc-20160816;
        b=yrcZDa/LcR5EIVAHy++nq16z1N+Q2CJmqOZpx/yPlnIIfouvkcldcEuter9+G7mZsB
         p5W6kb+XqTkghl3LGXtUKIoOKB+4wj1cICRbx20XuNtUqtBHWaWMvLLm/xvgEA29L1fo
         aqjlz9YRKigX6MRwQWcpaaP5aJJDpwznWKfEWZaxHjY4mpap0DxUI6G3G3abzVjYqbuZ
         Oj7gkktUvZlzMUsJFMP0OLyQqmHb+ii5EXQeFDZU3YVbHz7lEZUXZhuspkOgqHQcM1po
         pwB9H9QboiGy2eEZUsxhpbwUQA9VrtKfgqzOAqXjyhUykAdmxZsYzcllv53M3YwYTK1V
         CY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ookEZLXNZsxmPU5axXuxMuvdxR6PrgPweUugNwQXNto=;
        b=EQ88iN0bzhkE6pBbvbqnclvl5PHEJEZwHRHuAcyi56rs+j3jE47mD3L/UVqFxOJCxt
         lT3V2IcA+e2bVAnB67erKv043tdthhkaBPaY9wMolvGbyF1p7WV6FPn0Y1JcZp3pXOJp
         /i695H3nDigWT7tfWPHWhGnHSe/GP6uEaWEXEMf/6yCp0jL4cKygKbQf3CpItY5kuGuQ
         gZ4RsTdNAJafx8X6LhlNHr8kQYjYg75gb0xmMPZhI00lWNgAnHeU7Qa3hBV37oTl/r3A
         kgWkxJObZfe3TA9DCF/jLvLaFl9d1H6GKoC9vv+ApbuX+ITwNCFLpHAUmonl2igmg8QL
         msPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JdfgJ3l1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id le23si11066326ejb.140.2021.06.14.08.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JdfgJ3l1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoHu-0006sN-VZ
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEP-0000Qd-32
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEE-00007d-3V
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:28 -0400
Received: by mail-wr1-x435.google.com with SMTP id m18so14940948wrv.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ookEZLXNZsxmPU5axXuxMuvdxR6PrgPweUugNwQXNto=;
 b=JdfgJ3l1BMfKbUr3nkhLkceMG6Nrdo4ObH3v1piILDcsmiXwWJmI3E9F5ZnOyDDtLd
 t/2k0V51uYk/uKsnX9rRVITN4xFBJlG2zq8m7dBDrlui4LvxcfZ1yL+hORBfGjhDVF2g
 8AtrgJjVaFC+FEOXMoo7nVJEB4fSf+dvmDxX1sgLKsaIhCpu5qnqm9G0w7e+9rIpItfN
 357fmIFmXuPnJ95pBpi1GB35sSjIG+oMMzdl1FkBaY1dNulBN5Zujw024GjMXS9TQZ0B
 nMdM+OhrMjez6GZltwINP7m3ozWJH0QgJ4NXv/VqDKeY9m8AIPjgMdf/8gkJ5St1lQ0H
 Gdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ookEZLXNZsxmPU5axXuxMuvdxR6PrgPweUugNwQXNto=;
 b=rdib3BPVGWdUiaAB9sSxjUUSULTE1CYqdz2t40gGlssl2r14TP2upRKoxOKYrW3gMM
 0Uohsvjwy4lbOWUMAjFflXqERxsHqocgDVwC13ZMqlK9EQ14M5XkJgR+shjjy5NWiNMC
 RYaMR1s03auCfDbz2Q5UKHcN3XFyFZvm3pSLAFvuZQLi1YEqcgP6PR9s6HbIj/GzQt8G
 t1PqQrTF1aqg0ay17UdJK5WW+7+I4AYVLXb9SBa33dQOJ/9d3FwhMXmmpKA9SYBG6y0o
 txw3OgWI71TxLsqDWVq4xQg+nB9/1+H21mpAsQXCpXmIGQxT8Bd5bpCZhqGc1MsWWuHz
 8Guw==
X-Gm-Message-State: AOAM531WwPkVGHYZhR8FaeWSs8cEf83jTmArRD3tye0iPgE3ttFk+aaz
 VQ6WdMkBU18EO7M72tAe5EqC6YG6OAX/Dw==
X-Received: by 2002:a5d:6147:: with SMTP id y7mr19307966wrt.418.1623683415093; 
 Mon, 14 Jun 2021 08:10:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/57] target/arm: Let vfp_access_check() handle late NOCP
 checks
Date: Mon, 14 Jun 2021 16:09:15 +0100
Message-Id: <20210614151007.4545-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: VhY8spHydeu5

In commit a3494d4671797c we reworked the M-profile handling of its
checks for when the NOCP exception should be raised because the FPU
is disabled, so that (in line with the architecture) the NOCP check
is done early over a large range of the encoding space, and takes
precedence over UNDEF exceptions.  As part of this, we removed the
code from full_vfp_access_check() which raised an exception there for
M-profile with the FPU disabled, because it was no longer reachable.

For MVE, some instructions which are outside the "coprocessor space"
region of the encoding space must nonetheless do "is the FPU enabled"
checks and possibly raise a NOCP exception.  (In particular this
covers the MVE-specific low-overhead branch insns LCTP, DLSTP and
WLSTP.) To support these insns, reinstate the code in
full_vfp_access_check(), so that their trans functions can call
vfp_access_check() and get the correct behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 2e12c694edc..01e26a246d6 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -143,11 +143,21 @@ static void gen_preserve_fp_state(DisasContext *s)
 static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 {
     if (s->fp_excp_el) {
-        /* M-profile handled this earlier, in disas_m_nocp() */
-        assert (!arm_dc_feature(s, ARM_FEATURE_M));
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false),
-                           s->fp_excp_el);
+        if (arm_dc_feature(s, ARM_FEATURE_M)) {
+            /*
+             * M-profile mostly catches the "FPU disabled" case early, in
+             * disas_m_nocp(), but a few insns (eg LCTP, WLSTP, DLSTP)
+             * which do coprocessor-checks are outside the large ranges of
+             * the encoding space handled by the patterns in m-nocp.decode,
+             * and for them we may need to raise NOCP here.
+             */
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+        } else {
+            gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                               syn_fp_access_trap(1, 0xe, false),
+                               s->fp_excp_el);
+        }
         return false;
     }
 
-- 
2.20.1

