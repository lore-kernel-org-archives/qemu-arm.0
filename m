Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1239871lfh;
        Fri, 27 May 2022 12:25:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgCRx1AwOwKO/HHJZo07YJfiUAIKjBCIK396+zfGJoLFBv1lA9r4EojSnNgeZEoipNhh+D
X-Received: by 2002:ac8:5947:0:b0:2f9:3262:c49 with SMTP id 7-20020ac85947000000b002f932620c49mr23788496qtz.677.1653679556195;
        Fri, 27 May 2022 12:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653679556; cv=none;
        d=google.com; s=arc-20160816;
        b=a4LoqBhvjeL8W6Ne1R25nKzzmymyfCcu4rca8rFEl35j+tOX+mzKRO3/f642FmUt8i
         BTdkpwvVRibU2+nUI3FZ/GLaVGhTXkPKYYEmjnhJvAkpxxz8YxdoMHvH5XmCc4jjvCGp
         ZohqL0Ofs9pwiq+AMzIpoEJqgvQJY+gmmOcBBlDrY++01eC8+x8gzWsYmeXceJxu14La
         iKKf/M3GbRWBcLbn0qx00WLvOG84ErgW7zFzXlu0BthMbramHDkrT2R+I9qiQK9wS1RV
         S4IOYs/6Wwjo0O3JMCZzbR71QWDo3E060t5wIKdgeL5Q/FJ9ggMPlw/XyMummk+iTxqx
         +xzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oMK9DEwl8yTIMeq1RJH7uu/GlqsT6gL1OJSIBqUYtoU=;
        b=ilmjN61ApoczXHdLz5Ac6XBcJ1WHNArcbpCtmp6PaL47kRMNCJuMGQQiGLsf3VCUOJ
         xVAQ0ZUCb00v9LP9sE8H9WFY+zeXTUAx+12qy/o2xytdffP4GD4Vfn0xOR2JbjPBqbh9
         nC4T2LeJwBX6vKgA35zjOidKVVxhxcDn+Ba3SlK5NNBGLvyiHLb+CYXCBqWqJHYXKGOT
         52GIuc7BcJ+rmWg+hl1XvcU+fJh/ijJGkWDQCj1QIyf4gXztcqt5ZVNmkA3kcxq6dNfr
         lbx2w+Xfi7J2IgYlErmXzrS4kngBIi8Hlmjz/aF8pSj3OnenzDGHDQwXnwnnhFmTARos
         LHjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b//7Ve8i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020ac85e07000000b002f945c0dfc2si3335710qtx.769.2022.05.27.12.25.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b//7Ve8i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufat-00026H-FO
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003b4-8d
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004MB-Nk
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:20 -0400
Received: by mail-pl1-x631.google.com with SMTP id m1so4819073plx.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oMK9DEwl8yTIMeq1RJH7uu/GlqsT6gL1OJSIBqUYtoU=;
 b=b//7Ve8ijwp2kUhk2vexkH1q5LKENTR6vEYF/p7f/tpsZBWzHHJGDI04WajAa16iJl
 o4Hd2WfCUQKfw+xeRAaklvrExXykqkIFLkSBfPVku4hOJe7tabMteAtjr/d2M1rsIqnu
 hdWEJA84q+DMU3AyBwelkHtcauNT38Kwd5uQEvxmnD733Gd1GRtUPDjhqJIps9PAuceC
 SVetdYEPhAojhVVe+PNRX3zzuG1UxbRHUKWap57eEEKXMvc7ly0Ra1LcuDPcW1+dnksy
 x9WGNyy8ezuIfy8BX3hkLVHswOB3u/6F4yJiIUgz/gJk9kOpeVBJCkZnl3QElyh19kQ1
 QMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oMK9DEwl8yTIMeq1RJH7uu/GlqsT6gL1OJSIBqUYtoU=;
 b=poBUdvvQj2FZoJ8MZzyRSnKcH20NkeLgXatOGfSR6uyKE1QINrLo2o2egPljwiZkvK
 NtfBnKat7tIoOBVOmLTGrnbUQ2SGwqQzdbTBYDPbrRa/w1bioKAPgtLmZU4rwjvhg5ha
 KBMvQqS5jJE928O6PyvyoWhHT6h5B5AveYwV+3ysmnbTmXe9XEDlC45QHqI+Rkwg9nY5
 TjpQy9FSvu/GOOO1heB6y3XmoX86ZTo089W923dR/rHfYyubR1F1ZbiFJi0a5K9eXRhO
 vxBJxa9I3bpZ6KQ3tzLcTBhT1BWPyppGVWNeWu9595kj41Kse+NqwRLd/yJ6gtCYZiav
 11SQ==
X-Gm-Message-State: AOAM531RdzG0w5RnNgh3FAGK8hEM/7qb7FkJOWe5ksWuQfPZaxR0RV5m
 dRU+ncaWDiIUhujyo64cs7munltxJw7/5Q==
X-Received: by 2002:a17:902:ea12:b0:163:8f16:def4 with SMTP id
 s18-20020a170902ea1200b001638f16def4mr5947482plg.10.1653675777063; 
 Fri, 27 May 2022 11:22:57 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 052/114] target/arm: Use TRANS_FEAT for RDFFR, WRFFR
Date: Fri, 27 May 2022 11:18:05 -0700
Message-Id: <20220527181907.189259-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: ubqFqbyAOH5l

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ce6e000f6f..6fd9a42ef9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1636,15 +1636,8 @@ static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
     return trans_AND_pppp(s, &alt_a);
 }
 
-static bool trans_RDFFR(DisasContext *s, arg_RDFFR *a)
-{
-    return do_mov_p(s, a->rd, FFR_PRED_NUM);
-}
-
-static bool trans_WRFFR(DisasContext *s, arg_WRFFR *a)
-{
-    return do_mov_p(s, FFR_PRED_NUM, a->rn);
-}
+TRANS_FEAT(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
+TRANS_FEAT(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
 
 static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
                             void (*gen_fn)(TCGv_i32, TCGv_ptr,
-- 
2.34.1

