Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp738584lfg;
        Fri, 28 Feb 2020 06:37:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqyxyP2s1P02m76cFlgIXKbnbFhZF43HusgBjyljb6K4Tc5zxQMWL2kDtK8SNoGU9s44mftY
X-Received: by 2002:ac8:7517:: with SMTP id u23mr4361827qtq.11.1582900651439;
        Fri, 28 Feb 2020 06:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582900651; cv=none;
        d=google.com; s=arc-20160816;
        b=YJcFNumcQmjKCK1x/iIWFgfmAYJc0iFyyEBKx8geIVlhlwIkK8URNsK7wrwjrEikm7
         MJgCy9Tm4P/wupWC+485WcEOaqPeUjbMLGDt9gIJ0QlfaGfST1Sp/aDtMwDVL382+tz8
         dXXFjhqWlWVT4NAy0WdE94JdQaTHjFFVXkJwx9jCQrep4L0Fp4UknsENfSZqsqpsSjaL
         toD1Wr1nvlnTUfFWT2miUmIaWQYs8AIV8XJwMamEJdlSV2gcfFf4bSy3NQX1O0WSwjUA
         UIYIiynI4PRGkj9nDKz80SCqVz8ruuPzSRTkc/Ul2qTizReJ1PF2QeaPddeDsNqAHHSS
         eo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=PCJVIWMijvKjZG3Sch9PfBm/5R02ZQSPfvPck/ZoD98=;
        b=WQypuxWb2c+R0GaFav2vbi8xqDUOm4erLRqMv3YShUUi8/0/6BgwzEogFJTbMLMJM0
         IKACwzPxanGj/wQw0JbCvI6jBTS8xdX5hqoSsjxXZHQPyFODfHeqnaPhBYqCghNnqWOe
         pbxUFijq9O7HhQCqEi2dm6ZaJ5atzGbX6VXkyZKEwhe6riW/GThwuWvK2PKIIlBAK1vl
         4HEyykeBOU/6ovydxkErTc3oh+Wd0uA2Fox3715ZdeAcD0PYLZ8gHRLNNrJRe98jHdro
         ppdwZ6i5RDRvQgJdjhkOckdMLTyFO93lqoZigYEu8xK3LKQBzlqzw5VzNs0pjlrnuTjg
         xP+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c27si226808qtv.109.2020.02.28.06.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 06:37:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7gle-0005Jr-TB
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 09:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37487)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1j7glW-0005Jd-IJ
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 09:37:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1j7glV-0001yi-9c
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 09:37:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20988
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1j7glV-0001xR-50; Fri, 28 Feb 2020 09:37:21 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SEYoZ6164383; Fri, 28 Feb 2020 09:37:18 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yepwj8tmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 09:37:18 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01SEbHda172271;
 Fri, 28 Feb 2020 09:37:17 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yepwj8tkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 09:37:17 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01SEZDk6001283;
 Fri, 28 Feb 2020 14:37:16 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 2yepv2d2xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 14:37:16 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01SEbG5c45875550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 14:37:16 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C9A2AC059;
 Fri, 28 Feb 2020 14:37:16 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39F69AC062;
 Fri, 28 Feb 2020 14:37:16 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 28 Feb 2020 14:37:16 +0000 (GMT)
Subject: Re: [PATCH v4 00/10] vTPM for aarch64
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226205942.11424-1-eric.auger@redhat.com>
 <4fb16117-f9d3-61af-9198-931590a46e3d@linux.ibm.com>
 <ee98e8ab-06df-e422-1ca5-f3f6a48145f2@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <2413ead7-3707-acc6-7900-bb3896082051@linux.ibm.com>
Date: Fri, 28 Feb 2020 09:37:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <ee98e8ab-06df-e422-1ca5-f3f6a48145f2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-28,
 2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=862
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280115
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-001b2d01.pphosted.com id 01SEYoZ6164383
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0MgNx0qVH5yp

On 2/27/20 3:07 AM, Auger Eric wrote:
> Hi Stefan,
> On 2/26/20 11:44 PM, Stefan Berger wrote:
>> On 2/26/20 3:59 PM, Eric Auger wrote:
>>> This series adds the capability to instantiate an MMIO TPM TIS
>>> in ARM virt. It is candidate to qemu 5.0.
>> I queued it now here:
>> https://github.com/stefanberger/qemu-tpm/commits/tpm-next
>>
>> I will send the PR within a few days. Thanks!
> Thank you. I will just ping Peter to make sure he has no comments on
>
> [PATCH v4 06/10] hw/arm/virt: vTPM support


The little dent is now an arm boot failure:


https://travis-ci.org/stefanberger/qemu-tpm/jobs/655573347?utm_medium=3Dn=
otification&utm_source=3Demail


Have a look at the raw log.


 =C2=A0=C2=A0 Stefan


