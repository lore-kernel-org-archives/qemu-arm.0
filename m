Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp475878lfg;
        Thu, 19 Aug 2021 09:22:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOejGMspcU9RuN0Xvl7F8CkPqis7/VMqHY3ZZTIaPC0+WTkiefgVBB+cpl7BFdyqIBFfo+
X-Received: by 2002:ab0:54c4:: with SMTP id q4mr11663237uaa.74.1629390151825;
        Thu, 19 Aug 2021 09:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629390151; cv=none;
        d=google.com; s=arc-20160816;
        b=YcUKFYNKicwwpDGzlxlPgsAWdpgtyz52Jtst+IlECoqKXjh2hAklrhfAL8conJAKqS
         Idews49PO0d0JH6yuBCf1BrZFblzI597UXyaBlVNEnW+I4Mb+bskI1H5sOpV5nW2tr4k
         wvLoi2q5wsLpnX5wluZYFqTHE6n0CJ/JYbZCMSrzJ2l74TDl6zpVtalCj21hnhrHykeA
         3jJXjl8ka4JwB0L8k9qgfX361UcNoMRB0UTd3LFF33sn1Umh877yug4Xn2YWUagjsLRj
         t2vkkl8ZFoY2ZzviSmzKm90Q8Bpf4ig8SVYWGxLx79QWqDO8BvvUV9z/HJfWIIVPXw/U
         gEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=p44jCeYKdrpA7KiWVnFT5WLCgnHA26AOQy7zDNCARlM=;
        b=oDaoRQWcEXeCH4nQKj0Vo5mRGwIxt54VNAfGSwuhkfn3tpanMfiXe9pXX5csDneNVj
         Kb+U1xXSx/t1EC/MChKQVXnbgYF68mTYcXtmARdeMYiSyySB6GYV95PvFAZiXwft1yXi
         +MdgiW3/8C1/pfukD46g8UymGkI6CarJOUNsu9gvwalAznBoLNdrM7NHoaH81wr5wu4u
         6Z09yILncx7FimRHQNBvWxlA+cArNk4Dgobf3lRVFFQHgPUWP3C5hGI5N1v+X1qA1eIJ
         fOiA0mhOonQjQcp+zNEnz78bRjeq9ifuBQz55MU5UXSLIkSv4xYzBCkuN7gR+1SCcimW
         8p3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20150623.gappssmtp.com header.s=20150623 header.b=Bg6a5swK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si2163034vkf.12.2021.08.19.09.22.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 09:22:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20150623.gappssmtp.com header.s=20150623 header.b=Bg6a5swK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGkoJ-0001vh-5K
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 12:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGko8-0001vO-PZ
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:22:20 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:46746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGko6-0006Fm-Tl
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:22:20 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso5112873pjy.5
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p44jCeYKdrpA7KiWVnFT5WLCgnHA26AOQy7zDNCARlM=;
 b=Bg6a5swKB3Gi+XauMZ5TataNQDj7q6CfoHP1Ajynri3ysO+3v+LVNv1bUSDDrY5aDL
 pSa30jLrq4nEO9LBvhO3ah6pt94DSRXp9/BWYEi+XTgfOUAN2guE1vu4t5LGaMmXKHTm
 rin5eElcU1SqvDyXPtZ3bfIst+2DuVBc6cHTjmg1IRL0bcb6+3o2PZbp1Bh8Js74p8wp
 3+rdbwaNqk9wgO0V/dmEuekOlFzNbwCKis/JgcscCzENzmhXnaur53D0ks3dvUSS3c3C
 ScZVaPuc0kd+HDhss7W18gyjglpD6Tn3HDZ+viGELzghw8xYiyDvufhVZE7q2VmodY66
 UZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p44jCeYKdrpA7KiWVnFT5WLCgnHA26AOQy7zDNCARlM=;
 b=Jtzieo231GnISM8qC2NPEXZaaqsgyu5o8tItZz7FoFLEsj/uq4xSbwiyBcLRtoT1Ly
 hE7YWGtd7mQw3p0CS1YQ+PUPs6iKzHYMuAiXijeRkWfPi4WaJRYu4NqwRvrDO64pg9/V
 Nq3sJQS2lr4AN+8DBq4Hvcu9gQ7m/YsK52u31WsUiTif9r+NGPRtyHuzdHdjv3qabuph
 chfbXe33JWCHVFzbW1PNIcIOaXazDMVIIsVIMTCPD9HN9c3HoT3p3nMUwGLcQDBA/TfA
 NDB7ilVNZOChB7x5hN9+89KiZYOQWQpR7smyIvOQHHaGvknG1uGJ5jhG/1OXhSnbQ19N
 UGTQ==
X-Gm-Message-State: AOAM532/Bs4kDBOJbOn79dUrFxcCA6EVXM8V7E/ZAV4vsUdd3U992m0o
 k8tciT4AFmXM++qBeeCbSLyOjQ==
X-Received: by 2002:a17:902:d343:b029:12d:3624:d997 with SMTP id
 l3-20020a170902d343b029012d3624d997mr12599682plk.79.1629390137161; 
 Thu, 19 Aug 2021 09:22:17 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.110.72])
 by smtp.googlemail.com with ESMTPSA id a6sm3445595pjs.40.2021.08.19.09.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:22:16 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/arm/Kconfig: no need to enable
 ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly
Date: Thu, 19 Aug 2021 21:51:57 +0530
Message-Id: <20210819162157.518203-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
 shameerali.kolothum.thodi@huawei.com, qemu-arm@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ztZhY3d9Ad38

Since commit
36b79e3219d ("hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)",
ACPI_MEMORY_HOTPLUG and ACPI_NVDIMM is implicitly turned on when
ACPI_HW_REDUCED is selected. ACPI_HW_REDUCED is already enabled. No need to
turn on ACPI_MEMORY_HOTPLUG or ACPI_NVDIMM explicitly. This is a minor cleanup.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 2 --
 1 file changed, 2 deletions(-)

changelog:
v1: initial patch
v2: commit log updated and ACPI_NVDIMM also removed from config.

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4ba0aca067..dc050b5c37 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -25,9 +25,7 @@ config ARM_VIRT
     select ACPI_PCI
     select MEM_DEVICE
     select DIMM
-    select ACPI_MEMORY_HOTPLUG
     select ACPI_HW_REDUCED
-    select ACPI_NVDIMM
     select ACPI_APEI
 
 config CHEETAH
-- 
2.25.1

