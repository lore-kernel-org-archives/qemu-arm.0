Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp224571ejc;
        Wed, 11 Oct 2023 09:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGzjMPZGdN+BgIo/XnEVxKcOKKFf1KRJh6SCE6g0gtIC/maEWrtcrYTbNU393zNHks/7g7
X-Received: by 2002:a25:c546:0:b0:d9a:45be:3d39 with SMTP id v67-20020a25c546000000b00d9a45be3d39mr7690826ybe.25.1697043178031;
        Wed, 11 Oct 2023 09:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697043178; cv=none;
        d=google.com; s=arc-20160816;
        b=XUYMXBHMLjyD3Qe/cHqet/QBi0iNOgZ28dmGUNRomrlQU3OUg4eU9UpvYm1D+fxaFh
         5qafz0puTtZtbMC+d63l3iLdE/LkvHZ6YxCZq/IKFQD3KR8Km34r9bwXQ4fur5xYMLh4
         8JE1jDApdKGaEpLPCgjeSeLApDgETHFhofr6NbVYyez7z90G++wFeOj1dp4uwXcZYYY9
         YxCnzrisN20n14g7EDj7+j3vrNMVPEfTd7LlGH6GZhr6hKQygHZmb+Fu5zn6Z7rmf7o/
         ESISdG6jaR+ki8dSOrk0SNk6tXHmGNQoIj5J/Cqtxjg/XDWHlJqoBj6I6/mAz77+p8dN
         Es1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2JSokJnhuWURT+69RXdic8xep5tE2/ofwS5+aAyzZU4=;
        fh=mISachWtBfNM+xwhtkUSxPXJbL9QWI2VyucuYtl+xAM=;
        b=hCf68M/ifrXekCH51HpUfIMJjWYQ6vmBvHjt1yodNSY1c/xNlHLeucNdiBBfeJ1/Lf
         LfATjmbRuNgYWo2vTsYCnTF6VU/HBL1+Xs87TtuQOZbvgWQs3XumA24kgp9LggjBqg6E
         CYGgCjgQuAXPywPO54+Bx7iHIvIls5zNzC4INiAMtKrcREiX5JvUaIB+XHjwwbUhrsja
         MrkO+cf2ijdKl2eCvCwy9ngiG4RZsX4KZo/jq2pc2mCcESufz3lVWDvOPYoqD4V/Mwi+
         UMBC/2kY6+RSpLGBzTLFWApnozBZFNaJ4oXBvvxrmesotPpIPinaq1e/5IpPq4qXLq9z
         1kpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=jEMHShzf;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id v62-20020a254841000000b00d818243663esi4943643yba.332.2023.10.11.09.52.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 09:52:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=jEMHShzf;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BFrAjL032370;
	Wed, 11 Oct 2023 16:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=2JSokJnhuWURT+69RXdic8xep5tE2/ofwS5+aAyzZU4=;
 b=jEMHShzfrDk+wnb55pobYuophUxp3QSri5PLBZIEMYkAp5OdO45uaa63iR3s2HnGEUhv
 mzwYeXNGHFxO2Qu6AXiEmZHe13dfnUbhBTxsGJlYpOkFLBr9qlkdGY4q1WX7cJ985D0m
 4GVIYKsTqmxfzgXYlkAtyzmx3QESWl9LHQdliiU65DsI20BcLwyjEHrgkEZBBnhWh6J8
 MLTR6rwt7yik/h/jC3aIHGTswOWko2/P/7LYJo/7S0jMKc0vBKbrzUMCDtp7fZk5rHAG
 84WtPBGf+RO9WxUDEtAvuR/G9lmVRjJbUEApdUQKDs6v9hYEeiRTKAbctNVk98NThvvD 0g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnsmq13np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:52:57 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGquIN007793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:52:56 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 11 Oct 2023 09:52:52 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v0 02/12] update-linux-headers: Include gunyah.h
Date: Wed, 11 Oct 2023 16:52:24 +0000
Message-ID: <20231011165234.1323725-3-quic_svaddagi@quicinc.com>
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
X-Proofpoint-GUID: BqnsfLi9u9yYt7hIm4s6X9wmoCJ7PmTP
X-Proofpoint-ORIG-GUID: BqnsfLi9u9yYt7hIm4s6X9wmoCJ7PmTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110148
X-TUID: lLS7nB+ljxJw

gunyah.h containts UAPI definitions exported by Gunyah Linux kernel
driver. This file will be referenced by Gunyah accelerator driver in
Qemu.

Note: Gunyah Linux kernel driver is not yet merged in Linux kernel.
v14 of the patch series has been posted on mailing lists.

https://lore.kernel.org/lkml/20230613172054.3959700-1-quic_eberman@quicinc.com/

One of the subsequent versions of the patch is expected to be merged
upstream soon, after this this change to 'update-linux-headers' can be
run against the main Linux kernel source repository from kernel.org.

In the meantime, a version of Gunyah kernel driver is available in
Android kernel repository, against which this change can be run.

https://android.googlesource.com/kernel/common
Branch: android14-6.1

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 scripts/update-linux-headers.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 35a64bb501..3f3608bcbe 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -161,7 +161,8 @@ done
 rm -rf "$output/linux-headers/linux"
 mkdir -p "$output/linux-headers/linux"
 for header in const.h stddef.h kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h \
-              psci.h psp-sev.h userfaultfd.h memfd.h mman.h nvme_ioctl.h vduse.h; do
+              psci.h psp-sev.h userfaultfd.h memfd.h mman.h nvme_ioctl.h \
+              vduse.h gunyah.h; do
     cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
 done
 
-- 
2.25.1
