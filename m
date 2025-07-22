Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5BFC83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 14:28:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueDxp-0004b2-HD; Tue, 22 Jul 2025 10:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ueDuY-0000ru-N9
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 10:24:10 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ueDuU-00046P-M0
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 10:24:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b3aa2a0022cso5675996a12.1
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 07:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753194241; x=1753799041; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JuP9t9FMuuuQWBDGvh+2Zef0uC/IglPFkPL1Mt5RprQ=;
 b=n2N6bvE8Q7zhFUQSdsjNRD/QJJ7y4NBjbPdeN+DaVIzb4y7oI6L2fvWLnp7LufXp8D
 +pyS5Pf8Bx4YI1rYifA7osRDVLuUDdUFXeI1quO+fCS091y1sx2BBw2or6H2Vz4LSr7F
 qJXlzBwkynKnzC1Wbm5AxSUKz4LHNUWDDEoj/PT4B8WD5N2gJM0V+MIrERG995rGYIjq
 FT2B7m3NH/HoVM5HW+J1+hWl2NK1h785w/RBP9t9nlivEOaRAx/kg0XHxn9kCXuXY0gX
 ikl2pR6S8MkLkK658iceEf9wFqDMDLtBKm2l0JcGH9gTTJu8Oq6JUz16ZV4/FbWiv+Cs
 xwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753194241; x=1753799041;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JuP9t9FMuuuQWBDGvh+2Zef0uC/IglPFkPL1Mt5RprQ=;
 b=VsEHC/BxVaYe7TN7yIBag/o6vpL9bNt/XwD5MrCLV1V2E4JTDR9QSWYWe7f1q6/7d/
 7A/m9qUzvjYJD2srRZYn63oEaf+vdTqWHGcmEJBgqJnPm6G5LV7C6KcSCQcBFr6XtizN
 VKm2uJsZmGY7vBBT1Mc1yOtgu63/rp01lcbDaRnccYchAUeukQW7ejyvxd7JS4FJw11B
 8HhFN9ItTphrO7XtsrXFgozO+AOD24GuBNYu8DZZ0+Ff8TBfkFcmzDKfU0vr5cDpTopY
 ERiCQEWfGHnd3wicUQ7ABxuxuTUnd3LKWHNcPaBgxQrEe3yJNmEMXlCWp8sV9FvZAWVs
 9I0g==
X-Gm-Message-State: AOJu0YzpNiqqpXy9gJvBszyHXYicNSyuVJgNQ5FczDKvWEy1fjcNOM89
 GzTLqurDafIKgcSDk6MgQyYim6eUM90p9VkgaKkRo6q2CZPsCGao/MWCRTChEk326M8=
X-Gm-Gg: ASbGncuB2QjLuNKdGXbputs+ozVTjJCbbGIWyPlvx/U2gLBvp0a0ZpOYbIcJ46be8sc
 DI6h2kiUb67dgQKllaAarSYHmLAgk8u3TsTF0hitlVXIujHZ+qT9hu0zBUmfQwPKNJsnqsPefI/
 V7hyTpFm2VaVN/pgzLVEWv9G+5fiAWhx55NjvkHjGl6IkYkLPNWY+7VFuZKuoEfHtBBIcHlokUR
 r7gZSf0/t7vGWGDVgFEub5LB2gNLCjW8DTtUopPu7p8Sq16OwnC3s9UNv25zjOUX7nmxQjUVASt
 A7KyuadRD42f6QlpL2c5ZVBgDPF7nKEMAWGH1zYYM4TYL++xctrt+RxRGPV6lCes1oN6HXpciLJ
 SpkUVXZMdBw8MP6NH3OYJqlZiukih
X-Google-Smtp-Source: AGHT+IHSY8MYq+yVE50F1/FZXH7sBm4FpJaCa8xsQKVk74IUSQJlo4qIt9si65KEavF23YSy/tfRZQ==
X-Received: by 2002:a05:6a20:1594:b0:21f:4f34:6b1 with SMTP id
 adf61e73a8af0-23811055c32mr41043106637.14.1753194240610; 
 Tue, 22 Jul 2025 07:24:00 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe653a7sm7274980a12.2.2025.07.22.07.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 07:24:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 0/2] target/arm: Fix sve2p1 mtedesc assertion
Date: Tue, 22 Jul 2025 07:23:55 -0700
Message-ID: <20250722142358.253998-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Hi Peter,

Sadly, I couldn't reorg mtedesc as I hypothesized, because of
different usage within AdvSIMD.  So I decided to expand the
mtedesc from 17 to 32 bits, and then pack the gvec desc and
mtedesc into a 64-bit argument.

Lightly tested so far, but it does fix the LD3Q/LD4Q assert.


r~


Richard Henderson (2):
  target/arm: Expand the descriptor for SME/SVE memory ops to i64
  target/arm: Pack mtedesc into upper 32 bits of descriptor

 target/arm/internals.h         |    8 +-
 target/arm/tcg/helper-sme.h    |  144 ++--
 target/arm/tcg/helper-sve.h    | 1196 ++++++++++++++++----------------
 target/arm/tcg/translate-a64.h |    2 +-
 target/arm/tcg/sme_helper.c    |   30 +-
 target/arm/tcg/sve_helper.c    |  145 ++--
 target/arm/tcg/translate-sme.c |    6 +-
 target/arm/tcg/translate-sve.c |   38 +-
 8 files changed, 772 insertions(+), 797 deletions(-)

-- 
2.43.0


