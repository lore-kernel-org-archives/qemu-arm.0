Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1484094lfq;
        Thu, 8 Oct 2020 09:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYzQw9ox9p/lftxOb3QsKkD/i1gqnmjI/h6VaNDahAldPvM7XHPBSK6hU7s6G+H15YMX8p
X-Received: by 2002:a25:2004:: with SMTP id g4mr10978650ybg.310.1602173810241;
        Thu, 08 Oct 2020 09:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602173810; cv=none;
        d=google.com; s=arc-20160816;
        b=pVR4yDSLDZsD6f/kRKYYx9hUmicyop2jvVnWCobHN5nl0wi+aFJlrD0nOx8MzByHXQ
         qG7rcST+hdyvkLGKdRNEP/Y0Q7oGQ6hYc4lzUcqwuhFE+Z0Rh+ZACWCjzI62X6gf9/Gi
         w+n8I85QQIku++4gJiZML7oynzjXGmvLozHQhHBs+Ysi/hmaAYLunn/r1Bf5kv/OWl2y
         Exr7HpN+jQAOjUsECPQmAk55088X22igtdj5rLhH6oyzGGIRIsUWkTAsEjqIcQlQFFLy
         nY2nexoRVYdBbUodkvYqlzraNI3DCHnGRkeXa4F1viJ4mFrz/i9Ixcto9TiHrSQi6qlu
         R5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yGs8E2GCBOV45IEYSLzyQArDj7+rRBQC35wdokiL5VA=;
        b=kbdwyohR882+aeVwO0W1orccRhl1eLoU1c4eMwn8HFeUWpESLKhKF+w3gRbd4RcQIy
         Jo3Ps3C8SkAq40RNoCmbczFU2FN52bAyD9hgvZMyE+A7IIsa9vIYKYUhu1PUHag5h4w6
         wIm43oQbSjxcGeTSql+uuVZupmITnTzYENXIgwg30a4NXzmgl7/cfPoGF3heibX55JUp
         9vkdZ64gEBsP7rfK5Sl2oWqkSEAE6T967USv5kftwlLtIFHTt2CiaPzy/uGCoWTKMPO1
         Yivzx3OcdyTtyo+UdgXrrWwSUMqmYOenwWJt/9hr7pw4y0oxyMzos6TiAyOhyGHB7hw1
         gvFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MvJg38iX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z184si5036646ybz.280.2020.10.08.09.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 09:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MvJg38iX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQYb3-0007Vj-KT
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 12:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kQYYj-0006bQ-V5
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 12:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kQYYg-0006Xt-0w
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 12:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602173660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yGs8E2GCBOV45IEYSLzyQArDj7+rRBQC35wdokiL5VA=;
 b=MvJg38iXB+Y3P1lLuXKOHD41lmENgPl0nT5L/nIbshv+1HxfSbFpdv7a9Ez0zFc1g8h1bw
 z9G4CQM7+sJbg82wLI/3CfBBFQ0UNurdADULI5lEWOCvNEvr/u+6Otv7fKBE2rOveeZFxw
 TEOZzvxI5ItmcI01QAf98oyPC3yuUos=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-ytOIAfuuMw2TbziKk0nfPw-1; Thu, 08 Oct 2020 12:14:18 -0400
X-MC-Unique: ytOIAfuuMw2TbziKk0nfPw-1
Received: by mail-wm1-f70.google.com with SMTP id l15so3311050wmh.9
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 09:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yGs8E2GCBOV45IEYSLzyQArDj7+rRBQC35wdokiL5VA=;
 b=BgM9uDfKDVu921bhTZQn+1/r+wWlcyoua5WHUOplRQ7EDwq/ZuuDFmVRWQIsfv5fIA
 sfjU8lFaw38azlPYs1QZq3ATgW2l3lrGZmcn/qbzBaPIgbooXedET45qg8dTZDY4Chcx
 GkOIgeSGLe1+ZQ5l6gUOStOP9qaObbbvT6YmbInTScWkpbjGcAkrUY10yj+rVD6QVYSz
 l9sBIZWWquPvueLmUwbo502Yi5ufPPXW8bpFTojP/YkYwo3RpDJR8OCIgJWpTp7W6SZw
 QH7g+tdNmGdQji9gwCFvx//TKdrEMdX7a/Z/aeRpZaVKBXnwJ+GqPOPtkQ+Jtqb2LXcx
 LVSw==
X-Gm-Message-State: AOAM5315u3qknzmOse4/iJ6aOKzGIUKHIolFPeslDWhqkkfft6igGnfZ
 Ff8cZnR5Z8Uh7pDYC76rpXtBLckgT6/MPy0GYgv6QZN9bv7w3mb6jIfeNPQjN1CNWMm67rKCHPC
 Yu2DG59ktYL1o
X-Received: by 2002:a5d:4987:: with SMTP id r7mr9665163wrq.327.1602173656260; 
 Thu, 08 Oct 2020 09:14:16 -0700 (PDT)
X-Received: by 2002:a5d:4987:: with SMTP id r7mr9665152wrq.327.1602173656104; 
 Thu, 08 Oct 2020 09:14:16 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id e18sm7929473wrx.50.2020.10.08.09.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 09:14:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/arm: Restrict APEI tables generation to the 'virt'
 machine
Date: Thu,  8 Oct 2020 18:14:14 +0200
Message-Id: <20201008161414.2672569-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 01:56:49
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
X-TUID: COaQM3LOqPhh

While APEI is a generic ACPI feature (usable by X86 and ARM64), only
the 'virt' machine uses it, by enabling the RAS Virtualization. See
commit 2afa8c8519: "hw/arm/virt: Introduce a RAS machine option").

Restrict the APEI tables generation code to the single user: the virt
machine. If another machine wants to use it, it simply has to 'select
ACPI_APEI' in its Kconfig.

Fixes: aa16508f1d ("ACPI: Build related register address fields via hardware error fw_cfg blob")
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Dongjiu Geng <gengdongjiu@huawei.com>
Acked-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Rebased
v2: Reworded

Cc: Xiang Zheng <zhengxiang9@huawei.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 default-configs/devices/arm-softmmu.mak | 1 -
 hw/arm/Kconfig                          | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 9a94ebd0be..08a32123b4 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
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

