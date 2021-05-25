Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4028724lfm;
        Mon, 24 May 2021 18:26:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwprTlPlftrZMz2g65PGINXvEuhPjfomnxs2QrB0K53xaQgFWtV5qALsGzdSTOAZwjnY+JC
X-Received: by 2002:a05:6e02:490:: with SMTP id b16mr19391684ils.213.1621906010499;
        Mon, 24 May 2021 18:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621906010; cv=none;
        d=google.com; s=arc-20160816;
        b=feHhNjAbitpNoPjiqOQncRvjCpQVEVwiXZphdiD26OIgEQRP+yJ7XbJ5wXIELFTD6Y
         /WRyFWw6afqCT92rpxiVSu4CNqcPB76qub9fvb+4kGW1dowQnwfqGlOKSrT2rREdY3Ne
         FIFrKVwVQV7FfmMw0z62oeqqTejr+z0biGnbu1ZAVGtZTGh7PqB/+kpcJAx0RFQUSMmb
         PODbAyMAhfckglwallyOZ8lKw8zbM4GVRcIx5trVDqIpAsJkH2SPzkZat7/4Cw1u81Jp
         zniP4f4ilzu3Fv9SuLp7Tu6fgLthQQ7kXnjk7p6xCHTqdM891Pc4YigV014qEvTDXZij
         V0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tXQchyLhKN98Y/+BfztzDunnLVKLZyMFnTQ84i+EsqU=;
        b=JFhml8CV8SmCfr1xfX/eH2wWIksX/uTbc4DB81pekzO5Pi7W9cjPpeE2tF84K+1yPY
         wc36wBir4KhMQleEa5vf0f5wCLfVysL5OrTVKcZqEUz8WowLyp5wFXmj9fdeTewfzayf
         Y98heR872q18vG3F5hSh2C89pKc5lVnwklesZZYHC7OXAeNjPamPNoWOcsbd/az5cthZ
         mdo/0YmH5G8IPXEnBc8uJN/c0QFOd3G3HmPRkYHlMYv4ZU3UJ0eUmI7cZGoM6yXXPZXv
         6dTKZ7Cw1d5fOkH0W/sqo8QCeuT+wRe2y0+uZHgpfQDRzsdrTKG3ipdVIDIziOc0p8pH
         hubQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="QjNMI/n7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si18384266ilx.117.2021.05.24.18.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:26:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="QjNMI/n7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLqL-0002B9-Ps
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUx-0001vd-2N
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:43 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUV-0001om-BC
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:41 -0400
Received: by mail-pj1-x1032.google.com with SMTP id t11so15879118pjm.0
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tXQchyLhKN98Y/+BfztzDunnLVKLZyMFnTQ84i+EsqU=;
 b=QjNMI/n7NoJqLHruEFDaxJvZssMfiXw+TA4rI8WK1/lHaPB/8oJxPsDoJDuEk5QMMx
 u22G2z/66oryHOtIzwgVQEyejezE9vCvfGI3jJ90lFwTsnmmtUvMwT8hzB6GjYqT//KB
 F1qWXqv/Lwc9fmpQufFbpGqpc3ZyTdrO8ZS5V+o3RNjC4UYgsYvwswzQiejT34L9XIUX
 XJRT57qmnHMC+uI2TIPS0RdxjoXXcO1Ln1hIplm2e0dmIK2FSBIIxu+nk3NpIhwymqIg
 aAJsieSniFr7Ojo2ZO8iet37riJC7CQUDqIl1eiSWy6yEfMvJGca6wjwZ6fxt+ARc1C4
 1sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXQchyLhKN98Y/+BfztzDunnLVKLZyMFnTQ84i+EsqU=;
 b=fSK/2fKESs8T2kjLq4X1EARdyiLktmpyImg04KA3OaJ11acJMvPptTFvWXq0BXS95D
 wRdKqwN7ySLEnP12IEQ3DUXOLQVjgFVEz27lAvLytOytm6/bh4LJeB18wySwMNSuTdP8
 Y7kXYp0ooFMXvgqKC3cfVFDGV9adZN62LQyKZFQ9j1Yk1rZpo59Fjq8HPasVNChJY6D1
 tS6K9c4cz84+2o9A2v0quIGfZ17q3msbcY5XgL2XFx8hTIlOveWO9/7FfOLRitlc8M1G
 Jwbhr+fhVCCGYU3SOyPVni0dXpcYSMn8lwqLOXDZxbxe4uIObingbLf3KTkCTm0JNY3L
 QvAw==
X-Gm-Message-State: AOAM5311POQrGOS3y75ztOhwTcvX1Bk97XSJuemXmIC9EfX1CKRcUCaf
 4nJyjIe8r908aSPRk4mRsl5dpQ==
X-Received: by 2002:a17:902:d101:b029:f4:b38a:a10a with SMTP id
 w1-20020a170902d101b02900f4b38aa10amr28065273plw.46.1621904653820; 
 Mon, 24 May 2021 18:04:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 23/92] target/arm: Implement SVE2 integer absolute
 difference and accumulate
Date: Mon, 24 May 2021 18:02:49 -0700
Message-Id: <20210525010358.152808-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uFG74p6pZR1I

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 5e42ba350e..202107de98 100644
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

