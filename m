Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5964614lfm;
        Tue, 28 Apr 2020 13:19:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypJP2c9tFSKc511QAE1d0YbS2ClQgTgfzcvTFO8cUsmtuR4J2jUgagfxv28dE5+g326Uqn7A
X-Received: by 2002:a05:620a:b84:: with SMTP id k4mr30717553qkh.368.1588105154867;
        Tue, 28 Apr 2020 13:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588105154; cv=none;
        d=google.com; s=arc-20160816;
        b=Hek2KEszDv2CNEeexWXxqztC8YlvKr4gMb/s7HcuWVXlGlI4kbPVKxp0Vxn7IZ/zgF
         t9bp8+3PHBzyXkvtsJgTKWxl8YuxVq7Lucr6xL77fgbsxjdF2T0Dw6e1DHteD5YgGIxa
         URszHLoOe6GhYmu8U+NHwHkSqzqMpEIrdR6rO93wKNPcgnF04drT+Y7c56CzC1OGOiDb
         KBgvX/3Nwu41m2sfdKquSkJVIfp4zVulqQAvafxrHUAiOdNmeK28M+dYViRhKAE3LMH2
         FRTJE3WajFlq1M2YS9+IB6kUxnqYPy9VnSHf13g2xwjKt8YJela4DzlE5QdKvsRvYaXx
         LmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=QdqsEhx4sAKFFnsnl5H6yOB4XGbg4+532dKVHzyFPU0=;
        b=ik8vJ6hsiYfmP4EGbF0qLqoKjemAmK2l2jhelX1avUlStCylskMC+dznX/470Y1Xq7
         HBqSztyIhfLpe62shhZAhlH+QIMs2bHBYvt3LlUzAeyS16k6L22wzV7aJGuELhugcRGL
         N4Hfe+cYfYPRxAbuiW7grQEEdHvKTnDImxkB+CBfZeR9OtaEVFeYKU5rXK4Q85wxLDvU
         i/pM2Q7ntcn87UfRk4jiDxj8BdpQVS6taJjcVRT2DTfqzMkiixxKvVsT2dPs+C2NUiZb
         ybxsJ1+Tq1RJVvgJqbz4XuHYA+yBcVZdzQmOQHXnQ3Lg/s7xqZDFiu+fwvWfRyAbAwNV
         88cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m34si11078008qta.71.2020.04.28.13.19.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 13:19:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:49372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTWhG-0003O8-8s
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 16:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1jTWeY-0007L4-4u
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 16:18:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1jTWbN-0005ms-GA
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 16:16:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3336
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jTWbM-0005mW-V5; Tue, 28 Apr 2020 16:13:09 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SK1i9K019614; Tue, 28 Apr 2020 16:13:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30pjxvafpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 16:13:07 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03SK1ppZ020518;
 Tue, 28 Apr 2020 16:13:06 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30pjxvafpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 16:13:06 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SJtil0024666;
 Tue, 28 Apr 2020 20:13:06 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 30mcu6ewdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 20:13:06 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03SKD5id41681370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 20:13:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 883ED112062;
 Tue, 28 Apr 2020 20:13:05 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71568112061;
 Tue, 28 Apr 2020 20:13:05 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 20:13:05 +0000 (GMT)
Subject: Re: [PATCH 0/2] virt: Set tpm-tis-device ppi property to off by
 default
To: Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>
References: <20200427143145.16251-1-eric.auger@redhat.com>
 <20200428123826.1ec68e6c.cohuck@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <0257ca1e-2323-e437-4e19-d8a4dfa6d792@linux.ibm.com>
Date: Tue, 28 Apr 2020 16:13:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200428123826.1ec68e6c.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_12:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004280153
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 16:13:07
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H7lyroAmBnZO

On 4/28/20 6:38 AM, Cornelia Huck wrote:
> On Mon, 27 Apr 2020 16:31:43 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Instead of using a compat in the mach-virt machine to force
>> PPI off for all virt machines (PPI not supported by the
>> tpm-tis-device device), let's simply change the default value
>> in the sysbus device.
>>
>> Best Regards
>>
>> Eric
>>
>> Eric Auger (2):
>>    tpm: tpm-tis-device: set PPI to false by default
>>    hw/arm/virt: Remove the compat forcing tpm-tis-device PPI to off
>>
>>   hw/arm/virt.c           | 5 -----
>>   hw/tpm/tpm_tis_sysbus.c | 2 +-
>>   2 files changed, 1 insertion(+), 6 deletions(-)
>>
> I think we can apply the compat machines patch on top of these two
> patches.
>
> Q: Who will queue this and the machine types patch? It feels a bit
> weird taking arm patches through the s390 tree :)
>
I can queue them and would send the PR soon. I am also fine with someone 
else doing it.

