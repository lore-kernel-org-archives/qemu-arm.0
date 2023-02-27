Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4299223ejc;
        Sun, 26 Feb 2023 21:47:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+M1Hww2l6Khlez40l6u0JhVBEjc26ctAGYsLoL//IXCvHhiu69l+ZW2jqIJWLHo7ETSg84
X-Received: by 2002:ac8:5805:0:b0:3b9:2b0:5e7f with SMTP id g5-20020ac85805000000b003b902b05e7fmr30220849qtg.32.1677476821726;
        Sun, 26 Feb 2023 21:47:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476821; cv=none;
        d=google.com; s=arc-20160816;
        b=wcPHShbVV2SAFad16l4ZeRSg8leCSw040aNAjXChqYAKjS0HnDK/PAMhh8YwZNdHpL
         eh7qwWSFmWgvaGNrGAWEQO6rrDhtRi6myU3pnYBRIXOCB7jjcSXNllH/XkU1m/ANoS87
         cP4teWzZ2ph+WBg2Ymp3f/qonAhrFPBsaQtb3nqwa14JFpTnbZ7qSHCZy1az/uAcJfO3
         u127qMPRPfTD8LA1aAdPl6s0Pn1ejV7s+S4jaoTE0xcEwgA1NROp7EHtl6CZA2ry4vdf
         f7rbvK5l+5swGgxxrV9jrKcd4hwvHycUorRDC2YrUT8I6QY+FIZjwp6Zj2ON2aHHbU39
         GU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gjNRxwXY6IlZzT4K+cjSfeV6vMtijiEuE4yFA9wqFGg=;
        b=meWlVTWOieo4n+VTmsloHhzCEtqJWF/zCVrBo0R5EfS534oCUqEnYCSf1aFpNWZMfU
         Yezmoolma7jPSlTdWTwELpHULXXcL094bjMr7Bvv/jK3hjqR1gZqR2ZXXwY+YVGPW1+g
         YCpremuqS7zzN0oOL+Ns696jjUi9tmeZbA7t63yxgyB6nHpaqxeDNNvLKDCzOlcIgZR+
         GBCXgzCwKul4S91DIWjdpwMWyE9+I+y/uWd8z70fmVwx0lfUuiRTI5U/MJHdHiCR8G/Z
         ZjlQfnwTn23jJxrpV0fApKZIfcbgbuapuhDvbBnUcrRrFNGva6DTt4IXI5bR8arv7ig8
         HTYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QUcD3nf/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v34-20020a05622a18a200b003bfb8301dc6si5725584qtc.666.2023.02.26.21.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:47:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QUcD3nf/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWJs-0000kN-RV; Mon, 27 Feb 2023 00:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJN-00078l-0z
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:44:33 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJ7-0005Ai-He
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:44:27 -0500
Received: by mail-pf1-x42f.google.com with SMTP id c10so2156129pfv.13
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gjNRxwXY6IlZzT4K+cjSfeV6vMtijiEuE4yFA9wqFGg=;
 b=QUcD3nf/lF6IVFVsZYfDBxEDNL295vscaynrkiAZ95bdHGPuSpiwrMOZoWGoufPDA2
 NnU8zxc03I/dbRPvunCfr+2o/vyH0vuX7m2hKVA4np7f7Rs2dwUyBOYq5ZAB16aHIEgo
 FqY9bVaaxHxa0ihafI758X0nAg5xEBipWkDMJ11L1Hph5SGHhOM2IHxXFSJL488KCd0i
 hS2rNwjIeyhME48h50BqXwSCdBJHPJYPZOtWGWg1uS+T+ccxJqSq08bc6LkUd3sGFUnD
 ffXtndeVRYFQnaQhBVS+ixRANT6I+jSICPofwQxGNpAw0nzPjIkT0op65Nxfb3zzqPwi
 ZI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gjNRxwXY6IlZzT4K+cjSfeV6vMtijiEuE4yFA9wqFGg=;
 b=8Lag7JZ8kfnorCORtON+E0qXBciNeBbeMtUIteJ1BiIBFr+YaAOkP8VSJvlqpeH4kA
 /xwXE2BZNfijjQEW/2+xJvtRqU65RfVlFTQOoblmeuPq46eOs7FuPs34XnljKj4JcgdA
 d3BDmGgOyvjbGnB0lai5rleLkDPLXN3wwtY4anKoy49xj6xKl1nFcs+SdwFrFtUx3xUJ
 eROsrydH7I0fuqKAr3jcilMfmxj+B9S0D/VldZbd/fr08/L5qEzGtYL5SOxTnPOJjByE
 sm9IDpkFMwBg3zMnSTt7f02R2VHh1Iu51YzmaLNBS9Z5JBVu/6rLxyL1rA+iKU89hujH
 zq5A==
X-Gm-Message-State: AO0yUKXteliKcaX4bFn5N/nVT1uB9PL6Z1j/I+aVFH/5jwzZkrgHTpBg
 sks9Bsj1cmZHekP1aypzJkkujlj32SAl4eEoQpk=
X-Received: by 2002:a62:7b82:0:b0:5a8:d364:62ab with SMTP id
 w124-20020a627b82000000b005a8d36462abmr21987857pfc.17.1677476656376; 
 Sun, 26 Feb 2023 21:44:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 35/70] target/ppc: Avoid tcg_const_i64 in do_vector_shift_quad
Date: Sun, 26 Feb 2023 19:41:58 -1000
Message-Id: <20230227054233.390271-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o2CkG43a5Hej

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ee656d6a44..7af6d7217d 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -906,7 +906,6 @@ static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right,
     hi = tcg_temp_new_i64();
     lo = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
-    t1 = tcg_const_i64(0);
 
     get_avr64(lo, a->vra, false);
     get_avr64(hi, a->vra, true);
@@ -917,7 +916,10 @@ static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right,
     if (right) {
         tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, hi, lo);
         if (alg) {
+            t1 = tcg_temp_new_i64();
             tcg_gen_sari_i64(t1, lo, 63);
+        } else {
+            t1 = zero;
         }
         tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, t1, hi);
     } else {
-- 
2.34.1

