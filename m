Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1258290dyc;
        Fri, 4 Jul 2025 07:35:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvHkMg42KDG9y7EpT6ht26SjsE3WD9eEsOY6Ww8lO9ZTWWmIQPA3S0Eybk/sZHKaMbZoM0L+pj8DdT5g==@linaro.org
X-Google-Smtp-Source: AGHT+IEoHdyqE8fCEsIL0eO9RJ9jtGvEw6sudvhDqRsKDttfzRfT6MfXmicZQQ3YrkqVkG9pWUCH
X-Received: by 2002:ad4:5cc2:0:b0:6fa:fb4f:b582 with SMTP id 6a1803df08f44-702c8b723c3mr27631756d6.6.1751639758605;
        Fri, 04 Jul 2025 07:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639758; cv=none;
        d=google.com; s=arc-20240605;
        b=PVJlar+Z2vHl5IlwJ37Q/ECS/+/sM40ysiFpFeWy2KdIIuN/AU/uLZgU/P9PrW9atQ
         SGModtMI8wWoTx3aCvS+A+8xGLR+aRCqubWDL5flmgVKtk+x5KJBSiFQbC953Sc40vMy
         rKvUea1B0mA61ABGuDVFmdl0+XrQfUJwkKBCyz3hugPyDvdhKNJh12ULDeFLO9u5nlmr
         vqwZ/1npj3QdDbFnHGkmOjUsBEZvYMlqNdbsHXICWjWBZ3/5OiR70Rd4qjwQBQSRCgHZ
         9BAXeBAj0rXTUAecahX0IZhpmudebJzZPQ5efZCvTwUmVFE3JOYt5imyswzsa7IMqBOr
         SUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+O7jmLrwj7uYx9707P2+AK6L9PFAUcM9kTC7/PievL8=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=IgxNJn6EFD7rOw1CcTY4bFqvShdnovblwLc7Cwqw88ZxlzZ6WcuhWjZnNbz+KeXwgE
         SxfShKmYbr/6J7q7GoOA9M8VukBpZB/yTo8f2ujkglli3LUx9UMwApUVxZIYZIE96gOQ
         0OoLaReANaA9ijQK4xIbk2S9BKexstND72AlhdgjVo4l3iD8jTZtJ0/XoS88UXM5PhqT
         In1BB50F0/fbjq6hia3G9E2tMIP/UbM2uksJ1y30TnPyVbDSuOAwvklwOdTlHEMgseao
         7bu1Y+MQa3XQ2fUmspJccJiaW57YfNwm7GrKlInLRmTjc46/c0ro53g59gCammpOjUa9
         lr1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ecRas4AX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4ccc477si21385226d6.13.2025.07.04.07.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ecRas4AX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhUP-0003cE-C1; Fri, 04 Jul 2025 10:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPI-0002Xw-9F
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:52 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPF-0001Tu-QD
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:51 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-2ef891cd058so857906fac.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639328; x=1752244128; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+O7jmLrwj7uYx9707P2+AK6L9PFAUcM9kTC7/PievL8=;
 b=ecRas4AXToF2trg6iHA3OKedkKhUr2aQqt2MgebjTltM0mIIjDeQ478e/aXwpL4Jti
 6MCMoNozg9llNkIAPVeP5vhtTNW6+FQw3bzc1eQ84VEL7fSHWQX2YYptWxc39TqXu5KV
 4J558eSXKzes2jQKQMXSqQVUX9eg/ATOIzZwh9aYNhQYAYmiPRrzK4GExj0kA2N0g2Jg
 P1e8gPnWuqHRe94pGoEMayu1mEeTvL9ZRHFYV1XaA+DFTA5Css65sZRdIUdWlVoT4gsS
 hJu1PzDj2NpEVtCpni9chd+0OqcTmsEOTps7Lod6ImI1EaYZIECvWiKVmdM/3WbapuVJ
 Qfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639328; x=1752244128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+O7jmLrwj7uYx9707P2+AK6L9PFAUcM9kTC7/PievL8=;
 b=nQk3Dj9sgbmxY4VdghBaKC9mLkVsCap/s7oNqH9ppS3PoTRy3brPSni2xaGUxg7aU8
 bfVQbD2sUUtzSRrkAgZL3WGEttZrPqdY6PUgvUJWSJyn5mtv776iELRmvjzbDhKnsIMk
 27afIEk+TOeB9BTvveNZ3cnJpnCjqfE0NYEsXynFR3aPIBG8j3namLfR/p+YrXN+tDup
 hRO2xoJr0sJGLZ70xy7+OLRUX5oT+qJBp0M19jkfu4ftAPzAzhi9pKy/UgH7Dx5u91ws
 wnOtS6yj5QzShaUn1lfn5wCADICe2UHOpKXebD3cuboroCdcessOBZHJ/OisGacybASa
 bbOw==
X-Gm-Message-State: AOJu0YyhDKEap0ufHxaGil+SyTQtQfmKFDwzjGetl34FnwGcrQ7xvx1A
 pgImU1epwdjewQMOkKkDJCLFQUDw1feY5HNd4YOZt1/Z5WcvprqnLCVrS84R8ktLJ6fOJX+VAlZ
 uPNl+2zs=
X-Gm-Gg: ASbGnct+rZHRKPXmlFrjafmYIhyYTnF4KSv4X3k0lDqztcF7kOf9KQICSUYYxhDLY2q
 Oz8rElFFGfzNpXjCahl2OyQkSFsTcz4hWGkxVHnwfbInIRZ4FtFrKOtgnGU2U+ENsu85oJ68NYy
 1R2kDOXJVJnSpplUdq368uSVf0DbAlTZsWv6MsfrPuQUfyKtGjAFUlRZhLroca3BZG3fWebaPbR
 IhOn5kbo4fLDbRAxqzJMn6aQzOc6aurLev53Wd4StBNt8/Ul0sjP0rleQ3hZ2sBgKQUT9hLqaac
 zpX+qBxnHK6TBJYftyNgivIryQrdo/bOBuhPZstlWC5W1oEYyTA+XihXn3n5FBpJf2kHjtrOW6K
 KW0dO7a1paHW/x/zIHLAY0Mp47rqIWOIvIleNfIjqkMDK0Qwo
X-Received: by 2002:a05:6870:e80b:b0:2cf:bc73:7bbb with SMTP id
 586e51a60fabf-2f796cd0dd0mr1763771fac.25.1751639327945; 
 Fri, 04 Jul 2025 07:28:47 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:28:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 089/108] target/arm: Implement EXTQ for SME2p1/SVE2p1
Date: Fri,  4 Jul 2025 08:20:52 -0600
Message-ID: <20250704142112.1018902-90-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F3lHsCdMwH28

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 49 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index e33b2eb2a4..a918da31fe 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -2202,6 +2202,55 @@ static bool do_EXT(DisasContext *s, int rd, int rn, int rm, int imm)
 TRANS_FEAT(EXT, aa64_sve, do_EXT, a->rd, a->rn, a->rm, a->imm)
 TRANS_FEAT(EXT_sve2, aa64_sve2, do_EXT, a->rd, a->rn, (a->rn + 1) % 32, a->imm)
 
+static bool trans_EXTQ(DisasContext *s, arg_EXTQ *a)
+{
+    unsigned vl, dofs, sofs0, sofs1, sofs2, imm;
+
+    if (!dc_isar_feature(aa64_sme2p1_or_sve2p1, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    imm = a->imm;
+    if (imm == 0) {
+        /* So far we never optimize Zdn with MOVPRFX, so zd = zn is a nop. */
+        return true;
+    }
+
+    vl = vec_full_reg_size(s);
+    dofs = vec_full_reg_offset(s, a->rd);
+    sofs2 = vec_full_reg_offset(s, a->rn);
+
+    if (imm & 8) {
+        sofs0 = dofs + 8;
+        sofs1 = sofs2;
+        sofs2 += 8;
+    } else {
+        sofs0 = dofs;
+        sofs1 = dofs + 8;
+    }
+    imm = (imm & 7) << 3;
+
+    for (unsigned i = 0; i < vl; i += 16) {
+        TCGv_i64 s0 = tcg_temp_new_i64();
+        TCGv_i64 s1 = tcg_temp_new_i64();
+        TCGv_i64 s2 = tcg_temp_new_i64();
+
+        tcg_gen_ld_i64(s0, tcg_env, sofs0 + i);
+        tcg_gen_ld_i64(s1, tcg_env, sofs1 + i);
+        tcg_gen_ld_i64(s2, tcg_env, sofs2 + i);
+
+        tcg_gen_extract2_i64(s0, s0, s1, imm);
+        tcg_gen_extract2_i64(s1, s1, s2, imm);
+
+        tcg_gen_st_i64(s0, tcg_env, dofs + i);
+        tcg_gen_st_i64(s1, tcg_env, dofs + i + 8);
+    }
+    return true;
+}
+
 /*
  *** SVE Permute - Unpredicated Group
  */
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 2650e00f80..af4fb966bf 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -583,6 +583,8 @@ DUPQ            00000101 001 imm:3   10 001001 rn:5 rd:5        &rri_esz esz=1
 DUPQ            00000101 001 imm:2  100 001001 rn:5 rd:5        &rri_esz esz=2
 DUPQ            00000101 001 imm:1 1000 001001 rn:5 rd:5        &rri_esz esz=3
 
+EXTQ            00000101 0110 imm:4 001001 rn:5 rd:5            &rri
+
 # SVE insert SIMD&FP scalar register
 INSR_f          00000101 .. 1 10100 001110 ..... .....          @rdn_rm
 
-- 
2.43.0

