Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp361556lfu;
        Tue, 26 Apr 2022 09:39:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6mtu6DDA2kWjwiYQCnoW4Ut50ol4yLMr3ps8aVIfKlBbSYhL9AX11IDKdjD14KDtl4Qf9
X-Received: by 2002:a81:eca:0:b0:2f8:9b5:e2eb with SMTP id 193-20020a810eca000000b002f809b5e2ebmr7174126ywo.410.1650991195108;
        Tue, 26 Apr 2022 09:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991195; cv=none;
        d=google.com; s=arc-20160816;
        b=L9Wx/8ZBMJX1+VxqHMtVE1B+iwmN8yO5SkEDsWQFwtuX9aZ73l0dApIsizHnDF+uP4
         pOsLxYfH3e7qRiPnkWNvcFKiJq1WKz8tF5pSgmCZiXumiuqf5Xg7ykXIoFtqIOg2AjyX
         MvU0z+bU1uQWsaNimGaNQaH65qiY5dsN2gDcg5scMyoKBvDUFn/RTpAFOxJrKgNbGwgT
         zPkQpgsYGYjNX7ARIcXuR/hzLnDuXy49hSbnpoTUyNmAeKKSI3T01lZBTIT5kKz0lD2c
         baKr3G4WoTGg6y7D0S23cXdXcCYV/TsA+eyfnfkp9IfNZuHld6SlLq2XlnHjZ7sPf6Ae
         qGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PPSQV55Wca59E2OVoVkLQTCbo53uqy8aRA3qUhu2tbQ=;
        b=JEBz3lLIayu43hxG9J8LUCr306FXJ1iU0Nm/xRW12NgGpFDIit9v7f/cZoSm1Qex0I
         ie9qdDL4EH1EYO5I2NNS6CGIS/Df+DJ6Au1bLXDPTDo1AnnpDZJXp4G8LH99DTtGUUDH
         xSSPI0d0rWrEGAq9BI3KWgbq62ZFa68yGaIfX/ExggWFDRiOYnU1Gl954nR5IB7pYWSy
         jYJsuRfI+Z3k6PDDpwp4u2mPRg4a1fcZwE7Fz26rnPeZV0S/42/HkZ13g7DO/vAu7oJj
         UuhzlW8Zw+mrsjR/FB6xu63Q/FmwwgOODaXALVbGXjQTE0wCOBI1xrMDGk7k0UbtkE5G
         FXWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gz1fCV4M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020a253b01000000b00648a9afa782si1899567yba.151.2022.04.26.09.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:39:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gz1fCV4M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOEE-0003ly-Hb
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5f-0002xT-3k
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:37485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5c-0003ns-49
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:02 -0400
Received: by mail-pl1-x634.google.com with SMTP id b12so15947858plg.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PPSQV55Wca59E2OVoVkLQTCbo53uqy8aRA3qUhu2tbQ=;
 b=gz1fCV4M9+qFPiHf80EVvbOVlbZ82HQjtUMfG12TsyKaxcusgwm2AZxl4y6bqMiB9N
 POzJsWBkaOG9XISN1wCWGcZlWNl/7oszUbXcz5ojzTJmWVc7w3fe3+lPFtoTT75kfalE
 c/iba9szMiuFfkC1Y0znpwX3r40Nmf5zBavTkVvXLTuo9GOxptiAw4vWWzZYWxQvx/Yf
 geHe9rRdWvXXBY87+Stb7AYyS//INqkgaLker+0lKYsZf0Xf942ZNOWmDYJIu6Tq07Hh
 vkbLTUG5ktq5Z+aahM5EJefh+LYwqhfS1FuQRmlV+hXB37A6z0qKLOmn7WhbR/lWoWcP
 Duvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PPSQV55Wca59E2OVoVkLQTCbo53uqy8aRA3qUhu2tbQ=;
 b=CoL8WeniGlH+qTQ5ReZRPbxTiL1ApdPbgUaLgzb6TJ6Tfn7SIrdwRjtpxHs89gM0Oz
 nTBTDvPkyetfk2biP9zm6Nuy7ptPL+pi6/VZiGu7ub/Mfl9sQ+5rypP7pIe/Kg2+EyTN
 XX8C7JOUGEUaz7HnF8icGDcniX9BUy53mr8IZAySOgye+4MJQ64y9dJhjdYJyE6IGyNM
 0enbtvFxs5d0JbT/8WTkLx8gc5Mu+/hwCBMd0HBm+NTdf8i1rX/thz1bDhhoWtou2uZF
 soJjLEGTfP0mQKNNfWg7eQOayeAjJTyXBdilgjRZ7F58qGgWuB174UMDUHR2VSlr1JIx
 T9WA==
X-Gm-Message-State: AOAM531jn24orP8GoqvnUU0wns9b5Rrt/vEjk1dHNn8Y3VKoPPYstlbY
 lPaT80uRqAJPvNTu1tyhLZl7fkqsVDQD0g==
X-Received: by 2002:a17:902:da8c:b0:15d:3a9e:e89f with SMTP id
 j12-20020a170902da8c00b0015d3a9ee89fmr3211578plx.120.1650990657862; 
 Tue, 26 Apr 2022 09:30:57 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/47] target/arm: Use tcg_constant in disas_movw_imm
Date: Tue, 26 Apr 2022 09:30:08 -0700
Message-Id: <20220426163043.100432-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: s/59hnno1/4h

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 6c88772eb3..537eebbf1d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4419,7 +4419,6 @@ static void disas_movw_imm(DisasContext *s, uint32_t insn)
     int opc = extract32(insn, 29, 2);
     int pos = extract32(insn, 21, 2) << 4;
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_imm;
 
     if (!sf && (pos >= 32)) {
         unallocated_encoding(s);
@@ -4439,9 +4438,7 @@ static void disas_movw_imm(DisasContext *s, uint32_t insn)
         tcg_gen_movi_i64(tcg_rd, imm);
         break;
     case 3: /* MOVK */
-        tcg_imm = tcg_const_i64(imm);
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_imm, pos, 16);
-        tcg_temp_free_i64(tcg_imm);
+        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_constant_i64(imm), pos, 16);
         if (!sf) {
             tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
         }
-- 
2.34.1

