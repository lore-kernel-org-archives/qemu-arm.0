Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp3291512lfn;
        Fri, 29 Oct 2021 16:19:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCNF1/erkNdDSxAXKBikByor6OJ8q7KyskWfklNHXIlfBDpzQNAUrPQzl7doowiMQ58ce9
X-Received: by 2002:a9d:1b4f:: with SMTP id l73mr10999080otl.200.1635549553684;
        Fri, 29 Oct 2021 16:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635549553; cv=none;
        d=google.com; s=arc-20160816;
        b=tnOEvU46h/GCpv0eHs5gN8ngk0cfG2RT6T8PrO091gTys/nT0iS+3c5Gez3yOFlT0D
         iafWv/yZ1rPkFvl0xKcx827KsO/kKtI9rkwIaw8S/BLv92lt039iTzaD/aOUCVdDqjKa
         mZDpDtKHiPSwPjnKDfvI+HDs8s69SqVXXtd/yd30xSXUN1Rf2PPnqL8i34zPCxRNLVzy
         8i/1/ZyKkRaw7Mg8mpXJsqEfg9dcYn7G4hMvwG9lQg77UJG+AiGC5ibKlzAtXbaGkV21
         IW8qV3gWQibKjPxUL9i0zbTdR5g7Xi5d87Z5WpjGE8qZRhQKYnTyEI/pxolgtchALjzk
         XCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zo5TdWihX0fqFGQkJwGnLAD68vX5IqLcZuqWCOpy/Ho=;
        b=ETF3KQH1lrXkq5Aa0YXlWOGkMnUl792FvJShrsVlE6JceYMWZ5RO88QVjVmgQfV943
         gFtmGtysiBFjuZhQgBjA0JrWYKhf0DKqbA61Jy9ms5PY704Hpp/zJS4moxegcve80ca3
         NqojCKGmt/UVIlcOAMGLTLiTz2qfrohZb+hP6/fV8oMtbagF8wb4Z9zD4cyKNxewlR4Z
         s30LVx0yvDDF2TFRniWN7/WcSfMHeItI8BrBoUIdss4ry0a8qffua6CtAwGLRTWTGdmW
         BqMEaaXwmHpyKMOgeE0TiltvYFmMwHLG3k5orTqsrFl3UF4HKCJiKAu8kzdYwcTXJPTS
         u3ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=J4Iykq4Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si5978902otp.344.2021.10.29.16.19.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Oct 2021 16:19:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=J4Iykq4Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mgb9U-0001l9-Rl
	for alex.bennee@linaro.org; Fri, 29 Oct 2021 19:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb96-0001Lc-Oy; Fri, 29 Oct 2021 19:18:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb95-0006hJ-1P; Fri, 29 Oct 2021 19:18:48 -0400
Received: by mail-wr1-x42f.google.com with SMTP id s13so11980771wrb.3;
 Fri, 29 Oct 2021 16:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zo5TdWihX0fqFGQkJwGnLAD68vX5IqLcZuqWCOpy/Ho=;
 b=J4Iykq4QB5zQtPouXxEGI3R/wbKU4to04JUk4VDaeH0ISOaMify3nHBI4oll8ttpzq
 IA11pkuJYaBxcAQLcqCqj5IZmmkP6kn3ZiRHFpnKu1k5x5Pw2AvUx9GLAW6dbxxi6wfW
 1eFx7abc0HUhAGQRN7IKDcQ6oXYARP2OJ0XhPO3UXcN7PoHGlyyfrfPYVHm/DMqSNgSw
 CxQ7mWugEueKTXxF6tncBuCE+XyPhuXslb5md7Rm9dpyjNeqf/bmRd0APSRQXj3/Wrd/
 iGy78lZQxKsfqWmA7sTr6VRaFUzBea5bVdmqm09PE180kQHpn85h3Sc8RLVZq7QuxQun
 wcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Zo5TdWihX0fqFGQkJwGnLAD68vX5IqLcZuqWCOpy/Ho=;
 b=ZnI2fMrdHKY1yavg7XqaXYP80x1j+GsjfeL4sOY3T/pGiHhelf5y8Gwct+W/Cwee0p
 9OjUGVkEsPujZRtc52scQOmfKuc1u4KY9FTQOo42k5uuY1E13ix9svG1woGl6VL43355
 3dYxftmQabzyQ8Vk/shudzn1UW35kora09GR++G7JLk2JuJ+lJN5mD1TyK88pKzsiLNJ
 TtSc5Xbo06kQRjGcc3hwabrCS+kRrvH+MsmX6Qsj/givjwY5FMiYS29tTHr087LnVrAU
 zRDAs5bMwf5NNwocCeU5nQR/A6lqxGe/MV/5p/0lfj/VRv2J5/V/bxi88h1U0rj1baoe
 wEqA==
X-Gm-Message-State: AOAM533gpWsPOtCqfzpCOVeQTR1a58EqPiaGhszWYiGrO1LkkXf10bpu
 5pnUH3wkofHrIKNDRVjp/oPdXB0lpJY=
X-Received: by 2002:a5d:680b:: with SMTP id w11mr10648818wru.345.1635549522086; 
 Fri, 29 Oct 2021 16:18:42 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r10sm6894065wrl.92.2021.10.29.16.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:18:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] target/arm: Use tcg_constant_i32() in op_smlad()
Date: Sat, 30 Oct 2021 01:18:30 +0200
Message-Id: <20211029231834.2476117-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029231834.2476117-1-f4bug@amsat.org>
References: <20211029231834.2476117-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ingqwgEFmCC

Avoid using a TCG temporary for a read-only constant.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d6af5b1b039..083a6d6ed77 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7849,10 +7849,9 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
         t3 = tcg_temp_new_i32();
         tcg_gen_sari_i32(t3, t1, 31);
         qf = load_cpu_field(QF);
-        one = tcg_const_i32(1);
+        one = tcg_constant_i32(1);
         tcg_gen_movcond_i32(TCG_COND_NE, qf, t2, t3, one, qf);
         store_cpu_field(qf, QF);
-        tcg_temp_free_i32(one);
         tcg_temp_free_i32(t3);
         tcg_temp_free_i32(t2);
     }
-- 
2.31.1

