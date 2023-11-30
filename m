Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp264067ejb;
        Thu, 30 Nov 2023 06:25:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvoPZwfQfSkMu86Vhp07kS5n1IPB6ConXzk15vprf9yfPnmIIpZNptpGiKzhzLFmUCRtu1
X-Received: by 2002:a05:620a:244f:b0:77d:5f66:f97f with SMTP id h15-20020a05620a244f00b0077d5f66f97fmr42704630qkn.11.1701354359336;
        Thu, 30 Nov 2023 06:25:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354359; cv=none;
        d=google.com; s=arc-20160816;
        b=SRwpUOmN4DqxYqug+vSn6t/gjrlSEyePVbPINktxxyzkNjXZwKyDJJnGC/M4Bzopcw
         AWaj7esIks2hka7UEXnU9Ev50+ZEfu1CCc6OaPmBVKNiV9/h4mdPyo2Rsp3Bc79jQxt5
         hkLmQY1aRSAxn2zqhDJlnp4vaLpyT6oviGZ1HuUX6CKe/o9WEn1+/gSYjzzD34las1V+
         ccWdA+3QGLdEr35W0F+jvub0cFRL+cBQiSbc6yel63PtHauE956UnasJcv0YsnCHsZRM
         ucIscOqr2I3AUtT7vfqdD5HDCal77W6+ZA32SgFbxgsAi2J3aeTgLYcdizpHC3RBi12b
         icsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xIkyywCV84pixVtgL1sg5DGw0uU59TDxgCkewEW8ZWA=;
        fh=DKQFoSm5rvXVk6AUqpSavFv+IR+qPwKdgcCOIx8jJm4=;
        b=UVGwY8PNViY4vPfA/aV1KQ6wmPG226cg8FCYfzX30ICZvz28mRZCnKma4vQjXSr7Un
         6Cs2Th3EpaCFDF4AULziwqK+9NbaHpkq33acKm1Qxu80zLZz9vzZNE+vEQPGkP8UQnpz
         LjC/iVP11dNWTDXx0MeOfaGqQ6XWvTq6ZI/aQH4wuGjlm1f3Yr1ewNLjUgz+H8Cs8Xod
         P6mMx2DOPxhnLYlBGWqBXCjTD6iDjOX/bAwUsw182fmXQIAsozzNrdJdfFj7iIiC25Uy
         b5AH1kG3k3LlkYkW2d7RJFSbuzcQQurjVZ27UHchevtApu4lChhFSAU0e5G+ufyWII/z
         +Yuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x+h5n80j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou18-20020a05620a621200b0077da5e26348si1062077qkn.108.2023.11.30.06.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Nov 2023 06:25:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x+h5n80j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8hzB-0006HU-51; Thu, 30 Nov 2023 09:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hz3-0006Gg-JU
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:25:41 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hz1-0008UH-W5
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:25:41 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a00f67f120aso139349466b.2
 for <qemu-arm@nongnu.org>; Thu, 30 Nov 2023 06:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701354338; x=1701959138; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIkyywCV84pixVtgL1sg5DGw0uU59TDxgCkewEW8ZWA=;
 b=x+h5n80jNYvLNFDbTDUSqEOuvy4Xwe7SIP3w4w6ZkMPz6gB8fMJbmlwvbpTD0JtKAb
 n4onOvvL/Jk4e2HLEgqp7Grk/d4mf3ao3nEAt2j+rTC0tFHTg1zUr7nWL5UGAZrCgNzG
 2JqOgE7ErniQGfZc4RiapsBSNt0TDEIsSpEMLq041dof6sltz2kjoADPbpWyhzdlddEd
 Idy1N6gYsNhbA+xWFlMr03u1aXjXZLB6hPYj+Bbq906kGMPWu6FxdrSKWSm2F3VsTi4n
 +lb5R2vRx0hQpexuk6qvr4wKocbBChflV7TiY9dUAjEcPntv54XlyAeCPzsAWVYjwGdd
 gCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701354338; x=1701959138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xIkyywCV84pixVtgL1sg5DGw0uU59TDxgCkewEW8ZWA=;
 b=SNg3Zs5WpGDBRr/uXF7w6M/DJisPl2gIL/zAzIukka/+NZzitjfoo8Mn+2pJJS6sMY
 TfRDiriARdL/HnZaacmebCPgiwLhFfvz6C5YGuL3Bo8E9Vh2Cjz8um4Dr6IUvqoaIfCS
 SVkiK3qXNXUpuxdsTEstAFOtS+X5VQAZv8m6h+GPNRr+XSP1AaSnXtieLp01DDESHHBp
 ZPrR4/zHGLVL3RAtaVxfImYZhYfWG/HG01WKjYv7P+/EbqpYbhFVgXpVOkbDOcCA3skr
 kgl4fUNGq8Pp4VTzVKYAARbikl6il2T6Wo+Wghrdwvap3WqKoLt0z1EwWnsuuRftM9ho
 grgw==
X-Gm-Message-State: AOJu0YwutciX1n3adeuKVc6kXi0yYGoBWUhdN/VVpveVPhDUml+GKEfn
 kF2o+RdvOCaK3H9JbvxXpbMLIw==
X-Received: by 2002:a17:906:738b:b0:9f8:2f30:d74f with SMTP id
 f11-20020a170906738b00b009f82f30d74fmr14711296ejl.7.1701354338665; 
 Thu, 30 Nov 2023 06:25:38 -0800 (PST)
Received: from m1x-phil.lan (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 n23-20020a170906089700b0099297782aa9sm726356eje.49.2023.11.30.06.25.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Nov 2023 06:25:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 3/3] target/arm/tcg: Including missing
 'exec/exec-all.h' header
Date: Thu, 30 Nov 2023 15:25:19 +0100
Message-ID: <20231130142519.28417-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231130142519.28417-1-philmd@linaro.org>
References: <20231130142519.28417-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kw6wvi6Si/gu

translate_insn() ends up calling probe_access_full(), itself
declared in "exec/exec-all.h":

  TranslatorOps::translate_insn
    -> aarch64_tr_translate_insn()
      -> is_guarded_page()
        -> probe_access_full()

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a2e49c39f9..f3b5b9124d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 
+#include "exec/exec-all.h"
 #include "translate.h"
 #include "translate-a64.h"
 #include "qemu/log.h"
-- 
2.41.0

