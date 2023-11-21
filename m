Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp237780ejy;
        Mon, 20 Nov 2023 20:51:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9UZoK2DEERRm/jBOdv2Ja/4nuMsrSl4dqzDT1skFeb9egfdciSqTpgsd1Vovvzxir94r0
X-Received: by 2002:a0c:f002:0:b0:66d:a301:e512 with SMTP id z2-20020a0cf002000000b0066da301e512mr10061450qvk.27.1700542310677;
        Mon, 20 Nov 2023 20:51:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700542310; cv=none;
        d=google.com; s=arc-20160816;
        b=MAYCseyKhmbIOYxUgi23cRrM18/KXuqRbAk/IAf5RYq3aGYpWId65BDOTHz1eKCOtz
         aenBfs/oZbSCjMb8088PGs5FY9k/VKv8pr8fIzIUgLqmu25vVgri/xiv+hN8ysX8Z4a+
         4brGvSJDz61EAzyVsukiNgeI5TUIjE/tEfwBSiVO8UOlT9piHao9Bty/SwDZDlGGLQSg
         DVlhNgl/KPYTVgnzmaoSQyORDoXC8HwCSy5P3Ra+2anfWdA9++aSD64TOhRVZQwQtpA6
         z34zUt1H6sUkg6Zh/qTTPNHZFiAVhRpjdNAyrdDZsIeSQMzjSqzsu1MfW2SXN/Xbltg5
         CtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bF39/PUVNe5zdSwAXgEc57WN3ApBMy6p3/FFGItpJJk=;
        fh=MOQHLy6/BXkS69tsBOlCyJXXu38+aDQiIW/ZsX8zzPw=;
        b=oxsr5SalPvjY+C2PKE8nsg+6yI/YZYATsVqXx2Q2kEElLBb2YXT0AWb3cfuORPzsKX
         k4kmXiIlZQXClKTSfibdW4tsjmoAGKF+X7BOy59AeedtYo+QOweBTmuaA0sPa6AIVKFY
         ++ya14gIqlb/MNZzEZoG/kpyYeuO0i7JZQh//5Cl1KdGhw99OIKuIoFtIS0VPTWp/cO/
         +1ZHTM3mllM4dQFzxpMlN7QmqTIFHGcnUuPIn/49YVe3Z60desbBsb8trPQPwfnRTJxH
         DBJm53N/iFf55jAdp20StMSCOhGc0WPFSDuUIXzl/KDIwAxtRfxAH/hfdwAuWMxzghVb
         vWSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=c4RKuo7l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020a05620a240b00b00773a681104csi9174649qkn.684.2023.11.20.20.51.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 20:51:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=c4RKuo7l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5IjX-0008Ic-Ru; Mon, 20 Nov 2023 23:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1r5IjV-0008Hz-QR; Mon, 20 Nov 2023 23:51:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1r5IjT-0008TG-Fe; Mon, 20 Nov 2023 23:51:33 -0500
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AL4elCQ006164; Tue, 21 Nov 2023 04:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bF39/PUVNe5zdSwAXgEc57WN3ApBMy6p3/FFGItpJJk=;
 b=c4RKuo7lvwtTMLiMs0f7wa3GrCb28Ryd17S7fhhw7TAJ6HkrHxH3LCbq1U3Y75XRpYzL
 T8w4h2MBOxpZCAE0BXzuRTEdMCJzIKzeAfT+1GGCrq/C4pII7FoAdS6pbe1px2hyQtfj
 aUm2dVcE9XglxGVnOmimlXvVe7c1iNLC+IulCWPYG8OzUyHrEoaajhQdok4aBIAXhPG0
 bIDF9xWCLpEIsILAkxl1vziq0PONDDRVUF/zv66Y6DkvyJEKOK0QIiwCeyefKxlwdmoe
 O5QTgoe8wZ/h49H7CLgQha3/qDUZvuvA9fEjfb4v+VNdXeaQK4/s9IOEJqPIQk74RDpV 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ugnqur7ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 04:51:05 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AL4gCFJ009907;
 Tue, 21 Nov 2023 04:51:05 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ugnqur7eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 04:51:04 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AL324Kd006831; Tue, 21 Nov 2023 04:51:04 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uf8knp5ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 04:51:04 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3AL4p24314680650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Nov 2023 04:51:03 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8ABB5805B;
 Tue, 21 Nov 2023 04:51:02 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 092F358063;
 Tue, 21 Nov 2023 04:50:55 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 21 Nov 2023 04:50:54 +0000 (GMT)
Message-ID: <99ee8967-98b8-5c82-66f8-b4172d638d53@linux.ibm.com>
Date: Tue, 21 Nov 2023 10:20:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH for-9.0] hw: Add compat machines for 9.0
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20231120094259.1191804-1-cohuck@redhat.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20231120094259.1191804-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: H2dk2rjgH7cF94LTSKTS92oC20voruLb
X-Proofpoint-GUID: uIP0KZIDyc2E7mVuCOotH6lGUvm32CmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_02,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 mlxlogscore=509 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311210036
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.009,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UOxLudUXW/Ih



On 11/20/23 15:12, Cornelia Huck wrote:
> Add 9.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 17 ++++++++++++++---
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 80 insertions(+), 9 deletions(-)

For spapr:
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
