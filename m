Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp946357wrq;
        Tue, 3 Jul 2018 05:31:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeU+j3xuMJd5PCIYOtFhEauEe+UZ2MyNfXOm1jQfFk/E9zVYo5XHy6XOLJpSkTEfNcBZxCX
X-Received: by 2002:ac8:1bb8:: with SMTP id z53-v6mr1345085qtj.278.1530621081695;
        Tue, 03 Jul 2018 05:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530621081; cv=none;
        d=google.com; s=arc-20160816;
        b=r5XUXyjNvwWQZJQzrrimFElLFTJaFFiDXmSDugDxS5S5Hi0WpPEW9ESse60XFFyjky
         xvrsGBBT1WLwr7Fpo1D6WSEPMhSffCikXYRnCXkba5ZZj3GgOmfj5q8FcvS/qV57grF7
         R1Wque1djJTKjtdV3OZopLE/sjpcWAsksxSjBMXwvDRzWpfXOec2LJi2o2faACGDbKjN
         eziEu4b26tFEy+F/pIjkvKOwJXWiHnMhJ+Go3KSOe4WyYVmhCmLkeh/AObjtSNYZnsV+
         UJBLXtFvagh5x7NCIUdJH+TudForRA3kqju0Al0McLu1DjjmyvKdBWWYlSIqBJian7W5
         l/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=boPAAI29PPhVgR+0rH0YiHXedzyYfLBB/TIHqUFUafY=;
        b=SNGbpYjIQo5OtQTsz2sfJdQLhZIsVbLQMlbQ08EXOI4rTNR41BxCWwy5iB3cJWoyoG
         uEIRzjJobmEhNoe9mYEnrUUpBWq1PNmdAOZfSh6p8ONSoGeo3gzmw5xRBiQU/LglmGVk
         2XDsKu8gQxAO9FjCm8raaHlA7EEgi+JqjG7kcKpCPVRQP35VtqtREIMr97NLg+QubV3a
         BK9l30/5cdwj8dY/S3KMl/JK4U+pOVgw4FPr6rdSXEFeGucm3+QfbtnQrBRI7DYylOYj
         jmuPTcD28QrA6THbs9PEvQvUnS0uYiM1N0IGbQI79ZYYOOYMCtQ/mtD5DuO7suqNWHFj
         LTdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r25-v6si968684qtk.15.2018.07.03.05.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 05:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faKSn-0003ie-4r
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 08:31:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faKSg-0003iK-Py
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 08:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faKSb-0006Rm-JU
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 08:31:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58968 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faKSb-0006R8-F0; Tue, 03 Jul 2018 08:31:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E92E87927;
	Tue,  3 Jul 2018 12:31:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 999441C5AC;
	Tue,  3 Jul 2018 12:31:03 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-6-git-send-email-eric.auger@redhat.com>
	<20180703115507.nqmyo7c5q5lrevgt@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <31c24e33-8fe8-a3c0-0430-d2f503f10932@redhat.com>
Date: Tue, 3 Jul 2018 14:31:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180703115507.nqmyo7c5q5lrevgt@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 03 Jul 2018 12:31:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 03 Jul 2018 12:31:08 +0000 (UTC) for IP:'10.11.54.5'
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
	dgilbert@redhat.com, agraf@suse.de, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z0thhZN/bdxf

Hi Drew,

On 07/03/2018 01:55 PM, Andrew Jones wrote:
> On Wed, Jun 20, 2018 at 03:07:32PM +0200, Eric Auger wrote:
>> The kvm-type property currently is used to pass
>> a user parameter to KVM_CREATE_VM. This matches
>> the way KVM/ARM expects to pass the max_vm_phys_shift
>> parameter.
>>
>> This patch adds the support or the kvm-type property in
>> machvirt and also implements the machine class kvm_type()
>> callback so that it either returns the kvm-type value
>> provided by the user or returns the max_vm_phys_shift
>> exposed by KVM.
>>
>> for instance, the usespace can use the following option to
>> instantiate a 42b IPA guest: -machine kvm-type=42
> 
> 'kvm-type' is a very generic name. It looks like you're creating a KVM
> VM of type 42 (which I assume is the ultimate KVM VM that answers the
> meaning to Life, the Universe, and Everything), but it's not obvious
> how it relates to physical address bits. Why not call this property
> something like 'min_vm_phys_shift'? Notice the 'min' in the name,
> because this is where the user is stating what the minimum number of
> physical address bits required for the VM is. IIUC, if KVM supports
> more, then it shouldn't be a problem.

Well I agree with you that using kvm-type=42 is not very nice.

On the other hand the current kernel API to pass the VM GPA address size
is though the KVM_CREATE_VM kvm_type argument.

in accel/kvm/kvm-all.c there is all the infrastructure to fetch the
generic machine kvm-type machine option and decode it into type, which
is passed to KVM_CREATE_VM.

"
    kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
    if (mc->kvm_type) {
        type = mc->kvm_type(ms, kvm_type);
    } else if (kvm_type) {
        ret = -EINVAL;
        fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
        goto err;
    }

    do {
        ret = kvm_ioctl(s, KVM_CREATE_VM, type);
    } while (ret == -EINTR);
"

This infrastructure already is used in hw/ppc/spapr.c

Whould it be better if we would pass something like kvm-type=48bGPA?
Otherwise I can decode another virt machine option (min_vm_phys_shift)
in kvm_type callback.

Thanks

Eric


> 
> Thanks,
> drew
> 
