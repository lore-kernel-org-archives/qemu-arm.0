Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp484507lfg;
        Fri, 30 Apr 2021 13:52:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1Wp1cJakSU3eH3RwLbVuWO6HvTxvbjPh4OefIZsG7kA0XCHQmkiCygsg0FkdXnWluUpQV
X-Received: by 2002:a05:6e02:d53:: with SMTP id h19mr5449401ilj.232.1619815950947;
        Fri, 30 Apr 2021 13:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619815950; cv=none;
        d=google.com; s=arc-20160816;
        b=FfnI+8E9VqSpRFs22IvRJMQWe8riac9Z44Zl6bvoYzkav56Ll6C9ZvjzbIeEghRJFL
         Iiy8xcGb3fWj6jtDuy6Bx41lVcc7w5vsGI84jHVH4ZR+x9cTdqHSlH/2L3Uo3k3pTRTG
         FXQvM95WYd/hBnlaRRaOOwEIPCWz+Gsl0G+IeqQuMuhatI1LMhwtN322J3pQk40Q/PJU
         JXlYsd+I+BGdbtLHPDg7kzeSCUOYPhVJc98yt16XUW2V7JuG31zM3798BvOD6HvlzYVp
         No7Gi+2dikpnubmpOPreA5OOsUkY5SL7/mbSbVb+rw4iVqKr52XXzs+juPMv+HzzGE6N
         /hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KjnryLyEOHY0qpMOVIlDWjkao3wWlEhJ3Rqkl3sc8kg=;
        b=pdXZTdJTw0TbkIgy9JeiaGO60mCUCqHMM1p8avvHBmqkno9KE/0ttLlNYNsVccpC8X
         IHWYaZ94iREmwI8f06iah1zylAANAysXTs+rBlqNQMAemn8/ctPGGLLb2zXb/H64bg3m
         qKjN2kLauoNLvcBqTTohWpf7elMIzVdve+3sYvfmZIB3uTIpre7pH6BovQfdwXMrjTII
         BFnXWgr54A8z9Ih35aSs5KQNZGQym7CTSi1ZPDmzv+zSQQ2NEED0PHPYXwh6rF77ZPda
         FAl+4HdBVW9M9q5q6ZcniOeFOOMu6MGhb42PL8lhpTyoKlHuPnRy+J7ocf3F+63dyUke
         2D2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ej9WJAx7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10si3435051jak.88.2021.04.30.13.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:52:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ej9WJAx7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lca7i-0005S9-8z
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZin-0000IP-Fm
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:45 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiU-00066J-0l
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id h7so8664656plt.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjnryLyEOHY0qpMOVIlDWjkao3wWlEhJ3Rqkl3sc8kg=;
 b=ej9WJAx7rkgoiWLLxSA7csW1oED2yhDxmuSX3Ns9eo/Z8USq5srHkRxOsSZt2CXfdT
 F58rbEI2uh42SgmF0l4O2pC0VWl6H284qCFhUvXYxgIHebOkQw5/Y5dKHsmRfHzoVZ1C
 51zM9Ywc1Sl4JHpOM5FkCkEag1TWC0xBpScNy9uPo6AuP/fSaybbhNeCJ3jPUkdqTYP6
 dC+f4DC9lQAvw5ybgJXkh4y4B9a08F3l6WQhaky4ac/ME7dB8VGOCtiuU3cLdiVVs2hZ
 KAA1cGROn9byUpHZ+/VdMzp5iFuaY1Sp3lQFSoCAcFXhaYD39WEsKo6bqKHKepbAU2Kl
 C+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KjnryLyEOHY0qpMOVIlDWjkao3wWlEhJ3Rqkl3sc8kg=;
 b=aY0EZ4PHDnb75OP//SsuxhrpR1+TLY02F0LybwpPP8Fva+CPXptQqdsSJ2PhxCx8El
 5rNlIb0pTmeRB8hT+WG6C2hS0TpzANh8DWSjm4llGHgQqNG4aHIajlZvQXMKo9+8NoxA
 I15XsBQ+oDfg7rFW77KUWXdufcAa5jMxE5Ix5QzWc3U3t8sweeL9rgD9y0kz/EmWZ7Nl
 LbFW/znhD4QyhMCVLrY7pe9IuXkYyBJYCdqDCk61QDOfVAl9YqBXUWPah4q8bwfRpHKb
 ye3E+qH5dDOpRcNtd5pPFBu67Pt6aehLJ5WUMQBtiqWzw6cxpESQANwIbx1wH7tobOWU
 We9g==
X-Gm-Message-State: AOAM5310LtldxoljX5e3vb31SfCf+leqLpwSTjBwfGhdRpbtfJP7kDbf
 6V4pYDbVaE+I3D0lMYiOmo6INYcyHFUXNA==
X-Received: by 2002:a17:902:7444:b029:ed:5334:40b6 with SMTP id
 e4-20020a1709027444b02900ed533440b6mr6873726plt.35.1619814384223; 
 Fri, 30 Apr 2021 13:26:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 21/82] target/arm: Implement SVE2 bitwise shift right and
 accumulate
Date: Fri, 30 Apr 2021 13:25:09 -0700
Message-Id: <20210430202610.1136687-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RH6dF/nZwXq5

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 79046d81e3..d3c4ec6dd1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1253,3 +1253,11 @@ UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
 # ADC and SBC decoded via size in helper dispatch.
 ADCLB           01000101 .. 0 ..... 11010 0 ..... .....  @rda_rn_rm
 ADCLT           01000101 .. 0 ..... 11010 1 ..... .....  @rda_rn_rm
+
+## SVE2 bitwise shift right and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
+USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
+SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
+URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6f5e39b741..c11074cccc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6394,3 +6394,37 @@ static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_adcl(s, a, true);
 }
+
+static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
+{
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        unsigned rd_ofs = vec_full_reg_offset(s, a->rd);
+        unsigned rn_ofs = vec_full_reg_offset(s, a->rn);
+        fn(a->esz, rd_ofs, rn_ofs, a->imm, vsz, vsz);
+    }
+    return true;
+}
+
+static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_ssra);
+}
+
+static bool trans_USRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_usra);
+}
+
+static bool trans_SRSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_srsra);
+}
+
+static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_ursra);
+}
-- 
2.25.1

