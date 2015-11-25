Received: by 10.182.158.201 with SMTP id ww9csp2614711obb;
        Wed, 25 Nov 2015 02:30:16 -0800 (PST)
X-Received: by 10.31.16.40 with SMTP id g40mr31671805vki.140.1448447416581;
        Wed, 25 Nov 2015 02:30:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c67si23027906vkd.112.2015.11.25.02.30.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2015 02:30:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:44288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1XL6-0001xv-6l
	for alex.bennee@linaro.org; Wed, 25 Nov 2015 05:30:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <christoffer.dall@linaro.org>) id 1a1XKi-0001cS-Fq
	for qemu-devel@nongnu.org; Wed, 25 Nov 2015 05:29:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <christoffer.dall@linaro.org>) id 1a1XKh-0002kv-EX
	for qemu-devel@nongnu.org; Wed, 25 Nov 2015 05:29:52 -0500
Received: from mail-yk0-x22e.google.com ([2607:f8b0:4002:c07::22e]:32899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <christoffer.dall@linaro.org>) id 1a1XKh-0002kj-6h
	for qemu-devel@nongnu.org; Wed, 25 Nov 2015 05:29:51 -0500
Received: by ykdv3 with SMTP id v3so51018132ykd.0
	for <qemu-devel@nongnu.org>; Wed, 25 Nov 2015 02:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=frKH2qtV0RvyxuILusmiJ980n6IwWFcOSJBQJkZtWAw=;
	b=aiukeOGEqFxwSM2AA0r0vPbTs31QIWP8AuKgZWc8aAIgO7nDM9CdjJdRuWCIBxKuWv
	cN2DwxrmF/eZXu8wv7yMBXF2l9OERDGeeUnphOnu6LUL0fNceYXG2crWIB5oiWc2Kn3A
	DHPXpdLvKq6xmWfbEuxwo5tCjzSyaJZzgg80fv8qgm0EdJUgIlUZZMdSNTxMh9t39q/z
	AuASf/YcJvcP27WdXyyimXIgcVkswmPFm6+k8d9dK4Yqv9is3pwnylW17vI4+C7VVI7N
	9N90fVsQPi5nHGeQKNr1VUdIchrhN1YonM/sIPODfJxIZtOp4ln9KjCDE1+4DURP3tr8
	D1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=frKH2qtV0RvyxuILusmiJ980n6IwWFcOSJBQJkZtWAw=;
	b=W+NRIgSENI7fAi6kymgz/c8EtedneUf4Wr4FlMqaA0sHmyFd6cdH2sFIyasWlBU2Pt
	e7FOcPI8/QNK1MeBhaxznrGZyBgSpJdjWu0p+aTY0REMDkVZpbTPaShC8j5zFu5Rn/HH
	taHwJWMUTdryEdHx+ML4u4YEPetGAElCTwjEEc+gkrzlTco58Yl4iwJSniCnggolXsVn
	iixWgbUYAyEV7vCv/Ceq6C1So2eDsGvdmH9avBNyYG8nD+75gkQk6mrAEyHK6Eb5mzXM
	dDOIfTyHpFwGVGY9R7noZkBbCRbniHirfiR5NRLU4JnlQ9mJ1/8ZIS/uaLqHi9ItDTAA
	vBtg==
X-Gm-Message-State: ALoCoQmswsrCezU3QWVMuvFlC3CBeU+TCvCEmpgLq5icdMIlVWsXxUMTkKrf1DL6nBDa+zPDZEjx
MIME-Version: 1.0
X-Received: by 10.129.75.66 with SMTP id y63mr31240807ywa.32.1448447390614;
	Wed, 25 Nov 2015 02:29:50 -0800 (PST)
Received: by 10.37.207.142 with HTTP; Wed, 25 Nov 2015 02:29:50 -0800 (PST)
In-Reply-To: <1447976660.4697.210.camel@redhat.com>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
	<1447976660.4697.210.camel@redhat.com>
Date: Wed, 25 Nov 2015 10:29:50 +0000
Message-ID: <CAMJs5B8OaaNYop=dmGVSGMdakKGS-6iEgd=3U1zDDm-WMhF1wg@mail.gmail.com>
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22e
Cc: Baptiste Reynal <b.reynal@virtualopensystems.com>,
	Peter Maydell <peter.maydell@linaro.org>, Eric AUGER <eric.auger@st.com>,
	Patch Tracking <patches@linaro.org>, Eric Auger <eric.auger@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Lendacky,
	Thomas" <thomas.lendacky@amd.com>
Subject: Re: [Qemu-devel] [RESEND RFC 0/6] AMD XGBE KVM platform passthrough
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tyeDMC5RmPID

On Thu, Nov 19, 2015 at 11:44 PM, Alex Williamson
<alex.williamson@redhat.com> wrote:
> On Thu, 2015-11-19 at 15:22 +0000, Eric Auger wrote:
>> I am resending this RFC from Oct 12, after kernel 4.4-rc1 and
>> QEMU 2.5-rc1, hoping things have calmed down a little bit.
>>
>> This RFC allows to set up AMD XGBE passthrough. This was tested on AMD
>> Seattle.
>>
>> The first upstreamed device supporting KVM platform passthrough was the
>> Calxeda Midway XGMAC. Compared to this latter, the XGBE XGMAC exposes a
>> much more complex device tree node. Generating the device tree node for
>> the guest is the challenging and controversary part of this series.
>>
>> - First There are 2 device tree node formats:
>> one where XGBE and PHY are described in separate nodes and another one
>> that combines both description in a single node (only supported by 4.2
>> onwards kernels). Only the combined description is supported for passthrough,
>> meaning the host must be >= 4.2 and must feature a device tree with a combined
>> description. The guest will also be exposed with a combined description,
>> meaning only >= 4.2 guest are supported. It is not planned to support
>> separate node representation since assignment of the PHY is less
>> straigtforward.
>>
>> - the XGMAC/PHY node depends on 2 clock nodes (DMA and PTP).
>> The code checks those clocks are fixed to make sure they cannot be
>> switched off at some point after the native driver gets unbound.
>>
>> - there are many property values to populate on guest side. Most of them
>> cannot be hardcoded. That series proposes a way to parse the host device
>> tree blob and retrieve host values to feed guest representation. Current
>> approach relies on dtc binary availability plus libfdt usage.
>> Other alternatives were discussed in:
>> http://www.spinics.net/lists/kvm-arm/msg16648.html.
>>
>> - Currently host booted with ACPI is not supported.
>
> I won't pretend to know all the politics in the ARM space, but doesn't
> this last bullet sort of imply that this is dead-on-arrival code?  Maybe
> not in the embedded space, but certainly in the server space, I thought
> ACPI was declared the winner.  Thanks,
>
Hi Alex,

We currently have no solution to accomplish platform device
passthrough on ACPI, because we don't know how to extract and
encapsulate the necessary information from the host about the
passthrough device and its dependency (clocks and phys for example).

There are people interested in this work, in particular in the
networking space, who couldn't care less about ACPI, and for those,
supporting platform device passthrough with DT remains highly
relevant.

Therefore, I think it's useful to consider these patches for review
and for their basic approach.

Thanks,
-Christoffer
