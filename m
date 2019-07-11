Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp658947wrv;
        Thu, 11 Jul 2019 05:12:34 -0700 (PDT)
X-Received: by 2002:a5d:52c7:: with SMTP id r7mr4833351wrv.83.1562847154625;
        Thu, 11 Jul 2019 05:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562847154; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6tMaHCJYHOogPope9nOWP6pDeVCwq05UEshY9nIFpLIiKQV8qCixFahGx6qloOUVL
         ZQAe1Dhr+q0a06kQFpzf27FXaEivhSm0JO1UAO6Vedcpfgj5cJlMIqDxzc4zs0ssUEu9
         /76orLqgPi/BVkdSwmuPCQRr627dubb6oUg6Al8icWMl7wuJ/wWX7GJzwjVmesV5qo6i
         J9a5guHoW/cfrSmhWoZEqUy5Ay566M94d4bH1BU9+7uiIbr5ABlhl0KsfE+zyff9LMeQ
         3Hj8iEzlONxJVdjOXi9l0DT4YQxTXY/5HJGEfhYxBvFGQ9IFDeXCkV7hBVVG0iKQpOzq
         Lv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=V3cMonKbsaOdqE8YXh9RMaH2ufvX5rqBag4d1fqLsno=;
        b=z8cvrDGhnzsIC+laFIjgNvqzOF4vRfBKgx0L6ku2OSzfa3Kbnm9RpS1mDCwXmp+g7U
         Q0hbnmSbY//acJH24Nr7WR39b41a/XZX6d/HpestAFIudhbuon0GknF2b6kDBo08O2FZ
         6UogaXZhxDonKJgc7aJosxS0HmvdP3qMzd2LyYxcNrvzTAWOcMthzgEczZBnJR/YrU+H
         7DwKJgg87IyITn4eQc+RZV146+aBZKQiUa0gT3ITGRUV4WfPsvr0Dxo6RLW7Yb4nMg9i
         CMipouYTfIG2msUmHPpoY3cZDn/96Y+xgMzeIngYhtMLqpf4VuwuImKJZ18uQf9pkF2w
         UAZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u83XEOxf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y65sor3279462wmg.29.2019.07.11.05.12.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2019 05:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u83XEOxf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3cMonKbsaOdqE8YXh9RMaH2ufvX5rqBag4d1fqLsno=;
        b=u83XEOxfttHrkYfRR73FH+1Bt+QVdu6ihf18+K/CsYJfsbore+Nud1Giocp4+HS0Kt
         MFCwzg+hfmaS0GGCA3QBl38im7IDB9q/qf55dLqYYFNzTu+GcO43QDLcB7RVU+yp+/F9
         W8dqbGbmYd4RPFbSVt6HNdgIoQmDg+RDBEPpbr2n249w/2qlW1NACfEYV9UTanDuCOL0
         MUN/LnilhLZAWQiRCeqfXSvontMpYIV89mh0gY7kYwmMT813osJM8c6hmEJAAonFTkc2
         TLIls6cmJbfmcAuiSLg1R8Pz/QJujVDGNGVbZDR9DmgOJj5XXIl1LY/YuJlSpdZDctpE
         gvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3cMonKbsaOdqE8YXh9RMaH2ufvX5rqBag4d1fqLsno=;
        b=kIxuog82pleNHrl/fbteS0x1YIHQa5VEBiJAnuMx/+GasWeEaBwgUjxHvpSqmNSScS
         23Dw7r1snwc9hMj3uXAbTSBDKZgdscSYk4XuKHhlYzjWutC9iH0TN/DzYO7/+gpgZCvi
         tN6lHozQxdpWUqN5DwGynIRLr7hNfYsk/dXkz2noK3ECAu9LRJuJQGZLR4eosLcPo/TK
         APmSOV8Dc/E/R0YMWeLeyYnXcOy3tGQajMBt6HgBKaWOwIqunBYb8NRBb2WolIDEepHn
         VBXeNhzDV5D47MMDHw9vHd72eVE5irV21k4XSpfuCnSdtYVv6nrLz77gotRMcNpobUGq
         HDJg==
X-Gm-Message-State: APjAAAVfTMtTQnt/VRgDUKq/5Q1paZESVJ2baUFckpTgtIEHkkXhRVDj
	yE0qng2gCxt50yqoOKGv/MSy7tW8
X-Google-Smtp-Source: APXvYqyjRL4Pm4DJ6gxCMhMAABASOjX9YkWy30mz3VnyIHV5hXZJr9CkbqrhyS3PouGt0usrziod8A==
X-Received: by 2002:a1c:eb17:: with SMTP id j23mr4268983wmh.151.1562847154257;
        Thu, 11 Jul 2019 05:12:34 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id s25sm5129296wmc.21.2019.07.11.05.12.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 05:12:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christophe Lyon <christophe.lyon@linaro.org>
Subject: [PATCH for-4.1] target/arm: Set VFP-related MVFR0 fields for arm926 and arm1026
Date: Thu, 11 Jul 2019 13:12:31 +0100
Message-Id: <20190711121231.3601-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZVi8gaMD+TRs

The ARMv5 architecture didn't specify detailed per-feature ID
registers. Now that we're using the MVFR0 register fields to
gate the existence of VFP instructions, we need to set up
the correct values in the cpu->isar structure so that we still
provide an FPU to the guest.

This fixes a regression in the arm926 and arm1026 CPUs, which
are the only ones that both have VFP and are ARMv5 or earlier.
This regression was introduced by the VFP refactoring, and more
specifically by commits 1120827fa182f0e76 and 266bd25c485597c,
which accidentally disabled VFP short-vector support and
double-precision support on these CPUs.

Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 1120827fa182f0e
Fixes: 266bd25c485597c
Fixes: https://bugs.launchpad.net/qemu/+bug/1836192
---
I've followed the existing approach we used for ISAR1 here
of just filling in the fields we care about, rather than trying
to set the entire register value.

 target/arm/cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e75a64a25a4..446dd5163dc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1666,6 +1666,12 @@ static void arm926_initfn(Object *obj)
      * set the field to indicate Jazelle support within QEMU.
      */
     cpu->isar.id_isar1 = FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELLE, 1);
+    /*
+     * Similarly, we need to set MVFR0 fields to enable double precision
+     * and short vector support even though ARMv5 doesn't have this register.
+     */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
 }
 
 static void arm946_initfn(Object *obj)
@@ -1713,6 +1719,12 @@ static void arm1026_initfn(Object *obj)
         };
         define_one_arm_cp_reg(cpu, &ifar);
     }
+    /*
+     * Similarly, we need to set MVFR0 fields to enable double precision
+     * and short vector support even though ARMv5 doesn't have this register.
+     */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
 }
 
 static void arm1136_r2_initfn(Object *obj)
-- 
2.20.1
