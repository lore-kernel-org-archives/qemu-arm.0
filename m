Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp896724ejs;
        Wed, 10 Jan 2024 00:36:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE16RMIVtU/uMxYUebE5ZSq+k56x5fQpKDgjj1qkurh42JDTHiIfD5Cmyg+WU1+H6xZsw+0
X-Received: by 2002:a05:6870:c69d:b0:203:f580:bd91 with SMTP id cv29-20020a056870c69d00b00203f580bd91mr355088oab.42.1704875786579;
        Wed, 10 Jan 2024 00:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704875786; cv=none;
        d=google.com; s=arc-20160816;
        b=gJA+uAaJhGazUwr/0aEBF8ioCNmMDh/8RLSdKoUeROWuQckaj+QxZ1bmsDJJonzmj5
         uEoss9sS8mvbWNPUYhgSycYlndyLbxzw3480wIEFOuKeDnsTnAeB0ecHHjS3Lcfystcg
         SnydVD2VvlepO1Q7gBprHs9QMXHp+LcjEvoQs9hQOWaeMHxuZM5a8tCUSKpvz0pufBNA
         bVpdJqgkpKZkTUQS2CS6biuAbApHenIzJdB+S3owbZyeD0uREnZ6mlxW/kPS3pSFE11u
         GR8zJe4iT4ZLqSe4Twm7Zoi8Yu6V1lDw1qxs5XbIxqPcEKjrH88lhwGVYECR4RuDsHJM
         DmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=nRnNf/PEhcJUBKeQqhLQSXGvZOD4hqs+EOvQ8YGFVaQ=;
        fh=qpLXMqMLyToizAvU3hng9NCmp0FC25loa3h0ldslYbc=;
        b=0MIkwM8hDyswVvqvZDocGyZTaiJlUikOMpGtnqZRgfeY0Qj+Jl0THGPjjExEBKrfA+
         wy/SQ9gtsyua8aT+7IVbjn3j1WJdMHBNy5GbZD7nXPZcusIdkG60jLtxgM26433WcVrW
         jc5KmAXaB1uPRofrnj2CN89fnosSK5ojVqJAPlCwzcL0ZABYuMxBUMp59R4DtzEvEoQM
         SEGVTFL5vvt77QayPoSu2KxUlXSQ8RrfKauDNfPcEYpekT+WK4mZX9W0m0SLYmo3qNzj
         hqbFFP21gAX4+tU7RK7DZKQ+p5Acu9TbZfjngU4pjCSjTbqXcEqQLzGC/ST8Kn6YycKJ
         IYtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=RBGQZiUi;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id pu15-20020a0568709e8f00b00205dc28dbf6si1323630oab.8.2024.01.10.00.36.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jan 2024 00:36:26 -0800 (PST)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=RBGQZiUi;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40A6U9rr023752;
	Wed, 10 Jan 2024 08:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:reply-to:references
	:mime-version:content-type:in-reply-to; s=qcppdkim1; bh=nRnNf/PE
	hcJUBKeQqhLQSXGvZOD4hqs+EOvQ8YGFVaQ=; b=RBGQZiUiFpigM2gUodYiV62U
	wBoJebXTlZeOILnnAgcOYLgaGL3hyIyjxOmwTL0RyIC3BWcCTrfsRxit7dCbbzTV
	SZNpcb4bTSuUb9qS1E1f12oyXm4CRC2XQ+eP15lhXp/UbwPw2G+rAHAGyEknt2of
	ri529elMuzlT2uVhh9gBEiL04pRKDb0pnXVD71wmIJE9tl66+jz3wSvMDQHDgktO
	TpcMn4ZwO1hVTKiDj5i+mBbG0NnfPlUT7K7pAFjyzV+UEL4WIv2X5ZBSQQeD9MX2
	xfjg68bKK0/ANS/AlQHZCsibfNV1Rc0T/ZiqJ7NMcVqTLZZ+XxIFgNThVUVCkQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhjh2rmnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 08:36:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40A8aOEB024296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 08:36:24 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 10 Jan
 2024 00:36:20 -0800
Date: Wed, 10 Jan 2024 14:06:16 +0530
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: Philippe Mathieu-Daud? <philmd@linaro.org>
CC: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <quic_tsoni@quicinc.com>, <quic_pheragu@quicinc.com>,
        <quic_eberman@quicinc.com>, <quic_yvasi@quicinc.com>,
        <quic_cvanscha@quicinc.com>, <quic_mnalajal@quicinc.com>
Subject: Re: [RFC/PATCH v1 07/11] gunyah: Specify device-tree location
Message-ID: <20240110083616.GC1649721@quicinc.com>
Reply-To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
 <20240109090039.1636383-8-quic_svaddagi@quicinc.com>
 <282dc91e-0f56-4a74-9110-ea4824e6d61d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <282dc91e-0f56-4a74-9110-ea4824e6d61d@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KCj817lzD3af04Lj1YCtw97NpSDialCH
X-Proofpoint-GUID: KCj817lzD3af04Lj1YCtw97NpSDialCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=733 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401100069
X-TUID: CyBOEJRxEGHJ

* Philippe Mathieu-Daud? <philmd@linaro.org> [2024-01-09 14:36:12]:

> > +#include "qemu/osdep.h"
> > +#include "qemu/error-report.h"
> > +#include "sysemu/gunyah.h"
> > +#include "sysemu/gunyah_int.h"
> > +#include "linux-headers/linux/gunyah.h"
> I'm getting on macOS:
> 
> In file included from ../../target/arm/gunyah.c:13:
> linux-headers/linux/gunyah.h:13:10: fatal error: 'linux/types.h' file not
> found
> #include <linux/types.h>
>          ^~~~~~~~~~~~~~~
> 1 error generated.
> 
> Maybe we need the following change?
> 
> -- >8 --
> diff --git a/meson.build b/meson.build
> index 6ded60063e..fb20ca04d1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -712,5 +712,5 @@ endif
> 
>  gunyah = not_found
> -if get_option('gunyah').allowed()
> +if get_option('gunyah').allowed() and host_os == 'linux'
>      accelerators += 'CONFIG_GUNYAH'
>  endif

Ok sure will include that change in my next version.

- vatsa
