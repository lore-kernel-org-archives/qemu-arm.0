Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3380024wrq;
        Tue, 10 Jul 2018 03:07:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeBm0RyS/gkkjsDSMltD3nf28qjmx3xVpSterT49r13cBiO2MPZBowRQdn3fkEWsYEb3+0u
X-Received: by 2002:a37:1224:: with SMTP id c36-v6mr21286988qkh.26.1531217243645;
        Tue, 10 Jul 2018 03:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531217243; cv=none;
        d=google.com; s=arc-20160816;
        b=MrZHXKKH5jFO+VB32jw4wslwo/WQnOIYlrKi+STr4B0kep7fqYqg3oU3Pdpm9KcaQN
         qf/etmH2Ub9GvTuFw50gXJUY6dr5q3OnyFe4vJBD/gC8BflrVidbJm+7aSPH42f112/x
         ZlTcZGPb9ejPr6L0IWKZRVGT0mbKm+QqUHi1NPlBdsZZyWU6Y0ZUkIWhd4fwZvsvq50A
         8gbvdT6KwSzdok+YcIYhDHzjCmXGGTMoffB9iM2K8NJ4E39kgBqI2BagPoVNRRqVuHPF
         O7TJ21FTXeYxnv/cxR/GpgcEc0yYUzEnp70gzt5KoHS8CFZ9cCB+jqjVsyHDWYpc+Gzx
         QIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=SwyRk52LvZS5WYUCTq0Gi2QyR7aENAXCee7eW+XyWIo=;
        b=tEysEa2sGCshOcenM0uLSpcGAACvsDTBmUv7MfSKOfppCv5q9KjOOFLOLgzkiPI+2t
         ygoMNQG/ONXQIaJ2C8Kc2xUmKIHcZPGtj1Ok6UysI0zY5ynIzTsOazlbkTSiyKDLcBqA
         4fQf9dB+Q9m6+yvwqolw4vLnfeVpQDM51UdifAKymTC1NRb/RG167MxTLXvod7d683dZ
         w75PmWeBrll3TV0srH+/s9a9aS7bMpukbAZcbXpcMKMIOhzigVy5D6sRHrERyCA4sWYq
         RPhLKJzKmwxvzCGAkFKXQ1r8ZJv9ptCebZG5dUXAEnCt+qxR7yfWiHoNKV6P4Z7zqUIq
         8EyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d17-v6si1653554qtd.64.2018.07.10.03.07.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 03:07:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcpYJ-0006FX-4x
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 06:07:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fcpY7-0006EQ-KJ
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 06:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fcpY4-0007Rm-Gh
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 06:07:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60970 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fcpY4-0007RW-C9; Tue, 10 Jul 2018 06:07:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 328C377889;
	Tue, 10 Jul 2018 10:07:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-118.ams2.redhat.com
	[10.36.116.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B09247C5E;
	Tue, 10 Jul 2018 10:07:02 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-6-git-send-email-eric.auger@redhat.com>
	<20180703115507.nqmyo7c5q5lrevgt@kamzik.brq.redhat.com>
	<31c24e33-8fe8-a3c0-0430-d2f503f10932@redhat.com>
	<ef0b3c7a-4727-e76a-754b-fd5a5cf5ffdc@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c6631a71-0e52-c4da-2fc2-65d7114f8119@redhat.com>
Date: Tue, 10 Jul 2018 12:07:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <ef0b3c7a-4727-e76a-754b-fd5a5cf5ffdc@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 10 Jul 2018 10:07:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 10 Jul 2018 10:07:07 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
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
Cc: peter.maydell@linaro.org, suzuki.poulose@arm.com, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	david@gibson.dropbear.id.au, dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JeeLxjV+/PEq

Hi Thomas,

On 07/09/2018 07:26 PM, Thomas Huth wrote:
> On 03.07.2018 14:31, Auger Eric wrote:
>> Hi Drew,
>>
>> On 07/03/2018 01:55 PM, Andrew Jones wrote:
>>> On Wed, Jun 20, 2018 at 03:07:32PM +0200, Eric Auger wrote:
>>>> The kvm-type property currently is used to pass
>>>> a user parameter to KVM_CREATE_VM. This matches
>>>> the way KVM/ARM expects to pass the max_vm_phys_shift
>>>> parameter.
>>>>
>>>> This patch adds the support or the kvm-type property in
>>>> machvirt and also implements the machine class kvm_type()
>>>> callback so that it either returns the kvm-type value
>>>> provided by the user or returns the max_vm_phys_shift
>>>> exposed by KVM.
>>>>
>>>> for instance, the usespace can use the following option to
>>>> instantiate a 42b IPA guest: -machine kvm-type=42
>>>
>>> 'kvm-type' is a very generic name. It looks like you're creating a KVM
>>> VM of type 42 (which I assume is the ultimate KVM VM that answers the
>>> meaning to Life, the Universe, and Everything), but it's not obvious
>>> how it relates to physical address bits. Why not call this property
>>> something like 'min_vm_phys_shift'? Notice the 'min' in the name,
>>> because this is where the user is stating what the minimum number of
>>> physical address bits required for the VM is. IIUC, if KVM supports
>>> more, then it shouldn't be a problem.
>>
>> Well I agree with you that using kvm-type=42 is not very nice.
>>
>> On the other hand the current kernel API to pass the VM GPA address size
>> is though the KVM_CREATE_VM kvm_type argument.
>>
>> in accel/kvm/kvm-all.c there is all the infrastructure to fetch the
>> generic machine kvm-type machine option and decode it into type, which
>> is passed to KVM_CREATE_VM.
>>
>> "
>>     kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
>>     if (mc->kvm_type) {
>>         type = mc->kvm_type(ms, kvm_type);
>>     } else if (kvm_type) {
>>         ret = -EINVAL;
>>         fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
>>         goto err;
>>     }
>>
>>     do {
>>         ret = kvm_ioctl(s, KVM_CREATE_VM, type);
>>     } while (ret == -EINTR);
>> "
>>
>> This infrastructure already is used in hw/ppc/spapr.c
> 
> FWIW: The ppc code uses "kvm-type" to select the KVM implementation in
> the kernel, since there are two implementations: kvm-pr (which is a
> trap-and-emulate implementation) and kvm-hv (which is a
> hardware-accelerated implementation). If you now introduce kvm-type for
> ARM, too, but with a completely different meaning, I think that could
> rather be confusing for the users...?

Agreed. The kernel user API still is under discussion and from a qemu
perspective I will use either another machine option or a cpu option to
set the intermediate physical address size.

Thanks

Eric
> 
>  Thomas
> 
