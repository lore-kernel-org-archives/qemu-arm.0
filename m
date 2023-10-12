Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp767923ejc;
        Thu, 12 Oct 2023 05:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWmiTuiKTQXtlN39MFxHfjj5Soa+wcvIFZoBehErop7Og1IhAEkIpAK01HFRjYoMAnB8cX
X-Received: by 2002:a25:a2cc:0:b0:d9a:560a:fbaa with SMTP id c12-20020a25a2cc000000b00d9a560afbaamr6878640ybn.0.1697113587364;
        Thu, 12 Oct 2023 05:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697113587; cv=none;
        d=google.com; s=arc-20160816;
        b=dnBpFrnwkxy+Lmc/ixlV5puwssiSyioFP/AP27wghCszXZgHAGQodNh6iY7QrmO1BM
         SbxOCppOrsb4qwdP+z3usfhDwNveIqrEHrYycOkPf95kJuTwq1x1ZHaESAtEb+VeBuoe
         ngM6vOJErXzh2HY40Ko5M4j4IbZR+3s8JCAPEywlRL5fOHO8ZHrR3IrFNJTfP94JrSdo
         F+6ZnIBFnnqg/u9W4E02wIVWNcFg8mQgu0JJp7yBNlQABZTZHeFXcBb8WhpC3UkT2buJ
         d69vXdgJA4+NgDexHPSE4aSMikm9MRlG8WhbLEGtT8sOwz9DGsscbIii45zeJnjZk4FJ
         gdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=KF9haHZbYVAj5Ap7V7NXFGuiT7+S1RR3Ap7q5Uo0FRQ=;
        fh=qpLXMqMLyToizAvU3hng9NCmp0FC25loa3h0ldslYbc=;
        b=mVV5RVZvCK28xlqvx+EM/+jgVaZB3d8MaV5EFKQMEZ7gKNBCN0KXy6j2ZTUcI8ziGv
         luXuWZ2fPCXRE1m2yscDNyAX2vIQSBKy9059nLG3BxFDBKa0yBY4rFkAHEi07umAVrsj
         68os17gF/wE5cHvTPT9AIr0i0iSH2nce1k2nOs0PS8CGEnSQY4NJVq1WZfyZPq+2wuZn
         owZre7WTm+j2siKYki1tQ6DqIeW5jrXR5WL+7meUtkVs6Umz5f/BonV17dec2z1EA5fP
         z67XDf5v8oQsfwU0UuPUgFkEEPl8uHs44O6BGnhnpBErlyUcGsxKWpjjGOfTvXjX4NTr
         IymA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="VGFvt4/S";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id e76-20020a25694f000000b00d80261da1fasi629823ybc.292.2023.10.12.05.26.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="VGFvt4/S";
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CBOkQS012128;
	Thu, 12 Oct 2023 12:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : reply-to : references : mime-version :
 content-type : in-reply-to; s=qcppdkim1;
 bh=KF9haHZbYVAj5Ap7V7NXFGuiT7+S1RR3Ap7q5Uo0FRQ=;
 b=VGFvt4/SmJSMfAnf7hMraorCa43h7N8POaw8qUA9v3xVR9vXRrDYl00R4ZkD5yL5/Cvw
 Ia4JzkbHnu+LtZPr3GKoqfRfTjCYaQHUsb7PctynL51Z3ZKmAZWahiOOElj1Huzg6j9a
 O/Y9DLSuf+NOeO6/o3BJFu4TWqubrs2FehMQIRxx/oEA7lVApcMfT10yEvTjcwjXev9q
 6C/uuVZs3xKDhqwEeMQTx9kspLTEhTtj64s3RAEoWi1XZ0rJaueiQK61m8YwxY4WKfMd
 W+y7Iho4vzIQ6zKHfamvUwn+jkaoy/Tg63xTOFhk6iIdesgd8DhRcTyw42a48A91ZdE7 tw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tpd480cx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:26:26 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39CCQ82U004522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 12:26:08 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 12 Oct
 2023 05:26:04 -0700
Date: Thu, 12 Oct 2023 17:55:59 +0530
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: Philippe Mathieu-Daud? <philmd@linaro.org>
CC: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <quic_tsoni@quicinc.com>, <quic_pheragu@quicinc.com>,
        <quic_eberman@quicinc.com>, <quic_yvasi@quicinc.com>,
        <quic_cvanscha@quicinc.com>, <quic_mnalajal@quicinc.com>
Subject: Re: [RFC/PATCH v0 10/12] gunyah: CPU execution loop
Message-ID: <20231012122559.GE1130358@quicinc.com>
Reply-To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-11-quic_svaddagi@quicinc.com>
 <d2287b37-cd40-10ec-e20f-135a9d27e3fe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <d2287b37-cd40-10ec-e20f-135a9d27e3fe@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uDD8Hf-I_jsur0knUDvnyGEjzNiop7zr
X-Proofpoint-ORIG-GUID: uDD8Hf-I_jsur0knUDvnyGEjzNiop7zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 mlxlogscore=765 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310120102
X-TUID: OjElOda+c1VH

* Philippe Mathieu-Daud? <philmd@linaro.org> [2023-10-12 06:43:38]:

> > -void *gunyah_cpu_thread_fn(void *arg)
> > -{
> > -    CPUState *cpu = arg;
> > -
> > -    do {
> > -        /* Do nothing */
> > -    } while (!cpu->unplug || cpu_can_run(cpu));
> > -
> > -    return NULL;
> > -}
> 
> This diff could be nicer if you define gunyah_cpu_thread_fn()
> in the final place in previous patches, so you don't need to
> move it here.

Sure.

> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index fdcbe87352..b3901e134d 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -240,6 +240,7 @@ typedef struct SavedIOTLB {
> >   struct KVMState;
> >   struct kvm_run;
> > +struct gh_vcpu_run;
> >   /* work queue */
> > @@ -443,6 +444,11 @@ struct CPUState {
> >       /* track IOMMUs whose translations we've cached in the TCG TLB */
> >       GArray *iommu_notifiers;
> > +
> > +    struct {
> > +        int fd;
> > +        struct gh_vcpu_run *run;
> > +    } gunyah;
> 
> NACK. Please declare as struct AccelCPUState in gunyah_int.h.

Ok thanks for that input. Will address it next version.

- vatsa
