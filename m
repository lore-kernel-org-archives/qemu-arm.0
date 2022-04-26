Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp356935lfu;
        Tue, 26 Apr 2022 09:32:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAMGwnXDOhY/0BMYSX0RAeNK8ppfVVBo/FFpwJi+S3NQ9gdHrOWxR/w/QJj80tN6350nMn
X-Received: by 2002:a25:bc44:0:b0:647:c626:62d0 with SMTP id d4-20020a25bc44000000b00647c62662d0mr16476734ybk.377.1650990767737;
        Tue, 26 Apr 2022 09:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650990767; cv=none;
        d=google.com; s=arc-20160816;
        b=TUgXMHnazQzIi3qjUeOs9zndIfWKw+vkCPokAo/JRUNk7yBbZtjY6VO0fM+yYNuEgX
         P5IfroGelyCCJbyS+0L1+9O0v5BgiH5nh1eUzbsThxvHlbtlBFHGQGsBeTPEO+ryXhTK
         nETTvbugvCUuHBbOQJx5Kz7EX9NnF/iaCV9irlT9wUc/MA062y7CsRDAN23mGmhXoOJV
         t3x0Nc/Nz7xOP8O+eh35DdfZMQkBBRTaDdyT6GNUJfvHtNLwqIINMO/mWh4s3b2Ee+mH
         AZYFbfDZl4wiTG5ldIT60p0k+DHX4k7MuakiG0+5opWDY10AZivAgmTvmndqpYTzpJsQ
         OuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UpI9KtHjI2y+VxbrhOzZiAV+X/liueOjiOpxfheumgg=;
        b=vPu6XthXkfjFydP6MKtH0Sqdit1/NVidkz3p6HnV7yHLfxRHA1TG1I4x67ggwhXbh3
         XStRjsbQQrsec1suxmemalY8WDou+oxGub57FeG2LIt8WxY8Kxd+HA7RBlBTCKoPYHLJ
         j80mGUUp30+hTAYCJLty35aCLMFm2ac2XpB3ADLT8cnWm5wgV51L0BLQDmpW9dZkryBW
         xjc/w8xsBWNkTjNQSe6eo88sHbyHO38vKCA/LSsvwi5DaMBYwhZnpETrclh3NnxGZknn
         Cqqjm0jYY6v+5AdRlzArk5Ih1dL7BO/8jYJ6E9xKQM2rvzvczOW1pZyETKCzBI0U4F+L
         WGrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJH562I0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j136-20020a81558e000000b002f7cb871942si7884704ywb.206.2022.04.26.09.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:32:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJH562I0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njO7L-00056A-4o
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5c-0002wt-Cv
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5W-0003mW-7P
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:30:57 -0400
Received: by mail-pl1-x633.google.com with SMTP id b12so15947597plg.4
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UpI9KtHjI2y+VxbrhOzZiAV+X/liueOjiOpxfheumgg=;
 b=rJH562I0NeWGBilQUAR3ime4sl1zlnB8QJIwH/aRq4HMQViONrsvmzcdAoB5P4ywGt
 h12H8MRq23lYONbFYjUTH3Qb/Ddst3LRixicno1ZMBU6Vg+YrDFkaHuSUcZaWo6kAUWX
 VRg0cJvHyu231rfRsqaUNK1Pgqa+ZIMM6uDSFZ/4YRDfmv1Nj9w5htUKKlIPZxA0BXcM
 0dzuRpUiokrlLNCGRlSEdfqYj3UGAzimNZ2Sro0xDvxVTcKusjhguXtJlDzBRiIANg5a
 QGp/wqt2qn/UCBlEqPrjjAB/1j2URruGzRHRDSt3poderiYBpY06AGP4XL5ERuJmrs0I
 m9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UpI9KtHjI2y+VxbrhOzZiAV+X/liueOjiOpxfheumgg=;
 b=GDy60nW8DLNyhAWunOwnM7jO605HKApZcO4bDZvi2VfnkrHyccQxn9H3vDMpaHnddM
 mG1R/kJpPpYvCD41pcrdhx7ss+F9UhdIPwZRdzRksgpi0VXYH7ldHBECzorkpuswtlRK
 glWnrgO5RrB3yJCPFmSJfKFBgUR1/R7RF3K1mqxl1JRHDfG3Iv22C0zPOZBOjbg3igqc
 JJE7cYlhQS+AEdrjeoBjDDT0HxQc2/o66yMmVLtdrQNoSflHI1RxaWJGheq4+Ztc1zqL
 WV15WyiUG4llQLK62HVQ8cFSajyUDJveC7yCBGQiKvcjMJrlnGb06kScUevKcKj6BuWB
 Y4Ww==
X-Gm-Message-State: AOAM530992g2zv0MNWifwZlZMPVGjKHdsW0Yl0gVHP9ayY8ur2iHp79U
 u98zS82uHd9mGGGXuLbcmBjToQ==
X-Received: by 2002:a17:903:22c6:b0:15d:45d8:8f8a with SMTP id
 y6-20020a17090322c600b0015d45d88f8amr1532634plg.31.1650990651888; 
 Tue, 26 Apr 2022 09:30:51 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/47] target/arm: Use tcg_constant in disas_exc
Date: Tue, 26 Apr 2022 09:30:03 -0700
Message-Id: <20220426163043.100432-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xkit2Ij7nrVa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5d1bccaf46..68e3b5c1f8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2015,7 +2015,6 @@ static void disas_exc(DisasContext *s, uint32_t insn)
     int opc = extract32(insn, 21, 3);
     int op2_ll = extract32(insn, 0, 5);
     int imm16 = extract32(insn, 5, 16);
-    TCGv_i32 tmp;
 
     switch (opc) {
     case 0:
@@ -2050,9 +2049,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
             gen_a64_set_pc_im(s->pc_curr);
-            tmp = tcg_const_i32(syn_aa64_smc(imm16));
-            gen_helper_pre_smc(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
+            gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
             gen_exception_insn(s, s->base.pc_next, EXCP_SMC,
                                syn_aa64_smc(imm16), 3);
-- 
2.34.1

