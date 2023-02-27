Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4303138ejc;
        Sun, 26 Feb 2023 21:54:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9N7DoV4KzZFmsfJ37tG9c47I4ET44si4s5stCPhDKUu4K6ogc4h+EzZjcds7W3OsARYyeV
X-Received: by 2002:ac8:5aca:0:b0:3bf:c86b:3d2a with SMTP id d10-20020ac85aca000000b003bfc86b3d2amr11679510qtd.9.1677477261451;
        Sun, 26 Feb 2023 21:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477261; cv=none;
        d=google.com; s=arc-20160816;
        b=tYSfvq/fgaxR/K152zhqnfaVbK0l4D3c1SzTK72wpD7UJiymXITKlQ8kcWg4V6VEHf
         XM5SC81eaS8feCTDD+WoSZW1sNfG1uLJLOL0vcMX7pmRuF63JdOpl3lactxjS84L1Qa0
         lzCYMvEom50qxxST4pZITKHwm85/WiMoO68m8BFdObQOzhdUpVkgpG+GsMMJbBMd0+SF
         yT6Ys3/sBsrwbTOtyJKS+gcOs6LV8QyqmZeEqWvhIZ3W+yca2vUV0Tuh6zmC6dvEIIiG
         j+xp0c77p1hvfkJXmlsnraz/ra7CYiuBguqc2LLRiD8h9DJgUTE9sNZFpExkHiwxOPB5
         xh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ayfqorD9uX7/Vi+5yV/fsV6QKxxs5QiH623wECf/tb4=;
        b=NUBrcv8Qs+dulbXjB3gsrHXlO70CJIcsxM6h+4+cigQH3jpUi86dyfFs+Wk2qG7ePs
         iGNhjgRbwn+SJBdJtW6LtOF1sHi6QygSz5w4ByMEhMs0WCADVcVzj4U0t0JProzl3Ws6
         Y8LGSqKUXTSgtw7D8mKWSI1BILoS4vFHh05uuA6nTGKNxBnw4WWLsQXtryz6slxJvnkj
         lAjIJkoogxyZu/WvYkat7V2DkxsxfPcAcG90CW5q/oYN8jklzediaR5ysEHupZEuBX6w
         AxkwLb8EPiOECcPuEmklBFj7aGBvjmmjGoj9p6PKDMvP0jGyZbpLnn3feKWjDWr90kQK
         qfRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dVxpBUlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a184-20020a3798c1000000b0070671b50913si6177237qke.702.2023.02.26.21.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dVxpBUlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWIh-000552-A7; Mon, 27 Feb 2023 00:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIR-0004TB-OS
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:36 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIL-00054w-3H
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:31 -0500
Received: by mail-pf1-x436.google.com with SMTP id g12so2838371pfi.0
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ayfqorD9uX7/Vi+5yV/fsV6QKxxs5QiH623wECf/tb4=;
 b=dVxpBUlM768pnD18AqVBmiwPTby3CHGQ7bD6WZ9QbnuRlNs1V+WfpQHcEYNtGBBAoM
 XoF6lRZ0qQgrjyowHaAM5oO1OEb4/4UA5Fnf4EkEoJ0LwIDSa0kzz5nHGQ9VRrCxgByd
 gtgcAABUlf+XZvvSzyrOa2xX3Og6evcgTx50F+eqHL97b6jtG70d/lj76wXepkO19FWP
 P49nKe2+9tFNJffo56BEn4krwxlyMh+cI5WLJaoBCUTNpx+IO5Uk0gPGH0M1Ntl/lxgm
 gTi/yObaJG5w5oMErv431mh1/8jIZ51xNYGDLnESLdv0PzBRgMWzyUD2LWoLGQPD9zQQ
 SOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayfqorD9uX7/Vi+5yV/fsV6QKxxs5QiH623wECf/tb4=;
 b=A37uumMmpyygC0/0ynS5fEPOfgijMkgTnLt/xgxCv8GHpmN6oiwee4Mw3VBxnu+L3A
 H9CrIJ0M2UMKeFJHHzcFnZ6dN7MjxqlhbSek4d5asKj8jKQoAhVo+2+oAumUvNB2LiF5
 zbJzFBhLFvId0yJb6zitTZORUvXysL/Hw19ucWGfpkQShfMIC2iK7R1IwH1ZwsQW1LeE
 QJWoM6gDGXVSnj/h43mJhO54DO+QEV7gguDuiL0IT8CN+panEUd3YmRSVyLsOimjk8gV
 4maP4lp96AfiWxkJLMW9qL4fEVb9K/qibmuDWnenuvSJaKPUGmEdCqMMZxIGbufPzdBy
 CnLA==
X-Gm-Message-State: AO0yUKUVFWwD8Z9EGqRjENj8ranq8kwzALvf/zqx3+BH0fxq9W0TRgMc
 jjw764i4ZbASaPLxM1MtTrTPIQ==
X-Received: by 2002:a62:17ce:0:b0:5a8:abd2:2beb with SMTP id
 197-20020a6217ce000000b005a8abd22bebmr19633529pfx.30.1677476607602; 
 Sun, 26 Feb 2023 21:43:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 16/70] target/hexagon/idef-parser: Use gen_tmp for LPCFG
Date: Sun, 26 Feb 2023 19:41:39 -1000
Message-Id: <20230227054233.390271-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: UcMWeYAspvW4

The GET_USR_FIELD macro initializes the output, so the initial assignment
of zero is discarded.  This is the only use of get_tmp_value outside of
parser-helper.c, so make it static.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.h | 6 ------
 target/hexagon/idef-parser/parser-helpers.c | 2 +-
 target/hexagon/idef-parser/idef-parser.y    | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.h b/target/hexagon/idef-parser/parser-helpers.h
index 4c89498f5b..1239d23a6a 100644
--- a/target/hexagon/idef-parser/parser-helpers.h
+++ b/target/hexagon/idef-parser/parser-helpers.h
@@ -154,12 +154,6 @@ HexValue gen_tmp(Context *c,
                  unsigned bit_width,
                  HexSignedness signedness);
 
-HexValue gen_tmp_value(Context *c,
-                       YYLTYPE *locp,
-                       const char *value,
-                       unsigned bit_width,
-                       HexSignedness signedness);
-
 HexValue gen_imm_value(Context *c __attribute__((unused)),
                        YYLTYPE *locp,
                        int value,
diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 6fb5f31cf7..be979dac86 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -305,7 +305,7 @@ HexValue gen_tmp(Context *c,
     return rvalue;
 }
 
-HexValue gen_tmp_value(Context *c,
+static HexValue gen_tmp_value(Context *c,
                        YYLTYPE *locp,
                        const char *value,
                        unsigned bit_width,
diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
index fae291e5f8..c784726d41 100644
--- a/target/hexagon/idef-parser/idef-parser.y
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -783,7 +783,7 @@ rvalue : FAIL
          }
        | LPCFG
          {
-             $$ = gen_tmp_value(c, &@1, "0", 32, UNSIGNED);
+             $$ = gen_tmp(c, &@1, 32, UNSIGNED);
              OUT(c, &@1, "GET_USR_FIELD(USR_LPCFG, ", &$$, ");\n");
          }
        | EXTRACT '(' rvalue ',' rvalue ')'
-- 
2.34.1

