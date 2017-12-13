Received: by 10.223.159.74 with SMTP id f10csp5251422wrg;
        Wed, 13 Dec 2017 08:02:20 -0800 (PST)
X-Google-Smtp-Source: ACJfBouRddXW8KC2QiGw7pGOg9vbJpL3mUYd3QubV4KX93yqynqIuMRQTroZp5Hv0Myzvg6/a3mw
X-Received: by 10.37.144.137 with SMTP id t9mr2121957ybl.216.1513180940502;
        Wed, 13 Dec 2017 08:02:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513180940; cv=none;
        d=google.com; s=arc-20160816;
        b=nktM7Cl8etgJgkjg4HYhfZL0D477jRBHsXY6QZgBp4tRxIUYXkXF6L+1TMMgdbkUHE
         CJSD73UvvxQ6hi1fDjW0CdUCYkRJ3GK7KV+4JvwGDjXf+VAI6QAUlyN4Hfgwq5Meqvw2
         Qf4jwbY5sscnTsCc6GGIeTq5I/a6RHIcQqpjOWP7QXMcyTUC/7yh55yOuSlMx1PUYFx5
         Lj1sPge+vIlzVjpf+bnF7Bk3sn48m2DtEj3/Yx4uis3PirstKDyewkilRfoeG1A0bl35
         hjmddCskPVy17xmZ+rsuyhpMVZuMMLH/NZ6UnQYQKAmhkYOfA+33EPxD7L5BsVM1SJYE
         gbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=eu5H7AMCBUxPeU8cZHr0uRe6cIdgI/crISasgBaT5mE=;
        b=KP/UbYbyBhyn7jPvzhkbI8BIz2j5rsl6YH+7149F9QOoTJ/r904f0dK4w0EMGhDDTA
         quk8ufZ0CTMETtz9R1qle98qoAcW8UWU2jfzuSk733sATprmMT+cvx8yewjDDKE3ytQU
         B6Tbex+mmodyA2gk4Ks9xW9n64KBaRK1ZE4NSAbtFC1MaAJj17e/Oerwdipf/xCqaaL8
         mWcbou1cVJ/Uu9sfMECwm9fHLKytq6PBEMdfeGboxnH6Yq0xS85wgV6Pf8ybl5zPx4Gx
         XexWIO4X3dRghStaLkv7QkyWBXI58HbYEH4+LfhWByynaV6SljrniGTC8bDHkBgKTmx0
         ej7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w184si408033ywc.64.2017.12.13.08.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 08:02:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eP9UB-000620-Uf
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 11:02:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eP9Tx-0005yU-2k
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:02:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eP9Tr-0002t2-JH
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:02:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32818)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1eP9Tr-0002rl-Ch; Wed, 13 Dec 2017 11:01:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A90264054;
	Wed, 13 Dec 2017 16:01:56 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-40.rdu2.redhat.com
	[10.10.120.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 68B007D8F2;
	Wed, 13 Dec 2017 16:01:54 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA8ySsNx-rz__Nfbmd+QM3nKbgRXJtwSYjhRRvqbokt+uQ@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0355e1ee-2f48-81ce-55e6-bed7bdeac771@redhat.com>
Date: Wed, 13 Dec 2017 17:01:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ySsNx-rz__Nfbmd+QM3nKbgRXJtwSYjhRRvqbokt+uQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 13 Dec 2017 16:01:56 +0000 (UTC)
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
X-TUID: 2zIad8I00cQz

On 12/13/17 14:56, Peter Maydell wrote:
> On 12 December 2017 at 11:06, Laszlo Ersek <lersek@redhat.com> wrote:
>> BTW, has anyone tested this with the ArmVirtQemu firmware? As far as I
>> can see from the firmware code, the firmware will use the PL011 whose
>> description comes first in the DTB (and ignore the other PL011), in an
>> fdt_next_node() traversal. Is that OK for the intended use case?
> 
> I have now tested this,

Thank you!

> and annoyingly UEFI and the kernel seem
> to disagree about enumeration order. That is, if QEMU creates
> them in the code in the order 0x09050000 (uart 2), 0x09000000 (uart 1),
> then they appear in the dtb with uart 1 first, and the kernel enumerates
> them as ttyAMA0 being uart 1 and ttyAMA1 being uart 2, but UEFI
> outputs to uart 2...

Ouch. This reminds me (remotely) of QEMU commit 587078f0ed63
("hw/arm/virt: explain device-to-transport mapping in
create_virtio_devices()", 2015-02-05).

I'd still like to avoid the "sophisticated" /chosen lookup (the lookup
itself is not too complex, but evaluating whatever we find there against
each of the scanned UART nodes appears difficult, if I'm to understand
Ard's earlier point correctly). I hope that we can match the kernel's
logic with simple modifications to our scanning loops, e.g. we could
simply pick the last UART rather than the first, or else do a maximum
(or minimum) search for the UART base, and stick with the maximum (or
minimum) found.

However, for that, we first have to understand what the kernel does. Can
someone explain that? (I tried taking a look, but it's turtles all the
way down.)

Thanks,
Laszlo
