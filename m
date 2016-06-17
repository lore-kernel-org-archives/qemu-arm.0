Received: by 10.25.21.96 with SMTP id l93csp196296lfi;
        Fri, 17 Jun 2016 03:41:22 -0700 (PDT)
X-Received: by 10.55.16.90 with SMTP id a87mr1327580qkh.111.1466160081952;
        Fri, 17 Jun 2016 03:41:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 143si30869204qkg.152.2016.06.17.03.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 03:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDrDF-00005d-57
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 06:41:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bDrBl-00079i-4r
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:39:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bDrBj-0005Ex-9T
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:39:48 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:34648)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bDrBf-0005Ea-S2; Fri, 17 Jun 2016 06:39:43 -0400
Received: by mail-oi0-x229.google.com with SMTP id d132so111118068oig.1;
	Fri, 17 Jun 2016 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VjSDt+Xdqz+YZhhDM4+NlCRSkDpiXifWq7PsOQDLQk0=;
	b=enToe5Ds7WbM/N3E2Yu/ldcU8tTyklbjHaSQnH5m887yNUSTXV8GHrWopBGry4RUjV
	s6rOqiiNF3XFx/KsswdXudqYWXhGPEy0OVVSG2ByuV5JdnIil7Jv2FMYCrcg94DIIqWh
	qtcWnAjRjygcNOSZilXIRIlcLzJ10Ac7/kEkFuYRxD5a3QUNx5ARgDoTvw1cHemDNd8E
	Fyjmod5LoGkWd+ttqCPZw8cKMrA4SUzkA3GRwhXDYoacEk6rgiCgoJlE0G7P78MmDgcq
	+QBFklWOeOI19jl3zsegxo9rT2AGeM5ySMN+PS2v5dBn4Y1i6OxB3UM18T2B6mW63B1X
	vCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VjSDt+Xdqz+YZhhDM4+NlCRSkDpiXifWq7PsOQDLQk0=;
	b=CdBgQKsrQMpWSfzSL1DmuaL48ahpvacRVwkUpxVW9u6eUDmKm7cREXpmm7YA9/Ycjd
	mHd5mmTyAWrwPKzgEnsGEglzHTWRklsopMP0Ejiep5Meg/5Y/grCmd6WgL8yi0TOODMa
	C97fhPczulpE7VSOKYhJ5a2nD6FBE50I0JfwyOPpvpCuDzcjwuzBo4PxqhjJMnI3C0pB
	OVFIFyr31qrTGuh9G4CGKffYoapFVubAOyhM15nFDdKHErZv9e4xC9nPAnIFufo3hNK5
	OodqEeFiBeQP3KXFyFXa7vUJ3r6kw2UNZ8h/Xzf2Fgz/0Jre8rdegyjprlBUD5KGqD1s
	bIzg==
X-Gm-Message-State: ALyK8tLwkYc6VzKpaUWgYb2bW9uCSHkzdyZw7XGkNVxErDZC+jAzsgaSBJAPydxqBJzaI5wqmtmJfQ8V3nVJVQ==
X-Received: by 10.202.1.80 with SMTP id 77mr736100oib.171.1466159983257; Fri,
	17 Jun 2016 03:39:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.37.201 with HTTP; Fri, 17 Jun 2016 03:39:42 -0700 (PDT)
In-Reply-To: <CAFEAcA_N63MOjKVU3Y-2ZdAimvAEbKPkpRRXB8STMJa51JZbqw@mail.gmail.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA8+qWep8E3+k30n1gTUexoTrqipg=bnxS5yYPNvfFpTYw@mail.gmail.com>
	<CAFEAcA_dBDhUEZr+mLPJkiiMRyjqUuXMaaYfZX3PUwZdKFk9uA@mail.gmail.com>
	<CALicx6tYEX-6u7anPb=kgvOtg4HQriC5oRJPQtZiMipeBJazVw@mail.gmail.com>
	<CAFEAcA-=iT1r1mJgr94JUP9XfMJ2XxxW47pMF3vZ6btdO=MnUw@mail.gmail.com>
	<c551cc85-ba31-63bc-9c23-8457ec4a6c12@twiddle.net>
	<CALicx6tuVFbUxqv9Jjj35w51PmkB2eVAPg-bbBPLgFavGTAs5A@mail.gmail.com>
	<CAFEAcA_N63MOjKVU3Y-2ZdAimvAEbKPkpRRXB8STMJa51JZbqw@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Fri, 17 Jun 2016 16:09:42 +0530
Message-ID: <CALicx6sUbLd4wigLHH55R+3DgoyWKcgUs0F0_vf-s_54yDfJng@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v1 4/4] target-arm: Compute
 page size based on ARM target cpu type
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
Cc: Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <vijayak@cavium.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OsB+VyH0R73T

On Fri, Jun 17, 2016 at 4:00 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 17 June 2016 at 11:20, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> On Fri, Jun 17, 2016 at 1:12 AM, Richard Henderson <rth@twiddle.net> wrote:
>>> On 06/14/2016 04:36 AM, Peter Maydell wrote:
>>>> It would be better to delay the point at which we allocate
>>>> the data structures which care about page size, rather than
>>>> moving init of the CPU earlier.
>>>
>>> It would be *best* if we could re-initialize and re-allocate these data
>>> structures so that we can follow the current page size as it changes.
>>>
>>> Yes, this might require flushing just about everything, but it's the kind of
>>> thing that's likely to happen only at system startup.  After that, everything
>>> benefits from having the correct (larger) page size.
>>
>> I tried shuffling the memory initialization code after cpu initialization.
>> but it was full mess. So could not proceed further.
>>
>> However, I tried early creation cpu objects instead of doing it from
>> machvirt_init.
>> With this, initfn of the cpu model is called earlier and feature set is updated.
>> With that I could fetch arm architecture info. Based on this we can
>> choose page size.
>
> This won't work, because machvirt_init needs to be able to specify
> properties of the CPU. I think we need to solve the issues with
> dynamically reinitializing and reallocating the data structures,
> as rth suggests.

In early init, only cpu object is created and does not specify
properties of the CPU.
machvirt_init will reuse already created cpu object and specify
properties of the CPU.

Regards
Vijay
