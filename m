Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp951310wrp;
        Thu, 14 Feb 2019 05:03:42 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYqQvkJl8XiEaxPYrbIuklJ0Mj+8ZmSGEGpIH9j6AnthWESGHIh6M49SUjvahvwZCiB6ofk
X-Received: by 2002:a25:bd8a:: with SMTP id f10mr372105ybh.163.1550149422329;
        Thu, 14 Feb 2019 05:03:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149422; cv=none;
        d=google.com; s=arc-20160816;
        b=GQn8YOQFY+CgLOfftsoSlq+HC/7KwMTsUVTv8LccoxYZjMgaoePL82KmUBE7mC0mD5
         jQuSZ6t72ECJFN284dkkfAVj4H5ACiLi3AX4G7vx4zdgSgCXTJCupQi0u9pxoxoPOQDs
         4SFa/YqyrRb3JavJge10v7E6qHKe+P/ZfFnAbeHX12+pcvV88XhnsES67qpvAju0+56i
         Fx6kkMk0ZvwXIBxH+hB9JptmivwY68L4n6ucHqoN4hfQ5u+0xG0T9QjafnumrmjDxHUR
         iYZ1s1A4BBEOxSMcbWNlxQQF7emi5Jd6063I5jqHiigZfQ0EKFtecfxjN6RVO3tHLRES
         MIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=G2EhbTfL6RgiBoe8p2qGDsQHbXzW305CIfRgaTSzQks=;
        b=vK7q5t+AOk8QlOp1JpVUGBD7Hpq5MNb+asmI2uVIpEuUc29eEMnOx7hSIrqHNHm0jk
         Cl2nuMTMhVotswVDOVi3PDP3X6sSiECzLx5XYah+YjtxZ9aSUV5uPbBlFPSqx2Yq1ne6
         aInGSEUokTMPHL26ydzH8aD+ur8BP5QCLMrjQ8ZKO7bWkcsmCn1Cs7ClfLB+BBxGg7hB
         mXDHzOoSrrFRJdFmFx8513vTt3QetS1wp2HHxpfcqTBh9+vB9QLEwtEEtETTXWsLC2AO
         BoAvlImQwmAbqWhHBvkQ4QAJwPf5UAbpBdsXWMJwlX0ECi7tXVAlFHmsDqJRwK5OAdNW
         ZsTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tpiiNAkR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m133si476110ywc.321.2019.02.14.05.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:03:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tpiiNAkR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGg1-0003l5-MP
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:03:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGdx-0002tT-S2
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 08:01:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGUD-0006nF-8K
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:31 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGU2-0006Xe-OK
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:22 -0500
Received: by mail-wm1-x344.google.com with SMTP id v26so5975960wmh.3
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 04:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=G2EhbTfL6RgiBoe8p2qGDsQHbXzW305CIfRgaTSzQks=;
	b=tpiiNAkRlt5Mq4oVeOBPjfNDjT7rd4+uEtR3yNh8IAy1r9JhNNpqaGyNA/Lmqzi5H5
	UgmZ9cZxBCcYcWb1qX3LHxAsrKbiiQc0A2bKR4WIBGupsZJe4f5/mkkkKdZ4jv/ZBeam
	Vy+ch7yIi9BOPRwYHjfQwrNyK1rk/6nMb6N/uOEOncQTiUhdCxeLqh7ltCYX9ChyCQyl
	Kci99sFGR5WNrhixpiyvt1xmgTjHaaaiNRuydLEW7pA+e/uzCYwBItJDAOWJkzK7EeUS
	OfMKw6po7mOV0YsbcXfFqoDnsD7xIZwTLmd4xoj4EjpD6EX7E5rIxv3C3whAGwU2GJjj
	uQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G2EhbTfL6RgiBoe8p2qGDsQHbXzW305CIfRgaTSzQks=;
	b=KlRe/wFhfnLrCg+r7Q89d/NcRgdgXOSvRZ6nH5BAQ67xKNywBMJvDs+7k1HE5Zpc3v
	E8ty+H2V1/i0HsgwUOS5j1weI9vAM9miVWD6DMmaGCoQKVT1GtusWwTy9L1/WKYk636P
	4iDpbSc6fFaEjPU4grsNd4K+RsDsvGve2jbvzIlGXiUNuEML8JhOHRlCG43DHXf8l6b9
	p8LBMlAnI+tB36O53r4+PYybsaD6w9ALQ+qqFqP7vhOVNKs+XNc489qBUClJCtgcqsOH
	qfBfna9PeSDzTOZFV+gzdM1sDo1tp7TFbQigKnOgG2w8s+QNq24FeNmoTCqHVDvuQxx+
	+UYg==
X-Gm-Message-State: AHQUAub2M9ZHYbdylSJET9iJRb+mhpIMy7HLEGUD0Q7C/ANRERgi7C75
	+racJX+8L096FnoiVU8V/PEIvw==
X-Received: by 2002:a7b:cf03:: with SMTP id l3mr2650197wmg.14.1550148677565;
	Thu, 14 Feb 2019 04:51:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:51:00 +0000
Message-Id: <20190214125107.22178-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH 07/14] hw/char/pl011: Use '0x' prefix when
 logging hex numbers
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
X-TUID: 9JgW7AzZaesc

The pl011 logs when the guest makes a bad access. It prints
the address offset in hex but confusingly omits the '0x'
prefix; add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 29f4e5eb224..e5dd448f854 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -143,7 +143,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "pl011_read: Bad offset %x\n", (int)offset);
+                      "pl011_read: Bad offset 0x%x\n", (int)offset);
         r = 0;
         break;
     }
@@ -232,7 +232,7 @@ static void pl011_write(void *opaque, hwaddr offset,
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "pl011_write: Bad offset %x\n", (int)offset);
+                      "pl011_write: Bad offset 0x%x\n", (int)offset);
     }
 }
 
-- 
2.20.1

