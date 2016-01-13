Received: by 10.25.159.19 with SMTP id i19csp1022676lfe;
        Wed, 13 Jan 2016 02:10:26 -0800 (PST)
X-Received: by 10.141.6.131 with SMTP id i125mr56974819qhd.68.1452679826409;
        Wed, 13 Jan 2016 02:10:26 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i67si614675qhc.87.2016.01.13.02.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 02:10:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJINl-0006YM-UG
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 05:10:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aJINK-0006E2-EK
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 05:09:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aJINJ-0003i7-Es
	for qemu-devel@nongnu.org; Wed, 13 Jan 2016 05:09:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1aJINF-0003f8-40; Wed, 13 Jan 2016 05:09:53 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id F14546113;
	Wed, 13 Jan 2016 10:09:51 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-93.phx2.redhat.com
	[10.3.113.93])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0DA9n3j015786; Wed, 13 Jan 2016 05:09:50 -0500
To: Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
References: <1452612274-30218-1-git-send-email-shannon.zhao@linaro.org>
	<CAFEAcA-=9h11a2AvJYBNzfeDsW7-KS7x_7N-T0udr6NZ9Gu9bg@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <5696226D.2050001@redhat.com>
Date: Wed, 13 Jan 2016 11:09:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-=9h11a2AvJYBNzfeDsW7-KS7x_7N-T0udr6NZ9Gu9bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Shannon Zhao <zhaoshenglong@huawei.com>, edk2-devel@ml01.01.org,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [Qemu-devel] [PATCH] ARM: Virt: Don't generate RTC ACPI node
	when using UEFI
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
X-TUID: sFWRWOxJhnkp

On 01/12/16 16:30, Peter Maydell wrote:
> On 12 January 2016 at 15:24, Shannon Zhao <shannon.zhao@linaro.org> wrote:
>> When booting VM through UEFI, UEFI takes ownership of the RTC hardware.
>> To DTB UEFI could call libfdt api to disable the RTC device node, but to
>> ACPI it couldn't do that. Therefore, we don't generate the RTC ACPI
>> device in QEMU when using UEFI.
> 
> I don't really understand this. I thought that if we were
> using ACPI then we would always be doing it via UEFI?

Yes.

Let my try to summarize here too:

- kernel booted without UEFI: consumes DTB, accesses RTC directly

- kernel booted with UEFI, consumes DTB: UEFI owns RTC, kernel uses UEFI
services, UEFI keeps kernel from directly accessing the RTC by disabling
the RTC node in the DTB, using libfdt

- kernel booted with UEFI, consumes ACPI: UEFI owns RTC, kernel uses
UEFI services, UEFI keeps kernel from directly accessing the RTC by...,
well, it can't, because we don't *parse* AML in UEFI.

> Also I think if UEFI wants to take command of some of the
> hardware it ought to be UEFI's job to adjust the tables
> accordingly before it passes them on to the guest OS.

In theory, maybe.

In practice, no; we have the ACPI linker/loader for that. Either the
generated AML must not contain the RTC node, or else some linker/loader
script command(s) have to be added that cause the guest firmware's
linker/loader client to patch the device out. Generally speaking
however, the linker/loader can only patch data tables, not definition
blocks (AML).

You might ask why the DTB is different then. Why aren't I suggesting, in
paralle, that the DTB generator behave similarly in QEMU? The answer is
that the firmware needs the RTC node in the DTB for its *own* purposes
as well, so the RTC node must be in the DTB in any case.

ACPI is different. The firmware downloads it, patches it blindly (=
processes the linker/loader script), then passes it to the OS. That's all.

Formatting AML is doable in the firmware; parsing / modifying AML that
was originally generated by QEMU is practically impossible. If you
recall the *original* introducion of the ACPI interpreter into the
kernel -- there was a huge uproar. Today Linux has a customized version
of the ACPI CA framework. edk2 doesn't, and shouldn't.

Plus, *intelligently* modifying AML in the firmware defeats the purpose
of the ACPI linker/loader -- which is to allow the firmware to remain
ignorant about ACPI.

Thanks
Laszlo
