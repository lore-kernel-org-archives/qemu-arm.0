Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp207313njc;
        Wed, 13 Nov 2024 00:38:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUKKyJVSs8wq0NaWhZjzqZkLgmGEIFne2Zj1uuFURcpaGsgueIGN/P5EM3iGshAnp/orP5nlAWB6/8rfg==@linaro.org
X-Google-Smtp-Source: AGHT+IG2zYzdOZrdgcFEwmNWIit6fKDg6WHlHfBUsXgKdX/y5y4rzsdgZ8Omx5hGBqsMw1l6K7q1
X-Received: by 2002:a05:6902:a06:b0:e2b:a8b3:d650 with SMTP id 3f1490d57ef6-e337f8815b4mr17343486276.24.1731487086686;
        Wed, 13 Nov 2024 00:38:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731487086; cv=none;
        d=google.com; s=arc-20240605;
        b=Y1kh4YvnUfgErxk7mYIlJcYdnLyFYnvuk6VbHqazo7swPrdhgf3lzxtItecEfqD8Hm
         kLfpj9J5FhBjMtMEGm0lqbFhKIMJLmAM7GnEKB3SzD1HzMnp3Y9UgWy5LcnoaSMQN430
         M81Xj9pjPIt1OwEvTHDAtZ4rANpBajryUuo1/fdjGNdikUHQkQkiEloyMempXYhX3+yo
         IMxjWKjLSVWu66MVTpG2TyfgwrgYZPqa6Wo3RB2CMqtzgWYE50/CESwL6XaK44MRVFFV
         qH97xMcIuA22axnRtaieeFxwNfjjubceKY3QqheEUcqhmFoshnuYw0tkyOQ58uuz62ER
         Mk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LwOYE7RgMOeWbdcDxgkNeClWuLvHIn/euADx8QoQWYU=;
        fh=VIhgrWQk1x1K+0QhfqxH/99CgYHwJPt/LPwBh287yI0=;
        b=HNMSF4LKOpwgcO1doR3pU/PUU3s0J3/d+0UGnrgJ8IyeIxXPHfAH2TzG+luJjDlYl2
         k6QBX9agRWZEcKUQWEWJ2FqcfzF0R+m8Ey4PYKAAWrdgKnPr3nDuUdiD8fI/km43wI4W
         BZWoVppEiS8U0VpdEQneqe3GNQuBx0RuemvsGOaZdDCx7xLBuvhD1fzAnzGvfafQNujn
         5omaeAofG94SoX7JYl4K70pjUOccwRzrv4O5d6WCEqDPB1qYBIA0Yt1KEcB7FArpWXHc
         dVdXdAm9KqshtZ+vFUGTyRgmgk+u7JClb6un7S3CFZ0t7YX6YsAjdH6KyjkTS4tN/tat
         u29A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=a3vvxd3E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39620f3c9si160540546d6.45.2024.11.13.00.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 00:38:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=a3vvxd3E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tB8so-0005AJ-Qw; Wed, 13 Nov 2024 03:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tB8sk-00057u-TX; Wed, 13 Nov 2024 03:37:46 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tB8sj-0005yy-Cp; Wed, 13 Nov 2024 03:37:46 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B7875C5847;
 Wed, 13 Nov 2024 08:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDE0C4CED2;
 Wed, 13 Nov 2024 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731487063;
 bh=ljIDgIu7JxJY+TgDBg2AYe+HxBnXkAlV4rGXeoF5CjE=;
 h=From:To:Cc:Subject:Date:From;
 b=a3vvxd3ErkcYRw6OuQLVijgwc197OF0It3DHNOzB5nXEreMdTKDyxRVOLpwURw1Bs
 7OcWHLDjY6AGjKaPQ3hdOp3WRuREaLwJHtnF26fO6hE1jJug0P07FkakSXrjIQDdTN
 vlx4XTWzwPagQtwaAA1Y8Rykn30QPhCokxaz02AFJoM/OmnazJxP/rp5pq1ACUVhIW
 N4zZYadFthcTbLxSLru+v/kS1vxCtuPGk5gC40GCsfiE9+HQUJgA8NbIyBtX7r+3VR
 dciKDJafi+QigmJVhPMqOfKtK/WYMhH/2gAxOultcNfXN7ZhA5S3NZM5wIjsFzxJtr
 45NWnvHPs6q7w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tB8sZ-00000001Kvy-36Fs; Wed, 13 Nov 2024 09:37:35 +0100
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
Subject: [PATCH 0/6] Change ghes driver to use HEST-based offsets
Date: Wed, 13 Nov 2024 09:36:57 +0100
Message-ID: <cover.1731486604.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: +M+Bvb9an9ho

This  series was part of the previous PR to add generic error injection
support on GHES. It depends on a cleanup patch series sent yesterday:

https://lore.kernel.org/qemu-devel/c3e608a16a795b2d2be476eddc3707febcdb1ca3.1731406254.git.mchehab+huawei@kernel.org/T/#m60839c88a009f04bc73f75832ccb6a41523259ef

It contains the changes of the math used to calculate offsets at HEST table 
and hardware_error firmware file. It prepares for the addition of GHES
error injection.

The first patch was previously at the cleanup series. It prepares
the logic to support multiple sources.

The second patch adds a new firmware file to store HEST address.

The third patch use the new firmware to calculate offsets using
HEST table.

Patches 4 and 5 add migration support. They assume that this
series will be merged for qemu 9.2 (maybe it is too late for that,
as QEMU is now on soft freeze). 

I tested migration using both virt-9.1 and virt-9.2 machines
on qemu 9.2.

I also tested migration with:

	qemu-9.1 -M virt-9.1 -cpu cortex-a57 => qemu-9.2 -M virt-9.1 -cpu cortex-a57
	qemu-9.2 -M virt-9.1 -cpu cortex-a57 => qemu-9.1 -M virt-9.1 -cpu cortex-a57

Mauro Carvalho Chehab (6):
  acpi/ghes: Prepare to support multiple sources on ghes
  acpi/ghes: add a firmware file with HEST address
  acpi/ghes: rename the function which gets hw error offsets
  acpi/ghes: Use HEST table offsets when preparing GHES records
  acpi/generic_event_device: Update GHES migration to cover hest addr
  acpi/generic_event_device: add logic to detect if HEST addr is
    available

 hw/acpi/generic_event_device.c |  30 +++++++
 hw/acpi/ghes.c                 | 158 +++++++++++++++++++++++++++++----
 hw/arm/virt-acpi-build.c       |  33 ++++++-
 hw/core/machine.c              |   2 +
 include/hw/acpi/ghes.h         |  23 +++--
 5 files changed, 217 insertions(+), 29 deletions(-)

-- 
2.47.0


