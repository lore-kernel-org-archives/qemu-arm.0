Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1552026lfk;
        Fri, 10 Dec 2021 09:11:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDpJ+zQc0BIHW2lywoQB7y/fwiosPi7WGmqUOX8hJO69IDiHW6TUcNpFKZc6+QZH+yjWHC
X-Received: by 2002:a1c:4c04:: with SMTP id z4mr17764379wmf.11.1639156260855;
        Fri, 10 Dec 2021 09:11:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639156260; cv=none;
        d=google.com; s=arc-20160816;
        b=RQsyGIfwnUDoXCXX5UF5xpE/3uLEZ8ClS8A5/ejFp3LVkxmt8O4H6swWwnDu68Pyrp
         MmFj3sVDczujanPACzlCeYFDailREoTngCewxw0B+xVF8Tk4v0bN9XfmrLvxRO2NLjwT
         YGSxjnrpP0Q3nCyX5Ac/yag/vkmzbHDWG0TIjaIJ13b5s7PMDZu+WSMRqoiYnmtjeNC4
         WuZvNo1Jv1sNyQw/uFUu1rQdi+0AvI9QrwolzJMhm6IzLK8AEv429SdBoKTuQ8DeLgHY
         Q2S48bNivILPSDFs0gkSUYoD+TofTFxwYFYjHMw5rX1imZAXW+qxxf0Xy8ryU7EQbhD+
         MxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ip5soFw3rjH4l0UOQgeNBDeZEJ7Gl21CxRLwmqCQWdQ=;
        b=0M2KCcV1rXgOJbKchR93N2/XVkf9dUPBmehNWU3Qa+ZsW3E7MNwJ5q4YUuSEckjWrF
         68bCrJKFnhhcgQxylD938D15uKOK0BHxXcrm8s/KOqHuxj8zq80s7psibPXZ6q3KIBZQ
         cyxuWd9JwiaR0sVizQhq0jZxo6PFQU47Xe2j3gGKtfIX3Gd7zGQiN19xyZlsXK8naxT+
         k74b0sLnpMubvbpHeZo6xih2XHinxDCQFhrDHxXAFp1aPQfDzXHG0Q6oAwY1vmdQjWnT
         d+GSWCb5gyR4LmhYTW4GT/xZdHnp+PvZjxe+0NX3P/tEXshP7klTfG6sWXvBrCn9gi86
         E1Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="mgaPOR/o";
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si262675wry.987.2021.12.10.09.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Dec 2021 09:11:00 -0800 (PST)
Received-SPF: none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="mgaPOR/o";
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mvjQB-0005HZ-MB
	for alex.bennee@linaro.org; Fri, 10 Dec 2021 12:10:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLV-0005sy-S3
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:06:11 -0500
Received: from [2a00:1450:4864:20::529] (port=43782
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLT-0006VF-0o
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:06:09 -0500
Received: by mail-ed1-x529.google.com with SMTP id o20so32377652eds.10
 for <qemu-arm@nongnu.org>; Fri, 10 Dec 2021 09:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ip5soFw3rjH4l0UOQgeNBDeZEJ7Gl21CxRLwmqCQWdQ=;
 b=mgaPOR/okEysCyMG+xqVO6Ds5g6KN1gfOs78I+NPLB446dOfoUpzp6q1EEuwHO4gxT
 HU7hwoauORhUSqsDXswRH0HpGjxK4hrUXo84zxvQdWi9SMrXeiCEuA0+akokuxQw1ubp
 6tM3KlQ77zW9arVT3Zo3UbuHtQ/2TW4lTYY4GpH4uHvrjuin8uEPF+5CYMJzrbQY10of
 MaaOoh7eqZIojUEVZb+ybEEraMUpSvWQtUEsqTn7j16hoc/pDafqE3j9HWPmlpc/ZXNa
 EkYLUre9iaHhf6dqH6ekeDiGnWz7Amkln+YsMN/F4F4sW/BkIuhxffKmazUh2ml1iAQT
 KOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ip5soFw3rjH4l0UOQgeNBDeZEJ7Gl21CxRLwmqCQWdQ=;
 b=A3eXv3WQd7EB08jrx7QhJBmbpogqU+zHiRl8abOSE+qahBY/CKOv3bYuhDkGGOt0uu
 IuibqocfoOxQLS7Yx7qMtit9yjoS/UYaAJuY5KDOybZxzyFBz7wmxvzYJ7p1O87GfLeJ
 3CLaCJraZ7YTBy9Pf3GyNOheZJ+ZgltUBZ6tJ+6yflfUb5alONkzmTUFvIb8ekxtkBh6
 fUY5Vv/tMrWU3KFuBZG3uPrwqCTTOrNmBP5VK9n/FPqXdt+srgsA9/ohKudjjNvV0iOA
 PIGdUivXEGrBXrVI6BRp6qsBlUnR68PwEQw9FuX8lCd9KOZk6lcwSORUu6akeww5aLD+
 zlbA==
X-Gm-Message-State: AOAM530/FjE3NUsDjJIF/A5Levn6mHeYIcVrpoK29vpGVkh5Usz29THq
 r51beomtvHvYt1lUs/zHUZt6rA==
X-Received: by 2002:a17:907:60c9:: with SMTP id
 hv9mr24663120ejc.482.1639155963486; 
 Fri, 10 Dec 2021 09:06:03 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:06:02 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 8/8] tests/acpi: add expected blob for VIOT test on virt
 machine
Date: Fri, 10 Dec 2021 17:04:16 +0000
Message-Id: <20211210170415.583179-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: FEnoce0ZkdP9

The VIOT blob contains the following:

[000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
[004h 0004   4]                 Table Length : 00000058
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 66
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   2]                   Node count : 0002
[026h 0038   2]                  Node offset : 0030
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
[031h 0049   1]                     Reserved : 00
[032h 0050   2]                       Length : 0010

[034h 0052   2]                  PCI Segment : 0000
[036h 0054   2]               PCI BDF number : 0008
[038h 0056   8]                     Reserved : 0000000000000000

[040h 0064   1]                         Type : 01 [PCI Range]
[041h 0065   1]                     Reserved : 00
[042h 0066   2]                       Length : 0018

[044h 0068   4]               Endpoint start : 00000000
[048h 0072   2]            PCI Segment start : 0000
[04Ah 0074   2]              PCI Segment end : 0000
[04Ch 0076   2]                PCI BDF start : 0000
[04Eh 0078   2]                  PCI BDF end : 00FF
[050h 0080   2]                  Output node : 0030
[052h 0082   6]                     Reserved : 000000000000

Acked-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/VIOT                   | Bin 0 -> 88 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 8367ffe1d4..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/VIOT",
diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..921f40d88c28ba2171a4d664e119914335309e7d 100644
GIT binary patch
literal 88
zcmWIZ^bd((0D?3pe`k+i1*eDrX9XZ&1PX!JAexE60Hgv8m>C3sGzXN&z`)2L0cSHX
I{D-Rq0Q5fy0RR91

literal 0
HcmV?d00001

-- 
2.34.1

