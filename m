Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955111lfg;
        Tue, 9 Mar 2021 08:21:07 -0800 (PST)
X-Received: by 2002:a4a:420d:: with SMTP id h13mr22873123ooj.24.1615306867150;
        Tue, 09 Mar 2021 08:21:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306867; cv=none;
        d=google.com; s=arc-20160816;
        b=GAqdTlRtJ1pccLNPHCgqJxXnUw5zyzNNDcRr8/N7aZ88AvtbE+oxuFUsilWMvJLqO9
         0O9qvdlZE+1in/4H95B5v1K/xiRottMws2G7Q6H0qkpP2i1XHc8iEy8mfYunp0up76kY
         3i3GbRm0BzxUHAzZMGxZwUnEUiMx6GYtJ/VkZ7g7GYrZxSYS+3oc89NouCL6BRLQOkSB
         1EkwsFIBlD2NXreCM5iM2gz3toHhDIbat9K325PaCHb/jPaxy6kh7fZAf8voSktjsv6S
         w/1JOUDFLmmfARUAyhcQ0blB1hldTpDK+JkdPedvwpm6DYxxzuD3WTiAYAklAgmHTVl6
         N5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aFif56JV+fTnJ9XuXaPYxfPPOlJI5WKkI90jCx4L/Os=;
        b=DaEwmm6WUDfKfR04SwE7Iiu/mNnH4VTDROo4Ei1+7rMPgFFv2wao07b67UMGEIxupg
         u6hukhzocvMa/NRdPvYi0Woo09NRWqlQo+vCPG7FqB2coOfOzVnyFTKCGEOO5QLZI+bD
         Pq6myQ06yTDG3Yb4qFkUodlcgeFRL389F9y0LalqsX1OS4Z2vpLVmhRDv4eCsWbuY9cQ
         GGOZutiLVkp0J3p0SndyM3ZI1pFhFwFd1NyZeL4YvolAd04a6vGtvt3J/YNRBN6lc8rH
         2iFqWs/i/IApfqy6qbSUWsETUjkjb9OQxXoGrUjchNBbLkMAcL2xWtcqxZtaUmpFVhQs
         AFHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npnOlkSC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x138sor1416473oia.102.2021.03.09.08.21.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:07 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npnOlkSC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aFif56JV+fTnJ9XuXaPYxfPPOlJI5WKkI90jCx4L/Os=;
        b=npnOlkSC9RW5z868zDrdc4wPYr69gdikOhINi9glBWFpsBhMhihFDvJ7uwhiPI0coK
         y89uzWd+LobqKxlzdQuEpMIVV/L0Vtkf/CvhiGAGq84E2jmtXRNRJnxhxkLRrwmQX+3y
         zgCdoQJNSDEHq+zUBEyYlc2dk1oYmLf0npmYBXh+idCl5AO9ZyA+7au76HCkdCjxRDBQ
         bfg7W5NmWfCmlfAOpF06e0Mu9XXIch+Fgq2L3wdvvalrf4A8bGsRc9xLa4RoGhK7U0pp
         3CxM7pWQ06vesdrS8o6KWd8xnOZxyiQwzu5fe3OTSdW0ztKe8KsjiJn/+v7SmSulBIM/
         RXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aFif56JV+fTnJ9XuXaPYxfPPOlJI5WKkI90jCx4L/Os=;
        b=pVr4QEwum61lGVVOjjaLEePuA5pEt+5smDWy7+vPjoCcrGeRw19O8YKjwL3hjomM8T
         KrStYo84iqym3EloTWB/mzMI5BlgGt21RZ91yLFmeTdwQrvPRJ1s8sENPLS0/IFaViXK
         5wv4wI5sn+kWqwUrZvXZUwz4NyzFUboZ2jEph/9RLDQ2kuIlip0qfXscJnwgIHYo+1XY
         SNqrnY+M+0kjXzYfWSVf+dKbnVU19oPe0hAlln1dtV8tcGyAXSK/dQg59pwwcGyxkcVS
         4X51oEWjd15rZ8rKhTaVSlunjGLG/bV9t4iuK6jgU3jAJLx6U6JJazfOiZvaml/WPV2E
         oWDg==
X-Gm-Message-State: AOAM531bvmEplydNO8X/X5wzssaads3pbmJ4Rk3Pvwh11mRVPXFmj8ms
	R9EQHcKR6U0XMrAC14gqUeNT1tef
X-Google-Smtp-Source: ABdhPJxxZR5IIsHbYg6UKMzswDKKh9YaTY9wOuMFZN26tb8wS2a1U7kzf+X3DSXLHxFtFhraX3w7LA==
X-Received: by 2002:aca:acc2:: with SMTP id v185mr3383689oie.28.1615306866788;
        Tue, 09 Mar 2021 08:21:06 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 21/78] target/arm: Implement SVE2 bitwise shift right and accumulate
Date: Tue,  9 Mar 2021 08:19:44 -0800
Message-Id: <20210309162041.23124-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lv1es5KGKqNs

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 79046d81e3..d3c4ec6dd1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1253,3 +1253,11 @@ UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
 # ADC and SBC decoded via size in helper dispatch.
 ADCLB           01000101 .. 0 ..... 11010 0 ..... .....  @rda_rn_rm
 ADCLT           01000101 .. 0 ..... 11010 1 ..... .....  @rda_rn_rm
+
+## SVE2 bitwise shift right and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
+USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
+SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
+URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 92420d3ec7..bd4d6f1a69 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6395,3 +6395,37 @@ static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_adcl(s, a, true);
 }
+
+static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
+{
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        unsigned rd_ofs = vec_full_reg_offset(s, a->rd);
+        unsigned rn_ofs = vec_full_reg_offset(s, a->rn);
+        fn(a->esz, rd_ofs, rn_ofs, a->imm, vsz, vsz);
+    }
+    return true;
+}
+
+static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_ssra);
+}
+
+static bool trans_USRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_usra);
+}
+
+static bool trans_SRSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_srsra);
+}
+
+static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_ursra);
+}
-- 
2.25.1
