Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1283346lfm;
        Wed, 17 Jun 2020 22:07:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+eVk6zXJ+PUZ9O5eog51FlqK4+LK/BWvY1vZHlbL3BHzLsW4LpRI+ZMSx+AT6nlMDKTbM
X-Received: by 2002:a25:cf44:: with SMTP id f65mr3714973ybg.368.1592456825434;
        Wed, 17 Jun 2020 22:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456825; cv=none;
        d=google.com; s=arc-20160816;
        b=j+JZbFJyy7zAoJxzPBeRzDMfJIQ2Bd8N/gfSWq4Vv+2YbvPj6jKygZa4PhXjZNjfLO
         7CXDUfKsgKF3pg8BurecCCmNfg2jPdnBpuPyk93Ytd/itYqEVSsJq8Rvuq9VaHRC0bFg
         v25QjBw36cS66DiOf3CHHGZ5OFgbGglGunCdaqTcNl0oNPuo5JT3YnrlWFMg7CuTB6g5
         CRDCn3YOYlBYq9fTxOtuLfQXXRJcDNcTt+ylKaUOYzNc0PjD4ZHL5lu4rx626bKqnM7V
         sXoRuULyoKeCv4YJ5BG3Py3hAyOgRk+ICma8hDL5NTpv2E/Yjf8Pf++mlilDjc4QIT26
         fO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=goCEuAkdLVUC4u1fLVEAfW8QjjUtS9gz8iEgnW8LE80=;
        b=qT5flF0LHbmmITLjm3/zTOg7bIklLz3UvG+b8R26/Us9wxRDZO5tcAJhVsFWuFNe5W
         iPo4rryMMxlu0f4sr6A+ST9ggZuwWbgLeWOwRsys+/DUQoxzE8SKKlxuVQ6ACyOseAYc
         aXGSKBeqPObNTtF+ha8t0G6jtmd2mdyWMxYJXRqi/xTCj4lTa+Hu/xdUsTgqSHd2Qq4i
         7Cbeam9ysyavUhA0x+mg05/ow3K79RqPcVb8Rb/Xr/q0q+/yS/T8MzAxcfsDpL6ZPIH2
         vG+ejI6S5N01tiJ/FrEO8aRuTbzaum8kAaIu8nMZbq6AxTenmm9X+pGQ0AkM3GeBEvSr
         aTOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bjudeb6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b75si1427917yba.453.2020.06.17.22.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bjudeb6N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmlU-00038f-QF
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEP-0006Dd-P1
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:55 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEK-0003cL-L9
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id i4so2090732pjd.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=goCEuAkdLVUC4u1fLVEAfW8QjjUtS9gz8iEgnW8LE80=;
 b=bjudeb6NlxVEtSJ6/QyQ52hu4M0bfyFGIee/5LvUlTte5TN45JFy5E72/sQsav7wmF
 3iTEdUimTErk/iZjJs7FSGPwV5WxRx/ko6Fl2rA1OreJ87wnhXNtthuFXjkTJ5b7k79D
 eqFHefV4UWmjx8EsnwtfkzQlXrnOIWfv97tb1tbGSVsUvrjew+zzOiQ6bSjuyenUb31+
 ZilruYHxouuGT+qIJ3AHsEwON9lRro2xrFUYW/1Zh08XThOikQE9cPzhS8mJOH6nVVLx
 H/G187hPb3Bv7MKANHtvghM4SsxEVm5xHVT7nCL8bozY2JB+8hR/Q9iwtzi7UOeOk/Fd
 JGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=goCEuAkdLVUC4u1fLVEAfW8QjjUtS9gz8iEgnW8LE80=;
 b=ZYetVM8OYzHI4K6f1+qTQtu9l4FfiBEhqGHu64dLwLRDwHxzl5rqc5b/ZNKNPtJd+y
 JN4MbZ144fpfHlvMQWWKQreUzeM/PlPbHSih+YrmLOjLmBbu4nxKMC/k10wYtQSS28XR
 nhLl4SFxW5W6u3EcI4JnWuhA0OZOTsEiI7dB0Me3Z8p3+/WVP1K2P+pZC0TB7ffD3/h3
 pBJcM0ULv5vExPm6vm8Xt6j0mFiTFBUTMxNz5GBl9byv/G6myYTjLQZwn+U1Q6ar43DZ
 M4ylkw3LCCNg3lrXuMFZrsYfI4Yw12lZpjNGa6ZkSzscuPWB0870c9ytacRwYJBNr5KN
 fPVw==
X-Gm-Message-State: AOAM5310yu8KgkWtnjQCUuZ+lJpgr6935yIqWBaHCXDEfisGBLHJsSnd
 R6zk3HsLFini71eEsk5W0ry/Wu6W9WI=
X-Received: by 2002:a17:90a:20a3:: with SMTP id
 f32mr2373887pjg.171.1592454767389; 
 Wed, 17 Jun 2020 21:32:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d2sm1165766pgp.56.2020.06.17.21.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:32:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 086/100] target/arm: Implement SVE2 crypto unary operations
Date: Wed, 17 Jun 2020 21:26:30 -0700
Message-Id: <20200618042644.1685561-87-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lcs/zKHQxP0z

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0be8a020f6..9b0d0f3a5d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1551,3 +1551,9 @@ STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
 # SVE2 32-bit scatter non-temporal store (vector plus scalar)
 STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
                 @rprr_scatter_store xs=0 esz=2 scale=0
+
+### SVE2 Crypto Extensions
+
+# SVE2 crypto unary operations
+# AESMC and AESIMC
+AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 152b0b605d..bc65b3e367 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7682,3 +7682,14 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
     }
     return true;
 }
+
+static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
+{
+    if (!dc_isar_feature(aa64_sve2_aes, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zz(s, gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt);
+    }
+    return true;
+}
-- 
2.25.1

