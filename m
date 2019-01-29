Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4490995wrt;
        Tue, 29 Jan 2019 06:04:59 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4ujyKMIc/1SyWzl9BHfApUM5C46PdHK1OAfM5Hl0k6pcpcOfGV4TIMAtZiOlFk7YLTyaGQ
X-Received: by 2002:a25:4f8a:: with SMTP id d132mr24546210ybb.370.1548770699499;
        Tue, 29 Jan 2019 06:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548770699; cv=none;
        d=google.com; s=arc-20160816;
        b=d+jywXaKk9JPmLGk+r+PqSTCywrLB9jOjHvXaHs7B6suQ++gRg0Ah46uzgeVZhb6yw
         Rgvn9MFFYgxGvmvHNhG0u7VEAk2Dl2x6j115Ly+9uUvn/ZCXSM8tsBL66Xz7KvAVfqPo
         S10trI2yPqwlEKF951ES5aNPGzsiWm9IZhHi5W09uyR8uUJ4/Cxa56I/tza6VQXcG1dN
         u4nn94Tn5WKyOT1xBm3sLKR8FNyScrra6QU4rF5f5NS8sy24BVqY0h7/+ZyLKeWmRie1
         tIwYmZP56mcHpxmPlofdfGamSyGrlzA0jlDw7/luDR7Zgg9kIF3E0Vqc+KO6EzTxlzzF
         4lIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Q3EgdZXoJH70u4Sb1K0DUazGB/+/w1o7y9u65M6WktQ=;
        b=NMaF957Vi0m49ZRO07Agy84j2PbmCLtfUYSwtYtBoF1VqdKzJ9LJf0ElcE9r7gxPeC
         EPD1JG7r1X36tdULJPxF+vTxH7PrZrdaCTViwCBZR9dOOivpkJTLAhkpVHvJTqbG6uWm
         ENi+8lC/PqX+b0btRzs6JoAnG2B5o+KKU5R2mieTWbZPvS+19TS91KuXgx1zlH7w1LAp
         HpOVBhDQcwp3bci5q3VCrje+eGbdD9bIvZDW7Tz0eFBsqVhh/LBs+UvaBs+Fe3/AoUbx
         CveFQmf5TBVtXRphyYc+ZPt6s1AJHqfwA7V8zh+hm1RM0Zvjk2D1cF6Ac83A9uxvK97o
         9xyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H7TNUIbV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h186si21860174ywb.23.2019.01.29.06.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 06:04:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H7TNUIbV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goU0Y-0004h9-VN
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 09:04:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goU06-0004c1-Sv
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:04:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goTzy-00009m-RO
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:04:24 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33145)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1goTzv-0008RJ-DW
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:04:21 -0500
Received: by mail-wr1-x441.google.com with SMTP id p7so22261754wru.0
	for <qemu-arm@nongnu.org>; Tue, 29 Jan 2019 06:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Q3EgdZXoJH70u4Sb1K0DUazGB/+/w1o7y9u65M6WktQ=;
	b=H7TNUIbVdxWulQ9crlP8c3aZXl3w39OT4d/aBQpKfeI/2uhlB2fqjejd0NddGmQyya
	oxsYwej4AAeYwOx/d/08gRkgyzUpsnctCoIdqVan/p0lQ4p+jAzK4r2gyQAFRZzljn+r
	LXlbkw6uY7oa3O+STKTcfBaAYfPt4qa7ujXII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q3EgdZXoJH70u4Sb1K0DUazGB/+/w1o7y9u65M6WktQ=;
	b=odkoDChuSAnXzs3xRWEWTHzelgy0ey/59BC3uu0lnSLuFIGb4IuTt2Ri7uelWnXCDw
	GPcrrsbMzcbQFRF4P5lFysCOQJVH/zpH9nrzK+/BsB4VwpBLux6BRKMAuub74tpPHLCc
	snS3jcJGxc+6Yr/+AuSM5Jk5iTEDb2FAvcIqlCB703Hs2wFuvTqd45as1wsO1hB+FMxl
	PpEfGYM0H51n58yC5Q8ULN2v1HsPdYYps2jjqAhJTxrNNYlIwd8brMpDNr7sQWJYDl2S
	jH8vajQV7HzFE4vrOAQx/dH/k0iSRXacquci9CmuMJdq41kxT9p8R2RUEMm0OCD+wWke
	eMxg==
X-Gm-Message-State: AJcUukfbTRotASGpRBMRGdafZhhLzFG5WhZ03DMwlZLXEFZG3CEmufwy
	F8d98UhIPGVmvZK+hsiYAQ0jkcFuA+3ibA==
X-Received: by 2002:adf:f785:: with SMTP id q5mr27401309wrp.9.1548770655162;
	Tue, 29 Jan 2019 06:04:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	w80sm3876678wme.38.2019.01.29.06.04.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 06:04:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 29 Jan 2019 14:04:10 +0000
Message-Id: <20190129140411.682-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190129140411.682-1-peter.maydell@linaro.org>
References: <20190129140411.682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 1/2] target/arm/translate-a64: Fix FCMLA decoding
 error
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VSHW1q+oxI06

The FCMLA (by element) instruction exists in the
"vector x indexed element" encoding group, but not in
the "scalar x indexed element" group. Correctly UNDEF
the unallocated encodings.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 30bc2412fc0..a7b999d2b5a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12650,7 +12650,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
     case 0x17: /* FCMLA #270 */
-        if (!dc_isar_feature(aa64_fcma, s)) {
+        if (is_scalar || !dc_isar_feature(aa64_fcma, s)) {
             unallocated_encoding(s);
             return;
         }
-- 
2.20.1

