Received: by 10.223.159.74 with SMTP id f10csp3889147wrg;
        Tue, 12 Dec 2017 06:32:20 -0800 (PST)
X-Google-Smtp-Source: ACJfBoslDbnHAfQKa8HfbS3F/E2nE4JrR43VrEyq/ZWv7LGQqgi7bdpwJ5s50o3Wpm5bpbcv5B5q
X-Received: by 10.37.39.6 with SMTP id n6mr606823ybn.475.1513089140142;
        Tue, 12 Dec 2017 06:32:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513089140; cv=none;
        d=google.com; s=arc-20160816;
        b=p0aBhIPvz7l/WerDz1I2e0opkmxOIv6BnMr07QmYwrZmN81jx/WqRj3A5rsdB5cj8o
         /abm4P6HBk5pc9pmOXejYxjVB7jOdA3gQCQF47EhNLCrMtXHOhDqBgwFQTVzlnmDOcp6
         HHuHcqzpAeHyNeJtPFxVGXxQoGsCHSVKH8sbfaaviw7mPVQ/TkB5RisSkGAjB1SXDlrx
         tqFzoANNCdtUAzTWPY52roGavc3p2GL5gZ81XWCbS6kXbqBdIfQqMM9MEULvZcxfQAch
         BPCPzCh6WTxrEwFPvC+fH1G0IdSqZgvuP2Y6hJwDMG5MlXKZSvyjOcwjzx8yWr7oXwzx
         BxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NuGHi62z38dKcN7oV0wsn6mWE9ysNl90gjRCS6gxFIY=;
        b=UTQH6iqQMW+FrHf/C6bVmSPnTbXCejSRiL2bu4RTkVQaxIMSaKrF0FUtMaOxnffRvX
         YKxy7rOqmRUNq46+EJcv252pQSnzyXXK3v93heBL7YjJkK8xCrKmxyT0FFlNhEv6a2d5
         ZhQwopQmEziWc/r6Qc2yJMY4miNIh/U9kBQiyxsMQXVp/hyfj/ScFVaL/v3vkVy15w0M
         RhnwXn+h7Fl0jPKJwowC5pGGUXTOee5j7kYEP0o2cPcnRncJ62t1lvq0t5ath1Tn5HpE
         bd+s522ooSJT8G/9E5njQnCOpYYKZWQYk6MhpJ+JSmuF+h5PEUcOZR293aG6FSpoKtQN
         sBtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WGRW9xo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c128si2306151ybf.669.2017.12.12.06.32.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:32:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WGRW9xo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlbX-0007P8-Js
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:32:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eOlaO-0006oL-BR
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:31:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eOlaN-0007S9-8v
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:31:08 -0500
Received: from mail-it0-x232.google.com ([2607:f8b0:4001:c0b::232]:41668)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1eOlaN-0007Ri-2B
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:31:07 -0500
Received: by mail-it0-x232.google.com with SMTP id x28so24980490ita.0
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 06:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NuGHi62z38dKcN7oV0wsn6mWE9ysNl90gjRCS6gxFIY=;
	b=WGRW9xo7JFgv/g6LuOaW5rmRS3vcGsfvN4r+q0QtGs6BdNyxHOdEJgo+IItuCsuRPg
	McdC/1hQYkK1pbXQHZIaRnhTejQWjZBKPjiCEFkHtG4w3/zFFNYYuETAPGw0oInG2KN7
	q+UH8z+kqlrwreKhJ0FpgtJNSo8rZEXs09Hd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NuGHi62z38dKcN7oV0wsn6mWE9ysNl90gjRCS6gxFIY=;
	b=pONj0SC/m+d/N0QbnrAFyxTnJWl6Q+4wugo2eND/0A04j7Elcg5jTqRMSUx5F12oEr
	Ga14XKTd/qZRVfeXDiaCSoYvB6HSwqWcHfAGlo6q6blZXzOVqzXpoLBXUJr651yybtK/
	dm78n8KgwdKdP9zYL9P15ANtygnMcNCOthGT+l2jnRlYZb1QlHi0qAECLkQLgp2QW8qZ
	kOpATT55xGP9AJQybioWczI/DyKiUocQJtsOyTqzJRSwxmS1ogWcDKzGIwrrk7H1Dyfg
	UXod/6CQov3WxyjlqbzKwqUsxogxkZG+xs8VGODZURNO9VdEQSZAnWNocIBOQbWvgveK
	DRqQ==
X-Gm-Message-State: AKGB3mIhCSIkW7RDRLVZvdTkkfbcYuIYPMSAVGPLLAfnykf/QZ5zs4Cp
	U/XnsY815fA/J/tIrU8797yatNcIK+llXac0vpf15g==
X-Received: by 10.36.145.216 with SMTP id i207mr2739044ite.73.1513089066374;
	Tue, 12 Dec 2017 06:31:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.104.16 with HTTP; Tue, 12 Dec 2017 06:31:05 -0800 (PST)
In-Reply-To: <CAFEAcA8OY3PFk_bermKxQBuF_th7SudHgaRk8wf76EAGYnoCGw@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
	<CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
	<09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
	<CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
	<d776710c-2255-947b-22c6-336e9491bb81@redhat.com>
	<CAKv+Gu9e6qwJ4=t=UHHGsVs1XM26agh17Mgy0ckAvUsy+2xi2A@mail.gmail.com>
	<CAFEAcA9JzK8sNF5TmENfXZ-NBJwfp03b2La4YQ=N2i1ZCzrNBw@mail.gmail.com>
	<CAKv+Gu_mzynBKSBSdtUhKRgNd3KmuJTwiNZpmvPCfkRDo_QCgA@mail.gmail.com>
	<CAFEAcA9HAcZTi6bT-FbsG9LtqO=4s7rpcz0niZbimG834t4uHA@mail.gmail.com>
	<CAKv+Gu8gZ-Y4-zV2GRgbXPcignAg3vi8__XaFXqAhYOZOL7GcQ@mail.gmail.com>
	<CAFEAcA8OY3PFk_bermKxQBuF_th7SudHgaRk8wf76EAGYnoCGw@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 12 Dec 2017 14:31:05 +0000
Message-ID: <CAKv+Gu_939a=cui76H5FqCZwbWqDUYhegNe18T+tBpq7CW+TrA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::232
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
Cc: Drew Jones <drjones@redhat.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lz+ffV1oq7vp

On 12 December 2017 at 14:17, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 December 2017 at 14:16, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> On 12 December 2017 at 14:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 12 December 2017 at 14:12, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>>>> On 12 December 2017 at 14:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>> That doesn't actually usefully separate debug output from the
>>>>> console, though, because stdout-path is also going to point
>>>>> to the UART with the lowest physical address...
>>>>>
>>>>
>>>> By default, yes, just like is currently the case. But I would assume
>>>> this new serial port could be appointed 'console' and put into
>>>> stdout-path by QEMU, based on the command line options?
>>>
>>> We don't have any command line options for doing that, and I'm
>>> generally reluctant to introduce new command line UI, especially
>>> new command line UI that's specific to Arm and not also needed
>>> for x86.
>>>
>>
>> If stdout-path is always going to point to pl011@0x9000000, why would
>> we need to parse it?
>
> If you had always parsed stdout-path, we wouldn't need to worry
> about the order in which the UART nodes appear in the dtb...
>

That's a fair point. But it still does not justify introducing added
complexity in the firmware, if the conclusion is always going to be
that the console will be on pl011@9000000.

To Drew's point re DEBUG builds, I don't think we should generally
enable DEBUG and send the output to nowhereland if the user does not
wire it up. That's a MMIO trap and two world switches for each
character written, if I am not mistaken, and the DEBUG builds are very
noisy.

But still, given that stdout-path is essentially written in stone
anyway, could we also decide that it will always refer to
pl011@9000000 by its nodename? That way, we can easily implement the
early DEBUG logic by using any non-disabled non-secure PL011 that is
not referenced in stdout-path, and falling back to the one that is in
stdout-path, which will essentially work as it does today. And for the
more elaborate DXE driver, we can find the nodename from stdout-path.
