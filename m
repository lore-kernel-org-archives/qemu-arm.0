Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp607264lft;
        Mon, 20 Jun 2022 11:11:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1srA6Cn21pUvFarDyw0UzTW6sKGcGl9nNTbXQTw+qzwOKgWJZelg1U2n70Au3X89y8A+6nt
X-Received: by 2002:ac8:7dd0:0:b0:305:3497:1b66 with SMTP id c16-20020ac87dd0000000b0030534971b66mr21083442qte.270.1655748687131;
        Mon, 20 Jun 2022 11:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748687; cv=none;
        d=google.com; s=arc-20160816;
        b=lpgcgryCkdYVn27FBJ2I65BaIoRSVRI9fQ/5H5SlaOsgU9o5jwH5PPB+biylyYLSeh
         eOMxFi/prqEbzQyB44eqEKbxvDnR7swBOmuKKhjijWSeqdm3JyVPOdFXJGRXkdOsVCtH
         9fvXGUWczJIr8HFRTGY9RYPg/qIbCu7tQhWm60oKaaKPKGuGcNee58NBzG0F3eVqgc9f
         Tlg5I8Fy0VOJdm8BhOuyqpqhdsWxucq6cv6/Ffy1lC+ozUKuX4C3XQFPpFwvxrDd3Udb
         50YS8Al9INdiBwVdKt2eVQl9qJNuqu2F+jwqlk4ly20libYDXldCsdIZZfrDwXpgqmPs
         Li9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
        b=Ct8Z4GAIiCEzv18fwAExOqgLcDVPAckcHUvjHLEpQjIfQoRbpa3EjccEpErbX2DOTB
         5Ir0jB9bfqnDjOAnF83eZSjvxwZEthJm2n3u8icL5ymoYI+Xi3v1OLNFner+bXN7cRG+
         TrRH01gadmcgVrAGIZF/IGw2Vjeuw0HI+/C2CbgoBBRp4OS+OR+Vbkb4BVkzGh04VOPq
         UY5G95BZ8cOAv0W6hZyoPe3MzA5olmoqtvUXs8zcWVHNL+5/gLKw1O4EsyjTvbDP0GPz
         xY0gn4L60yU3vQkxPpTsf0cSHZqWw7CDnxfY3s0/dsMlwXh351gqxuV23NKi2iGR+BkN
         Ywwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqLHtufP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2-20020a378802000000b006a69f7f782csi7678860qkd.194.2022.06.20.11.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqLHtufP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Lry-0006mN-KY
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaO-0006Oi-Jh
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:18 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaJ-0001W2-6z
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:16 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso10973937pjh.4
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=FqLHtufPEwI0ojuZqGeNtIQtjwSNgoGGTvDt1Dim4lGMA57q58elUyQaWfk1gChB/6
 zg/k9/dLV+qP4FmYntJ1OGVUO31llx3vYcFr8Fh9qTV91tjecVTsidkOUnXGh4YKfENc
 PNf6FgeCZQNjm4UL0vbEKZjESL9zQOfT4gwNnRbkU1u5Rx0ml/WjXrkzwGvvJ1PmL+V6
 v4YijvMxarVpKPzmUxhuF6adHjIsHIins+WBkAdl8V6OWPs24Fx5RYzmhDhTrJjsahnH
 MMeYFbOEXgwCqA9rU29oA01XUvfqEXh+7FJOlPEKS8VBtSUWbnU6ybijD2nTwEyifHtk
 DwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8NNZqBa/oaHcQdJifd9wVEds8arqW1sbQgko9Vs+gQ=;
 b=x6mJDN4fakqXY7BBNR9GDcmjnhOIYuezoch9WvMLmYgcTxOfEVnYZbmk3oBT+ojffD
 dYSUROzU29J0gY5gqA8sMflONmgDHJ/Y9vq6uJqOVNHa5wr4oWSGxyMi8Gq96J42hYVa
 B1aEWfpt/oM0FGpG6kGHXlkVJvW0zXdkF8HxBBWFQleHZGWKdBtlt1Ospike2QJXzGPy
 dhHbmDPiTbS5k+vBgTxKzxciEAOmBKSkumkE+4wOllg0/wKi5Rs6ZSrg6B39YwcPBnu0
 /Qh/YYwRXxbs1KRHZ49NcaQiojIkPI+afijcQ2Ax30E9T6Rq3AZvw9Q3aTleneVATL8n
 035Q==
X-Gm-Message-State: AJIora+Ru+lC/hpKVdXlSZfJ9ZTa0fR92693tIqh/lsSEQOLyT2Lxj5c
 7h+Tk82pxyJEUPy/IZBZPh4BX0FzOEUEkg==
X-Received: by 2002:a17:902:f54c:b0:16a:e9d:c495 with SMTP id
 h12-20020a170902f54c00b0016a0e9dc495mr15129417plf.28.1655747589938; 
 Mon, 20 Jun 2022 10:53:09 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 39/51] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Mon, 20 Jun 2022 10:52:23 -0700
Message-Id: <20220620175235.60881-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jVFcbswwleFk

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e..f90359faf2 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.34.1

