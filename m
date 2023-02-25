Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2640464ejc;
        Sat, 25 Feb 2023 01:25:27 -0800 (PST)
X-Google-Smtp-Source: AK7set/VzZ6z870jhJEDjLVf/Ppk6FMh1bBlRV0XmV8kBHph14/B0vxISfkx7d2mxZAXQenZE1gk
X-Received: by 2002:ac8:5c8e:0:b0:3b3:7d5:a752 with SMTP id r14-20020ac85c8e000000b003b307d5a752mr19707488qta.50.1677317127084;
        Sat, 25 Feb 2023 01:25:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317127; cv=none;
        d=google.com; s=arc-20160816;
        b=M6qW/PYVhBH3gT5bb5n8aVVWcD28r0AubzB27xdBFWHKZ/lKaslqIbk3wa1ygCIzCq
         1S/eJfNfjRmG7JeybqbepGpGgK7RQsKnjuHOoBq+FCA/uEp/qUM89XGp77LoWuZuHDxW
         nLcqIQVT3HWE3k4qBYUZ635rhG9URrjCet6nEe/kfPTFZq/Z3RWoI2HzksmUFIFflNAH
         v/tcxeIqNbYYgrkDtBTR/gv3ZzmMlFmg8f7zODLaU5Xr/I+PPsYInjVWrxcSnbPLg/pp
         enOvy4hfmZGo+V7LMpNDMj3dHdSfyBaFKMBYF6ObNHQ97zoctIqmna4KMIIrdSCNBVTl
         nReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YHoTHrUgBZpaOPEfBJAi/HMPT06pVs2AARTKGv//H+s=;
        b=hdd2PCDUOmobU4TnTPBDPPvpgmxq24p3hQ62cUq9RJLA45CQ6zEFFnYT8Vo3ZYGGkI
         doZE2vlxdSxLcwcgq7ocRAcO1kNj8qMuXcPjoy28189almBf24WMawgEPuiUyl9yhcZn
         z9P2MqwAG40Engkwff+uRqIczUVhKO1Cgeor72MZV3g2mf6Ei1Nb0J+2FCd5Mh16LNKn
         sTc0fYVE8K9CB+Qk9qtxtQ3O1GS+TX3Jv0NQno5gH+tz5xRoWpLj4nH+twLegz90Jhfd
         dT8LPqfwUPkCvPjhvtq/8Y2Mfuw/G6raEcLRTlYDgSuozZ6jbneGf09XRSU52u2zsfMg
         2PfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+jflMy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05620a280100b007390f389166si1614617qkp.283.2023.02.25.01.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:25:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+jflMy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqid-0004vM-Vz; Sat, 25 Feb 2023 04:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiF-0003r5-Ei
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:19:28 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiD-0002uX-Vl
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:19:27 -0500
Received: by mail-pf1-x429.google.com with SMTP id fd25so866313pfb.1
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHoTHrUgBZpaOPEfBJAi/HMPT06pVs2AARTKGv//H+s=;
 b=g+jflMy5QF9Gh/OL/ohI7+fjhI7M0kP5qvxSb5g8UT9M8xaGcXCe9uRs/lwuNrU5rE
 5EqLG55PBjl0NmaNSOSJ+QYhGehD8Qg/SpDVTV2H3leFXs1sLcD3h5eKKWY0rhKAKR+z
 o6N7x2+wTQS8StN7D4pLkB/xW68whQYVoA3Sja8BGhqlOGTbUdBovd3EprqTe5+AKfNq
 w+IJAfDfKOh+vNXBoPjoHkZNH9Yc7Kei8PdTmnJR9d8XqhOTqSn4SYlDi9fZowdmsUIp
 1m/pH/993a/x6gWm0+kIwhMDk1CHFMfkL3Y0LvGQ/k0/eqx1i/LQxKV8jWEtbmJruy9O
 a3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHoTHrUgBZpaOPEfBJAi/HMPT06pVs2AARTKGv//H+s=;
 b=3Ie+YJpLaA9Hb4uw2yBe7oNnIXszbbJvinAujSA53/wWftL9eqChg4g6X0bp/c778x
 vnFMon2dgNVzW+PIUg5Od5AyD+6yAipj7M/7F6YFG0GmcXR+m44pVn3cdWvrJT4BRcC1
 qgKSJOmkXxczrqkRoj0rArh5TrBKQNRIHh2JszHgjR18CDN4VV2xnh+0xsXEoc/gG0g9
 pWBsW1lxeeffWRSsFfSoc21749ks1k+aLIK9L7y1ll8+d6JpPME7YLwLjo0gDeY2F101
 0KqwtH+aRCJmUg8cwgk6uADXy7/DOc4yQ/fMYpFaAhhWN1ooZqgi23RhCmx/SVEXTtAO
 fdUw==
X-Gm-Message-State: AO0yUKVf5bHEzqOotf7492os+f2+C7jcJVDvAr+FiKfVcbbjwkFxaEiO
 /ynoBZEcYg69M6ZG3KGRH+DFtA==
X-Received: by 2002:a62:6286:0:b0:5dc:6a64:6704 with SMTP id
 w128-20020a626286000000b005dc6a646704mr7309360pfb.7.1677316764660; 
 Sat, 25 Feb 2023 01:19:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 43/76] target/mips: Drop tcg_temp_free from
 translate_addr_const.c
Date: Fri, 24 Feb 2023 23:13:54 -1000
Message-Id: <20230225091427.1817156-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mAhtjkdnr6NW

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate_addr_const.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/mips/tcg/translate_addr_const.c b/target/mips/tcg/translate_addr_const.c
index 96f483418e..a510da406c 100644
--- a/target/mips/tcg/translate_addr_const.c
+++ b/target/mips/tcg/translate_addr_const.c
@@ -30,10 +30,6 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
     tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -54,8 +50,5 @@ bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     gen_load_gpr(t1, rt);
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1

