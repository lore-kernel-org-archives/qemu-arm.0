Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258476ejs;
        Wed, 10 Jan 2024 11:53:34 -0800 (PST)
X-Received: by 2002:a05:600c:500f:b0:40e:4491:562b with SMTP id n15-20020a05600c500f00b0040e4491562bmr777841wmr.131.1704916414201;
        Wed, 10 Jan 2024 11:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916414; cv=none;
        d=google.com; s=arc-20160816;
        b=iyXWtU0MmLhdAaK/+gzDhYXBJlUoTKpNqNIB/zw9iwgeGu0WTiQEzOkTEyxdZm4V0E
         KT44vR00CTNIv3zHH1F2aZSik2/znSDYeHJKa91phV7QwAhFLsDCWjssAXDz8W2v6UrG
         clLWd1iH4/sjIznKOHKnXAlDk0y8xxjHlft7OAEtNCbmzCyGwV5Y9AUTlmmHxy8SHCYW
         ZSJJz1TwgmKosu8Pj5eNI6uB/rRMhga/lhCSLxPFCXFgAIPSZlZDTYM1XGrBkP3oiRrY
         k9E+iyuj4taEvuPxMri4fL00wg6yNqiwOA0xxT8hmxKrmGl9ksj4cuZgqg7F/jDwgiO4
         y6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=/RA9V/zCbq1dSQvPyx7TCs/GRQQWLNyObGfqv1alXII=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=Ds/M9f8h/R6N97wB0o7YLuhyMqTyOgaYhErEzsI9040L9+G8KB0UgGpXKX57dpjWop
         r+lb2ooYXofTxJoKYsMUgV6OH3u+XOoB6YgwWi+RgOcQb4TC/H8yB0xF6mpU18g50NRX
         LC5aQe/syVbUHB+HXdGgnqu/cgBQNVefGY/PQ651Ya+n7nxAB+v7t6ZMxWMqO2FoMoHO
         Wo79F3/zaGNRQs2dPzoL9+UK4GC6upBsLnt+whCw+ppVzKAZ5STMPwcTwKaR6Z/R+sdo
         KI3nikVdUhvgDCDt6hrnmS7wncEjqh87l6uhGsuRLnERtDNjmX+WEvN9ss1DhZ7A17Ho
         K2ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4n4cAji;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v24-20020a05600c4d9800b0040e47c9fe2bsor2084433wmp.0.2024.01.10.11.53.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j4n4cAji;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916414; x=1705521214; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RA9V/zCbq1dSQvPyx7TCs/GRQQWLNyObGfqv1alXII=;
        b=j4n4cAjiYGQEks2QTYkNiPYrFfUCxnAmhmHmUY09LTgiC25wu3E7Kz0FsdbaxZ53Tm
         /fYXP7GlrFCVL+yW3vptpESTEhnW9DRSL0Th0RBApUD2s3+a18Sv1Vo4svHPnfOVVXn/
         AW5QA2/atXhLv+1NFThOIuiPosVT+w0fmJuCppt/6jPX4zOnrgMwWASJd+JTmh1g9WAY
         hUrz4m3IHZxtftgeirlLFNxJcpSu3+fFpmtQeEjSZQHf2tLyKcv7Vmt6Eg2LePFnUKzn
         5BSjbsQqVXRclfDm0XewaQTunjvAn0fe3jWgZfGEItft6DDGYBSfemiPphe1Xas5l/Mk
         goeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916414; x=1705521214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RA9V/zCbq1dSQvPyx7TCs/GRQQWLNyObGfqv1alXII=;
        b=TMu1Ne6AJtqfXsW9VEBEWtbf6pq9FogQfvKDcu8GnYV29ItV8cb1oXgoVUufEnZM2S
         xb780JGaSiUZ3ZbhRLBr1yQT8wp4zEsvG2O/YIoSrPLyctzpedr305x8nIdeNGtiCmZv
         aQ3KKFGA0nzPkIYL6Mbed6zkNp1VYNuGmkHGS4l4EyLfZ1Npac/9nesBDh31XSBrmmL1
         GBELx7Sn/ciZsybiG1mJEiQN4UCZlNY+l1WHG+2oj5V4wyhm/MHjMCpxI3Op1QJs+pbU
         ClJoBZ1h/V0ipqNaljIEQzu6DPAlli8/VdsOlFZYBurHAnbQ6cVdbnlu99f9EARKxJGB
         lZrQ==
X-Gm-Message-State: AOJu0YyWE/tEQn4uEYesUDFCLpEeO8ueGwORZAy+rvH/9nihg+4fzk8g
	4g7c16A9VTIbtNbqnuyvTZdt9IvZFHQoubX3
X-Google-Smtp-Source: AGHT+IH75f3fRe/h9eX7yhRc+unepzpKSCQQF9HqYRtos34o4cYydlRxioKN8J5zeGuJWrjDz1MVXA==
X-Received: by 2002:a05:600c:927:b0:40e:4912:18c9 with SMTP id m39-20020a05600c092700b0040e491218c9mr755519wmp.168.1704916413668;
        Wed, 10 Jan 2024 11:53:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id q14-20020adfcd8e000000b003368c8d120fsm5565422wrj.7.2024.01.10.11.53.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:53:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 00/14] hw/arm: Prefer arm_feature() over object_property_find()
Date: Wed, 10 Jan 2024 20:53:14 +0100
Message-ID: <20240110195329.3995-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: bLU9uDjJ5dvt

Since v2 [2]:
- Dropped "Simplify checking A64_MTE bit in FEATURE_ID register"
- Correct object_property_get_bool() uses
- Update ARM_FEATURE_AARCH64 && aa64_mte

Since RFC [1]:
- Split one patch per feature
- Addressed Peter's review comments

[1] https://lore.kernel.org/qemu-devel/20231214171447.44025-1-philmd@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20240109180930.90793-1-philmd@linaro.org/

Based-on: <20231123143813.42632-1-philmd@linaro.org>
  "hw: Simplify accesses to CPUState::'start-powered-off' property"

Philippe Mathieu-Daudé (14):
  hw/arm/armv7m: Introduce cpudev variable in armv7m_realize()
  hw/arm/armv7m: Ensure requested CPU type implements ARM_FEATURE_M
  hw/arm/armv7m: Move code setting 'start-powered-off' property around
  hw/arm/armv7m: Always set 'init-nsvtor' property for Cortex-M CPUs
  hw/arm: Prefer arm_feature(M_SECURITY) over object_property_find()
  hw/arm: Prefer arm_feature(THUMB_DSP) over object_property_find(dsp)
  hw/arm: Prefer arm_feature(V7) over
    object_property_find(pmsav7-dregion)
  hw/arm: Prefer arm_feature(EL3) over object_property_find(has_el3)
  hw/arm: Prefer arm_feature(EL2) over object_property_find(has_el2)
  hw/arm: Prefer arm_feature(CBAR*) over
    object_property_find(reset-cbar)
  hw/arm: Prefer arm_feature(PMU) over object_property_find(pmu)
  hw/arm: Prefer arm_feature(GENERIC_TMR) over 'kvm-no-adjvtime'
    property
  hw/arm: Prefer arm_feature(AARCH64) over object_property_find(aarch64)
  hw/arm: Prefer cpu_isar_feature(aa64_mte) over
    property_find(tag-memory)

 hw/arm/armv7m.c       | 36 ++++++++++++++++--------------------
 hw/arm/exynos4210.c   |  4 ++--
 hw/arm/highbank.c     |  3 ++-
 hw/arm/integratorcp.c |  5 ++---
 hw/arm/realview.c     |  2 +-
 hw/arm/sbsa-ref.c     |  3 ++-
 hw/arm/versatilepb.c  |  5 ++---
 hw/arm/vexpress.c     |  6 ++++--
 hw/arm/virt.c         | 26 +++++++++++++-------------
 hw/arm/xilinx_zynq.c  |  2 +-
 hw/cpu/a15mpcore.c    | 23 +++++++++++++++--------
 hw/cpu/a9mpcore.c     |  9 +++++----
 12 files changed, 65 insertions(+), 59 deletions(-)

-- 
2.41.0
