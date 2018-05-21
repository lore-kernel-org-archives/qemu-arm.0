Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp519904wme;
        Mon, 21 May 2018 10:27:46 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp/og4VtiE4+6mRm4LgwqrE0oDU+tUqUk72lJGgbT1bpIppNjYQPgZoGSsMiZaxnxPK9gCM
X-Received: by 2002:ac8:3583:: with SMTP id k3-v6mr18686971qtb.304.1526923666078;
        Mon, 21 May 2018 10:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526923666; cv=none;
        d=google.com; s=arc-20160816;
        b=OaG/lALbWUyw3nElgGqsoK9x9siKcCO5ik93DVFNwJIbTrScSIHm5q8L7ht3+tLFKD
         vgae8NsT43YJvX+bu3vfBsR4ZSj2jMF+UYmGjLFXBNfACyyrxRe6tnHWJD8mUiJJkMLD
         HydJCFK6hjDkMzCNALn0oar86hJS/Y98Cy8vqIxgx319AWr0BFX76Orn+PIsdFQ8AGb+
         vQLsHMaCjEtIpJOwrJ9t493gg2aUhGX4vG2Ibf1Ao2MNWJVvA+TeIPBcvaQmBshtGumo
         gePd3ZKOZAxt6w/D422wDk4ZHKdN6wtVJ/8N57GUDEJ4DUxoJONbcxPMgv3kn2tXeHg2
         HFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=P/DI1dpdPHnIW3xmiWhVY4M2GJxYuzivPj5KYZgkISw=;
        b=VO+KKc/TVris/2ua0Ayn4CByNFECvsji5VxgSHUJZvOm/utG7/ujAYRqOuea0Gow9l
         KJt0SCEDSAmLqkZqeZWivJQfqUJgx++ueEjadzizvHLeBcgPb/h40QdW4pmhggi7WbN2
         M0vksjj/EA21k3SHf+wIhQnNiJ+J2YMozenVD/k1Zbubzuw9TrQdFPfa46pgXkDjBe1J
         v/8WVBly6c8onopbUweBsXuMnrFlsS6dHKdjOMMKZZYasOlCPHrpXbIFgsEIWk3FTM7d
         gYkPTL26+RFdnM8ioCqz2DRYZ6Ej+uvIGkxAeH7vcNbR2FX+oWGsxN7oaJswN1E7uGqd
         cd1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k31-v6si4294558qvf.138.2018.05.21.10.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 May 2018 10:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fKob3-0004BT-Iq
	for alex.bennee@linaro.org; Mon, 21 May 2018 13:27:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fKoac-0004AN-GH
	for qemu-devel@nongnu.org; Mon, 21 May 2018 13:27:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fKoab-0007Te-Nj
	for qemu-devel@nongnu.org; Mon, 21 May 2018 13:27:18 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:42032)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fKoaZ-0007S7-NY; Mon, 21 May 2018 13:27:15 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKoaX-00082A-9r; Mon, 21 May 2018 18:27:13 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 May 2018 18:27:12 +0100
Message-Id: <20180521172712.19930-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH] target/arm: Honour FPCR.FZ in FRECPX
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 39dvPKd/95rL

The FRECPX instructions should (like most other floating point operations)
honour the FPCR.FZ bit which specifies whether input denormals should
be flushed to zero (or FZ16 for the half-precision version).
We forgot to implement this, which doesn't affect the results (since
the calculation doesn't actually care about the mantissa bits) but did
mean we were failing to set the FPSR.IDC bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-a64.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index f92bdea732..c4d2a04827 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -384,6 +384,8 @@ float16 HELPER(frecpx_f16)(float16 a, void *fpstp)
         return nan;
     }
 
+    a = float16_squash_input_denormal(a, fpst);
+
     val16 = float16_val(a);
     sbit = 0x8000 & val16;
     exp = extract32(val16, 10, 5);
@@ -413,6 +415,8 @@ float32 HELPER(frecpx_f32)(float32 a, void *fpstp)
         return nan;
     }
 
+    a = float32_squash_input_denormal(a, fpst);
+
     val32 = float32_val(a);
     sbit = 0x80000000ULL & val32;
     exp = extract32(val32, 23, 8);
@@ -442,6 +446,8 @@ float64 HELPER(frecpx_f64)(float64 a, void *fpstp)
         return nan;
     }
 
+    a = float64_squash_input_denormal(a, fpst);
+
     val64 = float64_val(a);
     sbit = 0x8000000000000000ULL & val64;
     exp = extract64(float64_val(a), 52, 11);
-- 
2.17.0

