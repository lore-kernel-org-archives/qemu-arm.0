Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2677179wrq;
        Mon, 9 Jul 2018 10:27:16 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcfwGUzznDJHa5galHa42r5V4DsZtML/xGPctD2wjqv5NPNo07Nmhy5Mi5/se/y6U/MzY/k
X-Received: by 2002:a0c:af42:: with SMTP id j2-v6mr18779019qvc.191.1531157236639;
        Mon, 09 Jul 2018 10:27:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531157236; cv=none;
        d=google.com; s=arc-20160816;
        b=b7/Vkaym05vb14nFBwftx5fw53tUJnIxBQt6WNpzKrxHhrpkdD5bs1v+Ic1dE4MSI8
         0KUX8LHoBaAixAth5JSKj1dAKteoq8eP4glVzFLJxaeEweWXs2i2hutDDVcXgep/pk4a
         EhtZq60xTu024nqH+1S8iXCcEWjDgE+I1hF4hQQNaqUeQuYh+HNXZdFNcIZ0/3nGg6Mk
         lIFmRTgNU7ID05Yd24Yg/Skjm2Nz+M67Vq51v3NPHHnl91tLcSCO5KL8C7LpW9pwLV5Q
         kutCZvn42NwxyK13dyi7Hj+Rmkx9fwUmvKzAVRol8Vm8WC5j99f51PTwgkTr9uJELotz
         8JuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=yn2l2lI3MAeR+ucEHDcwVS476CRRUGULXpfrrYBV1D0=;
        b=uLRcefRCrJ4A5oySA2DUBwfJ3/Z0b6zqQu3KzX6gdyM87TPk2qysArMxXMkukFnBNK
         tNgeC+j7sQvd+EqmJZt4xxzWf1BTOxG3Bync0HWJmRjJWHv68KBefiL7eA3PSA5/zXaE
         6CWrL5g7k3ekNwSJYOFcFHuLahY+1pk/ZeAAwwpwA+ZT0VqWmvgZWQxApySfCOE0klo4
         o3z+RCwO3VkxmknV6dIlmtim6P/jQ25XsJW7t6JbMHRCn+dAyWzZKT5hqvJ7jZbjw/V7
         fj4rdxrRUxPgflDekT6FVYk1yMi8Q9gx5LcRi5YMxt3KAEH4lYpDSjb+oK0KJJQ8hEnR
         +seg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f3-v6si14711715qvi.172.2018.07.09.10.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 10:27:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43591 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcZwR-00073W-UM
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 13:27:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fcZwK-00073G-Rk
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 13:27:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fcZwF-0000oH-T7
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 13:27:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54480 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fcZwF-0000ng-NG; Mon, 09 Jul 2018 13:27:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1060987927;
	Mon,  9 Jul 2018 17:27:03 +0000 (UTC)
Received: from [10.36.116.40] (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EE7D2026D65;
	Mon,  9 Jul 2018 17:26:57 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-6-git-send-email-eric.auger@redhat.com>
	<20180703115507.nqmyo7c5q5lrevgt@kamzik.brq.redhat.com>
	<31c24e33-8fe8-a3c0-0430-d2f503f10932@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
	yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
	4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
	tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
	0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
	O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
	0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
	gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
	3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
	zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzRxUaG9tYXMgSHV0
	aCA8dGguaHV0aEBnbXguZGU+wsF7BBMBAgAlAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIX
	gAUCUfuWKwIZAQAKCRAu2dd0/nAttbe/EACb9hafyOb2FmhUqeAiBORSsUifFacQ7laVjcgR
	I4um8CSHvxijYftpkM2EdAtmXIKgbNDpQoXcWLXB9lu9mLgTO4DVT00TRR65ikn3FCWcyT74
	ENTOzRKyKLsDCjhXKPblTPIQbYAUCOWElcyAPm0ERd62fA/rKNxgIiNo/l4UODOMoOJm2/Ox
	ZoTckW68Eqv7k9L7m7j+Hn3hoDTjAmcCBJt+j7pOhzWvCbqoNOIH8C8qvPaNlrba+R/K6jkO
	6jZkTbYQpGIofEQJ/TNn38IsNGpI1ALTHWFtoMxp3j2Imz0REO6dRE2fHRN8sVlHgkoeGhmY
	NbDsDE1jFQOEObFnu0euk//7BXU7tGOHckVAZ8T1smiRPHfQU7UEH2a/grndxJ+PNeM5w7n2
	l+FN3cf2KgPotCK2s9MjSdZA7C5e3rFYO8lqiqTJKvc62vqp3e7B0Kjyy5/QtzSOejBij2QL
	xkKSFNtxIz4MtuxN8e3IDQNxsKry3nF7R4MDvouXlMo6wP9KuyNWb+vFJt9GtbgfDMIFVamp
	ZfhEWzWRJH4VgksENA4K/BzjEHCcbTUb1TFsiB1VRnBPJ0SqlvifnfKk6HcpkDk6Pg8Q5FOJ
	gbNHrdgXsm+m/9GF2zUUr+rOlhVbK23TUqKqPfwnD7uxjpakVcJnsVCFqJpZi1F/ga9IN87B
	TQRR+3lMARAAtp831HniPHb9AuKq3wj83ujZK8lH5RLrfVsB4X1wi47bwo56BqhXpR/zxPTR
	eOFT0gnbw9UkphVc7uk/alnXMDEmgvnuxv89PwIQX6k3qLABeV7ykJQG/WT5HQ6+2DdGtVw3
	2vjYAPiWQeETsgWRRQMDR0/hwp8s8tL/UodwYCScH6Vxx9pdy353L1fK4Bb9G73a+9FPjp9l
	x+WwKTsltVqSBuSjyZQ3c3EE8qbTidXZxB38JwARH8yN3TX+t65cbBqLl/zRUUUTapHQpUEd
	yoAsHIml32e4q+3xdLtTdlLi7FgPBItSazcqZPjEcYW73UAuLcmQmfJlQ5PkDiuqcitn+KzH
	/1pqsTU7QFZjbmSMJyXY0TDErOFuMOjf20b6arcpEqse1V3IKrb+nqqA2azboRm3pEANLAJw
	iVTwK3qwGRgK5ut6N/Znv20VEHkFUsRAZoOusrIRfR5HFDxlXguAdEz8M/hxXFYYXqOoaCYy
	6pJxTjy0Y/tIfmS/g9Bnp8qg9wsrsnk0+XRnDVPak++G3Uq9tJPwpJbyO0vcqEI3vAXkAB7X
	VXLzvFwi66RrsPUoDkuzj+aCNumtOePDOCpXQGPpKl+l1aYRMN/+lNSk3+1sVuc2C07WnYyE
	gV/cbEVklPmKrNwu6DeUyD0qI/bVzKMWZAiB1r56hsGeyYcAEQEAAcLBXwQYAQIACQUCUft5
	TAIbDAAKCRAu2dd0/nAttYTwEACLAS/THRqXRKb17PQmKwZHerUvZm2klo+lwQ3wNQBHUJAT
	p2R9ULexyXrJPqjUpy7+voz+FcKiuQBTKyieiIxO46oMxsbXGZ70o3gxjxdYdgimUD6U8PPd
	JH8tfAL4BR5FZNjspcnscN2jgbF4OrpDeOLyBaj6HPmElNPtECHWCaf1xbIFsZxSDGMA6cUh
	0uX3Q8VI7JN1AR2cfiIRY7NrIlWYucJxyKjO3ivWm69nCtsHiJ0wcF8KlVo7F2eLaufo0K8A
	ynL8SHMF3VEyxsXOP2f1UR9T2Ur30MXcTBpjUxml1TX3RWY5uH89Js/jlIugBwuAmacJ7JYh
	lTg6sF/GNc4nPb4kk2yktNWTade+TzsllYlJPaorD2Qe8qX0iFUhFC6y9+O6mP4ZvWoYapp9
	ezYNuebMgEr93ob1+4sFg3812wNP01WqsGtWCJHnPv/JoonFdMzD/bIkXGEJMk6ks2kxQQZq
	g6Ik/s/vxOfao/xCn8nHt7GwvVy41795hzK6tbSl+BuyCRp0vfPRP34OnK7+jR2nvQpJu/pU
	rCELuGwT9hsYkUPjVd4lfylN3mzEc6iAv/wwjsc0DRTSQCpXT3v2ymTAsRKrVaEZLibTXaf+
	WslxWek3xNYRiqwwWAJuL652eAlxUgQ5ZS+fXBRTiQpJ+F26I/2lccScRd9G5w==
Message-ID: <ef0b3c7a-4727-e76a-754b-fd5a5cf5ffdc@redhat.com>
Date: Mon, 9 Jul 2018 19:26:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <31c24e33-8fe8-a3c0-0430-d2f503f10932@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 09 Jul 2018 17:27:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 09 Jul 2018 17:27:03 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 5/6] hw/arm/virt: support kvm_type
 property
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, suzuki.poulose@arm.com, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	eric.auger.pro@gmail.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pITeUeIuYX6O

On 03.07.2018 14:31, Auger Eric wrote:
> Hi Drew,
> 
> On 07/03/2018 01:55 PM, Andrew Jones wrote:
>> On Wed, Jun 20, 2018 at 03:07:32PM +0200, Eric Auger wrote:
>>> The kvm-type property currently is used to pass
>>> a user parameter to KVM_CREATE_VM. This matches
>>> the way KVM/ARM expects to pass the max_vm_phys_shift
>>> parameter.
>>>
>>> This patch adds the support or the kvm-type property in
>>> machvirt and also implements the machine class kvm_type()
>>> callback so that it either returns the kvm-type value
>>> provided by the user or returns the max_vm_phys_shift
>>> exposed by KVM.
>>>
>>> for instance, the usespace can use the following option to
>>> instantiate a 42b IPA guest: -machine kvm-type=42
>>
>> 'kvm-type' is a very generic name. It looks like you're creating a KVM
>> VM of type 42 (which I assume is the ultimate KVM VM that answers the
>> meaning to Life, the Universe, and Everything), but it's not obvious
>> how it relates to physical address bits. Why not call this property
>> something like 'min_vm_phys_shift'? Notice the 'min' in the name,
>> because this is where the user is stating what the minimum number of
>> physical address bits required for the VM is. IIUC, if KVM supports
>> more, then it shouldn't be a problem.
> 
> Well I agree with you that using kvm-type=42 is not very nice.
> 
> On the other hand the current kernel API to pass the VM GPA address size
> is though the KVM_CREATE_VM kvm_type argument.
> 
> in accel/kvm/kvm-all.c there is all the infrastructure to fetch the
> generic machine kvm-type machine option and decode it into type, which
> is passed to KVM_CREATE_VM.
> 
> "
>     kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
>     if (mc->kvm_type) {
>         type = mc->kvm_type(ms, kvm_type);
>     } else if (kvm_type) {
>         ret = -EINVAL;
>         fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
>         goto err;
>     }
> 
>     do {
>         ret = kvm_ioctl(s, KVM_CREATE_VM, type);
>     } while (ret == -EINTR);
> "
> 
> This infrastructure already is used in hw/ppc/spapr.c

FWIW: The ppc code uses "kvm-type" to select the KVM implementation in
the kernel, since there are two implementations: kvm-pr (which is a
trap-and-emulate implementation) and kvm-hv (which is a
hardware-accelerated implementation). If you now introduce kvm-type for
ARM, too, but with a completely different meaning, I think that could
rather be confusing for the users...?

 Thomas
