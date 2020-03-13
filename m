Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2219693lfc;
        Fri, 13 Mar 2020 07:37:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvGwol5FwA983ENwBCM7nj6t50o6Df7+Np/Osq2B5XFGActgOUxeUNDzJPHFtLIJpenGR6Z
X-Received: by 2002:a37:b201:: with SMTP id b1mr5443742qkf.111.1584110267997;
        Fri, 13 Mar 2020 07:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110267; cv=none;
        d=google.com; s=arc-20160816;
        b=RNQ4RsjPpKGDA/T2Wdxdo9r9CdlZ63JvkXqEC/YrIlds/5gYx7FxsLbAqcaZMP7451
         roUyQWnhjAJFdg+OFE9KIAIDC+vkKO6caJrm1QMuRSgc2Q8VcWthCRk1OVFlF9XTh4MR
         EB/HAHTvMsRusk63xfkvl9CtcVm2JYz2C382Z6e4Sy2OIM9P98xxJIfrntcSuisx1GZo
         d4Tu4PDlJkFJGsJLaAZfE/tlu8P6JzAC+ELTf/Alw/Ov3MpVxIew6vw184SxZ8AvnAv7
         ljkApAZtrrVohGZygflLa/uYd9UrN2AJ1mut1T9PwvdFTYWJfWXB1q+R6aF1u0BaZWVC
         p3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature;
        bh=qEAv6IpogbV7YHyhj2l6c6UjHVFT5rsptczJTs+HL8c=;
        b=Fu9XHrn84vLftOm4A0/33tb86IiCGaBnMd2C1yUhqnajT89ra/WrDZfwbz/xvMpjBk
         yRaiJpXaaCIli8PgTYpuX2PgxSeFeye1O2UKU29WdBGTRXtqjYIqURU8jz28hS4cUjhH
         Ni/XTHKHjd7ymt0SWleMkU2IN/Wy3ntlpAUhALRXKTD5YSR/XL01gjgjIw01HwDWp5kg
         azwaIANRLfP2VdaT8+TwsZJWBGCApGHCCNY/RIvwTgQE+0jxMPI0UVGxswa8j3H4PbYv
         QncyTWYM7rcTxzWS059v3IfHkUL9+uR4zB3vSxuVy62g16RSFgvptzf/bDUHypIQH43P
         ofwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b=CRVBDdth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si608091qkd.153.2020.03.13.07.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:37:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b=CRVBDdth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:60038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClRb-0003fX-4u
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeXr-0006p5-3J
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:15:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeXp-0003xQ-PY
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:15:46 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:38816)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeXp-0003u2-JZ; Fri, 13 Mar 2020 03:15:45 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D79r9H009668; Fri, 13 Mar 2020 00:15:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=pfpt0818;
 bh=qEAv6IpogbV7YHyhj2l6c6UjHVFT5rsptczJTs+HL8c=;
 b=CRVBDdthzIfg6mB2/qjIvAGWr2LqmU68sHLndah0Jsr+8SqVpcyqhJ/waoz5g0LuccaL
 meMOWbsZtmCpHO6grYW6e251AukvTyBaP7EMJv8x9tyN45fG9bK2rZgqHaS2E0+DuHQ1
 f0qlX6xXLXh8zPClUafeOA+RmP6k2dVPK/3rG7IeOL02biPf6Zc1F61qhFAE20x3trSQ
 2UstkLV2gaNOICiBncwYt+W3WSSgnjsnrN8rzmy3A9Mi+xWElA2A20dAU6sSKXMlGdit
 IF81S2LGJvdukHzBc5qLJMKxXPuemqv3a+1RUjgYn3YJnBMYQNp+8UvU5YgVcDzhQ8WF ew== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yqt7f2s69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:15:41 -0700
Received: from SC-EXCH02.marvell.com (10.93.176.82) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 00:15:38 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:15:34 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH v6 1/5] hw/vfio/common: Remove error print on mmio region
 translation by viommu
Date: Fri, 13 Mar 2020 12:45:28 +0530
Message-ID: <20200313071532.26533-1-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_02:2020-03-11,
 2020-03-13 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
X-Mailman-Approved-At: Fri, 13 Mar 2020 10:35:46 -0400
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
Cc: Eric Auger <eric.auger@redhat.com>, Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lUvqD6dYOUTU

On ARM, the MSI doorbell is translated by the virtual IOMMU.
As such address_space_translate() returns the MSI controller
MMIO region and we get an "iommu map to non memory area"
message. Let's remove this latter.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/vfio/common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 5ca11488d6..c586edf47a 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -426,8 +426,6 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
                                  &xlat, &len, writable,
                                  MEMTXATTRS_UNSPECIFIED);
     if (!memory_region_is_ram(mr)) {
-        error_report("iommu map to non memory area %"HWADDR_PRIx"",
-                     xlat);
         return false;
     }
 
-- 
2.17.1

