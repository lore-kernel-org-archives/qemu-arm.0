Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp616119wrt;
        Fri, 25 Jan 2019 10:27:02 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4gG9JKtPyj3UePKVFdQgam6vf5N0rlpMltEjCX01hxzO6d9I4ry+JJDv2qYFzEDP+7hYPI
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr8161806wmd.36.1548440822936;
        Fri, 25 Jan 2019 10:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548440822; cv=none;
        d=google.com; s=arc-20160816;
        b=wBSYs3FIZT3AWLht41yMPhgpMYScEXEYpS/8ADPKDmKFcAHNRGhcX5CU2qYcHbRD/b
         PE7Fj/06oBx6ylNKrZB07mckuYYI7hsjTotv98k0mPJTXzhtaIxpgnDWnwyo6U7UlM6d
         6PM6xxc3vFKhrBKs3MgOgAXmH3CUPtUpPtVw5paDKY1SzBpIckbDMXyYvXns1Puj/el5
         5LebcW7qYZ+b5aEps19D9dzcJsmhWL3kVNebuevJDMEP0kuzGl+QtaFTjuQzsU71I9ab
         hip5jmLGoiN4e91RsfgapmX8oMQxVDBXBVgmhOOrgW8XqL1TO1gXaAxBVXAB2bgxBQ4w
         4SaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=PwtFG9KQOA83ZfBz3XfHQVTXICJqvH33KYmnir8zB3c=;
        b=qSQZn+qHLYabJ+tFMQgpj4RcGwvhEYmpeLPA8/at2yLP3JHsmwLq7SlRQdbSnpHgSM
         ECxphZ8pezbWSg4NaGLhEvqZ6uGawoX+35exKjm6xk7wDetqW68rz9k2ikJ7/H5KlZbt
         pqQh5MuCzJqyV4qA7nD1rqStQo2ni+mdwvQjo51XtnZCYTV4dC3SDO/IWRa91LpB0zBs
         86FhobeTZl/xEyXUfg7Sl8N/o1V8dS2I0qk4K6BY79tGjXeoa9hjVVKyTZUkRONBE0w0
         9ULhm7Pnfdga+PBPay9ZeIorAMYrz9PXm3E9gTmSJ77nRXb7i++bfVYmYUy17YySXTvc
         8DdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gGsHr2kJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si75151920wri.268.2019.01.25.10.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 10:27:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gGsHr2kJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn6Bx-0004K5-VI
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 13:27:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bi-0004Jm-IC
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bh-0002bo-Jy
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:46 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gn6Bf-0002UN-LD
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:45 -0500
Received: by mail-wm1-x343.google.com with SMTP id y8so7493818wmi.4
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 10:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PwtFG9KQOA83ZfBz3XfHQVTXICJqvH33KYmnir8zB3c=;
	b=gGsHr2kJKGOoh/lMGPZzv1hoV5muy3wo0TF4kpqQR3S61W0ctUFQddol3N4OVF7Q0M
	SUgdDSZntqSCl0XzBU4YdFoffVzfYFbxQ7uhuX1vyApwlWEPBp1bRyg77QT5m4678I9I
	DXmmOOlRKBsFMFp78DA8xaCKVVBIE9MCYrkZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PwtFG9KQOA83ZfBz3XfHQVTXICJqvH33KYmnir8zB3c=;
	b=tIIvK5qFo0zZ8SEI4eNCax80kB0VAxC2cemKW585PVdeVlUSC7eNK2bvMHLCHIP38X
	GXXnca+I5Ng8FsNvR5AKQ0vTwKZXXyTAzFExQ68lMIRYg71HJv447sHaM+b5tycRGY2u
	A57xgJjghZ+evRgf+ZTfIeMWbUL6bjxdfLN/Lrmn6aaUtmG2tCSY41SMkI8Yg5uAZUy0
	n7/7yiw72ArzlU3cm5R4TlACrZnJoSi4Qy5yeUe4GrKb+NC44KNjuh3WMaDM/k1/dCNR
	IYKjhnaS3kT3nKt2skbt7q4QMnuY2c2rnHRwWDkY4hChDzEaXj9kOCQQJ0n7KurwT42C
	vWeQ==
X-Gm-Message-State: AJcUukco6RpVxJycrDwp5WzOCUKBHLMsTNmgRv4CpcvB83tiAxlWop38
	QV1OW2nwtQnRurcS5OvcUNcK+Y5c4vFmKQ==
X-Received: by 2002:a1c:ae15:: with SMTP id x21mr7758927wme.146.1548440793723; 
	Fri, 25 Jan 2019 10:26:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	t5sm45014921wmg.43.2019.01.25.10.26.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 10:26:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 25 Jan 2019 18:26:23 +0000
Message-Id: <20190125182626.9221-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190125182626.9221-1-peter.maydell@linaro.org>
References: <20190125182626.9221-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH 4/7] target/arm/translate-a64: Don't underdecode
 SIMD ld/st single
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vVVRo19pcrq

In the AdvSIMD load/store single structure encodings, the
non-post-indexed case should have zeroes in [20:16] (which is the
Rm field for the post-indexed case). Bit 31 must also be zero
(a check we got right in ldst_multiple but not here). Correctly
UNDEF these unallocated encodings.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c1f0cad7691..2cade64ed25 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3409,6 +3409,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 {
     int rt = extract32(insn, 0, 5);
     int rn = extract32(insn, 5, 5);
+    int rm = extract32(insn, 16, 5);
     int size = extract32(insn, 10, 2);
     int S = extract32(insn, 12, 1);
     int opc = extract32(insn, 13, 3);
@@ -3424,6 +3425,15 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int ebytes, xs;
     TCGv_i64 tcg_addr, tcg_rn, tcg_ebytes;
 
+    if (extract32(insn, 31, 1)) {
+        unallocated_encoding(s);
+        return;
+    }
+    if (!is_postidx && rm != 0) {
+        unallocated_encoding(s);
+        return;
+    }
+
     switch (scale) {
     case 3:
         if (!is_load || S) {
@@ -3501,7 +3511,6 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     }
 
     if (is_postidx) {
-        int rm = extract32(insn, 16, 5);
         if (rm == 31) {
             tcg_gen_mov_i64(tcg_rn, tcg_addr);
         } else {
-- 
2.20.1

