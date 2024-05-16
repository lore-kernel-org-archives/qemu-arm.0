Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1409873ejl;
        Thu, 16 May 2024 07:34:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOpv/D3Cg68KHn938nLWbokweFJVuMNrS7VozkehoAUbSuwghgtBf8imCmzeaYplukstl1CToABMtQ9duXqa8CiaiPRoAT
X-Google-Smtp-Source: AGHT+IFc4Uel2wSqO1hC3dhu994/2VAvQvHXDlGm4wxbLm9qHvLDZT3Gng1/vT9YPLzykQvfTI8K
X-Received: by 2002:a05:6e02:1a4b:b0:36b:2bc6:6425 with SMTP id e9e14a558f8ab-36cc14760b8mr233135985ab.4.1715870077507;
        Thu, 16 May 2024 07:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870077; cv=none;
        d=google.com; s=arc-20160816;
        b=YGIB++v3N4AqxUXSWX29LncGtuaSHgpmK9vkrpmXAW7DJqBVek+nkb/AB5uV02DyW9
         Ceh77+wddCMxQiCsMCj7R1iwhQfRxvyO2e5QcCSfq8d4Xcftc5PUf0zk5H5+GhqvedUs
         ZEfi4p7Ck8VANl9YVnSkFStwbGfxo3E1+8RnOTrWf3JzVPFXGObWw1SKURNDLTmtUCrA
         jN/95C9QzFE12zz8gxd48rp/kKCbMngOQL4hV57dmtQRLx38vK2zTgNJ22BNeaTbIcPa
         PllDAfshtcVigmlwo5pxa5zBfwQzo20ZMUcARHGKwAdHPaRbvBoo3OOalsH66aGA8Ghg
         u47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kVnNmDeHGHBeNJsfxVy3AtaBExv17T9JYsx5Ioj/k08=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=UUm3FZ0RIdi7hE9sXibDsswkKQTWaE+2xvBAgJjRZ6ymGXalBD0DeFMQlSYrFXA0Yk
         LmlhhxrZ5O0Xnlg87t2w/nlLlb48vfIbgX9At7rE0XzqTiw4eiFLOB7ZaibWcynq74Ix
         SArMBic4P/HycbphewuYMWvNk1+FqosLdUEZcbLfE5KSsXf1rsvsDjDEQ2QH/7phuzK9
         uX0R9sKprwakV/LdFghN8QKklfD2gXYHKw+8t1TraVZbh1+oMv+Uy/RkrOaYCETlhGE8
         MvfD289uKjhw4+vejL/62FcW7qwyQ3GmJD7H2XKCZkDRLg2gbF/xytmVtp9amuccdvQH
         ytMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="gR/OTnf3";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id e9e14a558f8ab-36cb9dca89dsi71057255ab.97.2024.05.16.07.34.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 07:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="gR/OTnf3";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GA2aa4024806;
	Thu, 16 May 2024 14:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=kVnNmDeHGHBeNJsfxVy3AtaBExv17T9JYsx5Ioj/k08=; b=gR
	/OTnf3PaKbQ3zUk5m/8gASGV8I36JHi0ocUxErtSFmclKrVNLingfew/IIAmZ4tF
	Oz0WgsEj3vILCOJk6JKhy2bpoGGSKE3E76qCJDrzPIfwRWo4YpWSHgv59HPECOKJ
	M2R6JRlicbq4KyouXLwbsXGy1kgzPhp9uRdpIig6LmSDIEXJb+6uWC+plPl6bbqi
	mdHdkC04CoCkMNn5GYZuNzXp0bVK2ouzA2Tm3MDX10w9b+y0WETDhM72MvXvSnaq
	CtS4mok77Pbu11lFbT2eQYybffdzYd43WsW+GspS/4X2mTjc1t6bbK+WixC466br
	pA4Ya+FFh/VYTboOgecw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y49gdwcr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEYHu9008003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:17 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 07:34:13 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v2 02/12] accel: Introduce check_capability() callback
Date: Thu, 16 May 2024 14:33:46 +0000
Message-ID: <20240516143356.1739402-3-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516143356.1739402-1-quic_svaddagi@quicinc.com>
References: <20240516143356.1739402-1-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6KpMbP1NS-hAfX0oO8Zimhsvkhk6O0g-
X-Proofpoint-ORIG-GUID: 6KpMbP1NS-hAfX0oO8Zimhsvkhk6O0g-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160103
X-TUID: yLuDMJs2YwFu

check_capability() offers a mechanism to discover accelerator capabilities.

Two capabilities are introduced at this time to discover if confidential
guest support exists and whether a confidential guest can share its
private memory with host (using appropriate hypervisor APIs).

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 include/sysemu/accel-ops.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index ef91fc28bb..f76d5bb8ed 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -20,6 +20,12 @@
 typedef struct AccelOpsClass AccelOpsClass;
 DECLARE_CLASS_CHECKERS(AccelOpsClass, ACCEL_OPS, TYPE_ACCEL_OPS)
 
+typedef enum {
+    CONFIDENTIAL_GUEST_SUPPORTED,
+    /* A confidential guest can share its private memory with host at runtime */
+    CONFIDENTIAL_GUEST_CAN_SHARE_MEM_WITH_HOST,
+} AccelCap;
+
 /* cpus.c operations interface */
 struct AccelOpsClass {
     /*< private >*/
@@ -47,6 +53,8 @@ struct AccelOpsClass {
     int64_t (*get_virtual_clock)(void);
     int64_t (*get_elapsed_ticks)(void);
 
+    bool (*check_capability)(AccelCap capability);
+
     /* gdbstub hooks */
     bool (*supports_guest_debug)(void);
     int (*update_guest_debug)(CPUState *cpu);
-- 
2.25.1
