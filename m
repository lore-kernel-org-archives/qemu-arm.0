Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3864747wrt;
        Fri, 19 Oct 2018 07:02:35 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63DXLGgT9eIOViM7hYsibSGKVQbUZsAVBIoMLp7mL91/tn3I7ZGiCYihfWuNQ8Lb5NjYtoW
X-Received: by 2002:a0c:949c:: with SMTP id j28mr34826469qvj.74.1539957755071;
        Fri, 19 Oct 2018 07:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539957755; cv=none;
        d=google.com; s=arc-20160816;
        b=SQTZ/aAEAeLs0Y1lu3nfkEJGMy6JfqtTiYDowip/Agawr1Q9vRoXF+gp0pkKnp5c+r
         0YKIiB2vh9Y9pAccR0XEsZFZhgfu7wYmUssATcpqMtKoWahCbJT3LkDW5yoYxNSARhXE
         rJmg6AfmKYgkuD6fYrATbvzZDlqNUW7d1a7jXWtL26ADBbl639UOxkdbgwaBdsYBlptQ
         vj9PDP4LlIXzlfRmEi1ncGpgSfqzsdqKuJXtvJGtG86Rt9sTl5vRu5523QmR1mCi/gbA
         DHxVM5ZtOkN5k5boDiHnStQS213aAMAvJ3mNdWbBp5fo7UtlvkTbo4pe7DqQsWjSBUn9
         UuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=5T9E+ovbZkBSYu+6q12Vf4RRPypYlCaFQ/PyXoke/i8=;
        b=1GAAQ5QcdZoWebRXPykx0YInjxTi+JJZl0amlg4U8ICngAA4120QFYWbo9fZqn1ZLt
         V2XIQfpQOXOzPvIbiydx6mOQUQMfDWoHWN1bbpfLTNWuPuBIwCep8kmvz8HRJ41NLjj/
         KoIaNzMBSrkqqBNtVa8JrIDFUNbtzb3Cj+VfO7mPE7JLflAQGStc4buXVnCMfGJdq0qm
         r1K7Ue7IYOsmM+dc/PH3144phauQvA15GupZLC9/lA/fDa5Rmn5dU2cqk71hTss5CB2f
         WjfKgfapw5xsuyfl81GkHJjtG/ednfMEzgfnDXPXL8j+3es3C37z6R+k5sGTtPKpFLE0
         X5DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t27si6889263qvj.36.2018.10.19.07.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 07:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDVMI-0006X6-LF
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 10:02:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gDVM5-0006Ur-SV
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:02:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gDVLx-0006lz-5z
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:02:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gDVLw-0006lX-Ub; Fri, 19 Oct 2018 10:02:13 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EEDB30001EB;
	Fri, 19 Oct 2018 14:02:12 +0000 (UTC)
Received: from [10.36.116.234] (ovpn-116-234.ams2.redhat.com [10.36.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B40848EF13;
	Fri, 19 Oct 2018 14:02:06 +0000 (UTC)
To: Suzuki K Poulose <suzuki.poulose@arm.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
References: <20181018143042.29588-1-eric.auger@redhat.com>
	<20181018143042.29588-3-eric.auger@redhat.com>
	<872eeab2-7f0d-6cba-fd05-c75a32aac81b@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3b307a39-a7ad-3de5-71ea-84cf0a98cf67@redhat.com>
Date: Fri, 19 Oct 2018 16:02:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <872eeab2-7f0d-6cba-fd05-c75a32aac81b@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 19 Oct 2018 14:02:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 02/16] linux-headers: header
 update for KVM/ARM KVM_ARM_GET_MAX_VM_PHYS_SHIFT
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
Cc: drjones@redhat.com, dgilbert@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +VwAjT9gt4h2

Hi Suzuki,

On 10/19/18 10:49 AM, Suzuki K Poulose wrote:
> Hi Eric,
>=20
> On 10/18/2018 03:30 PM, Eric Auger wrote:
>> This is a header update against kvmarm next branch
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm kvmarm/nex=
t
>>
>> to get the KVM_ARM_GET_MAX_VM_PHYS_SHIFT ioctl. This allows to retriev=
e
>> the IPA address range KVM supports.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v3 -> v4:
>> - update against kvmarm next
>> ---
>> =C2=A0 linux-headers/linux/kvm.h | 10 ++++++++++
>> =C2=A0 1 file changed, 10 insertions(+)
>>
>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>> index 83ba4eb571..9647ce4fcb 100644
>> --- a/linux-headers/linux/kvm.h
>> +++ b/linux-headers/linux/kvm.h
>> @@ -750,6 +750,15 @@ struct kvm_ppc_resize_hpt {
>> =C2=A0 =C2=A0 #define KVM_S390_SIE_PAGE_OFFSET 1
>> =C2=A0 +/*
>> + * On arm64, machine type can be used to request the physical
>> + * address size for the VM. Bits[7-0] are reserved for the guest
>> + * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
>> + * value 0 implies the default IPA size, 40bits.
>> + */
>> +#define KVM_VM_TYPE_ARM_IPA_SIZE_MASK=C2=A0=C2=A0=C2=A0 0xffULL
>> +#define KVM_VM_TYPE_ARM_IPA_SIZE(x)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0 ((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
>> =C2=A0 /*
>> =C2=A0=C2=A0 * ioctls for /dev/kvm fds:
>> =C2=A0=C2=A0 */
>> @@ -953,6 +962,7 @@ struct kvm_ppc_resize_hpt {
>> =C2=A0 #define KVM_CAP_NESTED_STATE 157
>> =C2=A0 #define KVM_CAP_ARM_INJECT_SERROR_ESR 158
>> =C2=A0 #define KVM_CAP_MSR_PLATFORM_INFO 159
>> +#define KVM_CAP_ARM_VM_IPA_SIZE 160 /* returns maximum IPA bits for a
>> VM */
>=20
> Please be aware that there have been multiple merge conflicts with
> the kvmarm-tree onto kvm tree upstream and the numbers have changed.
> I assume that you will be rebasing this to mainline anyways.

Thank you for the heads up. Yes I will respin this header update against
the master branch later on.

Thanks

Eric
>=20
> Cheers
> Suzuki
>=20
