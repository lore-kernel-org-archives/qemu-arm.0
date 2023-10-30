Received: by 2002:a17:906:7e1a:b0:9d0:bf65:29fa with SMTP id e26csp196685ejr;
        Mon, 30 Oct 2023 16:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEynMBiPGvaVj1JlHG0cWlL7N5AX7soNSGVxAevY0xdOfXg7LKiSSf0/SpmbikTWvvDlfZ
X-Received: by 2002:a05:620a:1709:b0:76d:a27c:245 with SMTP id az9-20020a05620a170900b0076da27c0245mr1957066qkb.7.1698708342813;
        Mon, 30 Oct 2023 16:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698708342; cv=none;
        d=google.com; s=arc-20160816;
        b=ugNgNf5bmQUCC9elWwwkspM4xlqNKqR8Ec1rctf18L72AagOWUbBCsxAJe+iDrYl7N
         x/sbMayCyViHTMhF9KRYcV5r/vh4ew9+0J6BV53B+ZWtbgCnWpp0ro76u95h8zM4cKu2
         QfVylYROryhaBOYh7HLyaIbydzANgY5QZiAbEXxuwYmuzbuUmDPDPJguaF8u+2T7wM32
         kfaqQxjVH21D2y5lXJjmUoEdHJ0Wj84q7ukYvNys4XYW2kR0dQnEBxq8G+AxGxsqmy9z
         WHa+7K9V4kK35uFJrGeZxyr67Xf4TaBOzYaDplzNKWnYJojAQ4w2vSBWVPUzRNuQf8ip
         R1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CIBJ+S5shVLAEyHF779OtwGWhv61bvubRvVKUlB0yCI=;
        fh=Dx0ZyA40kuWoEJE40wOSEDnBckXcFO3oHoVY1fhWBVI=;
        b=i7EY05NSNWYWJKFcY9k/GAApUcr5U/Q5Gx4QTXtIYkiZ/AKGbGynrq8QHXnMchr0dh
         plQcCYIUSeZkaH0NPyDN6l7JGhuBa4vbUfUSw+nhVH90vL8+ubrFCEpz0IiK/SlijA3L
         kywS4MxSyQwm3ZG8xjhAmCULuAAkxIbYOKZkmp3yty6qRZ0kRREIOEl+PJ77XTM5uW8H
         ZPC635uVFWAq6NVcFElu6b9oqsDdE+U8wgjgXTlHFMwDUNZzEGcP82pEk03esjVirL5K
         PlXAuo8zlgSnJWYzk1ZsUMuaqp2kPwI0RvkS2u+JV3vH/dLL3PCYUDGFEES9FP3Ik1bk
         H5aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="X/qiEL6t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020ae9f00f000000b0076c81b9cd8csi19005qkg.739.2023.10.30.16.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 16:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="X/qiEL6t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxbdF-0001tL-GJ; Mon, 30 Oct 2023 19:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qxbdD-0001sl-Av; Mon, 30 Oct 2023 19:25:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qxbd9-0004jp-SE; Mon, 30 Oct 2023 19:25:15 -0400
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UN3b98003825; Mon, 30 Oct 2023 23:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CIBJ+S5shVLAEyHF779OtwGWhv61bvubRvVKUlB0yCI=;
 b=X/qiEL6txAuPRGrodMa6o1xqpBuNq5L6idxSuIJAfKXNaFOzKvSmS+nf+zDta5nl+zr9
 ImY+LxsESwFNTCajWOduD/CVnpBVUHoU0oFZ1ojVDkVOle7m/LEzQmQxk/2mBQjFdzYz
 Eoq2BxTSlTDxZQxQ/rlPpxfsQnQfeEXqaxBUR8yOvDwQ+eCC40a1yzS7KrWyLwEpqEZc
 h0WsCKEHqQEPafpdEyJHtrFKSLkMaegpmCsJYFOWUPWNS8wrzKjbJ0Ng/P9WoOrZ0rkR
 fU/KaHo1LrvuSo8zMMGGC4ZWH22aS8s3KC39Ynv9Caw80Mdx4Kzlt7B/g69JAhREjfjf sA== 
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u2nj68pfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 23:25:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UL5MVb011389; Mon, 30 Oct 2023 23:25:07 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u1eujv2qh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 23:25:07 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39UNP7wP48955752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Oct 2023 23:25:07 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E858D5805D;
 Mon, 30 Oct 2023 23:25:06 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8376E5805A;
 Mon, 30 Oct 2023 23:25:06 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 30 Oct 2023 23:25:06 +0000 (GMT)
Message-ID: <c5776063-0a9e-44ed-ab94-d04121326779@linux.ibm.com>
Date: Mon, 30 Oct 2023 19:25:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] hw/arm/virt: connect TPM to platform bus
Content-Language: en-US
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Virt" <qemu-arm@nongnu.org>
References: <20231029060404.71196-1-j@getutm.app>
 <20231029060404.71196-8-j@getutm.app>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20231029060404.71196-8-j@getutm.app>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SVqRhXrzZIew42FqPwHZCRGKWXtRiaMO
X-Proofpoint-ORIG-GUID: SVqRhXrzZIew42FqPwHZCRGKWXtRiaMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300183
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: GvB7bBgXeiQE


On 10/29/23 02:03, Joelle van Dyne wrote:
> Signed-off-by: Joelle van Dyne <j@getutm.app>


Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> ---
>   hw/arm/virt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 529f1c089c..f1a161b0ea 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2806,6 +2806,13 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>           vms->virtio_iommu_bdf = pci_get_bdf(pdev);
>           create_virtio_iommu_dt_bindings(vms);
>       }
> +
> +#ifdef CONFIG_TPM
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_TPM_IF)) {
> +        tpm_sysbus_plug(TPM_IF(dev), OBJECT(vms->platform_bus_dev),
> +                        vms->memmap[VIRT_PLATFORM_BUS].base);
> +    }
> +#endif
>   }
>
>   static void virt_dimm_unplug_request(HotplugHandler *hotplug_dev,
