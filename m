Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp895977ejs;
        Wed, 10 Jan 2024 00:34:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHr3BZh7juYwW9YQdVstzKpjKEdxC20Bpy9Ujq7+NQxO1l6Vv9UOPXLAHnDiFSl2Zw1fzSf
X-Received: by 2002:a05:6808:1489:b0:3bd:4424:6116 with SMTP id e9-20020a056808148900b003bd44246116mr815753oiw.114.1704875695098;
        Wed, 10 Jan 2024 00:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704875695; cv=none;
        d=google.com; s=arc-20160816;
        b=J2ufr64w/sETfeL5pcx0v70+DdVTwNDdRHv6Hly9ALZS7yY7sGwAtikZFWDZvT6Krf
         xn97Z74z5RxmxdAHMk00zxhfmeDyHjrAFyJEpbhxwJ1HPrZZNEJRI/+sDM8gAu2LMeoS
         0zb5p8+ikJR77ZrfXQYXLrYZJLtIU7wb4537raiML5x6sgd2af4VDmHsjSz/O3ERboxB
         79zeEhpebcEfkTFImeTVcNarzQNOQfhKOJrsZ4i3WdwFJMsCnU1NneWVhNV7oUwBp/7R
         FWVq7AvNJOgu6To7VDKSJap31LWaEwZFEUcZHtSdfKmRK0NKogTtUrSEFLl/20i9vg/7
         UoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=x4Q5M1EslYQawcbR9ZJF6R0o03IojvniYnWlgBMKIYg=;
        fh=qpLXMqMLyToizAvU3hng9NCmp0FC25loa3h0ldslYbc=;
        b=eQtIiVWRZ++tjykYl0eI+K2vcu8zSqxAzOGB6+vwh8B6dMyS0DJ7uCh5Tg94hyiD+R
         7Feq1B+HV7NtCpkwmaAezBiB00RBCGz12zO3qOpT89469CToicNELM4xbBfpPQW00tAs
         ebSTKV4LfeDxYx5C907MhpRGAa/HFKEPpNccnjNMr/kldDEi8q5r2/SWCbFkRgXhojlm
         8LgCvrkykaEqMbhw8TNPnLbNwq+sNYyc7nLCwiesIYWpo4PJj1vMHDuyBRl1nrNstblM
         1qhJNoi4iVX+gTGHTnCBNafkJh/N6Qmo+zwiW14qFDpa8w9hQl6UtcwxgTbQ87KpY/+v
         C9mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=k0npDKJq;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id k14-20020a0568080e8e00b003bc33454298si1225165oil.43.2024.01.10.00.34.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jan 2024 00:34:55 -0800 (PST)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=k0npDKJq;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40A4kI0g027976;
	Wed, 10 Jan 2024 08:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:reply-to:references
	:mime-version:content-type:in-reply-to; s=qcppdkim1; bh=x4Q5M1Es
	lYQawcbR9ZJF6R0o03IojvniYnWlgBMKIYg=; b=k0npDKJqYKMOnzSbCFdsGUNz
	iHiGi6W5HAU5H5mx4ga9WJJBVEUKoFwumJlr1DpmmgqTYmKeGXVejDR9Trzii8J8
	fG/aOYasaH2vZJIo0tKfUFzyfr5NYaskKvxajc6sKmJiR0NbO2oH3fdaHIlBrELZ
	4Kx9t8FnaiQ/+Dqs6pEMklIgKEN00fREI/roP2NW3uH9BvpEbwHn4czwRqXS+7nF
	6JqU2YJQy0zU4A6EHOFABQhzcS8NWUVFKbLWm9QGgsqA52NEoJOjc2hjAjiGgh/3
	adjpTwcmeSaRl7ShJ0V7KC5hWHXAbpBCQyeWIQtL2J7IUTL6LxG+7cbXgmJhdQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vh9vfhrwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 08:34:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40A8YrBI008226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 08:34:53 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 10 Jan
 2024 00:34:49 -0800
Date: Wed, 10 Jan 2024 14:04:45 +0530
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: Philippe Mathieu-Daud? <philmd@linaro.org>
CC: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <quic_tsoni@quicinc.com>, <quic_pheragu@quicinc.com>,
        <quic_eberman@quicinc.com>, <quic_yvasi@quicinc.com>,
        <quic_cvanscha@quicinc.com>, <quic_mnalajal@quicinc.com>
Subject: Re: [RFC/PATCH v1 07/11] gunyah: Specify device-tree location
Message-ID: <20240110083445.GB1649721@quicinc.com>
Reply-To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
 <20240109090039.1636383-8-quic_svaddagi@quicinc.com>
 <48ca6b12-6838-4788-8484-90621b46d65f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <48ca6b12-6838-4788-8484-90621b46d65f@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BC_3vtFScMdTCcDAoyW488GiV_Bdqi4W
X-Proofpoint-ORIG-GUID: BC_3vtFScMdTCcDAoyW488GiV_Bdqi4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=854 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401100069
X-TUID: T0yyLzVNth0x

* Philippe Mathieu-Daud? <philmd@linaro.org> [2024-01-09 14:31:03]:

> Hi Srivatsa,
> 
> On 9/1/24 10:00, Srivatsa Vaddagiri wrote:
> > Specify the location of device-tree and its size, as Gunyah requires the
> > device-tree to be parsed before VM can begin its execution.
> > 
> > Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
> > ---
> >   MAINTAINERS               |  1 +
> >   accel/stubs/gunyah-stub.c |  5 +++++
> >   hw/arm/virt.c             |  6 ++++++
> >   include/sysemu/gunyah.h   |  2 ++
> >   target/arm/gunyah.c       | 45 +++++++++++++++++++++++++++++++++++++++
> >   target/arm/meson.build    |  3 +++
> >   6 files changed, 62 insertions(+)
> >   create mode 100644 target/arm/gunyah.c
> 
> (Please enable scripts/git.orderfile)

Sure will do so from the next version!

> 
> > diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
> > index 4f26938521..a73d17bfb9 100644
> > --- a/include/sysemu/gunyah.h
> > +++ b/include/sysemu/gunyah.h
> > @@ -27,4 +27,6 @@ typedef struct GUNYAHState GUNYAHState;
> >   DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
> >                            TYPE_GUNYAH_ACCEL)
> > +int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
> I'm getting:
> 
> In file included from hw/intc/arm_gicv3_common.c:35:
> include/sysemu/gunyah.h:30:24: error: unknown type name '__u64'
> int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
>                        ^
> include/sysemu/gunyah.h:30:41: error: unknown type name '__u64'
> int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
>                                         ^
> 2 errors generated.

Hmm I don't get that error when compiling on Linux. I think uint64_t will work
better for all platforms where Qemu can get compiled?

- vatsa
