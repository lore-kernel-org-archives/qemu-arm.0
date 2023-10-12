Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp766754ejc;
        Thu, 12 Oct 2023 05:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQmnVkROHMEy0w6kqNtpWXi4KHzv1oDgFsE1x8QWZcCYgSab7F4I3LTgh0Y3VPqTBrblrb
X-Received: by 2002:a17:902:db10:b0:1bd:f7d7:3bcd with SMTP id m16-20020a170902db1000b001bdf7d73bcdmr23374487plx.50.1697113459884;
        Thu, 12 Oct 2023 05:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697113459; cv=none;
        d=google.com; s=arc-20160816;
        b=MHeWuFWlcGnXggavqzwJKKJOVV5jJiPGRzwOxUy4gbZvced9PNGclYomv/PDlc++v/
         YW0BEoK81HFm+UUHM9Vg/kiEdSNwl1vLUL9OCHO4rY+/Wi0EpRKcoeHrI57RKwftZYrU
         Z6RT9WavNCApQ+pZQvmknbh5viB6872A6vOIhPkDKS1yNVpN/zxxXIfs7Aa2K9wjySut
         dOIYHnZZ2LcErL9TQ6G8ciC2n/qHpdPi9hFWvB/8KGs3YL61g9xQ78TbCpBY1u1TAMHk
         PFpYIAoZGmkXj66kXUuosHuzHvy3WSqJntW0X2uFpCwwEjx4OFMobpEs8WV+Dcab/YsP
         fw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=T1zZW0XYNhBeAxpakTuWCDw1AaGerAKqBy6mtnFsKAs=;
        fh=4UO3v5AcKeAjz8WHQ79FAt22rPrPiwDoDdsQWjVxXdM=;
        b=PO/qGYXdYYGtRrzUlaXm4CIwWp/wQstQJlaVisYynMiGda5h+NpoiAHdqkxmlOA9Yv
         ZmrX4yEY5aH4GCVRTTOGn9skw5IlvSoGF2OPQf+C0Ix616tvF+o6HKpIu9wSBNm9Arug
         wu0qP1XFFX1exayv1/MD9dOOx164iCsfh6l4ZX49Wv4DE6bPI77kJ+f2oB4kYwwbE3T8
         VB0wOg7/NiWyIZBjjvYIBySvPa+VRJqts50VN5elH76VC0if1qyZmuU4aecHfKazhAzt
         q2NuLyg4gclukKa7iit0KX7BACrvAWNWdXHr5wrbgMTlozLW247MRxlIsTSYwd/0VDo1
         uPiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=DnqFOj8i;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id g1-20020a170902868100b001bdd0d0530dsi1967306plo.129.2023.10.12.05.24.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=DnqFOj8i;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CC5asQ023011;
	Thu, 12 Oct 2023 12:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : reply-to : references : mime-version :
 content-type : in-reply-to; s=qcppdkim1;
 bh=T1zZW0XYNhBeAxpakTuWCDw1AaGerAKqBy6mtnFsKAs=;
 b=DnqFOj8i2MeiNjXwU8sHDwjM9YUc9bskgYT0Jo4XuQ58FB0mbNQWR8zEhERexkdCSbm+
 38fkcaCZOLRyhWLiQ1PfGB5T9FYPQGRDF22/RrxHdtRRbqjr+v/YNB1vmheSeWbzZNfY
 JGfBkFNUKBg/WNKfEMdM4b9GIsefSSv+1OIt3P6aiXXQvlmmGLgC9QSOzAzY05AO1DkI
 hIA7TLWKsykiynO5Sx7NP7bhNOWa6bfUylwkbjDpZk6aoFqXWGb7LiKlK0fEnENTbirp
 DI1Y9f1ErLfV3JmtHFvlM74TvRvxJ1TrZq9KPcSi0Qcf/RZTh3t3BJAJ5o5ikklaxiXW yQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tpe4u8ab0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:24:16 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39CCO99u001227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:24:09 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 12 Oct
 2023 05:24:04 -0700
Date: Thu, 12 Oct 2023 17:54:00 +0530
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: Philippe Mathieu-Daud? <philmd@linaro.org>
CC: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        Markus Armbruster
	<armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
        <quic_tsoni@quicinc.com>, <quic_pheragu@quicinc.com>,
        <quic_eberman@quicinc.com>, <quic_yvasi@quicinc.com>,
        <quic_cvanscha@quicinc.com>, <quic_mnalajal@quicinc.com>
Subject: Re: [RFC/PATCH v0 01/12] hw/arm/virt: Avoid NULL pointer de-reference
Message-ID: <20231012122400.GC1130358@quicinc.com>
Reply-To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-2-quic_svaddagi@quicinc.com>
 <b98e4566-56b4-d0e4-adb2-c163c7c26cfb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <b98e4566-56b4-d0e4-adb2-c163c7c26cfb@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1ycNBDftLwvoECKe9FQQHKmGbIGVk862
X-Proofpoint-GUID: 1ycNBDftLwvoECKe9FQQHKmGbIGVk862
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=461 phishscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120102
X-TUID: sT7xCV2A6awN

* Philippe Mathieu-Daud? <philmd@linaro.org> [2023-10-12 06:30:24]:

> Hi Srivatsa,
> 
> (+Markus/Peter for QOM fu)
> 
> On 11/10/23 18:52, Srivatsa Vaddagiri wrote:
> > Avoid dereferencing a NULL pointer that its_class_name() could return.
> 
> While your patch is correct, there is some code smell
> around its_class_name(). IMHO a foo_class_name() handler
> should never return NULL.

I saw its_class_name() returning NULL for KVM in some case and took the
same route for Gunyah (as ITS is not supported atm):

const char *its_class_name(void)
{
    if (kvm_irqchip_in_kernel()) {
        /* KVM implementation requires this capability */
        return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
    } else if (gunyah_enabled()) { 
        /* ITS is not yet supported */
        return NULL; 
}

I guess I could have its_class_name() return "arm-gicv3-its" (for Gunyah case)
and set vms->tcg_its to false, which will avoid the NULL-pointer deref I was
hitting.

I will drop this patch in next version in that case.

- vatsa
