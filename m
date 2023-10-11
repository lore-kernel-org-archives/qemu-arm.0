Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp224561ejc;
        Wed, 11 Oct 2023 09:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXtgY1apre4ga2XMrtufZuhmfse5Ps6LgK4Oz7pYnc9yCpc4gGxwIif/60D5+Zv+DuRGNZ
X-Received: by 2002:a05:6e02:1a26:b0:352:5066:55b1 with SMTP id g6-20020a056e021a2600b00352506655b1mr27970398ile.6.1697043176892;
        Wed, 11 Oct 2023 09:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697043176; cv=none;
        d=google.com; s=arc-20160816;
        b=nYbILb/wij0b1gpOsdhgqarlB2RMHcl0gYVM+3DPxEfg5u4PSSHrszr0IQYGunhf9v
         mvPKDgxg/8+l1U7GdoaPeJgg2QgqNmqE2D1Fvq4DHRfc7P+ETT4QNcS4AFNctKKGRfru
         IccGLupoY9JJM06mU1gnLgnhUUPrMjETwzx38kEfXWwuX2XWjq+PfsuwX+0uc9S0NMVT
         g5ZuN5cVwsiaRCGGoQU1jv9LX4cBQw3ytN0sfzbjue8OSqty0QU0XPaQjGLdJ8kTMl+d
         tMuctK1ADfWWqbRBN3EIj0Na4aCk2yh36sho9tm7tqGsYVD53XBL9gbfE0YqUCXzlZwK
         gX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=48LMkArQrrk8xV0fYkkJ1i/85hu8dWonlWcx7vH/4DQ=;
        fh=mISachWtBfNM+xwhtkUSxPXJbL9QWI2VyucuYtl+xAM=;
        b=whSMMHo78j2QiENSjp/8BarRg6YPVqcO1DhUwW8bT4yMLvWnwG+53uwweGKvfi7HJV
         n1ut8SfzXy3WfS0MaaciYojnbR7SWCxvdvJQpTaHdDNhofcCXhJfMOGy3bDV4gMcaVbv
         gTFrvS2B/HcQ3+hMIeUYG2ppo/dED9UfU6lKu/JI6jc5LlPhHxF3cSpbBk1KG/hSupsE
         /W4/woNS6hvF0ihT+R4rQE5rEzlvXs5rMvPWQD8UTdILRqumt1PjSUK7G7eirLwNXFZB
         BC5hxjUPA4vbSwkCXGZ5vSXYwA5tQNmVH5P8zEOzTd5uJLNaCtbt8np/kDy9f0m5ddzD
         3alg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=kheVdQn9;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id l7-20020a632507000000b005702257f32esi165064pgl.185.2023.10.11.09.52.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 09:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=kheVdQn9;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BCKirn002889;
	Wed, 11 Oct 2023 16:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=48LMkArQrrk8xV0fYkkJ1i/85hu8dWonlWcx7vH/4DQ=;
 b=kheVdQn9uxN0cFs1mQeHLT2ALg4x+gWCvC+RF6pguzXcQyvbszI+OZfmyxy/Ed7lnmgu
 NqBrnh9W16UFAU6dn1N9A+5YgfzJ36nGkRmnU1dcbyQBsLzx+tN2fmySpH5DWFdja6CL
 xT5Kg9DFhCaqJE7/M9jIrfqJN+OCH3nkzZiNGdJqqlAHrd3dgVI4H3fW5JlDsmH6x2wb
 6dZ+sG5YWxuvi6AwzIB65Jek3Tnqz2WSzPx85uTK+sj2VpBsQNc4toNVSPkK23CTBlhC
 yD2r+Jy1/qRKCdr2ZEyL2v4hTqk4QfcMtJ8zCsiJOphbJxOOzh71h39fAhCvMOTAtzvv Qg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnqh1hbbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:52:53 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGqqco005632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:52:52 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 11 Oct 2023 09:52:48 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v0 01/12] hw/arm/virt: Avoid NULL pointer de-reference
Date: Wed, 11 Oct 2023 16:52:23 +0000
Message-ID: <20231011165234.1323725-2-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: U8w0dNK3NP7TWlZx3ktvX9aTNd9d9kIf
X-Proofpoint-ORIG-GUID: U8w0dNK3NP7TWlZx3ktvX9aTNd9d9kIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=692
 mlxscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310110148
X-TUID: CwzJ5GUhdkTE

Avoid dereferencing a NULL pointer that its_class_name() could return.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a13c658bbf..b55d5c7282 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -661,7 +661,7 @@ static void create_its(VirtMachineState *vms)
     const char *itsclass = its_class_name();
     DeviceState *dev;
 
-    if (!strcmp(itsclass, "arm-gicv3-its")) {
+    if (itsclass && !strcmp(itsclass, "arm-gicv3-its")) {
         if (!vms->tcg_its) {
             itsclass = NULL;
         }
-- 
2.25.1
