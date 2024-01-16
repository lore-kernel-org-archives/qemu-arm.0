Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1090727ejf;
        Tue, 16 Jan 2024 11:33:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHR18GfBtH8g0g0pFllXZ3AOQLYXbu4U7qhXdB07Ij1HVRvnaqh1MwpWaL/yfQ0npcgkLGm
X-Received: by 2002:a9d:6384:0:b0:6df:e001:65db with SMTP id w4-20020a9d6384000000b006dfe00165dbmr8063184otk.69.1705433623249;
        Tue, 16 Jan 2024 11:33:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705433623; cv=none;
        d=google.com; s=arc-20160816;
        b=pRI3bj/bq387RRrojGldCvoxsouMET+1WMWtt7G7TuwkioaT5nRQYtp2KU90ucfuzz
         SMIb0aMVMo26EKzwdi3TNyI0BU59yNYE5/xjkNq8SZ82Lmi8hPL/hlveuXonBI+JKzTB
         Nn/K6kMMGyIaYndb5HRFLJYAKFFCo91drqZjU6kCkETHreXR7MBE9TXIPGTUF/SQXedj
         IxT03tQ33QhQHmaHzLbD6pKloSXzHcw5+rRFYXpBZUBenqxg0cF7s1fmTS6QcGlexij2
         bbwhE6Lza/uvhmXzMzUZjIwLuoc40gOaIqfZpB7paQ7akAi8qnF7+Lq0NrQRM13wgBF8
         01/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ErfYX0yJ8Y0H67TIb0gKXMIfORMLllNbNCFxD1DBJe8=;
        fh=cgAQA+XUIsr4IqXjvxsNSbu6yUfPNOKZue5KQ1lizTE=;
        b=LKHng4YbhfcBcz68w1i9+y5VvPU52N/ZZHR8FdB4UG8tjMimRy9ZPcxfy3LyZixLGN
         OAz0oFM6sQXobUmvGKgOzWAyfTKa4vznv2UYWC36gOMQb0aIYoa7wzvBWolgUoIw/OTy
         htNxcPrzgdApv3EhgkKX4lxJ6x9o8IAd12zJNzcYtd/tY7Sqfj/R3Qc87xNhU3bHRzNq
         AfNmNS7LChr22ESZ5lXxgAtIKSXSDbPcJUosHMuK0emqgCn215pQCfRZLQiKZ7E4lgjx
         zjIPiwJueA91n8YJRQL9CAomHOfGMeRmx3yHz/PpJ1JFjn91lyH0+/j2d+hOQC3p0nhg
         C5jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=TXaSlewn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16-20020a05622a03d000b004299cafd4a3si10312940qtx.533.2024.01.16.11.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 11:33:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=TXaSlewn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rPpBi-0004ci-Rr; Tue, 16 Jan 2024 14:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rPpBg-0004Y7-4U; Tue, 16 Jan 2024 14:33:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rPpBe-0000n3-Mn; Tue, 16 Jan 2024 14:33:27 -0500
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40GIN80F017944; Tue, 16 Jan 2024 19:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ErfYX0yJ8Y0H67TIb0gKXMIfORMLllNbNCFxD1DBJe8=;
 b=TXaSlewn1eKOx6OHIhDzhwouUGPiIEYOQyc5EX4SV826F0BMTKs+2XNoWGNxAfjjGUXd
 KOeHF2TDkYO+5dj3AziZfj7vIa3xg6DfA+l352jpDyss8NJdtL0J0Fdn1GxMcuUpogWH
 QDxdPCE3W2pKEzVAKoQpaP0xFeW8Xt8f/Iuqaq56p3TPS0YqBOjDcSsTCpkGsbtD2boB
 Bvk5rQ4YuCqHIHqGfWFEHsXN81HaYPUDblwnh3odz8mtL7mVFUoR+7h+jM+rOqdMuKnC
 Tg/zp2S2JnDB9oYEYVJPIb3/9q9r98O72PoO2pdAC5ROPqG5HojQg9JwYNSdLPBqq98q HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vny1bt1rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 19:33:11 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40GJSsqt032149;
 Tue, 16 Jan 2024 19:33:11 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vny1bt1rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 19:33:11 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40GJA1PN008553; Tue, 16 Jan 2024 19:33:10 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vm5ungp05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 19:33:10 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40GJX9vq33686038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jan 2024 19:33:10 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B87D75805A;
 Tue, 16 Jan 2024 19:33:09 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A53758052;
 Tue, 16 Jan 2024 19:33:09 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jan 2024 19:33:09 +0000 (GMT)
Message-ID: <d424b39c-8c16-4b29-99b8-7221fccfa081@linux.ibm.com>
Date: Tue, 16 Jan 2024 13:33:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 8/9] hw/fsi: Added FSI documentation
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20240110231537.1654478-1-ninad@linux.ibm.com>
 <20240110231537.1654478-9-ninad@linux.ibm.com>
 <c3117f43-3703-4574-8516-9ffafda4d736@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <c3117f43-3703-4574-8516-9ffafda4d736@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7NFlJGkAUz-nPPux08R3dc-ifXLj9n4M
X-Proofpoint-ORIG-GUID: TOgKNDTr_sYD0e6hKUUaoRJLw2dQVqej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_12,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxlogscore=576 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401160154
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: RaV0k+zBbB/8

Hello Cedric,

On 1/12/24 10:02, Cédric Le Goater wrote:
> On 1/11/24 00:15, Ninad Palsule wrote:
>> Documentation for IBM FSI model.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>
> Please remove mu S-o-b.

Removed.

Thanks for the review.

Regards,

Ninad


