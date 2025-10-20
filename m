Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581CFCCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 09:40:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAmNS-0002cQ-RT; Mon, 20 Oct 2025 05:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAmNQ-0002c1-Ua
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 05:40:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAmNO-0000Oz-UY
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 05:40:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so31927925e9.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760953224; x=1761558024; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=grfkl5mKuMnsdzFL06eSw4GbmqS2DSCVTXLFKaN33PI=;
 b=Zq/91YpgVO2RlO/EAoyrCcidUP0IEqddfPgnygvZoihUWQsfZh4mU8qt2IWrbwE5TP
 dEJPLcZl9WOiSCYERLTHHBoZTUyZrdkcreR+shua4cenyCm7cbvJzGQ1eSDlYJe//Q/l
 7lc5FxsQMS0y8icmrvMMMXp3G1o6RI2SnYgXiLOBU7qbrU2aM8F3MFFO39Se/3+sTmgy
 E3tGaZQFYNLTQWu8I/7P3dYXCEGMEHa6teTJfWMIhid8HXK/lN75+9+27U+9GC3wzljS
 TrEJDxIPneBAt3MUqcsBxWiZR7d/7kSJ4mfNLPtOXU5vJXEwY1ftnA/cVZaJdli0dJoS
 7SAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760953224; x=1761558024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=grfkl5mKuMnsdzFL06eSw4GbmqS2DSCVTXLFKaN33PI=;
 b=D5edfwtosfCi3F4dLObfp87KphO6E55pl/g3J2alixfXKgYyA7/fEoiSRAOtMpUhDP
 jaPGONd0Vl0OuCVWNlIarVF5HOFyIqfyA3ZlgG79yYfiZ7MJ0jpHQtL+Z3KDvSFdZydD
 9KspANvvCw36Ddmq6xuv2GJ9Z52mzZN7ajRKDfml+pqh3FK83UNMO2tsQxjcCmzdJIGG
 HnuaSSUitmSMofANg9Es6KBLecH4UGYUEwcb+2zW2iVmQ5RK8tm9fhakfSNUjZeXV5N3
 8gzT/77umLo4IkxLrVSVunInO8R3PbWfVACLCLB9U1xqGTcH+g4eb+0wzrKEumK2U7F7
 +a4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlqM68tjdwuqe8csxT8dGE9ZITtaodov2pjZfHDqaWOEcQtyiI2DRl88JvHNtHBJaz+qu782tZ7A==@nongnu.org
X-Gm-Message-State: AOJu0YwBGyYhjdKCGSIBQ5kPuMbp9BaEcMmZfh3upexmRqQXoDttz9AP
 6Abg4kUAPXtS8gPZnafTHaN2jl+VoOnG+FWrNdGGEc0mhPtcOGiyvyob9cUMk7jvmcI=
X-Gm-Gg: ASbGncutqklc4xuNcc9wPuBsTUJZJ2/m7NAdNoNjX9WXeJiJJO6dotRVN3H/vmK3Txo
 BOY09+eLEYre4IQ1Ow0JGWTKTengCqfvWlhr6byzyZQq0kql7Et2lKVinlyGOmOfiWfl/6vXr9s
 EykalySzXYh7s8LpL2WgD0YbYu/3cOxdicA9FerOVLTdLZjGUaCfY5Tlzdi3bD5v3PYoQonmuTd
 XRUKK2sNXoNPSWocrT9kJwESlNrUbz6KBvKK6YCV8Cu97lYYjBZ+j2TkpZ5Yx8q5gPsA9EseaGE
 Q4dWlKxetrSx5h043BRikIBLRPfbK5N08QMCwIInrgI65da+n2stwIecpec3BhKZJoOBoScKe9L
 8MUOzezacTA7moJkxIMPmnKmaG1lE2kU2YgLdMTg9EsoxckdLMmtGT6A8Xc/lTSx4W72kxeP7tl
 veCzhvelpgHOP647463f2hGe57Rk0hqWcSifMysMxtIcQbb7j7wA==
X-Google-Smtp-Source: AGHT+IE1qVanHZDGHewTUyiAL8EuvFWb5zbDZYoVy0pxb+uxE/ntxCNuPQ4t+Nrgw1DJUY3nBZ309Q==
X-Received: by 2002:a05:600c:8217:b0:46e:32d4:46a1 with SMTP id
 5b1f17b1804b1-4711790c372mr96184865e9.22.1760953224099; 
 Mon, 20 Oct 2025 02:40:24 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442d6c6sm216196705e9.6.2025.10.20.02.40.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 02:40:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/4] hw/arm/virt: Remove virt-4.1 and virt-4.2 machines
Date: Mon, 20 Oct 2025 11:40:17 +0200
Message-ID: <20251020094022.68768-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Since v1:
- Do not remove virt-6.0 -> virt-7.2 (danpb)

Remove the deprecated virt-4.1 and virt-4.2 machines,
which are older than 6 years. Remove resulting dead code.

Philippe Mathieu-Daudé (4):
  hw/arm/virt: Remove deprecated virt-4.1 machine
  hw/arm/virt: Remove VirtMachineClass::no_ged field
  hw/arm/virt: Remove deprecated virt-4.2 machine
  hw/arm/virt: Remove VirtMachineClass::kvm_no_adjvtime field

 include/hw/arm/virt.h |  2 --
 hw/arm/virt.c         | 29 +----------------------------
 2 files changed, 1 insertion(+), 30 deletions(-)

-- 
2.51.0


