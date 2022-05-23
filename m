Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3763364lfh;
        Mon, 23 May 2022 14:08:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd2gcY8FKGDt7BQzn7Ljtt55Ady96++bG6ON2H8zUZdZhrjrZoYci+SLV92049pvWMCIAi
X-Received: by 2002:a05:620a:258f:b0:680:f657:d3d0 with SMTP id x15-20020a05620a258f00b00680f657d3d0mr15589189qko.707.1653340123072;
        Mon, 23 May 2022 14:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653340123; cv=none;
        d=google.com; s=arc-20160816;
        b=TErXEzBbY5NOi0nERoL5UOV6FogeRNLGObOUZFj760jcOYgrlDMfppad7hjzSkNqdA
         aO8PtbvDdd7arQE9vghyzsds+t8352MtUmjHJJgio6NWMOBG3039UbLZIceoBIJRZ82J
         LICvHH4r9+RC1wP6iqQT1U4wfTHYRrFOpB0MbEzcyrt4OeO6AJ5C3j5PxU2hvg0+L6no
         paii1QAU0qBHOvVk1hHujypHj9CoNDtp17zS0iroJQSTYkE6uuLpI2bJlBuK/7sAunyZ
         f40AFB69w+gv63qF+jJpvnLm2XX3YRBDMQxbtrdd/oK1aGGdI3YDFnMRpzjZnSU1C9Se
         bXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WRIXhi2sPFQ8say7R+yvzgVuvHNeZiRuu0E48iydKNc=;
        b=0sidShTsEHUK4tG4gZdnm142FEZwUuyHdmFruPhUdOPGmR3JqCzz2MAc9ZaSezXs/6
         R829DdrKV5+9dfB+zx1Kd7B+jteACdmZ06V2aTLT2h01weyCw61Q3bfycNSnT27v/tb6
         rmI0QZQV9Er5H9/xbrGawM5rlhsPqA/FYPF6s24S4QXOFmc2Q+UL6xU3kVgyEX369Wba
         Ma+cKD18aeDeteIH0bSjqmCFeZP2imDO71Q9OVi8HBVnq9njiaWuwViV+M8PNMO/FX/H
         H1UtY1aC8EBS/UnwlBu3yLhl/u6od3RvuLlsPLdaqcl5le9L0rDGeKQvbu/wQn8zzsZI
         w9Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HoP9xXt9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a05622a198b00b002f93b02032bsi986830qtc.206.2022.05.23.14.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 14:08:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HoP9xXt9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntFIA-0001YY-J4
	for alex.bennee@linaro.org; Mon, 23 May 2022 17:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyJ-0000Y4-Ro
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:11 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyB-00055J-Qq
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:11 -0400
Received: by mail-pl1-x635.google.com with SMTP id m1so14134386plx.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WRIXhi2sPFQ8say7R+yvzgVuvHNeZiRuu0E48iydKNc=;
 b=HoP9xXt9ns/Yk0SV5YLFE5ofm3YCZH0KWprZPNrv7GAxLZ2L3CZCjRoQhiSz1VeiQb
 qPqA3j/Dw6N4gGZMPy/Xlzr7ZKXYwYE+WKI3Ktrs/Wc4kH/ALyReQ/HQzHOj9WuefuNk
 nI5Pdd2ylB3QqIKLHb2ay+pdoS8mxU1Y2KgprJyJ3+0pBSmwjocWudckOkq1wrabmzDs
 PmO3foPGNjqPIHYzTqHX2gTdQaG/7nL0uK+1Zj0QR/BEkX3M8k9y4ymYgpz+9cQsoFcZ
 X0doRrxW0GEo8uhGO0dibsy2jNMNpeGtFQyXGuVpF4coVz9J3+csqIbzqUmtABPBB35B
 6MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WRIXhi2sPFQ8say7R+yvzgVuvHNeZiRuu0E48iydKNc=;
 b=NInIegEJJ8K57vgr9g72OpNE59xCUzG2umKyJfWBPwIPSvZm5rlZHdzcdA2vmc6QT7
 Qx7oxZramzNmxcQb06aNYjtzKWpGzq7Rn/qnMxFa7Vsx1fsi/CK/rjm424x3pfuySjLQ
 t807rA4Y5KdF/1lsf004WWY5ubJcYaSaqEItwW7lfsSRjmp/tg+39qvQ4fYtPpG1kz3a
 1bURKkfxwA3JtcUO21g/CsqdlNwOm/KpQiujoJe0wlHZkvRoGM4vxggNbfmTkKkdbr9Z
 BTENJxPUi4NmtnETBuJQ6m5p345hw6+5OH/HkIstRbT1h0p9S++t9DVythcUhZTgn6YY
 y6NQ==
X-Gm-Message-State: AOAM531FqZMEqNJvh0NWmshbE1yiWIEw5DodHsDg+pR6flWra6Q5XcIs
 Dr1UXsQ4rMF3z8DwvY4klnUpUVltvRh4DA==
X-Received: by 2002:a17:903:310a:b0:162:3809:a002 with SMTP id
 w10-20020a170903310a00b001623809a002mr2398990plc.5.1653338882605; 
 Mon, 23 May 2022 13:48:02 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:48:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 18/18] target/arm: Remove route_to_el2 case from
 sve_exception_el
Date: Mon, 23 May 2022 13:47:42 -0700
Message-Id: <20220523204742.740932-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: TZerD09N/cEX

This adjustment is handled by exception_target_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 63c3fee5ff..5c875927cf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6155,8 +6155,7 @@ int sve_exception_el(CPUARMState *env, int el)
             /* fall through */
         case 0:
         case 2:
-            /* route_to_el2 */
-            return hcr_el2 & HCR_TGE ? 2 : 1;
+            return 1;
         }
 
         /* Check CPACR.FPEN.  */
-- 
2.34.1

