Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53216CDB479
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 13:48:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcNoU-0002Dw-2O; Wed, 24 Jun 2026 09:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnP-0001YY-Qo
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:40 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnO-00015L-4y
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:39 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso10116935e9.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 06:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782308256; x=1782913056; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Igs2cWS9/DjzYb7edb7nIBFIUBT7Wl+0MlW/qg0nhh4=;
 b=YkQQ7Ozcd4HrpgdItR3ppIMjoaN2y7koD1r/S9ZtsC0ScT9y8FcgAXNZLz2wSJfAdU
 u4pq+y5hGF2emMv+uPDLxdcQtEcsdYMTVspGgJffhfbVCSVOnVls/QCTeOEbCChjAkCS
 8zw4nqCIGiI8sC8seaED5xdPbzrbzS1BXtUVXlqe9N/UYHiU3Wejx31l6jd8+nqKVU7V
 mkPyXCoUTyEEwNut560Jtglg32C9Xcedt4jmRHwiuPmr+4TXREjsQxVzrzfwYP5y7ylR
 hdmGYKe0hD+OXrA61fk7xxIF0EttUsHW4Iucn9y5crdDekCfUzmqjOz9XiUm5KIIr40l
 +7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782308256; x=1782913056;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Igs2cWS9/DjzYb7edb7nIBFIUBT7Wl+0MlW/qg0nhh4=;
 b=QwX4SHfPCg/YDHcH46WnDPR/f17OELSgb2q9szqltPUMNyDLeU2zQwuZ1np8q1F8K4
 uEizZDmcL9HaaldwLlqdYSHNeOTMlyiHq0d49wiOyBDbqcyU03sJiWwpNDmsg53MaZpJ
 7eMVVAHvjyfwPUAcKEiXXjnj3pSeR9247u5xOzeqlr45GIPTvj/5PVJhroDGBfzzcsky
 Oxf5TmCL8IwOSbUTt3mAhXQ3Wdnopryj9r1j9HDlwPb1MdLyS4yfv/18A+hRHfMaDNRK
 1vZ2dVDEUw6AfjqrMtz5oErorJPAiyq553RjwIWm8tRMxRa2I0psCSCWfVmBY03XbeKO
 w2rw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Sl2pkSbga3ZlF0GIMiFmM1DCnoBz6/9Wkesv0OXGpysLnD1Kcr491rm+nFrqfDJHcFX07AzJZhg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8Pp1Lj12agelEctXNdRGEd7v4bJCHG069dFxVYECuRMyFJhXZ
 FaPUc7k9d9XbHM1FVDcWevRtNcUQcGgQA54mrY0ANZIW1O5Mwz9a4bo+KAi3rGi/M1w=
X-Gm-Gg: AfdE7cm0lRNCSy6HF7BoVzQyF/93lxq1wJkn5r51IeQMxzr2Bt83SY1XXvuSMmCDRwO
 n6FQr12TY5W1WghTRMMBGDjRi5DcSRjTYOhXuacuhUyQVSo0W/Ne0jU5chYJS7zEqazlhd6yFgH
 5G89rDvcb5jj/YZodE6e+lNT7gedggRwN/I3c7TT6CyH8ReMTHtE1EMmK6YH09Je3rST6E2hO4X
 wA8Bu3E7zVhOx+IVqo1waDdrM8pq+uH6obURWQQ7QfUBZEXAqGYUTt+2Nt69/1jHgc7s2+KxFr0
 qSFuG25ytdzEJvMqBC9cmV5zoUsD0Dgjld4pTLLAQe+DYUmhrjJ+kymwhV5Vr9u9ukQv6kSlax4
 +Ew6R34O+8gHyXjnvI9xl4OKtsHheipVhbuea6BLWAPcM/8OJGucsOoxHsb9cEGopDbVAiYd0ea
 rHqDXLVMIVqNQPVV8=
X-Received: by 2002:a05:600c:81c5:b0:492:408b:86e9 with SMTP id
 5b1f17b1804b1-492490b7e7fmr268504365e9.34.1782308256142; 
 Wed, 24 Jun 2026 06:37:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:2e21:1ee8:260f:9a76])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840efdsm6646334f8f.5.2026.06.24.06.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 06:37:35 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v2 0/6] Implement FEAT_FPRCVT in cpu_max
Date: Wed, 24 Jun 2026 14:37:24 +0100
Message-Id: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTdO2oC/23MQQ7CIBCF4as0sxYDBCpx5T1MF0ChHaOlGRqia
 bi72LXL/yXv2yEHwpDh2u1AoWDGtLSQpw78bJcpMBxbg+Sy570w7PGynsWVfNmY0FqNyhvuvIH
 2WClEfB/afWg9Y94SfQ68iN/63ymCcSacUhftrI9a3J64WErnRBMMtdYveGx4xqcAAAA=
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x336.google.com
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

This introduces new forms of FCVTXX instructions which convert floating
point to integer but place the results in SIMD & FP registers, and
forms of the [SU]CVTF instructions which convert from integer to FP
with a source in SIMD & FP registers. The logic for conversion and test
values are otherwise the same as the versions which use general-purpose
registers.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
Changes in v2:
- New instructions are gated on FPRCVT flag
- do_cvtf_simd removed; changes folded into do_cvtf_f
- Some vector forms of instructions are now allowed in streaming mode (new patch)
- Tests restructured to avoid the duplication of fcvt.ref
- docs/system/arm/emulation.rst updated to indicate FPRCVT support
- linux-user/aarch64/elfload.c now reports FPRCVT
- Link to v1: https://lore.kernel.org/qemu-devel/20260618-jmac-fprcvt-v1-0-1b4475bacf51@linaro.org

---
Jim MacArthur (6):
      target/arm/tcg: Implement new instructions for FPRCVT
      target/arm/tcg: Allow vector FP conversions with FPRCVT
      target/arm/tcg/cpu64.c: Add FEAT_FPRCVT to cpu_max
      linux-user/aarch64/elfload.c: Add FPRCVT
      docs/system/arm: Add FEAT_FPRCVT to A-profile support
      tests/tcg/arm: Tests for new FPRCVT instructions

 docs/system/arm/emulation.rst     |  1 +
 linux-user/aarch64/elfload.c      |  1 +
 target/arm/cpu-features.h         |  5 +++
 target/arm/tcg/a64.decode         | 15 +++++++
 target/arm/tcg/cpu64.c            |  1 +
 target/arm/tcg/translate-a64.c    | 89 ++++++++++++++++++++++++++++++++++-----
 tests/tcg/aarch64/Makefile.target | 14 +++++-
 tests/tcg/arm/fcvt.c              |  7 +++
 8 files changed, 122 insertions(+), 11 deletions(-)
---
base-commit: b83371668192a705b878e909c5ae9c1233cbd5fb
change-id: 20260618-jmac-fprcvt-1554d4c80bc8

Best regards,
-- 
Jim MacArthur <jim.macarthur@linaro.org>


