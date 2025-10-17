Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BD4CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:08:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kCB-0002sI-Jw; Fri, 17 Oct 2025 09:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kC9-0002rg-Bl
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:08:33 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kC6-0004OM-7j
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:08:32 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4710022571cso16148515e9.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706503; x=1761311303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hYxxqu1skJhNaU2etE0YVESBXvvL5HqpaYOYtLTvQr8=;
 b=CQRsgKY+1+nSij3syVhLRxp3emfvyMQGY1mWo01Gio5QEtMQFur0gwzPLcxFcg/eH2
 Z2nXsC0HrfuRHt8uAQMYYs31/wWRA5H76zCG9HP6vuD5e92kPoAJDoeIzrbI7ZArLw3W
 V5vR8BEzqVqPR6zcsl3mkjKwZ1oMNREnmxssoN4NANEKEYbh8SsaK+fRFoK+7T6eDpt4
 ay1F4uNQxkkjxqCxDnhy8IJp81py/5ZfN85zCEgi5o9qf7F81RGFK7FlGOU1vcgYA5DZ
 p/Cfb6kOE+3AnwHjokhkNXv2DXP3n//b1NeCnEc9OlJyb8M9/8uQSMheghO1LgUAKMnJ
 T2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706503; x=1761311303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hYxxqu1skJhNaU2etE0YVESBXvvL5HqpaYOYtLTvQr8=;
 b=MVgpO9lH2dqU2/Q69fRw1vltp/+827jl2rk74E31rzeuRC7bSaO6Xkq1pOuM2PAJoE
 aKqi5KLwjOTmm1v0FC4t1SOShIF7EMCuGuUWmCUpv12wlkbmXX6cdS9/3UmQp5GXAygR
 L0em6/Xqd4L0tOWD5U976B/BmNu2VNyP/1Ax0oVkxgEevaQoFh0eObgE+bc9Tj6kBw6i
 JMEKMwrUgaGMJn6BBuEozs5D6XTc88xm0y+uoIBaCcHDt/jrXpp6UGGoFrXNkOGNs0lV
 k0izobZ+BLRTD9Q/+Cp4xwQZdv3u3L/3g67OPiVH5hRuZ1yp54HiOOp8s+ZbApCes9iy
 tY/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvjFw4XjtB/l8l7YVDoOPuMycKuqeYt9GDGovFMY8JGkBk56RjisCCH9CwYP6p7e/L3/PAAadfuw==@nongnu.org
X-Gm-Message-State: AOJu0YyVdzJxVLrZxcGApKcvDtCKkMfG2YRKqdWxCmsUkOw5yTdKyOfD
 5PIVKTfqnx7bfZv2XjFPPjxrQZ6k1LTNjs5Eo11bCm3ydZdEufWp9wwxtR7a4Wg2wjA=
X-Gm-Gg: ASbGncskAH0Xm4vdX8/rxCJt+ardoBbQpIFkIv1+AyNWaZWZHCg60K/g11IIHs2HbgA
 v6U1QE6FBZnebktocN8b5W93hMo3IV88woJRvV0ig6Onqlee765Y7DQiwq5q8Cj5qBzjaVq60LO
 j8gLEJjnf7MEN8HImIWNO1g8rbqWoYDSbUtdG/42TnDB7PKKNgm0CrGnyhwo+eVuy9UAnu12lQ4
 BhNN0uH62nvu5vPPOmS919Fy1XWBl7wbh8HUeGggN0YNSwDISt/1a1+CGtLDIOr6TSCpHb5UhCz
 bDfAg61Wr+E84qNw0XswD4cya9fg6Peq0pdY4NTgCrjTL8Gid/GF9Idfv1V6jOFrZfBy1r47gdM
 5CG8l+mKP9aqP/pNLk1cDpvI+2nKxV0thX0FE1mUfpg3TsK52wQllutTUQKmmh9V9bpv4MkJh0S
 H+KdlVkEJAemF/Rb3FbyjaNc2BxIWa07iG3KtXEUIjHQ/37IxVbQ==
X-Google-Smtp-Source: AGHT+IFw1PQjB1wc2YqUQFh3WfP236Zf1UcUFQHkLg39oXERx/IUCPcIk+4zkFIPCY6kWP8uA4G59w==
X-Received: by 2002:a05:600c:3ba1:b0:46e:47cc:a17e with SMTP id
 5b1f17b1804b1-47117870544mr32185145e9.1.1760706502852; 
 Fri, 17 Oct 2025 06:08:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442d9e8sm83858185e9.7.2025.10.17.06.08.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:08:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/20] hw/arm/virt: Remove virt-4.1 -> virt-7.2 machines
Date: Fri, 17 Oct 2025 15:07:59 +0200
Message-ID: <20251017130821.58388-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
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

Remove the deprecated virt-4.1 up to virt-7.2 machines,
which are older than 6 years. Remove resulting dead code.

Philippe Mathieu-Daudé (20):
  hw/arm/virt: Remove deprecated virt-4.1 machine
  hw/arm/virt: Remove VirtMachineClass::no_ged field
  hw/arm/virt: Remove deprecated virt-4.2 machine
  hw/arm/virt: Remove VirtMachineClass::kvm_no_adjvtime field
  hw/arm/virt: Remove deprecated virt-5.0 machine
  hw/arm/virt: Remove VirtMachineClass::acpi_expose_flash field
  hw/arm/virt: Remove deprecated virt-5.1 machine
  hw/arm/virt: Remove VirtMachineClass::no_kvm_steal_time field
  hw/arm/virt: Remove deprecated virt-5.2 machine
  hw/arm/virt: Remove VirtMachineClass::no_secure_gpio field
  hw/arm/virt: Remove deprecated virt-6.0 machine
  hw/arm/virt: Remove deprecated virt-6.1 machine
  hw/arm/virt: Remove VirtMachineClass::no_tcg_its field
  hw/arm/virt: Remove VirtMachineClass::no_cpu_topology field
  hw/arm/virt: Remove deprecated virt-6.2 machine
  hw/arm/virt: Remove VirtMachineClass::no_tcg_lpa2 field
  hw/arm/virt: Remove deprecated virt-7.0 machine
  hw/arm/virt: Remove deprecated virt-7.1 machine
  hw/arm/virt: Remove VirtMachineClass::no_highmem_compact field
  hw/arm/virt: Remove deprecated virt-7.2 machine

 include/hw/arm/virt.h    |  11 --
 hw/arm/virt-acpi-build.c |  37 +------
 hw/arm/virt.c            | 228 ++++++++-------------------------------
 3 files changed, 50 insertions(+), 226 deletions(-)

-- 
2.51.0


