Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AA1C83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 21:24:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubn8S-0002F3-FP; Tue, 15 Jul 2025 17:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubn7w-00026X-Et
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 17:23:54 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubn7q-0001oT-5S
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 17:23:52 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so7232020b3a.2
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 14:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752614623; x=1753219423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uJuDKaPyuOQ11qMEvzCeZiq7F9iOl5xDj1QLIO3/YMo=;
 b=W9tPWiR027wIphs/I9l1hbyHwtEBrwOCGkZ/+xtUmzrFURUmqxvN3U+DfUl0DuN3Pt
 6YBiDkBaJXUZrsJZMSOsXpFCXRaYL3c0DUS6Qnlcl0OeaSQn+2l/R2y2bwPh8xfzccHI
 HfJ5fOerKoB4aJqTgWDq9cAgcc09wBCNyT8bwyzPJO4gPIXB1lOeP6UzZpPnJRUcPsxC
 sYIy/BE45puVE2bbJ+pgd6Kl/5Dg9i8VKaYTZdmZEdbh4D1TksskRcqUFkFfWr3NbHXW
 FZ7e7pqY8FthocIQetQAdhx4j8T0xomKrRCF0eIsPggLY7L3APcmYNcxQ0L6dKP1s9/C
 unzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752614623; x=1753219423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uJuDKaPyuOQ11qMEvzCeZiq7F9iOl5xDj1QLIO3/YMo=;
 b=wRsjd+Ba+ooOfoY+Hs6ZqAIaSa2JePCiZ4Hj8FKKfcn4KIJUBHeYuafbI59aq1z/wj
 HrFCHZOQdSdTBKv68owvBlwQsdwQBGYAviwu+ScimsW8JL83wdiFdBA2F6VuDA9F1oSh
 Bt7iwnxbYsqb2+1I/vYWXB9xnxnYX+9i4URtat1mJRV15yJ82yJRyhixATMiEWPfcdVy
 KzCr5TIeGNMI5Xj3PrH6gHQyCA05i2U3+virjPvhDf7QOym5TKkgTuGIokK82KwbwiYn
 sTClikWMqN2XMUId7HLPgCJtAbtQqhA1p3sooLXXgO5g0vypfNVZSf6mpw9uVEzwJYuf
 t5kw==
X-Gm-Message-State: AOJu0Yzdt1dBPllU5Q6YEeRvfwZV4NVbhLEknIhW3XIiR+0AMFiOuqfP
 xvL/7GRiJGNo7DX94DI7HaJLbQpqYP5OhGYU1/XnsOF4tec33ic5LQ3EII9m4Uq1qJU=
X-Gm-Gg: ASbGncscaGdUGAPxW7SSMnvpv3V3Zq7fU//V0LeIhxU1ew3nggeymXk4jiknb/Rj4V2
 u/sr6DsQ6gpFgcj6xNcruuURjtmyfsVCiuC7Q4Fp7su+rjRDVYXufsSM8kCMWBK+dgsqtacRjG/
 2rIg5x1GAljvHHL/fVlab0j3Cpoc0pFgthHrARLQKub02gFXgafnWzPUMDUdKS5Qg6oTZvHPpFX
 HBhZnynhpOhtpyE4cfnbYgWOtSp7LU09bjVXqvpoPhaMq9WpfPYU8G5Ca3OHgkqfqG4pk0HDbwF
 NUf3oeOsZd4rtcG8qAx01eNFgBMGC8xxTNNQbS1AePvolsVAlZW7DgZBCYuVJxLX7NIW5gCLv1T
 zBR6I1C7A6rdyRXg8+WVk5g==
X-Google-Smtp-Source: AGHT+IGoF9ww+51xV8mMCpAaeU1d1gluPlrjn0GCgvTKObpoku2zj2OKShR2kfoC2mirp2Cf9sg/eQ==
X-Received: by 2002:a05:6a00:cd5:b0:748:f365:bedd with SMTP id
 d2e1a72fcca58-7572568099fmr104059b3a.17.1752614622982; 
 Tue, 15 Jul 2025 14:23:42 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4b16fsm12281708b3a.120.2025.07.15.14.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 14:23:42 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, jean-philippe@linaro.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, gustavo.romero@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 0/2] aarch64: update test images with new trusted firmware
Date: Tue, 15 Jul 2025 14:23:33 -0700
Message-ID: <20250715212335.2215509-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The FEAT_MEC series [1] introduces FEAT_TCR2 and FEAT_SCTLR2.
TF-A needs to be aware of that change to allow accesses to those registers, and
thus must be patched [2] to enable this for QEMU platforms.

Concerned test images need to be updated to allow them to boot.

[1] https://lore.kernel.org/qemu-devel/20250714155836.1514748-1-richard.henderson@linaro.org/
[2] https://git.codelinaro.org/linaro/dcap/tf-a/trusted-firmware-a/-/commit/c8836cec14213bf92dae79d353bc345254a0a31e

Note: [2] will be upstreamed in TF-A once associated series on QEMU side is
merged.

Pierrick Bouvier (2):
  tests/functional/test_aarch64_device_passthrough: update image
  tests/functional/test_aarch64_rme: update image

 tests/functional/test_aarch64_device_passthrough.py | 9 +++++----
 tests/functional/test_aarch64_rme_sbsaref.py        | 9 +++++----
 tests/functional/test_aarch64_rme_virt.py           | 9 +++++----
 3 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.47.2


