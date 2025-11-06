Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13697CCFA03
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 14:52:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vH1LU-0006GV-To; Thu, 06 Nov 2025 09:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vH1LT-0006G4-Gt
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 09:52:15 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vH1LR-0006bx-NK
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 09:52:15 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-426fc536b5dso729913f8f.3
 for <qemu-arm@nongnu.org>; Thu, 06 Nov 2025 06:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762440732; x=1763045532; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zaI8dwX6Y2BdaaWy6Agd0/TSyHU8TUnREyK7ku3Rgz0=;
 b=jlb1fgSo4aVz8jl5d00Fs5/dFifhyMR6O3/Qh5WdEuo7JAfd2dojCj/TGlKpPXLQI9
 OkC6SRn6tloeJuGMRRAX9cdtkLPn2sqwqUZB9KU2ouyQCUUAvrHgxrVLo2TeB9I90vcm
 ha6x4dP6vs7kYAA/KHk94CpO0c5c9dACLGtx5nYnQ/U3x+yPFucsqInl6vPN3rdjYUee
 jEKaAI3PlmDmcLoWxWUQehBvhm0lah7cBHA4cn9XbFdN1rdjhr7z7cAYdm3SjiNyP3Rm
 c+Prhbw8wWIs3uzHwHfMTskYxkZ8vJyiTDSyHKWhhV4pjiwwppmfKah9eDuF/erZu9Ve
 stOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762440732; x=1763045532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zaI8dwX6Y2BdaaWy6Agd0/TSyHU8TUnREyK7ku3Rgz0=;
 b=TuT7kTzGd4uTom2nN39luyQewrj1DJO+9av5dB/pSfX0GrSlCJm+vPhdf9slNL1zte
 bk8NtqYCDguZIPlTv0v5VOEQIzfrxZfxMVaFYj8sLmjMOrcJKxTOQZF/aKeUPPCaBgi5
 +hN/L0IhuHSmEEb3nTa/84AbANEIHqz5MDMJMvf9gTSGVTEEcPgxpndz8l4/1Et0aTAE
 i2c1yrh8aKaDbiWnwT7mFp9TceRX6Mwz6mRWqQ6/GNcGE69tVE3nT5/rZIYa0se6Lupx
 EhVlKVT6ADYUUu/aXhJqQI1FRhos3KYXTBWDVYYn9xbZHl6M6SFWgXvC/XqyNqIU01dt
 acOw==
X-Gm-Message-State: AOJu0YxDRSJVJJ/4GhZkCGAsoHKWiY6iy6ZKMYqj7MfZyMLGsHYlbEq2
 64E4XiPl0/EXyRfRjzxjBlaW3D2KU/tLGmrSKMQjWvDXNaYq73AyB0iGe5/kltMiXC+LBJEL4+s
 TD/Bi
X-Gm-Gg: ASbGncvHixpBjzod8Uh6EbsBTxHQQjBxiv/e4WSLdWKBXFJBDhvIQWWSnck1WeL+949
 VyWDalgVIas5eLFD2yWa0v4pbE5jqRAjft+A0H/YNVu+n6902A+dpoi0S1Delh4Brmr/vZVAf49
 InjUE4O9gH+wt1XETosi1zXqOGDFSqOZEbsLa/DkIKklgZVnb227Wv9MxLtMl5+AmJvrdLRXM3l
 DlXccekIkH24mJv71CSzHthr5dvaJP48SAUxMh0hruV5vg1QenQhGdWv5yA3Fd81uDPfsiBze1W
 2MFNy14nDPXdBTclpxhcRzy/wX1X3Uyuf18nc8eZvbGe6/1ssQ+ZFpfHJA5ntKo+QZUxEIUjbIC
 QhoQQD4XTqK0POBMDyk+Z4j05Kagl0xapvKSp9GgRIKNPFc2+liMY5R/Tn77Cw/wTQZeBABlNnR
 N+a6EO4oiKh5NPyQIs
X-Google-Smtp-Source: AGHT+IHjFsjMpxEgFpio8KVQEl5zJait4ivfHU5hGH9axzMaL7P7WlFSRKWsM2k/j2Jt+NwYUxRw8w==
X-Received: by 2002:a05:6000:26c2:b0:429:cc6b:e011 with SMTP id
 ffacd0b85a97d-429e33063b4mr6566070f8f.36.1762440731924; 
 Thu, 06 Nov 2025 06:52:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb47721bsm5694891f8f.25.2025.11.06.06.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 06:52:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 0/2] xlnx-dp: fix a couple of fuzzer bugs
Date: Thu,  6 Nov 2025 14:52:07 +0000
Message-ID: <20251106145209.1083998-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

This patchset fixes a couple of bugs found ages ago by fuzzer,
where a guest that tells the device to do silly things can
trigger an assert() or abort():

 https://gitlab.com/qemu-project/qemu/-/issues/1415
 https://gitlab.com/qemu-project/qemu/-/issues/1418
 https://gitlab.com/qemu-project/qemu/-/issues/1419
 https://gitlab.com/qemu-project/qemu/-/issues/1424

None of them are really very interesting, but the fixes are
straightforward.

thanks
-- PMM

Peter Maydell (2):
  hw/display/xlnx_dp.c: Don't abort on AUX FIFO overrun/underrun
  hw/display/xlnx_dp: Don't abort for unsupported graphics formats

 hw/display/xlnx_dp.c | 81 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 7 deletions(-)

-- 
2.43.0


