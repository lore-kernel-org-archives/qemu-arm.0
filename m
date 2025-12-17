Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E53D66BA6
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 21:21:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVyxG-0008Sq-C2; Wed, 17 Dec 2025 16:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vVyxB-0008Rr-R5
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 16:21:03 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vVyx9-0004Wt-Mg
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 16:21:01 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7f1243792f2so4245318b3a.1
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 13:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766006456; x=1766611256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x/gghau56sm0NCSiwUxDQkJGO/WVwDavHdB29ExM2AI=;
 b=IXFR/C5QFQ0g034AUuopbMrn/bxkY9uPQSQdLZcG9O3MJSotn2mGjzwm7BHyvY4CXv
 b7a4hrTw3p3Wfc9NyHymnX45yICNj2yUZ3kIYjYf4XZtXS++otB2YMqGbaO3uR5hlkIQ
 OB+dalUYCMmBUfrbPWhKhjthVX11Ni6P4JINWIRT8BR/NTOfAye3bocHzCj/402cQmii
 wUesYacefyAA/y9fjTQpKsQm1gA2+rh9QuBXaTn/OjPwinT2wS/nyIrVUPIRw4fwYqaU
 mF3fbffOEMoXkHcTCTihEHQBZDNeP2JBQ2lwW9fWI5ChVRiN/ZMBxweIVUTeIwEZmQmw
 Y1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766006456; x=1766611256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x/gghau56sm0NCSiwUxDQkJGO/WVwDavHdB29ExM2AI=;
 b=C5OsGcfFd+9c6/Z++42yGF/aAH30I19kGzbd6ZUcuSatDzXgI37OBC38Dj6wZ9pZx1
 kgRaVDOd2RJiI1i7k2Epe0UqROtUlkwxEdRjfmZaP/zIZe4PzgHU9NajSId9T/hHcaup
 nXRO0uP3g3VCBhKjBmyh2mb4t8AbxRqd8zuK0qPaquYfP6nDztmsvZtqmwQvFcQkVt94
 5zZc3wguPGBcoyaeWbsoRPvPYpmjr5dVXeWpYzRfRZBWXeRG7mOZjX3DOFV7Hya6ULBE
 f5kp91NCCpGPh/Inr3XANh4OI2fHnx1bnX2UE2ePF6KAbBMJrBI2ZagGyDdZNB/Vk3U3
 5lOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzeYgNPfSBb1CR+b0n/W2bWqLmRvA5J5y9sTXLPD4/Rkc9lNz90mQBlbdOfdw3gvYfmsmoUjhKIQ==@nongnu.org
X-Gm-Message-State: AOJu0YzvonQyFuC5J0gukmw4YhgR9B1tqwBQEWJHlAVnJ2mlsFAZVp+H
 yotm8X8wdtnioN1MU+ui5qwN7VMIwTqbnw/J+GzhAR+/tatDz6fYycLMYc9yhXXW1hM=
X-Gm-Gg: AY/fxX6p4Y4+GKM+K095jtjGcgYYFakLHHZe05MujLO0P3wYKzumgDVaOs97ChCyK3Z
 b1Y1taOUG6VoXTs8ro94Q+MyWc2n7UkajeH1IdsyYbi1FOTtTR55dDQhhQfHC0tEXr4eT3cUkGY
 cVGoEZ3Tbb+Ljfx9bgnv9yruFcB+M8i360iFttOP5j3IuvIaVlwgUW/Kyxw+ObFXEGLpkNxurfo
 hNWdv99xXwIR/8CiWQmbm6i0f7+RFVNyPW8ZyUu2q3C8ro4lMcjIKCwFssO3tZlfUMCGevQ7Kyu
 h/XY9zFtE/loBvEnZbgVnkGxMuAEG3KnQg/J7a8CMKSg2JFEdlGP/NnfL0w+0llOdBEk4QTeiVp
 HR5LJ1is/vZtMieYOadMv6+U0spotDio3yIotuoLcKFquCrC9yUYPco6odZmGwKLO/4DDRfYNhk
 haoK6LGCzW7Kh/1ng=
X-Google-Smtp-Source: AGHT+IHCiXVjAw85myQ/g+a/GuH8Zs9YVb4iTIYMNTtT1gxRQe9uoDvv5xMfWL2yxr2cKKp2EUNfnA==
X-Received: by 2002:a05:7022:e885:b0:11e:528:4185 with SMTP id
 a92af1059eb24-11f34c590bamr13549113c88.38.1766006455826; 
 Wed, 17 Dec 2025 13:20:55 -0800 (PST)
Received: from gromero0.. ([191.8.216.160]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12061ef3383sm1852476c88.0.2025.12.17.13.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 13:20:55 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v2 0/6] system/physmem: Enhance the Address Space API
Date: Wed, 17 Dec 2025 18:20:12 -0300
Message-Id: <20251217212018.93320-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x436.google.com
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

The proposal in v1 was to allocate all CPUAddressSpace structures
dynamically as the address spaces were added. However, after private
discussions with Richard, Peter, and Phil, I agreed to take the opposite
approach: allocating all defined address spaces (CPUAddressSpace struct)
for a target statically.

This different approach simplifies the current AS API too for the
definition of new address spaces for a target, while also simplifying
the changes necessary to achieve it.

CPUAddressSpace is a tiny structure, so allocating it statically has
negligible impact. Meanwhile, the AddressSpace struct (inside the
CPUAddressSpace struct), although larger, is already allocated
dynamically and allocated only when an address space is required.

The AS API simplification proposed here simply requires calling
cpu_address_space_init() once to set the total number of ASes supported
by a given target, and then adding the required address spaces using
cpu_address_space_add(). Consequently, there is no longer a need to
precompute the total number of ASes beforehand, which becomes clumsy for
targets that require different combinations of ASes.

Finally, the problem of mapping a sparse sequence of AS indexes to a
dense sequence of CPU AS indexes (array indexes) disappears, since a
CPUAddressSpace struct is statically allocated for all defined ASes
supported by the target.

CI results:
https://gitlab.com/gusbromero/qemu/-/pipelines/2220115152

v1:
https://mail.gnu.org/archive/html/qemu-devel/2025-11/msg04406.html


Cheers,
Gustavo

Gustavo Romero (6):
  target/arm: Initialize AS 0 first
  target/arm: Add a _MAX sentinel to ARMASIdx enum
  target/i386: Add a _MAX sentinel to X86ASIdx enum
  system/physmem: Rename cpu_address_space_init
  system/physmem: Add cpu_address_space_init
  system/physmem: Use cpu_address_space_init to set cpu->num_ases

 include/exec/cpu-common.h          | 23 ++++++++++++++++++-----
 stubs/cpu-destroy-address-spaces.c |  2 +-
 system/cpus.c                      |  4 ++--
 system/physmem.c                   | 12 ++++++++++--
 target/arm/cpu.c                   | 28 ++++++++++------------------
 target/arm/cpu.h                   |  3 ++-
 target/i386/cpu.h                  |  1 +
 target/i386/kvm/kvm-cpu.c          |  5 +++--
 target/i386/kvm/kvm.c              |  4 ++--
 target/i386/tcg/system/tcg-cpu.c   |  6 +++---
 10 files changed, 52 insertions(+), 36 deletions(-)

-- 
2.34.1


