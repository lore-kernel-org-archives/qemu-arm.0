Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2041619ejy;
        Tue, 20 Sep 2022 14:18:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4By+MzVhd3WAxhG08+p4pvmOSNnTUG1Go16IbC4B9Sma9WWQrmf1bg4o9tduwDG94oD59w
X-Received: by 2002:a05:6214:769:b0:4ac:a40a:a5d7 with SMTP id f9-20020a056214076900b004aca40aa5d7mr20790110qvz.39.1663708730562;
        Tue, 20 Sep 2022 14:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663708730; cv=none;
        d=google.com; s=arc-20160816;
        b=ewVdV/NSrLVrXr99+RHYW0S+qmyufSEyj5NnPtMx8JuDfLhxBemPTxtC5DCI/ySSXp
         ctnqRhBhxmECAJRITmuIlkQt4Kd8WKQg0GWHw1sSKSzhDLVda/ZHyGZ/VpuGPAXGeUgj
         UkFwFnCNW111eDF13aZYjIPD2ErrIs6ED7q2POfL+DByTtBe/ZCg585ThbpViRBSTaa6
         iyHPamYHsGwMm+D99uJBKPYEOa0CWFRn2/KG2Iz0rSaN7zaa17pCPm+TR1cEu7f3sh/9
         hlzwOLgYwz1LzqNH2YzHdfMU8k9jvvJOusG6fQBqUEiK0FnhOqNDkhJsH2ewBrtDgRL+
         gSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=sKCdbPqoVW2GG4TICbgESjGduy1RL3n9W6alo80hVWc=;
        b=Wx2Pd7QH/GjhrP0Ir6rDj6L6NOk+w0Zgbrr+vrN97GWm1QqV86303AmyYfHTFWS6nZ
         Ga/lz3w1rrBmPXMQPnff1wIYVxBpzBWUAegaXWvtEROLCcNbqgMjBBrNcrOVLWFmFZ36
         e3JDzkzWSj6rq4iIO4lkAiwhcfV/MEz++ZR0JMTJEreK6qS/ka650hD7SSHdscy8stE/
         dyggtMvdZeBotSADaNRSepPjJjFO/PEaqU2A0JZgc2YGXz+Zd3KLrq2gZWhu25OP8ONy
         rewlzA8nyRrtZFdc7IWI8nd8jzeAvmsPL8jZEsFcQPBC5nEV1icKhCMFQjeGGwkGF1e2
         ySrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=xJwoXAYf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g28-20020a05620a109c00b006be59d6b6f2si476962qkk.458.2022.09.20.14.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 14:18:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=xJwoXAYf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:42416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oakdl-0006x1-20
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 17:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oag1X-0004gJ-Rs; Tue, 20 Sep 2022 12:23:04 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oag1T-0000EC-KH; Tue, 20 Sep 2022 12:23:03 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KGJNh1018151;
 Tue, 20 Sep 2022 16:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : reply-to : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=sKCdbPqoVW2GG4TICbgESjGduy1RL3n9W6alo80hVWc=;
 b=xJwoXAYfGWUIVX/8iGfoQPlYpWLacbe0ZCPANakkvwPFI3jfX0lWslGnqNImtXJJOD15
 viKABbR3li5dSQY2svOdvI258/FkziYiudyKfXpGr3YUsSVlfEk3iFhbv3QYp+t7dtmw
 ZUB2LjJIv6zXe3RLKN0l4u+DFpWQXeXhmbZBcnJAWKSw1HHN7Wk7QlJ2d/MWPbADjV5f
 D3lFK6YHpaVZqLIz5s7KeVvZDQsKrxr48pxg695gBmI/ZXKReSLr5OPYM6QV5BbLtV/E
 mCZZ3utEdGX1WGbLoMxadZS1D8EBeedFina8BR5auDDyVYyZm0o3CHwsvugHrjHagZ9A GA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn69kqjd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 16:22:54 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28KGBffB027918; Tue, 20 Sep 2022 16:22:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp3cng7nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 16:22:53 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KGMqUt016251;
 Tue, 20 Sep 2022 16:22:52 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-195-182.vpn.oracle.com
 [10.175.195.182])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3jp3cng7mf-1; Tue, 20 Sep 2022 16:22:52 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org,
 Miguel Luis <miguel.luis@oracle.com>
Subject: [PATCH 0/3] fix for two ACPI GTDT physical addresses
Date: Tue, 20 Sep 2022 16:21:34 +0000
Message-Id: <20220920162137.75239-1-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_06,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=754
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200096
X-Proofpoint-ORIG-GUID: rJJTH8BMPTFeWu_JWqsO7q9g7dLVXDp8
X-Proofpoint-GUID: rJJTH8BMPTFeWu_JWqsO7q9g7dLVXDp8
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: miguel.luis@oracle.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nAdagUbYcYbt

The ACPI GTDT table contains two invalid 64-bit physical addresses according to
the ACPI spec. 6.5 [1]. Those are the Counter Control Base physical address and
the Counter Read Base physical address. Those fields of the GTDT table should be
set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.

[1]: https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gtdt-table-structure

Miguel Luis (3):
  tests/acpi: virt: allow acpi GTDT changes
  acpi: arm/virt: build_gtdt: fix invalid 64-bit physical addresses
  tests/acpi: virt: update ACPI GTDT binaries

 hw/arm/virt-acpi-build.c          |   5 ++---
 tests/data/acpi/virt/GTDT         | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.memhp   | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.numamem | Bin 96 -> 96 bytes
 4 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.36.0

