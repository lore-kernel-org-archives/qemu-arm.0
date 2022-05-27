Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1246538lfh;
        Fri, 27 May 2022 12:39:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbE1zpjwHfj5NAe9CGmnzPD7yGI/YXykI/PFDChZkCxPfCbvOrUyq4RPhzCy98t3zWDMYk
X-Received: by 2002:ad4:4ee6:0:b0:462:6af5:dcfc with SMTP id dv6-20020ad44ee6000000b004626af5dcfcmr9230624qvb.22.1653680344361;
        Fri, 27 May 2022 12:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653680344; cv=none;
        d=google.com; s=arc-20160816;
        b=ddilAtXSqYKuTSWy6BbX4JAgVOR1ZBABJnPtwgMdciWT+LsIoi8OOuNoO/BMO1k7A+
         VWmk0ZemAmexIk7gaLQ9Iz88oFTdVvJQBFnzGrTsb3SRGsev3mBnux9hBFWXLYvccp2s
         0qXLRgHdcGKnhO6/EMOzqQqldWA/vXlgkR6DRSCO8KpD2c/gzLzOn4hw+Qvm6ZmIPv2j
         r55nhJFpyWoFRfqHSY7boEFao5w2QlrVTMljMzRBben0OqERBBZbpFDqrkkNIUGkQaHS
         MH56UJYPXjALKi8pghiLECa/miqpJHalphFSZhYSY1gKRS4dRm9Z5dvcRecQD/VMdEDT
         HLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5Q89U4kta6lhexkgv8jfPm0BOpmhch8pJh3wP8uQ0Cw=;
        b=ZaIwNXmHVRB/mva2HdKVoDtsT5OkJhtpoXlJY4lwfEHjAExH1clgGwq2eYM8daIZz+
         DhI/KdnoBRUWZdyU2yN/FMKtODrGFJ75Xr4MCTo0iAY0pU8Mx9xjxH6mAfkD5kTsKkYo
         lE3uaKaYlqaNLrM/hyFx3RA7zZYrnoyUvKhwLyrHUBcP0zC4zvm9BjVrNcbXid7w2uZn
         61T8epTvtVPsNMVXaAD6DJ5Nvg/RkBrayyUUS+dHt7kIJlHZp8YfyJVXGU14Gd/QXjcf
         3g/Q4PFeWStIiZSZMMBoerrL2uWHcpibF9QUjHiYZSgbIBrvmucJjXDo791URurJ9XKz
         h2Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcqtkgfJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19-20020ac87fd3000000b002f3ab1c3ba1si2978225qtk.683.2022.05.27.12.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcqtkgfJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufnb-0003Sj-Qr
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefL-0001Y3-6O
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:27 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefI-0005HV-GA
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id d22so4803637plr.9
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Q89U4kta6lhexkgv8jfPm0BOpmhch8pJh3wP8uQ0Cw=;
 b=VcqtkgfJrSzSGqKfIS8sMPNMc05/mFuJggADlkCSQ3Kjmw8KoGIPcflg+at/fjDNm3
 K53uwGuIH+mEAiux6cqnD076c2Y1A1G37xgm4hvlgMyvVU01+1fsCgm6PVKt0/GNhgZ+
 ViJnj0lFufzqbbKIMxrecPVmpP9M++81WRSxaOCgMAMij7M1D4d2WUv34EXbJQLu1zqL
 7DJH18WpBmXIcIkR1gVmlveIiOaE1vxvE0pC2rlY6J5+4iXM3oB7h1vrwhE7/cunketn
 y1twlNsK3KJkxcjM/zr0rPfb+MWuOk47pRWAqyVTJvtFSqbDpb+9AavhOqIE4weSFy22
 R+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Q89U4kta6lhexkgv8jfPm0BOpmhch8pJh3wP8uQ0Cw=;
 b=FvdjkBJxlg2B11X3Vd/xn7rx3ELb4x5JIUE2SVTq/v4AJYc8HOSTaRYgXlCtkrm5Ms
 5vG+SG7uLCdpdgPwzQTNUxMy00xAOwKbeu1A5tuMXqdJxsZTj6UOYn223CBHl03nGUmG
 B21Wvg54L89V7ttQNxYM+SyecuaV5HiRsd7pdRuT8O2p5stwjzYOL4j/dxJBW7jozgOW
 zc+8A7LudotXhNjeIwd3bAKIqQBGoFz4j2bloXrjuwJvzMXU86qTCU4yTlqt21TE1b5U
 r8z2+jib/RFn+G3Trt3sYBh61nmtFBenctMgcCckmoSg8AGEbbHppT4FSy4xkgyzmrQE
 DuhA==
X-Gm-Message-State: AOAM5336Ch+LCjeF5FNx0P2yw+zdaC5Qc5WNEq3Mq97uT6i6jwJvudSM
 X5WiW93uqELhFHARuWm01YDAV5mowiZ3gQ==
X-Received: by 2002:a17:90a:e7c6:b0:1e0:9cf7:d042 with SMTP id
 kb6-20020a17090ae7c600b001e09cf7d042mr9652233pjb.234.1653675982716; 
 Fri, 27 May 2022 11:26:22 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 080/114] target/arm: Implement NOT (prediates) alias
Date: Fri, 27 May 2022 11:18:33 -0700
Message-Id: <20220527181907.189259-81-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lYLL9t9sgxLp

This alias is defined on EOR (prediates).  While the
same operation could be performed with NAND or NOR,
only bother with the official alias.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f33bc9d480..b6b5980e2d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1381,6 +1381,11 @@ static bool trans_EOR_pppp(DisasContext *s, arg_rprr_s *a)
         .fno = gen_helper_sve_eor_pppp,
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
+
+    /* Alias NOT (predicate) is EOR Pd.B, Pg/Z, Pn.B, Pg.B */
+    if (!a->s && a->pg == a->rm) {
+        return gen_gvec_fn_ppp(s, tcg_gen_gvec_andc, a->rd, a->pg, a->rn);
+    }
     return do_pppp_flags(s, a, &op);
 }
 
-- 
2.34.1

