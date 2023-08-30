Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4065000ejc;
        Tue, 29 Aug 2023 19:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQO4xUWTBYO6TTEocZdnMre35+eF9Mhe75oL584uKqwSE1WOomEsHy5S5bK4azbF60C4ge
X-Received: by 2002:a0c:e484:0:b0:64f:7936:bcc8 with SMTP id n4-20020a0ce484000000b0064f7936bcc8mr843923qvl.14.1693362633898;
        Tue, 29 Aug 2023 19:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693362633; cv=none;
        d=google.com; s=arc-20160816;
        b=wRogWkbwB7XBaaG3WNX/HXZw8J64isMiU868YintiZyKVt9l5Uo8rIMMJbpZ/8yUJ+
         qqLEs3G2lftuh57rKy9+m1k8mX/YTtwrcLbEkFDhM9Gl37d6iei/GvkoP2fOsBSkuTxf
         gEZ6vVvpk7qp5x+yX/xFKs4G4/SQMg3CCKwn/CgaC6ilWSD6gaAPIvhv18GHMuP2952l
         hSVQk/KECBPhiY8dgiJewskhdgQszUlpaYSk15OWV/J6Aoa9JCUXlalzbtv9NjcfIxyQ
         +mfF/H5e+h3IExc841mXmPcFrX6A948UDKp+n1i0zJ2W+WVt1HY/nnB7CZx10MgZohb2
         Vx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nZm+YHYnv3Nr94rX8SYnTJAOFr73oGgMVtJ2+sMBQFE=;
        fh=z4DL/DsqiVmQbuPb5opnmziQshHCiKHrAC5IqI3bCPw=;
        b=aOgbSpH7HQrmzubzfcIDGhegu7tt8zB2DgoxLOJ/uunX9tugygHiPffMkDa/zV5VUZ
         cqWruFzAMqJh9CH3Ai9B5B1w8MNs5kRcTiC9vt267Tw3uFfbiT8wWoBPOX+fMCZNHckc
         Z1CECNgjxxMJhZZ53KjfLVSwyWpohmfr6ea1qvis4MYNdKDCVM1/7e8YJZ6TwNCG/5ju
         WIUj6ZEOIQ11sTlYO9tjiLoAcAySTZqICkJZaxg7K8LbC6sNMEWpW1qVyNSvCixgprt/
         YLUXmQLMJAZWVgS37HWPaszDDZItRa4CNOvIWbYFVCeJtevYrlf1/rDf6EsP4eoPAlHB
         arXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ownNZIjr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a0cf248000000b0064f3bee93b8si4775471qvl.248.2023.08.29.19.30.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 19:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ownNZIjr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbAyN-00014i-M6; Tue, 29 Aug 2023 22:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qbAyK-000141-7S; Tue, 29 Aug 2023 22:30:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qbAyH-0002ru-Nt; Tue, 29 Aug 2023 22:30:19 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U29DiL020814; Wed, 30 Aug 2023 02:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nZm+YHYnv3Nr94rX8SYnTJAOFr73oGgMVtJ2+sMBQFE=;
 b=ownNZIjrcP2evujHnQG0zJXmqgkU0BfTH6z9nYcTvxSgMeLydNp2Ip2h/3o36l+cxYdh
 xXyp1VE5fsPvvG0W7IxF/GZ//By0aKe/DZccxL2QYPTa5f5V7w9nLG0QyhfdTW894SFW
 BEsaEYK1OJKALTT9VuKpyEkLTPj4t85JqBw/8yMSGfdY7XtspiSBMRK6uYcWX724oR4V
 a5v9WsWOpBByiP1Z26Ew4KmZYnL7mPdYtw9tjqYwWhEQ+tdmWkr95nBRicUV07rL9vCn
 sVXF1vdbV9K9yWoGge4DfcgWDrDLlBN/SOnRG6FUwJRrD1mje8naoheRreJ5UvvSIIo6 bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssu57t0cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:30:10 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37U2PsHK012372;
 Wed, 30 Aug 2023 02:30:10 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssu57t0cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:30:09 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U1tUEO004884; Wed, 30 Aug 2023 02:30:09 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3squqsrrgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:30:09 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 37U2U8Yv36372880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Aug 2023 02:30:08 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2979E58051;
 Wed, 30 Aug 2023 02:30:08 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88F055805A;
 Wed, 30 Aug 2023 02:30:06 +0000 (GMT)
Received: from [9.61.171.165] (unknown [9.61.171.165])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 30 Aug 2023 02:30:06 +0000 (GMT)
Message-ID: <a2c31cb2-6cff-4f5f-aa69-2b6ab6f88342@linux.ibm.com>
Date: Tue, 29 Aug 2023 21:30:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Introduce model for IBM's FSP
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org
Cc: qemu-arm@nongnu.org
References: <20230825203046.3692467-1-ninad@linux.ibm.com>
 <587b23ee-4247-c142-9ced-6abd92922b2d@kaod.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <587b23ee-4247-c142-9ced-6abd92922b2d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q34FMqPR3fjnG4GGKE2OSxDRc1qMzJnF
X-Proofpoint-ORIG-GUID: --hqRFXirAXdVOjJrOpLo3jyovWvFN1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=603 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300017
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4s62YH0bUU7e

Hello Cedric,

On 8/28/23 03:49, Cédric Le Goater wrote:
> Hello Ninad,
>
> On 8/25/23 22:30, Ninad Palsule wrote:
>> Hello,
>>
>> Please review the patch-set.
>>
>> This is a first step towards introducing model for IBM's Flexible
>> Service Interface. The full functionality will be implemented over the
>> time.
>>
>> Ninad Palsule (7):
>>    hw/fsi: Introduce IBM's Local bus
>>    hw/fsi: Introduce IBM's scratchpad
>>    hw/fsi: Introduce IBM's cfam,fsi-slave
>>    hw/fsi: Introduce IBM's FSI
>>    hw/fsi: IBM's On-chip Peripheral Bus
>>    hw/fsi: Aspeed APB2OPB interface
>>    hw/arm: Hook up FSI module in AST2600
>>
>>   hw/Kconfig                         |   1 +
>>   hw/arm/Kconfig                     |   1 +
>>   hw/arm/aspeed_ast2600.c            |  15 ++
>>   hw/fsi/Kconfig                     |  23 ++
>>   hw/fsi/aspeed-apb2opb.c            | 346 +++++++++++++++++++++++++++++
>>   hw/fsi/cfam.c                      | 236 ++++++++++++++++++++
>>   hw/fsi/engine-scratchpad.c         | 100 +++++++++
>>   hw/fsi/fsi-master.c                | 202 +++++++++++++++++
>>   hw/fsi/fsi-slave.c                 | 109 +++++++++
>>   hw/fsi/fsi.c                       |  54 +++++
>>   hw/fsi/lbus.c                      |  94 ++++++++
>>   hw/fsi/meson.build                 |   6 +
>>   hw/fsi/opb.c                       | 194 ++++++++++++++++
>>   hw/fsi/trace-events                |   2 +
>>   hw/fsi/trace.h                     |   1 +
>>   hw/meson.build                     |   1 +
>>   include/hw/arm/aspeed_soc.h        |   4 +
>>   include/hw/fsi/aspeed-apb2opb.h    |  32 +++
>>   include/hw/fsi/bits.h              |  15 ++
>>   include/hw/fsi/cfam.h              |  59 +++++
>>   include/hw/fsi/engine-scratchpad.h |  32 +++
>>   include/hw/fsi/fsi-master.h        |  30 +++
>>   include/hw/fsi/fsi-slave.h         |  29 +++
>>   include/hw/fsi/fsi.h               |  35 +++
>>   include/hw/fsi/lbus.h              |  57 +++++
>>   include/hw/fsi/opb.h               |  45 ++++
>>   meson.build                        |   1 +
>
> Thanks for creating a series for these models.
>
> I think the commit logs have a lot of useful information which would
> be good for some docs/specs/ file. Please add a need a entry in
> MAINTAINERS for this new bus model.
>
> Tests are *very* much welcome also. Ideally we should have a couple
> in qtest. A minimum would be an avocado test running pdbg.

I have added document, MAINTAINERS and qtest.

Thank you for the review.

~Ninad

>
> Thanks,
>
> C.
>
>
>
>>   27 files changed, 1724 insertions(+)
>>   create mode 100644 hw/fsi/Kconfig
>>   create mode 100644 hw/fsi/aspeed-apb2opb.c
>>   create mode 100644 hw/fsi/cfam.c
>>   create mode 100644 hw/fsi/engine-scratchpad.c
>>   create mode 100644 hw/fsi/fsi-master.c
>>   create mode 100644 hw/fsi/fsi-slave.c
>>   create mode 100644 hw/fsi/fsi.c
>>   create mode 100644 hw/fsi/lbus.c
>>   create mode 100644 hw/fsi/meson.build
>>   create mode 100644 hw/fsi/opb.c
>>   create mode 100644 hw/fsi/trace-events
>>   create mode 100644 hw/fsi/trace.h
>>   create mode 100644 include/hw/fsi/aspeed-apb2opb.h
>>   create mode 100644 include/hw/fsi/bits.h
>>   create mode 100644 include/hw/fsi/cfam.h
>>   create mode 100644 include/hw/fsi/engine-scratchpad.h
>>   create mode 100644 include/hw/fsi/fsi-master.h
>>   create mode 100644 include/hw/fsi/fsi-slave.h
>>   create mode 100644 include/hw/fsi/fsi.h
>>   create mode 100644 include/hw/fsi/lbus.h
>>   create mode 100644 include/hw/fsi/opb.h
>>
>
