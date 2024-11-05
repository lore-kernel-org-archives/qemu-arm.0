Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3035040njc;
        Tue, 5 Nov 2024 10:36:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWy2eF3uFF7mSvxvPr2WTdE1pdCGziDwngYGbXgmtBW0hDQKWi/unblOQ48wLw8OJEC0p0mTTXzSILqFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEBugmvX9SWBDsqssoLnoUnaAYjWAAzjAGOheKJVG/XS3VmPaH3pZgKn9X7Banc1V/6vsyW
X-Received: by 2002:a05:6214:4188:b0:6cb:d512:e6e6 with SMTP id 6a1803df08f44-6d35c14e09bmr201118646d6.23.1730831780896;
        Tue, 05 Nov 2024 10:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730831780; cv=none;
        d=google.com; s=arc-20240605;
        b=JaviRp4SPVGGDSq5U/tbJJP7foJVCMYeseVaki6M8mPuASo3w1lISZd2HU41B9dNNn
         G/pGb60DLcZi9rI8Mrlm0OcKZlC5NmZJoJIaMnOnnyIoEt/x/1VA7cMUDedQeIMXma0O
         Db/uJiDSoHSclha4mRCEbRkj4YXK447RAwI9EGunqhC18Svj/l9K0KJNBmg5Mx0H3tMC
         cygOk6KA/hYRKpp0mv+zmKfLqgY1yW/mxKPJ3c+sDiEfU2jXSMqVcbJNUg/sUIwZDlZH
         ahflvtQy95yDdsERxHN1fd6ImLEqf3nec7aA2UOQfnFSOaQRHnaOfkXlmUIfXih7skDz
         YSow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wc7f2Hrr1rAEYSxyfo0HmCBarTs+hABQdxgNXKiFOt8=;
        fh=f8RoGae6YR6/W+bdd1Qvt18k2KHzEO8CHqSY1AFrB0c=;
        b=V+n8Wxlt4O8cScBYx/WNs2hacER/sCE7q19+ovi0LDaQC3ji+OwQUU7pz+qkd8Knag
         d9fcYZdr4uKwqiP6ouczSsxBF6VX693Kdtzx9thzng104vzCGsZFrxxcfHKNxqjofKCa
         kK6VWQqpGr6IaacGKf5GaItskSKmOcZ1XTklWnf+7OywHV8sBQ2wC8JEp7Im1/anJaay
         koDk26q+O7NixCQMBXxczSPxO+QJ6DgyQPyUsLK6B1KA9zk0ipDLBLVnk01CN0GgEmwA
         OuDQd/ic/WavwI0yOxBw7PjxE0ZqJnUzzD3yCnPCOJ42Dwwe20qviQkJLUrvxoqFafWv
         mVGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=DQM4Iimo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35416a821si134809926d6.294.2024.11.05.10.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 10:36:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=DQM4Iimo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8OPS-00069d-F3; Tue, 05 Nov 2024 13:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1t8OPQ-00068s-Ln; Tue, 05 Nov 2024 13:36:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1t8OPN-0007e0-NO; Tue, 05 Nov 2024 13:36:08 -0500
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5HeAdX022178;
 Tue, 5 Nov 2024 18:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=wc7f2H
 rr1rAEYSxyfo0HmCBarTs+hABQdxgNXKiFOt8=; b=DQM4IimoXgbMzlUwM8eGTh
 foETMWKg/r1YjxfdwpTULaVwMtzVo9+WgHDFL5fdrE3eDxQl4KHE5YTxe3YaGd7P
 1crxHUVAkaMubYaX3hD/2BSqCaGyoQP6JeptVx1k24U10JT56P99R15fVYsm+3MJ
 64YpynhsLh9hVvCQkdAIr6IA1HTRA22wJ7wrN9T7FNqQeOi545E7EJSfeSlZtG78
 wFILAIAva99AvU5WutNxV4R6auGy+rud9dXiS/YTshfVBcEZYpkEbkwFLhTHqaGU
 WHsQkpvU7oAFhe0PI7ktH/JXm+I/l/jDbDXOpY6lDzWRhSlrcBVX70JG4trBSZ0A
 ==
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42qqy5r8xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2024 18:36:00 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5HhPqL019414;
 Tue, 5 Nov 2024 18:36:00 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p0mj4jd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2024 18:36:00 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 4A5IZxew57737584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2024 18:35:59 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B349158056;
 Tue,  5 Nov 2024 18:35:59 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 527C258052;
 Tue,  5 Nov 2024 18:35:59 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2024 18:35:59 +0000 (GMT)
Message-ID: <e6c33df3-49e9-4b8a-b7cb-d38c2ebee3be@linux.ibm.com>
Date: Tue, 5 Nov 2024 13:35:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 10/17] tests/functional: Convert most Aspeed machine tests
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, lena.voytek@canonical.com
References: <20241024063507.1585765-1-clg@redhat.com>
 <20241024063507.1585765-11-clg@redhat.com>
 <CAFEAcA8A=kWLtTZ+nua-MpzqkaEjW5srOYZruZnE2tB6vmoMig@mail.gmail.com>
 <91c2ac92-66b2-45c8-b4fe-e8f8587b0e9c@linux.ibm.com>
 <CAFEAcA84hhWu2ouirfDPbCpq_=QLQxAf3k47h0Pij8iEnOVj+A@mail.gmail.com>
 <2491bc60-9a0b-486a-8f6d-2c4c94332756@linux.ibm.com>
 <CAFEAcA85g2nX3MU5RzmBvAHT8Kis1JHhiEaBvnFFbEQkG+0OxQ@mail.gmail.com>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAFEAcA85g2nX3MU5RzmBvAHT8Kis1JHhiEaBvnFFbEQkG+0OxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JNkWtJIMtNaM7AU7DsAWOG8nwzTg7wE4
X-Proofpoint-GUID: JNkWtJIMtNaM7AU7DsAWOG8nwzTg7wE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050143
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: m/03pgifkBuk



On 11/5/24 1:12 PM, Peter Maydell wrote:
> On Tue, 5 Nov 2024 at 18:02, Stefan Berger <stefanb@linux.ibm.com> wrote:
>>
>>
>>
>> On 11/5/24 12:13 PM, Peter Maydell wrote:
>>> On Tue, 5 Nov 2024 at 17:02, Stefan Berger <stefanb@linux.ibm.com> wrote:
>>>> On 11/5/24 11:14 AM, Peter Maydell wrote:
>>>>> Q1: why is apparmor forbidding swtpm from doing something that
>>>>> it needs to do to work?
>>>>
>>>> What distro and version is this?
>>>>
>>>> The profile may be too strict and not reflecting all the paths needed
>>>> for running the test cases. Ubuntu for example would have to update
>>>> their profile in such a case.
>>>
>>> This is Ubuntu 22.04 "jammy" (with swtpm 0.6.3-0ubuntu3.3).
>>>
>>>>> Q2: is there a way to run swtpm such that it is not
>>>>> confined by apparmor, for purposes of running it in a test case?
>>>>
>>>> Try either one:
>>>> - sudo aa-complain /usr/bin/swtpm
>>>> - sudo aa-disable /usr/bin/swtpm
>>>
>>> We don't have root access from QEMU's 'make check',
>>> though (and shouldn't be globally disabling apparmor
>>> even if we could). I had in mind more a way that an
>>> individual user can say "run this swtpm process but don't
>>> apply the apparmor profile to it".
>>
>> So the problem is that the avocado tests are using /var/tmp but we only
>> have AppArmor rules for /tmp/
> 
> The file AppArmor gives the error for is not in /var/tmp:
> it's in a local directory inside QEMU's build dir:
> 
> Nov  5 16:01:14 e104462 kernel: [946406.489088] audit: type=1400
> audit(1730822474.384:446): apparmor="DENIED" operation="mknod"
> profile="swtpm"
> name="/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/tests/functional/arm/test_arm_aspeed.AST2x00Machine.test_arm_ast2600_evb_buildroot_tpm/qemu-machine-hhuvwytc/.lock"
> pid=2820156 comm="swtpm" requested_mask="c" denied_mask="c" fsuid=1000
> ouid=1000
>> The following solutions should work:
>> - do not install swtpm at all
>> - sudo cp /usr/bin/swtpm  /usr/local/bin/swtpm
>> - as root: echo "include <abstractions/user-tmp>" >>
>> /etc/apparmor.d/local/usr.bin.swtpm && apparmor_parser -r
>> /etc/apparmor.d/usr.bin.swtpm
> 
> Is there no way to just have apparmor not apply at all
> here? I can see why you might want it to apply for the

If you are root you can change things. I have shown the options using 
aa-complain and aa-disable that you can revert once the test has 
finished: sudo aa-enforce /usr/bin/swtpm

You could also copy swtpm into a user-owned directory but you will have 
to adapt the user's PATH. That's an easy option.

The most compatible option is the 3rd option since I would expect that 
we will have this rule in a future version of the usr.bin.swtpm Ubuntu 
profile provided by the swtpm package:

echo "include <abstractions/user-tmp>" >> 
/etc/apparmor.d/local/usr.bin.swtpm
apparmor_parser -r /etc/apparmor.d/usr.bin.swtpm

> case of "I'm using it as part of a sandboxed VM setup",
> but in this scenario I am a local user running this binary
> which is not setuid root and it is accessing a file in a
> directory which my user owns and has permissions for.
> This should not be being rejected: there is no security
> boundary involved and swtpm is not doing anything
> that I could not directly do myself anyway (as you
> can tell from the fact that copying the swtpm binary
> to a different location and running it works).

I am not aware of how user/non-root-started programs can be generally 
made exempt from AppArmor.

There may still be a security boundary if a user runs QEMU and swtpm was 
able to manipulate (with malicious input) the user's files in some 
undesirable way or copy the user's data elsewhere. In this case it may 
be desirable for the user that the profile be applied and the PATH he is 
using points to the standard swtpm.

> 
> thanks
> -- PMM
> 

