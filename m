Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp772935ejc;
        Fri, 26 Jan 2024 02:00:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxOSUZpd/CrDrUoW89NYGGv7x3YDWxtGzo+rflsBbtFEtC5EV08tWsTqONT0qxOh3ktGQf
X-Received: by 2002:a05:6102:3585:b0:46b:1fcc:b83e with SMTP id h5-20020a056102358500b0046b1fccb83emr318372vsu.21.1706263258187;
        Fri, 26 Jan 2024 02:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706263258; cv=none;
        d=google.com; s=arc-20160816;
        b=Hdh2RdBiRQtzbr6b9P0ZekHS2gZXjFXlr04woGy0xQGNEuxGfo9c/wuprVHe1AvzA0
         TBVPU08wWc2dFALawhAM5VFE9JF9dnZ9ME59g2PpfslgR6NRsL7LXQg1/RpHkABVfhEu
         xgwnOiAJg9jBiQn65st41xkA2nhqnVFmeOdeTkLegb/t8ZopoWCA2inJXBKhBOcWm+z+
         BKDT0ycvOvPXM8/RJg0Qq9/1v/xoZRyNGUoYe4Bz8L8MAJav20DwlzwJuNWC38ChpULb
         HvwB8iL3XsjeYNx7apiix8cGmD/nM4QTBh4KJjJOXVaAy9ErN7oCL1goe1g5Gngsvs1l
         CqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IP644mm7Xeu/QdAxvZpUCdASXH1SqIfSP0wQTPfrnHk=;
        fh=HTHR+Q2d6bLhEl37Oh4T8uXQP5/6sUv4T2u8Op+j0Ns=;
        b=Ak2lDtt1Ec0bqwmWI6jACW+nkBVtCKYlteFAxnOj+Y1+Y2iXXmCnQmTD5ArZ+Xh9Dc
         SwtdiJzaznTbR9Fdla6hYqaayKmkOE7UEkZnFWjMpKRt9cIYOg6J91RB11TlkEClATBX
         GIQG7D6zHPBH1Mt5zlr4L45N1ab4QcKJpZsd7fVqNZRSVR9USCeCLVLp1cvUq7b22Bv/
         hCpiSgh70HCM0qVdv3tcfZ1O5RhM3r9tqzIi2ZcBpmgeYO+cbhJf59F1Vm9c4eIC7Rrh
         QpNxObP1XQQ79nK5a0AFGlfHsRqvTanYnmN0EnfzrSk9+xUt+dYJz8XU+gQZkO309odN
         Lqwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=KHBJlMXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 98-20020a9f23eb000000b007d2ea910d8bsi73535uao.201.2024.01.26.02.00.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 02:00:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=KHBJlMXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTJ10-0000YT-W7; Fri, 26 Jan 2024 05:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJ0b-0000QI-6J; Fri, 26 Jan 2024 05:00:35 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJ0Y-0003E7-C1; Fri, 26 Jan 2024 05:00:24 -0500
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q9kbu6029387; Fri, 26 Jan 2024 10:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IP644mm7Xeu/QdAxvZpUCdASXH1SqIfSP0wQTPfrnHk=;
 b=KHBJlMXN1W54Etug+5eOKFtCuh2zdZO5vIMlbJ7lWN3/yjkYPy2UVX6VdO2cWuUoQkr3
 4MjsEukcvQ8uRvBXcElOQEFVhwZjzdz4eCpTpVVhufH8+SoHdeKDSyHk6g1R9TNYFZu2
 zvlfdJSEHLr2SFTqm62bG7C4973o+Y4jMme4Mi8II2ujVJ5FZAL92a/U7iqkruD7kVUc
 efxJyFnpKbyQC4ViqNdbj199Ld48J5fcx5HGZEC0neEKJEPZjwhLpk3mTPJgvqvhhTXH
 PP3ms96R9rAnIlAv8C+am1rW5WbLaT5kAhtQfxjgeNBo/ygdP70GvUKAIf9CtVX5hzUX 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv9yk0n4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:00:03 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40Q9xl5b004690;
 Fri, 26 Jan 2024 10:00:03 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv9yk0n2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:00:03 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q9ZSSc025268; Fri, 26 Jan 2024 10:00:02 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrtqkspjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:00:02 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40QA01OC18219772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 10:00:01 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BCD35805D;
 Fri, 26 Jan 2024 10:00:01 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A99B58054;
 Fri, 26 Jan 2024 10:00:00 +0000 (GMT)
Received: from [9.61.160.70] (unknown [9.61.160.70])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 10:00:00 +0000 (GMT)
Message-ID: <5828efc8-3fa4-4daf-bc25-912b88ca3592@linux.ibm.com>
Date: Fri, 26 Jan 2024 04:00:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/11] hw/fsi: Introduce IBM's fsi-slave model
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240126034026.31068-1-ninad@linux.ibm.com>
 <20240126034026.31068-5-ninad@linux.ibm.com>
 <8b961658-d468-4f71-b2e4-4f1d148bdf55@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <8b961658-d468-4f71-b2e4-4f1d148bdf55@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sQdUnBAW4m4R7LkNIky6VIdstOyZRRUo
X-Proofpoint-ORIG-GUID: SggCwBCAowt4n562RlxV705xZsszIpD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=624 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401260072
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: nJNUtzGLVN4t

Hello Cedric,


>> +
>> +static void fsi_slave_reset(DeviceState *dev)
>> +{
>> +    FSISlaveState *s = FSI_SLAVE(dev);
>> +    int i;
>> +
>> +    /* Initialize registers */
>> +    for (i = 0; i < FSI_SLAVE_CONTROL_NR_REGS; i++) {
>> +        s->regs[i] = 0;
>> +    }
>
> memset would be better.
Replaced for loop with memset.
>
> with that fixed,
>
>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

Added tag.

Thanks for the review.

Regards,

Ninad


