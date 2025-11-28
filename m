Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10190D116F3
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Nov 2025 12:43:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOxo1-0001yo-P6; Fri, 28 Nov 2025 07:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxnw-0001qp-RC
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:28 -0500
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxnt-00035Q-R8
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:28 -0500
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-55cda719128so523481e0c.0
 for <qemu-arm@nongnu.org>; Fri, 28 Nov 2025 04:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764333741; x=1764938541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bG3O2jvVZFk8sYsOKPgYYB/R6tJPsLi9aFfjEWjZe/A=;
 b=jO9XA29oPR2uNmSJQ+GbKzPArAw/XtcnX2onNklWu8PwD6kM4WiaSBGeQDSBZAO9Mz
 tVyfxkyOB6lp3wJQBa23vizZWqBnowK88Yft/hh4FPh2iGFJN1KJ6B1S+q9qDsswUXX4
 RNkcYu+KX7PJYMYl7DCtDiUxrgxMtxJC67Y2JRDhdwnkvQKqTPBdUy0v1/RIZu0+j/tk
 J9VQCM9EDrfsqiCLPtkHBinNu2JbkhHbN7dDT2Z/9H1EagzBFHtnCqITBEFAEfpUY1F6
 +eqwspgyIXPDG8Sw8N+tOiI1C2pXBPqHAb5PEDaqJYbDrXmlPCDZPA8WuNErhhNNqvbw
 5xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764333741; x=1764938541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bG3O2jvVZFk8sYsOKPgYYB/R6tJPsLi9aFfjEWjZe/A=;
 b=Z4AHZ3TW/bY1MOojLK+EbCIzT9sIf8pMZivM1X/TF9R2v7mrqgv6AYHBuLSLr2+iQX
 g1rkrOdTLiPI4LKFJHlRHIQMwqUdOdw4MkPUZ8Bvecy69V8L4r2yJIRRcdByLjTUm2W1
 E2k3xvNdE/unQGu+klibWYa8/LRxrlTqx7f3pGjI411BJjs5qrSPXrWTeHf8h3V5DRum
 DDjG5EeNCoftzAmGKEoZOQjI7YTJ2/cRIfAmCkGl6HQmkRxV4FIcMmDzuVq/ZSeg+PT9
 kR5lWcvRpvRpDUMn9c6BQb9xHsjid7V0NppNe8YCDc0KNxwVCFN6HlbXYX03+gKIWrZn
 yJUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7YRcLs6cS74wSYrcf6SwLaYL/y47Hpn/j/9hHqPO5fBenKd7vMooPw5h/ng/A2jrM+Vwj6BC10g==@nongnu.org
X-Gm-Message-State: AOJu0Yz5FgPkhbj0/NK7Q+Kwnpmu4NuJh1jqT3X7+aQ5NTKRngBC5pkx
 +869/o3OJoSgTVXOmTPumRh6N10zfO2rxv/lXF24NH6bs7urYBlCUaL3Xa7jacNXedg=
X-Gm-Gg: ASbGncs8o3bS+cHNifaQs7tOVYd0nEkxV63pHfUadnqNEq5X6meChVzmtZeZuWfa201
 QuCd2UT49iOpWtv5cKSr2b7VTufKei/eCbZ9ZD5v9tKseEmfHfc9H4c6BhLJQia5OuC1hiepyrV
 +5C23TzaydsmMLfn4IgwGw0MNrd0jZzsoqWO1hUnJViTt916ACoS9HhaDbNmLmfLrn6ZU9pYGWv
 i+fZQMynwDdLCH9X9l7fBb5zdimQMUF0Rqpr2iCQEfJ3et28IDpaQEHmPTOhFQAqrA5TkfDdRPf
 1Qz8gv7sznByrikf9ZZUZMAzEVEIL28qcY2uTh/3axGOuj3YrUXomALz8vWPAGsXqcV5UZcDEVr
 uqEls8X0IanKhSVDVIDzRYxuZUMsmMyebk20+rEn8EmBtbufgXIvPtygjW766gODGdpZhhFcaZr
 EqaERAwAfJ+rNoOJ0=
X-Google-Smtp-Source: AGHT+IFxln2o/E+Y4LM17Iwrh+jw3hEgE2H0xYvJ1mqJ4RKBj2R8g4AFkLP5KWVeIZN14ThKV6R4JQ==
X-Received: by 2002:a05:6122:a08:b0:556:e951:b544 with SMTP id
 71dfb90a1353d-55b8ef92419mr8107814e0c.9.1764333741254; 
 Fri, 28 Nov 2025 04:42:21 -0800 (PST)
Received: from gromero0.. ([177.139.2.175]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55cf4e1d56asm1776930e0c.4.2025.11.28.04.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 04:42:20 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org
Cc: peter.maydell@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH v1 0/6] system/physmem: Enhance the Address Space API
Date: Fri, 28 Nov 2025 12:41:04 +0000
Message-Id: <20251128124110.1272336-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa36.google.com
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

CPUAddressSpace structures are currently allocated statically in
cpu_address_space_init(). This approach is clunky to use because
cpu->num_ases needs to be set immediately before the function is called.

Moreover, the static allocation is tightly coupled to the Address Space
(AS) indexes, which, depending on the CPU features, can leave unused
CPUAddressSpace structures.

For instance, on aarch64's 'virt' machine, if secure=off but mte=on,
three ASes are allocated, but only two ASes (ARMASIdx_NS and
ARMASIdx_Tag) are actually used.

This situation gets worse when new CPU features that require additional
ASes are added, such as FEAT_MEC (which I'm working on right now).

This series addresses these limitations by allocating the
CPUAddressSpace dynamically.

The last 4 patches in the series probably need to get squashed with the
changes in the API, but I kept them separate so it's easy to see how
simple the changes needed on the target side are.

CI results:

https://gitlab.com/gusbromero/qemu/-/pipelines/2184288007 


Cheers,
Gustavo

Gustavo Romero (6):
  system/physmem: Enhance the Address Space API
  target/arm: Initialize AS 0 first
  target/arm: Add a _MAX sentinel to ARMASIdx enum
  target/arm: Use new CPU address space API
  target/i386: Add a _MAX sentinel to X86ASIdx enum
  target/i386: Use new CPU address space API

 include/exec/cpu-common.h          | 16 +++++++--
 include/hw/core/cpu.h              |  6 +++-
 stubs/cpu-destroy-address-spaces.c |  2 +-
 system/cpus.c                      |  4 +--
 system/physmem.c                   | 56 ++++++++++++++++++++++--------
 target/arm/cpu.c                   | 20 ++++-------
 target/arm/cpu.h                   |  1 +
 target/i386/cpu.h                  |  1 +
 target/i386/kvm/kvm-cpu.c          |  4 +--
 target/i386/kvm/kvm.c              |  4 +--
 target/i386/tcg/system/tcg-cpu.c   |  6 ++--
 11 files changed, 78 insertions(+), 42 deletions(-)

-- 
2.34.1


