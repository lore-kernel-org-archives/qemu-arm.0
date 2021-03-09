Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955887lfg;
        Tue, 9 Mar 2021 08:22:06 -0800 (PST)
X-Received: by 2002:aca:3606:: with SMTP id d6mr3431040oia.103.1615306925828;
        Tue, 09 Mar 2021 08:22:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306925; cv=none;
        d=google.com; s=arc-20160816;
        b=a1yz74/4WQ0zh1hSGvVJIIlPI3WKyYK5xJQa3qpFH087rfosi8hbxL57VlHZjOCaa9
         7EwCNfhUJn9nSnMOKJZk/y25hYJeBHKf+CfqmVd6o9f3RqCmFxjtJJzLHv0LLC+qaaaY
         rkeiyOjAUNLUVff/vOyjRwhyYnA2zMCGcRO37Wiroi7Z7hI5YFDFjQuGNaFDV5PzYx15
         FyfX+oCDd/qZIACQbOjWVChPt4cQHh/1NSQ/oowmya3dHAeouOAET/Db+Uxv3yQADrn1
         5s5bghZBPbi5oUFlvAN5llsPLqAUA+BBt4GsN5x6TxBN8QhuJ5DDSgKixcwiDkAzgkfL
         LA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bFsXvn8twBtNJsU+A9bHI+28KQAx75XSf3FzGr0LfTA=;
        b=xgokKyPUqaJXJhzzqaP1cvbjjdaKwY1soMkZ4sR0hREeXDWoGf86mnD+Ww7Q8mQ32T
         i7iBC0O26tsmJEslWBXnpb1/r38brEE83lRONlkCYn96AxlsNbXpzaTiZDUaaFaUVSPZ
         ye5NdV6dFVlDDwiN4/84ClXf/nmV8DmBI4M5VXYJ1LcGDtFGop08NQ3X1i4I0+goiQwN
         RCu9JXWj32W1Ba4WsAtGLZ83peRbxmu3HEUsvxvPYmhmPTti2jKSn1EzXyESQTG7EyLY
         LO93JkzEhrvgDg4X/B43g8YTIFV7iWJeku9Rp8TSDFlENFl5xG9ptS+62fnzeYKIRQKG
         bigg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q0fu5sSo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d16sor7019700ook.9.2021.03.09.08.22.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:05 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q0fu5sSo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bFsXvn8twBtNJsU+A9bHI+28KQAx75XSf3FzGr0LfTA=;
        b=q0fu5sSoZ7yFFwRNiK535wkOmqDR8Mm3uSK5rzUFfY3DTblLR3s1rdAEvKm7FMmCz5
         Q3qgB+VjI1PLSCRsjpFuXcldMrKfo7Arvn086/zoNRQZb8066wF45pbk39AUS1NdudOg
         F8wND/7en4V0R62H43M3qafTpxkpYX/AvGWTPJLpGVbApaNdv8eIQKK4OgLknLuUjI3g
         J61P2wMlYOnA0aj8PQtJyBIP0lwjaNjrSxQkn1mtyXzR0kb0UAjYqC3fKP0oDmyLipx5
         QSq/2y7LzaybBmTLPusjytWgpVWt4AwGrfIQpJLI6p8B34UFVsDJ7CQJPZuzDcGJZ8xj
         Ayew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bFsXvn8twBtNJsU+A9bHI+28KQAx75XSf3FzGr0LfTA=;
        b=fSnmVfRcAjNvL4Y5ShdTa+VC/6zte/AbN4kGXkYzsblL6ju/VN7j2xIhX+iZwtp70s
         69qfRd9ZkMlbAufvdQazgaU+qp1vp/Zx6ynMyo+jk5agBjF33Nv7N9/c8OejyYfU9zF0
         5hdnXn0mvUEr1Vjgwc1qYb4IeB/aB/tLWyr4OovQ8bIkYFwqAyaJDF02XHtzi+nW1PhP
         ddxNXfxmh3hSUFHiP5H2Z41fc58CvV+SConZjfkG0NbqWRMAtvk+DewKE3KlIiAyD069
         xkFIPO/MJqgKrwQKJSZFxHu/hpaOH8IbeMtUKJ1SYKvYQBGPmUXzwO96eyyxOEL0onj9
         EkpA==
X-Gm-Message-State: AOAM532XbX4xbBzB+uRELgqugWCx+uNREv2g7gYGx8LK95r9TWO1gNC/
	NH0Rh4Ji/ZR/bfEKjZXUyyB89jv2
X-Google-Smtp-Source: ABdhPJxenISAWEy2VG1IwPQw1MiFKHbDxJRtBqL14OJoayCzwIdpm+khyyH2O+APNm4JsptC4mpaEg==
X-Received: by 2002:a4a:d1da:: with SMTP id a26mr22970496oos.58.1615306925485;
        Tue, 09 Mar 2021 08:22:05 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 45/78] target/arm: Implement SVE2 gather load insns
Date: Tue,  9 Mar 2021 08:20:08 -0800
Message-Id: <20210309162041.23124-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: W/kj7EtNoe+/

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit gather non-temporal
load insns.

64-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1SW
* LDNT1W (vector plus scalar)
* LDNT1D (vector plus scalar)

32-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422152343.12493-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 11 +++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5cfe6df0d2..c3958bed6a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1389,6 +1389,17 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+### SVE2 Memory Gather Load Group
+
+# SVE2 64-bit gather non-temporal load
+#   (scalar plus unpacked 32-bit unscaled offsets)
+LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
+
+# SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
+LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=2 scale=0 ff=0
+
 ### SVE2 Memory Store Group
 
 # SVE2 64-bit scatter non-temporal store (vector plus scalar)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 895522e3cf..21ecb535ca 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6016,6 +6016,14 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     return true;
 }
 
+static bool trans_LDNT1_zprz(DisasContext *s, arg_LD1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_LD1_zprz(s, a);
+}
+
 /* Indexed by [mte][be][xs][msz].  */
 static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][2][2][3] = {
     { /* MTE Inactive */
-- 
2.25.1
