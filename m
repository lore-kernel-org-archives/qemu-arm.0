Received: by 10.223.159.82 with SMTP id f18csp1041401wrg;
        Thu, 23 Nov 2017 10:03:06 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZQwmJ/LL8nwhbIOWmBNZo8Sce+F6IJHQO5QbTdGEWIhr9I28Ck2puTGGEvEmi6Mcab/u5Y
X-Received: by 10.37.33.11 with SMTP id h11mr15329961ybh.456.1511460186316;
        Thu, 23 Nov 2017 10:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511460186; cv=none;
        d=google.com; s=arc-20160816;
        b=XrP8soDg0kweUJn8VQ01qYy5bhDPq9NJLG7NtQ3usy2WoRdH5ZDVtVJ0TJEWJlVwTZ
         EBvbwbjAY2rrdEssn0yWqPQ7ThZzxL9N1jDQM9c8VbidojbLVo86TwTVEBrnHHLo98/3
         GtsiTSwb6flbIBud3yk2HkPn1ccHGK+c4PdvcjxfapnKCQRUIjlN+sJcZlYo9eYkAAsp
         mVgf9igJlVbC/NAO23sx1puSILZcHyDr4UgOX3ypOO7AunFPiTdNuLOTVA5vAmDbB3xu
         cklJ1eFza9KPQy0cspLT0PbrE3SggNcYTDljVigYHb28oTVJUCSB2LHpIZLUpSNJ7k6q
         8AKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:from:references:to:arc-authentication-results;
        bh=g44JP7oeuQYQEywvMHrMqXuL0KqbBSxTDpF3CGJnobk=;
        b=QrsgRp6RIw2eaHeTZoKXASe9tMl8aA2iY0Ei8XIJ6d+2mpWy67ZfkUNNZvb5xdtxCX
         U+TgpLsGqoNbw3qRzGnCOnuqq/6nrcngyYC+nZKZsKSpWxxa0n4RTxcWeIDYRCEFyXws
         8LwjGCcVEduidBYv0GM2z1OAYCH8/SJal4vWK7ZVKLCRifE+ESV5KO58wDRW1PXzlvgq
         rGMhZf7g88GafgQsUQgAxvDxKT1IFRGltjhvPYV993/Fa/caGbPx/GF7bNR/kgEr1rzN
         PACAg9KveIuaUE7VFpuG8awexF5KEPYWW662u0uDz4kpQfDf934NdlXQ/JWnEGWbCuss
         RA1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i188si3557693ybi.368.2017.11.23.10.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 10:03:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:45554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHvq5-0000uv-PX
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 13:03:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1eHvp2-0000TU-Da
	for qemu-devel@nongnu.org; Thu, 23 Nov 2017 13:02:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1eHvoy-0003RP-QG
	for qemu-devel@nongnu.org; Thu, 23 Nov 2017 13:02:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36794
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1eHvoy-0003PG-LP
	for qemu-devel@nongnu.org; Thu, 23 Nov 2017 13:01:56 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vANI0U5W131674
	for <qemu-devel@nongnu.org>; Thu, 23 Nov 2017 13:01:53 -0500
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2ee1etkvx0-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 23 Nov 2017 13:01:53 -0500
Received: from localhost
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <borntraeger@de.ibm.com>;
	Thu, 23 Nov 2017 18:01:51 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 23 Nov 2017 18:01:47 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id vANI1llV36569128; Thu, 23 Nov 2017 18:01:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAC37A4055;
	Thu, 23 Nov 2017 17:56:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A034A4051;
	Thu, 23 Nov 2017 17:56:25 +0000 (GMT)
Received: from oc7330422307.ibm.com (unknown [9.145.174.206])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 23 Nov 2017 17:56:25 +0000 (GMT)
To: Auger Eric <eric.auger@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8T4cShPYONdo8hiaZKvd+zq9Uo1o5awU3rA03uu8Vsiw@mail.gmail.com>
	<1bede1e5-cc11-dca6-9f0b-ef16b9031d7a@redhat.com>
	<CAFEAcA_ZUGR+t2T3cvVo2OkyOccVjtRW+YTN-5KXaw+rFRiRqg@mail.gmail.com>
	<20171123181402.627fd5df.cohuck@redhat.com>
	<f3a550ab-5eff-1c9c-15e0-32ac70a4c2a6@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Thu, 23 Nov 2017 19:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <f3a550ab-5eff-1c9c-15e0-32ac70a4c2a6@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17112318-0040-0000-0000-00000411E6C1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17112318-0041-0000-0000-000020B4B905
Message-Id: <619fb88b-7ab1-a48a-a82c-53c21c691807@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-11-23_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1711230244
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [RFC v3 0/4] vITS Reset
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	wanghaibin.wang@huawei.com, wu.wubin@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qbyxzNbhRPen



On 11/23/2017 06:44 PM, Auger Eric wrote:
> Hi Cornelia, Peter,
> 
> On 23/11/17 18:14, Cornelia Huck wrote:
>> On Thu, 23 Nov 2017 17:01:32 +0000
>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>>> On 23 November 2017 at 16:05, Auger Eric <eric.auger@redhat.com> wrote:
>>>> When using update-linux-headers.sh I get suspicious errors at the end:
>>>> grep: /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such file or
>>>> directory
>>>> sed: can't read /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such
>>>> file or directory
>>>>
>>>> and include/standard-headers/asm-s390/virtio-ccw.h deletedch
>>>>
>>>> I would prefer having s390 people checking and testing that.  
>>>
>>> I think the kvm_virtio.h problem should be fixed by
>>> http://patchwork.ozlabs.org/patch/838230/
>>> which removes it from the set of headers the script imports.
>>>
>>> Cornelia/Christian -- any idea about the virtio-ccw.h issue ?
>>>
>>> thanks
>>> -- PMM
>>
>> I had that commit queued for post-2.11, but I can also send it for 2.11.
>>
>> The virtio-ccw.h one looks weird... if I run the script on my s390-next
>> branch against recent-ish Linux master, I just get the SPDX notice
>> update for virtio-ccw.h.
>>
> 
> http://patchwork.ozlabs.org/patch/838230/ effectively fixes all issues:
> - no errors anymore and
> - no deletion of include/standard-headers/asm-s390/virtio-ccw.h anymore,
> which is consistent with include/standard-headers/asm-s390/virtio-ccw.h.
> 

I assume the vITS code is post 2.11? If not, we can certainly submit 3 or 4 
s390 patches (including 838230) for 2.11.

