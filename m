Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp866580wrm;
        Fri, 11 Oct 2019 06:53:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFVFg1caDCO8UYoh4DF/L/Rm3hZaKEgcBuPVRxbyZoxDPV4hFHzglelVYoYpb0JOyk9hT4
X-Received: by 2002:a0c:8e04:: with SMTP id v4mr15865979qvb.98.1570802031821;
        Fri, 11 Oct 2019 06:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570802031; cv=none;
        d=google.com; s=arc-20160816;
        b=OIo33jcbmVylP+/f732bHJs4805Ac3zYutvWJQx5NKTRqU+RKz0ImVpVomuw2QNxGr
         bziayO0rH9B7Leic6q2CAX8HfTpF8XF32qorck4wQsLuYCx+h1ti5CjYoCESv+8Rqu9b
         D35zN/B7AUcwztl0ZndT0jTsz9I5fo04Gkv5rnp84ETbbKlS16uvZKO/6JCr0qV1b5X4
         dWEXLv9YxasAiacixnOhHOUE3OcPwB1dv0nlBxZ3cekJtf6Eb1GuSP0vJkvfcbNuCviY
         HJFUH1C9lUpKYyH+R5Cdw00bno7pRmS5F0pWKUWy+vwPRmgumyeuiIVv5bMrgFAzXWKp
         bCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=pcMD6K9ABOmTlLHKMBTY6fPd9eU2rhpEHRshToPyGV0=;
        b=Zr8SVUwca6+bqVpyXaifzTYIgc7TeJMOL2kAjYqQNCRdKsapEMFrHTHiNzJoMUyjWu
         6Qh/Qb+t33qyavx7p62NJ/GYIgonXBiNWpEapBQNl+QZ6NYdlfbotIDhF4WjE75eAkmD
         A1oWLTg6r75u83Hs3Bj8A2EfpNaHrs149Yu15LO3xN5v8ss7ICc+w4qtMSoSM482jGvs
         2NKxmxE0/SAsDBIVVwuXnE3nQoxTl+ry2f3JKZ7FPCX/elnPPju3PTNl1V9H7HuA2oeT
         ONMfh5locyEnH9E42+nstaO2SHqfIWEYdBoEv5RAwWhDOlL9rZZwbhvD0AXeiIGJXQHF
         we3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dGxHV+m5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 42si9635518qtc.145.2019.10.11.06.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dGxHV+m5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvMc-0000Rc-PI
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJB-0005kb-ES
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:50:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJA-0003yN-C8
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:50:17 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:41699)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJA-0003y6-8o
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 09:50:16 -0400
Received: by mail-yw1-xc42.google.com with SMTP id 129so3491286ywb.8
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pcMD6K9ABOmTlLHKMBTY6fPd9eU2rhpEHRshToPyGV0=;
 b=dGxHV+m5uqvHH6DiyrQWtbYyx7jpaXPmW2wrVX5XXMnLXk09jViHydpQ3bM0L2imtK
 T0e0fJiP0y2LJ33BwbeRChUcY/JSsnCpylRoMcaFcioU3ZWkvgt2TWSbo+GwC26i9FWK
 +Z1bRmbXk+opvgu/RTXHH2H9JRgzgGV3Hm2lptSMLA7yqIe00OToGgPf4FmosXMYseER
 Hbdg/aXTdwhSLlwXB7vRAbdW/qILAXnpVo5z8dgRrZnNCCo3Yl25keS7oo4ka+apTZwh
 TLo0E/d/L/xIqh8dE9RrabTvXPK6F0mIfkUSXd6c15FBvggmErdFL9AbEVn3DOnzHOmP
 LA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pcMD6K9ABOmTlLHKMBTY6fPd9eU2rhpEHRshToPyGV0=;
 b=WyYV1lbiYT0asaqcOdYWuAOExD4b8Y/hoWVibsu7injS2ZmgmsB3BV7MI/K4zPqb+b
 7OXzpsGG6NdGW1l/CwxlHZUysujOFVMYGSgHyuesh3K+olKFVotSGuW8oiMDpekMB3+y
 ccTGt2qn0XwNqenWrdEjWJvSwEJ6NG1osxmlQzNC8GNmLe218eDNBqcYH0Rti/aV2CBo
 1509rH3BLUQiVbauM/WH7rceK9S6wydp5+lDRIsSR0XZOGsCB5YGHdtX9vklbLB2/4oJ
 id6PFY8mjjppRvZLEMQi0haI6ZsffvFvTn5lwooQHruGIQCLhDQs4bm1q/ZWWjFZIOxs
 Spvg==
X-Gm-Message-State: APjAAAXgAa1sfiL9dy8d7Jdmdsmh7HBgJ9GTgUy9G+kQOP62mXU7oPzl
 kOZxbzyoSCPZt2L2/PPlebg8zhfVkxM=
X-Received: by 2002:a81:1ac4:: with SMTP id a187mr2528455ywa.482.1570801815337; 
 Fri, 11 Oct 2019 06:50:15 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/22] target/arm: Implement the SUBP instruction
Date: Fri, 11 Oct 2019 09:47:31 -0400
Message-Id: <20191011134744.2477-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K0UF9vzoi98E

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix extraction length.
---
 target/arm/translate-a64.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4184d65d97..cf341c98d3 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5162,19 +5162,39 @@ static void handle_crc32(DisasContext *s,
  */
 static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
 {
-    unsigned int sf, rm, opcode, rn, rd;
+    unsigned int sf, rm, opcode, rn, rd, setflag;
     sf = extract32(insn, 31, 1);
+    setflag = extract32(insn, 29, 1);
     rm = extract32(insn, 16, 5);
     opcode = extract32(insn, 10, 6);
     rn = extract32(insn, 5, 5);
     rd = extract32(insn, 0, 5);
 
-    if (extract32(insn, 29, 1)) {
+    if (setflag && opcode != 0) {
         unallocated_encoding(s);
         return;
     }
 
     switch (opcode) {
+    case 0: /* SUBP(S) */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        } else {
+            TCGv_i64 tcg_n, tcg_m, tcg_d;
+
+            tcg_n = read_cpu_reg_sp(s, rn, true);
+            tcg_m = read_cpu_reg_sp(s, rm, true);
+            tcg_gen_sextract_i64(tcg_n, tcg_n, 0, 56);
+            tcg_gen_sextract_i64(tcg_m, tcg_m, 0, 56);
+            tcg_d = cpu_reg(s, rd);
+
+            if (setflag) {
+                gen_sub_CC(true, tcg_d, tcg_n, tcg_m);
+            } else {
+                tcg_gen_sub_i64(tcg_d, tcg_n, tcg_m);
+            }
+        }
+        break;
     case 2: /* UDIV */
         handle_div(s, false, sf, rm, rn, rd);
         break;
-- 
2.17.1

