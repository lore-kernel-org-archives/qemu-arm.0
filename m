Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp616670wrt;
        Fri, 25 Jan 2019 10:27:46 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7xza4Nn65uON69RI7uNYHrkm7LOzWRUwWsHg/XFDdYE1Gtz3h9ORGTiyUtfT6VzjvLZXPi
X-Received: by 2002:adf:eec9:: with SMTP id a9mr12396477wrp.242.1548440866129;
        Fri, 25 Jan 2019 10:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548440866; cv=none;
        d=google.com; s=arc-20160816;
        b=BENyKKy3STI2TSR1Fii2JdAo66g54UUfYUrr7A38gqdIWzrMcIziKqjTj0aw0uD1El
         fMElgRun+HX/z91576PCkqDBPc8qFarfRz7aZQj8cA/eHEtX/MWNWghGY3EeFNB6mDDR
         vDPOXlMyGt40fIQObmrFug00JIRUlGJCZalciBhhEO98/j7PQHT0GQprnweRiZy7k7U0
         yB5z3+sCs8z33oafJXmEenD8UHRlE8eenqmdZk77jMbbthjlN9pbo7/QbRkgdih5ZOUy
         ELYfrFHvwpjemUENdzcuS5bNwxQkYyIo9uLoIc26hNuaIElqAOFxC+9A4hUQBlK9c1oL
         KxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VtBfY8s91zSjllF9HGncjhus2NgfJ96usyZ2QcFWFLs=;
        b=CC1wtfesJSiRqFtRQd4ZvD0KmfLnESzwZPHt4Wb2T4FImZdlKLoWx2BGA1Ts2QbBKs
         jOClhBZb978GD4EcEScSwdzYLig2IM4Gfvogj+6XJ5KAiZ+jLZ6bNOoGd2HrtsLlX3p8
         wrIqqEWe9dHaa+8Yq2oHto4K1iI22Qh098sy1+4wCjxwJTxrpRs0NgIEiMcU/CMqfRh2
         K0cIZW7IaNBfaZROluyDRu4ljXeef216+B1rWiVaAaD49hPCEYY3a9BN87YEMwSMV7o/
         VNTyQkILUeu7GZC0WmzQtHPmvxGTJp1V0GFYQ5mrcbSK2Lrg42KnHl4uuGYbqaz04WBi
         J2jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WyBcMlmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z83si41138481wmg.180.2019.01.25.10.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 10:27:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WyBcMlmc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gn6Cf-0004tF-46
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 13:27:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bk-0004Jx-9S
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gn6Bi-0002e3-I4
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:48 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gn6Bi-0002Vb-6N
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 13:26:46 -0500
Received: by mail-wr1-x443.google.com with SMTP id t27so11322817wra.6
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 10:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VtBfY8s91zSjllF9HGncjhus2NgfJ96usyZ2QcFWFLs=;
	b=WyBcMlmcjb01Y8TvDT2h4nLIBxY1YQAHIp6xXtKE9PAbtljnVaZWL56Z4Nt4VR7t9L
	Z5T+daXj8EYTNiJD4JXMAU4zV3hvCacE2c8PM7SBJxNjAM5pi4EriULvxu3kVzd6Zmzu
	kSdfV/6Za7Uud/WASqvuOtzZNwXp3sYWjEjak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VtBfY8s91zSjllF9HGncjhus2NgfJ96usyZ2QcFWFLs=;
	b=ENnMatLtF2BLl656ll/0n9WwCIarEb3H5vvdAslfiJBx+X9LDwwpH++npkJdShaTNK
	xtx16HVXACOM/mi5xdyzGHlye/YNS9RlqOTyV2lEg+PNHbw6gbqn4WT3jVp5DEv6in16
	TNtt4VoyYvbjCUw8rs0oJD3mI8PaO2rtgVHBXUhXZlCA2vZ35P5+DTyBEl/Jc3HIt2c8
	Ksi5Ymw7LACsHZHCHjgWv9ii/Drv6wN59MGuF0TZClmzHTuGmlowy4vsEeYgwJSTfdcZ
	ptMRbS3r0CgtSyPumU727kqqEOU8QfhpDHrpzHqBmhhWLtrM6dwDmQcMm9i99XL2MQP6
	Gj6w==
X-Gm-Message-State: AJcUukc3U8Ugjaf9M/Q2abLwXh5misac0VyJkiz0DcLVHW3bd6aw4s25
	IBWtNAJnbBEpr84OgLg7awnD845ImVJ6UA==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr13588112wrt.227.1548440794846;
	Fri, 25 Jan 2019 10:26:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	t5sm45014921wmg.43.2019.01.25.10.26.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 10:26:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 25 Jan 2019 18:26:24 +0000
Message-Id: <20190125182626.9221-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190125182626.9221-1-peter.maydell@linaro.org>
References: <20190125182626.9221-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 5/7] target/arm/translate-a64: Don't underdecode
 add/sub extended register
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
X-TUID: UFHoRXMCMxKG

In the "add/subtract (extended register)" encoding group, the "opt"
field in bits [23:22] must be zero. Correctly UNDEF the unallocated
encodings where this field is not zero.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2cade64ed25..efd2f6490b5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4204,12 +4204,13 @@ static void disas_add_sub_ext_reg(DisasContext *s, uint32_t insn)
     bool setflags = extract32(insn, 29, 1);
     bool sub_op = extract32(insn, 30, 1);
     bool sf = extract32(insn, 31, 1);
+    bool opt = extract32(insn, 22, 2);
 
     TCGv_i64 tcg_rm, tcg_rn; /* temps */
     TCGv_i64 tcg_rd;
     TCGv_i64 tcg_result;
 
-    if (imm3 > 4) {
+    if (imm3 > 4 || opt != 0) {
         unallocated_encoding(s);
         return;
     }
-- 
2.20.1

