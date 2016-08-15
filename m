Received: by 10.25.21.156 with SMTP id 28csp1527048lfv;
        Mon, 15 Aug 2016 09:59:49 -0700 (PDT)
X-Received: by 10.55.5.5 with SMTP id 5mr32420829qkf.24.1471280389105;
        Mon, 15 Aug 2016 09:59:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s127si12982335qkc.40.2016.08.15.09.59.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 09:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZLEq-00052e-Jn
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 12:59:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bZLEn-00052P-8M
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 12:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bZLEh-0004RS-8m
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 12:59:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bZLEh-0004RN-39; Mon, 15 Aug 2016 12:59:39 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E76E61E54;
	Mon, 15 Aug 2016 16:59:38 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7FGxZM8025311
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 15 Aug 2016 12:59:36 -0400
Message-ID: <1471280374.3003.10.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>, Wei Huang <wei@redhat.com>
Date: Mon, 15 Aug 2016 18:59:34 +0200
In-Reply-To: <20160815100938.vve6hknieytt2ys7@kamzik.localdomain>
References: <1471067570-7503-1-git-send-email-wei@redhat.com>
	<20160815100938.vve6hknieytt2ys7@kamzik.localdomain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 15 Aug 2016 16:59:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V1 1/1] arm64: Add an option to
 turn on/off host-backed vPMU support
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AyVEHkcUrs3m

On Mon, 2016-08-15 at 12:09 +0200, Andrew Jones wrote:
> Hmm... so now if the user doesn't specify pmu=3Don (off by default) the=
n we
> silently disable it (I think that's a 2.6 compat issue), and if they do
> specify pmu=3Don, but KVM doesn't support it, then it's silently disabl=
ed,
> which isn't nice. I think QEMU should error out in that case, explainin=
g
> that the user specified incompatible options, i.e. they selected accel=3D=
kvm
> and pmu=3Don, but their KVM version (or cpu model) doesn't support PMU
> emulation.

I agree. Asking qemu to provide a feature that it can't provide
should definitely result in a big fat error.

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
