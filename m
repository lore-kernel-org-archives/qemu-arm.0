Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp552549ejs;
        Tue, 9 Jan 2024 10:09:35 -0800 (PST)
X-Received: by 2002:a05:6512:400d:b0:50e:7be1:f0e3 with SMTP id br13-20020a056512400d00b0050e7be1f0e3mr2541993lfb.83.1704823774434;
        Tue, 09 Jan 2024 10:09:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823774; cv=none;
        d=google.com; s=arc-20160816;
        b=iVMdx7GcRiBo9iJft7olpuVpAhAOTMwFguI+09gxlYGADeh/g3qvdxkNFyT3wba0b9
         3grVgxKsisNDRadmaUDJ/XEbNdVh2aZ0Mb80hvFysHdDQM+XLY1sqsmNtXAb2D9pHZQ9
         TWAhpDpvUegIlKvexPnuOF8xywXlLALgdcGy6gIbDiu9ZViBVZStj5UOoqlL042j+viy
         3qKQ8/tC5YS3B2a3zqkcexf1Kpoy9GYRfLH43lv+Xd+RvoeeaOdE0VvmLijOn56/qXEp
         jzyrfntXL1/EWNqIMpnDrOfQkE1bnAVK0emcMovf3CfEsxr8uVgvD6l0d5+ssYnMmc0M
         3+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ih59QO5Uf+GiDwqnPD0KnU4KBtIrojXxz4NGhpA5s9c=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=zywlAoRwZZjRba5ZwLbfoCnhn976g+YOeZjfiMfDw5oErmSemwZrXe04sngFfJBTMn
         nNERM75IZiqpdZ0qEi4gDxrzuo5bUfBIk/147+yUWZs0T+xIMJaPNh1PnkrK8QIjPz6v
         GO+tYUXxnHgL4n+63s7rPnVW7mQDDfTh6cP+DtTiGGKuT8e40/eI6F4L6FEZeALnwuNg
         kzyJ/n1sKt5ySrct0CHFZbhiol1xU4+A2k2xIuuh3fCXsq8SEHqXk6QTEmugFvJkWAbq
         awcaVnKxwUDjbfZWzsoD9baXZ/QrSEc08e6CMZFlXWT3/vf7JiNPWW3Sy+rgOXbuyIJO
         gpbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Oz+Kzs/z";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j8-20020a05600c1c0800b0040e427383c6sor917235wms.11.2024.01.09.10.09.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:09:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Oz+Kzs/z";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823774; x=1705428574; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ih59QO5Uf+GiDwqnPD0KnU4KBtIrojXxz4NGhpA5s9c=;
        b=Oz+Kzs/zMxym6bYdskailWiFHTU11N0Hrd0rM73jWcwrYrha2iGZr3pZ3mDzko2dac
         kGSxywoEje5S1SrQa/mjAX76zXFWW40o9tzPAdJhDkRb+i82TN/wgr57+xy4gaEkhl0K
         ++Bene20o53NIPsDIS22WAXVBYPnhKu6QgSdEeKVQUGCb4pjp7y927CPpFrhfsjOoIra
         1s11xoaa6PbM2M6mUxx/N3NxtpA8nW0w6+DDc5tQ4HXj7DPz9H1Wk/9nhOprvl5vcuAN
         EsScFEq+sJFrGcpmHpDf2N4KKJAHVTjUwhT9/V2JMzCCg2vsyQjTaLLo/GP9kmQ8+Yyz
         SR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823774; x=1705428574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ih59QO5Uf+GiDwqnPD0KnU4KBtIrojXxz4NGhpA5s9c=;
        b=mG+P9IelnJXwmBqEoGzC1j8pqh6lxoIg+PImVctRZ7zJMzUmoCV61H/sWMlqpubxRq
         jXJfW8sqALBgIBM6FhNLp/AhX6OiCIurVyp2UBKwK9oka1lV9i7xS8OPiNqdnwtpXwbu
         wpTzeMfzGYBm+EGETjcWoQRcNIolu27D1QZU0KK2mh5SZFrecLTV4/cMSFptR+q1slp/
         4RW0k1he/6D5KTnGPSYquetnRAZRuQCrlOmh3ZfVw+cSUwQ6rdPnxEhLCWZ6W+vkXm7X
         yZ/vTS2TweZpFJZN7h+6Zy7FT1NuieJEVH/4jR+eRpPx6FzXcbn5S54BUfNfbX4osPb9
         zieg==
X-Gm-Message-State: AOJu0YxeCBVCNE6Kf8GUl9BodOCrTLj9qvBKwDkPSVmOZznhiYh1xmft
	Cqm4RfpGyU5VPdK8EwWMix8pYhrhRvlzUTyh
X-Google-Smtp-Source: AGHT+IHrifeKELkHacXcTTxsVDBQKHRYqMM2IGqnfqAvppq0dVY/cV5k/wMH1c+qfpdCnDfx78L/Ng==
X-Received: by 2002:a05:600c:4f14:b0:40d:85a0:d0f3 with SMTP id l20-20020a05600c4f1400b0040d85a0d0f3mr3027381wmq.51.1704823773988;
        Tue, 09 Jan 2024 10:09:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05600c3d9a00b0040d53588d94sm15630529wmb.46.2024.01.09.10.09.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:09:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/14] hw/arm: Prefer arm_feature() over object_property_find()
Date: Tue,  9 Jan 2024 19:09:15 +0100
Message-ID: <20240109180930.90793-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: iAeG+Pz8k8cg

Since RFC [*]:
- Split one patch per feature
- Addressed Peter's review comments

[*] https://lore.kernel.org/qemu-devel/20231214171447.44025-1-philmd@linaro.org/

Based-on: <20231123143813.42632-1-philmd@linaro.org>
  "hw: Simplify accesses to CPUState::'start-powered-off' property"

Philippe Mathieu-Daudé (14):
  target/arm/cpu: Simplify checking A64_MTE bit in FEATURE_ID register
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
  hw/arm: Prefer cpu_isar_feature(aa64_mte) over
    property_find(tag-memory)
  hw/arm: Prefer arm_feature(GENERIC_TMR) over 'kvm-no-adjvtime'
    property

 hw/arm/armv7m.c       | 36 ++++++++++++++++--------------------
 hw/arm/exynos4210.c   |  4 ++--
 hw/arm/highbank.c     |  3 ++-
 hw/arm/integratorcp.c |  5 ++---
 hw/arm/realview.c     |  2 +-
 hw/arm/sbsa-ref.c     |  3 ++-
 hw/arm/versatilepb.c  |  5 ++---
 hw/arm/vexpress.c     |  6 ++++--
 hw/arm/virt.c         | 24 ++++++++++++------------
 hw/arm/xilinx_zynq.c  |  2 +-
 hw/cpu/a15mpcore.c    | 17 +++++++++++------
 hw/cpu/a9mpcore.c     |  6 +++---
 target/arm/cpu.c      |  3 +--
 13 files changed, 59 insertions(+), 57 deletions(-)

-- 
2.41.0
