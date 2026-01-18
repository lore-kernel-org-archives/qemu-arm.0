Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A83EC98315
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Jan 2026 22:00:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhaoO-0003g7-Ab; Sun, 18 Jan 2026 16:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhaoN-0003fT-7v
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 16:59:55 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhaoI-0008Ik-3u
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 16:59:55 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-430fbb6012bso2910023f8f.1
 for <qemu-arm@nongnu.org>; Sun, 18 Jan 2026 13:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768773588; x=1769378388; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MUqg/c3XOGu598nJL9AuyENZuHnrrv2YO9W5F9axxGE=;
 b=jsUl5ck4Le9b52AA/2iPZgr8mnMUUPCCP52ntDP7NBYnm45c5Ccwotbney8t5r+uMk
 Byo/5XSGYXZWrNqNTSAhdIUt9wFc7OrYsCoa1chGyCR3y4+W91KxxFIATygrjm6mcWc/
 SU60DFKGDxTqXms0AO1t8sTdSy6BHvGB0PZ0kLW/8IANBKcTeDwr/Gm3RB+qSpAQXjyp
 YZhcLPHOB3kX1YXjc8bVKhuosBEbXHPa+MIKZpGoYbvCnMcZYHMPtzGC8txI1VPoB35S
 7R56OMY88vXZdL3aCpoZQAmkX9WonC7T/yJuDdkDWLpNqOK8Qz9MthcFIGVsD6bxQZc7
 g29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768773588; x=1769378388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUqg/c3XOGu598nJL9AuyENZuHnrrv2YO9W5F9axxGE=;
 b=td91osi3BXnhlC0l5hXZm9FnE1MA0D7GsDomBW06dlDqEOr3bmtg4o8xG+tHdkLvW9
 u7yspeMW2rpXZHc0d70yglYbsgUFAi1gbwxa+R+l7pt7NANRoT+A9FtRZ2hn/iR8Dzdf
 vJJzQ85DbfngE/IBVOYE6DRC//+I7Ad4rf52fdAwXapznnA2Ui/GI0XnyYi9fLFMe/LA
 7sEcHLVqjkYPTELgCGHjjUYwBdPPpykUXO9SN0CSUvKPkHgoia0d1A8+MFAyqD990WtO
 0G6bEJT9RFnC4d4j4W9lSu7b7Yjk0ODHGF0YGfgtcbFRSQN7w1NgTEbNJ4q4sgsjnLp1
 4gmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaIJpj6N5V49vWzowvcl8svlMOkXNMfwkpeYc7+t2s1/l1aXA6qvQlmuH5pUC8sLJg1GNEZ2lm6w==@nongnu.org
X-Gm-Message-State: AOJu0Yxrk800NA5y35DWBlwI4QIekqHSfSLZh5MZcbbhEzMI1LDUbcmi
 iArx/toD2YrV+tsUG0BHi1itrzNY5oxO9trjWFU/NYPwQexePUtJGrU5WEECAAyaAcQ=
X-Gm-Gg: AY/fxX4HgcXdeFXJhXYibhM4bmL0iKD8OdG40WIaGqC4yolY9hDlpZKnayulhRt/9lm
 AjrPC72d0zKYVOO/4ilnGiyhYfoKVgy/J4hQBDi5K68ikR5p3X0/lWvlKZF03MdZ62CK6Hiy60N
 AKB3mna6ZcfvdtvRMmCgfahQmEjpzbUKd++V/27ZiF26zRFhipzENZ3tCnlRD9HguTplTaXKwab
 5LsLve8NFci53RN2WLCvfUgxeVkbrjI+GpYloS0y6/ryWtChbnd9q6nUYlW4d2+++cBmK60ZWec
 CFcZbCi/KnN/2p6dgc4j37mUdSvWSi6Q8uDBYqNx/flLlmYIPKshecnkJkzvGT48YH1Fh3zls67
 av3oprim7wRdVzOFzNl7TjMtkE1qtUzwyZO4J7BShgC/tkZpqc5NQfnWq4n8TeltEymf2W3O309
 oqsL5wSSxmDqCqXwOiHJ319qejruOrb7FvaeErMGlRilXfPNc27sU1BBKvfVyBVSWBOc1fOO8=
X-Received: by 2002:a05:6000:1843:b0:431:864:d492 with SMTP id
 ffacd0b85a97d-43569bbaf7dmr11905027f8f.36.1768773587869; 
 Sun, 18 Jan 2026 13:59:47 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356997e664sm17358111f8f.30.2026.01.18.13.59.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 18 Jan 2026 13:59:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Mads Ynddal <mads@ynddal.dk>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 0/2] accel/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0
Date: Sun, 18 Jan 2026 22:59:43 +0100
Message-ID: <20260118215945.46693-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Since v4:
- Addressed Akihiko's comments
 . Do not introduce hvf_arch_cpu_synchronize_[pre/post]exec() hooks
 . Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0 in hvf_[put/get]_registers()

Philippe Mathieu-Daudé (2):
  target/arm/hvf: Move hvf_sysreg_[read,write]_cp() functions around
  target/arm/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0

 target/arm/hvf/hvf.c | 167 +++++++++++++++++++++++++------------------
 1 file changed, 96 insertions(+), 71 deletions(-)

-- 
2.52.0


