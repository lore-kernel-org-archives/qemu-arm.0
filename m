Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2160902wrp;
        Thu, 26 Sep 2019 06:46:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx447MrE2PBJsyvvjYTTbporYzEIpz5a0S3V68X2O8ysbTHxtkjBVo/kw+VR05qT7Nb/Nzl
X-Received: by 2002:a25:a3a3:: with SMTP id e32mr2004550ybi.328.1569505571698;
        Thu, 26 Sep 2019 06:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569505571; cv=none;
        d=google.com; s=arc-20160816;
        b=PRHF6AcrDdi+FObnDty2Vvc+namcCOlizLK9By8MYRRvQTNgCvrcbiZOJsXXje/wMy
         Y4eoMBL/tWos5/tsRqlABOauhleDmrZzAKl1ibyz6C6aBcVCS6j1/CmgYsLThUzj/+Xw
         Wd1b2DvzDn+zZmvTz5nHJ6drgRD3JwGt6Wn4UyXjj9TDnasWknw+1xfzSETc3gr7z5vj
         MD8HOYtSjEe0PhXVsZ0W6zDL58fN0s//pWoRYtiNfsP3fI2NeLfQdJl+wcwEHBkbsT7y
         XcolRBkDeVLy8y/pPPCoRpi3jFBRpDNWt2hj8SXf3RrfD0Yeo8pLDFKDW5MCuyobYQHc
         5P4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:content-transfer-encoding:content-language:in-reply-to
         :mime-version:user-agent:date:autocrypt:openpgp:from:references:cc
         :to:subject;
        bh=frfevXMbu6CP6IEz3fpsi4H9MUZu8dYmXDltupelVjE=;
        b=iV5mit8+eAal7VnQSH+ONUJnakipvzLVQCG+7eyi+LLehMEbrfL37Tx0amIIEmFQ4k
         UXX2UO/FZfJt/QKxxqosDKA0cIFW0rr0SptBktDGq6wasat4/16nMjIRbbaoA/G7TNdq
         UQqHJ0J9/dhIB99ap2wvnOt9IAQSJ1T+0oIb6mM/Al8ozNU3rWz03X88209jJXjocX2a
         O/7Lu1sl1kdJTKR2VQthfWVLEFZ+iYkH+uudYVZlaHScXQmnTHywqYlyLaVb2vIUaYL/
         aCPBBojfSHuAaOhjgOHPPxJOner80PA+BF5yvFjFT5/4QJLTKPsdBpisbEQ1rwzb9nmW
         Zs+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of borntraeger@de.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=borntraeger@de.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <borntraeger@de.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id f65si796427ywb.191.2019.09.26.06.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 06:46:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of borntraeger@de.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of borntraeger@de.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=borntraeger@de.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x8QDbWXD053336
	for <alex.bennee@linaro.org>; Thu, 26 Sep 2019 09:46:07 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2v8wwqab6n-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <alex.bennee@linaro.org>; Thu, 26 Sep 2019 09:46:07 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <alex.bennee@linaro.org> from <borntraeger@de.ibm.com>;
	Thu, 26 Sep 2019 14:46:06 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 26 Sep 2019 14:46:02 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x8QDk1uC47251496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Sep 2019 13:46:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8C2F4C046;
	Thu, 26 Sep 2019 13:46:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EFE94C044;
	Thu, 26 Sep 2019 13:46:00 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.146])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 26 Sep 2019 13:46:00 +0000 (GMT)
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-discuss <qemu-discuss@nongnu.org>,
        qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
        qemu-ppc@nongnu.org,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <20190926125817.GB19660@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 syiRa+UVlsKmx1hsEg==
Date: Thu, 26 Sep 2019 15:46:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926125817.GB19660@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092613-0008-0000-0000-0000031B5904
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092613-0009-0000-0000-00004A39F4A5
Message-Id: <ea6b671a-0c05-d880-3b9f-62a4f8626ec1@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-26_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909260127
X-TUID: roKMzOKuBwFZ



On 26.09.19 14:58, Daniel P. Berrangé wrote:
> On Thu, Sep 26, 2019 at 08:50:36AM +0100, Peter Maydell wrote:
>> On Thu, 26 Sep 2019 at 00:31, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> The 32 bit hosts are already a second class citizen especially with
>>> support for running 64 bit guests under TCG. We are also limited by
>>> testing as actual working 32 bit machines are getting quite rare in
>>> developers personal menageries. For TCG supporting newer types like
>>> Int128 is a lot harder with 32 bit calling conventions compared to
>>> their larger bit sized cousins. Fundamentally address space is the
>>> most useful thing for the translator to have even for a 32 bit guest a
>>> 32 bit host is quite constrained.
>>>
>>> As far as I'm aware 32 bit KVM users are even less numerous. Even
>>> ILP32 doesn't make much sense given the address space QEMU needs to
>>> manage.
>>
>> For KVM we should wait until the kernel chooses to drop support,
>> I think.
> 
> What if the kernel is waiting for QEMU to drop support too ;-P

For what its worth on kvm/s390 we never cared about implementing
32 bit. 

> 
>>> @@ -745,19 +744,22 @@ case "$cpu" in
>>>    ;;
>>>    armv*b|armv*l|arm)
>>>      cpu="arm"
>>> -    supported_cpu="yes"
>>>    ;;
>>
>> I'll leave others to voice opinions about their architectures,
>> but I still have 32-bit arm in my test set for builds, and
>> I'm pretty sure we have users (raspi users, for a start).
> 
> RHEL dropped all 32-bit host support a long time ago, so Red Hat
> don't care for our products.
> 
> Fedora has recently stopped building i686 kernels and thus also no
> long composes i686 installs. Some users complained, but ultimately
> no one cares enough to step forward as maintainers.
> 
> That leaves armv7 as the only 32-bit arch in Fedora that is somewhat
> active & maintained. I don't have any real insight on whether any
> armv7 (Fedora) users are making much use of QEMU/KVM though, either
> system or user emulation. 
> 
> Our preference in Fedora is to have things built on every architecture
> that the distro targets, but if upstream developers explicitly drop an
> architecture we're not going to try to add it back.
> 
> Regards,
> Daniel
> 
