Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1249447lfh;
        Fri, 27 May 2022 12:45:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx4nKYJsXvgUiK8ZLjbaAMz5lVyhUpem+YCAdwzhfcsxmtuh+V3V4P1UI0zrsBfZCiLWC7
X-Received: by 2002:a05:6214:2401:b0:462:61dc:ed3d with SMTP id fv1-20020a056214240100b0046261dced3dmr13573427qvb.112.1653680737941;
        Fri, 27 May 2022 12:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653680737; cv=none;
        d=google.com; s=arc-20160816;
        b=RlM3lNAUPUCH7uyH2Poo8KGCDjVWknipqLB5ToM4gDvz5Z7Yaq1HvoWrGzx/8/CnNa
         iJLPrIZl86eFKqnA49RXQO5R/1A9ouWEEVqjtH7zvXVHKxRj90uLlzVsRgmOuOl+E9rY
         ZS4zYPHhDXAc78tzSkaQZN+PdwFBKwwfIrkiypNSQGNSgxxBdJSpDlrt9snEaWNKlTMR
         jHfN1Eac6a1m7dZtgv6wUjaOqA0h0bdYW2+sLKGmPcSAf+mxf266AuVGD8My+qDWeLny
         FMH1dzj3X4hU+d/HfIpodYmeuSbQqbZYaXPezN+4/j+x7ClbKffke8JTCgTXsd3EXXmj
         bqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ClqLPoIZ/41OrD+vo7PYhFvrA5CSJiS7v7bUYNtgnOA=;
        b=01LJfJ2pB8ms06sF+3OaRtScrwwd/NoSbXmZKK0uDt9CfBItpJW/xE9Cqin7uupaT+
         rvaLaXeC46lgsyTzWNz7msraNXbGxiTHlCleqnqc1s61nUZEhnT8TUBAv+/G/c4ferhl
         vbAjc/he9czh1I+H+Fv1t4he9T202DUqEyYM1Rep61XLPXl/UBG5r7f7zJmAE7bycnti
         y/MUa2km6ihd2I5KkecXO7ng6QMqamdqZf2+pR/qQ6r1XUoTf30/gWmP6UMzJMGbKEkw
         DIHl5tQxmtA6uBoyhjPtCT318t8At8u5jR9r2MVIaaZVpSUCgEvJlXSIVuciwxVCmgSR
         zIBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TNGCWNRi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu10-20020ad45cca000000b0046435854368si842901qvb.93.2022.05.27.12.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:45:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TNGCWNRi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuftx-0006rM-EP
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefS-0001fQ-At
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:34 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefO-0005Iy-34
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:33 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 cs3-20020a17090af50300b001e0808b5838so5047223pjb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ClqLPoIZ/41OrD+vo7PYhFvrA5CSJiS7v7bUYNtgnOA=;
 b=TNGCWNRi9He2JoVf+1xnwZQ5tGir4jH9jE7GqkKpIJL2Tq5BdMG9Ll2st0gI6ufMkw
 JR3Hrus8Wd7qutXf4lkdXs5S3IZrFNcr2wL1fNn1RLcczzINWe5eCoQphbRwvdhM2Mcs
 4oKivISs4usLvvSDxB5ZBH0uiBZIapc1yGjn/cQUlPujyILA9JGEc3B5NdFIzhiov32y
 TVVBxxR08whkFUgbW6AlDksi2O319g6d9foOUm93+LkqgGSq83sj69l++oE80BEYSgis
 RIP2xjZfyw0BwQ2miLDGU/tJIEyz3ju4GNJkDfsWu46KB3WKJJLYyJdlsX0YYbaD6HPs
 1eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ClqLPoIZ/41OrD+vo7PYhFvrA5CSJiS7v7bUYNtgnOA=;
 b=R8Inqy6MmuFwoCfQm8RN8umnuaOXt0eqApZQ5OtIiOsME5ocCQLG1rnMTBOiQxehIx
 J4erPDBtlwXQzLVlzDhGuW72eRk5R6g+YbMH76VKi4El4yhexS7JnMPkj/5lgrN5pwTb
 dH4Ixv7H55lf6NNfheeLG2MsqZdYE6Du4VE4MSI//xW3tDjdOJMJJmToAwjVeeORBANL
 Z/RX2OtEWeI4ty0FVECKp9WIIXP5PFa5Bm0D8W8dKhryjsOvnxmbrPjNX18oUlVooIlB
 omB50kr8bnQaiStkmJmypCCymzb14AL54EurGOO/dhtG32+GqjIzkr5GrRxGEtm3k3WA
 QYWg==
X-Gm-Message-State: AOAM531tRHPQYg9oSPRke5hgby7v54BFmFMhofmkmemxSpjcjIB0r+sL
 KDRdWR42JiFlzrwapdxj/vawSodrdZ4hxA==
X-Received: by 2002:a17:903:41d0:b0:161:bec6:b33b with SMTP id
 u16-20020a17090341d000b00161bec6b33bmr44201864ple.21.1653675988934; 
 Fri, 27 May 2022 11:26:28 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 086/114] target/arm: Use TRANS_FEAT for DO_FP3
Date: Fri, 27 May 2022 11:18:39 -0700
Message-Id: <20220527181907.189259-87-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: 6a70Zbal1TrY

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 61bf5f5757..d596e7a027 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3799,14 +3799,11 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
  */
 
 #define DO_FP3(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)           \
-{                                                                   \
-    static gen_helper_gvec_3_ptr * const fns[4] = {                 \
+    static gen_helper_gvec_3_ptr * const name##_fns[4] = {          \
         NULL, gen_helper_gvec_##name##_h,                           \
         gen_helper_gvec_##name##_s, gen_helper_gvec_##name##_d      \
     };                                                              \
-    return gen_gvec_fpst_arg_zzz(s, fns[a->esz], a, 0);             \
-}
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_arg_zzz, name##_fns[a->esz], a, 0)
 
 DO_FP3(FADD_zzz, fadd)
 DO_FP3(FSUB_zzz, fsub)
-- 
2.34.1

