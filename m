Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8223C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 13:17:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weYLQ-0007e9-Qd; Tue, 30 Jun 2026 09:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLH-0007aR-Qj
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:35 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLG-0005sx-A0
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:35 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-693c69b97e7so8606694a12.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782825453; x=1783430253; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=i515u5fcJ2xJv3guN/KxbHHUwWapzzTtOgOfsQi9rc0=;
 b=T0pFGkU0EyHPFkw8rrL4/u0/HDEhKq+0rmo2WlxHLbtQu5lxDzgARM49lR6G9p05FO
 nvy/cE9KXx6ZqBZCrx7Vcuc+36mNwwbUeqf4bZCovWGgtAhlO5dWZELXgiMoBeBmJX2E
 ubaEaNPSQoHJZF4R62yVstLb/OXbn2O/K3ODQQEbZ/q4u1tRQ9yIBs00V/dy7z4diemF
 0+/W5hzYgEZx4TQKJu/nlDTm/ExNvTJ08/JySRQ2zw8L6ztEpKUySnm3ujldH4K2wusZ
 reKbFkmESi+9P/mqqsjaNwkoHcP41QRnAWGRessuWSpcYciQTfPnNrtb+Va2HjBSu4Lb
 C7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782825453; x=1783430253;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=i515u5fcJ2xJv3guN/KxbHHUwWapzzTtOgOfsQi9rc0=;
 b=HmxqmE0EFbh/b3fpWnhaeGrcaCv+fUGcDIgdSahS4c1pavwGt8J8gLdgQqa3riR+jg
 imLrPx5XpymNqsJoBoBUszrStcIklrrGHvU+QVl5NfYDku+QzZZEeXv/61LeMY7sZWEO
 +fNGOwfRtDTfzLXSRL5G2WTyfu2RHUj4A+71Tlv0EhivEQrmYeyE0beLN+6PLjYMwNwN
 ojMfySMhvdcCFlYQJ2HudKhcv94dsBxxAHoOF7PnnMyhs5v4J8ISMNDaFoS5l83Xwgj8
 tA7PqXZduVzfoD5QuStf9PWaMGbaW+r2t/pjgtMatO5PFjEi2gFiROnUVj4K6wE58uZ1
 TMHw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpjbqVhgRXw+IM/vt0HjzopWBQWAj7faxEWUuOObpun15sVDlE9H+Tju/17Af9x4NgxaHZrUOewUg==@nongnu.org
X-Gm-Message-State: AOJu0YxEUkz9ifPwnBB61FRqhYC5MQmVOz15IbDK3vQ7nmEopBOrN0DB
 EAeysHgeiCP6WqGFkhYvwkvx46+U/HtlLOQh5DPhgcMyF++a4oJHUa9lV/o2hZWmBQk=
X-Gm-Gg: AfdE7cm2A8RvJBmnCImlMt/Z1gq75xTPsDP8EMO6/wNh7iVz0fTs+Rz5rv1duSAv0aS
 woXNmg9ElVI2aUYheiyONSWtJH2hoFSYvRahJzm85P9umPTNzaZZVfDGy+lNltP85ElK+fgJXYY
 X1NQ9kPCnL4IbYoisOnqTtm4AxRMDkAVXPy+yF42d3/AuNQhrMywaeeo1eU8edyoZjR2cl3Extr
 fCA5SeNFAjwxaZtePhtdXrf2aov4TsFG6TuAYPzgqLRBwrCIV1m9leRyl2xUmQu/4Y1eqqJM6a/
 mRBEMBNoG48oxQEZ3b6AMGk365GXkedzMkY7cyrZOASHV6qYHVo548wyIZkaKd2hIEsPjeX0NXJ
 cip1VosjGz2Zwh2w0CeKU56+3oBhDFXuVzb/Neb+92F9WWRhGvg0p1UjMQLg96xvx/DAsZwWXlD
 6+gclY5+4FvZGg6j8=
X-Received: by 2002:a05:6402:3223:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-69879e3e43bmr1650213a12.21.1782825452770; 
 Tue, 30 Jun 2026 06:17:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:a648:9a45:1aff:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6987c3a42f6sm1201535a12.6.2026.06.30.06.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 06:17:32 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Tue, 30 Jun 2026 14:16:34 +0100
Subject: [PATCH v3 3/6] target/arm/tcg/cpu64.c: Add FEAT_FPRCVT to cpu_max
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-jmac-fprcvt-v3-3-f4840d5e0a7f@linaro.org>
References: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
In-Reply-To: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ed1-x52d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/tcg/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index f7a920a202..f259e82dd3 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1269,6 +1269,7 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     t = GET_IDREG(isar, ID_AA64ISAR3);
     t = FIELD_DP64(t, ID_AA64ISAR3, FAMINMAX, 1); /* FEAT_FAMINMAX */
+    t = FIELD_DP64(t, ID_AA64ISAR3, FPRCVT, 1);   /* FEAT_FPRCVT */
     SET_IDREG(isar, ID_AA64ISAR3, t);
 
     t = GET_IDREG(isar, ID_AA64PFR0);

-- 
2.43.0


