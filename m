Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp55406lfm;
        Thu, 25 Jun 2020 20:47:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz069dwYY1qcIRJMgtPdsEg/SX/CXTuEj7VQc7Xi2TSWMAzbrLE1ZYuIQymOMeShRtbgomn
X-Received: by 2002:a25:b219:: with SMTP id i25mr1714978ybj.1.1593143250773;
        Thu, 25 Jun 2020 20:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143250; cv=none;
        d=google.com; s=arc-20160816;
        b=konZyLFxBKi6da0Q69lEiMqffLWOtEiATTUXgsO3dOAtxTCb0UGf9D012lPVQJ/ERu
         jdZTA57OIwEEWA9FgjrijSFvmgraNMODUAVEYjSZQu3nsHMah57qHuKNOWh4uH2pGVhF
         l4BoQdvpz8zTnssZfCy8LtZr4LDCRhR2dZEQZoFVq/8qlLW+udxS7UBo6v6TwFKLR5p2
         HhPml3xodoC8ZauMVLlwk8/GZ+fWBRTnFP+fxhIXsVAFqCYYU9hzc2VanYAUTv1C+0Ae
         dsVQ5SjakBEXiH3sFJAXkGIyH397jGwd5es2VhayuTgLbjbTBMjYthk3G6E0Uw6b+91t
         wIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=stVlKjyO4FM1PLWl+alUt+TVVCi4zJ9UBg3ub/hbBOI=;
        b=UDTMQiZ2JfTT+ing0f80TxnmLrqZgXPtAU55HYhsxiW8roJ2GehFIyPFVdXlFb4SJc
         Jl5SwxfWpRUb607Kx2ibd3C7sfSxeZFG8kG9IjEeMGA8gqvv3xmWI0Nblsvgod0jHFxX
         f107GRoS2J6HofxBAD+sLYnRPFm7247OSme0Q9uFD0xNHVcmkois7gGe3Iek69kGPDKc
         kVoJ8zgJ4k5Tpy3+nNYKRKaW2naYLN2sd68vzSI3dI04+d3+hGOXzN13ngKgsCBVR1yY
         /FzHeQTM/TZ0yzScv6/+0W8AtKhI+PIPlMT95aiSAg1IiFyGMvRdWPq8QSMzdWdQHoSB
         4Ivg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=amKFnfPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m200si25285084ybm.257.2020.06.25.20.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=amKFnfPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofKs-00030n-5U
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6L-0000ht-Kx
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:29 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:51073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6K-00020s-0q
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:29 -0400
Received: by mail-pj1-x1043.google.com with SMTP id k71so912627pje.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=stVlKjyO4FM1PLWl+alUt+TVVCi4zJ9UBg3ub/hbBOI=;
 b=amKFnfPR+Lve+/3UZ9LS5oxmM1nPGn8UoUZFIWtDJeQAXHMylui6RcKccZiM7PjDiz
 SyRu9hBrXzkOgBlTbvrqToucH1gImZ1RCOBFadwxtqCmg+s1DXqwgjLhnTD2HNKlyXNg
 WpKtp/gz0BgLclxMRfVVIS0Ia5HZ/RAF6tXDZD3KtEel9rJwQOZRK/5q+LqF1kBeuFUn
 0Jtkc2JCAMSwgqDLVDUZaSB7QNyZ6g0c4KyUexMaIHr7GyWXlL/zPrXOk8AaC6+uWvTH
 XnPMbjFnMRKuII4B/sp3By/L8PODenxADRCg2YJh/dpAqOt8XKr0X7owhxPSjr3A52DG
 AULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=stVlKjyO4FM1PLWl+alUt+TVVCi4zJ9UBg3ub/hbBOI=;
 b=NKbI1ctdeIPZnlIdaZto2OsHDufKrDIph3/0Fvnj6uB+1H2ogP/V6mH9g842fMmpNw
 jFAgZkm+l5Zq/SlFlKeOOkKaMU4cWF9DOuMq69k49HWROV03dYLxJIyRuwliSMyllnc7
 6Gj3/HRx+uxtWrvsxpqxUpFIBRAaW/GN1Z9BmMvnpgLcrTyglHA6j/P8ye4OIAL1E7au
 QeHMY8c/DtunTjJQQ/lsEorgYBwySiFpStRy6s9gdsvuQnyaglKVBDAb5VsMDE87d+JK
 cUyu2EhZTHFH5CT8FxWdH4tgI9vhMM+Ryx+Wz5V/YjfboBB7iV3XDPgT2LIFrDIQvoDj
 R6+g==
X-Gm-Message-State: AOAM533Hf0VSrKE1QjiSGhx4RBvOf2r5jVY+Pec7CW01opxljwMpHGzJ
 QUkaW4eNiJttgG+5GocQTJ0A0CNbGo8=
X-Received: by 2002:a17:902:7008:: with SMTP id y8mr920357plk.84.1593142346731; 
 Thu, 25 Jun 2020 20:32:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 30/46] target/arm: Use mte_check1 for sve LD1R
Date: Thu, 25 Jun 2020 20:31:28 -0700
Message-Id: <20200626033144.790098-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +oNcK++0LxKR

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4a613ca689..4fa521989d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4892,7 +4892,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     unsigned esz = dtype_esz[a->dtype];
     unsigned msz = dtype_msz(a->dtype);
     TCGLabel *over = gen_new_label();
-    TCGv_i64 temp;
+    TCGv_i64 temp, clean_addr;
 
     /* If the guarding predicate has no bits set, no load occurs.  */
     if (psz <= 8) {
@@ -4915,7 +4915,9 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     /* Load the data.  */
     temp = tcg_temp_new_i64();
     tcg_gen_addi_i64(temp, cpu_reg_sp(s, a->rn), a->imm << msz);
-    tcg_gen_qemu_ld_i64(temp, temp, get_mem_index(s),
+    clean_addr = gen_mte_check1(s, temp, false, true, msz);
+
+    tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
                         s->be_data | dtype_mop[a->dtype]);
 
     /* Broadcast to *all* elements.  */
-- 
2.25.1

