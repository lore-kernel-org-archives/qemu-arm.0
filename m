Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1263286ejv;
        Thu, 28 Mar 2024 09:47:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCqrfVyb748Fm4nI7AUkXzftKY72uH6gZI7VBJyeMnuFD08HtfFncmRwaGZmo/le6MyT4T2GKb0hth0Nwi4wbiCnHE8uHn
X-Google-Smtp-Source: AGHT+IHA00E9MP6+/NgPwzkW54o616XwNpMrXYxuD7pqly+fg3WgMTViUYhJJ7wrzSieEQWMBX7A
X-Received: by 2002:a05:6808:2e94:b0:3c3:d205:fff7 with SMTP id gt20-20020a0568082e9400b003c3d205fff7mr4385557oib.21.1711644471546;
        Thu, 28 Mar 2024 09:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711644471; cv=none;
        d=google.com; s=arc-20160816;
        b=HQRJf9g5pSyfCseFKwwKgdbMWxNvbgZ2eeIjO+PrURf019VRDIl5MdyiaX7W9p4Rpb
         p4Z6G+COeacsZVa6PQOVHCVPEZcT/9SqzyLsexshzIxmmjIbwzFKIgJLfd06BXErQ3Rd
         xeYK0BNDR9ZnNR4mLVKzAQIkrXTMeQkZ+9MxcrB9VhDjfBgJkmpYFOgrcNyqyiSwLFip
         uvJKmQWogF9kqCSCgbVyg6ZZ6jofyog8p2Py7+OuOivEtmHLFcSIohxf/52g7XaW2p9b
         Y/b+Bc4B5LtvySqNUdLAaI82t5k37mS3m6opFjtuPKip6ghnnAR1iZ53+HRR3/FhMq1g
         H/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=sVLtdL9BKfQ6sjDwg2AAhJivqRmilxR71j8l3i5hprg=;
        fh=azQkbuMRCdwms04B8xPIVCfbqK086iY2qL/mjPhsLgo=;
        b=Ay/nsIZ8tCojKA9U7hGjY2cde0qmq7FnqO8oqTKb2Sn1KhzcZrSCTvlhWGtqLpFXZW
         cp2zxfNkVR10WRt4lYntFurqBMNFYQYCabQ2Lkhm6LL8dOvHkuSou6xSbnC/kCdG+CFF
         BUC+46G7+K6X1IHELmXb4lZMWQR92JELzkl8ngewlgxOji/GLD6KSBxBbBPLHpuPRVH7
         T7aInsXmNdImmyHHF5M3+XggLJykEMuxnItHmalKRZXoEjCtMB4Y9waEQIwqfiniC5An
         uzlO+oq1f/9r6QK5+wt6sBtRwg/YYZjKRE9pL3afZQ8F/4+67K0hTQ588nuDAlCL4FPf
         KjgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=jHsP1VfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020ac85c48000000b004313ffc3e11si1796356qtj.57.2024.03.28.09.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 09:47:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=jHsP1VfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpsuT-0001LE-Qo; Thu, 28 Mar 2024 12:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1rpsuR-0001Kl-Rj; Thu, 28 Mar 2024 12:47:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1rpsuP-0004hb-KQ; Thu, 28 Mar 2024 12:47:23 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42SGW4rs029794; Thu, 28 Mar 2024 16:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=sVLtdL9BKfQ6sjDwg2AAh
 JivqRmilxR71j8l3i5hprg=; b=jHsP1VfGmhWlgl4ptUWhMq4nlIUTMRzb6kxnQ
 5iuOnF8nWSBEJXnZWfkMT6bs8CKm/iYQ6pHdowJXsLQ3TcDQRrCDLotyr1GhsOW5
 0Hu6SdY+e/PdoUclzms86j6r9STPRaBxUiyPzIdovGM2Q2nQElEay15S8W83WNvS
 aa7/1R7yISf6jdGw9mbmkn/5I3DfbBVPYLqS6VXZ4Y4ukBq6Y7yH0xFoMv9zcZ52
 JwkqDuZIQauqFi73ejVWRabfSL5wFSrhb+UNa9CCMHpkkKtbhXj8FfdUASj1Jvw2
 ELmqzq3KvSjkZsTTHiB9lag80nwiQ1rRkv+TGP2XbOxJjesBQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x54r61kbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Mar 2024 16:47:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42SGlFVJ009133
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Mar 2024 16:47:15 GMT
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 28 Mar 2024 09:47:14 -0700
Date: Thu, 28 Mar 2024 16:47:10 +0000
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>
Subject: Re: [PATCH v2 1/1] docs: sbsa: update specs, add dt note
Message-ID: <ZgWfDiuAduTXTI/a@qc-i7.hemma.eciton.net>
References: <20240328163851.1386176-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240328163851.1386176-1-marcin.juszkiewicz@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _urmcyJupADUnV-Q5XkvAse6reqaMRCD
X-Proofpoint-ORIG-GUID: _urmcyJupADUnV-Q5XkvAse6reqaMRCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_15,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 mlxlogscore=687
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280114
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: fADyRNiwCtB+

On Thu, Mar 28, 2024 at 17:38:51 +0100, Marcin Juszkiewicz wrote:
> Hardware of sbsa-ref board is nowadays defined by both BSA and SBSA
> specifications. Then BBR defines firmware interface.
> 
> Added note about DeviceTree data passed from QEMU to firmware. It is
> very minimal and provides only data we use in firmware.
> 
> Added NUMA information to list of things reported by DeviceTree.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

Thanks!

/
     Leif

> ---
>  docs/system/arm/sbsa.rst | 35 ++++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
> index bca61608ff..2bf22a1d0b 100644
> --- a/docs/system/arm/sbsa.rst
> +++ b/docs/system/arm/sbsa.rst
> @@ -1,12 +1,16 @@
>  Arm Server Base System Architecture Reference board (``sbsa-ref``)
>  ==================================================================
>  
> -While the ``virt`` board is a generic board platform that doesn't match
> -any real hardware the ``sbsa-ref`` board intends to look like real
> -hardware. The `Server Base System Architecture
> -<https://developer.arm.com/documentation/den0029/latest>`_ defines a
> -minimum base line of hardware support and importantly how the firmware
> -reports that to any operating system.
> +The ``sbsa-ref`` board intends to look like real hardware (while the ``virt``
> +board is a generic board platform that doesn't match any real hardware).
> +
> +The hardware part is defined by two specifications:
> +
> +  - `Base System Architecture <https://developer.arm.com/documentation/den0094/>`__ (BSA)
> +  - `Server Base System Architecture <https://developer.arm.com/documentation/den0029/>`__ (SBSA)
> +
> +The `Arm Base Boot Requirements <https://developer.arm.com/documentation/den0044/>`__ (BBR)
> +specification defines how the firmware reports that to any operating system.
>  
>  It is intended to be a machine for developing firmware and testing
>  standards compliance with operating systems.
> @@ -35,16 +39,29 @@ includes both internal hardware and parts affected by the qemu command line
>  (i.e. CPUs and memory). As a result it must have a firmware specifically built
>  to expect a certain hardware layout (as you would in a real machine).
>  
> +Note
> +''''
> +
> +QEMU provides the guest EL3 firmware with minimal information about hardware
> +platform using minimalistic devicetree. This is not a Linux devicetree. It is
> +not even a firmware devicetree.
> +
> +It is information passed from QEMU to describe the information a hardware
> +platform would have other mechanisms to discover at runtime, that are affected
> +by the QEMU command line.
> +
> +Ultimately this devicetree may be replaced by IPC calls to an emulated SCP.
> +
>  DeviceTree information
>  ''''''''''''''''''''''
>  
> -The devicetree provided by the board model to the firmware is not intended
> -to be a complete compliant DT. It currently reports:
> +The devicetree reports:
>  
>     - CPUs
>     - memory
>     - platform version
>     - GIC addresses
> +   - NUMA node id for CPUs and memory
>  
>  Platform version
>  ''''''''''''''''
> @@ -70,4 +87,4 @@ Platform version changes:
>    GIC ITS information is present in devicetree.
>  
>  0.3
> -  The USB controller is an XHCI device, not EHCI
> +  The USB controller is an XHCI device, not EHCI.
> -- 
> 2.44.0
> 
