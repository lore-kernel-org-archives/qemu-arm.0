Received: by 10.223.159.74 with SMTP id f10csp3768120wrg;
        Tue, 12 Dec 2017 04:42:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBovMTEQh6JnYhwGfBv1wf9JFiV9PudrZUr6SMvOzKkxeARhWlVjI7J/89rHkAZKzFk3xXb7F
X-Received: by 10.37.188.140 with SMTP id e12mr2787184ybk.427.1513082528380;
        Tue, 12 Dec 2017 04:42:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513082528; cv=none;
        d=google.com; s=arc-20160816;
        b=is6Ugs8Puci7VX+ejePrCv+TEDkPynLU77EdHcs341xCZ3xPnLl6WBreIbwNTcfXDE
         thhveFddAcrqSzeFYrRC9SIP+Iw2+NzIpl98Sis0GsJFNaNVQvFTWxTrORk2YJxB6hDf
         HCAt9VinVeF7bQ1YzfLgEFAFi/WgWGVGtHPQPJG0rFeuwjRqL9Mhjjm4fqF+H7IOLIgu
         YQgiJf0KJYaf9osgup3ybi1BaK7AKl7id6ELj8y51pAkCzWmvgCzY6zrBlLsoIjbC2cy
         PM2Na//s/Hr7ex90y2CbO+z3JkjthhU8Ho4e+ndH3kDremA9pACmk8N2nFrUqk1HkulF
         sZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=7BRukpSbKUBFdfvGvIIQMdEXolUAwJFMpuuQ/MR/nus=;
        b=xVBUkzIrqLEyVZ1CMH2X9NV2t9uy28GxPZF9UXdNa/MZK+DLklHGlzkkILdB67En1J
         ftuwHS465E0xvAINi9U31qK1GrPfoF3L8pKmDEk32kxboGLYuP2cKnAyEvjAtB6yvP4I
         16eQBM4r7Qk0XEyHSBD68TLd4o67WQ1QgaWOyvrL1bWs414619dh78fng8oCD01lc/xo
         AEMLchtlgT/AkYrBUJDuPoxeDuEouPj8of/JcBCUCh1UwEf4WwdZTb2xjELhr1Hvo98J
         a9OnJ9Njc8Fn7COlbD3smoFC3zW/CrKfESr1R8e5GTkacIqnpIUj2R20J2kOHyHFtIpV
         AYog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 189si3385651ywc.447.2017.12.12.04.42.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 04:42:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOjst-0006oY-S7
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 07:42:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eOjsh-0006oG-CP
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 07:41:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eOjse-0004I8-62
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 07:41:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33514)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1eOjsd-0004HN-UC; Tue, 12 Dec 2017 07:41:52 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDD1A80481;
	Tue, 12 Dec 2017 12:41:50 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-105.rdu2.redhat.com
	[10.10.120.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B4304F6DE;
	Tue, 12 Dec 2017 12:41:47 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
	<CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
Date: Tue, 12 Dec 2017 13:41:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 12 Dec 2017 12:41:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Drew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lI46T1b8QVU2

On 12/12/17 13:07, Peter Maydell wrote:
> On 12 December 2017 at 11:59, Laszlo Ersek <lersek@redhat.com> wrote:
>> Peter, what is the intended use of the second UART?
> 
> Per the commit message:
> # there are some
> # use cases where having a second UART would be useful (like
> # bare-metal testing where you don't really want to have to
> # probe and set up a PCI device just to have a second comms
> # channel).
> 
> From QEMU's point of view this is just "some people would like
> more than one UART, x86 provides more than one UART, it's
> easy to provide an extra UART and it's up to the guest what
> it would like to do with it". If there's utility for the
> OVMF firmware in having 2 UARTs that's doubly good reason
> to have it.

I agree. There's one user-visible complication: while with one UART,
it's not possible to mix things up, with two UARTs, users will
inevitably want to assign inverse roles to them, relative to what QEMU /
the firmware assigns originally.

E.g. if one PL011 is redirected to a regular file (debug messages) and
the other one to stdio (console), there will be complaints that "I
wanted it the other way around". The redirection happens on the backend
(chardev) level, but the firmware won't see the difference on the
frontend (PL011) level.

Is it possible to add a new property to the UART nodes in the DTB, like
"purpose"?

Or can we make a virt-arm policy that "first -serial is always ...,
second -serial is always ..."?

(
Technically the latter could work, because:

- QEMU_OPTION_serial / add_device_config() keeps the command line order,
- the traversal of DEV_SERIAL with serial_parse() also keeps that order,
- machvirt_init() uses the same order via serial_hds[]
- create_uart() always prepends the new node to the DTB, via
  qemu_fdt_add_subnode() (if I understood Ard right).

I'm not sure though whether libvirt would like the ordering of -serial
options to carry any meaning.
)

Sorry if these questions don't belong on the QEMU level.

Thanks
Laszlo
