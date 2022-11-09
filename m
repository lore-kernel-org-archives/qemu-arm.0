Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp259432ejx;
        Wed, 9 Nov 2022 05:36:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4arIOi+ELps8aVLZjVnHDr8+fWwyTCGoWAQtn/bmUzx2jlcba8jvDidC24e6pUkrhEJv3G
X-Received: by 2002:a05:620a:3708:b0:6fa:ebc4:bf6b with SMTP id de8-20020a05620a370800b006faebc4bf6bmr9344988qkb.138.1668001013895;
        Wed, 09 Nov 2022 05:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668001013; cv=none;
        d=google.com; s=arc-20160816;
        b=N0BVBmNEMj5VPLCzJcrKRslbyQv/I4WPCH3SaDU0efuPWDf/EwfDQFKeL20fltHPaK
         t4QRKKlV0nlGlxdoqCffC60y6PnsJqG0tUJtnICWUV6njOoMB883B+wzUgaySg+YYx77
         5kUSc6/Km37AiD0o4DjYOEBDC66ky2lJLXdmOYYHWuoC5JPhvyxpKMCZ9Y21SCWJztIl
         8rGif54U31/m/Hdx7Rpirf2ORLFvKszM3wtRuGELfrEmETy7P9NcQZBTbmcuLRFD56Or
         H9QuY6nN71Ve3ZwP5wunurqSvrDGKkZvv0ujFX+AIKTGU6ZIsip8hv/u3jSK62c95wrH
         aozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x8hVDncNQb8nBtaw9Nw6eP61V4si76SdgthW5BjmrTs=;
        b=QwYF4V5gntECGZQvnAqYcmPRvZlmlBeTFNQx/hroblNTlVD8OIe4DTuPDDfqVpPHDx
         AcRb68GRR5SchGeEBontkO0QRcbEztrVY03vXcAYwITPF/x80qX9x2wsLZS/TKn2g1nz
         aYIjSZwOxYq2HXqupwszJFxgWEJwQRxmlH0cf1Icl9n9Kuk0ZCZm9PuBIdMIIxDcpV9v
         KP47g+nBsSMYE9GUBRRbKtXdDaJprqXpaUp+V/1CuR5CgHrSO/nyLjYg3XOUzy+ypx5e
         Gw+vXzTvFB4QG074iwyXgZbO8UkBdw5AS4VJ6Cym3n2qo2nu9vFgn7UxH+CjzeBBz5ar
         HvRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=L1klUiL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk1-20020ad45d41000000b004bb67f6932esi8901074qvb.441.2022.11.09.05.36.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 05:36:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=L1klUiL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oslFq-0000O2-PE; Wed, 09 Nov 2022 08:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1oslF6-00007O-DZ; Wed, 09 Nov 2022 08:35:49 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1oslF4-0007Sn-Qo; Wed, 09 Nov 2022 08:35:48 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9DLxmP017188; Wed, 9 Nov 2022 13:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=x8hVDncNQb8nBtaw9Nw6eP61V4si76SdgthW5BjmrTs=;
 b=L1klUiL7FPX1BlvNAEjDYm84NDGWX6oghN2Fu2XHLuwwbKu/I+8rBaCF9QNtchpvtcwI
 qgQTZUYN7Jvst6Je9ahVgHPUDAqRIGBPHSjTGBfokAc0/f3QyY9C/uGb65POWoUAUOja
 wAUgqt+DEGfZDX0AgThwb5uOSl2Rqt/pyy6RbFVsHIvMIbcas5LlFe2PrzDlbRcZ2T3x
 bRPMtrfaZ4wQw2DoMwyGOQDo7Y5li2CHuibfEqIYaI3ZVqMkMA0Jm4KAnGFNtYMMBQiz
 MAnrupEvThS2mPAIdl6oDr5qy3SYLzUW4I3x/ClmpmuP3I6ZrqIRoytdvwlAo7rs/h12 RQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kr6dygx39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 13:35:44 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A9DZaBe006691
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 9 Nov 2022 13:35:36 GMT
Received: from qc-i7.qualcomm.com (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 9 Nov 2022
 05:35:34 -0800
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, Leif Lindholm
 <LeifLindholmquic_llindhol@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
Subject: [RFC PATCH 1/1] hw/arm: use -cpu max by default for sbsa-ref
Date: Wed, 9 Nov 2022 13:35:25 +0000
Message-ID: <20221109133525.762667-2-quic_llindhol@quicinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109133525.762667-1-quic_llindhol@quicinc.com>
References: <20221109133525.762667-1-quic_llindhol@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fAW6mqXYs5Qi1cNyNKJ0FRqM9SmO4Eud
X-Proofpoint-GUID: fAW6mqXYs5Qi1cNyNKJ0FRqM9SmO4Eud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090103
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FagQMKUU6QLZ

From: Leif Lindholm <Leif Lindholm quic_llindhol@quicinc.com>

Due to a change in upstream TF-A, boot fails (in edk2) on all cpus that
don't implement FEAT_DIT. The only currently emulated cpu that "supports"
this feature is "max". So switch to using that cpu by default for
sbsa-ref.

However, it is worth noting that the "max" cpu triggers another bug in
TF-A where Linux boot fails around UEFI ExitBootServices.

Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f..8bb5c0fc70 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -852,7 +852,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
 
     mc->init = sbsa_ref_init;
     mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
     mc->max_cpus = 512;
     mc->pci_allow_0_address = true;
     mc->minimum_page_bits = 12;
-- 
2.30.2

