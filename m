Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp772364ejc;
        Thu, 12 Oct 2023 05:33:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETph2uLdfN6mEdI/7t85HclU7khbauNdBbQ6GLgN6EYIG7v+VPW2yGRauPDRK5tZzRU5Ly
X-Received: by 2002:a05:6a00:234a:b0:68f:b5a1:12bf with SMTP id j10-20020a056a00234a00b0068fb5a112bfmr28278431pfj.29.1697114031610;
        Thu, 12 Oct 2023 05:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697114031; cv=none;
        d=google.com; s=arc-20160816;
        b=XA9ql6dO5B95UAF9isTW+ZAZsBmX12nsvZ8vO6pIcqx+F3ZiCWCTztCzWRDk/6EY6j
         SOCtGapEy9LrxgjqphNRO1IH+4R6raH+SQPVkhWoE2dWzr6mRF+M/HlO12dDdG7g1ZXh
         XkXn+9u3T76AIUgpMkCTbUT9qYpETlDksFAWe13V9g16RJWEG3jBUGVw1jwWlpYI5YFn
         TLpSjnelTnVDNuju7I60ltFQokqqyKUaGthJN7HU2MaKp+yIapx2ZYOIyS42RlLEVWZ4
         VfqyAw+8lGm6w6r2ZYKnvZ0f+wqIQUwXo+YJqAxCWTNA8q12jVpWe5J57SEZMXnD6utw
         JAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=xIhpmmI5C2VUd4R1fM9PEnaojoOJBcr3d/1t46H8pX8=;
        fh=PtCmXlIY6YlxXVQrsky2zWNgmnrXxAMrU7fZfQwUL8g=;
        b=J+U4X+n4G3C9DwomsCkzCCf7gmB/v53aG9oMmLjgXV0lMIJ0MsMINTJsQ4a7cdQRSG
         Wh0x6rpQnBYwQzAqc1sBkCqXGoq4ptktQohhq1kq1qnMm2Nxl2jlQcICXt4fWLy9Vgi6
         GlrazQAx8X9FU8vYJf7x4XLbuEZ4Q1YzjG/IvTxD2TxmEoyo9GYQcZiJMWkX9J5yR9/E
         yT47nn+LHJ6A+JfjpmQ9EtzYIx71WuablBDQMvkvgw/tKyi+ZPXsbpnDl6ni7ZmAk61X
         OIesPzMQkBhPARg2OIJCX5eZ1ShCijUlNYj8krmDRcBZP7SGVCjruHG10pZ4UVYt/uIO
         0qNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=ODW0gUTO;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id 19-20020a631753000000b0056b024a4dd0si2084328pgx.614.2023.10.12.05.33.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:33:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=ODW0gUTO;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CBvXfV032368;
	Thu, 12 Oct 2023 12:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : reply-to : references : mime-version :
 content-type : in-reply-to; s=qcppdkim1;
 bh=xIhpmmI5C2VUd4R1fM9PEnaojoOJBcr3d/1t46H8pX8=;
 b=ODW0gUTOUEXbVDSiV2XDERJHxgxk85R9+/pcgNZFHJmfLsSRL4j8Ao5BBasgNxviKp8b
 ZecnJZ9RpRmmbPfJaD+zPiy/uaUQ9QgmBkISSmvje82/6m2mZqzlsXM0jRFPw9Tf5/C9
 2BNzaSSZvWWOaF45kEvfU84jGuhzYA942NtkFznJIB91vbVuGDL3Xc9Xj6iBROY8MQqW
 a4NBz87tPZHClLti80E2+SOGoL0WA0P9Acl4FbwZBlpD72B/aQLocGw+DK4VYmIrXqww
 L1lb0fLEpuHaqISRah3V36Iy3Q2mDGQzpvDlPbpGx5gTJ6EMLuRiba26qfvCICtJTLWe rQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tpesu07j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:33:48 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39CCXl7J013068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:33:47 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 12 Oct
 2023 05:33:42 -0700
Date: Thu, 12 Oct 2023 18:03:38 +0530
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: Philippe Mathieu-Daud? <philmd@linaro.org>
CC: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <quic_tsoni@quicinc.com>, <quic_pheragu@quicinc.com>,
        <quic_eberman@quicinc.com>, <quic_yvasi@quicinc.com>,
        <quic_cvanscha@quicinc.com>, <quic_mnalajal@quicinc.com>,
        Brian Cain <bcain@quicinc.com>,
        Mark Burton
	<mburton@qti.qualcomm.com>
Subject: Re: [RFC/PATCH v0 12/12] gunyah: Documentation
Message-ID: <20231012123338.GF1130358@quicinc.com>
Reply-To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-13-quic_svaddagi@quicinc.com>
 <31ae6951-2f32-ab86-4ddc-aa70364a89ce@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <31ae6951-2f32-ab86-4ddc-aa70364a89ce@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hmKur1IsMjO69xXMxOGHcj06uzUkYzl2
X-Proofpoint-GUID: hmKur1IsMjO69xXMxOGHcj06uzUkYzl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=663 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120103
X-TUID: pSPYMaLOeTPm

* Philippe Mathieu-Daud? <philmd@linaro.org> [2023-10-12 06:52:04]:

> > +Limitations
> > +-----------
> > +
> > +Below features are not yet supported.
> > +
> > +* virtio-pci (support for which in Qemu seems to rely heavily on KVM, which
> > +  needs to be made multi-hypervisor friendly).
> 
> Is QUIC interested in working on that? My work introducing
> AccelCPUState to make CPUState accel-agnostic was done in that
> direction, but I didn't notice much interest in the community
> so I unprioritized it.

Hi Phil,
	We do want to see Gunyah support merged in Qemu at the earliest (as soon
as the kernel driver is merged upstream that is), so any dependent change in
Qemu for Gunyah would be of much interest to us! I am not sure though if Quic
can sign up for the entire "make cpustate accel agnostic" work. Can you point
to your ongoing work that I could take a look at? Would that address virtio-pci
becoming accelerator agnostic? 

Thanks!
vatsa
