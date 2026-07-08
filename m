Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9BBC44501
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 15:00:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whTjj-0003R9-R7; Wed, 08 Jul 2026 10:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1whTjg-0003Iw-U9
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 10:58:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1whTjc-0002z7-PJ
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 10:58:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-47122683cf3so524603f8f.0
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 07:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783522727; x=1784127527; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JIXLaTM0HmixlIx6VEsdYx4/mlSg82al0riON9+dVMU=;
 b=ydtWAc6WKyEHkgBMh5Cfqm7vpC3IARd2g1tvtYQ+wGGobB6xW4dMUT0o2/+L/TvunL
 RW60gzLmuPe6dp3EGBVYfKGycYnwzjKM+3/SaThmKGwLznrGc+qNR6uSasr36BykaCI9
 H/l6Q2kAXhtMRvSc0Mztvgk87i1kqWYG3QupVvsttl9Xw4iLrsAQxc4CLD+lbcnvO/t/
 OUTdZQU4edYFLD1pvqq0sgLsCXf1g6zbdV0CHxGX3M9Luz5iWc8hfhOIzEmoy4v/t6EQ
 wXtKF6gFvpu4M8CGlhINCwtxNK8TpkVuQnkuOAJsg+TbcIlAnnkn8b9+T1khdx95VA9t
 nfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783522727; x=1784127527;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JIXLaTM0HmixlIx6VEsdYx4/mlSg82al0riON9+dVMU=;
 b=g5JI6y7X0niEEUTkPNF18ST5F1UyLlCkEtJET5no5DStIiLvFRko2YbNwJdOhM+GiV
 rlbrAc5wazr8DB/Bh88xk4TMf+MunbYPKgWgcfgHFf3KRvQBtAoE+qYwI3CjRk0JVqhZ
 grqbS5IBuWQKvKdRy+txnzfu7r0oRiheHcaA5iB1L1thhZokjuTqXMj0BcCT0TQ5f3qP
 gD3fgQcjM4rVCUFjokAvc3Akt5i/EQ39uDk1KmiWGK76nOiejUEFnyU+NFayRNBbvn5F
 1V8vqo/YeGWTigGP0tVZMAxvCCh+d/Stqr5bIMcz+O/JnKjlJpI2UxR7hBOf59FcAf5W
 roQA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpwkObJK/qDyargwLQ5raiUx7t53IPvIAf6P8UBWZ0icJqmGhHnfmmlg8Ed1+wIyWOVwWiZpIpiqw==@nongnu.org
X-Gm-Message-State: AOJu0YzfwQ1Cz3MRPaG+w9F1YO6MlvY+5+rzy5QueBhPeQr3bFDQWPOs
 f9pWSeFET0Tc/91m/X9Y67yTYlOcOTca/dounOF25Zl7dbgzSg4tLROaEr4hmH4jAjk=
X-Gm-Gg: AfdE7cn+jgnZPSuDXHkW09NCLJkkx2XC6p/7ThwN4c1Uzp/rL1VJYyb2kHDOOV3rmPH
 wVRWPg1y1LmdIBEHpvM4MnwaoHn0xPYO3QQGtwK6iruisLXNjQAm3s0KBUEquWKW6U0CbWLWUCB
 rGB8y/RQHxMmKGr5lMaW61yCy3aY7PGQMTpJjksJ1vFMaKOfkGfD0OUmH4ojPih8agfCTOq5//V
 Q9Moh5TnHtEyLmyP/UrcepjqUXSYAk6TMKU6FcJ7zvibN/iEiwKJURHiBJAoe0cEqbnyOwL7E6T
 5Z6GEx6BaM/uvZwfp3MoqYjo7k1cIECtAb6nNbZBcsoY7Z7FIWRGPviH3Fgpx3MacJ5nWhPXnpf
 pv/Nc3mEovlYoH3CIdhqrHbAFzNWilnyjXZASHGeZxrBcD3pV1e7PDYIl2M1nHQg1AYBqPO9j2E
 rV7ANB8L6bQWIw7kQcmYP+lR8=
X-Received: by 2002:a5d:64e2:0:b0:46d:d5db:98 with SMTP id
 ffacd0b85a97d-47df077544emr3380658f8f.44.1783522727093; 
 Wed, 08 Jul 2026 07:58:47 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d905sm45244377f8f.2.2026.07.08.07.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 07:58:46 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8E53A60157;
 Wed, 08 Jul 2026 15:58:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 8/8] docs/system: add FEAT_HAF
Date: Wed,  8 Jul 2026 15:58:41 +0100
Message-ID: <20260708145841.3032079-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708145841.3032079-1-alex.bennee@linaro.org>
References: <20260708145841.3032079-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

This is a subset of FEAT_HAFDBS which we have already implemented.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 903a5f90880..9930974a501 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -95,6 +95,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_GCS (Guarded Control Stack Extension)
 - FEAT_GTG (Guest translation granule size)
+- FEAT_HAF (Hardware management of the Access flag)
 - FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
 - FEAT_HBC (Hinted conditional branches)
 - FEAT_HCX (Support for the HCRX_EL2 register)
-- 
2.47.3


