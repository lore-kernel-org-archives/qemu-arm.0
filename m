Received: by 10.25.208.211 with SMTP id h202csp1920009lfg;
        Tue, 8 Mar 2016 05:07:00 -0800 (PST)
X-Received: by 10.140.101.5 with SMTP id t5mr35832442qge.24.1457442420464;
        Tue, 08 Mar 2016 05:07:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e127si2891689qkb.26.2016.03.08.05.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 05:07:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adHLn-0002uc-QM
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 08:06:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1adHLg-0002uN-7y
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 08:06:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1adHLc-0001hd-30
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 08:06:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1adHLb-0001fO-UK; Tue, 08 Mar 2016 08:06:48 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 18FEBC0A15F9;
	Tue,  8 Mar 2016 13:06:44 +0000 (UTC)
Received: from [10.36.112.26] (ovpn-112-26.ams2.redhat.com [10.36.112.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u28D6eMT009812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Mar 2016 08:06:42 -0500
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
	<56DEBF6A.6070809@redhat.com>
	<CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
	<CAKv+Gu8OgSK5+X71GLrvWLkcGcQ9=MuwOuFAsQroQTa3bWbHNA@mail.gmail.com>
	<56DEC234.70907@redhat.com>
	<CAKv+Gu-joM8MqtM=G_F7NLZEwpxLBMPeqimDwZv7yivTjYBFVQ@mail.gmail.com>
	<56DEC860.1060707@redhat.com>
	<CAKv+Gu91CH9WURYaLFtP7HHEm7Z18FMk19HXEWaj1=LBqM6mCQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56DECE5F.6000207@redhat.com>
Date: Tue, 8 Mar 2016 14:06:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu91CH9WURYaLFtP7HHEm7Z18FMk19HXEWaj1=LBqM6mCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 0/4] virt: provide secure-only RAM and first
	flash
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LYETzqgmV6Ze

On 08/03/2016 13:50, Ard Biesheuvel wrote:
> Note that, for KVM, it is unlikely that we will ever support all of
> this inside the guest. It makes *much* more sense to lock down the
> emulated flash, and implement the UEFI Runtime Services using a thin
> layer in UEFI that hooks up to interfaces exposed to the guest by
> QEMU.

Well, it makes a bit less sense if the SMM code is already there for you
to use. :)  More seriously, implementing secure boot on x86 KVM was
"just" a matter of reading the architecture manual and chipset
datasheets, and implementing what they said.  Likewise, the firmware
work can reuse a large part of the work done for bare-metal hardware.
Laszlo would kill me for saying this, :) but in terms of sheer SLOC his
platform enablement patches were dwarfed by the SMM code that Intel
contributed.  The SMM code in turn is _exactly_ the same on bare-metal
and virt.

Designing good PV interfaces is hard, designing secure PV interfaces is
harder; reading a spec is easy.  To me, the only reason to do it in PV
interfaces is that the hardware doesn't allow virtualization of EL3.

If the hardware makes you jump through extra hoops, sometimes it's
necessary, sometimes it's not.  If it's not, rationalizing it is bad.  I
cannot think of a good reason for hardware not to let you virtualize
hypervisor or secure mode, or to force the hypervisor to use two-level
page translation.

Paolo
