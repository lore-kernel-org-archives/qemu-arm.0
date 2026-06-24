Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5372CCDB47F
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 12:46:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcMzT-0003Tt-PC; Wed, 24 Jun 2026 08:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcMz5-00038f-Ip
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 08:45:54 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcMz1-0006OG-Kx
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 08:45:38 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4627adcf4d6so781718f8f.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 05:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782305133; x=1782909933; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTyS0BJ6s61nQ8v9xmhKEeGuAQFe2qeJiUF8nIOmW9A=;
 b=mDXOB3Z0BnJexJCzAgKVbieibL0iYFzagyTLOZekZMYiCdpvp4uPxlptxQNgbdpGUG
 Y0eQJ5ctsvw1pn41r180RhJr44z9y5X5fFomfBs/zwNemH5gHTf2c/+U7LiWNsckcioh
 OQK7OphHsZ/xLIGlPFRCzsBsmXO4nYCj8jeGpyOUns+Yr282tVGbOG2hqMQCF4MKmSOZ
 4iG8y8MwRZnb6wgkHRahoRXx4E6eqSOXUG0m9uZk7k/WSaswD0FL49Q2QXtFK9ArBYHk
 8wVKA3RzjLxoAhtatFlWKyKKws4RNUF6km80b/iJBwmlzvISMltsHEOcQq9WMJb9tLu1
 byqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782305133; x=1782909933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tTyS0BJ6s61nQ8v9xmhKEeGuAQFe2qeJiUF8nIOmW9A=;
 b=cjfQmae4QDGWK9Vc2BcQnmrtQB+WnxyIM/SsXXWLwvOZqXPuv0z0nIPNwCZusuYUWR
 yJEF/BfCDQ/hPZYq+dNVX8KQjgwCiuuXEVAtLBv6Lt0uia0vjFDgo/N1LbtCUbYxyAA8
 NLvy3zbEeTgTgrZoGaDPOahqPKuO6E8rIZm7Urg+v9wQL/5bQsJMWUNyWUZ9HZDwLnA0
 Apsq4yLt3TR3+p2o1mrZEdGRoOVEYelOEBhHkZ2iwRUNlTIC7S3vZ4P7GVLklJHiM3v6
 kYK65SF8bSV1zjjRzJ/hD1she2MrC6w6IEepg+qaT6wGMIqWKxf/11/mpNUIMKKZ4Imk
 NbHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ZMReC+leQqzmfVGv9YBMTiAFKXGOyzfIYmnFBtHkkOFxGqqjIeSPNnld9K/srirGN7mGRf+skqw==@nongnu.org
X-Gm-Message-State: AOJu0YxK4JeggL1Hlqo3vQubM/MiL8bDXpyO1PCpCMEy4H4/rLU/2AVO
 4NpY+0uT+f9KcgSh0eYnqLv1C8cEclDMRkNxUs0H1cavxBrkxQlEgHJp6+K819J7s+w=
X-Gm-Gg: AfdE7cnC9BOrW4HbjqWLUZ/u+P1fCsUc80/ZTvSquUZ9pnyKY8EtNYjIELSfVwnCr0q
 vvlUXmo0U9iVUKfE8HNV6+ouBi2nszUjUi3pLocUG3F0Nqxk81KO9QScqJoKzl9n4+sI4QG8hTY
 7ACHAoOchLt4R3m6v21M1b3UIqJ+T1XKipniUlET/BACWlf6ds4Oq4BXYPls+Pw//YIZNk8G1jj
 3PCm869ZQX74MJaqF0sja0r33OcR/fFOcKT0323G0oK2DKm8XtLLvBoOfacyhuLVFLBnDA4tDTt
 v1CUM60wBK2+u9RX1yuc7MGX6kcYbMmz/X+Je3BDL4X+guzROAo++9aXTGZc2cIQMCobCuKCeQY
 VGKdnuF0MVoiAj1r5KWAfcLLY8h3UHGlaPY+rpeEqJcbXnUJAPw5ZOS68SSzVnYXo4pPZyMr01I
 1HRdqPjo8xuusGph120Oxvpok=
X-Received: by 2002:a05:600c:190b:b0:490:bc46:1a58 with SMTP id
 5b1f17b1804b1-49260873583mr44568035e9.18.1782305133147; 
 Wed, 24 Jun 2026 05:45:33 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924923c862sm349690595e9.7.2026.06.24.05.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:45:32 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 922B75FA60;
 Wed, 24 Jun 2026 13:45:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 6/6] docs/system: add FEAT_ECV_POFF to the emulation list
Date: Wed, 24 Jun 2026 13:45:27 +0100
Message-ID: <20260624124527.1018912-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260624124527.1018912-1-alex.bennee@linaro.org>
References: <20260624124527.1018912-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

We already had this implemented since 2808d3b38a5 (target/arm:
Implement FEAT_ECV CNTPOFF_EL2 handling) but it has its own feature
name now. Add it to the list.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index a8072ddb671..2faed5c289b 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -60,6 +60,7 @@ the following architecture extensions:
 - FEAT_E2H0 (Programming of HCR_EL2.E2H)
 - FEAT_EBF16 (AArch64 Extended BFloat16 instructions)
 - FEAT_ECV (Enhanced Counter Virtualization)
+- FEAT_ECV_POFF (Enhanced Counter Virtualization Physical Offset)
 - FEAT_EL0 (Support for execution at EL0)
 - FEAT_EL1 (Support for execution at EL1)
 - FEAT_EL2 (Support for execution at EL2)
-- 
2.47.3


