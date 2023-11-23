Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592228ejj;
        Thu, 23 Nov 2023 10:35:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyJmDaTh4mMN5eJDEpETB+p99pukqFdHRIBqs3vm/rMkixfxdK+LK/J4Jbwki4S4FB8TZp
X-Received: by 2002:ac8:7e81:0:b0:41c:c205:f718 with SMTP id w1-20020ac87e81000000b0041cc205f718mr230739qtj.45.1700764527981;
        Thu, 23 Nov 2023 10:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764527; cv=none;
        d=google.com; s=arc-20160816;
        b=xjk+FRXc49v1GhK0315mNPSpaQaD8e7NdeZZkzfIEc7v5+dbbMa/gTF1/a4NBYzMbj
         OTcst6Z8LcektIk1d3QTtxLgvKTr9zMEQVIgTaSJWmDT0//D5up/mQ8yF/Y7tYXtFp9S
         5jJ/1EO+f+5PjufykquGtdLYi19ncHL7dhEtpxfMXEOYI4x4pAn0dh3lT+CPRtrWs1Ya
         ltFpbhBsfqcapGcWrKitOVg8c8Tg5gPG6gDYNXMt79HG2mQPLvwCojDj2EH8ERxD1u1c
         I8MNP2tkBMFMisbqNY0Z0elu7a+S7J+nTZBAwJy6JP4F0PPFoPHJEzitSO6/mLv6s2+T
         ORlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uROfwQyK/fR3xRoZfbjH/zMx60LfqgoyHKl0bdS07As=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=Ng1pyyOD8llfwC5VNfk2rJP3zZ27wh1QknDTJV1/x/i5dD7eqCObepRH0yPH+NCEdA
         /E28dbHYod3knafZIDVjn8M8IYRcs3O871SrB0WvjObWkUA/yF9xA5XcHdfo7xJcSceU
         Kp/ngaykx9xUPd+2xTejDIbfFF+m6BWLMq/GGO4FrgvZRIqgqQWYuwF7rstNK6eBPn6E
         /D1gbuCewy3lYfv2n2pavScJJIlwCudK7c1EV7UC4aFX9ZdPTTgzUdCD3FHYJWE+YxJm
         sjOCMQc34mtvc5KIThThy1rTpvSR8H9ZvEyTLBaAUJdnhEiLbmFga8+82M0j9PqW+NHq
         jwvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PsyZh4Cu;
       spf=pass (google.com: domain of kvm+bounces-2369-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2369-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2369-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id bw18-20020a05622a099200b004238f76e299si1165724qtb.74.2023.11.23.10.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:35:27 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2369-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PsyZh4Cu;
       spf=pass (google.com: domain of kvm+bounces-2369-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2369-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D4F71C20FE0
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96C84C3CF;
	Thu, 23 Nov 2023 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PsyZh4Cu"
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF80D68
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:22 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c6b30aca06so14420101fa.3
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764521; x=1701369321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uROfwQyK/fR3xRoZfbjH/zMx60LfqgoyHKl0bdS07As=;
        b=PsyZh4CukDWsCA1+Ncpbkv8P020hDgQpqn9+znuI68XBLuth9PVVXIQ3stBjLwrMPr
         XzsFNoxl3usMONoCokII15IYIWixbAGhM76D7SuTNbnjRKorTXEdvONdz9r4EpncRfAO
         JWp80Hpgo3T66Ky1O+2FeqiCpyGOEhzev+SQA++lv97wOv/XYYPlfDgVQKImOeWasHL/
         jVmlXSzoBh+KBIad6sBiw3Zw4GZNgk9b160xr3MefqRrlbAgXaaBzfXqDQ6uskASUY/A
         gvi67/q3/fl7hkbRLTTbT7/ZHxWfCNClJLqtFiMrUttIr2GY1F38Es8qLS2G9S6ucYRG
         8JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764521; x=1701369321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uROfwQyK/fR3xRoZfbjH/zMx60LfqgoyHKl0bdS07As=;
        b=jVlAnfvc12stdJm79Pg2/NYpe1hdoaXiHlCDW+b+Cax3nHMFaO1xtEIaFt1SjHU1AA
         4iIRfKr+7Ut/DTNn/1W85rTfHatiwBj1QbdJrsX4lfQ3X19JWabyLy/gE62XDiIi4bBK
         /647ukBk/VdN46CIvFY02YshNkyWxKi9z9isPdQG/zP6j6CsXTkFAOB+lDRi3dB+I7Nx
         GjPtQPD8DC1wlP2TnFgnHcsV6jVw9hr125I7dPo6oLxWgNYQ5satRJKT1Jyiw+JQy2E/
         Ac86vUOM4lQ0DLR/clzhmqMoP7QTaTAk3iPHqAum9+w/yktrMviNa47L7Cas//rszIIs
         qidg==
X-Gm-Message-State: AOJu0Yw6Q7GiXbckXD0kXV25yAxrFt9mjSUoLY0Cs+tTgweN57QtVoTh
	8fbBTFpEF+yc42evzGCDQ4Zu+w==
X-Received: by 2002:a2e:7017:0:b0:2c8:56f5:9082 with SMTP id l23-20020a2e7017000000b002c856f59082mr123850ljc.50.1700764521179;
        Thu, 23 Nov 2023 10:35:21 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0040b30be6244sm2807528wmq.24.2023.11.23.10.35.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:35:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 00/16] target/arm/kvm: Unify kvm_arm_FOO() API
Date: Thu, 23 Nov 2023 19:35:01 +0100
Message-ID: <20231123183518.64569-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: leJMYSuf7+FS

Half of the API takes CPUState, the other ARMCPU...

$ git grep -F 'CPUState *' target/arm/kvm_arm.h | wc -l
      16
$ git grep -F 'ARMCPU *' target/arm/kvm_arm.h | wc -l
      14

Since this is ARM specific, have it always take ARMCPU, and
call the generic KVM API casting with the CPU() macro.

Based-on: <20231123044219.896776-1-richard.henderson@linaro.org>
  "target/arm: kvm cleanups"
  https://lore.kernel.org/qemu-devel/20231123044219.896776-1-richard.henderson@linaro.org/

Philippe Mathieu-Daudé (16):
  hw/intc/arm_gicv3: Include missing 'qemu/error-report.h' header
  target/arm/kvm: Remove unused includes
  target/arm/kvm: Have kvm_arm_add_vcpu_properties take a ARMCPU
    argument
  target/arm/kvm: Have kvm_arm_sve_set_vls take a ARMCPU argument
  target/arm/kvm: Have kvm_arm_sve_get_vls take a ARMCPU argument
  target/arm/kvm: Have kvm_arm_set_device_attr take a ARMCPU argument
  target/arm/kvm: Have kvm_arm_pvtime_init take a ARMCPU argument
  target/arm/kvm: Have kvm_arm_pmu_init take a ARMCPU argument
  target/arm/kvm: Have kvm_arm_pmu_set_irq take a ARMCPU argument
  target/arm/kvm: Have kvm_arm_vcpu_init take a ARMCPU argument
  target/arm/kvm: Have kvm_arm_vcpu_finalize take a ARMCPU argument
  target/arm/kvm: Have kvm_arm_[get|put]_virtual_time take ARMCPU
    argument
  target/arm/kvm: Have kvm_arm_verify_ext_dabt_pending take a ARMCPU arg
  target/arm/kvm: Have kvm_arm_handle_dabt_nisv take a ARMCPU argument
  target/arm/kvm: Have kvm_arm_handle_debug take a ARMCPU argument
  target/arm/kvm: Have kvm_arm_hw_debug_active take a ARMCPU argument

 target/arm/kvm_arm.h        |  26 ++++-----
 hw/arm/virt.c               |   9 +--
 hw/intc/arm_gicv3_its_kvm.c |   1 +
 target/arm/cpu.c            |   2 +-
 target/arm/cpu64.c          |   2 +-
 target/arm/kvm.c            | 111 +++++++++++++++++-------------------
 6 files changed, 73 insertions(+), 78 deletions(-)

-- 
2.41.0

