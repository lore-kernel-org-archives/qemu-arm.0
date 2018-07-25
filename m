Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp941194wru;
        Wed, 25 Jul 2018 10:26:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcq1KyUD+6+P0hh5xxPwlB6yzLGAY120/u0iIVBUKiJpTNJ6z4oOSTiCaisuiMqCEI3HJbi
X-Received: by 2002:a37:5e82:: with SMTP id s124-v6mr19955278qkb.313.1532539590704;
        Wed, 25 Jul 2018 10:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532539590; cv=none;
        d=google.com; s=arc-20160816;
        b=c0PWgN4ED3+I2Nzel3/t45bzcfJPEooSaQKi0v9yOaqG98ZuUaC0Swio6LKIXW4OOc
         buhgaLyvOm1kIzXhU26BdwWDdEQ2McwS1EWPXsidiUeT/kSlsRr3o8I7SZRQsblrr8Gj
         gxmC2aQ9pAQLQ7KJM9UzIgO25AAn27BXoSYBkKrUcierNFn1rCA8XaEkGyXRuMZQbF95
         r7wpF0lFNFTTi7mb1kknEJQd+66pTw621lB0ByVL487Ksjjv/tSG/dr8gtu7JOlhierR
         gdYtHm8U1M4gOP9Op9gRO+YXXLYCdg92Pdo8q3lC+5jJzGj3n4RxalRaRwEne9zGH8Ey
         whzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature
         :arc-authentication-results;
        bh=zrJzOrXD20Uy9ZJkhrpjEPJ8kf0XgBnRvfGVnvCBpgo=;
        b=qWLwxWhfqj0wE4KxIBC/n1D//R5i1mCyOjc8DFxls/9RG6dxktBlJJzSoWz6JxFZrs
         tnOHV6yrxoKuCnxGkaATHl9oB0ZMCGGiQKyJkJCAre6RoPOEUQC/YcMFVBvKI3gMmCH8
         x+1L+nFnzkXICMAt47BYArHgRXr9chf5JEPijrG2GQLKcndt9gCwU2vYiWYEzE9kJsAf
         ZRfeWP+ih/VGAHlPzTiXhrH6nPVJVjD/Ls1RfxV6aGRBkqMuL6nfZOz9CgwxP6VzSDi/
         pd43ZfIb0JkPCya89BmYuA18U9fQLfON8h+gtO96snrJg4wcr4dDv5odx24exHOWBc6+
         uOtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@oracle.com header.s=corp-2018-07-02 header.b=AhYL4Isr;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 42-v6si3825291qkp.389.2018.07.25.10.26.30;
        Wed, 25 Jul 2018 10:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@oracle.com header.s=corp-2018-07-02 header.b=AhYL4Isr;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 5C0634A15E;
	Wed, 25 Jul 2018 13:26:30 -0400 (EDT)
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
	with ESMTP id ijyMb4bNl2mJ; Wed, 25 Jul 2018 13:26:29 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 62E434A0F9;
	Wed, 25 Jul 2018 13:26:29 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 1BDDC4A0F9
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Jul 2018 13:26:28 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5vTD3PndU7h for <kvmarm@lists.cs.columbia.edu>;
 Wed, 25 Jul 2018 13:26:27 -0400 (EDT)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id DB47C404D9
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Jul 2018 13:26:26 -0400 (EDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w6PHNrBl102594;
 Wed, 25 Jul 2018 17:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=MOT52SG8q7c2WoljAi+yf+DT9Yve7ekf8gPU7hq2iD4=;
 b=AhYL4IsrK3W2+XLBRoOHfTVc5vAl7xsHuar5K9EbpBGYgxJuZzKgUVlPcIKPxT9OLoN4
 pEgKZ28buPIlTxvK6Fx42km9SBfg9SHdB8jqT10x938IN2yxRgAhV55IK0lxuRNMPLw+
 /j0XqQP9ixzI6OGpZ7TqAFvZDp5eqxMhyoAVMJ/3ndCbOF6ddw3QUyosjj1pzmBc/l79
 Z/eZwnTr+nUsoco/PBYGm9AymOO13C1vi4sz4ACLtCmotLkpEQcvwGVdVr/XUex58Rkr
 U4AhXM2LpDTIVxxagpIu/aeonzxmICS2A4yIeERAoq/7VffIrrW+PbCezxo62h21ikYS jw== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
 by aserp2120.oracle.com with ESMTP id 2kbvsnxf37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Jul 2018 17:26:09 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w6PHQ8Kf030802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Jul 2018 17:26:08 GMT
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w6PHQ7qr029490;
 Wed, 25 Jul 2018 17:26:07 GMT
Received: from [10.141.199.39] (/10.141.199.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 25 Jul 2018 10:26:06 -0700
Subject: Re: [Qemu-devel] VCPU hotplug on KVM/ARM
To: Marc Zyngier <marc.zyngier@arm.com>, Andrew Jones <drjones@redhat.com>,
 imammedo@redhat.com, kvmarm@lists.cs.columbia.edu
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
 <20180227104708.GA11391@cbox>
 <ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
 <20180227124604.GA2373@cbox>
 <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
 <b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
 <74427c65-b860-d576-04f9-766253285210@arm.com>
 <20180725122806.g2gpvdbrbdkriprg@kamzik.brq.redhat.com>
 <202a2c63-1a3e-7f01-850c-4fb5e48f43e7@arm.com>
From: Maran Wilson <maran.wilson@oracle.com>
Organization: Oracle Corporation
Message-ID: <fd9e6f7e-3ede-2f73-effe-cc0d3afce22c@oracle.com>
Date: Wed, 25 Jul 2018 10:26:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <202a2c63-1a3e-7f01-850c-4fb5e48f43e7@arm.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8964
 signatures=668706
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1806210000 definitions=main-1807250185
Cc: Christoffer Dall <cdall@cs.columbia.edu>,
 Christoffer Dall <cdall@kernel.org>, david@redhat.com, qemu-devel@nongnu.org,
 Christoffer Dall <christofferdall@christofferdall.dk>, qemu-arm@nongnu.org
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
X-TUID: Wh2BcRrN57nr

Thanks everyone. It sounds like there is consensus around how best to 
proceed (at a high level at least).

Since Igor has already gotten started, I'll coordinate with him offline 
to see where I can jump in.

Thanks,
-Maran

On 7/25/2018 6:07 AM, Marc Zyngier wrote:
> On 25/07/18 13:28, Andrew Jones wrote:
>> On Wed, Jul 25, 2018 at 11:40:54AM +0100, Marc Zyngier wrote:
>>> On 24/07/18 19:35, Maran Wilson wrote:
>>>> It's been a few months since this email thread died off. Has anyone
>>>> started working on a potential solution that would allow VCPU hotplug on
>>>> KVM/ARM ? Or is this a project that is still waiting for an owner who
>>>> has the time and inclination to get started?
>>> This is typically a project for someone who would have this particular
>>> itch to scratch, and who has a demonstrable need for this functionality.
>>>
>>> Work wise, it would have to include adding physical CPU hotplug support
>>> to the arm64 kernel as a precondition, before worrying about doing it in
>>> KVM.
>>>
>>> For KVM itself, particular area of interests would be:
>>> - Making GICv3 redistributors magically appear in the IPA space
>>> - Live resizing of GICv3 structures
>>> - Dynamic allocation of MPIDR, and mapping with vcpu_id
>> I have CPU topology description patches on the QEMU list now[*]. A next
>> step for me is to this MPIDR work. I probably won't get to it until the
>> end of August though.
>>
>> [*] http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg01168.html
>>
>>> This should keep someone busy for a good couple of weeks (give or take a
>>> few months).
>> :-)
>>
>>> That being said, I'd rather see support in QEMU first, creating all the
>>> vcpu/redistributors upfront, and signalling the hotplug event via the
>>> virtual firmware. And then post some numbers to show that creating all
>>> the vcpus upfront is not acceptable.
>> I think the upfront allocation, allocating all possible cpus, but only
>> activating all present cpus, was the planned approach. What were the
>> concerns about that approach? Just vcpu memory overhead for too many
>> overly ambitious VM configs?
> I don't have any ARM-specific concern about that, and I think this is
> the right approach. It has the good property of not requiring much
> change in the kernel (other than actually supporting CPU hotplug).
>
> vcpu memory overhead is a generic concern though, and not only for ARM.
> We currently allow up to 512 vcpus per VM, which looks like a lot, but
> really isn't. If we're to allow this to be bumped up significantly, we
> should start accounting the vcpu-related memory against the user's
> allowance...
>
> Thanks,
>
> 	M.

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
