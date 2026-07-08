Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4738AC43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 14:59:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whTjg-0003HL-5j; Wed, 08 Jul 2026 10:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1whTje-00033y-7L
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 10:58:50 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1whTjb-0002yU-Hj
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 10:58:49 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so6148475e9.0
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783522724; x=1784127524; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PTm0sLsjJBeFiHiE5l451U5rV2CAyhUncotlao7jQhQ=;
 b=LQ7PiyFJRNpzuU/ghuYsS3g4hWXIxhKbutyrohQjZ+Eo5nA/7n035kzvTjCWrY9qXn
 lWlM1lm5mb8w5ZPjFx0GG+dXWE4JqT4d1alEOF5HyrbIxi/ofl/TMwuO5VYUK6PU+wNh
 BCos3IQo6pqsc17NIUxmsGTBJMYnNLVNEhO21HNbkVnNnZHTOoitD//91yrKBJ56CLWe
 z4Gk2C+MoglptRGeC/IyTnnQA7e+jXPlzhakzVMR4YoDXBL4g+IgKnfBytavihWMJfv1
 wihG0LX3iHuHldO2UDQ7pLZeW07FAIN92P254JCSGi08YjSLDQgGvRuS9JoHmV0hW12X
 Nkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783522724; x=1784127524;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PTm0sLsjJBeFiHiE5l451U5rV2CAyhUncotlao7jQhQ=;
 b=emszfW2SKtycMgG0XYqJHutug/lC0WldErdLNPUWuLLQ8V8WnC3Zye9i13yISSyt/T
 kiJLp5LWSkTaHPNXjyE4a1dF5IK4W0e9seHyyBUciDRXhgguzT8WF7tFu9s1fBdIW9B+
 tx1FawDGXnMR1zJFTHuERACS2ujCmfgec25/WaN9G2LXl+hf9u0bVr/xGXjy7hc8wRcr
 PZ/i4bPPMBTAlcmqDQxt0tddC75NjV5UZtCDHzzCaSzApAW3xpP60W6fmSQmoIndG97A
 mRVu7nAYklSA7RclQTOkbgQOAwE03qaXJ75CEWKZOkzMwSfGZG5uJH4Ca4b0Rpc4cEku
 m2Bw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr5vHeXbAxtzS9Nc2eIRUeZx0KAU7foavC2dZeAzxMC0cT5SoiYd2nYC8nQIgT9auZQQ4R54F8SPw==@nongnu.org
X-Gm-Message-State: AOJu0Yznr8+fM5+xgH4UP20+DB5rYEJR98biukIk5aKrmumQeSNIN7fk
 Vknbbr4EanvJ7e4ub5hqMjEf2BBxaeYca5P5+Hd0kM3baHkmACiCVC3DrBmZv+yESZ8=
X-Gm-Gg: AfdE7cmF7A7o6olkdy68Keywco0hoA/gLTAys/Fj98hrvV8fOL/2ozRV9Chsf4Ba4Nw
 54GInz1rUfv6aFtOASmD3dEceTU1L0MM0LcXb8ieZyo3twpDtTc/FwBWHe5/7ToMr1MfeDrpBI4
 qFcmqGqfSMMpmmRgE0Eiw+R89SpaPnieeMiOGkoLy2gSWh/0G/8GAKQy5Hu/JLTKEWd4Fj/u22K
 2KWUC3AdXZQyvbQsr1WbgxXKIjdT60xM1vHcABgPn1wiKzZ/TaY/Zqu+AlhlZO0jjLf8WvCwOzi
 XbDREJFXTTvlfr4k04XSpbW9r4meWSFrHbpLtN8mlED+YY9zpZPYoDux29+gMU+MK2/m5MFlvOZ
 up0ojJTVFba05BHmj5p02M920NJ8LDpdWBkO3g6+GjN6a2ymU4zoDyvIgk38a7fUPOheba3L2bU
 fI8MAo5TE+Bs0Y
X-Received: by 2002:a05:600d:8443:10b0:492:1e36:1fe9 with SMTP id
 5b1f17b1804b1-493e68e0d0cmr23399585e9.37.1783522723997; 
 Wed, 08 Jul 2026 07:58:43 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e54a25cfsm77596205e9.0.2026.07.08.07.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 07:58:42 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1BF9A6004E;
 Wed, 08 Jul 2026 15:58:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/8] docs/system: document FEAT_Secure
Date: Wed,  8 Jul 2026 15:58:36 +0100
Message-ID: <20260708145841.3032079-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708145841.3032079-1-alex.bennee@linaro.org>
References: <20260708145841.3032079-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

We have had support for Secure state ever since the initial TrustZone
support.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index d19b6c04429..b751646e10e 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -162,6 +162,7 @@ the following architecture extensions:
 - FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SCTLR2 (Extension to SCTLR_ELx)
+- FEAT_Secure (Support for Secure state)
 - FEAT_SEL2 (Secure EL2)
 - FEAT_SHA1 (SHA1 instructions)
 - FEAT_SHA256 (SHA256 instructions)
-- 
2.47.3


