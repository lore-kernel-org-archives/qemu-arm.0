Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28987C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 13:17:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weYLH-0007aO-O1; Tue, 30 Jun 2026 09:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLF-0007ZK-V6
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:34 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLE-0005re-9b
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:33 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c12788a75abso275169566b.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782825451; x=1783430251; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LmjGxbpym5XIZMSyalVLiPcfIxliJbJ2fqI/f39NIrY=;
 b=e2/Ydl7948tJw0NLw0zZ8s6Qlrqo8RrQUHn/SXg5uANgPe0NAhGbdVYgE66JG9z9Kf
 IIZiw6J42Eg62pN3Gj5RPrhZSeq6Vs8Y0quTC9AZuRfBfFynGNoBttFiV5XW3zFFP8W1
 AOX9WHQ5oLAiK4igd4ykIwiLskU8sNvYQ479ULRlLaK/f0ZbqZUmXY2BRryFeQqhKBOz
 8v0JKkLTRD/9BotCdLjZtIhLtw5eH/mzdB3v4Pm3ThYhUYRzoiyXpfvcGU94H1NLR1gT
 gZoDhsYNQwNsUreAvsUsns+/dEzUYMQEy4rERncl90p/p3CDP9By+A78Yl/4flhButqa
 64nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782825451; x=1783430251;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmjGxbpym5XIZMSyalVLiPcfIxliJbJ2fqI/f39NIrY=;
 b=BCCgqQ27fBM7J3L9x22WcuqYCIfo3NOvob1d6avk6Vnc0dDOkCCRq0QMAjJsNaoTIl
 t5ittvb0Kd7KpfluopIQnvL1hvhNSyKC9rRgYD/wKhWQu3U6QJeG/hZJau0sgv9xEQkW
 OcBGck26O0KSdJoDVLlLuGOKptOxXBGB2OFwTCW3+2JNdxbCwaNxch4OYUDKMp1lixsv
 gR3AI5jx0KqVGCeAlvR5eFO7wwIvRetP18kx9Gcdnd7DWPW4EbyfiCtzQH30fbsAh9xR
 7n6GDjwWRFOQb8Q3blJ/UlJOqHEc3Rqbkb3ark6OepdNcUluyttHR1gZazr3KgtO298p
 KbCg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro/Ex4yENh7OkH24KheBbLPg97KInNc2Trtzqm2OCSj5I3c4q1+fW7J/56v0XOFklJsKWjVDL/x3Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz4GQ6fgIVPEbHiQqLEPLAZ1lvkMu8zC0hKg6QQhSXL/qBUp0zK
 9ZWNKLnwM5Tsb2UZV6UVaRXvK4pMTmVu1ibGNn3KfW7rWOwqmnfkiGim0imb4IoE5tnfifVIXIG
 DASwHbn8=
X-Gm-Gg: AfdE7cmWsXlVGtnLWnza95fTUBaNZf586mzaQ2iiFt/DeqBoIpFfhAnbruux7Go59XR
 Oq9Pa3+ro0VlJ7DXaWAf/pj5v8x2w8dqJWzOoeV52maII3rzjIakzNaiJ7WSecc+N01YoTfrxC4
 EgsbTFz+7xHXcAYlPHOOUxgIqpmdV4QqnVU+0xJUlg0GomUqO2bymoA1UBDw/nHhivgSH3kOS/l
 MKA/huGQcunbZa5WU20xWAUxhMHWRDicEL3ZmwmLqC1xDJOPz6lZ73YdBqxiPmbz1TYywMoH/zR
 3vd2p6n/rxPSzZQvuW9IZCIJjj4DmFOb8jjwWq//PRC/XLiRhTQID2bfI0+Mb5qDN56iiZpKBUN
 eaPZ5t4U54Z4m/YUbsAUhLs8RZkTdlmQXcHurz+L6MjEBb5jAbGQnBhw7N60CUwYykBqxvJFnuu
 JmWL8fTEGAu4keZ75f87SBxiRUIA==
X-Received: by 2002:a17:907:971e:b0:c12:2114:becd with SMTP id
 a640c23a62f3a-c12872b3871mr146074966b.46.1782825450634; 
 Tue, 30 Jun 2026 06:17:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:a648:9a45:1aff:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6987c3a42f6sm1201535a12.6.2026.06.30.06.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 06:17:30 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v3 0/6] Implement FEAT_FPRCVT in cpu_max
Date: Tue, 30 Jun 2026 14:16:31 +0100
Message-Id: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/BQ2oC/23MQQ7CIBRF0a00jMUAAhJH7sM4gF9oMVqaT0M0T
 fcu7cgmDt9Lzp1J9hh9JpdmJuhLzDENdZwODYHeDp2nsa2bCCY009zQx8sCDSNCmShXSrYSDHN
 gSBUj+hDfW+12r7uPeUr42eKFr+//TuGUUe6kPCtnISh+fcbBYjom7MgaKuIHC7nHouIWNATjF
 RdO7/CyLF9KmC1j5AAAAA==
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ej1-x634.google.com
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
Changes in v3:
- do_fcvt_simd rolled into do_fcvt_f.
- Test assembler rewriten to avoid unintended clobber
- Link to v2: https://lore.kernel.org/qemu-devel/20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org

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

 docs/system/arm/emulation.rst     |   1 +
 linux-user/aarch64/elfload.c      |   1 +
 target/arm/cpu-features.h         |   5 ++
 target/arm/tcg/a64.decode         |  15 ++++++
 target/arm/tcg/cpu64.c            |   1 +
 target/arm/tcg/translate-a64.c    | 101 +++++++++++++++++++++++++++-----------
 tests/tcg/aarch64/Makefile.target |  14 +++++-
 tests/tcg/arm/fcvt.c              |   7 +++
 8 files changed, 115 insertions(+), 30 deletions(-)
---
base-commit: 30e8a06b64aa58a3990ba39cb5d09531e7d265e0
change-id: 20260618-jmac-fprcvt-1554d4c80bc8

Best regards,
-- 
Jim MacArthur <jim.macarthur@linaro.org>


