Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1767989lfg;
        Tue, 25 Feb 2020 06:39:26 -0800 (PST)
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr86230wma.32.1582641566198;
        Tue, 25 Feb 2020 06:39:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582641566; cv=none;
        d=google.com; s=arc-20160816;
        b=vWpHAxjuYiF2rgOBfQFwEDnTFZtQ0j3wlwRfjmzINkkrMCGTfstQaRombLrd5U4m2b
         FKvY7GnpjX63qWDVBExwNpOUGyQrVZ1PFE3httWw2Brz8nQFVv9+ex4/VY8AMwXQnDm/
         euT1y9E0L/Syh7TCxif97BOFQ2WTvme3bIXyxk7BjydbibFphr3S037KdcuPBXKG+gqB
         v4j2GJ4O54gD/dan5OK66fmUTv0DHy181FQJ+paLD3D4wuMu4kX88ar8S80FXEI++t6H
         2r+u7NSCB5HzvkHX+Xh0DOe56s5c9ky2f5r9l0LDP2hhSQXNRorKO0CIixY6aCjVT5wI
         zUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=CxC7+57klu/2mln+X9DRHhYMcaLTR/a8a6mDU1Kkwh0=;
        b=ojvoZRneWB/P4toELrVrXwKLCem4wCYHkRZ/4uIt4UvBf01a5V4ygsyPuDBLRAWid4
         o0H2uF9hp31fwN5wL0AXjzhOzf/HVVDTkx2WLDrCLEtV8cabp/iSrqzOH+BE/r0llaWO
         8ZUfiq/OQfYeQHoygI4EB2v3neln9BLodUM1uFHIqDIl+w+8/3hA6fj3JpH0ISEF26aZ
         OJaXOUPQ9G2tjrFySG06KI2vxEOghX+1GCAkCqGn1cjLJ930YH6D3Nfc0tjyMLR4hJ7x
         Gf5R8RM4ofCFHvWBmMgDwAR8HeeMBQL2CPR00tuHj52wLxcMpbUQvZ5Tr04qEr5IsWbF
         58dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nid8GJYA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q17sor4165106wrp.61.2020.02.25.06.39.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 25 Feb 2020 06:39:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nid8GJYA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CxC7+57klu/2mln+X9DRHhYMcaLTR/a8a6mDU1Kkwh0=;
        b=nid8GJYAJPYBPm/sS1dx1DsWD7C33KyCs1UYpq/bGeHkJz2ohx55kYP6MoXAx/BfDD
         z22K2c68MTFWY/PHKVJAo6uKWVPNnDe4TlnYTRiH0M8F+BJkj2Tt2JwgdsLZK0UBUL4y
         9szs8FDdtVH0lkl2VeGbZBA0PcgUkX28PklCZncEnqPnf4AAOXTFCKx27Hp25TWmwxi8
         3DNJ7H5WSOaBcVfqfb3cpORSUJ0UMlvDVMmpgnW5TLruY10o9kH+Z+AWlIHFYPTo5qIc
         M3L1E7bXZXShVFoXfrzv7Qri7bMVL4+UTx7Y1qvRzd5WxYuHnt9kkiTuU1/k5v7ukUOq
         XbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CxC7+57klu/2mln+X9DRHhYMcaLTR/a8a6mDU1Kkwh0=;
        b=UR+mmID5PwugE7cNLXmQonwgSI0iGeBnh9ij1VPs07vjiBtAAkwm+OhLtahYqEZTH2
         bXY16robljG8MNs8gqbBVgayrUlXSnFBf+Du31QqOwH1cUVxsyt3JtpMlQuoeHGMmnPv
         g/tpj8pyyGSOVJsV4sFmSoWZY8kucB0UqKh3bqBFu8ZhKX2kbkZwmkG9VaDH3KvPZBSg
         S+ovHweqyCW/MwFx2DXBinjLnoW2cdzPl0GMO7I093thGNrzOFvSsYCsytB74xtDl2VC
         wRA+9i/4mHh3r29bzdeOgPe1WeUmBqsXwPm2mcNNZDzQjLITMByUbCnt0FxWPWG13081
         nVdw==
X-Gm-Message-State: APjAAAX6j7IcilC/LA4h97+QX0iROe/QX4O4WWsUJ/wHzsfYKk2hL4NV
	Ftd/WK2ICFXElnacQM33fzZPU5An
X-Google-Smtp-Source: APXvYqwU4yLh/xJKjVASihiQSNbsM8wOJz7/8WYgkpIVwqsMHUF+1qKnjy77ISI080QbkY4waVrv5g==
X-Received: by 2002:adf:a50b:: with SMTP id i11mr1369390wrb.60.1582641565849;
        Tue, 25 Feb 2020 06:39:25 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id w8sm4388820wmm.0.2020.02.25.06.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 06:39:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH RISU] aarch64.risu: Add patterns for v8.3-RCPC and v8.4-RCPC insns
Date: Tue, 25 Feb 2020 14:39:23 +0000
Message-Id: <20200225143923.22297-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GvVAk0rGdwSE

Add patterns for the new instructions in the v8.3-RCPC and
v8.4-RCPC extensions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is what I used for testing the RCPC QEMU patches I sent out
the other day. Did I get the @ section syntax here right?


 aarch64.risu | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/aarch64.risu b/aarch64.risu
index c4eda7a..8f08cd0 100644
--- a/aarch64.risu
+++ b/aarch64.risu
@@ -3019,3 +3019,35 @@ SM3TT2B A64_V 1100 1110 010 rm:5 10 imm:2 11 rn:5 rd:5
 XAR A64_V 1100 1110 100 rm:5 imm:6 rn:5 rd:5
 
 @
+
+# v8.3-RCPC instructions
+@v8_3_rcpc
+
+# LDAPR, LDAPRH, LDAPRB
+# As usual, the $rn != $rt constraint is risu-imposed, not architectural
+LDAPR A64 sz:2 111000 101 11111 1100 00 rn:5 rt:5 \
+!constraints { $rn != 31 && $rn != $rt } \
+!memory { align(1 << $sz); reg_plus_imm($rn, 0); }
+
+@
+
+# v8.4-RCPC instructions
+# As usual, the $rn != $rt constraint is risu-imposed, not architectural
+@v8_4_rcpc
+STLUR A64 sz:2 011001 00 0 imm:9 00 rn:5 rt:5 \
+!constraints { $rn != 31 && $rn != $rt } \
+!memory { align(1 << $sz); reg_plus_imm($rn, $imm); }
+
+LDAPUR A64 sz:2 011001 01 0 imm:9 00 rn:5 rt:5 \
+!constraints { $rn != 31 && $rn != $rt } \
+!memory { align(1 << $sz); reg_plus_imm($rn, $imm); }
+
+LDAPURS64 A64 sz:2 011001 10 0 imm:9 00 rn:5 rt:5 \
+!constraints { $rn != 31 && $rn != $rt && $sz != 3 } \
+!memory { align(1 << $sz); reg_plus_imm($rn, $imm); }
+
+LDAPURS32 A64 sz:2 011001 11 0 imm:9 00 rn:5 rt:5 \
+!constraints { $rn != 31 && $rn != $rt && $sz < 2 } \
+!memory { align(1 << $sz); reg_plus_imm($rn, $imm); }
+
+@
-- 
2.20.1
