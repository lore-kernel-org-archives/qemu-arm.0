Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB0FF5544E
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 03:17:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vv5Ob-0000j3-OH; Tue, 24 Feb 2026 22:17:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vv5Oa-0000iW-9I
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 22:17:04 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vv5OY-000352-BX
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 22:17:03 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso76878795e9.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 19:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771989420; x=1772594220; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HvL+keCK8WUamgr1IgGReHRJ2yPkltcWdwdHcSfKCiU=;
 b=oaKmFS6ocNFePxdtzC6fEJEfu3dJjVZUq0Kmij2yLXgrV2PRzRYv5H5TiGvDTm2dHK
 feNB+TJ7HK0xrBbL4tupUmw6PFmin7MJavUiet57ild6f6t9BEIP0kgiliDtqx+EK5mR
 k25Gi3dBDR9/rvrXIgfBy977/VblWcn5X8dpKo2T0lX6Zoar/U/x9LuIyIvECSOgK2DU
 gIuqmif7ty0m5h3mqs7SzAVS1hWWwN2GQA02cl9pHdjXKj9ys2ZocemGDakx8UXe0ckl
 Nt3jG9LqJu00Y6YtZ++UBFu+YR/9GOewu7SVdkaEwr/y91USKE0yAKytTW9vlQhc/E/q
 qTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771989420; x=1772594220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HvL+keCK8WUamgr1IgGReHRJ2yPkltcWdwdHcSfKCiU=;
 b=VxkIZKtYIx1Ibm1imUomaoqO3+/UdXBtm8uLzHaBmQHruAWiRSTHYT5OngrdJY3EGZ
 ok6OL0R3KREpH1nIcdzCwFZUHN8LeN/liZoWftade1jH8fS78+H2d6GWBBgOTPZPIDBu
 +xywp0fBu1By0Yuds6giLykzfX0gb+usdx8auAKUJbmJrosEwqNk1aBXlNN4FrIh8nB3
 9AEYBiPZw0w7WBoWhiCV4/qxK1QAuuMSL/kNu1pumVT+DJq7Wzau/MkBBHJJZZrRVzRP
 41utqqwjagFwV6aS5xgBAWMjvL+RlInhr1SltxsglNg1POAaQhJwMJae8WzuRIa9TvdC
 CCnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX98uZ6qSuCOyUW/Bjp12smWmMeO85IfXubx1TQ7ooht7bU6o34sXWOlvdaiS8FaZkVG5e3YZlrrg==@nongnu.org
X-Gm-Message-State: AOJu0YzzAA9XH43UFrQNJ42Pbgvb3JJErL7n4l8pIJvMeDUwCD/FW5ps
 0C7x7jqN9UZz+QYxL+IvZREGzH3kOcTdVJBUYK6O1KDc1kzooT7I7/IuvK85ExfNOT4=
X-Gm-Gg: ATEYQzytU/j7hmfLw9XqeNWQNhaJFpBaQ+/0SUOWNs/AI0ivur7zyfUxhV02zrx2Hw2
 xmZ7PEw3RnhjuxbYkoX7HejFOXBbIWHntQtH85n1ENl2ESQBsKa6OZ8iGgXzIGxJ7XSFR9KLm4C
 2ney+cKxQ+gZXlbSRSmL5tDGN5FYtRqNIg0vooRyR16TsR2gMnWlQARh6CgENSUSCxI1AxrEsrR
 hW5abMKpPHcmVZOLqoa202Vwi0hA+qYPRY8ou10tA6sEQNMVsyORbX0khC4cKburtk2gsJOuwbn
 z0UWixCZepAcrgb6DCe/aVdpAp9HqxjFDkO3WFYvX7BOiYF7gfj9gziyH1K4DeLiKGdQKbg7Qig
 H0ieWxgJfeS+4k7sc3wO+rUxVPHmgITM2nYs7x88AGBK+b4zDDagLKohG30E05ffeeJ1wTo8CnA
 4uo9Hk6ScjDUyWBWdJKzHXwNGbLzYx8LI+7yGiogZDirvCLYpq01iFTV4+pemgCEdzklmTxSWX
X-Received: by 2002:a05:600c:1d29:b0:477:5b0a:e616 with SMTP id
 5b1f17b1804b1-483a95eb521mr264765115e9.5.1771989420468; 
 Tue, 24 Feb 2026 19:17:00 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb776b0sm1000125e9.1.2026.02.24.19.16.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 19:16:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] hw/iommu: Avoid including CONFIG_DEVICES in hw/ header
Date: Wed, 25 Feb 2026 04:16:55 +0100
Message-ID: <20260225031658.32095-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

By inlinining the stubs we can avoid the use of target-specific
CONFIG_DEVICES include in a hw/ header, allowing to build the
source files including it as common objects.

Philippe Mathieu-Daudé (3):
  hw/arm/smmuv3: Avoid including CONFIG_DEVICES in hw/ header
  hw/i386/intel_iommu: Avoid including CONFIG_DEVICES in hw/ header
  hw/s390x/s390-pci-vfio: Avoid including CONFIG_DEVICES in hw/ header

 hw/arm/smmuv3-accel.h             | 35 ------------------------
 hw/i386/intel_iommu_accel.h       | 35 ++----------------------
 include/hw/s390x/s390-pci-vfio.h  | 20 --------------
 hw/arm/smmuv3-accel-stubs.c       | 44 +++++++++++++++++++++++++++++++
 hw/i386/intel_iommu_accel-stubs.c | 37 ++++++++++++++++++++++++++
 hw/s390x/s390-pci-vfio-stubs.c    | 32 ++++++++++++++++++++++
 hw/arm/meson.build                |  5 ++--
 hw/i386/meson.build               |  1 +
 hw/s390x/meson.build              |  1 +
 9 files changed, 120 insertions(+), 90 deletions(-)
 create mode 100644 hw/arm/smmuv3-accel-stubs.c
 create mode 100644 hw/i386/intel_iommu_accel-stubs.c
 create mode 100644 hw/s390x/s390-pci-vfio-stubs.c

-- 
2.52.0


