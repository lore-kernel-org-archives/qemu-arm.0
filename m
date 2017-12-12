Received: by 10.223.159.74 with SMTP id f10csp3723364wrg;
        Tue, 12 Dec 2017 03:59:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBovyT1FLBtqfKRohpYs0WwMgolhaelJrHZ+bNh5jOCFW6pce+8CgEZd2r2wITBCTyP+IUFsQ
X-Received: by 10.129.103.215 with SMTP id b206mr2482333ywc.229.1513079993439;
        Tue, 12 Dec 2017 03:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513079993; cv=none;
        d=google.com; s=arc-20160816;
        b=cHBZKuT1lz7pUBW7VV3Eb+hYkvZXGbN7OechIO7AhAf+AJKKi9BfqlLTw4xdxejeT2
         z8mRYpNH+FM3iWuM5SKXkCWQQjv1Wc2S16VXxW0iWVOcx2lSrtnu9DHlczmFDGmmHa3x
         zblRrQvFG/lb45JcMqR9ghCAwdvuQDn5IBTmRG9NYnyPDOZxICJqoxowraC7igong07v
         S1j/6aMJElWPY9t93Rjez9Y7gCFH09YMNkPMoeVZEZBPSoD+mFLEHbrmSjV6PWQ/uz4r
         KqDtyuT6zkdo20OvfgQ7Pwr5ylbSuzZEUkreJPtIA6g4Nxjz2/nz6eSRUOvOi+REkyLC
         otkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=L+b1k5DUvqlYQtigxuhGRyGLPcOq0+OSeBZcf2OL9g4=;
        b=P9hCxPDrL7VnY3+aaPNFir7wZxxGyIzyQGm9ijG3w77vf9vP1SrmC2m87cH0A/FSAs
         3734TI6xYRwgIjZ0kptiLs5tRRPBw1nyGGTxLUiCDdyk71QsqcXdmvD0srvgsCXKr0Mw
         QeRfAOQgPT3rrT+mV4QLuzVooUTURDrmTmfAHUJ36g9zrFCFmXgMlCc/bV1oRzA6bNm+
         E8xb0GeHSRTtoSJcVvFY5zxQIO/iR1E4yjMtFvF+D5rVTCGW9ajsy+9PN/pfNCCzwWU8
         IRAY9IGRWeGBWUsQOiBe8tndgqNFBeKfDoPUI/J4egz+ql/z1+WE6HB5RgQwwfzvXdgu
         KyKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w185si1325482ybc.47.2017.12.12.03.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 03:59:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOjE1-0007xv-00
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 06:59:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eOjDr-0007xZ-RK
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:59:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eOjDo-0005cE-M7
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:59:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1eOjDo-0005aK-DK; Tue, 12 Dec 2017 06:59:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A3E24ACBC;
	Tue, 12 Dec 2017 11:59:38 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-105.rdu2.redhat.com
	[10.10.120.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 259155D756;
	Tue, 12 Dec 2017 11:59:35 +0000 (UTC)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
Date: Tue, 12 Dec 2017 12:59:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 12 Dec 2017 11:59:38 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Drew Jones <drjones@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MCW4jYV8oRhD

On 12/12/17 12:44, Ard Biesheuvel wrote:
> On 12 December 2017 at 11:33, Laszlo Ersek <lersek@redhat.com> wrote:
>> On 12/12/17 12:11, Peter Maydell wrote:
>>> On 12 December 2017 at 11:06, Laszlo Ersek <lersek@redhat.com> wrote:
>>>> BTW, has anyone tested this with the ArmVirtQemu firmware? As far as I
>>>> can see from the firmware code, the firmware will use the PL011 whose
>>>> description comes first in the DTB (and ignore the other PL011), in an
>>>> fdt_next_node() traversal. Is that OK for the intended use case?
>>>> (Perhaps I should have asked this under the second patch, which updates
>>>> the DTB generator.)
>>>
>>> I haven't tested, since I don't have a working setup for that to hand.
>>> (Do you have instructions somewhere for getting it working?)
>>
>> The Wiki page I most frequently refer to (for a libvirt-less description
>> anyway) is Ard's:
>>
>>   https://wiki.linaro.org/LEG/UEFIforQEMU
>>
>> There's also:
>>
>>   https://www.kraxel.org/repos/
>>   https://fedoraproject.org/wiki/Architectures/AArch64/Install_with_QEMU
>>
>>> The behaviour we would want would be for the firmware to keep using
>>> the PL011 at 0x09000000.
>>
>> With these QEMU patches, I reckon that's going to happen, yes.
>>
> 
> IIRC the DT nodes appear in the opposite order as they are added,

Oh! Thanks for catching that!

> so
> adding the second UART after adding the original one is probably going
> to cause trouble.
> 
> We do check the 'status' though, so if backward compatibility with
> older firmwares is a concern, we could set status=disabled, and let
> newer firmware builds enable it on the fly.

Peter, what is the intended use of the second UART?

(In the firmware, a second PL011 could be useful: it might make it
possible to separate the debug output (debug messages) from interactive
serial console IO. (On x86, in the default OVMF build, debug messages
are written to the QEMU debug IO port, and the serial port is used only
for interactive console IO.) I don't remember how important we deemed
this separation for aarch64, last time it surfaced.)

>>> (In an ideal world the firmware would
>>> prefer the UART marked in the 'stdout-path' in the DTB /chosen node,
>>> as the kernel does, I guess.)
>>
>> Hmmm, I recall that we used to have some code related to the /chosen
>> node... We have a helper function for locating that
>> (GetOrInsertChosenNode), but we no longer use it, it seems? The last
>> (only?) use was apparently removed in:
>>
>> https://github.com/tianocore/edk2/commit/29589acf1010
>>
>> I'll let Ard comment too.
>>
> 
> That would require us to implement some non-trivial parsing and alias
> resolution, given that stdout-path is simply a string that may refer
> to a UART node via an alias.

Let's not do that please...

Thanks
Laszlo
