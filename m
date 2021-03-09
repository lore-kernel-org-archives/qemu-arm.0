Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955877lfg;
        Tue, 9 Mar 2021 08:22:04 -0800 (PST)
X-Received: by 2002:a05:6830:802:: with SMTP id r2mr21006833ots.110.1615306924641;
        Tue, 09 Mar 2021 08:22:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306924; cv=none;
        d=google.com; s=arc-20160816;
        b=VVjOnIdMAudlR/i3jP9jaTf9gXhX/2AbJHxmvWFvIOWZwkMHDAU/dldldoC56ybR6j
         SLnTaqAIgyTRSkKPtWLsLe0QgCRHaeTIklSvJmqwjY9XnDOM2rHF+SimVcr8/8tFTQ4Z
         IPQdLo6GqFYoCISVk60at3cma0T/FtVjPoMKuTQMW3LP+nm8Zrnh4Fi/ERY4ZEpmr3TP
         oaprl20k5wR6AreCDrM8kr3fetqRirvft/ubw5A+zpyRhSPooTsaaK2gDbHC5Bjhd1sZ
         1vfW7sPGtvP5/NsDnSC/YopjeBRVLed8prXQdFxOzXrG8hkHfurTYUjRH+CHZLmWeSz4
         /y/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=34lemQd5zIzYiuHieHMv0eB4fxYwFhBfNJ3IIztazZk=;
        b=FwkE72Z+IdOpYpzpg97beMwHXgVpFy/M/WlSWDJ7lTYckyEaYFE9ey2Hyh2r2lskGF
         4DvP3TsfL5X9wPIR184SmAZtJfzgvfWe/t4k4c3MdOXVQEbjjhqVBEUtKkUk4tPmNEeY
         pW6Myx9rbDL5zizu1Iup41Sco0EEgS1tbLFDDAerb9TM+AWQo81DdDLYXA1WiJprYuWF
         YgyOilDB0eVHF0P7TdCdMyppjxYfeitctJIHndOz42QdSYthijyu20QHJ5E+JLrlLEMy
         wEkiV9SS3sj6WlCcdM1nLnRpiQniUwKZlPWK2j/Sr54Dg2Q+N0YV9kV8AeW/J1VtFMZx
         vjIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q+G3nnup;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o131sor4204956oia.0.2021.03.09.08.22.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q+G3nnup;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=34lemQd5zIzYiuHieHMv0eB4fxYwFhBfNJ3IIztazZk=;
        b=q+G3nnupCHprgfnvNQwKm5tEFHHItpSSzY4MT7WkgFPmusKZ9UQj8raPo3bMwhqiyK
         2X53mDkTV038gOIKvBz03NUs6g/iNNhG3UJOYSkGn5zJsNPJU5gFkzx8wx95wGGjVD39
         QhrtB3aKx+G8CZvF6a4hEEMsC1I/yLIOvBDAR+WV+GnMunO/VYfladoWVka2SBOkAgRx
         J0yUv0XcU2HrDCTxvzULUF/kuqFjWSxtoMeMl8Lo5q+/orh4WzY7TW/Pt7d++kmyCb26
         rypY8you0fsEINPcN7joDVb5zMviCXo1HDW+bMu7bN3kNKqQByFKkrTapyqvySY2fKsi
         93DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=34lemQd5zIzYiuHieHMv0eB4fxYwFhBfNJ3IIztazZk=;
        b=TbbGAUKjaFmkz2uF9pqs8ZYiBNrJ3nILbz7VZGV67Szzw7+etfJIdjqJHQCIjGg9j/
         81pex43mHMkTBYozVwCx8og9tMb/nWRqxkTt166S9CkD/GXfHyK7IeGHFZzyIFzB7ETP
         m1YbTSOzQ5WLxII+gT8SU34nr1SBgmG5XMST0ysa7BwMnBljuiVOjDOJA5ne61MLJ4cK
         uC48v8/dXCFJp6idp9H9HXD0L2nsWqPuNHId2hagjdMx3G2SwTDBZg1w8y3CxESZJm3c
         5BmQ/qHfnbHajinf3xpvViKaySHyDhF1eiJqBQzqDKhZiXdQrA/H0YmioqGawE1Q4AEQ
         4Ceg==
X-Gm-Message-State: AOAM532yJuKP0CKFpD/zWGVIC4OgFv7tcLt3fP8faOtFobS8IJGm83Qn
	TWktLvuROXlEUdSQpYRL95NRmLS2Ub4Y5y4T5mo=
X-Google-Smtp-Source: ABdhPJwcN9S0DtUneNgC7yU/w0A4/cksNgysr8iErP/djFEZuRWGILnY85Nco4uYx5bhLh6X/fDSKA==
X-Received: by 2002:aca:de82:: with SMTP id v124mr3485851oig.125.1615306924296;
        Tue, 09 Mar 2021 08:22:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 44/78] target/arm: Implement SVE2 scatter store insns
Date: Tue,  9 Mar 2021 08:20:07 -0800
Message-Id: <20210309162041.23124-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ilMHYrHOmQEH

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal
store insns.

64-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)
* STNT1D (vector plus scalar)

32-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7645587469..5cfe6df0d2 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1388,3 +1388,13 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
+
+### SVE2 Memory Store Group
+
+# SVE2 64-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=2 esz=3 scale=0
+
+# SVE2 32-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=2 scale=0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cad61f4577..895522e3cf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6168,6 +6168,14 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     return true;
 }
 
+static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_ST1_zprz(s, a);
+}
+
 /*
  * Prefetches
  */
-- 
2.25.1
