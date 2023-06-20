Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp199583ejt;
        Tue, 20 Jun 2023 04:11:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Qii3xfVKGorLVLF5CWuT5U86lO00KOeV0oLv11q4f02TuZy8sBTVPdC7n7V5qOsBFYV4V
X-Received: by 2002:ac8:5945:0:b0:3f4:427:dbb8 with SMTP id 5-20020ac85945000000b003f40427dbb8mr4445153qtz.2.1687259465748;
        Tue, 20 Jun 2023 04:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259465; cv=none;
        d=google.com; s=arc-20160816;
        b=uX40CTxLgJQYmg93+VEqpz1rROOsdNT9zTHK8pq0cf5s/Qp6USgMNzv/Mkui+tomDV
         UcJbm0uNQnmfoaCH82kNCqy7e4RNGtbTDcwxQRR0fyJ2U+ICFZmD+RQUQ/ITyn0DcL82
         h+OwYLhg/T1PQ5NSxDr8J/H6HaLqM1f3ooE6kaLOsuby47Lnm8ZiDCGLHoKcUEJ/N94K
         12fzlIejt/iOVw3F/ad8Oo2qYAw1tln7GN9X/wjFQF/zUYBkaFciGCKVEk66jiW8e86x
         nroIgEvoQM8ibfE7XNr0s5lba90VYq3hkb/DyQdpOnat1XB4aNIPEG28Q68ixoQib9hc
         2sCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
        b=fqlw4wyKewS6VHTGsg/JMwCL6Qdzv0AFih1SMxPyZyUqYGe4lLY6EY2vwFGkMN12nt
         qICRnfxMct/4+C0Qk6tDDn907WWVOluYuBFcTqopY1tiNxLk3Mqf1F8pKXeiEb9fOPky
         Pyz24NKqOmbQiSJddsc0XKZjPamn62NNXQyU0irTemSb7zb8kMVqqIMXcSZZDlZDRcy5
         48uhVOe75kmKLmQpi4WldzSyVL9WyEajYk7fPgFc3XOiniTvHVckxn5QM27o0qA8AXQT
         su6JaajYT0HGm64q9iuujCzsmiCjCDuyOaQJWMufK1teuPoNdjclCpG5AZkaXVIlXEae
         njLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mMudJ280;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t29-20020a05622a181d00b003f200130581si698211qtc.128.2023.06.20.04.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mMudJ280;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBZDr-0006Ik-1V; Tue, 20 Jun 2023 07:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDn-0006Dh-SE
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 07:08:27 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDm-0004N0-A1
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 07:08:27 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9891c73e0fbso143570166b.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259305; x=1689851305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
 b=mMudJ280WURUhhZmKay2iYZ9h9vgrmttnAvWPMP/4jlcK60Upjlc49YAB+87E9KHWF
 Sqp0bOS76WYhZqFArpqWbrwhR8COmtBNTvd3jMn7qj+XSbl4ScaYtOU67wf3Ee9Z/IXf
 UerTlc1F1XhT8XrVFkTke9w/rGYAwksa/2/FXxCqBnXPe3qiqdajFslIAentfo/Y/XPt
 gSD+ygd1xwjNyVk3NXGslRjljuLNCaGXAIwEeK3i+orClKp3Yiu7dZ2U9+a87d1jIQev
 qWVaTTB0hvxlSsXqRLtQaYOGNJPYtqPuFw1rBor8wNi+uxsM+epTjAzs8hfIZI+otkOS
 fgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259305; x=1689851305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
 b=kjqIk38SoAzvEeMiXfJBd1JGkcnK8dZAXJf9hEsQTTcl24qGUrFEIzwSBwZ8rKgFaG
 odS0POMmGtUGeg8UFvGdtgWhvEvDnhi2aqlfgPWm2s/Dg8xxFe2xvsCWMWEQKgcRMHW6
 p1HVdBE+qT/Wi3nQmHn+4Jux9U0XQZvx1trOTDdKcLd/3ubXsH4bn4W3zkiJnVjcqsZs
 sGZkq8bG3onQ7GmZbkf7+o38/0VRa+KWimuVGU14YYKxGqOAEoeh460FzZ3Oh8R/bPve
 Yvpg8BjkuAhzYzwUgZ9B3hcCv5MIGY0+Vy+hCIJSIaITSkqIZwILVND0mrTexJW/CQyu
 WBhQ==
X-Gm-Message-State: AC+VfDyvrg1P9iyMi+izRgLyJ0p1AHKQHwoDN5wbfX3RZsbS/qiCY+9M
 XxUgFQrF+hAvpJT5ZBypi4IV3IBksiRTW+cZz6uYQ2nX
X-Received: by 2002:a17:907:7ba0:b0:989:4b:e69e with SMTP id
 ne32-20020a1709077ba000b00989004be69emr2732973ejc.4.1687259305002; 
 Tue, 20 Jun 2023 04:08:25 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 17/37] target/arm: Use aesenc_MC
Date: Tue, 20 Jun 2023 13:07:38 +0200
Message-Id: <20230620110758.787479-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lykdCh+kTAxT

This implements the AESMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index d2cb74e7fc..1952aaac58 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -124,7 +124,20 @@ void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aesmc(vd + i, vm + i, AES_mc_rot);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1];
+            t.d[1] = st->d[0];
+            aesenc_MC(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            aesenc_MC(ad, st, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1

