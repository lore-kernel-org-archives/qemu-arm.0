Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp230444njl;
        Tue, 1 Oct 2024 07:42:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6vvtGrUB/W58vShRvtXMXdy+uggn2lS9YkHL0udq123CCUcqRQHU1KMEdADXP8cCEZSE0WLAyk1v66Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE/CYBNAfAfRBntgBtJsdw8R3nZC/amfHJ5a4o73bHSoNfHudQiW3PAwVLKzK7alJ0DClpZ
X-Received: by 2002:ac8:5916:0:b0:458:353d:3388 with SMTP id d75a77b69052e-45c9f2853bbmr217994511cf.43.1727793767990;
        Tue, 01 Oct 2024 07:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727793767; cv=none;
        d=google.com; s=arc-20240605;
        b=MfFCjn760PP0HRIY1XV5SwnFwCoC18rQ/O89mLprGC7a+sK/rToQW6nU4GrcmeJ+Oh
         CERJXhbU46m/mENeTuTZWfZBF/1loAznoAuN9qZlaijnmIsJC/64R5nQrhro5xu0DssN
         kOvOGjkzwplMEPP29oNsQgneLyfQVJUzkmLqB7lU9uv1f6z8nCqg1nsCt07k1bSMUaxB
         FOxqZMW9GwIuTfbFuaUTLSk70MWd+t0pOReZwxo7H1E7jNcxW/P9fqDclw/kNfk0QsYu
         TpKRmJtOk0DnRt0c+LbMs++lN68YZUpJ1/ho6zsSkteipparBzgUK3FkS4oshWnA6Dvl
         tkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tFXu0BDmWJ30Kl5jWKaVClFe7XDBpv+pJqEkn5L05Dk=;
        fh=VIhgrWQk1x1K+0QhfqxH/99CgYHwJPt/LPwBh287yI0=;
        b=LWFEJRfTiZQo9lPNsBq2TvTFgmxQSl8Bbtc/ehuQZKqIliK+JDJ0026zjHYNWAMKMw
         nE7c5rcF9/dX6B25S3vIAlLUuv4VwWbIooyTINtcbKe1PnVyPXY/JsYpDWyBOCEjuU23
         rc3tNZtz3bbrWAw9t8Nm15Va1uVf/NxT0137ZhQHwhz8Ye8MXR7wf04B4jHGJ/x7elZb
         lGltGWTHI7frJ/acGgvMkL10metu7VRw5z88Yg4NHa7LFYxbRygPbY5RAJ4zYaRZn43y
         lI8v2gkmKEqMgbWkhs6sb+vwqJnuwSde3mzionakhOJnafAUbMeSt6WahVnKcDr+ClZY
         IUug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TA+nWCwZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f2bececsi106514951cf.187.2024.10.01.07.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=TA+nWCwZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sve5F-0005Vi-BX; Tue, 01 Oct 2024 10:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1sve5D-0005SH-Tf; Tue, 01 Oct 2024 10:42:35 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1sve5B-0003Hh-By; Tue, 01 Oct 2024 10:42:35 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E2CB15C4D75;
 Tue,  1 Oct 2024 11:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D83C4AF09;
 Tue,  1 Oct 2024 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727782996;
 bh=44BsigIhsxsocvsZCqC3i1BqcN0t/l9an36GyHXYyiw=;
 h=From:To:Cc:Subject:Date:From;
 b=TA+nWCwZzM+RmzWcmxM/gxvN30N/6YU/AE0MGLOCWXZMnXiKgoBGM1RGJH4ktXcai
 dJKz0XiMwDBOOVaEoXo79LsP2lRpfbfmCpVCgM3Kqjb4GnYuKsenPsg9AbdR5CT9fC
 31IxhZwz4vBSOYf+IaRY8Yzslf4gAJww4m6JWh2KzbCq50fd2Lcbb6Bawg4hmDEUsi
 FhVbt1q4g384yL8CJ7HQ0UrdpvBN7XoYHjwYGit4nAvEqjHeXC7TLhHGHo91TNE/nH
 XNV/M122Pv8n654CgzWgDsmLb+NcHlohVZim1Qu0dp9L01ygrmOmoRn7gRih6YgSRT
 dWkD+m6yTWg4w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1svbHd-0000000Adcp-34uQ; Tue, 01 Oct 2024 13:43:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH RFC 0/5] Change ghes driver to use HEST-based offsets
Date: Tue,  1 Oct 2024 13:42:45 +0200
Message-ID: <cover.1727782588.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zvwE4DhZgAec

This RFC series was part of the previous PR to add generic error injection
support on GHES.

It contains only the changes of the math used to calculate offsets at
HEST table and hardware_error firmware file.

The first patch adds a new firmware file to store HEST address.
The second patch makes use of it.
The remaining ones add migration support.

PS.: I'm sending this as a RFC as using the proceudure defined at the
pseudo-migration of:

	https://www.linux-kvm.org/page/Migration

Didn't work. I tried to use two different QEMU versions to check a
real life case and also to use just one QEMU and trying to load a
virt-9.1 state on a virt-9.2 machine. 

For instance, trying to restore a virt-9.1 state on virt-9.2 gave me
this error:

	(qemu) qemu: Machine type received is 'virt-9.1' and local is 'virt-9.2'
	qemu: load of migration failed: Invalid argument

Yet, running virt-9.1 used the old math code (offsets from hardware_errors firmware
file) while running virt-9.2 executed the new math code using HEST address.

Mauro Carvalho Chehab (5):
  acpi/ghes: add a firmware file with HEST address
  acpi/ghes: Use HEST table offsets when preparing GHES records
  acpi/generic_event_device: Update GHES migration to cover hest addr
  acpi/generic_event_device: add logic to detect if HEST addr is
    available
  arm/virt-acpi-build: Properly handle virt-9.1

 hw/acpi/generic_event_device.c |  30 +++++++++
 hw/acpi/ghes.c                 | 108 ++++++++++++++++++++++++++++++---
 hw/arm/virt-acpi-build.c       |  30 +++++++--
 hw/core/machine.c              |   4 +-
 include/hw/acpi/ghes.h         |   2 +
 5 files changed, 159 insertions(+), 15 deletions(-)

-- 
2.46.1


