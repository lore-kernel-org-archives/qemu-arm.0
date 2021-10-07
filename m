Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1110845lfp;
        Thu, 7 Oct 2021 00:30:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMLYmARZMtrjSGji4IWsGuhMPfoYo8uC4hGDPcwaOpPgtNSaF/c+u+ucIKmwXym2JKqMP0
X-Received: by 2002:a6b:7118:: with SMTP id q24mr1932196iog.103.1633591857636;
        Thu, 07 Oct 2021 00:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633591857; cv=none;
        d=google.com; s=arc-20160816;
        b=JGgg0rQ1N9oAysVfvJKtu1zK2b1ishIFP4m62pmP+hPab4x7kamxU8kWSj8BgwG08P
         Dt31ip71/O6dUHklWY6kXfk1tkwzbO4qD1y7rV++G2ng6N73EtFsS7r5s0ZVpY1Nt0dR
         GpVmYpKs3DLKyONXzbOiA/8TOb5lg33Z/gjb+p4AoM4h6Rf2E/JF0pFHPa7kGmUfzdmp
         PBHB/mDuTMW+Yk3hMGhj4JagEOZRY5Nq7yoUqnamC3cWDzU7kpccIzb17YhSk0zGVMz/
         a0lvjXXsfcQGPoUjpvwhXzrJyWTPpsrniBoIH0rfiK25aEQg34qrIvUkxWxZEOvN9CiG
         5zYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l85TH9vALhSu3lra4HPn6GHLOeLPCI6Zp3E2VbDT0Sc=;
        b=kYgbl8zovaA/VjLATgDlgTd2/zR+ENiQxR097VTXyN0G2JQCuVozq0T6LSXojD4ib7
         SRE6lsjM9yKSCRNJ51uF+b7EKZqkmx94xd2T57SphgG6FfjIsqEGm7r5FsSqElf6wKqj
         V+hxaCVqfm6lXaaC9whn00MEOO8XEkqSDRRgUxBkQbCBA2fPd6AqsAS8jqXLEDXBkUfa
         DH9MkQQXWP4+9e6Nuux4apWXHuG3c4KBUZFfyBLvAYlp182LzG6u73V2BRRGV7PTa8yG
         4MqOFq7U2OhNy/T7WlR47hwGD8q5xNR5hFvrtucvBfFK5RlOta8oz0LggelVOxWRINjP
         eBoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZXQ7IfgX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16si24673059ilm.91.2021.10.07.00.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 00:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZXQ7IfgX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYNrk-0008CN-VE
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 03:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mYNqg-0007Ou-Q7
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 03:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mYNqe-000263-8S
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 03:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633591787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l85TH9vALhSu3lra4HPn6GHLOeLPCI6Zp3E2VbDT0Sc=;
 b=ZXQ7IfgXdA3nafsw1QcBaGY2HJiOIDijCHx/I1dNxy1IN/UWopB0V1XSRg6evU9zPnIb8l
 Ngf4FqZiH3iPbbzz1Bb8fEHqANQYxSS2VGZulcPOts6/xf/CPR2qALowps0TqLv+uysrqT
 Hge6BtHb4WabouYt7Yv+BOm4qaHI8vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-5M-7KDlCMmO3K3JR201Ifw-1; Thu, 07 Oct 2021 03:29:46 -0400
X-MC-Unique: 5M-7KDlCMmO3K3JR201Ifw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DA90101F003;
 Thu,  7 Oct 2021 07:29:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B15E10013C1;
 Thu,  7 Oct 2021 07:29:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v4 3/3] bios-tables-test: Generate reference table for
 virt/DBG2
Date: Thu,  7 Oct 2021 09:29:22 +0200
Message-Id: <20211007072922.655330-4-eric.auger@redhat.com>
In-Reply-To: <20211007072922.655330-1-eric.auger@redhat.com>
References: <20211007072922.655330-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X6+IpDyEPMtq

Add the DBG2 table generated with
tests/data/acpi/rebuild-expected-aml.sh

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>

---

v3 -> v4
- adapted after the change in header revision
- added Michael's A-b

Tested by comparing the content with the table generated
by EDK2 along with the SBSA-REF machine (code generated by
DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c).

I reused the Generic Address Structure filled by QEMU in the SPCR, ie.
bit_width = 8 and byte access. While EDK2 sets bit_width = 32 and
dword access. Also the name exposed by acpica tools is different:
'COM0' in my case where '\_SB.COM0' in SBSA-REF case?

Here is the human readable content:

[000h 0000   4]                    Signature : "DBG2"    [Debug Port table type 2]
[004h 0004   4]                 Table Length : 00000057
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : C8
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                  Info Offset : 0000002C
[028h 0040   4]                   Info Count : 00000001

[02Ch 0044   1]                     Revision : 00
[02Dh 0045   2]                       Length : 002B
[02Fh 0047   1]               Register Count : 01
[030h 0048   2]              Namepath Length : 0005
[032h 0050   2]              Namepath Offset : 0026
[034h 0052   2]              OEM Data Length : 0000 [Optional field not present]
[036h 0054   2]              OEM Data Offset : 0000 [Optional field not present]
[038h 0056   2]                    Port Type : 8000
[03Ah 0058   2]                 Port Subtype : 0003
[03Ch 0060   2]                     Reserved : 0000
[03Eh 0062   2]          Base Address Offset : 0016
[040h 0064   2]          Address Size Offset : 0022

[042h 0066  12]        Base Address Register : [Generic Address Structure]
[042h 0066   1]                     Space ID : 00 [SystemMemory]
[043h 0067   1]                    Bit Width : 08
[044h 0068   1]                   Bit Offset : 00
[045h 0069   1]         Encoded Access Width : 01 [Byte Access:8]
[046h 0070   8]                      Address : 0000000009000000

[04Eh 0078   4]                 Address Size : 00001000

[052h 0082   5]                     Namepath : "COM0"
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/DBG2                   | Bin 0 -> 87 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 1910d154c2..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/DBG2",
diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..86e6314f7b0235ef8ed3e0221e09f996c41f5e98 100644
GIT binary patch
literal 87
zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
TFmQk+Il-a=3=Gcxz6J~c3~mVl

literal 0
HcmV?d00001

-- 
2.26.3

