Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DB5C83F27
	for <qemu-arm@archiver.kernel.org>; Sat, 19 Jul 2025 04:00:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucyj1-00048Z-5U; Fri, 18 Jul 2025 23:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ucyir-0003ys-Q0
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 23:58:57 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ucyin-00071U-NQ
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 23:58:53 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b31c978688dso1327917a12.1
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 20:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752897528; x=1753502328; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=36BiaITRUEe8xl9q2PXsqDuOVoH8YeiPG54q8NFu6g4=;
 b=tj70MZUgsIMCfpb96SDCo35/G4/7aX7j/IvceaDfXDdfR7Rz/6G2IhvcpWeWubf1rO
 rmygEqVmVws2EyXeRN4fLgsxuftBIUuwM0yyMH6Gw9aAKI4t7P7DhWbbBuBCLDChTxRx
 0L9B1MC3syumRN0/vzp+i6ga+TiQzX0yHo5hzCPV4TBM18NYs+nja1cw+VrbX2V7kxCo
 ZXEg6qQDkOZ5JMGynII8gz/uJ2BZ/cy+RGodUrPyQBBBkpBH6jJTB6t93jylV+9b1P2n
 CoaIYXgF/EdT2HLj/+dPrwJtiYArpofhoMtMAI3VYngRQuks7QGvbsGGvEQ5+lrtFhOn
 8mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752897528; x=1753502328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=36BiaITRUEe8xl9q2PXsqDuOVoH8YeiPG54q8NFu6g4=;
 b=CWKJU3S+pto47xfmnbjh/sNoAAwJX6UEFC9khwtEULfNW3h3k44MT+cSRKTLohF5M8
 qHKTVQgS0yhz1/hF+dSupz+EucYLuu++4rFy3xdkp5Mc2kG8KLifnxO0KmKUK5smvNjq
 hkdIUPLq+d88Nn55IzOY6SWmj03CDVCJPoAtFptl4zjcig2VoSlNxlTXGDcNENxIQvJz
 6woXwHiSHEPZ903X7jKuswi2Z5eWhPMwFqPiEoj/C4dVjKE1OOkxNmVN9mXAVPqv4hNX
 UTKZ/j8T/KT+oEa/2BVNOa1hrgafE4J6Gcj9qkjEewi8141FpCF1pSQ11fvLn7AlTvjY
 Ek6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLQsDPMeDZRrzorqUUui5Y2plEa4ZlKTA7thPX1ULKQjsKQOKkLxdLywYbavGhIfkFQKdF4Y8NdA==@nongnu.org
X-Gm-Message-State: AOJu0YyI7edm8Mtei4pu0W/S6dtX9OHSaiZN1Lf3tIHm0ZRx9FNW5sgS
 VFN6u1je3d9nAQX79i5IH5VRsGeiwNa6y/7eTVNB84w5mgeBMX2phftIHO7yWQ08VXs=
X-Gm-Gg: ASbGnctA55VBZqBobccxGsEZBdaXx36LHTmVQRupwTREu2M0yP34vjfbxNbL8rYIzzt
 3NabAGTmfUAuqmGAFVAjK/VJzqX8XoxdB+cVpQflK1PM1i9oHl8cFDX7Va2uCryqibcMbCwGKRw
 L9R4VJHxrWa0wnOSStKt4v8UG09cNddDjO/W54RehNl+Uar02sKgT6Av6F4EZcw0FnUxeXH3nux
 71RqijbSBkgbQSRy+piOgClFnAULrLR493QGg3wxchbU/T2jr8qdC/VMlIFd35FitqiYtsSVQ3W
 d8M8x1OrlpS0kZT5LnaROC8YffEBb4qVLBU4J2pW8eCFHlHyENB4vG0MprkWqKaYPDdWSMum4x4
 wynLn7ZttFyHnXE1pFLT4Jg==
X-Google-Smtp-Source: AGHT+IFbEFIdIcejz6M3AcubfBg+1bk0yS9uVpOAWVaZ+3O5YuHVu1+U0g5fdiDg93d+Ac+6vzFXQw==
X-Received: by 2002:a17:90a:d88c:b0:313:1c7b:fc62 with SMTP id
 98e67ed59e1d1-31c9e7637cemr17474625a91.22.1752897528037; 
 Fri, 18 Jul 2025 20:58:48 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2ff88cf8sm1961819a12.49.2025.07.18.20.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 20:58:47 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, richard.henderson@linaro.org,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, gustavo.romero@linaro.org,
 qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 0/2] aarch64: update test images with new trusted firmware
Date: Fri, 18 Jul 2025 20:58:36 -0700
Message-ID: <20250719035838.2284029-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

v2
--

- Updated test images with lighter images (only firmwares + kernel + lkvm)
  performing only a Realm boot, and skipping the attestation reporting.
  This does not change what is tested on QEMU side.
- Build those images automatically on GitHub, and fetch them from there
  directly.

Pierrick Bouvier (2):
  tests/functional/test_aarch64_device_passthrough: update image
  tests/functional/test_aarch64_rme: update image

 .../test_aarch64_device_passthrough.py        | 27 +++---
 tests/functional/test_aarch64_rme_sbsaref.py  | 64 ++++++++------
 tests/functional/test_aarch64_rme_virt.py     | 85 +++++++------------
 3 files changed, 80 insertions(+), 96 deletions(-)

-- 
2.47.2


