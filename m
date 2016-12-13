Received: by 10.25.205.13 with SMTP id d13csp2414772lfg;
        Tue, 13 Dec 2016 13:16:28 -0800 (PST)
X-Received: by 10.233.235.67 with SMTP id b64mr95907522qkg.156.1481663788548;
        Tue, 13 Dec 2016 13:16:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 20si28593104qki.3.2016.12.13.13.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 13:16:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGuQz-0003FF-K7
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 16:16:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGuQr-0003DY-RH
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:16:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGuQm-0000Ne-TD
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:16:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57980)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGuQm-0000NG-Nh; Tue, 13 Dec 2016 16:16:12 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2274A16F8CC;
	Tue, 13 Dec 2016 21:16:11 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBDLG7Dd021809
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 13 Dec 2016 16:16:09 -0500
Date: Tue, 13 Dec 2016 22:16:06 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161213211606.x4cssgt4knld4m4z@hawk.localdomain>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 13 Dec 2016 21:16:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/23] arm: Add virtualization
 to GICv3, and enable EL2 on 64-bit CPUs
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: INtVWOQy/JAd

On Tue, Dec 13, 2016 at 10:36:01AM +0000, Peter Maydell wrote:
> This patchset adds support for the Virtualization extensions to QEMU's
> GICv3 emulation. This was the last missing piece that was stopping
> us from turning on the EL2 support in the CPU model, so the patchset
> also adds support for enabling it all on the virt board via the
> '-machine virtualization=on' option.
> 
> The result works well enough to allow booting a KVM outer guest kernel
> and then running QEMU + an inner guest under KVM inside it. The outer
> guest KVM also passes the kvm-unit-tests GIC tests.
>

I've started some testing with this. When I boot an outer (L1) kernel
with more than one cpu allocated I get

[    3.441908] CPU: CPUs started in inconsistent modes
[    3.442787] ------------[ cut here ]------------
[    3.445434] WARNING: CPU: 0 PID: 1 at arch/arm64/kernel/smp.c:418 smp_cpus_done+0x80/0xa0
...

and KVM does not init. Booting with only one cpu I see we do start in EL2
and KVM does init. I'm booting the L1 kernel through UEFI (AAVMF). Also,
my L1 guest kernel is 4.9 based, but not pure upstream. I can try a more
pure 4.9 kernel with a defconfig later.

Thanks,
drew
