Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1546965lfk;
        Fri, 10 Dec 2021 09:06:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXc/z/TnDXG5+HMMEWfdbe1PTkvtlufuyTqiwTjv0vHYd0Xi3ZETjlQLzszEHpPYRaH72S
X-Received: by 2002:a05:6214:1310:: with SMTP id a16mr26529371qvv.117.1639155994807;
        Fri, 10 Dec 2021 09:06:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639155994; cv=none;
        d=google.com; s=arc-20160816;
        b=fsY/qG8ZsjNu0GeP3OynhtVBdAjN59ZL++CwcyN1kaFFOPJpTRXcUY2bdtk/Kb3sfc
         LF19CbXJkZBjoUcf9yvOGviamsrbQWLSUjkvowbEZL1fQoib4ZPliO/fPn0OPucU0qyG
         pgtkMGhTvAeg2o8LxqcRA8ADdUlZsY+sJNqpIJa5AO14K1BWFOyVVGrHBHizQOb/qCzL
         HMw1HXrkS+Fkmpxk0qn7eFWiCX9SgfcxFyVWrggPLOTZlt6bZlU0OcOedDgxnEG+8FqH
         OGAL2p4H0sQ8r7tZb3Kt8Ea2YR9ZrkZNnVRiNa/zWjJSX7aiRNA9ehUZwNJza4HqX1W2
         BiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=31SBXr+ll2DgZVzLxTnqIHA7xmVY0g06H2BnonCZLfk=;
        b=U3rxqrdSpe5U9wN/1q4V/z/8kQB8PdNhSLoI9E7N1d18W2zzR5qBBs8Jmecxy9ivL/
         llKG7iok4dmD+60Q8rHlcQ7CRV4Q3QD51eMmKB4pOGDLu+B9AW58IABbemwQda9QNesn
         2wyrSyM0h2qzU5sYiRj5N3ipBWjM1NOrUYenNF0wMIh8a7mRgCjhL642JVkhGXlGgh6u
         vnFl2aB/HnBsN0+JYms+UcfkMXlqkmrsqONo7+gTrKg95rc6gWWDuO7KkLJuYFuPoR2O
         n4+sHRZYb4M0eslgreNlhuF9l7y5s7S9e+KO0f01tbD34jxojXeDuHx2RIyHfK05YyQH
         ZIRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NTlmLAaY;
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si3496498qkk.83.2021.12.10.09.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Dec 2021 09:06:34 -0800 (PST)
Received-SPF: none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NTlmLAaY;
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mvjLu-0005lE-6Z
	for alex.bennee@linaro.org; Fri, 10 Dec 2021 12:06:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLI-0005id-Vb
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:05:57 -0500
Received: from [2a00:1450:4864:20::531] (port=37555
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLF-0006O1-US
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:05:56 -0500
Received: by mail-ed1-x531.google.com with SMTP id e3so32649373edu.4
 for <qemu-arm@nongnu.org>; Fri, 10 Dec 2021 09:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31SBXr+ll2DgZVzLxTnqIHA7xmVY0g06H2BnonCZLfk=;
 b=NTlmLAaYIxA4ezOLa7mKC01IaImOnCB6gzP4zos8KW7+guHIBJvLLjkjS/CB8uSjIL
 Z5vjQyHYdO5T/vN3IEmbH0EM7tb5RsLOaDxC30+U+07lr0zp8qXwe60OdrZmX19nPxRq
 /oU2PZbgUYQMwPVvlAJ5V2XgFcO/lOJxYN0poHkZ8Pe876G6kbDvJU0qk+M+ynV3h1H9
 oZjjIqVdlpsAn7NCJ4Ji47SE4i5X1J2QH4lWNkKCLP9H9gep22kay0Qi9LGTGxZv292o
 XUuuaTyulROMsWObppyruAo3c6ROrF5kaRNlpCpCetfTb7JwrWwaZSXvLx/cYauZNmA6
 vrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31SBXr+ll2DgZVzLxTnqIHA7xmVY0g06H2BnonCZLfk=;
 b=mIu8STF5+FVCMTgGhPFGOwxFEgvId3KrfCcCpmOVcjtQftRHEcO3Slni46LY3wMJGM
 K31t4y7njGWYuoLC1dkZ1SFy6R/JWJtouDzaboBXNfhNxogy1j1Vgj0SMf5mmYEdpdF1
 yPM4tvkoFq0h1q6tNh5vw/WN9HNtQUuMm0as3zS4B9guZWR9FLGG3eCgRzdFC7/ErFlh
 tVoJKMYOyzwZRVweihALcEUgvPNHTQFBYDZ2JndwRbtN7NiKH7BvPHY/jEAhV6eKF2vT
 3TOCKNR/umirfuMAkh7uI3XPZvBUttdLLPHvMju2MfFod4zw9O3CNyBJhPtOLjvUvap7
 h4Iw==
X-Gm-Message-State: AOAM531NJZ03cGPo3YzM4uxPAfbZz5yeVusF2gLYnhisOVtfN2Ir6faa
 B90DhG+kRDei+uBq+T64nnEfXA==
X-Received: by 2002:a17:907:8a1b:: with SMTP id
 sc27mr25574073ejc.572.1639155951758; 
 Fri, 10 Dec 2021 09:05:51 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:51 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
Date: Fri, 10 Dec 2021 17:04:08 +0000
Message-Id: <20211210170415.583179-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UbEwv4xUQaCy

Add ACPI support for virtio-iommu on the virt machine, by instantiating
a VIOT table. Also add the tests for the ACPI table.

Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
series [2] only contained the table and x86 support, which have been
merged. Everything has now been reviewed and should be good to go.

* Patches 1-2 add the VIOT table for the virt machine
* Patches 3-4 are minor fixes
* Patches 5-8 add tests for the VIOT table. They contain the tests for
  q35 as well, which didn't make it last time because they depended on
  another fix that has now been merged.

[1] https://lore.kernel.org/qemu-devel/20211020172745.620101-1-jean-philippe@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20211026182024.2642038-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (8):
  hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
  hw/arm/virt: Remove device tree restriction for virtio-iommu
  hw/arm/virt: Reject instantiation of multiple IOMMUs
  hw/arm/virt: Use object_property_set instead of qdev_prop_set
  tests/acpi: allow updates of VIOT expected data files
  tests/acpi: add test case for VIOT
  tests/acpi: add expected blobs for VIOT test on q35 machine
  tests/acpi: add expected blob for VIOT test on virt machine

 hw/arm/virt-acpi-build.c       |   7 ++++++
 hw/arm/virt.c                  |  20 ++++++++---------
 hw/virtio/virtio-iommu-pci.c   |  12 ++---------
 tests/qtest/bios-tables-test.c |  38 +++++++++++++++++++++++++++++++++
 hw/arm/Kconfig                 |   1 +
 tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9398 bytes
 tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
 tests/data/acpi/virt/VIOT      | Bin 0 -> 88 bytes
 8 files changed, 58 insertions(+), 20 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot
 create mode 100644 tests/data/acpi/virt/VIOT

-- 
2.34.1

