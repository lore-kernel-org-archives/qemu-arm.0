Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp995708ejq;
        Wed, 17 May 2023 03:56:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kIpQZNu2P4nUbGJr9M8+bA/C21m4ryHXyYTnE+N7nuNzZRAYuRvG5kcR7gAs2Jl/6H9Kg
X-Received: by 2002:a05:622a:1209:b0:3ef:2649:44ae with SMTP id y9-20020a05622a120900b003ef264944aemr65091788qtx.13.1684320980164;
        Wed, 17 May 2023 03:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684320980; cv=none;
        d=google.com; s=arc-20160816;
        b=ESHKmklRj86m3M48Vl7DrhV9z3dLDrERvKJ5rGYZmQ7AQC4FBe9kK9ckLR95KlL48J
         jUaM2Ju+8vINGR9GlysS4NGqmNvlPBOQnchalka2D63BL2sWLm9cEW42Pl6YhiB/V1R3
         EWy6EWJsGXmVXtm2r5SpnShPZkyRzShHvSg3jqW/kAxEbAk2e9Jl7DFLwh5GDzaLp93D
         hvYknIMaq/XUrjRWSyEi4+ByRywSso/W1GlyCYIGZtvEYbu7LceInyr2z6mLD2WaXRrJ
         xCqV2ChYaLPolvVuPy4hl4eyQAD/yGBJ2IF/dgjrU7AZ5KTdLI3etfYZ1OQZNQklOi68
         TfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=AFO73yZeugiRL6sBquO2dtFOhFEiXd2g8TI4r96Dxa4=;
        b=BVvyXqJ/SMKie3Tqw1f/QKsfUZ1tajw3XOE+i+CznlsmiYAk0IjobD1emAd5oZFXbp
         2oN3rQDOPOaP+crBTgZnMQ8cJrZzsBHg2mUJ3u1BG4pWxVJfNpbrXFzgRH+5W4LLPhMg
         IOhBpsTg473HB3ASSETppiJHvIj710jU98riNS9hWQk5brxRxfamfra06zfGHtKsrzbS
         dr2kC6B/MxfYsMbBngiRXTI4EARyY3TMiGQNdAQDrtF727sznnOZ77iG9vGvCNXZE4g8
         JTmxnwRbfHpIO/+9triKwfaGEJFC/dV0yo07szhkOB7KCj+Qu6vAD44IJoZb04OkWvlK
         QrSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=m0e772ZE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17-20020a05622a031100b003daa657db60si12200561qtw.476.2023.05.17.03.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 May 2023 03:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=m0e772ZE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pzEp4-00030v-QV; Wed, 17 May 2023 06:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1pzEp4-0002zl-2x; Wed, 17 May 2023 06:55:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1pzEox-00030X-Tt; Wed, 17 May 2023 06:55:57 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34H95RBp014845; Wed, 17 May 2023 10:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AFO73yZeugiRL6sBquO2dtFOhFEiXd2g8TI4r96Dxa4=;
 b=m0e772ZEexkYM48JvthLwLGAGAJL+FlgWtJPSYVTHXgWxOcpNjWB3YE+IDCEGZG48RYG
 88eIrLwni1LajxQ0uAOj4DwwTsruKCSOOsinDRr0uhXVBL5T6acDNOK0T0GB7P0IguBV
 QveT+JKD/3cK67NzQcw9cFyd058PHzT58vhOJdZtZMmeVVwa6dmTiF22NMF8/cAZ16oR
 RG1GJ7+aShiTnXIBk749xjjIjMpsuQ/I1UgeK6aNT7116TnlJWvRh98PNWV4A0griAbn
 4NkY8t4M5RWjJyOt+HHQIdpWkAryOxm2i/osJTlOObWLKK21Q3qo1d/0R3p02/xu4wBF TQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmh32se02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 10:55:46 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HAtjXh032621
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 10:55:45 GMT
Received: from [10.251.43.164] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 17 May
 2023 03:55:44 -0700
Message-ID: <1d08d306-a4ce-5744-b1d0-90d17aaa4f02@quicinc.com>
Date: Wed, 17 May 2023 11:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] sbsa-ref: use Bochs graphics card instead of VGA
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230505120936.1097060-1-marcin.juszkiewicz@linaro.org>
From: Leif Lindholm <quic_llindhol@quicinc.com>
In-Reply-To: <20230505120936.1097060-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Cgcz_CdY_NBAlYCQJKa66-XGl_zsq2PP
X-Proofpoint-GUID: Cgcz_CdY_NBAlYCQJKa66-XGl_zsq2PP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=866 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170089
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.412,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Md9nwshpHHwK

On 2023-05-05 13:09, Marcin Juszkiewicz wrote:
> Bochs card is normal PCI Express card so it fits better in system with
> PCI Express bus. VGA is simple legacy PCI card.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

> ---
>   hw/arm/sbsa-ref.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 3e3671f66e..0ace0fcc35 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -679,7 +679,7 @@ static void create_pcie(SBSAMachineState *sms)
>           }
>       }
>   
> -    pci_create_simple(pci->bus, -1, "VGA");
> +    pci_create_simple(pci->bus, -1, "bochs-display");
>   
>       create_smmu(sms, pci->bus);
>   }

