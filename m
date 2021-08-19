Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp479323lfg;
        Thu, 19 Aug 2021 09:27:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD3V4MTfneYqbGxXfPj/MrCRSXsXzIq8+w77XCydwCoYQrGefrVid21o85TxNwRaMrVcDu
X-Received: by 2002:ab0:2b13:: with SMTP id e19mr12175525uar.3.1629390421261;
        Thu, 19 Aug 2021 09:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629390421; cv=none;
        d=google.com; s=arc-20160816;
        b=t2q5zyi080V+07lkXMWmU3Qbp3357DTh3Umy39Mzjaj+SfY0la+0haSEOe/I10APeK
         m38jsIpGJYBgSoAS+qDr1JGULWdHSsTtEsUzvnCXDY+a/UlqsOC/taN/OJm10+syBCx8
         VMqHf5kVraaxepizVptSIwpSuyekFStQ4z/3aA0eWoYOZWgkDKndIMZOd5HWIAHdaw44
         VHNd+NwUGmLJJ5fFZWumE/F98s46/IjiCSsFSzQxsq8m/r9XvyMIUtJuOW23UbdqSnsP
         RNHOgQ2y47kz3i+auSKh6SLZh2T1oY9djfJRV5nG0IRPJzK8N7qcQcEULj48CNz535mt
         o89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=zw05ZFdqHjgGhtKrtox9DSnlZFeRGCATj1DKecGTSRI=;
        b=d2/br6dKDOTJeYyY5jPuaY5BBfQBt6rsJ3XAoymPlsQvhUhf6VcMJJ+mCHRag2xXEX
         2PRcjJrX6dzCLsoQTGgImjNW0bTDqyz4Lr+9wuEN8FguYaIEMOlbhc53EfGKnnw1kDFG
         YHHkKuiKVxHRUWLDwCuzlkI1aB2Fun7+M8zvTOs8ONL6JZBxhQfDym+uBJ0V+MGDVrNJ
         LpTB5J6dvmGnxZtbER86Ece4X9ZMbZPgAeSAOU5S4yEiYUPxDbU4l4rVpCzl1oAl04eZ
         EDPThAcdaHjuqrJtqRfXBJwKyYgDVn1jDtggoiJrrdpv4hmwtFwgRfk0z5I7CCthgMjx
         CKuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20150623.gappssmtp.com header.s=20150623 header.b=l6cB0Y9+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si1766389vsp.85.2021.08.19.09.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 09:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20150623.gappssmtp.com header.s=20150623 header.b=l6cB0Y9+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGkse-0005XE-GU
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 12:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGksV-0005Un-Sg
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:26:51 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGksU-0000o5-7g
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:26:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id x1so1658814plg.10
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zw05ZFdqHjgGhtKrtox9DSnlZFeRGCATj1DKecGTSRI=;
 b=l6cB0Y9+YDGQnzNBJiYDqR0Qdbxq72BTLyvXeBZ5gSKMSCxLtLe9QiHLUDn3jRAfi8
 KY+zH1dQ8gpPWP6qQfYvUhkH6HyhfICtBA7v2MXSYlOnuBAJtTyQHyYhozbTWf6o8ILK
 sryTj6e0Kcz+CM4FMH8EgdciKlLNBs6RmcanZKROO0pJGiHrCXMRVX9kECr7iuKb1AxD
 +ND90aUbJ4MSR6cv4Z9VKBewVI+p9/kvxdsTcb4B+nWdMqKyhq8rXQCo90tR7xy6b6ok
 DXa53UjBgIv1scjBkIThH6iOs7ZKxrAtP1Y/AXw9drw/aV5bYv8RaA6ELdomFqbBnPRo
 BIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zw05ZFdqHjgGhtKrtox9DSnlZFeRGCATj1DKecGTSRI=;
 b=qnBvg7qycX/5aZtErTqOLfViIH9shVFpp1LJS9zxkiEFwM/FE8aCHYbkmekdoATCYn
 +v7/mVtQJiK75HXCRCJwuXEojgig6hk+21mDP+JxMqt2omrJv5ycqKNlBFm4Wy3idXlw
 j36ME4oPMNOxlFMGebA6WwAcrSnlnAiaLetko7HUYDNOyWs2oNCXzh1SpjMcVTp7EWsK
 IvKr85AEwkxVPETc80oGpR5m7969HhP+7MLxMONLn9D2jJwpu2xaB/c4a3dhxzGL33sg
 DkQi3pHzK0M8FGLczv4ZlCYgfozi+BqS1RB1VuwDmEWrhqvb2V655N5kDYlSD4sMHXv3
 Ljgg==
X-Gm-Message-State: AOAM531p7hS53hOGuP/zNkT3IMg2rIZ80TblPGDOWz7jy4DHmZyZ8Ze7
 BCMNI+9Iy1mpVXjvGQR/Wb3X6A==
X-Received: by 2002:a17:90b:4d8d:: with SMTP id
 oj13mr15814470pjb.74.1629390408576; 
 Thu, 19 Aug 2021 09:26:48 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.110.72])
 by smtp.googlemail.com with ESMTPSA id u20sm4703800pgm.4.2021.08.19.09.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:26:48 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/arm/Kconfig: no need to enable
 ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly
Date: Thu, 19 Aug 2021 21:56:37 +0530
Message-Id: <20210819162637.518507-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x633.google.com
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
X-TUID: SBasArcZeVDp

Since commit
36b79e3219d ("hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)"),
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
v3: added missing parenthesis in commit message.

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

