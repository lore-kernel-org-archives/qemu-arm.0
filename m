Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3083501lfg;
        Wed, 26 Feb 2020 05:32:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxl+WSN7dfoAEpIH5zc9zkbGXO5yU5OtAoB/a4IN49i3N8WT5yOi2aMnQCXiNodlBUtYKy/
X-Received: by 2002:a37:6cc1:: with SMTP id h184mr5394924qkc.96.1582723960289;
        Wed, 26 Feb 2020 05:32:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582723960; cv=none;
        d=google.com; s=arc-20160816;
        b=xNFmc75uzORkMQ0ShbswxtuzgYRw77x4yySJVCoN/kdSjzAaAIddYUV/ecm9BEdOOB
         Vh71tcUaJl/d49zMmXj6vMsQt+VvJ4R5FWvmjBzZ/l26+c77MjBcYCpvm3DGudgPnt8Y
         LaztvPBRgf4Xm65SSO3ycySw13lHak9tAI1TqihxiWV/Hpx5k/M1YxrSHdjR9xxbBGDt
         nHMeOBFh1pY5QagdmFMwl6YNzzrIrN0NPbY8IpWrbe4BmyUY+2YXuo2+i8iGsq+nXPN8
         AmuyoPUhC7aSoEFbSXsq1ulUJlYJduf7gHLXz3WU8+1WW/8QTJhsqPzaaWgZ6JUbcl76
         SmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=yVH6AhWZ9WgNGDjozuoWb/jo84hDy+IcFnflYZhGYqw=;
        b=JAea/65IDZGxuXvgmuJsjm8ROZV57XXms1Gn/N5otOsR0BrZb9gq3NYs3Y4fJNguP9
         c9wUxeho5wBGGu1SZV2pHlp6XdeoG4K2YW+IjC40bVHxEebqXAxutn8sfklp1E8lqO8c
         xIsMDwp+QvRUz9qdeQ1xprepS3LHTvFXdzB25kpLvmCkYMcw3/qclmpy53I7JEumHEFf
         2eM0SIEjtMfx4OiWrinD48Xsi8ujbHLVNredqSO7aAsXhMOwfQKszMfEoBohpq8K85Y4
         0mqRTyQa/zzV5kShjesd3UngiKRGUQoGGgH4NNZWsVNcsM+8jCaeSJKxr9cCaQu85qTk
         BALQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si1000275qka.285.2020.02.26.05.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 05:32:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:44424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6wnn-0006Wn-NG
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 08:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1j6wnX-0006WS-7A
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 08:32:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1j6wnW-0002Js-7G
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 08:32:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24168)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1j6wnV-0002Gd-Ss; Wed, 26 Feb 2020 08:32:22 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QDU7Ck078693; Wed, 26 Feb 2020 08:32:19 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydkf95c93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 08:32:19 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01QDUIm7080171;
 Wed, 26 Feb 2020 08:32:15 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydkf95c84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 08:32:15 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01QDUOgN017870;
 Wed, 26 Feb 2020 13:32:14 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 2ydcmkpw2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 13:32:14 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QDWDkE35848684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 13:32:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4702828059;
 Wed, 26 Feb 2020 13:32:13 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3695A28058;
 Wed, 26 Feb 2020 13:32:13 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 13:32:13 +0000 (GMT)
Subject: Re: [PATCH v3 00/10] vTPM for aarch64
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226102549.12158-1-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <31e81f4b-ef00-692e-540f-ef3d9be5bb9a@linux.ibm.com>
Date: Wed, 26 Feb 2020 08:32:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200226102549.12158-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_04:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=920
 suspectscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260100
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
X-TUID: Hc36AgeaSY1L

On 2/26/20 5:25 AM, Eric Auger wrote:
> This series adds the capability to instantiate an MMIO TPM TIS
> in ARM virt. It is candidate to qemu 5.0.

Looks good. Can you run the checkpatch script over the patches and 
address the warnings?


