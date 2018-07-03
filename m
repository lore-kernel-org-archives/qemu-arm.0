Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp911309wrq;
        Tue, 3 Jul 2018 04:56:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdbn6yPny4VNbhggB6ziI82DZbv4QwTfRPvKBbX8azjG5ih39vXXXyKvLXXZweVcAcfoeKG
X-Received: by 2002:a37:5142:: with SMTP id f63-v6mr25145772qkb.369.1530618980754;
        Tue, 03 Jul 2018 04:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530618980; cv=none;
        d=google.com; s=arc-20160816;
        b=nWznFnTWgirawM/hsFwjKuIKJr8TzKVVXe/N2Yzp4w3S6uJp/0FXhJRrrzbOPJTBsb
         CCcDlfDfga2tM43tABBaZBNmrYqBJBawplE2Z4fCBE0DaHd3pkLGfVha5y8YkxrF4K0M
         GqsX29icLzQlWxl84DIlVvsv3lTrvjSzCCZjahOb0PJNt6DtD/gs0hgafQiHaoZe0GIX
         8vUqvVAPu2j0DhtbDrJK/1P2dL3r0RLBKm7F7E0B7ADVHwv9mir/4w7nyfQAgadlOJf4
         04R/dGUilEktG0MqR/+cMSUReXDIDnlPkCjaMmtMvEhuKsAYNSBHXjqQd2Yo2KLhpNpF
         OpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=kYhgDIPcVS58tb0gzJcLbYGXrU0dO6PBF70tW7U7mgY=;
        b=DXFUyRBEoYdQSWr3wz7FT1KMDoKoXzLEeBBPasPaq8LxWiGmDXun9O9GnZYk17GjtP
         +/MAdrsIYKjPbtQHeNqQ8/eM+s/2WXy0tLUPbejkUjg9Ei3JgYadnslB14htQ7FOHo83
         huRyghWfOnilsKHnpad2OB95srHclkBApIOsoMcusWL7/pVDmW6tztKDyyM50vxC1Cab
         A8/dTibO9yR8bhr3khpUvgCvU0Fn6vYjD7tDu9uWAz8oA3+7462Madv2CFDEbmu8G+Bc
         E230oLLJN2Cq3GfCDUZgqoWIwGROGgP2HKmk9sDsXKT/uCITbyv2F7YybgrdbXEWwn6t
         hpjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l23-v6si904457qta.151.2018.07.03.04.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 04:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faJuu-0000vn-BJ
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 07:56:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1faJtt-0000HB-Ew
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 07:55:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1faJtp-0008II-Il
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 07:55:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44634 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1faJtp-0008He-DQ; Tue, 03 Jul 2018 07:55:13 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34B6D4068050;
	Tue,  3 Jul 2018 11:55:12 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BBD82026D76;
	Tue,  3 Jul 2018 11:55:09 +0000 (UTC)
Date: Tue, 3 Jul 2018 13:55:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180703115507.nqmyo7c5q5lrevgt@kamzik.brq.redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-6-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529500053-21704-6-git-send-email-eric.auger@redhat.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 03 Jul 2018 11:55:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 03 Jul 2018 11:55:12 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
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
X-TUID: UZmGkwbLlyle

On Wed, Jun 20, 2018 at 03:07:32PM +0200, Eric Auger wrote:
> The kvm-type property currently is used to pass
> a user parameter to KVM_CREATE_VM. This matches
> the way KVM/ARM expects to pass the max_vm_phys_shift
> parameter.
> 
> This patch adds the support or the kvm-type property in
> machvirt and also implements the machine class kvm_type()
> callback so that it either returns the kvm-type value
> provided by the user or returns the max_vm_phys_shift
> exposed by KVM.
> 
> for instance, the usespace can use the following option to
> instantiate a 42b IPA guest: -machine kvm-type=42

'kvm-type' is a very generic name. It looks like you're creating a KVM
VM of type 42 (which I assume is the ultimate KVM VM that answers the
meaning to Life, the Universe, and Everything), but it's not obvious
how it relates to physical address bits. Why not call this property
something like 'min_vm_phys_shift'? Notice the 'min' in the name,
because this is where the user is stating what the minimum number of
physical address bits required for the VM is. IIUC, if KVM supports
more, then it shouldn't be a problem.

Thanks,
drew
