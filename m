Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A123ACCD194
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 12:28:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9N0i-0000HB-U0; Thu, 16 Oct 2025 08:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9MzV-0006Gr-BS
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 08:21:59 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9MzK-0000Xp-8g
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 08:21:56 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e33b260b9so7609335e9.2
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 05:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760617298; x=1761222098; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j5JoI8Mc0kdc4AY9UQ6qwcX98nv+ym+WkOZXJtVQ8Ec=;
 b=bf2JvhJF5CtvgP/fAucvncQsufyhxQC/zM3vLP2mPXTrL72LBp8B2PAEKAt/OCl+/O
 BE0pc3OEC0w+e93kg8k+DAiRWJj8y739nZA09ecqoXYI6LGptgO2oCgJw30ParHH+xxO
 g4YIPZhmRSTjZuLQd4dcohvQt0Uv2g/2IHP++mmZgYs5pb4VoB6fzdzMm9WL3xQsDFs6
 7w+t/NWZe9b3oWcyo+uLXMRflXEXDVdn+ORW3MCaVEfK24jtzUL2f1O5btQBvKvIDYm/
 WcGhM7l1FoGZjH9XGPHIANKbcqwaFQzrJ528u7Uf/bXgKMERgMHtoNK7QzB6T062OwiS
 jtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760617298; x=1761222098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j5JoI8Mc0kdc4AY9UQ6qwcX98nv+ym+WkOZXJtVQ8Ec=;
 b=PXKLPUVmQ11mlbMhv5isccvti6Dyc1heY958+pldTQB91UYZ6Fvx/ZOoD+mlMmnnt9
 d6ABff/5/VcrM06Eo2sqVf/pjMsZmFpVwIpq9pucwvRWzpTeaaMjN83nUa60ACb/HtEy
 jo2Me0p2hVmTDhEWS6ufFe8/FmP7FiN9HlgK2kNsBbhsvsvg+S1EIsEcf2WtsDwASRz4
 KYOBfY1ILoN53mujG3jCWn6THbXg+hJ6H2YWzlrmFaYcti9MvxMPVFVoMDkJiW1kwVuq
 hRheNIBj3Ux4plNxF2uAfOfpL7vofiVtVLwOLBu/Rz6PF7iHjxERF/tkjkQzjetCZTpo
 RHiA==
X-Gm-Message-State: AOJu0YxCvz+eXZcvF/UVuPDl+1j6ejPQ98qN+sEysjiFNWc7dxX1I/C4
 0/8+2kUr4B5EVbBIKw1UmW3osIDSm6xX35436nehChrx11Oyg568cUweRc3RvwggJGMHLOVn4uv
 518bw
X-Gm-Gg: ASbGncv4yE564stMT1RhC21yArrxEk+I0Auq8IDS/jArX3A667j6RnNvenRSikPEvtU
 yF0AaCYKvC5xJ3zZkBLn2f2pc7aZUZsJbiJvvisortUBR8QwwMuI6zaT8qQ68voc2sabv2vLR7v
 TgudCnINjeNSk7zeYY9R2Yh/3OBgiw1FKeAXDQbNaYqaoZXH2OIUrl667CjVnZGg3SdJYUUPjtf
 1KzpqkYDUCSETmV6CFwsCc/XAMCSEM6WhMUY9aIYtO/3Du6eCQrALeP48rJZfTMUPRtY7M2sICF
 QGHOZyauM7ChH/ggZtYbdrFHNlLJN/hQXULYwFR3fuwYFZ9uOwHXjxpqmJ7IseF+chc+mKVUQs4
 yeiHVRQRhE4Qrrn9If2TxO+bycsvw3CKgV6jOJuwzIE1Z0hmhp1UvaP7FUynkKbVRxo+xg77pWd
 rY/lDRp7A7Rw==
X-Google-Smtp-Source: AGHT+IHcZysFXQCwAEBikJfkIp62aHPwAa6z4lu2jMo7yA3IQR+WFapZx8B+nbU8tMh+BPREnNbw3A==
X-Received: by 2002:a05:6000:25c4:b0:426:ee84:25a1 with SMTP id
 ffacd0b85a97d-426ee842899mr7611238f8f.38.1760617298536; 
 Thu, 16 Oct 2025 05:21:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ff65596csm3412428f8f.24.2025.10.16.05.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 05:21:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH 0/2] target/arm: Support SME2 in gdbstub
Date: Thu, 16 Oct 2025 13:21:30 +0100
Message-ID: <20251016122132.737016-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

This patchseries adds SME2 support to the gdbstub. This is
fairly straightforward as the only thing we need to do is
expose the new ZT0 register in the XML in the way that gdb
documents that we should.

Patch 2 is a simple "check reads and writes" test case along
the lines of our existing SME tests. I don't think there are
any specific gdb version requirements here because the XML
should be enough for gdb to know it's a 64 byte vector.
(I also did a little manual testing with a program that
reads and writes the ZT0 value in guest code to confirm that
gdb interactions do the right thing.)

thanks
-- PMM

Peter Maydell (2):
  target/arm: Implement SME2 support in gdbstub
  tests/tcg/aarch64: Add test case for SME2 gdbstub registers

 target/arm/cpu.h                       |  1 +
 target/arm/internals.h                 |  3 +
 target/arm/gdbstub.c                   |  7 +++
 target/arm/gdbstub64.c                 | 76 ++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target      |  9 ++-
 tests/tcg/aarch64/gdbstub/test-sme2.py | 41 ++++++++++++++
 6 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sme2.py

-- 
2.43.0


