Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp347497ejb;
        Thu, 30 Nov 2023 08:14:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOh25Bq7mNuFQH8nBJUMrDBsXPHMDUoni+e4lBIBMR6jedJg66OkKnCQTTLhjwYRFuRXUz
X-Received: by 2002:a05:6102:9c2:b0:464:6008:72b9 with SMTP id g2-20020a05610209c200b00464600872b9mr1110337vsi.7.1701360882482;
        Thu, 30 Nov 2023 08:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701360882; cv=none;
        d=google.com; s=arc-20160816;
        b=VXrrahuW51hnkaIYIHqqmVzw+MKJeo+c+mh2OyfyIs0lK3bX9QHj8O2niKdy4ef3tN
         YD6F7n7CDtVqQvflYZpe+j8PYFoRAwJbRTtxUqg34U9invgXz9gGBB7W1OM5UWjISccP
         Nd3GBHQQuAHUxLtSw6E3PdF1lL48XAZPAMqNX08dgEGqu+fiQI3UfymsnGv588UGhr0H
         mbAlNaFcno/KNuqysoJbRpCbteU9XHr9BL/SyHetrRMzXucOJS/+uZb+V74jZlaRLXPT
         gRGy3558J9YX/+A1WWe9+MHbi13I9l1Mo+c4lMGjdFZITwNBJWg0uCeRu5+kviNS4I1w
         mD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:dkim-signature;
        bh=PzgD9NSDt1wLFQ6Fe6/x6CsYPeUumeQ1FyYdCSEk1v0=;
        fh=cgAQA+XUIsr4IqXjvxsNSbu6yUfPNOKZue5KQ1lizTE=;
        b=Je/GRZQYwyWTYXsf0I2tG2RMAE5F9tR7iTRWlKu/2nr/6Tn5x7mnZoP00DE4sziupk
         zWWOg4Glrq9JsuJzTZ4aiDl0drejPN4SaNJRa0gnfwH4xgm8Qy7KDbQOtCL90OG6qhkm
         x4juCw6itr8UQYP0oG3IWtnK1Kvr5p0lLggY6A3XqQfJh7vZQAQfDhoBypzl4sOOOO1s
         LiVV+8sl/lll2bGWENr2/8XejIToh5YWVCbZvIqKgNUGeslNti/oShMJ7MHe1g4sHH4y
         d672jLe/vet1ClZNjAr/bM5Q2JaHTk4+cbLgNPxsnZwcg7DVRZxiF8wS8QAovtJvjXWp
         z1BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=NNbXkdkc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s25-20020a67e359000000b004644f3e9896si265087vsm.598.2023.11.30.08.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Nov 2023 08:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=NNbXkdkc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8jgN-0006X2-4w; Thu, 30 Nov 2023 11:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1r8jgL-0006WZ-V4; Thu, 30 Nov 2023 11:14:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1r8jgJ-0003tx-NJ; Thu, 30 Nov 2023 11:14:29 -0500
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUFpvBH024284; Thu, 30 Nov 2023 16:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PzgD9NSDt1wLFQ6Fe6/x6CsYPeUumeQ1FyYdCSEk1v0=;
 b=NNbXkdkcUy3rFpaav//xasoFHIaPkll5qqo63SbgRLknolKLdVQN4C4UdvZJaB+yf4QL
 Q2o6iiRtM+ku9PA/E+k40FDUtF/KCpirhNtZTPb3wO5m21BPilCGlHfUNYxx09i6bupk
 HcWl7Dcav+4ZRDG+RrHfLB1dyBDpgBPKptgzZEd+KgxFXVzYVLIOsR7g5Tc6kmPyvJ0n
 3CxD2/AVeMv3Po8Ql/JEJJzU5urYyIvKQddA58GMv0Yj42gjbFqF+dAc0/jtZI7V/smb
 r49bZb6Rj16CR/+v25Yq7YSxHwMFFxkp/UrbUQI2PWDo6uUDKpk7zx7vKlbdY39Bmk/E DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3upwdkgtgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 16:14:13 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AUFrLmX028479;
 Thu, 30 Nov 2023 16:14:12 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3upwdkgtef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 16:14:12 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUDn2pt022155; Thu, 30 Nov 2023 16:14:11 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uku8tfeqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 16:14:11 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3AUGEA0A4915874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Nov 2023 16:14:10 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 587D358063;
 Thu, 30 Nov 2023 16:14:10 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B2CD58043;
 Thu, 30 Nov 2023 16:14:09 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 30 Nov 2023 16:14:08 +0000 (GMT)
Message-ID: <6733edbd-3e4c-40ef-b239-6f4180f40cb8@linux.ibm.com>
Date: Thu, 30 Nov 2023 10:14:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] Introduce model for IBM's FSI
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20231026164741.1184058-1-ninad@linux.ibm.com>
 <417e8a68-2f35-4315-b694-892f78c811b6@kaod.org>
 <a1fbfc7b-6f5a-44c4-9af4-65dac15763b6@linux.ibm.com>
 <1f2a6342-5d14-4549-bd44-1fe51f84f18d@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <1f2a6342-5d14-4549-bd44-1fe51f84f18d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cugjMBQozFNyU9vA1fPgwL4AesKHSqSi
X-Proofpoint-ORIG-GUID: OE8wTowrAgjT2ZD_EeIq8Vqn8Qx1JIoL
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_16,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=901
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300118
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
X-TUID: Im/9fEcF+oWt

Hello Cedric,

On 11/29/23 15:29, Cédric Le Goater wrote:
> On 11/29/23 15:56, Ninad Palsule wrote:
>> Hello Cedric,
>>
>> On 11/27/23 10:31, Cédric Le Goater wrote:
>>> Hello Ninad,
>>>
>>> On 10/26/23 18:47, Ninad Palsule wrote:
>>>> Hello,
>>>>
>>>> Please review the patch-set version 7.
>>>> I have incorporated review comments from Cedric, Philippe and Thomas.
>>>
>>>
>>> I reworked v7 with the suggestions I made in patches 1-6. Please 
>>> check :
>>>
>>>   https://github.com/legoater/qemu/commits/aspeed-8.2
>>>
>>> I will have more questions on the mappings because some parts are 
>>> really
>>> unclear.
>>>
>> I forgot to mention in my last mail. If I build against your 
>> aspeed-8.2 branch then rainier machine is failing to boot.
>>
>> The same images are working with qemu master branch.
>>
>> fsi/qemu-system-arm -M rainier-bmc -nographic -kernel 
>> ./fitImage-linux.bin -dtb ./aspeed-bmc-ibm-rainier.dtb -initrd 
>> ./obmc-phosphor-initramfs.rootfs.cpio.xz -drive 
>> file=./obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 -append 
>> 'rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a' -net nic -net 
>> user,hostfwd=:127.0.0.1:3222-:22,hostfwd=:127.0.0.1:2234-:1234 -trace 
>> 'fsi*'
>>                          |
>>                          |
>> Starting systemd-udevd version 254^
>> [   50.630407] /dev/disk/by-partlabel/rofs-a: Can't open blockdev
>> mount: mounting /dev/disk/by-partlabel/rofs-a on /mnt/rofs failed: No 
>> such file or directory
>> /bin/sh: can't access tty; job control turned off
>
> Hello,
>
> Please try with  '-M rainier-bmc,boot-emmc=false' to avoid using the
> boot emmc mode which is the default for the rainier machine.
>
> I just updated the aspeed-8.2 branch to take into account the -kernel
> option when booting the rainier.
That worked. Thanks!
>
>
> Thanks,
>
> C.
>
>
>
