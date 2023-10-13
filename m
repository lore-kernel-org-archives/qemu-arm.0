Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1333305ejc;
        Fri, 13 Oct 2023 00:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZU0yWqQCGSC8mlvXlaxOaAldnFlb+Jjs/C692s+5S8exN2OF8H0HZ9nNYR5fcrkedxLbn
X-Received: by 2002:ac8:5f8c:0:b0:417:9431:c61b with SMTP id j12-20020ac85f8c000000b004179431c61bmr32051268qta.18.1697183908022;
        Fri, 13 Oct 2023 00:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183908; cv=none;
        d=google.com; s=arc-20160816;
        b=GFe20A5AX9uR0mPvmcnMRpPJyT0RiqrYhIulXXPpKDdN1bsrsAqL0UKA+3G3OQpddO
         YGZcxVG1LJW0+dsQannDylYPzdZwxicmFAHEFt9O6v5WBeZ0trB6UAvgB3zoVMTp6geh
         SZbOsrcbGGTwJHqABaUT295ABktog1tzYlNtGWLZyrSb7MNCuS/dviDa9JWtgRUMxs2O
         KWXgqwxnDnr2pUmtJ8A23Zu8UB7TezpnVH381+S7V4Fo3/6kY7deu5gExKazrP5NB5Rz
         VddpOHe0wTE5MLhqVvFqVM6UjfJPl99pYYuoOofYNqMVtpM3gimR+zEbvibDjYv64xhM
         3jKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RMx3/5vgsTaEtEgPUucXxRgTomEP574B32d5MnG3ZJk=;
        fh=lAN3ewggoeNY0L/ap0zquylTO2ylw0STTp2NOOj+9bo=;
        b=mbzjRrkzxrgRhHXLcXG9F3MhBI7XWg726Ul423lLfIL9YI4PjRMPzn52W8nSlwbi6Z
         IfIgWERUFrPaYOCv6OihG3x+A9NSqA4xAKRjEmYrJQ5uj3/705Ax9tFAj4UIqjg8zOXX
         C4jFTE8H5RiZ+V18BbddTKG3DxTznP9+TL8OIaB1/RbFcWLWilsS9iHA3ds8BJMi7wTS
         lKTgDy5vT3zA8QnKCsi43vYko90wZhFwHElBmRunHgAlOGYFekrI0dJ3ETdD1V++ICDp
         nSSlRiHSDoQMSLyY3WJG3zWkuVNjP/zIUefGnLn6dSVOHQIYCGrymXKXcaCkzYX7nYa7
         mfuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U3gdZZfT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020ac85803000000b004199186909bsi807906qtg.722.2023.10.13.00.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:58:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U3gdZZfT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCxc-00088b-FB; Fri, 13 Oct 2023 03:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwr-0005sA-S9
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwf-0004sN-3J
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d9d8284abso244043f8f.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183451; x=1697788251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMx3/5vgsTaEtEgPUucXxRgTomEP574B32d5MnG3ZJk=;
 b=U3gdZZfT56I9FlhBfIF0/5HcAwfSF7P7AWqQLR2EY6lIsPBraEHXlAIJMP1iWg+MZZ
 cTpqaK9IeA1FBAvs1X9SV21V3fbkOkoGXewuNxDRNgqktdPuKc4sh4aurtMNWZJxWitD
 qEk134lPBk+E5bQeSeQm/FSONQEPIktgogWGGzNgvnDQhjRT2TlmVXIkf/TVp9bVAXmV
 KtscAT1BXWalOvX+VIveJ6cWGmtLOIlKKtLTLgHsKwJfBGgfeJoiyey+G9P3hS1myzH0
 lkOx8Ck5SEp5RjiuT8YgrbSz2HYl4Hlh7d76R/IjVkxoB46E45HyZLPAEzdoDjcopUmn
 x9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183451; x=1697788251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RMx3/5vgsTaEtEgPUucXxRgTomEP574B32d5MnG3ZJk=;
 b=omhQLiduDyu4Qi2MNv8H4lGfa5Wbdd3NPifOgTTScOzotgc4JthMzVnucEcpsMxLMl
 O95OQ3og5/WdBN1S+f+USBe8H+BzhRUPxlqhZtYsUKtsATAIbyDGYCegUxDndzyPldNg
 3tMl0rfOgs4SJXdxmB8Mt+glRzC/eBfLfenMDAYyGkts1JxcmmgWROpSvekLXbvGwEez
 leM8JOCXLs9JeYUQVouWJJUvei34IFU2gA66NhScXmCW2Jn0kQTlDdSTlFfYCyetc7d4
 vrsf5592K0m5bQAvLr/Bygh6Amuh6HOldwU4fdiorvc0Qb2RhksbWaGF5qxPyJLl0HPK
 GEFQ==
X-Gm-Message-State: AOJu0Yy9iGScImq/L08a8h2aTHl+6T1j34krY4XmM/s64GAJ1MzYYQQ0
 zy/22xin/qCMHEtc00U9WcOsMw==
X-Received: by 2002:a5d:4f10:0:b0:316:ee7f:f9bb with SMTP id
 c16-20020a5d4f10000000b00316ee7ff9bbmr22502309wru.65.1697183451684; 
 Fri, 13 Oct 2023 00:50:51 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:51 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [RFC PATCH 33/78] target/rx: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:37 +0300
Message-Id: <8e229ef043423876a2c0fc906a513382cf6f9205.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: NPqBgASf9w9F

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/rx/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index f8860830ae..b00c0a21fb 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2232,24 +2232,24 @@ static void rx_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 static void rx_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     switch (ctx->base.is_jmp) {
     case DISAS_NEXT:
     case DISAS_TOO_MANY:
         gen_goto_tb(ctx, 0, dcbase->pc_next);
         break;
     case DISAS_JUMP:
         tcg_gen_lookup_and_goto_ptr();
         break;
     case DISAS_UPDATE:
         tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-        /* fall through */
+        fallthrough;
     case DISAS_EXIT:
         tcg_gen_exit_tb(NULL, 0);
         break;
     case DISAS_NORETURN:
         break;
     default:
         g_assert_not_reached();
     }
 }
-- 
2.39.2

