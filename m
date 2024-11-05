Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3013515njc;
        Tue, 5 Nov 2024 10:02:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWY6zv4DwiNL6bd0EXvk3YJ6P4AIYh5mxf/jDXAAysze4pc0ciChwU6MWIzEGKp16kvTAp92hNw0bWgcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEy6CFRUPmUyC2JSR/w/+I8QC76jp+w/ANPyflXlxUqK+GVgOWJYNJTPz4FmjOX02nGRbgv
X-Received: by 2002:a05:6102:f08:b0:4a3:c9b6:b311 with SMTP id ada2fe7eead31-4a8cfd56f70mr36307137137.26.1730829774473;
        Tue, 05 Nov 2024 10:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730829774; cv=none;
        d=google.com; s=arc-20240605;
        b=GOqRYo7SPYJtYVXijNaOAefhOa0eLcPjttj/C4XMsHIiHIBgc/auHkfL3FqBdrWkYK
         zNCeXuamXihYlAQy1o6mrkfnxDSf2ss1FI6y0boK8hDI3DPJu+D5ZWXuFnfYhq46J1yo
         jzZG5vwWgZxGqWo6TMoT5xcMsIv1a3ZC1CtuBrPMQAqVbW6Nw5mmkMuxl6Jqhorpb2aE
         EDgfG9ZhrhEVcRHFwhtnnJ1lBdZm5h1BFNabYrvKckj8fAdZ8tjOBMGNQuiz3GDTA+9N
         msHjBtNH9NWsDxjswGdC4uwqukG5Hcs9RM0oIPNbhw1P0H/6duAmbfwib+0dJrvLy7dy
         LV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q1ZXtIszTL0ij5xZwWpRms3SWOKXettJqRoH6LbYAgY=;
        fh=f8RoGae6YR6/W+bdd1Qvt18k2KHzEO8CHqSY1AFrB0c=;
        b=fyQneKcJM3uheD1lo3qEPygC2byWgNrpNxMbODnZmtUQ+WkW286FL7xyj+PUn7bEpG
         0l4i6Q3uuxV0AxjQxgIJzEcGmTvX5ZGy5Q6PCuJ0EbpY4mQre6FDllRnoa1/5nAV2iIM
         xtMivsnQ2aN7FXzlt41ortGDJDjM2vexwcrTdV0i5PafRjUoKnMyCOETPgAqEuop9lMg
         6hePzM7A/5q1wjNWG3ViMu5UiVyfwbYZIHzkE/vEQGIH+PZWrov7n9tJ/9sIcFNg/6MB
         JNU0o/mIoDek8ecH3sL6lZjYPwxbCnHGIPd2MrCB3upT20lSYIKBm/a6y0DMVo0Ch1CC
         bWmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=PcSmgIi7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a957468470si3149131137.14.2024.11.05.10.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 10:02:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=PcSmgIi7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Nt1-0005KL-VI; Tue, 05 Nov 2024 13:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1t8Nsz-0005Hq-LM; Tue, 05 Nov 2024 13:02:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1t8Nsy-0004Bh-3J; Tue, 05 Nov 2024 13:02:37 -0500
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5HeMBh022429;
 Tue, 5 Nov 2024 18:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=Q1ZXtI
 szTL0ij5xZwWpRms3SWOKXettJqRoH6LbYAgY=; b=PcSmgIi7Cog0A5z6NQccmh
 1g5QyORnQbuKwVHWIE73i7BecrdY7Zq8QqR4p70M9RFNqWLnUiRBHlCn380xkjID
 3+MZEuGG50xmRGDST/f4aoaYl5I0oi+ivcmWtVCsSS6deijmafn/0XOJKG6cna4x
 Nae8iBEE3W+iFIJK4ORyyUHzUtL+mDlBnbGJEBAbQKnJ7VSEKd2CVkHI0jLvrAkr
 818fiOy8A8TNs8vwQxlrPpVmcDHQsHOg1acLEaab3PlRuI7Ty/22HDq6KtDZhBR6
 a0ykhrSgfedTgJmh3Mzo1kKIz2oCqYjiac+G2YsRFiOMpisetRh7Ou7xxeEct5pA
 ==
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42qqy5r2v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2024 18:02:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5H1jK4023919;
 Tue, 5 Nov 2024 18:02:30 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nxsyaypg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2024 18:02:30 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 4A5I2TWC54919626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2024 18:02:30 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAF2058052;
 Tue,  5 Nov 2024 18:02:29 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84D3C58056;
 Tue,  5 Nov 2024 18:02:29 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2024 18:02:29 +0000 (GMT)
Message-ID: <2491bc60-9a0b-486a-8f6d-2c4c94332756@linux.ibm.com>
Date: Tue, 5 Nov 2024 13:02:29 -0500
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
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAFEAcA84hhWu2ouirfDPbCpq_=QLQxAf3k47h0Pij8iEnOVj+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xlIJmz_ao9sJL686FeUtR_P5elNvKOmI
X-Proofpoint-GUID: xlIJmz_ao9sJL686FeUtR_P5elNvKOmI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050135
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
X-TUID: MZeyUSeXV6Yu



On 11/5/24 12:13 PM, Peter Maydell wrote:
> On Tue, 5 Nov 2024 at 17:02, Stefan Berger <stefanb@linux.ibm.com> wrote:
>> On 11/5/24 11:14 AM, Peter Maydell wrote:
>>> Q1: why is apparmor forbidding swtpm from doing something that
>>> it needs to do to work?
>>
>> What distro and version is this?
>>
>> The profile may be too strict and not reflecting all the paths needed
>> for running the test cases. Ubuntu for example would have to update
>> their profile in such a case.
> 
> This is Ubuntu 22.04 "jammy" (with swtpm 0.6.3-0ubuntu3.3).
> 
>>> Q2: is there a way to run swtpm such that it is not
>>> confined by apparmor, for purposes of running it in a test case?
>>
>> Try either one:
>> - sudo aa-complain /usr/bin/swtpm
>> - sudo aa-disable /usr/bin/swtpm
> 
> We don't have root access from QEMU's 'make check',
> though (and shouldn't be globally disabling apparmor
> even if we could). I had in mind more a way that an
> individual user can say "run this swtpm process but don't
> apply the apparmor profile to it".

So the problem is that the avocado tests are using /var/tmp but we only 
have AppArmor rules for /tmp/

The following solutions should work:
- do not install swtpm at all
- sudo cp /usr/bin/swtpm  /usr/local/bin/swtpm
- as root: echo "include <abstractions/user-tmp>" >> 
/etc/apparmor.d/local/usr.bin.swtpm && apparmor_parser -r 
/etc/apparmor.d/usr.bin.swtpm


Lena, it looks like we would need the following additional line in the 
profile:

include <abstractions/user-tmp>

> 
>>> Q3: if not, is there a way to at least detect that swtpm is
>>> broken on this system so we can skip the test case?
>>
>> It's not swtpm that is broken but the AppArmor profile is too strict.
>> Above command lines should work.
> 
> But this is a widely deployed distro in its default
> configuration. We have to either work with it or detect
> that it's broken so we can skip the test.

Cc'in Lena from Ubuntu.

> 
> thanks
> -- PMM

