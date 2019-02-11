Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1949005wrq;
        Sun, 10 Feb 2019 17:20:26 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYUDJlRaS28ke8lJcE6OxfRC1WnzZwIkWKN88uC7S1eWALRQipYl0OG2SWK8HHFhGfUkV0G
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr7969259wmi.135.1549848026638;
        Sun, 10 Feb 2019 17:20:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549848026; cv=none;
        d=google.com; s=arc-20160816;
        b=maaWqifPRL5SnY019vSIOqwu5EbyrBmsXFbUsqoRl1X3mj02qsxnGCDo7MzBzhYjYQ
         beRYSCkmnp/zSCh4Mc0wh09uCAYYyzczhqk+Ke0fyqoxMg9O6DFc66KrG7T6Zlym2KlI
         YkYDG6Qktb4Iwpdc9pwiUG4ntVuXhAkxR+2+gL1SXMOaCZNzPjUt3gMw2YFkT/2hTj1i
         b96xK7KP0z6jb9x47MZ8xJdqNckEGiMhnR3+8OJfyejyeEUzi/abOHJtsUwU5QeAiEb3
         mqgQWJFrKHMp0JJ5G5n+JcseJAC7+yz2oHFFDR2eZpLwO9ieWud57riNebkf/RRR9/IP
         sQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=PJAqbiDKYxYxOSUmg7S9N0tHoZ0pCVJBOmi1qgJP2Co=;
        b=taL8Q7ePsAxvzsO7VH1zCE6TE6ZwGjm5jssx9r2+nmB8O9r8avLLCw9b379d/tuDCw
         /mPK4fGql7G2e2J5Aac/SD67i25B1DmE9Flh7H3NG4mg4Egl2SPXeEtl5HTACk/23zxF
         SbdmlBnyvlPIAzUrva2u/UR86udlfW1ZmT0Bg3Fxl4oWaL5meTtZ/Yh4ESfhceNEnWAm
         gpIcM7KJ2u5ZqqCNO6Qs8vyt0u4Sj7FiMG8NXiB1tlV0fHzGPQgZd7lCJl1hzArHye5f
         8PeEMHtpfCX8h59GY0C2p3Z0FQh0VcCbZAl9QqwHGNBvqo2lmsCuB84oWr4bYitLk1Bq
         LX2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lofp4ue2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f72si6622312wme.176.2019.02.10.17.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:20:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lofp4ue2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0Gn-0005dL-L5
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05l-0005ie-5M
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05i-0008Np-G5
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:59 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44318)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05i-0008Em-2E
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p4so4492102plq.11
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PJAqbiDKYxYxOSUmg7S9N0tHoZ0pCVJBOmi1qgJP2Co=;
	b=lofp4ue2VWOtrXmgafqy5UhMs5IUAsUzs24ekVb5xrimAeSAz9V9es4dtwpzeT1Uzx
	7fdeM3iyhnGr2qsdAuv53nYdLUGWmnINHHGAoP9OxjWxpfr3FUeTP91Ub+Fk04apyJ/9
	W75e3qoULTbuGRaUxpkAZGAt/yVCIB2AeWvN6fEizbCECYbJSlxLEEuCseAic8O44Hca
	d4UHMIJKm5I4QQTnB4IrjPEMkBeHsieAwouhhdy8HyDU5W4HxtBJdsB5XP7ZGvJFHLRF
	1spVW7dIwKxEw0e/8knN0jGhwtK5Yv1UrktFekgLnmH0eWbPfC1xPYgHSlf3xdEGplum
	y/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PJAqbiDKYxYxOSUmg7S9N0tHoZ0pCVJBOmi1qgJP2Co=;
	b=bxEQpa/i7FPPc8qOBkMXeoZ2c/9n4scUCODP+taDSxWMS6KlS2dzPOKFb8RoPFScyA
	PU1S1eN2qrpAfWDMLhLHs77JAGqykCiY76HwqtnbcXsKA+raideDULpWQYODvm8EKKt1
	3qNZS15opy5oz/abSOjPuL9fqjDpsW6Z5wJf18ZeD2dz49rn4GeK3+GbSUB4DjQBGVKk
	jO2xtc5tj/IsFyV4jr9WEFa289pKhoLsF1Gc9MmgXs8yCv20cf1llVLV/UD/t7xJnk8M
	JF+LktD+xKhi9NgVRogYE7QxdBj5uf/HkcoI/y7CMxnlkQYj8S+iyAItL0LDiEWWmwG+
	GZdg==
X-Gm-Message-State: AHQUAubdb6srcAC6AA6oUM0+E9j7IjTXwJLJ/rTQJc+SDB5dzOo9iAsE
	AKHTpcbshJed7aauCXW2DiiSFrhHRJ0=
X-Received: by 2002:a17:902:aa07:: with SMTP id
	be7mr34837830plb.63.1549847329012; 
	Sun, 10 Feb 2019 17:08:49 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:16 -0800
Message-Id: <20190211010829.29869-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62a
Subject: [Qemu-devel] [PATCH v2 13/26] target/arm: Implement the SUBP
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
X-TUID: VAhP7NuvOr8u

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix extraction length.
---
 target/arm/translate-a64.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2e0d797294..3e46ee6f69 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5132,19 +5132,39 @@ static void handle_crc32(DisasContext *s,
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
2.17.2

