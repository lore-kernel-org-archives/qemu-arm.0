Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp748167lfr;
        Fri, 16 Apr 2021 14:43:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAIJ9xMZklXhmh27lM2UTtiBHbPfdpqwmOmdfaM/khad+lPX9ZAA87wbfUutZYsflaVp/2
X-Received: by 2002:a25:ab71:: with SMTP id u104mr1643271ybi.7.1618609384654;
        Fri, 16 Apr 2021 14:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609384; cv=none;
        d=google.com; s=arc-20160816;
        b=g/XWyZMqlquP4lo06v+PRQl5EtPt/EC0tiAuuqja8UorC10KuEnw2Yb1XBZ7xKol6y
         oupMRflWZHSPfP2uEHPcYaM5qAgIDgMZfPRIqlcNo2KYewYj37FVd14bPigpPh6cQ1XW
         XsJl4241k56DLS7pV1KtkbcKhgOUYgrOwk81Dgk2Qdz66iMOqFdLxArDO8bD98NjW0Mo
         QoU4AEtbhaqMdoYd2XBGiOgfC+TvC4caW1cnmIzrCj4gKJ7+Nu6pHoccy1dM7+WOGHCl
         PBnjKh1BOsdGKLPPvwmwPW3syQdTeNAVUASGDZ6GNx3HOm/kPNr4aDjjKL1XZjOjKa6h
         yMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wwTGY29rJKdn3GggDiDCMT7mmPQzpwnC/ENztXM6VVY=;
        b=Ty4hRwAcxrVqhKiYuPaUZDnea701GwsmiznN1EPXM8EO9MpITt8A/X4YNfHmj7kVYV
         ToPHwIF5nG6QMMpmtR9wfXxU5Vln2izCRxogfMvYVggjDVpYkcyC7d/VBlUgaRDkXIpC
         k/WxZcDV16Y2gv3FC6qNyrhsOksI6wL/pzlPJDRAhflJ1KBdmzqHYdt6/HdTf02RzOMO
         W9BEF8tOamm5yJJDbwgfhvcr5z+/UxYZr/8Yt/PQtOBrSjKKlE76cqZwbe0BzS1J9qRY
         0Tov7rLwh16WhrrzBUoZ92zIoM1B/K3OoyIHwwksp/ek2sg7ryNbrHjdo8b64emGWGFf
         oZTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TZ924Yxc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si7411350ybp.459.2021.04.16.14.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TZ924Yxc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWEx-000549-UA
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdk-0006Jc-1I
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001iA-H5
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so6951246pjb.1
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwTGY29rJKdn3GggDiDCMT7mmPQzpwnC/ENztXM6VVY=;
 b=TZ924Yxc6dBCBVE/IrscPqnkeZuEYP7Q0zKoelhyezGh88pGfG65rVsuphPakjKkuu
 5QREu5N/1rXCynafPB0lLpxf2+06usO9DgzbWablmoOWd5PnhMba5cP6re9d9ne/L9/y
 +TBa/WSnF4FGEVy68zJDoASGcZqmb/wMPVQpkjpgqkHNaOSzeQUoTtuiYKEkdj/PJreE
 q/zTxhEeWCapmurz+p8csvnpUdfqH97G4WUAFQIX7gX84j6HxBr8yxa4xYlrLPt4fILb
 gfd6Ut6q2YEMAWWaVKR1oCJOy09fZHN8VIxWGb/GtD38O8r6fnzhjXaNO6QuVp/Y96fa
 myGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwTGY29rJKdn3GggDiDCMT7mmPQzpwnC/ENztXM6VVY=;
 b=ZsQIk1+YxBkGipZcog+kRo9jSReOezi/QSgmWuGQALSGpZf0TVxht+oYQ8qll3BIrR
 KvTjj9GyeZOpe7BPzH+UnloGgyOSNy1lEW3qIAnfb+CRNVEMlDCS8H3KQn1nGg2pFP0b
 JMNLu/uzryb+qbP1+bUAhod1HtTTUUn45BPY2RW/L1UIcLI3iiX/JtZMC9/X0IAZ9uv3
 ovDlhtkUmxAxJPB+bsk3DLpzPO2tVJShbBELTN1xVnn/ef3t3bexoxj7N5MAbF+Ow7Jl
 G9BE5o9E2vts2ji2I1gtcQ60HuyQEih5Q8cBvB8jejv/l6Hl6/2EdgnNuGZ06OQD3GZm
 9OcA==
X-Gm-Message-State: AOAM531beLDIwsVm2ECQ5NR1sByrAkbJDkCTpTzJxk7/eW2wjEO9AxNa
 pIOyIQ8LuGNHdDly9Ua9bxktEw==
X-Received: by 2002:a17:90a:b10a:: with SMTP id
 z10mr11554023pjq.161.1618607044519; 
 Fri, 16 Apr 2021 14:04:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 53/81] target/arm: Implement SVE2 integer multiply-add
 (indexed)
Date: Fri, 16 Apr 2021 14:02:12 -0700
Message-Id: <20210416210240.1591291-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O+f5Dvh3jqTo

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 65cb0a2206..9bfaf737b7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -783,6 +783,14 @@ SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
 UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
 UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
+# SVE2 integer multiply-add (indexed)
+MLA_zzxz_h      01000100 0. 1 ..... 000010 ..... .....   @rrxr_3 esz=1
+MLA_zzxz_s      01000100 10 1 ..... 000010 ..... .....   @rrxr_2 esz=2
+MLA_zzxz_d      01000100 11 1 ..... 000010 ..... .....   @rrxr_1 esz=3
+MLS_zzxz_h      01000100 0. 1 ..... 000011 ..... .....   @rrxr_3 esz=1
+MLS_zzxz_s      01000100 10 1 ..... 000011 ..... .....   @rrxr_2 esz=2
+MLS_zzxz_d      01000100 11 1 ..... 000011 ..... .....   @rrxr_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0de8445fb4..25dadabe28 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,29 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+static bool do_sve2_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
+                             gen_helper_gvec_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zzxz_ool(s, a, fn);
+}
+
+#define DO_SVE2_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzxz_ool(s, a, FUNC); }
+
+DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+
+DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+
+#undef DO_SVE2_RRXR
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1

