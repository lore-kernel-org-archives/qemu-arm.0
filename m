Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp474481lfg;
        Fri, 30 Apr 2021 13:37:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5Y+eqx5jq/yYpVNPyKOahE0bFxxuyJmIB9Xvcwk5GahHkTDa/wipQfAAWqxqx3f0SUdYT
X-Received: by 2002:a92:de41:: with SMTP id e1mr5814165ilr.250.1619815074910;
        Fri, 30 Apr 2021 13:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619815074; cv=none;
        d=google.com; s=arc-20160816;
        b=J2GrDTJubkM0WXrKgjYtedEaQbI2JTXoBh55cgicM5QZrDf1+E18QP0tnKeRbrO7pD
         v28brTlQa1DfRaiYTMe7xkW17VtPOR8fTXyjiPB1e2H2mqYMHt1B+K3JN9de0wALX872
         GhFomPqywAuRDZ3CG6HWKYmxg82nnzdk6NSyoeg10a8sI/VuK6Yc6+zPBqyFrqMnlg0+
         0fx43EeLac6J2oiYYy4xVMxUhwQI2dhocUcDb3SpeK5wBnqTQfu0T0ifxKnX3mqLYQwa
         a1/g6mc/F7J7Gids3zsJeLR1m43btXKGd5QkZNkfFYVU0IVYprbKP5L77bUhlqkND/eJ
         F8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XWdhkzqHe8iJijTRujXmdCXfYmUKYPpZlGIVkZOqBWQ=;
        b=JnEgARZ85bwdXnuYvDh3LJaM0tCEdAHTa6xvx0wlDvL8mN+JXExi51LvVk1rsiVpQu
         6GrB7vsCBSlH87F4ym0MeteN3zCYgAUvbRPbW8+qSPK5eaQ0B4aoETUWq/y4sLmivqrB
         xqrkWASl/yS5qlbrrW4LOV3rGBfo+ogsuNrq3bsybNAmjvzRwtvSazEbJbws52hK9hy5
         7zPp6C2j2WoJckRDSlt9RexHWzie5yX0VUfEYe+MLKFhY9IJiaHXjBlzk+NxCTkNNjFC
         sOJIdaRgY7XaVPY6ijoBfN0MqL2+9Q1GlvYkjq8jNjaoHHLP4e0fPidrh6vy0YTlMcnW
         tgBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wklgb60D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si1427909ioc.57.2021.04.30.13.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wklgb60D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZta-0004my-6g
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZil-0000CG-6l
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:43 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:45583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiU-00066q-DN
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:42 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so2370853pjb.4
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XWdhkzqHe8iJijTRujXmdCXfYmUKYPpZlGIVkZOqBWQ=;
 b=Wklgb60DNZIETuk5vMn+bFI6sm6bBUF3KJrs/PpOZd7A5d12r5jrtVrJ8dldNtUq5r
 w+NS53iGNXsm+phAde55zRYBegkBa2JbRWz12jFvH3Z89F82fS0Z9dXJmLQhpvNyc8te
 Im1j7j1Vpq26b7cxtdh99QywTODFkVMkhXSVveWRYpi4h/+U2yrBJ0mCnc5gbnkKMdmr
 0EuRFxG+kdSn7zNxdAy8rA3iX/L9JhI1pgMxF+zpsfofSk6wYUF89hGWM5QInm8Tyg9g
 X1hGfJyePzosT3Mwh1p7edTWzDuU13W+xWOlYN/TVzAWYcMI8PPxaJLF/eE6s5WoIdvj
 Tr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWdhkzqHe8iJijTRujXmdCXfYmUKYPpZlGIVkZOqBWQ=;
 b=ZJAec4E/+6KV1jUtRrDruD04fQ6jrf7P6tSQKybBZPN9MCQzHvZvW6tRkMNecNPEcv
 /b2wdb8kLYFy7RgBSB0Jr5hxBDKmvoutPApqplAVAlRsf4gsrUTaRCqKMbZn0W27yyIT
 qnk27fB7X3mbSvEjejrAKG913X+MFztcddeaetE42DRjocHWxhZP+VbF/NMm0GMBfAlL
 UHWr5XlC0QzKqijuwoqGKwAhobkIscWU0u2rerRpat73re8R5XQcr2monFYQym1N91Jp
 f0Csggv9ITUQCJ5XOiEVEVbKhGg8BN6qhzbL0JKr5XALTjRe/hX55vm7n3GV27j8p/y8
 fv+A==
X-Gm-Message-State: AOAM532xYyDKOqN//wy9JEE6qB0XIamI2cSeNrFW4Iu4MsPf0SGt0XhI
 dZl01xy9Tne+G/rolHY7o1F+VZPVBvh9uQ==
X-Received: by 2002:a17:90a:d184:: with SMTP id
 fu4mr16422647pjb.79.1619814384729; 
 Fri, 30 Apr 2021 13:26:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 22/82] target/arm: Implement SVE2 bitwise shift and insert
Date: Fri, 30 Apr 2021 13:25:10 -0700
Message-Id: <20210430202610.1136687-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 5wTVvrbpRvRH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  5 +++++
 target/arm/translate-sve.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d3c4ec6dd1..695a16551e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1261,3 +1261,8 @@ SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
 USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
 SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
 URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
+
+## SVE2 bitwise shift and insert
+
+SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
+SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c11074cccc..d74a15d8b8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6428,3 +6428,13 @@ static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_ursra);
 }
+
+static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sri);
+}
+
+static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sli);
+}
-- 
2.25.1

