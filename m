Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp709605lfq;
        Thu, 1 Oct 2020 09:34:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLZdiqy3rJ/ts9ud+rlf2zMh4PIS+aiASdECw+XFCOlRQqeckumebVRC/SiaPDB3HVnb46
X-Received: by 2002:a25:4090:: with SMTP id n138mr11414575yba.320.1601570090721;
        Thu, 01 Oct 2020 09:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601570090; cv=none;
        d=google.com; s=arc-20160816;
        b=aVsDcs4wwH8yfiJWIEIenA4mWJA+4g9xhhDFcQXRTE2A7wQfikzO+06uaon7HgtKGr
         3EjVHg5yLXR9V89Zaw7ddoGPvq/1ntLTt7s8yORgSDbKqL/xHaKGMlFMBp1SSbp/7su+
         ydi9cSosbTtFHpnyYozbruLTYNtK3WXrmSN+df3wz4wni60SXmPH00OEzXx7bnvLDQxQ
         eVqexhcOrPN6zIrrgEtQHynIZoUcTnhHdE4KhZwDZ+bTDMYoWpyLBfCDNgdrZm1V2+Dw
         yVb9qxMiv7oH7F3XjMe0XMfuHrzQN0tpBk8/IxEfRDqqCwqm/8rQhuxMF14epUdkeWJh
         UD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ILVY5aeJqy2jKuyV4vgyIfzjSo6AsLHrLCtthdQdX2U=;
        b=JNJycYwuzzDt6BYrK1pvrEK+upbe27u1dpYZshP1jYgbkB7YqGW1gTSzuErDXxRuRR
         5eW+9lbGVMqQIoYNv4IKNaZavFlSgmd4Hf7pf+TUvIeezwv3q7X5uFh9ZY0PLaTuAbMM
         pBD9NpulscxGrqKjdRH1sIBUH42fbocXvbfZthaeTvvUDD3UoWlv6rEpqYWSPs9jcG56
         MbVW4CSNEeOW4wOL3kU/8jxSEgvCSI/VF8RRbnIPIEFXPUwpRuLU7RrVWykd5fkdgTs+
         PeiOpXow8RTZ7pcCverskiwaZqQLIbzXuTDkTaQqtpQEPMZbz4jucsBtROzQdUYmUWcY
         WO2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Iw0N4N8k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si6966995ybk.71.2020.10.01.09.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 09:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Iw0N4N8k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kO1Xe-0004f9-1O
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 12:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kO1LW-00086i-QM
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 12:22:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kO1LT-0002L9-79
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 12:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601569333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ILVY5aeJqy2jKuyV4vgyIfzjSo6AsLHrLCtthdQdX2U=;
 b=Iw0N4N8k/KqdToSLs1Fl1mJC8xqLwZqoFwbXzmby5hWrSm69v8wVKIYlQpbcdwmyqZJ9w7
 JnN5HsuhPdUWipQh/7fGrh6oUrm1veVTaSsH/twSuIFmLBqAeOHSBHlQBaU6k6Q7AqceLp
 8/IggqV6XrfhcFseXAJhHlBbhVkwVx0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-j83FHlkqNmyRcHMQV4nGHA-1; Thu, 01 Oct 2020 12:22:11 -0400
X-MC-Unique: j83FHlkqNmyRcHMQV4nGHA-1
Received: by mail-wr1-f69.google.com with SMTP id d13so2235738wrr.23
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2020 09:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILVY5aeJqy2jKuyV4vgyIfzjSo6AsLHrLCtthdQdX2U=;
 b=qIxgl76+nGwI71y09OCTeTN4T4pDZV+OSKxzKT106g2Q72znYSbS8mMrtOXHLjUTAX
 YIJchqRJytIot6cqzlXbDcfKMxHh+G79Mbn+tJ/80Ya6R/iYdiD/i0Zu1rVwAnXMErtV
 ppZYkJ86+FnCKrwIpzgUwB8lQkPgD28tQKu/rQE+SKDJasVdu7LCvXpy07d8zXwCuwKg
 VrjL2FMxYL1U/VX0y8z3MXHAtg4ThlrOH80f5G+W2E2lNiSaJl/mF2GCZCNA13o884iA
 KuuSa4AB/JIA7c+WPReLNphy7FrtXzDS3LFzHUqYlgkP962Bi0xTKHQeYcPkDNeVaL0b
 msDg==
X-Gm-Message-State: AOAM531lsrH/UTxYFTbSKyMlFiST6tx2167KNutVtHu3RXY1LpDJem3p
 4TpeYYn71ZXsegqKABuwLzMrkGMYCKzDOBl+8Hlc3lqQUlbGXMa2QguD6zTNNjPn/+t2SRzsZFM
 Dyq9VGZ0/wK0D
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr861082wmb.32.1601569330309; 
 Thu, 01 Oct 2020 09:22:10 -0700 (PDT)
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr861057wmb.32.1601569330047; 
 Thu, 01 Oct 2020 09:22:10 -0700 (PDT)
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id i14sm10626735wro.96.2020.10.01.09.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 09:22:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/arm: Restrict APEI tables generation to the 'virt'
 machine
Date: Thu,  1 Oct 2020 18:22:07 +0200
Message-Id: <20201001162207.1566127-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Xiang Zheng <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5leUuFCCUoat

While APEI is a generic ACPI feature (usable by X86 and ARM64), only
the 'virt' machine uses it, by enabling the RAS Virtualization. See
commit 2afa8c8519: "hw/arm/virt: Introduce a RAS machine option").

Restrict the APEI tables generation code to the single user: the virt
machine. If another machine wants to use it, it simply has to 'select
ACPI_APEI' in its Kconfig.

Fixes: aa16508f1d ("ACPI: Build related register address fields via hardware error fw_cfg blob")
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Reworded

Cc: Laszlo Ersek <lersek@redhat.com>
Cc: Xiang Zheng <zhengxiang9@huawei.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>
---
 default-configs/arm-softmmu.mak | 1 -
 hw/arm/Kconfig                  | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 9a94ebd0be..08a32123b4 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -43,4 +43,3 @@ CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 CONFIG_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
-CONFIG_ACPI_APEI=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f303c6bead..7d040827af 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -26,6 +26,7 @@ config ARM_VIRT
     select ACPI_MEMORY_HOTPLUG
     select ACPI_HW_REDUCED
     select ACPI_NVDIMM
+    select ACPI_APEI
 
 config CHEETAH
     bool
-- 
2.26.2

