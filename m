Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21432CA0FE7
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 17:51:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqxoG-0007ga-6o; Tue, 26 Aug 2025 13:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uqxoC-0007eF-EL
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 13:50:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uqxo6-0007IC-1E
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 13:50:12 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b4d892175so29851975e9.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 10:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756230598; x=1756835398; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZR/RUH7irZ6A1UiT0VeZJ2PP4cGJptOqXwQzMuavR84=;
 b=RBRs9wfpfxdMlQ5tQro2GylQypWIdmij8gnMgyZXIT77FU+GuqyFEdQ15W2BSGXuZW
 lkZoJzKDt1biAd4them2xOtHJiwtBNGq3dR7QUjRqcoe9acqS9555PHIJB6ks/XeSrTb
 5aL4hRG+OKf4SOZANpVe3MDWsm/1vUBMYk5A2MtQ9BeEiv+vak7c30zhOX6RNdCiZq0Y
 kaXpeFpzx0g2riYQ8o+b3rXJGNpaWdiXOJBj2/FrvpyGw3q3LFR9IA0Wwr24DCQyEH5I
 5FpPm/a33W/5WBGtsI+vRAl4mIbNZGQN95REQnR9HNhLHYuF+226mPnFYsMnLXALnboF
 XT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756230598; x=1756835398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZR/RUH7irZ6A1UiT0VeZJ2PP4cGJptOqXwQzMuavR84=;
 b=clBDjHGjXfREpTrjv0AYLor/fuambaO6AD6HVyzdMXx6djywrJvk+c5Yo+gOuzPlwj
 OX34D61xXUmywZf1ubfqgai/I4804bzy997C0JLPn2xoPp41ZJRvHaUmFuioaonMsYLd
 gADVs4DE8WwtMU/VxS2Sx50hvdzPdgyAIo4wt5K630D2bSXIZSKIrSHmcj7/hw4t80eu
 g3bZenbqUWbBR3HrbxCuL/UJPjQiSpND+ekqdgta9odq8XQiNQDYAgRm+x+Bg4dsd/l0
 cvlycW4nEGeso3KlgVUdnvDooo/0dw1lcIfxvRQDbNlGekIDNJIvB+V5fCStEoNpSdHk
 osYw==
X-Gm-Message-State: AOJu0YzVK3jfCQqrvrOoSHMeFekKrXg6ZhkMs/MZY2DrJdEKbRIJzfaR
 gtr92tQEHfT6DQbwvv1aHDntcuBs7htyhY3Fohw+k7SZw7gW13C5Xr0SUVi8jrXbW70sPgIdhas
 IoNit
X-Gm-Gg: ASbGncvQKirp6dngMEee2fZvvRicFUByKk1Dfi0cLeYMfDJCYfZRa3BWu5MoDOBna2Y
 vvwlV8Ckr0DPiqsEc3mxrTBEbkVT753zWwSLsbUM2AJyxCUmDko3zI3BYMooy8nm6dz8lTkn8rs
 iUaaPY3/gE0A8EWtupsg94r7l5YfSBERVGPh8zcVqpQmQ+5/FhqkTig8LUHa0crobCq+RUdDdho
 ErZBnc7iWULpNvGQorAetWAecKyJDRNWNa4Bz1c8fE/xhCAaYKXS49gMIVxsTgd7tEJWukOzvrm
 3SUHbRuUZNxKVzMpfyoxVfdiX4OK3lPCV6FtbJBsMxOe9V4ZFCiUmLAISTsCNoNZ9wNsqM//FS3
 kbNHovDJ3nkmVfu2GWHXuZpJYilqIriWjg32+Rew=
X-Google-Smtp-Source: AGHT+IEbP3Rx/b48mBVvzwN1uckzNsWH1kGq3/1OhcH78QB9OacwBFE1ArCegs10pus07ZYVDJQMjA==
X-Received: by 2002:a05:600c:5251:b0:459:df07:6da4 with SMTP id
 5b1f17b1804b1-45b5179cc97mr137309045e9.5.1756230598512; 
 Tue, 26 Aug 2025 10:49:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6c5356a7sm2593435e9.15.2025.08.26.10.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 10:49:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Subject: [PATCH 0/2] hw: fix some leaks in xlnx devices
Date: Tue, 26 Aug 2025 18:49:54 +0100
Message-ID: <20250826174956.3010274-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

These patches fix some minor leaks in xlnx devices detected
by running 'make check' under ASAN.

thanks
-- PMM

Peter Maydell (2):
  hw/misc/xlnx-versal-cframe-reg: Free FIFO, g_tree on deinit
  hw/display/xlnx_dp: Don't leak dpcd and edid objects

 hw/display/xlnx_dp.c             | 10 +++++++---
 hw/misc/xlnx-versal-cframe-reg.c |  9 +++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.43.0


