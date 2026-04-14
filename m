Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C420CF531DE
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 00:54:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCS2O-0000Ey-JG; Mon, 13 Apr 2026 20:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS2N-0000Ee-A2
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:53:55 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS2L-0000Ir-Q4
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:53:55 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso46411435e9.3
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 17:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776128032; x=1776732832; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BLI43CMKKgCVQgB5y9bVNRIgkIWGcbGh9bdZMwpHqyk=;
 b=w6pV0tdE4d05+S1RU4MSZHI2XEoKvP2p9rov74zA1e1aNoHaLgauLL31140so8gBHD
 lSfI5D7z7S1yIPQ9m3+vSPTJY+jlXFaa2wt8mlNQ4DlDvBRaZml4BWGrfmropVKVPW26
 bqzrs/5isM+N7DK6KaXoQNm9LidZCo2EVatCWHwQhtF0tr2vn4vpVEd1B5BWxNccDF5f
 2G25fx1tmkxKjVVpEpw6MA+Qs0awJ5jjtN3+ACFv9Whh6z/YOpJDsDbsCRm1lRkMomn+
 7jS3DhCdK8gT5CmjBcn+9gCCKwFJO83Gnk7F6owFQth4Uiw6a2tiwW54GPTSK4Rz3WiC
 QHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776128032; x=1776732832;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLI43CMKKgCVQgB5y9bVNRIgkIWGcbGh9bdZMwpHqyk=;
 b=LyakMj+BlPgh2ejGQt4zLu9zLOOPCaRG54vfV8fqaVLiirKlQq3wt6CQTXO8LJJbQw
 8I+O7xE9QzfgeAoq0Qep9IGWrgh7H/EXGMnq2R9u2FREjLThC6AAlEJ55gwYWIMqulHq
 r59OC7j6dl5N4Urf9Id1a9umUliqvcHRMKOCUA5GfGOplvQgIXXJun57iVNwMbsSnH9g
 ca3pjzLO4o68vKzg7hId3xjA0f4jHMBWQija5BlKz709cFI+SYgfPjVYfN25PSFpDM1/
 I2tRIixeclNb1C5SlOtaUKUR/Wme+TspFTMmY/ytZyXja0tWYd+gjLuEpIn/2w0KW5c/
 OXUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9onnx3acEtTdewiC9cp0ovL5Jvqq+KyaqGqduDoN4mU0ru6T/xKD62tOoYrmXyXTqzvtFiuML3Mw==@nongnu.org
X-Gm-Message-State: AOJu0YxRg3wemT7LR+cY6f+RnrjTIGu6A1EwFbZ+lpR6pOrD9fWxzZsd
 KaTiGwpU6yquwM7b/yPmhIgmjtiyRBb1Xsl8rk7q/AIAZA23aaABxFEvjyasD6x/oDU=
X-Gm-Gg: AeBDieu01mMq5ClS5UO/CjyhdEA4btCtmgll7PsLj1UD3gfeObAK3mzeMvtSFEX+WTO
 YeZJHXiX3xZTmH/K4BY7SsSveZ3mQuLCJuJiNZrhmOkREC5ROwqF+ALQFGu8wdveZQHzAYNYa+c
 RDCrtqPbqm+N3zSE5phErGQQzMy0J1avqHNT2qlYSfsQe6edeBkP7YrBQFYiHniPu0m1IzLqSQv
 8Lr0A/ALFE8LaLwI7qan6XrQvZCLevCbhjE2A+AquwzvNNrfjTQDPmk4YL3wsMpG1e+hdYJqBBF
 DhnXY0ZbFnY3F7iE5WZe5LJppSK6fw6IDDccRIl9iNEELVN1kJcdhBpH75V6D2yQRzt1Tv8bg+7
 I9WzZvxil84Q4dXRo+PaGKdKocNlWXlLMTiaLVHlVCJpaTyhiOXlpCsT/1k/pjilwF4SGWPeDdf
 qGpZId4L3e/YvcLcGjwRf85JpaeqAYZLV+x5wup7kLrEu9O9B+tmo44iBE+wB9E1TgA3t7jUgJm
 VAmWpmcd+8=
X-Received: by 2002:a05:600c:8907:b0:488:c744:49b with SMTP id
 5b1f17b1804b1-488d67d2cfcmr145831695e9.7.1776128031944; 
 Mon, 13 Apr 2026 17:53:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede2ba0esm6365235e9.11.2026.04.13.17.53.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Apr 2026 17:53:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/9] target/arm: Remove MO_TE to compile MVE/M helpers once
Date: Tue, 14 Apr 2026 02:53:39 +0200
Message-ID: <20260414005348.4767-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Missing review: #5

Replace build-time MO_TE definition by runtime mo_endian()
helper, allowing to compile m_helper.c and mve_helper.c once.

Philippe Mathieu-Daudé (9):
  target/arm: Ignore endianness when setting MTE tags
  target/arm: Explode MO_TExx -> MO_TE | MO_xx
  target/arm: Hoist MO_TE into mve_advance_vpt()
  target/arm: Hoist MO_TE into MVE DO_VSTR() macro
  target/arm: Introduce mo_endian() helper
  target/arm: Replace MO_TE -> mo_endian() for MVE helpers
  target/arm: Compile mve_helper.c once
  target/arm: Replace MO_TE -> mo_endian() for Cortex-M helpers
  target/arm: Compile m_helper.c once

 target/arm/internals.h      |   6 +++
 target/arm/tcg/helper-a64.c |   2 +-
 target/arm/tcg/m_helper.c   |   8 +--
 target/arm/tcg/mve_helper.c | 102 +++++++++++++++++++++---------------
 target/arm/tcg/meson.build  |   6 ++-
 5 files changed, 75 insertions(+), 49 deletions(-)

-- 
2.53.0


