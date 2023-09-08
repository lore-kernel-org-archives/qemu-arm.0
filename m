Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp7431ejx;
        Fri, 8 Sep 2023 16:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuSQQ6bzwcaAwOXcvpMzUnjOHrpgLJ0aYHWAEc6eqZxrIaVhmM8tB+DNQe4bG2cz+u9nWX
X-Received: by 2002:a05:6358:2612:b0:139:a0fd:780a with SMTP id l18-20020a056358261200b00139a0fd780amr4378675rwc.12.1694214692118;
        Fri, 08 Sep 2023 16:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694214692; cv=none;
        d=google.com; s=arc-20160816;
        b=EGhHJVQ0lLeIVgbGpKAaFvFMLnP9kPIQR+giWzd8PYuj+Xe0fAl/HBmtI39zmHkvRp
         oqYNY9kXqcQIpg4LTpCzPuiS8uP0+C5ayaMRVnkYpLbEIYsZcM546/zZS7ZXtcTflxEh
         4+FDmkdbhkEYFBIqnsV62b/0Ib0NMhVrV8KjJPyLvXaVopT3kMx7n5qJSbeVP9xPsiI/
         mrnivTmAxuMJK8++4QHA5DN7Bg5ndGybI8SBvdgj6F/jmfJWS8cIzWfMuQWBXEBAXP08
         mbpb4msoV0wSidKJNasYHp0oOzsEsNQOPSYTd74sTBWieOUux/xFgfDUEf2/dPwXXUeK
         vlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RlduIYERzoOiZ8ividXrPLZe+NmFKjiq5SkE6uRROU8=;
        fh=V5tMgFMqcjV+xJ9N/Iweko7Yto3HJkd+1Wp5bKCNH9k=;
        b=uW9CGsDvjJYlpLifTnpxbf9kNFsypESlYViHvIhU/T8Hbo3OrJIzac6D/vXtFhdVVs
         //BwJNHZokNtSGRiT3Zn5q+G1TAF9+Zv2YUpnYDEyPBBB5ckFjhmvtxd6HuORp+cd3Fc
         cDRfDm3VrV7MF6AuKtw2crBY5jxUM71nVqPKep7u12QrH2lz7QwlJqQOT0g2TN9xLFV1
         /PUOuZMH23gD8QTWu2xVMrtVZzU3w1+IW98EN9mWYCsx3fm1C5d/oSmc/ZstkEnOb+Yp
         0ZOqnp3AZSXn56ntEi4MaGiSHFU1Toj689lqsTPA8xIEKHwCRMGyQmeaJ80dHXfD0rwL
         2jcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lTW6i55M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020a0ce349000000b0064f4fcba69csi1742481qvm.17.2023.09.08.16.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 16:11:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lTW6i55M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qekdF-0000f9-Id; Fri, 08 Sep 2023 19:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qekdC-0000eP-D9; Fri, 08 Sep 2023 19:11:18 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qekd8-0004ay-TJ; Fri, 08 Sep 2023 19:11:17 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 388N8oeH019864; Fri, 8 Sep 2023 23:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RlduIYERzoOiZ8ividXrPLZe+NmFKjiq5SkE6uRROU8=;
 b=lTW6i55MQyzsOHNk7EbOia8gdWFebo8/mVgY8ZVducpd8nZKAYr0kdCiRMHf7zZbRP79
 NsnS1+D7/Qy7KUlJZYIKLCWKwPXc25jMq9qVcgkryKffXA5tbzDQ3s138Jya18s5eEjN
 saP5AC7n6ZJ3A9g1w6tkhA/YMhUtNVDfqoMhMwzv8Efrpx9KJDULPBKGy9C3V9h32QDA
 fIh/ctiYqK8EYpLQQMsTpJyUH37Zs1hV4XJ73jOTtwSqa7O8QRs2kPNxYU3jYZ9dyATx
 ySAnYnYRe2bGFQiRd/8gPle4cwQwkRXyaY0CHxhsKQP8B91NAsryA/fVXzxOwTbQtorL AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t0cdd0pe1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 23:11:00 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 388NAJrx026850;
 Fri, 8 Sep 2023 23:10:59 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t0cdd0p9u-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 23:10:59 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 388LgCbX001667; Fri, 8 Sep 2023 22:31:39 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svfctfk4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 22:31:39 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 388MVdQj25821932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Sep 2023 22:31:39 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59AD75805D;
 Fri,  8 Sep 2023 22:31:39 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0948458059;
 Fri,  8 Sep 2023 22:31:38 +0000 (GMT)
Received: from [9.61.102.160] (unknown [9.61.102.160])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  8 Sep 2023 22:31:37 +0000 (GMT)
Message-ID: <8539cf6a-fbe7-4d94-9ad2-1011f7d70fe8@linux.ibm.com>
Date: Fri, 8 Sep 2023 17:31:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] hw/fsi: Documentation and testing
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20230830022638.4183766-1-ninad@linux.ibm.com>
 <20230830022638.4183766-9-ninad@linux.ibm.com>
 <0cdc9d0c-b146-e55f-cd2d-81e6827e64e4@redhat.com>
 <c722f63e-697b-eeab-82f0-7155b2a4632b@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <c722f63e-697b-eeab-82f0-7155b2a4632b@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7MOwr9sYm3yJUsNwAfA35F5mfPCz3Wo5
X-Proofpoint-ORIG-GUID: Koa2p7Z30VDeCF90GdE5jpe7Q8Gqhnd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=622 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080211
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
X-TUID: 21XxvFGe4jeY

Hello Cedric,

On 8/30/23 02:13, Cédric Le Goater wrote:
> On 8/30/23 09:05, Thomas Huth wrote:
>> On 30/08/2023 04.26, Ninad Palsule wrote:
>>> Added FSI document
>>> Added basic qtests for FSI model.
>>> Added MAINITAINER for FSI
>>> Replaced some qemu logs to traces.
>>
>> Sorry, that's not how we rework patch series in the QEMU development 
>> process. Please squash the log traces changes into the patches that 
>> introduced the original code, and please put the MAINTAINERS update, 
>> documentation and qtests into separate patches.
>
> yes. This is true for some Kconfig changes also. On that topic, please
> make sure FSI is compiled only when ASPEED_SOC is selected. It could be
> useful for the PPC PowerNV machines one day but the models are not
> available yet.

Fixed the Kconfig rework and make sure that FSI is selected only with 
ASPEED_SOC.


Thanks for the review.

~Ninad

>
> I will try to go through the series this week. Wait a bit for the v4.
>
> Thanks,
>
> C.
>
>
