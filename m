Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1410215ejl;
        Thu, 16 May 2024 07:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzjQk3w34gBMlevTjf/l81dWgl8Z4MrngcuXOkCcrzBUsMAZvxJgQaF4x+Bn95oh3zHivhO+dFQ6sMqvKbcT3tvGg8wn04
X-Google-Smtp-Source: AGHT+IHn/UJ/ZsMMBRxvhdID0UKkNfCjeU08O69OQ09prafiBEUgp/SfPc5vi2WnOM09STyPazBT
X-Received: by 2002:a05:6e02:1a22:b0:36d:bc99:91be with SMTP id e9e14a558f8ab-36dbc99936cmr39212145ab.11.1715870105146;
        Thu, 16 May 2024 07:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870105; cv=none;
        d=google.com; s=arc-20160816;
        b=o4eXKUYuUC73xu5UDhJ61OWmrR7b9M8UL35RHmGbiWfLsO9mIxwU9otMgkEK7uxExH
         1BIpUOybga+TdOj+JIAkClV2ufSRKAlJkLK4rZYKlrLNzozXk/sxw80dFoViBaLk60uS
         XXRF9DW4yhXR8fdBvh24bVfLexq9izw+pnFO5jPRo7S+LssrGXVBSenZQmYGrs2KWvKf
         uW8d8vGI8kXX18zo7cNFuPAAcq0gU840PJNttYLyx1xSuCX0UzbhX8KNqpTqzjoKpQ0u
         JhCYEK4tbsMw+rUJGEisNLoscJovkjG8DKs1es3YN8ofaeAV1WZA61v5hj3r4hpqJUta
         y03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=L4VNndUuoqBreeFfh7DG/9KAGuaYzdfihZB7HDgQRhs=;
        fh=2NtoVY6Wf2vPP5oQTlsRzDREmKl85I4Re6RaLZo0rQI=;
        b=osxJxj1YUK9T61kXBtoKx812wBvZ9fRUMmzMVp1YN2u+pe1tXi5QhTnHNH9roB1ABA
         K5z1LWp5QTPDFWsu8cZEJ6UP/GS3axaTHwF4eZYPOUiJQRYIEyW7vT5xA2fWjjtZvdTc
         xEfNHbE/wv2Av2OkXI9ocgmx7fjkVLeXYK0Y1w26f4JysMbbzr/il+ZtyAGBiaRO7G2C
         uoHC+QQB5LOwwyD6iGZr6lOJ9jKVHURagsa8TQsuvdGfIn+UXy3/aZ42mgHW+B50Frg6
         UINO73xXqXjreOt0Fus4o7PxXf6zvAf2+1fs0iqEp8cVaW74RVLPVQVXrllP8wbgEucF
         bYew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="AJh1r//4";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id e9e14a558f8ab-36cb9dfd55fsi71924265ab.184.2024.05.16.07.35.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 07:35:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="AJh1r//4";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GBLF5Y008886;
	Thu, 16 May 2024 14:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:reply-to:references
	:mime-version:content-type:in-reply-to; s=qcppdkim1; bh=L4VNndUu
	oqBreeFfh7DG/9KAGuaYzdfihZB7HDgQRhs=; b=AJh1r//4+EwxV7KsChhze8eH
	/k/noGHZZ5QN9QCasUxTuwABiwjLwI2ymIIj3s6wnh8PVnthdgUmxyyNZfXhd7lF
	YA+pcinqmj+4yVkBpkdboi2J16lOMWsEI2fhG4VHSDi2SH2sXSmlvbe68c7UPr6D
	jAMxiwkwVYX9TTqaWtHbk5LAhAqDgkI9ciHLd5IQzcK+pA3O6nQ7z/0JQ0wRy3YM
	gQYqMq7gbXoJRi2xPRes7zkfjGygQYQCLODpAEKORIA/4+B3UhazbZNMmWExx2Ty
	fwjZV98XSJBlE636TfVb4xM0Qr5n5DqYHv6reEyLfuU2oOm6//FAXEcAAA/n9Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3x51pwys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:35:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEZ3ap013389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:35:03 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 May
 2024 07:34:59 -0700
Date: Thu, 16 May 2024 20:04:55 +0530
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_tsoni@quicinc.com>, <quic_pheragu@quicinc.com>,
        <quic_eberman@quicinc.com>, <quic_yvasi@quicinc.com>,
        <quic_cvanscha@quicinc.com>, <quic_mnalajal@quicinc.com>
Subject: Re: [RFC/PATCH v2 00/12] Gunyah hypervisor support
Message-ID: <20240516143455.GZ440762@quicinc.com>
Reply-To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <20240516143320.1739118-1-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <20240516143320.1739118-1-quic_svaddagi@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NHyienC1HMghiNA0NZnrKvwMR4zhLOCU
X-Proofpoint-ORIG-GUID: NHyienC1HMghiNA0NZnrKvwMR4zhLOCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=607
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160103
X-TUID: OIQwHR3fTs3V

* Srivatsa Vaddagiri <quic_svaddagi@quicinc.com> [2024-05-16 14:33:08]:

> Appreciate any quick comments you have. This is v2 that I intend to publish on
> qemu lists. Main changes since v1 is adding support for protected VM. 

Pls ignore this !
