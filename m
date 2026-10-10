Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EA0CA9EC1
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Oct 2026 07:12:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFRDX-0001cm-1r; Sat, 10 Oct 2026 03:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDS-0001be-W0
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:10:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRDQ-0001At-Gw
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 03:09:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48b0d19cf7eso1772153f8f.1
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2026 00:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791616194; x=1792220994; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=h6U8Uler5ajH3/BSz4YcNBmA+lzpY3Luyh3W6+2XEaI=;
 b=yleNQ9MvmRr3gPDhR8ZOhZ/cVheu0yPEvvL5lKL0sJriuSntSnmbmZuuyNZWL472Pr
 zzyWqUZ9VBB+wyM8FuHIM/ogUV4y8Wlg3EkJHtWEvz9A0LPiMnNp/gxn8Va105oX7JGi
 2TVVR8Dfr0jcsRmwjyArkn+/8WtUGxQ8tiEcgopl4hMU0tdlsJmD4lsWLWu40pI0Gyhd
 /TQU6tkX6AM9Q0kAICaton1l8pbr0a5iBZxjaKiA56lpDEdq75Ed2r1yQC6Cil2R3EJI
 ci8j2YmXk3XcuJKXYNpCdhDDgNWsQv5BKxsBaI8vDPsnmq0yGidseLKyFOFafrV0fKZf
 gHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791616194; x=1792220994;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=h6U8Uler5ajH3/BSz4YcNBmA+lzpY3Luyh3W6+2XEaI=;
 b=S08sLvpC3pNIaDA2/0CuZdMvQz3byR8f+IEkol4aHqpzevYrdYBbt+V7BbcmiC58Hz
 2G/oWWqpjfcK2DBVj8wLRJsd9TfArO3eLWKdrqPWkK2rkcWqKfA3GWgpm0mavLIACJDt
 HbTh9+FtoQMIxf1XdJ04JpgD9soBOCuUFDGae6aU/KrVopl6UJgZ7zVzajLhq12Gh92u
 tBPomnrjVLShkMRTzTeahJX/sixWQNoPFyOyQBSiJ9er1SnkzCC1IbgkdbWrpwjYjgMd
 thUD4NJXIU5o2qgxXSR0ay1AgqOpND9CntBSoVZq6TihTP9MGMC2LdH3Sco+0emJR0r4
 Nf7g==
X-Gm-Message-State: AFq9FYIskftm9Rk22h38xrDeQ1MCGPxh0v4A7o+OG0H1+4FRePagm2nc
 VitJy/Kbtv1+OoiGiyLAOrPeW993AHnOyg2+ufuyHY6W0pJGudrZkYzWTd/kPnPhzNU=
X-Gm-Gg: AYBFou2KSNYN1KXpO8DvUIiGwdg/vGtqgQX/tDLsbxZK49F4gD/tKapp7Y0BeWclAUx
 w2Vej7ggDojsfEtN0sKUFYSH5EdZjTqer3qppmpq33VY7OehHxsGap1YhSq/4tLta8+Hnc71mS9
 BQS+42/ijRtBuQPWM+rkbndh5vWBRqrSLutFSB2pSMyODB8l367lRLGp+b8EjMT1jNsUK+vaDH5
 m+2/Zz7fpFKZqpRdzwXoKBSotkI8F+6ZrMFQAI+XHLkj0BR00IUpINrPMI13WyuYMKRBU1209yE
 Hehnv8u2T27B7yPpwo+GigxkHq3W/LO9rhRv9FgmCWLS12c95TaZa4owbqsjjiibN3vqgs5DLzL
 9bYnB+suSQzKxrxsWJdfuGFCVeuhPx/txKKdLzeGbVuCRyajOj+HNUcjcj8zSC3yLssIreRFCho
 B0z0vq/YtYGXW/VSVcQty5t0Hy6ShBGnegMe8HyGT1eKBtcmKJSwz+FOEUjkihNg7fNpeVDvAvo
 RYssZ+T2qY=
X-Received: by 2002:a05:600d:864c:10b0:4a1:8bff:9284 with SMTP id
 5b1f17b1804b1-4a18dcd532cmr64705515e9.15.1791616194177; 
 Sat, 10 Oct 2026 00:09:54 -0700 (PDT)
Received: from stoup.local ([2a00:1e:e082:2901:a2d3:66fa:95e6:7d81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abda3csm7662252f8f.36.2026.10.10.00.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 00:09:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 0/6] target/arm: Implement FEAT_IDTE3
Date: Sat, 10 Oct 2026 09:09:46 +0200
Message-ID: <20261010070952.323466-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

Changes for v4:
  - Squash accessfn when we don't need it.
    Rather than confusingly add el0 to the access_tid3 switch,
    complete the kernel emulation by squashing away the call.


r~


Richard Henderson (6):
  target/arm: Rename isar_feature_aa64_idst
  target/arm: Enable writes to SCR_EL3.TID{3,5}
  target/arm: Squash accessfn in modify_arm_cp_regs_with_len
  target/arm: Implement SCR_EL3.TID3
  target/arm: Implement SCR_EL3.TID5
  target/arm: Enable FEAT_IDTE3 for -cpu max

 docs/system/arm/emulation.rst  |  1 +
 target/arm/cpu-features.h      |  7 +++++-
 target/arm/cpu.h               |  2 ++
 target/arm/helper.c            | 39 ++++++++++++++++++++++++++++++----
 target/arm/tcg/cpu64.c         |  4 ++++
 target/arm/tcg/op_helper.c     |  2 +-
 target/arm/tcg/translate-a64.c |  2 +-
 7 files changed, 50 insertions(+), 7 deletions(-)

-- 
2.53.0


