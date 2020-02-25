Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1091538lfg;
        Mon, 24 Feb 2020 19:14:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzlKyhJCH4NPvZlNUbA3puLAPrLZR5nhWmkTpb9fPCx+P6I9RTW8IAoebfP0RDQ/cBXfTjE
X-Received: by 2002:a37:4755:: with SMTP id u82mr51361385qka.43.1582600490800;
        Mon, 24 Feb 2020 19:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582600490; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4DSKFQUGQutarrRi5stqB3X7qsAmskbd94ZmRUjZ3t12/9q/DXu3QV7AXPEvwof2j
         D7HsyEHftdOGi7Pe2cbSCLElEkT0eBsNi5jS+77FrPkxM5ZM5UMtC83Tckh64n3mNo9I
         CZjrIggRuXQtpCBKDLtupXB9iMlWgume9bNPjzHCRMp/tbfXcVFtwla63EHmPZtjX6vB
         2m8XH9S3Fw1IxEH4L/xw0ewC8+xyK5+Ab+/RMbyuBzRZ4JWrPtaPyGcZLGcm1Azf3f1T
         EI1ZK+JvpSr32cNZUmGGnG7K9PBu0Xle5WkgJ5X6EUlFLLez2fm09aANeMnip3aPgNi2
         gzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oi7EF/ZZDkkxyzeBMO90cI5DXKAzhVbrdZpsDYTxfKg=;
        b=XA2/tyIyOFeSV7rPWwXDF3MgbdIUOUAneHaeArSvgfdGdKNpupA1WoGGIp7K+RQ5eb
         r+UlQAy8VmLIoGfymKKMcHIjHmW4UcpTK1UF4BSUV3Cd0un8BAkNsEHFQx9H538in0C6
         WEBiVW/iWYfmNmxupSR2TGjPt/ZlqIB3B4RAs0rXhZpVGjR3FAEDbZgj7Ehe2CUeS/N3
         mALWJAmpdLeWOE94DGku0oc8Cq02qsPX+MjkidlSLt6RNj4FUN6PplootvM3Kezb2f50
         diCs8OKfFz/jtP06FwiAkVOLr4p4gLDhxwAemsgX8lTJr8Tm/xmZG48lH7msRGES4JPM
         MG0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Msg+2ZlY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d195si5400763qkg.312.2020.02.24.19.14.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 19:14:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Msg+2ZlY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6QgM-0003NN-9t
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 22:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfv-0002xz-MO
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfu-0005N5-Qp
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:23 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:54055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6Qfu-0005Mb-LK
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:22 -0500
Received: by mail-pj1-x1043.google.com with SMTP id n96so631041pjc.3
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 19:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oi7EF/ZZDkkxyzeBMO90cI5DXKAzhVbrdZpsDYTxfKg=;
 b=Msg+2ZlYfJZwBjEgd96JTAJxLDFY5epMzcgYf5k97yRLi9+WiX8dRiggeU/kcLwmE5
 XFRIvxjmLCU9Izv0CBs7ZbTSPfI0oXqEpJrbB+B1u6qtzu9yDO2ngmGIsx7pzCowpbJx
 eSGp843R6RUQ0kW2kA7AB3S1uSu4FTg2rt5ZZxkfxMJsdcOTa6MLPLh4vm9ausfmjP3p
 Otb/NN375+Bo8s2UDsG7bXiq9YUooiITR9Yj4QlDMOlK4zuTRx8RrDUzLAqYwiUo6kLy
 x/m/2I4qD1KpgnlNsmIDsLWLIrqXgLb63VNC/2Rtxrs8Gji5g0Wo1fFfDGxRatJYVzqe
 lzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oi7EF/ZZDkkxyzeBMO90cI5DXKAzhVbrdZpsDYTxfKg=;
 b=QDfjQ+KouSjKDt8/BkyS/HAOMNaStiKZOGcqvVFqjoZyEq9vHGW57hIFVPgP6zNgW0
 a+qV9CoqhWiUHqNY9Zx0thav7+/j6VwndUxcYv2UmJp+FySeV+dgl8fqtTFoOi0ytdV7
 Fz1rD5utOtmn3TZQcefU6FA4ZBd0Sb+8JOTGA73J/dJglEIOY2RCiKWK5cHEebr2TF5+
 Lrsug7pocrmMqbp4PJ64nBX3+OD7g02pdULsxl/iqp3FfYoU+USGH0unmO1TmeaLxpDZ
 p0Vtr3vA+oPM+maF35KTDjGo3ph3bLVityaZvmSQFtqQJ/p3QY+A+qTh5FzSb0Hd8vGu
 ruAw==
X-Gm-Message-State: APjAAAV81pJH+IXTrJvvlAic6UH3ShqwSiracjMXBFirCPui4xaMRrDr
 Rsey3Otc9RJx78SPnt878/RX3g==
X-Received: by 2002:a17:902:b212:: with SMTP id
 t18mr51805731plr.135.1582600461555; 
 Mon, 24 Feb 2020 19:14:21 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id q66sm14975242pfq.27.2020.02.24.19.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 19:14:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] target/arm: Clean address for DC ZVA
Date: Mon, 24 Feb 2020 19:14:12 -0800
Message-Id: <20200225031414.15649-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225031414.15649-1-richard.henderson@linaro.org>
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qIyWzJSNcz5o

This data access was forgotten when we added support for cleaning
addresses of TBI information.

Fixes: 3a471103ac1823ba
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 596bf4cf73..24c1fbd262 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1784,7 +1784,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
-        tcg_rt = cpu_reg(s, rt);
+        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
     default:
-- 
2.20.1

