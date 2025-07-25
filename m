Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C270FC87FCA
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 20:25:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufOyM-0004LZ-Rg; Fri, 25 Jul 2025 16:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ufOsu-0006gM-6J
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 16:19:16 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ufOss-0000vX-HI
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 16:19:15 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-237311f5a54so21392745ad.2
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 13:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753474753; x=1754079553; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5K1qtAriFHoDI4vOaduYpqQ8oUEBiN45bpDENPmumJY=;
 b=SwxqZTJ08jpc/Eqg5qVNU4WZMuFFJeUqCJQxSOY3KCREmRRAdj82CPqhvVQNte5i9Z
 wJxWUMg3Mk4N+hm3JQMPewSHteXEboab1/7IAABvYMBQP/WFs39DOGi0MVo9ZxcStVDr
 ivrd/G/Ebq5wx4Ev/wNQBBCuoEwwI4oorT9Ozb4QuSfjbBrhffLx/pIGPPq2BTwnGJYl
 /HwZuN5bWSn5wLkJmXE8DGcusTfRHFwzdnfm3JRyCqMKNnyr7sbpDwckT/j5l8dBAAaf
 Gf0sKaFuBJYMfCaZaQaBhAChgF+EScY07EZeyfLD0FZA3VEpqOGtkdw12d/EXeROOd/n
 7kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753474753; x=1754079553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5K1qtAriFHoDI4vOaduYpqQ8oUEBiN45bpDENPmumJY=;
 b=G8SkOoqAnS7d8yKk4yq1r/ZoOJxRHgYlVUChAxpu3f2SlguJWNfRRtTu86qafiQtNK
 Ki44x9EYcrN85iKw7BmebhvDSsve+HIerHJ3UO+JsIIWZ/TeZJiEnmNGZiW5xSTsKji4
 NsfjHdm7wf2TeWpQGQHYxHTD93drhBQaS2O9AZgej48F1xpfVrDawdpbnHPiPttq0pZR
 5011ehKmIyCHEA1OvpMLWIL7zjCL+c5Aq+1BWxjaqs4YCxer9sb71j8vw+IwN0sUThYC
 wOX6128TSeWuD4Tyn3TseUuVHyAd79iB5Sp9e2q9tR4FMspHRIu+3qpxaM6oQ7fY5+q8
 3oCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWdYv6ibouBFRC8LiPgKks/5TgimsJB2vYj9kmaGnhnJUS3kExpsrFJI0HOiW57ZKvSqYDixE9yQ==@nongnu.org
X-Gm-Message-State: AOJu0YyuWegWPhKmHuoNuv6/PuFaOzQkGjAOAP63swxf63JaTKm5B66n
 7/GoKLrDortPhQ4M0K9zWetho4JCKdp+jAvaMreYqgaDaFVD+Q/GqbTVG2EBVJyfI8E=
X-Gm-Gg: ASbGncs76dIb24HuFdm0NJ4Z392RkTnvw3WkVoZs8Zv89daP0mxsCNlHeLiV28A8Pne
 FwYBEv/Td2Ai2p/9Xzic25/dtUv1VBD/Zo+wDy/TUHJTnBdtvCdcYAHex1wSYcIzazOfKBK4Av6
 OFrahE2p4qDePT5Tm+0uQv1a392yHmuerM1FdNq3edhlNIeKmGekDZ1Ox4yLEzjFVxLW75++pCt
 uq6V7q5IovZN7C6TgwESAEaOw14SsKnX9fZtI4+ak8jB1lmHlGMnTn6Oq/WgMqb2ujuxZ5CyNDz
 YVvYsR7OtZpDulx1pIVBDP9+4tjZwFU/cNQ0v7M3258bzYZBfUGkF2ADem5nm92XkdnVLcLQk5y
 TMd5j0JvSIaHYUrbRJmunk5hiokcouv6S
X-Google-Smtp-Source: AGHT+IFUxwD/snBE4ljS+0QN/557jbRNFw2KOEoNBB2wTCbbuq+V+o1vyzhWlugVy8o0+7ckdQojXA==
X-Received: by 2002:a17:903:41d1:b0:234:b735:dca8 with SMTP id
 d9443c01a7336-23fb307afd9mr40344335ad.6.1753474752771; 
 Fri, 25 Jul 2025 13:19:12 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e6635f0a0sm4143309a91.24.2025.07.25.13.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 13:19:12 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 0/3] single-binary: compile hw/intc/arm* files once
Date: Fri, 25 Jul 2025 13:19:03 -0700
Message-ID: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x633.google.com
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

Move those files to hw/arm, as they depend on arm target code.

Pierrick Bouvier (3):
  hw/arm/arm_gicv3_cpuif_common: move to hw/arm and compile only once
  hw/arm/arm_gicv3_cpuif: move to hw/arm and compile only once
  hw/arm/armv7m_nvic: move to hw/arm and compile only once

 hw/{intc => arm}/arm_gicv3_cpuif.c        |  2 +-
 hw/{intc => arm}/arm_gicv3_cpuif_common.c |  2 +-
 hw/{intc => arm}/armv7m_nvic.c            |  0
 hw/arm/meson.build                        |  3 +
 hw/arm/trace-events                       | 79 +++++++++++++++++++++++
 hw/intc/meson.build                       |  3 -
 hw/intc/trace-events                      | 79 -----------------------
 7 files changed, 84 insertions(+), 84 deletions(-)
 rename hw/{intc => arm}/arm_gicv3_cpuif.c (99%)
 rename hw/{intc => arm}/arm_gicv3_cpuif_common.c (92%)
 rename hw/{intc => arm}/armv7m_nvic.c (100%)

-- 
2.47.2


