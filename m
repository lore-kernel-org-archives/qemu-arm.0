Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4199312wrg;
        Tue, 11 Jun 2019 03:55:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIS1CIPSvMCu6b/OWM+rkXdMK3bU6PK2yzdIUmvlNPtK3GfZcExuV6o8UAIZWq5o9XvFUU
X-Received: by 2002:a05:620a:124c:: with SMTP id a12mr60104616qkl.336.1560250532668;
        Tue, 11 Jun 2019 03:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560250532; cv=none;
        d=google.com; s=arc-20160816;
        b=sdBJU4MmPGzrGCvtbHrqKs52Vp0yLKyyV4jihOHtaiod9MLzk1n83wj2B/3EtERuPh
         xvD6Tsw8OnX1VJMAyKkKNgh4GfH/nzYIbJZRDIBQSv7TaCuBAXLJFObUAOZ8qrrMj5/q
         16K8yqX/UoceNpjAH7rLLhzVUp5ujxCx/IPrFiInCxlD+HwCimdBREfEYL78q5At6fkF
         W2DzCy8R3TQB5RSxeKP77x0I5EqcJbOrRkjq+nwTZwsaVrBuIqUy1E2L1d9n5lQUpp4U
         /IdkJDQ90vFGYY7iM6+g6kCpghe7ippFi9mT2OUomOb0lGLF5u7fPFko90E3Oir7qKTH
         hIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=2nnkt7R1TuC9dEF2XrgS8dyozUj2d0kArsZ33YiCDeY=;
        b=G7xVCgUgU3bAaTxnKLxg9QwxucovtQIsT/QwlSiTvEFRvpyBShk6/cmtZH16nbg/8V
         Ij/Ebnkr21N9L/ipk5kw/XrmEEfl0M6HY3QV08vV21QEhKZ75sjiVb75//cVtsrW/EBn
         9wIA2mFeLPJryEg/N/Bh8mhVi3ns8hKprGdP9z4g89S12/Vy/1+g/0dUuuEFUP7T2Huo
         nFEIGj4C3a215UqceG8tP5k1UM0Qdf/7Rvl/rfT3JwDhv9/vpHBLDujvcSrBYHmBa/aQ
         A5s+7cIcBly3LzKHKugwBvwTiI5gPA8m5AXnPYgjq1yb10GzcgviI5Mv+Wr+jRC4fgf8
         C24g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vhEsKcSb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 96si3592793qtc.318.2019.06.11.03.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 03:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vhEsKcSb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeR8-00079J-B8
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 06:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38844)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePg-00072g-51
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePe-0007CJ-Ge
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:53:59 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35555)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePe-0007Be-Ai
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:53:58 -0400
Received: by mail-wm1-x343.google.com with SMTP id c6so2403500wml.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2nnkt7R1TuC9dEF2XrgS8dyozUj2d0kArsZ33YiCDeY=;
 b=vhEsKcSbtesMlNLHub1R3EqBDLAFaYjNUYnHR48csoo2Z1jqFCW9Yp5hDcgsOFCGU/
 9eVRrw+406d/xy9bT5hWECbLBpdu2TBl32jv9kDqtUU5N/TLQdYPmz3zkk4xH07aS+HP
 cXs3x8aUAj2d4v5Lf4L2ASKXMyLqNPsSZtcqzXrChNgAD6DSzBEuqzjfb/crDlGc4yyj
 eBELjYPnLs0KacmGPSVnx3j2ym/jiw5q2ZAKIe+ZDtDC/fZBZSbARAmk1M5Y9MLU+DSu
 DNRmFqyQ5YJNC6Y1eMT+f81sgp2BJpoPW0kZL0RI6i8PH5kwzs+XYcNhYNdvU6R/3ORw
 H/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2nnkt7R1TuC9dEF2XrgS8dyozUj2d0kArsZ33YiCDeY=;
 b=BdXSqH3nBdFo4OhQ8xq44GgJdvB/knhmIwwqjKlnuvD7VtENzmkBLzrBbU2rBnhfG5
 dIrYsaqC34X7adrPCr0lDHq4MKdRvM57QhShjdKNPwLmdOhIG8+Zy2xtYAZ/DJWCYTIR
 n7CtBWFzcBqAVG67/Uk62i9fqMnnejXSMHQhNEhVNm64W0MNlkC1VAlHPxQROH0slYqb
 I4UEo21gAXfQmSI1XJz2GlR1d4s+oZxLeiHWlwBk3BJXcGPfoUMyrP9+YVMgCkA1J31s
 JSzIU7Qo/0DOkoPhai4uYTG1DylGOstndY+VQ6JId3HKsPYXVtuy286TE2QiNXBlDYHE
 BqRQ==
X-Gm-Message-State: APjAAAUX4VrsAF817Yt6UOoK66PKgunTIq10UsXTJIkvPYvNmwtveUZx
 +qfrYO4weYEzL+TXpYthklbU2vaAm87UZw==
X-Received: by 2002:a1c:f001:: with SMTP id a1mr18327491wmb.130.1560250437454; 
 Tue, 11 Jun 2019 03:53:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.53.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:53:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:13 +0100
Message-Id: <20190611105351.9871-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH v2 04/42] target/arm: Fix Cortex-R5F MVFR values
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5l9R9iiNiy/2

The Cortex-R5F initfn was not correctly setting up the MVFR
ID register values. Fill these in, since some subsequent patches
will use ID register checks rather than CPU feature bit checks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f70e07fd118..ac5adb81bf1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1607,6 +1607,8 @@ static void cortex_r5f_initfn(Object *obj)
 
     cortex_r5_initfn(obj);
     set_feature(&cpu->env, ARM_FEATURE_VFP3);
+    cpu->isar.mvfr0 = 0x10110221;
+    cpu->isar.mvfr1 = 0x00000011;
 }
 
 static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
-- 
2.20.1

