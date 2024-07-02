Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324f08esm5839957a12.27.2024.07.02.09.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 09:35:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9E1C35F790;
	Tue,  2 Jul 2024 17:35:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com,
	drjones@redhat.com,
	thuth@redhat.com
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v1 0/2] Some fixes for running under -cpu max on QEMU
Date: Tue,  2 Jul 2024 17:35:13 +0100
Message-Id: <20240702163515.1964784-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: X8MuXFpBEd+H

Hi,

The following fixes try and make the experience of QEMU -cpu max a bit
smoother by actually checking the PMU versions supported. You can also
set -cpu max,pmu=off to fully hide PMU functionality from the
processor.

As max includes all the features we also need to take into account the
additional TGran values you can have with 52 bit addressing.

Please review,


Alex Bennée (2):
  arm/pmu: skip the PMU introspection test if missing
  arm/mmu: widen the page size check to account for LPA2

 lib/arm64/asm/processor.h | 29 ++++++++++++++---------------
 arm/pmu.c                 |  7 ++++++-
 2 files changed, 20 insertions(+), 16 deletions(-)

-- 
2.39.2
