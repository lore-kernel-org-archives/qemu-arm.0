Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp617179ejc;
        Tue, 23 Jan 2024 14:49:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIP0k15x0vYndcwr8B4cOLVDVx3PilnwOKV0CwPmj/d5O23eEm4rWH7jNTM5m4ptRbusXL
X-Received: by 2002:a05:6214:29ed:b0:686:ad7c:717f with SMTP id jv13-20020a05621429ed00b00686ad7c717fmr85161qvb.71.1706050172712;
        Tue, 23 Jan 2024 14:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706050172; cv=none;
        d=google.com; s=arc-20160816;
        b=i0Mw4cqLHvHaZnUocPeW6lzC6dF1PAo9/1Fz+fHlnie/TdAAYZD2BSBuC0yVay41zl
         xmAIEQtdWTFA+d4an4quieoSGHaf276NikaZlXK8id2hcvp5aR70BXsHEYMYWcFX4PPD
         aujIjKSZ2B/MEbSZSnlgTBmzSVx8hpce9WXNvo8MUkeESwVOOO6nY1zo7YtyLSo8H68Q
         GCQ8Da9RrKP6kqNc1cRyqMY25YdOZ0KaDPbH7VSlHkwP+dHrTRMuYpcFO2Ze6ZbK4vUS
         j1XHoY8u8+P9Sva1nqKkgaOeBIHdDihWXj5OuzsiEp2A6rPQCqlzPduLID3ux3wEVc2L
         Pbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=fUPFlWLk66em0xW/7Ae8qBKLbshqAGiGQJRoYlj0Wxg=;
        fh=syX9H1Z6jvTUZoUNlfCNxZiWCwEj552WMbtCUDPMiLw=;
        b=HxWjvxVUbvNwH1yIh885TdaWebzKhFyyWqwmbRECCV7sRZjTWuW94RHpTEEjvuZ93i
         eYI/URDdhfmMRJIydHGhcD3e7y46ED3xBr+z4V2m160YaB8c9Iuc0pQ7w/yy3Pnd7twW
         R3Fuk7A/5PhWw8Pz5y/ztcbWirpov0h+gW0Y3UzAuZ3FFrAlJ8lpIsp4tbuHep5rc7Rk
         Lk4zC56FQ8e593Pvgfqq78xvbmb8U0vdU4Q9oGo7mwLv0+Kgo9nOfbJ+ZFeHwtRgt7/n
         25tStciqw7LbeajldJE18UgmRv/l6hDHY/8edR1NNq8QM614RaoUv9dC2Zmo8jJuwOYb
         sd9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9JfOjwg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a0cb4c2000000b006818b5475casi9223793qvf.176.2024.01.23.14.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 14:49:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9JfOjwg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSPZb-0006z9-Lb; Tue, 23 Jan 2024 17:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPZa-0006yx-43
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:48:50 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPZY-0004GH-1N
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:48:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e76626170so53878755e9.2
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 14:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706050125; x=1706654925; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fUPFlWLk66em0xW/7Ae8qBKLbshqAGiGQJRoYlj0Wxg=;
 b=M9JfOjwg1DHOLe2NWwAs3y0dRyw/O6OzrjmCE59nUUqUs72pbqlgUSADr0YWsbdG52
 4HF58+ZCJDjovE0YqRmMtLX/9d5Ofb4a6C47IMd8P4cWSH+vp2/N1/LlGFlaU07FNgmq
 ImXoyluWdFGOVo7hdxhePQuyv+GkJztzrrTU2d/A1qNGjEyWbCJPsgH7/6F/sJqQB354
 FP8JwI7IEDfla+nLSkd9lQ6qEUosxE5jUQL7MQQino2rL7XDeTzu+lfOYPR9grlYW4pP
 BJfl+4rt4c8nqQigERqXPWwmNX28TmrjCOZ2p/AE2a7KEXUNfpRtc/wjsBGEt18aNiN+
 C3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706050125; x=1706654925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fUPFlWLk66em0xW/7Ae8qBKLbshqAGiGQJRoYlj0Wxg=;
 b=XQz3G8cuG+twB2tbOo86q/OG9sZpGPHYIAxRx3dApR7tJm9usMFJ7hMRwyy5ntuOCI
 01j9VCxYDsqkpmKKsVEXcN3+vDuXrv/mPk+ew93/qxa/bJk9PDGjmN8vItwL6o8sUx3A
 4n54RFWSWqtVERFNKKK1iEMajwB7pYauT7Yi5V/B0rK3R1DjY/Umruv9po8sumUQuVqJ
 6cnUC+b9NMhnpNtIp7AghURnrgK4fNx1VccGhzytK8DfphxtGb/2PwFiKKEvYyQwX1ZI
 hUvpJAn0Cir5F3AA3URQu6o7YxWCuZfrd4rQ7OkaOMD0Euua/odwHs5VZrZPAp9SFYU5
 N3kA==
X-Gm-Message-State: AOJu0Yy/PygjHOF3lwjbmS8cfCBAVuSK8lzPoWkLfUoq65Y7M8xFGl56
 7yZyzWSaQ7TkVLa6wUWHYY7NMZdhpbBz00Mfb/iLC+2qWSznV/cyY7MWklZTw8k=
X-Received: by 2002:a05:600c:84ce:b0:40e:44c2:92be with SMTP id
 er14-20020a05600c84ce00b0040e44c292bemr525133wmb.143.1706050125272; 
 Tue, 23 Jan 2024 14:48:45 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c4f0d00b0040ebf5956absm2919972wmq.29.2024.01.23.14.48.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jan 2024 14:48:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/5] hw/arm/aspeed: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 23:48:37 +0100
Message-ID: <20240123224842.18485-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VOEtWnJaoQxI

Since v1:
- Follow suggestions from Cédric from [*]

[*] https://lore.kernel.org/qemu-devel/e13c655b-7904-4e47-a673-4efd13c26b3d@kaod.org/

Based-on: <20240123222508.13826-1-philmd@linaro.org>

Philippe Mathieu-Daudé (5):
  hw/arm/aspeed: Remove dead code
  hw/arm/aspeed: Set default CPU count using aspeed_soc_num_cpus()
  hw/arm/aspeed: Init CPU defaults in a common helper
  hw/arm/aspeed: Introduce aspeed_soc_cpu_type() helper
  hw/arm/aspeed: Check for CPU types in machine_run_board_init()

 include/hw/arm/aspeed_soc.h |  4 ++-
 hw/arm/aspeed.c             | 70 +++++++++++++++----------------------
 hw/arm/aspeed_ast10x0.c     |  8 +++--
 hw/arm/aspeed_ast2400.c     | 15 ++++++--
 hw/arm/aspeed_ast2600.c     |  9 +++--
 hw/arm/aspeed_soc_common.c  |  8 +++++
 6 files changed, 65 insertions(+), 49 deletions(-)

-- 
2.41.0

