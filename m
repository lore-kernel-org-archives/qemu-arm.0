Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp736339ejb;
        Tue, 18 Jun 2024 04:11:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSYfInb2eAFVs3gS1LtbkIDpq2RSbk/i+u2jlQkW7vm/PqXTRCjKauQQs/JX2GSKuA1iRFqUqQhYLNfynCLyRQ2Zclp676
X-Google-Smtp-Source: AGHT+IEq6pQ4AOxo6sj4smK2JL5DM6fmQg1N5JFRxnUn3iVyaiX863ZiCLLZTs/pAVCFV7b353H4
X-Received: by 2002:a05:6122:913:b0:4ed:53b:9da7 with SMTP id 71dfb90a1353d-4ee3f36a141mr11700772e0c.9.1718709061538;
        Tue, 18 Jun 2024 04:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718709061; cv=none;
        d=google.com; s=arc-20160816;
        b=dK5HcjkzS/ErN4sJ7Je7LeQkPcbAFnDKM6sVk1iyTcs6NUVfc5AvoC78sUM1/oON/I
         Qng/kZkeOvZVlvWFq5K0CjA2/FawcX3KDocM95ckX8WVy0ZYZT8vTjtAnJZxeOkKDh/b
         UTo1Biee6iw6w+X/udG8fnSu3t/PscR2WhIN49Bg0fqkiiY+9Rsd8l9EYHinjzcbERZ3
         sqZPqcsg4FRiHbDmweYXrzI7ZVvqzGxYADezXGSDQBzXGiW8r+31gCBykBtbrtjBhK/8
         zem4U5u8z8OahHZB9KHJv2q9wcS0gb7p7rzW90eR+Rvxy0dje8db2clsmGDipd6zWmbw
         FZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=36VNmTBYbYSpscGByUwpUqBFLQBKIZzuAeq7wwrd8nM=;
        fh=d0cxzE/D8D25LtjC734kASD+X58FslfQ8H/fGnuvKsc=;
        b=Ccag+6Os5AoSub2EuFa0RUc7fNU0b+KHCajROuvSniGn+VMV8449wsx2rOq2MZ0hSe
         xV2uVrO3Q2fkJjZ+e+4sY+r1xiHSUUGPnkWIwCmlKsc8+v/5FHFDp8+jo0WzAeYmJSru
         8Uca4aUdyT+EPNiZKuw1CnkFS2XTLmq+jYGbG6/nDZcnFPSYho0eHe4F0y4eRXzNmbzP
         DJQyr5fd7SlZNTxxuEQfYTks6kBfz0b1ujxkhpniRGaTZEy0kOXCO/8KD3/tTdaK/X+F
         9ujn7x234ZenxAw9j4X80lrAk04hl0TyWH2GGCa8zt2hxQQwjaDItm8/kZwcHDmfCdqR
         JHcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=j0xJB7EG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ab8ff9aesi1182670585a.381.2024.06.18.04.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 04:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=j0xJB7EG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJWjj-0004J7-TO; Tue, 18 Jun 2024 07:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1sJWji-0004It-JF; Tue, 18 Jun 2024 07:10:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1sJWjg-0004eg-LE; Tue, 18 Jun 2024 07:10:50 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I8XPkb009648;
 Tue, 18 Jun 2024 11:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 36VNmTBYbYSpscGByUwpUqBFLQBKIZzuAeq7wwrd8nM=; b=j0xJB7EG82gJ+Lfn
 imTl2JDfMDwFODuYmMjt74iao6ueewsttj9Eg8C+9eSrzZ3F4aQ+C4x5vW5qzu3y
 nyTxuj2pPFLLghqlGGy0kMA1gaw/KAskScsOzVvsOhFnC6whGv2p2SpeVwXH53DE
 KL4I5oHwJsD/UVaKgcQX/tHEibwwJ0XfwEZYzF89VUXzcrdtytueuria4hDjsyCA
 ALEgWCasrC0C4yr6CEecEqCWckj/HKEIeuGc7EAhs3BGHberG5WM5r19CK+Th4Us
 8FRoxJ16aLzNwFuGvjwdno0fWBF6S7w/4c1nXxrnELUKTHaFhMRH4QGC7Dn0dEf4
 yW55DQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytuav9su8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 11:10:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45IBAgkU031790
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 11:10:42 GMT
Received: from [10.111.137.217] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 04:10:40 -0700
Message-ID: <e22d46d3-9a83-41bb-ad69-fec3a135880c@quicinc.com>
Date: Tue, 18 Jun 2024 12:10:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa
 machine
To: Xiong Yining <xiongyining1480@phytium.com.cn>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
CC: <rad@semihalf.com>, <peter.maydell@linaro.org>,
 <marcin.juszkiewicz@linaro.org>
References: <20240607103825.1295328-1-xiongyining1480@phytium.com.cn>
 <20240607103825.1295328-2-xiongyining1480@phytium.com.cn>
Content-Language: en-GB
From: Leif Lindholm <quic_llindhol@quicinc.com>
In-Reply-To: <20240607103825.1295328-2-xiongyining1480@phytium.com.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 11aIyDuZNUJn5F9IdFVCufJFo5yoog1t
X-Proofpoint-ORIG-GUID: 11aIyDuZNUJn5F9IdFVCufJFo5yoog1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1011
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180083
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: QOkwq3qxAEsR

On 2024-06-07 11:38, Xiong Yining wrote:
> Enable CPU cluster support on SbsaQemu platform, so that users can
> specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And
> this topology can be passed to the firmware through /cpus/topology
> Device Tree.
> 
> Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
> tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

Thanks!

> 
> ---
>   docs/system/arm/sbsa.rst |  4 ++++
>   hw/arm/sbsa-ref.c        | 11 ++++++++++-
>   2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
> index 2bf22a1d0b..2bf3fc8d59 100644
> --- a/docs/system/arm/sbsa.rst
> +++ b/docs/system/arm/sbsa.rst
> @@ -62,6 +62,7 @@ The devicetree reports:
>      - platform version
>      - GIC addresses
>      - NUMA node id for CPUs and memory
> +   - CPU topology information
>   
>   Platform version
>   ''''''''''''''''
> @@ -88,3 +89,6 @@ Platform version changes:
>   
>   0.3
>     The USB controller is an XHCI device, not EHCI.
> +
> +0.4
> +  CPU topology information is present in devicetree.
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index e884692f07..9987850fc4 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -223,7 +223,7 @@ static void create_fdt(SBSAMachineState *sms)
>        *                        fw compatibility.
>        */
>       qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
> -    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 3);
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 4);
>   
>       if (ms->numa_state->have_numa_distance) {
>           int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
> @@ -280,6 +280,14 @@ static void create_fdt(SBSAMachineState *sms)
>           g_free(nodename);
>       }
>   
> +    /* Add CPU topology description through fdt node topology. */
> +    qemu_fdt_add_subnode(sms->fdt, "/cpus/topology");
> +
> +    qemu_fdt_setprop_cell(sms->fdt, "/cpus/topology", "sockets", ms->smp.sockets);
> +    qemu_fdt_setprop_cell(sms->fdt, "/cpus/topology", "clusters", ms->smp.clusters);
> +    qemu_fdt_setprop_cell(sms->fdt, "/cpus/topology", "cores", ms->smp.cores);
> +    qemu_fdt_setprop_cell(sms->fdt, "/cpus/topology", "threads", ms->smp.threads);
> +
>       sbsa_fdt_add_gic_node(sms);
>   }
>   
> @@ -902,6 +910,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>       mc->default_ram_size = 1 * GiB;
>       mc->default_ram_id = "sbsa-ref.ram";
>       mc->default_cpus = 4;
> +    mc->smp_props.clusters_supported = true;
>       mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
>       mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
>       mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;

