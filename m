Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260EEC87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 01:40:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiNiF-0006iD-H0; Sat, 02 Aug 2025 21:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNiC-0006eK-Su
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:40:33 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNiB-0004b0-5A
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:40:32 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e8fe3aeffb6so1477222276.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 18:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754185229; x=1754790029; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4MW07FbLyT0yKho5UYediTDDFwRORlQQBlI1MJIT9Pk=;
 b=IX/dxSl+6PnEtF5ouxvNjlg12OIY8qCNdTNckbYI8fm89sA0Vj41P3PuyYZQmuUzuF
 qeheNJcx8qVGf30xCChQnBiro9n8+3b1PlUvGrg7GD6Mrj9iNkJ3HGhtcXLhfCqZIAjt
 VStLnW/pezP+M4FmzkxT4cCNb+A/cOnWgbCXLbWuzlCrV20UtLbDTgOvI3u+3tIKcyD1
 3RTNoBcsXz5EwxV9Ik6aAIC0VeyZ49P/W3W80TsqiOKc5iuYfkLJnGJYtmSuodfvo8Ly
 NQxOYGXzKT+IjXAM+5uuYo1u0zFCnoFxVtvc2oUIBPJSWMUCj3UN4g3+XEVuiL7t3IOE
 0zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754185229; x=1754790029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4MW07FbLyT0yKho5UYediTDDFwRORlQQBlI1MJIT9Pk=;
 b=IwXFYrdiAVnyoaianFXX4pFPxh2R5j8A+vg+BSBW+d3jcTsVnDPbeTp3l6WUc9lGf8
 Cv7O++9vgLA+Ou88HNfmFhTboCIOQsjipo2v44y6sVs2pWDQSwou25WjEN6zRAPIYOEz
 ATqAlkZEx4cJIcdH7jHxIg/J17NxCrAYny4a4nlSRSPK25opjEQfJDp8a0fIQQtQDCK9
 rQA2A0zO0xxzdzJrl9chzw+ALxL6PcuG6qJBVcygN/t7KbMcu0Miqwtzmbdhrr5XGtpN
 lp960jm3RvRAjDWI5W6wMinpbz8OrtgRwJwBSdLypUYaAPdYLEYNcK8ulOkI9NbNj7g2
 lDtA==
X-Gm-Message-State: AOJu0YzMuxEFgiZ9J1F8jqwmZE99T1TnLVC/HJBDaJNClTxvaJbjvFld
 2hkAnZBFyGyYYm2Y0kQ/pOurgPe0Mrxs5+XdIPl6Evq7oqcSoj3cuMN8dWWm2fWnddKg/TMUtd8
 rSc5rEP0=
X-Gm-Gg: ASbGncuKH/r7DpLbAQxQ4wiApEHcjgACkQ7ugoqHC5yiG+zQnoNGGL7WrVmcv5pRgbf
 pY8bFuXVDg7zLqWyTPbHzLM+exLJolfeKQmSLiv3soIAID82v1vBw+atMbnXUuTKl2d2ukTk1a9
 5Q7qqs5y9FerGAfqaM2MwtAbGHZHflJrwt7GZ9wIyxQfZGUwqA3P9LEXTO1Ev9hQmYv6u6B5Ttg
 4kgmdZiPOYQywwj+oPS7bIgffSa7w78u6H+Xs+JfqfWWnkrP/4Pq8bB1RNITbaERwAc3xMjMslI
 oRed8442lkb/DkIKO0kUA9kQ93UpFNKubMkyeht+t8gyuj83W00puTBEAdm6/8+CLhAyrUg8OG7
 zr2Y5c8YL/aXkL2jnnmupAYqfnD1XivE01uuoLoS1g/OalstPuS+o
X-Google-Smtp-Source: AGHT+IEhJpvQcJBqv014DezRMUs1ohrVQsCmLneqU9HYm0ZVYJZlNzswadH3tfOyhhqhBck5+aVLzQ==
X-Received: by 2002:a05:690c:660c:b0:710:e81b:f7cf with SMTP id
 00721157ae682-71b7ed716bbmr64534277b3.13.1754185229481; 
 Sat, 02 Aug 2025 18:40:29 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a6031a1sm18753227b3.86.2025.08.02.18.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 18:40:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/11] target/arm: Implement FEAT_CSSC, FEAT_CMPBR
Date: Sun,  3 Aug 2025 11:40:08 +1000
Message-ID: <20250803014019.416797-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb36.google.com
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

These two extensions are related due to sharing ID_AA64ISAR2.CSSC.

I had intended to test by bootstrapping gcc under emulation with
-march=native (that seemed the easiest way to test the short
range branches), but that failed for unrelated reasons.

I'll try again next week.


r~


Richard Henderson (11):
  target/arm: Add feature predicate for FEAT_CSSC
  target/arm: Implement MIN/MAX (immediate)
  target/arm: Implement MIN/MAX (register)
  target/arm: Split out gen_wrap2_i32 helper
  target/arm: Implement CTZ, CNT, ABS
  target/arm: Enable FEAT_CSSC for -cpu max
  target/arm: Add feature predicate for FEAT_CMPBR
  target/arm: Implement CB, CBB, CBH
  target/arm: Implement CB (immediate)
  linux-user: Change exported get_elf_hwcap to abi_ulong
  target/arm: Enable FEAT_CMPBR for -cpu max

 linux-user/loader.h            |   2 +-
 target/arm/cpu-features.h      |  10 ++
 linux-user/elfload.c           |  12 +-
 target/arm/tcg/cpu64.c         |   1 +
 target/arm/tcg/translate-a64.c | 219 +++++++++++++++++++++++++++++++--
 docs/system/arm/emulation.rst  |   2 +
 target/arm/tcg/a64.decode      |  26 ++++
 7 files changed, 256 insertions(+), 16 deletions(-)

-- 
2.43.0


