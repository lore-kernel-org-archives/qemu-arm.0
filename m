Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp737341lfr;
        Fri, 16 Apr 2021 14:22:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrDGNVM2a9e/lfioWUKfov3Rt3/HSoGwBKk6y22Fgt/duZh29yaUZJy6zuB+wd9VUc/KFl
X-Received: by 2002:a05:6e02:12b4:: with SMTP id f20mr9296900ilr.212.1618608149757;
        Fri, 16 Apr 2021 14:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618608149; cv=none;
        d=google.com; s=arc-20160816;
        b=iMb/JpcTvZxkFN4+Kdc96RRgWkMcsnPVDqXrIFVRD3GzYQt8Vbzw7x/BOPKBMUDRrH
         gloQYvPSVV2mnjl5SBrUfWrvJMolp5Z1eEoBVaIo+vND9sq7Bpg6TZ89ce/KXt7Kaq4A
         FSB9nMKcPbwhQMIdREqyeZU9mLD+tmWBY23P/NNnCU2RN7lD47r56Ku1izy9QMtaCbNI
         qP0QMUUsKZ+evU2LB81SZ+L5z+oY78Kdnlm6E6U2RYiyVqWboa2TlgW/qR1jqGUs/2Rx
         OOiSeLYnoW239rx1nxH/yevZI5Lvq3Pd8Sl+J8D3FE+Z19R6tNYLwULBot+JtulelD2D
         nUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QaR3WAAAd20RRoi+x5aKUmW3qXGunVbXS8iCJuTuVr8=;
        b=u0DwtiZ9drgha2EeRDDLwnxvgos62LkTAm1LBj5E8LRHzPn7x8KyZkKRAY+0wYYY0e
         yUnk9TpZ1Hr/Voml0JHjJhNjC0IwtCd5Goin4zjktkP5dLzO22LDMadVHFehuRuaSrFN
         +dZ2fHoaB/RQrvNisS5SHnD5Ire/U/fwD1VpkDyZOSZDak7HYzQXUvufk3joOXRKYO/+
         U13lsd8n7eUtp8fAqJoaEQ5aen0D5vMjBKPeJoTuFO3DG1YHPvA2U53M2g9lYPgegfzH
         s6nhg4RHb1lfjSeDWH7VC9y8+jos1lD5R9hm+rGMhk81GP4XD0EBRxishVp4b/leW/mD
         7pCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="blfEhj+/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si6298435jaq.92.2021.04.16.14.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="blfEhj+/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVv3-0004gw-2n
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcO-0004T8-Tm
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:12 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcI-0001CJ-Im
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:12 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d8so14625287plh.11
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QaR3WAAAd20RRoi+x5aKUmW3qXGunVbXS8iCJuTuVr8=;
 b=blfEhj+/e9n82/0dey7ShIuhnTV+UC50wKoAi0lNs7RYAMDxofQ+WacQJD/iJ8LtM3
 s6EyXwuzeNRl7WIrgA9FYDXhX1iO9PaPFFh8OtSLTQXgic74vUtcn9qyMJknYAWpWMCm
 ojNIdiSrvecwHXxSq+4U338FcIVFIr4R9M51zDlYm3B00QXSxHlwQMdjp5KuU8BZ2h9Y
 8wZXkYqQspQvvwUoYwzxHCFHBa0KQr6yLB147O67wn+gC/XoLzo1DzW2Vod6UQLGYTr9
 05xQcjA3UGY0fX0sVVRUtytUpermy4DoFK7irTw9btuJBHrc5n8jfUWfd1bnz8fgpZVl
 Pe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QaR3WAAAd20RRoi+x5aKUmW3qXGunVbXS8iCJuTuVr8=;
 b=lIXdZ0+zo7Gi4Fyqr2n1OZzKjNHFW8T480jaV9aaxmBG9YUEe8vFeubFAVa52M3jJ8
 aO2NjTUWKlxhEkIuL7DG5NdJvXVD6sbWv0Ly0LkD7bHeqJgCuMuN8Rhb7tMA7ZQFWu3E
 sMQxh5EmdWd4c5Khhz9y2cRWJ34ZOUR2VyvQbGHu44lYCHHXr/8A+5y+soQQ6bcHDLMi
 5AhmjvuY5GMNexcvq/MQvkaBTkdt2so3xoOzXp345ZHDmPwCDOlpoL3WpLIX5IIGnD0m
 V7me2VIwGJXqfPeOxZFl5Ak7D3wFx4t8KFPyiU18rviwUOrgK7IIVoOSbQ+BoeDMrfY/
 PakQ==
X-Gm-Message-State: AOAM5315MDItdisBthrbN3pLWy4jIw1aLxcYkHQDpxPgqKdx+0fsnqin
 Sj+ddiqZmmyQIIQobdBxChmYwvdem2B6Nw==
X-Received: by 2002:a17:902:8d83:b029:e6:508a:7b8d with SMTP id
 v3-20020a1709028d83b02900e6508a7b8dmr11623499plo.18.1618606985315; 
 Fri, 16 Apr 2021 14:03:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/81] target/arm: Implement SVE2 integer absolute
 difference and accumulate
Date: Fri, 16 Apr 2021 14:01:42 -0700
Message-Id: <20210416210240.1591291-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tZgHLWHgnxfN

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
index d74a15d8b8..ba1953118b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6438,3 +6438,24 @@ static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
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

