Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2531673wrt;
        Sun, 13 Jan 2019 17:13:53 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7cMcNrfjHJ3NsVant6NWuaIJ7XM48Tpr8LA60p3z+/LH6l6zJUmXwvgzVPD3yy391ooFyp
X-Received: by 2002:a1c:f916:: with SMTP id x22mr10250990wmh.87.1547428433841;
        Sun, 13 Jan 2019 17:13:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428433; cv=none;
        d=google.com; s=arc-20160816;
        b=hT85Cl1rUTN5iZRftkt/PW23fud91S4ZueagxnN+GxzoTaPt9YC2tm2gLWBwHbJp3E
         VwiLrmG8vszWTZdjmXHwVJc5yoSMqLRXjJra1Crer5453c4v4R7bSok5y7THQx88BmWq
         7DCHKQj/1aatqGPa0S3HyHregZ2rFxw1kVs56p69t2H3DhytJRDcDIc37vcxzIQ01/SY
         a3Xd0PSMPzKwZlKo+6Klo+DHY1e2KW/XkIQ8OIqdavBR4ZgSSWOR3Zd/PFRkVOX3SbiN
         WFY7anbiMFJWILo7eVrsCL5LVnkfuwXQEJWEzGTenDQ3N5F0WIM7dMw0a90Y+7wIGN4F
         d13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=iWhPOgkpsGfL+y7+DJO0d97xBYz3hpRVJdQBJAPKZLY=;
        b=Vef6+DSZU1u+WRq4ZM5Tlci7XUVlCE0ct/wGU2Nm9cF/0A7z+3TbMyeoR/mmyjvs4Z
         SiJmrwPpv/GSHLDDHzjKX75m3tCe3oGoVN+N8/Q5GdqHhvCk0/S6U6rDBAwoHl99fZFh
         hPD6IQLKzgbkI/BykVmU80Mxk/p98SJHSclmix1r9fpnzkzYvh5hOUz2v6nRJcYp9Ia8
         VJK0unuj+MAUL4Pw4AschzO0wZOLJAt1Ze5bxyAGCXA4tBtDep2TJIGFwXTT9y0FiJhA
         668YVZ4SbH3CEmRDCD7uZ4NOgRkDi/R5Qo13NHzdzVR+7AS+GsNQeAuor29aBAa21HDi
         hk3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OBj9qFKj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y83si10095046wmb.176.2019.01.13.17.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:13:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OBj9qFKj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqp6-0006uq-PU
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:13:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnK-0005jP-D3
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnJ-0000zB-Mu
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:02 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqnJ-0000yk-Hl
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:01 -0500
Received: by mail-pf1-x444.google.com with SMTP id c123so9556391pfb.0
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iWhPOgkpsGfL+y7+DJO0d97xBYz3hpRVJdQBJAPKZLY=;
	b=OBj9qFKjvb9wJ25lBAGYi8YjdU2vI8RakjS0qpew4ZyAX7vuNZVBuMnVA1psKI4VvB
	ZSMyCNzj3l+hLRcxn3UdXwsw69rR5y8YIGC1mDYpIBGukcu6qpFvZoW7gNHdEtZ33hRs
	VsVbkE9fZGYBxmwxN1Dn3zesre2O+ln1HoddM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iWhPOgkpsGfL+y7+DJO0d97xBYz3hpRVJdQBJAPKZLY=;
	b=CfLuzvOnfB846KFItjGoBkyixxhRDdHr12PyIY3+o2+PAh03lDm7AF/U1Z+0E4mrNt
	MJuQNRkDv28G5iBUKwPZdk1s+rhPUvmpP5I7+0Tk0P3gOcgAonqg6sZg+yH7Kg+ZE0rO
	cFnLoSLFnp5KGqGU2Yx8Y1xm3CIT8RQhVQtTiO5TOYcmFSvjS4tyynjZ+IiymVvqjcX+
	Nz5BBvjaulc4Z9MB34TIHwIrG2tCUuKay4q/T3HEnQtxXMUMnMcbRODvbROeb4cpQGkP
	LfBzO++3SYcWDb13He/hv1kiOWSVoHM8I8HZuIaypmXGVCDsklRZspvHEuBkgxjWZNh2
	nUuQ==
X-Gm-Message-State: AJcUukf7ucwcWCHqT2Cg0wnJu9870BmhUdeoQULX9g/Cb6iqnO7dMtSM
	azp93Dp7s4UysI0gVTy+U/tZp1cbMAwZjQ==
X-Received: by 2002:a63:a41:: with SMTP id z1mr21085462pgk.117.1547428320372; 
	Sun, 13 Jan 2019 17:12:00 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:11:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:14 +1100
Message-Id: <20190114011122.5995-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH 09/17] target/arm: Implement the SUBP
 instruction
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CIqH/zt5BRtN

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 6583ad93b1..98ff60c161 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5111,19 +5111,39 @@ static void handle_crc32(DisasContext *s,
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
+            tcg_gen_sextract_i64(tcg_n, tcg_n, 0, 55);
+            tcg_gen_sextract_i64(tcg_m, tcg_m, 0, 55);
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
2.17.2

