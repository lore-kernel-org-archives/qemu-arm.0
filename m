Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4025533lfm;
        Mon, 24 May 2021 18:20:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzphGV1UAqc//tNUfdHhRf3rHBoDkiVybg0EbgKd9TN+ZDyVJJraSPaoDdlkh22SqcWa5Ig
X-Received: by 2002:a05:620a:12e3:: with SMTP id f3mr33174797qkl.75.1621905659313;
        Mon, 24 May 2021 18:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621905659; cv=none;
        d=google.com; s=arc-20160816;
        b=LfC83MK5GTlJ5bTRCxUvyfMXSZUhdpJxhuB82RRzgkhrgzFOUVhnjpU3zSmhJJhlpS
         dQ3nMJ+Xuv+zThZr7k1YnUdJe5GlzKUTRj9wqg11fI6zc05Ahp963MD3Uxq2oV5gr6BR
         k9pMXd9dTrC7psqfQtOXyc7WdULfE7BTmEYhTY4Gb9nyelOPwJFnFldxYUgL75ARMUCK
         s7eUBSt8+MrgRWk5RZjl6gLJpBs8p8dcUJFEwspfyqms7aQIpE2CwIJDRlSQkjb0K0xT
         F9DJq0YSIuRzdRn5t5+nvG3MkLpUFpdWYhshQ5h52I/xZYxbfE/K+mFjLmyCGKtHRAJK
         moKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GDzHPQFAAp6LPiIxIvoRlgxRhbX+S5BFcnVxxG6PSRM=;
        b=hZma1XrHsWSpKoEaERkstaWaYxeulSsPP3/PBlRD1L8W9xC7wbhWiNGtFOIROU5u8O
         zCpogK3jNxQ5BdySLWywPfDxWL5pXKPg37OXGXV3RyI0siP5S7ew/62xROpfq4JxPHST
         4/KkthvB8djP4wjEPB+0wmrBrAqIqG9jiS9a3moAcqo338p6B6VzNykH/1Sdyn2iNEOI
         2JHe5hvW6qsahUXpTkql9zDYfcx3eHWWjvXzlfrkhJHrQlCaX3bRyP+6mg451kK+ausc
         EW5IlTfFSUBTFhkOmOXYuJV+cJRY3xkNGCLAG8M+sEO1pMpivpCXqxN4PyrZFe66qWCC
         Iw2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jZx2RhZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl8si11377258qvb.11.2021.05.24.18.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jZx2RhZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLkg-0006Wt-JY
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUr-0001ty-Kq
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:38 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUT-0001nS-TT
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:36 -0400
Received: by mail-pl1-x62d.google.com with SMTP id t9so7063557ply.6
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GDzHPQFAAp6LPiIxIvoRlgxRhbX+S5BFcnVxxG6PSRM=;
 b=jZx2RhZKK3RCYO4IipBfvR1L3pP83zinh2Y287RKOvG5oInrda1EhpgCZ9i3ClIBHf
 3mDpbCpvDIj4jBvKl4RNYU62OSzzZl6gXuk6TrLtRC8ulSykSJtvmQj8zWLoyLCH0Nhp
 o9KfsjAt5iCP7LBxz8+Rcf3XnOPFY2gMBLz5dTr934PM5ZMBHjY0ashXN6yAynPZvD1V
 Zn5lamWptrkIntQoqbuYTc7UcYC2wfWbmgiG10snHLoPP7clF70mnCC/gdyMYO0Y2tTv
 2qM9/i1EkOkqjqzpTZ1SplBtQs8ZmMxQWw6EhD0JDcHzOpPiSe2c5SobKzhg5ZxBNlzc
 JzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GDzHPQFAAp6LPiIxIvoRlgxRhbX+S5BFcnVxxG6PSRM=;
 b=OxIvFNBUxhAcH7Ip6Famoc8YI7tUPWN2Jx1clvZMgo/W2CGkpZS1oexGuoiBzhjUbZ
 pyGxk3QyqrMggOeH69vKFA7BIx851nrDFWjSmWM2yQxMp7KQaVjdWymbuBi2lSn7fL5I
 Mr2K9z9bdLXKX/OhB9fI/5nuETfIgs5lgZ24VaXCuQz6zO+/ySumi/rMUq95PO2GReSF
 its0ssB7FoxUPhxjWxjpqWwFVDYgoBjp8f8JT7m48PVk6uXz40E1s9GP8Fs0sZ5MJ7bC
 3UlFuXOgKioh6R7dN2pBDGQ9PSXBwMizVCfAbA3hsKfOZHEV6apnmSu8PXaekUNQEN0L
 IGDA==
X-Gm-Message-State: AOAM532vyKWccm4WY0Vpyi666DLEscXQFP7VVSCrfyhpll70wBgTZJqn
 fsm9rYXrztY5cJDSDPUc8uRwNw==
X-Received: by 2002:a17:902:db01:b029:f6:4a13:1764 with SMTP id
 m1-20020a170902db01b02900f64a131764mr24201024plx.25.1621904652580; 
 Mon, 24 May 2021 18:04:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/92] target/arm: Implement SVE2 bitwise shift right and
 accumulate
Date: Mon, 24 May 2021 18:02:47 -0700
Message-Id: <20210525010358.152808-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: KLXWZdxGUYbu

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index cf4fa50ad2..1f93b1e3fe 100644
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

