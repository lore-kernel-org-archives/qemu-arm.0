Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp616339wrt;
        Fri, 25 Jan 2019 10:27:19 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6E7l3pBY1Hcw3xafCddJAvyaULXQMeygdMXe35FVS0VEH+dVsG7HUzHT1DoucOEfNC+AXV
X-Received: by 2002:adf:b649:: with SMTP id i9mr12839203wre.70.1548440839309;
        Fri, 25 Jan 2019 10:27:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548440839; cv=none;
        d=google.com; s=arc-20160816;
        b=DmKfMZQYfty1WY1biEvFwaowpf9efsrgnlpVn+7ZPeOtBUSrpcmrp4cqRko7MAUYWy
         XocYjBB/bdokGD3U/s2sBPC1IFji8uUIP3bd0XI83XJvZVjWmxY+QxOY8J62Cc9fj1ga
         fH+ICW6Z8GazDMUbKN8uMTSOkZ17gZM4t1DsXob8jslzEDDPC6PxXx+zyUXO2QKD0pKx
         Z4YxM/EEefL5jojvKPsuSx2jgQuj9VNzdYnPCweRm6Qg8Y31RGf2Rdst05BcKmcZ03yY
         jqUEJn9/kXwppUp+A/ydO2GTj2sihhs/nhCHLTCPqtfZnzBN65O3r4V7vjaBYS39GpFI
         qNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VAdJTXCL7K1e+WuNeCE2OxhDcHh7qYlDwJMPwNMUGu8=;
        b=yTBlyX2ZscwQAJGVG2g9or/y8BYWvjq9t2zBFkU8CObuePyTaHy768X4HM0FWZkUj5
         G4zL92rbrtW8ZQLRfMhtkbhEOP83ZgPID8XdbTYBnbiOaiJxYU000MU2pWwBCN9pd+ji
         dnke16yamVf8o8onxzby/qoTN412T37Ov8b8cbvD8zT3F7wpdwoQPYQ10gCxmyEzVMbl
         4dL7Ne7LS5FMR4kkexyczfJOiPCNDRu9uV8A6JD8HDWz5TE5y/eNl/QUgs6j4G8lSrqT
         A470/fVV6udIzPdHshuhZQg0k8Az8usQipZXIE1mMbODMr9ZfZAenCGEvP1QOHl2vlaw
         SSlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cDf7zm1z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si41041233wmc.87.2019.01.25.10.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 10:27:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cDf7zm1z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn6CE-0004N8-8F
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 13:27:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bj-0004Jp-1A
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 13:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bh-0002cE-SA
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 13:26:46 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gn6Bh-0002WC-LX
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 13:26:45 -0500
Received: by mail-wr1-x444.google.com with SMTP id t6so11280931wrr.12
	for <qemu-devel@nongnu.org>; Fri, 25 Jan 2019 10:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VAdJTXCL7K1e+WuNeCE2OxhDcHh7qYlDwJMPwNMUGu8=;
	b=cDf7zm1z7gDL7QXYAHtZAd0iP7NbLYvxE5P3iiqlFs+S1HajR2apxlfIu1UAgl7q66
	UrAMlrRyo6A7jNZfBN2KWWax6+JwEDJEvGMCKqbIZTasPCn5qa6/BUv177o8kTOpwW0s
	2Pbmyk3Wuq1HR3w3cBwoC3ncaAn1bDk+cI5T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VAdJTXCL7K1e+WuNeCE2OxhDcHh7qYlDwJMPwNMUGu8=;
	b=OYuRz0z09GdZ2ebkMWFCnwTSYuV+KojGLXw7fVOZb1NXfIXuNfA1+3r66T2BMtcPFq
	94DWXP7BDnxIffTLrtMhzs/Z1lY0dvX6Nhb/srWQ9lpkrGQR2w5aIkrvM/CneMpncpkR
	RuzC1q/ftfhw+3SldEBjSkIL55Cqnp4Ic9zeQ8bBdFMVznrCJWPj5kz/iT0/5h2Jwhyv
	KxhoAHMlE3gJFCBZlLakVTGfbe2K4hE/7sFCT8XMdMcKhsYvXAwkReG6H6cyJXt4LQbm
	dzSpeJziDm4IYIdhZZdk8ckE2T+nApSXgcU8dZ0U4wlf9HlGW4B/ND6aAFtgP9+rYBVZ
	XBGg==
X-Gm-Message-State: AJcUukeI6wcLW1ajk9NOlc2uEqcc35JzlVbCMJMLnCtVxzfkBkHiux8m
	OSZO560jqWG3Da2dZwYLyJITvQ==
X-Received: by 2002:adf:a357:: with SMTP id d23mr13170781wrb.195.1548440796084;
	Fri, 25 Jan 2019 10:26:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	t5sm45014921wmg.43.2019.01.25.10.26.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 10:26:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 25 Jan 2019 18:26:25 +0000
Message-Id: <20190125182626.9221-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190125182626.9221-1-peter.maydell@linaro.org>
References: <20190125182626.9221-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 6/7] target/arm/translate-a64: Don't
 underdecode FP insns
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yiDWKzrkTTQW

In the encoding groups
 * floating-point data-processing (1 source)
 * floating-point data-processing (2 source)
 * floating-point data-processing (3 source)
 * floating-point immediate
 * floating-point compare
 * floating-ponit conditional compare
 * floating-point conditional select


bit 31 is M and bit 29 is S (and bit 30 is 0, already checked at
this point in the decode). None of these groups allocate any
encoding for M=1 or S=1. We checked this in disas_fp_compare(),
disas_fp_ccomp() and disas_fp_csel(), but missed it in disas_fp_1src(),
disas_fp_2src(), disas_fp_3src() and disas_fp_imm().

We also missed that in the fp immediate encoding the imm5 field
must be all zeroes.

Correctly UNDEF the unallocated encodings here.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index efd2f6490b5..474d9bfb5f0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5636,11 +5636,17 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
  */
 static void disas_fp_1src(DisasContext *s, uint32_t insn)
 {
+    int mos = extract32(insn, 29, 3);
     int type = extract32(insn, 22, 2);
     int opcode = extract32(insn, 15, 6);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
 
+    if (mos) {
+        unallocated_encoding(s);
+        return;
+    }
+
     switch (opcode) {
     case 0x4: case 0x5: case 0x7:
     {
@@ -5867,13 +5873,14 @@ static void handle_fp_2src_half(DisasContext *s, int opcode,
  */
 static void disas_fp_2src(DisasContext *s, uint32_t insn)
 {
+    int mos = extract32(insn, 29, 3);
     int type = extract32(insn, 22, 2);
     int rd = extract32(insn, 0, 5);
     int rn = extract32(insn, 5, 5);
     int rm = extract32(insn, 16, 5);
     int opcode = extract32(insn, 12, 4);
 
-    if (opcode > 8) {
+    if (opcode > 8 || mos) {
         unallocated_encoding(s);
         return;
     }
@@ -6028,6 +6035,7 @@ static void handle_fp_3src_half(DisasContext *s, bool o0, bool o1,
  */
 static void disas_fp_3src(DisasContext *s, uint32_t insn)
 {
+    int mos = extract32(insn, 29, 3);
     int type = extract32(insn, 22, 2);
     int rd = extract32(insn, 0, 5);
     int rn = extract32(insn, 5, 5);
@@ -6036,6 +6044,11 @@ static void disas_fp_3src(DisasContext *s, uint32_t insn)
     bool o0 = extract32(insn, 15, 1);
     bool o1 = extract32(insn, 21, 1);
 
+    if (mos) {
+        unallocated_encoding(s);
+        return;
+    }
+
     switch (type) {
     case 0:
         if (!fp_access_check(s)) {
@@ -6105,12 +6118,19 @@ uint64_t vfp_expand_imm(int size, uint8_t imm8)
 static void disas_fp_imm(DisasContext *s, uint32_t insn)
 {
     int rd = extract32(insn, 0, 5);
+    int imm5 = extract32(insn, 5, 5);
     int imm8 = extract32(insn, 13, 8);
     int type = extract32(insn, 22, 2);
+    int mos = extract32(insn, 29, 3);
     uint64_t imm;
     TCGv_i64 tcg_res;
     TCGMemOp sz;
 
+    if (mos || imm5) {
+        unallocated_encoding(s);
+        return;
+    }
+
     switch (type) {
     case 0:
         sz = MO_32;
-- 
2.20.1

