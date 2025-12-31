Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A75EE645E
	for <qemu-arm@archiver.kernel.org>; Wed, 31 Dec 2025 17:10:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vazhD-0002Z4-C7; Wed, 31 Dec 2025 12:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vazh5-0002Vx-Jw
 for qemu-arm@nongnu.org; Wed, 31 Dec 2025 12:09:08 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vazh1-0000YI-Tz
 for qemu-arm@nongnu.org; Wed, 31 Dec 2025 12:09:06 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso68484655e9.1
 for <qemu-arm@nongnu.org>; Wed, 31 Dec 2025 09:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767200940; x=1767805740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZREBp7SWRaBnZ07QaFCmMpeaAK2oXMAOe/k/nbhfrKM=;
 b=G07XugVBBSIMi+p74QugRHgSX8xn8sxhUQrdrdb+bHnQ5jo3ioPhouCspiN2HfBGb0
 OstRz+c+HBNAsefPrxCZsd9fjZ+6zON1Y9c+LdseEZjhg1926VSZbObfQgZTI4ij5zmU
 F01Vqm63aJb06Hkv57/pUa/AN6nQzlweIVKRPRuQ7FAzfdeYPpO62J4hgdp71+LBdcW3
 VRgNtzphFggGDsJQpR0zHbbe5G1AxT22PKsE8rZjq8K6xStnHuxO2NtIk8cz9KbwqVvN
 PZjyUryJpW0lfBamO9I/Jlgc67/tPVPLo3hbz6OnucMMuu/nsdhEfLHfli9y0dq6rqIj
 s8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767200940; x=1767805740;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZREBp7SWRaBnZ07QaFCmMpeaAK2oXMAOe/k/nbhfrKM=;
 b=E0agxUDpYANGmC4L1BbqlDHoCsQG1Aspn9Vw1yQ5BBWW88ppXR5ynYtyZGHUccHwPX
 /ykNbBJqsbyNyRV32vCT5dFqWcVfrO2H4k+4iFLZLhd5d+TCro84J6ae0+kKLMH5eRO2
 vhBw4txA3yJzQQ4ldDi2iM/Rl0tPbWTTo5/JJWMKcUhfpsTPoO4NPt7+Y9hNih/VnNgD
 fnOhZ2gb9kl5O2HrQGhuFJStj41YrQ+ZwJmJYSE4Y8CzAZldfHin3MsGxLpM05AbrKJE
 WEvrxG++JutFz2aN03c7RooLSnKIQLN5qssb9ShujUu8Zsn+y7+T2XTuyeIk5wBm7aOm
 bBeA==
X-Gm-Message-State: AOJu0YzGgSXiFTuof8KxPaHnNpOxGRO34D5QY8jZHdrGOAGse3+fyKTc
 jtl6nV1Qg+ZOp9SSfu6AiJFkG33FaMf1ajudTybryH/DCqOScanuZNSo2UuAxBIsC5MKpV89j1F
 HQeKY
X-Gm-Gg: AY/fxX7Erp0txeTMwWUxTYICEOYh2V1iHgJF8E7Ihewc5B+JrDb6y4l3cb3J4QpSmmJ
 1PayDUTzqmjMviVgmVMrivMyPVo/xQWbodnnuLuK/XHwIIYpOeLoEZG04Ir3SrQO7CoO/T6Oi9/
 FXEwpSqo1KF2vLy8IWyXiJSLAkwZ49xx7TwuXlQwtWMXzYPukR2rLC5UzlQGOcYO9il7Y/PyD7H
 dKEfmW3y3U1jTTs6EusSbZrTPbaoR2KyT/XK+mDZDoKiR6BK9whZza1lLqrHgKGml/8hYayDOMJ
 1N3yb6w6hBJBjuSgiv0a/l/tbV2Hx8m6+m2yr5P1I5LkPFjgFCMOS/+b2KOOY7Yb55LTnFqzRhx
 +I/H1Eawg/M5Ek+daOSO2bG4rTCM/ylo06L30Z22rbuvPbDJ3R5tCBvQeP8gTjkUUGAhrB4oY88
 TAxQh+V7YQ7bMWB87zv6Xh/c+dE328ZgQUG1KBEhtJkPItJ5VaUcE1oBTYmIy839rDXUdxzeUR8
 csUoS1oKwdVgm2cGnKLxntfvM9BJTfqQDvNLkfqYXMekw==
X-Google-Smtp-Source: AGHT+IG80Gxmy5DT2xlEdLh+wu5uBDvYw/QB0gqnSC1qjc2jgYxg8PSzVT6sy4O+jI6Khv/L5RQWCA==
X-Received: by 2002:a05:600c:3b1f:b0:477:bb0:751b with SMTP id
 5b1f17b1804b1-47d20423ca4mr429515375e9.27.1767200940170; 
 Wed, 31 Dec 2025 09:09:00 -0800 (PST)
Received: from mnementh.archaic.org.uk
 (f.7.f.1.7.5.e.f.f.f.c.5.d.8.2.4.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:1d0:0:428d:5cff:fe57:1f7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa64cesm75208990f8f.35.2025.12.31.09.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:08:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 0/4] target/arm: Fix handling of HCR.TID* on v7A CPUs
Date: Wed, 31 Dec 2025 17:08:54 +0000
Message-ID: <20251231170858.254594-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

The HCR.TID* bits are intended to cause trapping of various
register accesses to EL2. Their behaviour changed slightly
between v7A and v8A. In particular for HCR.TID3:

 * v7A has a set of ID regs that definitely must trap:
    - ID_PFR{0,1}, ID_DFR0, ID_AFR0, ID_MMFR{0,1,2,3},
      ID_ISAR{0,1,2,3,4,5}, MVFR{0,1}
   and somewhat vaguely says that "there is no requirement"
   to trap for registers that are reserved in the ID reg space
   (i.e. which RAZ and might be used for new ID regs in future)
 * v8A adds to this list:
    - ID_PFR2 and MVFR2 must trap
    - ID_MMFR4, ID_MMFR5, ID_ISAR6, ID_DFR1 and reserved registers
      in the ID reg space must trap if FEAT_FGT is implemented,
      and it is IMPDEF if they trap if FEAT_FGT is not implemented

In QEMU we attempted to implement the v7A/v8A distinction via
accessfns like access_aa64_tid3() and access_aa32_tid3(). However,
we didn't use the right accessfns on the right registers, with
the effect that for a v7A CPU we don't trap on a lot of the
registers we should trap on, and we do trap on various things
that the v7A Arm ARM says there is no requirement to trap on.

This bug came to light because a recent change to Xen to trap
guest accesses to ID_PFR0 broke on QEMU's Cortex-A15 model.

This series sorts things out so that for v7A we trap only on the
things the architecture says we must trap on, and cleans up the
naming pattern and documentation of the accessfns so that
hopefully they don't get accidentally applied to the wrong
registers for any future additions.

thanks
-- PMM

Peter Maydell (4):
  target/arm: Don't specify ID_PFR1 accessfn twice
  target/arm: Correctly honour HCR.TID3 for v7A cores
  target/arm: Correctly trap HCR.TID1 registers in v7A
  target/arm: Rename access_aa64_tid5() to access_tid5()

 target/arm/helper.c | 177 +++++++++++++++++++++++---------------------
 1 file changed, 91 insertions(+), 86 deletions(-)

-- 
2.47.3


