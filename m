Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3750021lfb;
        Mon, 6 Sep 2021 05:38:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySfYgK7VhfiuJywkbmhISs6q8sPaobNyp14Zlx1Iz2yA0nyI4pB0i//7YqQEyoO46YJ2zn
X-Received: by 2002:a02:9542:: with SMTP id y60mr10562314jah.87.1630931889743;
        Mon, 06 Sep 2021 05:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630931889; cv=none;
        d=google.com; s=arc-20160816;
        b=cvR5Din9JsHJQzGsbLCaO6jy/FtyvDFJuIKUsaGQJL2Zsmo27ikc2MYzYgqWfUvtov
         elLg8vbzSElB1FS9G3YE/jazkLP0JM0D0dL7jgcbqYNI26ENAxiaHaaM6n7OUDPPrUzh
         RatTIp/mgZbHF2VZ5yxQSZfpAppVNO/Ss2iQOtmB/up9zugXjSQH/1yyQPrio6tXwRX5
         mo3OjzjTMCXXoYI27/bPRXv4Qsd+VJUY5VhOmhDnKMejC73jOgct872gJ9K6Fsx8gP71
         PpPKLTlZntYQ+JTX0NxHofG6E94PUBcMrCQwA4fHyVO2g2S875G1dhg9ZzfCqsvCayrk
         bm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/xGWfUE5JQ/6EyPpmz2NMgwV9wg2v3SSamm12NpONbQ=;
        b=JECH5XjSRCYG61Y0qleGg8u+F5O/Nu2ECZrDIZ18d+zNVI71vbNArZlkEOVV1A7qQQ
         Bgad8tVCQSS02ONQVaz5eAqZuUvyOcMMpahO73zwsmbFqphMxyEWeBSnilhXixphJx1m
         NHxErpotigfzql3KdJxxPqmZUwQVXtzGmvOj0ryDX/2uBMuMJZQVrpfYyTnULGXu4vaP
         zss41v40EuXHIaes/NRmECLkDROIZynPkpw3gF0Gr5h8rCybciIC90Lecm59H1zJfNOq
         EjVtHPxw5HYzS4rZbL20vHDrXLZ5M/JUee2ydJD74yh4q451sgaicoZpH2Tg3pwTCNxW
         L8cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZGci9Jtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m43si6666689jav.131.2021.09.06.05.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 05:38:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZGci9Jtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNDt1-0001Qp-GO
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 08:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDp9-0006Ju-Go
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 08:34:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDnC-000211-IJ
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 08:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630931525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xGWfUE5JQ/6EyPpmz2NMgwV9wg2v3SSamm12NpONbQ=;
 b=ZGci9Jtl/zAJPw1IKMC3sTQYubDt5ZyiWjs5jN8gObPsVy4yljQwSucu6b3vNeK09VCMNd
 GRJzIfx0w8xIBk8wHLYa6JJSSRKINJS296HWvvmM3zbXC6fDx1e6E70qOhOwvR34KCfkwc
 oJSSwDyJkkWlgzWFYTblfFJmLAY7EkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-fJnPjUgMMxCfnR9D5s0vyw-1; Mon, 06 Sep 2021 08:32:04 -0400
X-MC-Unique: fJnPjUgMMxCfnR9D5s0vyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27D0F107ACCA;
 Mon,  6 Sep 2021 12:32:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71BD71B42C;
 Mon,  6 Sep 2021 12:31:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v2 2/3] bios-tables-test: Generate reference table for
 virt/DBG2
Date: Mon,  6 Sep 2021 14:31:38 +0200
Message-Id: <20210906123139.93593-3-eric.auger@redhat.com>
In-Reply-To: <20210906123139.93593-1-eric.auger@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
X-TUID: 5upQmLu0KudG

Add the DBG2 table generated with
tests/data/acpi/rebuild-expected-aml.sh

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

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
[008h 0008   1]                     Revision : 03
[009h 0009   1]                     Checksum : C8
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                  Info Offset : 0000002C
[028h 0040   4]                   Info Count : 00000001

[02Ch 0044   1]                     Revision : 00
[02Dh 0045   2]                       Length : 002F
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
 tests/data/acpi/virt/DBG2                   | Bin 0 -> 87 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..895679cec0732f4109322b59b532e904885e1cca 100644
GIT binary patch
literal 87
zcmZ>9ayJTRU|?WA;pFe^5v<@85#X!<1dKp25F14605OPW&}U#|Wl#gL7#JFufrJ=?
V5(5JVSdtSgD!{<t?C)#9000Z&2>}2A

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 1910d154c27..dfb8523c8bf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/DBG2",
-- 
2.26.3

