Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0892CD8CAA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 14:01:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWx04-0001M2-7R; Tue, 09 Jun 2026 10:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWx02-0001LF-WF
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:00:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWx01-0004Ib-5n
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:00:14 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490b8ac62baso44113725e9.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 07:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781013610; x=1781618410; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KjJGKEpH2qByU3Ess85Ejl8SXkz/f7VS9AteXOnW56c=;
 b=Q9tNFYQVIOOKL6E3DV1UIPli6upb3PjE8YauDaqiO7fa5bbWc29+mJZvoFJmcBxZCt
 jscBA1vdE6dL42++AVEhhgACoL29d+hdzp5i7vhoTKpvSpHoD+xMYm6ndMI3jUf2ORdQ
 P3VL68cniFxTO2hhBoWa0oElhal3FquiG5sFGKDr1xmlsXrw14CnyVrKsU6SumKy1d12
 0Me2ndHcT+IJAr11Fvkdiq+ra8GXOM+TSjd+1ztCf9zJnqRi6+zHX2BEzBztlQhZxV+C
 jx2PsCb2PKypLiEvtCGk4BVfSAS5HRmkozxidO43GqchVO4EP85MCo5tuau3IUnLx4nP
 Blhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781013610; x=1781618410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjJGKEpH2qByU3Ess85Ejl8SXkz/f7VS9AteXOnW56c=;
 b=Mz2bKFhpU/k3AbZOr8Pu8+tRsvqHvrWwLWdL8fTS1g+eqJEDlyD8NAs9YFScFv6Kyj
 8RhVllzYgSADu982y73kbb3W4a4SLemmUIL+GC7ZaVzcJABdE3e9D2HQv0LyVq9GB+CS
 g3u4E8/i7RHXlIuasxiqoagfZGPb68mH9nCjXXwi6B4YaIDBSoqKX1GxccvzeJDBjd4V
 PRiVG5VMxDUYWWPZJ4A7nhbDFVwfk2yvyzgSfETApSzRK+YB6IgJctBigI/Of8yNoRQf
 QQkC6fQx8muFTTWZfTOgXT6+wKdh0VUma5+W+nvxDVoUzHyWADztvsu64E4JvIQe79pY
 Nv2g==
X-Gm-Message-State: AOJu0YxeTy5F4cB9qbhwrQweo+BfvI3ErZIcFEaW571fgk1VxcEgOgTZ
 jVyB9y4WDQWpIyBOHrPWC2fx/U0tr5vtpgAn6xT/VnkZEQATPREU83jVN1jlJXKkn/I=
X-Gm-Gg: Acq92OHBuisjFncML8nRyUrggVD2gjZffSCXteDuqraFZySjLZHkOTmz+Pzj8AEQOBc
 H0Hl71ue2+c/N5f4EnSLO+nR/4A7pmzXNMZCSK5Ot+b8MD53rGLbUd6WO2QokEsz4A4ckk1nAyT
 t00FXrnnDOYJcFt7wxfDKsyo4ouwORXENYbnuJbIFDkxkhA8ZjzztKexijIJxJGzC1W2iZH8lid
 M2s99g6M9S/T8jo9tQytM4jFu2cRoaP6U56b7Y5UsrlfwsB8K1J20YtAaf1pKimUd6ROHPZzDTa
 I+2/WmKRvE9XcBUM4FpF4DngwF8Hy3ZPFIoQpP7rwOrTfQ6DUOIrIUo0l7MEWmKhRKf4WyYarZI
 Qg2mzGK326F9JRzxFHodwLD50p4s4pxuHAAH1kzqnhdI5GeklM+BLK1KbKe676OE201qKeBLoQ5
 lRtQnNgnXeqPi4ntmZwzZ2QuxrNa0EAqkFIeFvAez0BS2Z
X-Received: by 2002:a05:600c:1986:b0:489:32b:ac0b with SMTP id
 5b1f17b1804b1-490c2cc27bdmr277704615e9.6.1781013610508; 
 Tue, 09 Jun 2026 07:00:10 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3918fcsm554328835e9.3.2026.06.09.07.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 07:00:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 79DFC5F7C6;
 Tue, 09 Jun 2026 15:00:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/5] target/arm: a few timer fixes while checking FEAT_ECV_POFF
Date: Tue,  9 Jun 2026 15:00:03 +0100
Message-ID: <20260609140008.3206970-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

While I was checking what was needed for FEAT_ECV_POFF I discovered a
few potential correctness issues. We had actually already done the
work for the feature so the final patch is just documentation.

Alex.

Alex Bennée (5):
  target/arm: split evaluation of CNTHCTL timer IRQ masks
  target/arm: trigger timer recalculation when toggling CNTHCTL:ECV
  target/arm: trigger timer recalc on SCR:ECVEN change
  target/arm: trigger timer recalc on HCR:(E2H|TGE) changes
  docs/system: add FEAT_ECV_POFF to the emulation list

 docs/system/arm/emulation.rst |  1 +
 target/arm/helper.c           | 20 +++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.47.3


