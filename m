Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955979lfg;
        Tue, 9 Mar 2021 08:22:11 -0800 (PST)
X-Received: by 2002:a9d:6949:: with SMTP id p9mr7710281oto.252.1615306931571;
        Tue, 09 Mar 2021 08:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306931; cv=none;
        d=google.com; s=arc-20160816;
        b=od12qLDpxtJP0efrXQx7wJSPTXOaNPtDJ6wZrh5q9gcxW9yDrHxXydZf+YWETxGyRa
         lhe6C3x0eReND826rPzmnVE138/J/SgMQgtQQdyJ47JNwObs5RpkaoYC5nv0LkMQWTV3
         Z/4kTbfbKOtP3VAr+E2dJbblgcez/MfBIyeoywSgjVTsvenIPlbxcXZxIKXggXKVOCgR
         J0E1H5Dmg6UnOjb3NFTMjXUptZLW7f3D+q2UtCsm9RSz8pw5WCJG/RkLv8d05F/tShO4
         87MMCuRTQZeE9lULt4Nm8Jozx5P09fquyZ3Q5okEN8WSjH7z096NQYjPP9gbrQG8qw+o
         qMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gqJnI67ZsQPzrPFFIP/tf6r9PpztXTYxjNrV84rekq4=;
        b=OB+izjEkpMNpbTr13c6pakLX+hULWks5edSR4JQHUnY5XkUjQYWDo2Z6+VfoDwEzbA
         ykLAwGRLhG5Pro+7A/Ao6iD1xeFXmUaQWcIGDMYUC/WoylFIAjkNtVsgVnksAFPKgyBQ
         b6UqKsU0Jn0ekVDE8iY6DEnoXVd5QGInrlej+/lQDMrPEHGXePDKVSoSHLlOHkDAakpO
         rVQQdxsrWLJVO5ayyHYC09N6d2IEJgkGQeRznshNJY5zMQvol+x3gxpRWLfqILRA9tTc
         jrJexD6BWG/dHyeDfJAmPQIqVjnW5dRDjJTskrPsxUL4vg1T4U1XYgq9/jLVtzpDJe3a
         O/kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uumtE7Ra;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v3sor3364172otk.81.2021.03.09.08.22.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:11 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uumtE7Ra;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gqJnI67ZsQPzrPFFIP/tf6r9PpztXTYxjNrV84rekq4=;
        b=uumtE7RaWimHkpHQG3IuIYrCoycoH9N7U5i/2c1Ue/7SOqhIwiIss/2e/fDXGVRcsG
         rgrklQPMmdB750IVU0hnibtYaaMN5mNHPQenrObw9Y6TK/2esuV7xu9BWynwtDuDes7z
         GsCIGhf5JvuErBWURNSft+lmyHY8ZeN9PrsdDSeLTGVilcdFYj3DR3awNO4ix6URMvIi
         A2EPbnSUTZPLK5p3IMNngi/tFDXIiEifcPqBhsB411AtDcD9WK+z2q3NErlaKo9H06hb
         6wsWzzDuGQHPjDnaPZYABtXRk0rhPcEsf0/e+F4nipzYigbiXh85LqzMSFJV8Dzx4MHX
         nh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gqJnI67ZsQPzrPFFIP/tf6r9PpztXTYxjNrV84rekq4=;
        b=iZs5SHS/JVD5rO2qyz2Bv5+XRw2dqhqFbuLDZ0wJSqQ5LV9CxvWlNKs/+iAUfauHLz
         ce4FLlF2laM3rU+NB7PwE8RKifw83jz3OJDV2xzUvJ/ruiTH6epTypQVuP0/aB2kdpN1
         G1pXGcZwDKFpIIHE5DZAoKO7kAGhFIerbFX2RKqmnzREiL7ztCTy+9zf7bSgHwE9cn1D
         PeylmqSDIGryV93ofZ3J4E0gwrquVe6hD23f6St+LRlucpGjeX3STLyIiYnnxQz2ogC3
         nBxdnQBV0Hwxi4nlv8lhk8zQ7el73JMUx19xxlvCaR3fjVy5JNyj1RBTrfBl/GH0ABcQ
         EJaQ==
X-Gm-Message-State: AOAM5322sQaWMJArhIDjdfPI+/bxtNck4X34WwPBTyAZKuBxvybOhoAh
	sMSCoN++Uhs0/GpRRXmyW4KKWO0c
X-Google-Smtp-Source: ABdhPJwCLobaDVUjYB0DCor6zzHix+e7cGm+ewY5uG84ut+siUx9idFcjcZ6SYUw4OHixoEc83xFtg==
X-Received: by 2002:a05:6830:802:: with SMTP id r2mr21007229ots.110.1615306931216;
        Tue, 09 Mar 2021 08:22:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 50/78] target/arm: Split out formats for 2 vectors + 1 index
Date: Tue,  9 Mar 2021 08:20:13 -0800
Message-Id: <20210309162041.23124-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: P++DMIz93oEN

Currently only used by FMUL, but will shortly be used more.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 04ef38f148..eb5d4b052e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -67,6 +67,7 @@
 &rri_esz        rd rn imm esz
 &rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
+&rrx_esz        rd rn rm index esz
 &rpr_esz        rd pg rn esz
 &rpr_s          rd pg rn s
 &rprr_s         rd pg rn rm s
@@ -245,6 +246,14 @@
 @rpri_scatter_store ....... msz:2 ..    imm:5 ... pg:3 rn:5 rd:5 \
                     &rpri_scatter_store
 
+# Two registers and a scalar by index
+@rrx_h          ........ 0. . ..      rm:3 ...... rn:5 rd:5 \
+                &rrx_esz index=%index3_22_19 esz=1
+@rrx_s          ........ 10 . index:2 rm:3 ...... rn:5 rd:5 \
+                &rrx_esz esz=2
+@rrx_d          ........ 11 . index:1 rm:4 ...... rn:5 rd:5 \
+                &rrx_esz esz=3
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -792,10 +801,9 @@ FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
 ### SVE FP Multiply Indexed Group
 
 # SVE floating-point multiply (indexed)
-FMUL_zzx        01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
-                index=%index3_22_19 esz=1
-FMUL_zzx        01100100 101 index:2 rm:3 001000 rn:5 rd:5      esz=2
-FMUL_zzx        01100100 111 index:1 rm:4 001000 rn:5 rd:5      esz=3
+FMUL_zzx        01100100 .. 1 ..... 001000 ..... .....   @rrx_h
+FMUL_zzx        01100100 .. 1 ..... 001000 ..... .....   @rrx_s
+FMUL_zzx        01100100 .. 1 ..... 001000 ..... .....   @rrx_d
 
 ### SVE FP Fast Reduction Group
 
-- 
2.25.1
