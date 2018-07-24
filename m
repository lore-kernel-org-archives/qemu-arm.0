Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp7228173wru;
        Tue, 24 Jul 2018 13:37:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf7IOFmdtHs9mK22ujNwkgRfMkIb7y39+ktHeNHMFffzT+4h5Qt1ZxZR2eOSVKfqT/3EjZl
X-Received: by 2002:a37:139a:: with SMTP id 26-v6mr16706376qkt.129.1532464625563;
        Tue, 24 Jul 2018 13:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532464625; cv=none;
        d=google.com; s=arc-20160816;
        b=L7+WopAhsK4w/tAsquO48aKKFuFDQa+m30okRPqMiL/0pHyxXQjuQg2g2lzN/1yRaX
         pPC5C0mhzQOGj2f56sOelV4U6ZNk4OvwfsiHttC8M/Gle1sicx+qqZs+zbuHGU8ZHJA6
         SquOg/9xvOFIW6VRlINd4sCZD7xOS+71TEFruyNHIUyxCtQHPtrmgUtHJk03HjdL+ETE
         8uGcdnaV8QoyACdEED6YvZq+MPOIvJaAlT+BzFXxP0SJTAf3wuJeoDKdATQidHEUrgie
         BStd077LS7jHTbOq3CEmwp98T9P5FuJ1NeY10/Hpn86ol7SUgtYq2q9gDk6vdD+FWt85
         j1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature
         :arc-authentication-results;
        bh=6yxK09R0x+Vp29UgbtBHReQ8oQNrMKrSnbYV9H00WBI=;
        b=wbBmtPK8rW0Hkw9lcoJ5ypAwBH3Ip5j0UNzj+U0ze/+ZQ5VDG1Rh34GmmsEfE8+wi1
         HmZCSmSciBcXO3ewr7n7A4CiYMSFgyiTFYRx1aW+7Drl1TnV9MalMkP0cubnCrXHkBKw
         ytNGHAmD9P9orPTZrjWMmOvH5lAhkR8lzwLdDuXqlQ6NWQyq5SlZp+98d8f1KcUn27+X
         14yLOncdLmvxWiIbOFXZpEr7x+u7B+7QZGyYM4nkNR/EK9pd3+l2fLxFhyJHgkiksmFC
         ee3mkVrmlm0h0ejj8sAb31cRI+dBbu63UzeJCK+045WXIqDEZSMcezho2oxx6GHwLVLO
         K1vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@oracle.com header.s=corp-2018-07-02 header.b=QZTrndJ+;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id f125-v6si871948qkj.194.2018.07.24.13.37.04;
        Tue, 24 Jul 2018 13:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@oracle.com header.s=corp-2018-07-02 header.b=QZTrndJ+;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 867AF40493;
	Tue, 24 Jul 2018 16:37:04 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.392
X-Spam-Level: 
X-Spam-Status: No, score=-1.392 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@oracle.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ib8l6G4OcNOp; Tue, 24 Jul 2018 16:37:03 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 90E484A074;
	Tue, 24 Jul 2018 16:37:03 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 7BC7340493
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Jul 2018 16:37:02 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jAKfkzNTKk1 for <kvmarm@lists.cs.columbia.edu>;
 Tue, 24 Jul 2018 16:37:01 -0400 (EDT)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 2E96140184
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Jul 2018 16:37:01 -0400 (EDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w6OKYb23161286;
 Tue, 24 Jul 2018 20:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=+EhRdTPjaDE+oUtWMzSQOwaqKFesPyKlVIN4CjIES9Q=;
 b=QZTrndJ+Dn9INVuWiPRTz+m4sHHSa89VDMTy6K/7tdUfDXOntVAh0E5vT4V8XeX5PoRC
 DA/yc/Cz3PwEo/PizoSyAiIJnaFtPvDP179rmtRnONIw+WYQTOEU/gtxNwrUVXVarunu
 YBAVuFpEvHuyMA2Pk4kacuXdpVKYLKu5KWtLjy8smkZ0Kf0wbmkLb8TLBNvxdYkCSeBe
 cuxLD7M2L58+xoHgs/ppcteFg8+1n1uCU59oj6ArdLPUPjxRkquKN5AZt5S1qSe9u4M/
 uWt5ALzDsved5DNEeL3n8u/flShIlu5KZuaSk75c6w2OKXXUpCkJm1dSr99BMrE0PYmk zg== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
 by userp2120.oracle.com with ESMTP id 2kbwfptrb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Jul 2018 20:36:45 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w6OKahLP007304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Jul 2018 20:36:44 GMT
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w6OKafos026753;
 Tue, 24 Jul 2018 20:36:42 GMT
Received: from [10.141.197.71] (/10.141.197.71)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 24 Jul 2018 11:35:32 -0700
Subject: Re: VCPU hotplug on KVM/ARM
To: kvmarm@lists.cs.columbia.edu, bthakur@codeaurora.org
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
 <20180227104708.GA11391@cbox>
 <ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
 <20180227124604.GA2373@cbox>
 <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
From: Maran Wilson <maran.wilson@oracle.com>
Organization: Oracle Corporation
Message-ID: <b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
Date: Tue, 24 Jul 2018 11:35:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8964
 signatures=668706
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1806210000 definitions=main-1807240217
Cc: Christoffer Dall <cdall@cs.columbia.edu>,
 Christoffer Dall <cdall@kernel.org>, marc.zyngier@arm.com, david@redhat.com,
 qemu-devel@nongnu.org, Christoffer Dall <christofferdall@christofferdall.dk>,
 qemu-arm@nongnu.org, imammedo@redhat.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: epgipImoynBZ

It's been a few months since this email thread died off. Has anyone 
started working on a potential solution that would allow VCPU hotplug on 
KVM/ARM ? Or is this a project that is still waiting for an owner who 
has the time and inclination to get started?

Thanks,
-Maran

On 2/27/2018 5:21 AM, Andrew Jones wrote:
> On Tue, Feb 27, 2018 at 01:46:04PM +0100, Christoffer Dall wrote:
>> On Tue, Feb 27, 2018 at 05:34:28PM +0530, bthakur@codeaurora.org wrote:
>>> Hi Christoffer,
>>>
>>> Thanks for your reply.
>>>
>>> On 2018-02-27 16:17, Christoffer Dall wrote:
>>>> Hi Bhupinder,
>>>>
>>>> On Tue, Feb 27, 2018 at 03:01:17PM +0530, bthakur@codeaurora.org wrote:
>>>>> I hope it is the right forum to post my query.
>>>>>
>>>>>
>>>>>
>>>>> I am currently looking at the possibility of adding a new VCPU to a
>>>>> running
>>>>> guest VM in KVM/ARM. I see that currently, it is not allowed to add a
>>>>> new
>>>>> VCPU to a guest VM, if it is already initialized. The first check in
>>>>> kvm_arch_vcpu_create() returns failure if it is already initialized.
>>>>>
>>>> This would require a major rework of a lot of logic surrounding the GIC
>>>> and other parts of KVM initialization.
>>>>
>>>>>
>>>>> There was some work done in QEMU to add support for VCPU hotplug:
>>>>> https://lists.gnu.org/archive/html/qemu-arm/2017-05/msg00404.html
>>>>>
>>>>>
>>>>>
>>>>> But I am looking at the KVM side for enabling adding a new VCPU. If you
>>>>> can
>>>>> point me to any relevant work/resources, which I can refer to then it
>>>>> will
>>>>> help me.
>>>>>
>>>> I don't have any specific pointers, but I was always told that the way
>>>> we were going to do CPU hotplug would be to instantiate a large number
>>>> of VCPUs, and hotplug would be equivalent to turning on a VCPU which was
>>>> previously powered off.
>>>>
>>>> Is this not still a feasible solution?
>>> It should be a feasible solution provided the guest VM is not able to
>>> control the onlining/offlining of VCPUs. It should be controlled by the
>>> Host.
>>>
>> KVM could simply refuse to turn on some of the CPUs unless given
>> permission from host userspace.
>>
>>>> How does VCPU hotplug work on x86?
>>> On x86, you can add a vcpu through libvirt setvcpu command and it shows up
>>> in the guest VM as a new CPU if you do lscpu.
>>>
>> Sure, but what is the mechanism, does x86 qemu actually call
>> KVM_CREATE_VCPU, or is this also a question of turning on already
>> created vcpus ?
>>
> CC'ing Igor and qemu-devel
>
> drew
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
