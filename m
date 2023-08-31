Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp247031ejc;
        Thu, 31 Aug 2023 15:58:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe7Koyluk/mTz3JTZfBT8yzTXuzOCzpqTHEzifw5fx+DTRJZno59IcY2oMZKiU454f1HIA
X-Received: by 2002:a67:fb81:0:b0:44e:c2d6:cbd0 with SMTP id n1-20020a67fb81000000b0044ec2d6cbd0mr1086649vsr.15.1693522689466;
        Thu, 31 Aug 2023 15:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693522689; cv=none;
        d=google.com; s=arc-20160816;
        b=MUXq/usXtWHEhGxQok4hWTTjqQcREVarByAuJ0+z3Kjv9J7Ri+4H7EVQQ3ndx0Vh/Y
         OYuLVEenyQZbCVAOzrE8oatdxQ+PAm59iLwsDSG8CUyj0x6YmsvnZmQGov6Yr8imbQK4
         mE1eUd7HX2QYaXzrrRYG0MIzUkkmE9+DxVslAxD/6Gs7Xyedm+Af8P/EEWLWIJV2g0hO
         ePxgGlUtGxREen7yNEsUjPUx+8W+ztuflIHNNpI/p6Mnn5cSILQPCPOmDfZc3l8FBV1i
         iT8S44fTxSqzn+CAcY8vKRundhhlZEsBq0UPHSuH7ApR+1VaT3+8zuw5DhlgdxCViLyF
         sDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ShDkJ51FeoYcA6aYanaU3KOqVTFkyRgkJb5MAXD0rZI=;
        fh=idq1fxLttOtnmCkDPrxdp99bvZG1Jl1KEDnEWAr8dSM=;
        b=hro7eoTIKKLuO98aPrdEmbMfeQlxMn0f11zFfh7pePtklz+YnhR4vwphDmVD7I/FKh
         sWuAm4Ck/t+dllBL4kitUTTYFq7E14lHuxMPL3t6GC38mztw11ZZNA6FYATB47S5ragN
         angl8pYb6kbrkafVL1fihjogC1Dn/Gml2OvVLWwLD1AAAz/hJi590YP2bUz0SBwWXyxc
         x3zFtjduXzXlJgB9avvpTcaWmFcfUQUgOnDmb/nHN0ip5NGi8GKQ9r2J4p9zkIVxgywi
         1wSCunxjhgWOMhuaDUseLs3K3mPVGyWpk3BRzR7f9GVS2BeHlyupgdHn0lXC8ikllglH
         fkhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rP6iY1Va;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a05622a000900b0040548523406si1465924qtw.510.2023.08.31.15.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 15:58:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rP6iY1Va;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbqap-00040A-8O; Thu, 31 Aug 2023 18:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqae-0003xH-6z
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 18:56:40 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqaa-0002ry-E9
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 18:56:39 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so23353201fa.2
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 15:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693522594; x=1694127394; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShDkJ51FeoYcA6aYanaU3KOqVTFkyRgkJb5MAXD0rZI=;
 b=rP6iY1Va9Un1QM7mD9DWUVBYvra3Nizhyv0/DmBu2wSx5SYlss4UaRAdKoFO8J6mo5
 XnyvnRAAZw4oRludrX/uAfN6ZSjFbV5F+ZFEf9z38wPG2yrBCtClu+99HLha4F47RfAc
 YYJGiTYpSmZqfsjAZwp0CGQeb/zgrK1nHR7h/qy84+F3VwblO8e1YU/WMO8DUmjVIuMc
 7M7vadZqw3FkMCpWkqmCohb1UxyepBIlq4Xhs6//SdBKZyg2MMmf2HIBGmKkpP8rTOTK
 oiBTuQUTbyeMb5ow0pQup6gChTzpEcLfgSXdZF3EOEy9Ukj3X6Ayl3aJZv5LR6xipqKx
 Ue8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693522594; x=1694127394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShDkJ51FeoYcA6aYanaU3KOqVTFkyRgkJb5MAXD0rZI=;
 b=KwcX6tSKbsLGp7SY8ndj7NOuYdaZFD8Pn/KnxrcKUrkLUXAurG3HTWm56r+eXvyawU
 WIRTYOAZVzRgWuPdFucakmKG8MXZlu/4COwej4WZ3a2ee1222i3DPlTeBbjKtQ96VSl1
 AUmJI3fcm+w/zZQ28AUfa6+28zzBWdPks7PXy5CQoFHrlC9inbVzlDNMxq7smvIgWcXX
 Nr169UT42P6CcSCJM4gTnEm5KsxVdQrxfapXnYHC/IckrK0sHJR3+0W0UDU7qU6EqiHu
 ObX5wsgQSlGNsdB6vcXMlWnelpGU3e40DZrDxhAXB60L/DHnwIexJuFSTqX0qGXvDzfn
 baIg==
X-Gm-Message-State: AOJu0Yw5Rtu11vg01xmjoAnRNmgh5FHA1D6KW3K1Q6482HfVXkb1tz14
 1No9xy8UH5BMsWhib7sCiHJVfhd/kcyhQBKQ4SY=
X-Received: by 2002:a2e:a176:0:b0:2b6:a804:4cc with SMTP id
 u22-20020a2ea176000000b002b6a80404ccmr414028ljl.53.1693522594650; 
 Thu, 31 Aug 2023 15:56:34 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a1709063bc700b0099bc80d5575sm1223528ejf.200.2023.08.31.15.56.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 15:56:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 04/11] target/m68k: Clean up local variable shadowing
Date: Fri,  1 Sep 2023 00:55:59 +0200
Message-ID: <20230831225607.30829-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831225607.30829-1-philmd@linaro.org>
References: <20230831225607.30829-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: pzsBMYX2gX4Y

Fix:

  target/m68k/translate.c:828:18: error: declaration shadows a local variable [-Werror,-Wshadow]
            TCGv tmp = tcg_temp_new();
                 ^
  target/m68k/translate.c:801:15: note: previous declaration is here
    TCGv reg, tmp, result;
              ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 15b3701b8f..f69ae0e3b0 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -825,7 +825,7 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
         reg = get_areg(s, reg0);
         result = gen_ldst(s, opsize, reg, val, what, index);
         if (what == EA_STORE || !addrp) {
-            TCGv tmp = tcg_temp_new();
+            tmp = tcg_temp_new();
             if (reg0 == 7 && opsize == OS_BYTE &&
                 m68k_feature(s->env, M68K_FEATURE_M68K)) {
                 tcg_gen_addi_i32(tmp, reg, 2);
-- 
2.41.0

