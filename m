Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955146lfg;
        Tue, 9 Mar 2021 08:21:09 -0800 (PST)
X-Received: by 2002:a9d:200e:: with SMTP id n14mr24709662ota.130.1615306869248;
        Tue, 09 Mar 2021 08:21:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306869; cv=none;
        d=google.com; s=arc-20160816;
        b=AxdAS8DPoKbf6fZyUTq6OQbhjEJwH64IRNOOgGvn46qsXh+Z0Nedx3byGYxqSh/wAT
         wAyT423ktDWMCx7LkGhj0ecYwuYW8eDMF4y24RTe1WTZsDRd7hUprXUq0dyPSG8Gjzuo
         ivMK74/k/EEhijnshsLPN5jD/Awuk+URRGZ4GxtV02CwfJVUa3cclsQ/mX5+L8cFKepn
         VbAduKIgDsIvLWljDJxNOmeMxkHzpcMprhfrG6zGXJ8JRRHiiolhGkoSw30DGIdXL/zz
         y9PBD0/DoKXK+U/OlUxPtAiILqMu1bl4V1f1YcKYbWyIAiTwyw7nwEUN6Ukou1FAlzAJ
         L1Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PNu/k9q7y7xSUi1QwShDN3GcUxd7gykmxrek3+gYYGs=;
        b=W+TH/riNu72kAncSlvR1IzpUpU/pjytZXdjq1Oyzd9SZwpLjmrN0pNBPT6MP+faOWx
         osG/kZGB9m3TKYKa9iPWDoMtLe0YrysAl1/R3SFIknxlFGswuRvKM17iHPwP5AZKP4t6
         VAqz1W4xNQ4n8uIL092mJLbwFCp5wl7Wv8DpP9kJXY3K67lJE3Izt1KUEWHWyHJzRGVh
         pD8Nqj7ysHkkzE19t4pT3gr/eSIu1/m7wb+s/vvROPQ77XqmYBPnEoowz5lgYfi6pYl/
         fu1iSRR3bDiyhbmmdXskdhG6NOgxay417X00G/ngtPy31D/0PhxSjo+6suswR4/rtnBt
         KE0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M12jkkYq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q64sor2316458ooa.20.2021.03.09.08.21.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M12jkkYq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PNu/k9q7y7xSUi1QwShDN3GcUxd7gykmxrek3+gYYGs=;
        b=M12jkkYqw9CF3LWYBlAFIk3eJ/3n8aSy1g7SZFhkOCwDMXyDgf6f/yt87+guBlqB4g
         fhI0xc+hLV7hAw7jN0W+m1etKTSI1EGrh6d8o7NE5GcxHGJ0Bg9hp0zFxfR+D/TaDRZY
         mclH4ioIVhORR+xQ9CVxh0oQJ/6nVNfpENH2dmnwFlHJL1ScsqSagdPXoq1gn5alYuWl
         wDfJNeYH+0q21s2GZyw+GfJ3zvO8UXtxjeaFqyyv7ugcVOl4sFnOmnh+Daj1SHgMD4K1
         hj2SPaL8ZLI9b9joJWGEep6c34SZZKsAvUDe1Xtlb7+gMMbToDuWbqdJQ+hQvVnmySGS
         WrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PNu/k9q7y7xSUi1QwShDN3GcUxd7gykmxrek3+gYYGs=;
        b=IUnYW/J3zErDOqg4720Pj4UA9d+q7dpyauBgvhDxPJwqtuVb6gna9N7Dax2IG2z1lr
         xVYeDJfRBzplJLitj+/AD5iik5zyeAd/JEi1KIL2mUt6NAnaAyoeTp9TAdlIRN2Iec9I
         X2w15CimyGLYWNajzUN6cWIfVLfbgXNBWDWBtg8JLQPizhDCnOnCfa0fUBWDn3sqDkkA
         oQ+7nMfZJk+IHX1m2MJxRnTOAPFUgJ81/o4HgY/H+EwyLBeDL9JgaKgkCMz0abDeFxLc
         KfktT8MMIZGEWrCB0OwDTGttgX/jqt7AHSPcShS+ksM9UH5JrdJg6WEmjcptihS19+Y1
         rZSA==
X-Gm-Message-State: AOAM531ABadZvHsCQZx34uZw4va2VWh9S65/+/C8yy905bPC/tYEc+bx
	tggAaLsZz6alzwUMyxZ2LbK40yms
X-Google-Smtp-Source: ABdhPJxD+vv3cSzy9dNul4yTwAYCYPlnmcwJwPmPUZ3FzkIGvcQSUoqMQAZUjJ4Lbef5FlLhT6KChQ==
X-Received: by 2002:a4a:96b3:: with SMTP id s48mr22923006ooi.11.1615306868833;
        Tue, 09 Mar 2021 08:21:08 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 23/78] target/arm: Implement SVE2 integer absolute difference and accumulate
Date: Tue,  9 Mar 2021 08:19:46 -0800
Message-Id: <20210309162041.23124-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HiFlWRoegexF

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 21 +++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 695a16551e..32b15e4192 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1266,3 +1266,9 @@ URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
 
 SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
 SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 integer absolute difference and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SABA            01000101 .. 0 ..... 11111 0 ..... .....  @rd_rn_rm
+UABA            01000101 .. 0 ..... 11111 1 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d41fbd9697..d27fab2b80 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6439,3 +6439,24 @@ static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_sli);
 }
+
+static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
+
+static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn_zzz(s, a, gen_gvec_saba);
+}
+
+static bool trans_UABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn_zzz(s, a, gen_gvec_uaba);
+}
-- 
2.25.1
