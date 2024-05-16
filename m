Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1608752ejl;
        Thu, 16 May 2024 12:42:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRd8WkjJ6+RZT6RLUg4e/FW7nQIm+34gd5j5H+k242pOU8oBSsT2TBSN0Sma/ylj2nii4mXGqrRbSEQIxb8Ho92WKQKdcb
X-Google-Smtp-Source: AGHT+IE/D4z6Iet/SMiYvYpqRK3ex+8d2EgDqPPn13YIpwEmnDdUVGTzN1sFzhEGJ5ku/82Klx3/
X-Received: by 2002:a05:6e02:1fe2:b0:36c:4b60:3568 with SMTP id e9e14a558f8ab-36cc150311dmr256352535ab.29.1715888529567;
        Thu, 16 May 2024 12:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715888529; cv=none;
        d=google.com; s=arc-20160816;
        b=U3d0o66QNufY1SPf7RlsGJ424uyLkUWA+ePsT6WEmSHuHqEcEfJu4L0ZMq99Uj+pmA
         fh6R4ZBQ2EFlIPtJ6h237lMhaFHXu5WZ75/fMxzUPtKpau7IKMMrakbKrtzQPSu7qQNN
         tGegV9eB8fimak8TSOgG6LfyQsLiJDJKjRM2lkzmauo0X03uFQOIaIYYhSNdGrXkmeUh
         YKQVOyIMBWF6NANMZrQBHG+KgShMBdz7jbWTuwC4SSjwKzWqnR0cYu1iW1whVKd18PiC
         DMy33e3sA3OAa2Q7g0EdKFFWAyOSjGJANBjM16uA9M/nF5jWWckHgF0ThfmcVjuYVdaM
         eCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=OnUlYBuD8UjKSLFNZBxpwgTLeP+MqQOeusbC1aDUHL4=;
        fh=iQY2wHJsZZYZ4/33azmH3EUwzomNaT+kbmfZS4ZjW2U=;
        b=JiXAjugYqD3buBoqHvUUf2gTw8T4tGePE5cYctaBff0QOyGRx35harNohp8mxdgbSE
         etoKeRvWKP3eiiVV16UIPTdYNeLsfD7P2GhayeAE+Hav0BDE2SLJa9whF+y0elSL/kEu
         RcJY7FgJ2OMIDN/oiE3beItAvr+1Vi3jFses4RubBYNZfhwxy1Nonnla5g+zuzHOAgpb
         +hfNJvX10j7JUjtVYx4c47WJzdtqojsJ2RPXMUCBtg1zHmvqHCltAPOul7iYP0umlF8O
         FEb+NaNWb6kE91MO2OORWJaNrETl7g5JfV2d06AXya/duIyFU9dm0/BwY9b50jeIY5Ga
         qTOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Ud6Qwbb0;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id e9e14a558f8ab-36cb9dcaa82si85405235ab.115.2024.05.16.12.42.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 12:42:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Ud6Qwbb0;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GB15cp006187;
	Thu, 16 May 2024 19:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:reply-to:references
	:mime-version:content-type:in-reply-to; s=qcppdkim1; bh=OnUlYBuD
	8UjKSLFNZBxpwgTLeP+MqQOeusbC1aDUHL4=; b=Ud6Qwbb0FeZi+ge2+3pswrNc
	VjYhHsXHdkfcJBoet99Hp5vRnnP2OSsdniFzot83/ltTkUxg1UvBkRb4zEU6X4by
	AS2uiKC8Ds9fpSNWeL67DoirtS6mfTDMOF+CFtL71+AxiUWlXSjEienMozzA9u4d
	QQdSfS2L55dSt4xLTeLExfV/y1xbb7Y2jkiIzM+atyQDAyeGdkYoajqzMZ8feoWA
	dCu3ENHZQOayUMZ9u1eRjp2JW9qEzwzX6Ya9HlBn7YEV9uptXWQaXB7HX00tCKfi
	OSlE9lb4ihXXWSM4vewhyzUWxykpQCJkRSxpLGVd1D9uRJp3A2n9Aa1Pjmw5pA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y51tujvkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 19:42:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GJg6MY011490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 19:42:06 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 May
 2024 12:42:01 -0700
Date: Fri, 17 May 2024 01:11:57 +0530
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: "Daniel P. Berrang?" <berrange@redhat.com>
CC: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <quic_tsoni@quicinc.com>, <quic_pheragu@quicinc.com>,
        <quic_eberman@quicinc.com>, <quic_yvasi@quicinc.com>,
        <quic_cvanscha@quicinc.com>, <quic_mnalajal@quicinc.com>
Subject: Re: [RFC/PATCH v2 03/12] hw/arm/virt: confidential guest support
Message-ID: <20240516194157.GA440762@quicinc.com>
Reply-To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <20240516143356.1739402-1-quic_svaddagi@quicinc.com>
 <20240516143356.1739402-4-quic_svaddagi@quicinc.com>
 <ZkYgeGSPxD_yt5oa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <ZkYgeGSPxD_yt5oa@redhat.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YJfy-5VEm_NC79rR5vJlEN91NlZZ49R2
X-Proofpoint-GUID: YJfy-5VEm_NC79rR5vJlEN91NlZZ49R2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 mlxlogscore=886 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160142
X-TUID: R2qSN8QNurTh

* Daniel P. Berrang? <berrange@redhat.com> [2024-05-16 16:04:24]:

> On Thu, May 16, 2024 at 02:33:47PM +0000, Srivatsa Vaddagiri wrote:
> > This adds support to launch hypervisor-assisted confidential guests,
> > where guest's memory is protected from a potentially untrusted host.
> > Hypervisor can setup host's page-tables so that it loses access to guest
> > memory.
> > 
> > Since some guest drivers may need to communicate data with their host
> > counterparts via shared memory, optionally allow setting aside some part
> > of the confidential guest's memory as "shared". The size of this shared
> > memory is specified via the optional "swiotlb-size" parameter.
> > 
> > -machine virt,confidential-guest-support=prot0 \
> > 	-object arm-confidential-guest,id=prot0,swiotlb-size=16777216
> > 
> > The size of this shared memory is indicated to the guest in size/reg
> > property of device-tree node "/reserved-memory/restricted_dma_reserved".
> > A memory-region property is added to device-tree node representing
> > virtio-pcie hub, so that all DMA allocations requested by guest's virtio-pcie
> > device drivers are satisfied from the shared swiotlb region.
> 
> For reference, there is another series proposing confidential guest
> support for the 'virt' machine on AArch64 with KVM
> 
>  https://lists.nongnu.org/archive/html/qemu-devel/2024-04/msg02742.html
> 
> I've no idea how closely your impl matches the KVM proposed impl. ie
> whether we need 2 distinct "ConfidentialGuest" subclasses for KVM vs
> Gunyah, or whether 1 can cope with both.  If we do need 2 distinct
> subclasses for each hypervisor, then calling this Gunyah targetted
> object 'arm-confidential-guest' is too broad of an name.

Thanks for that pointer! Let me study the proposed KVM implementation and 
see how we can consolidate support for KVM and Gunyah hypervisors.

- vatsa
