Received: by 10.182.105.169 with SMTP id gn9csp123500obb;
        Fri, 30 Oct 2015 15:07:31 -0700 (PDT)
X-Received: by 10.55.72.137 with SMTP id v131mr13529229qka.26.1446242851095;
        Fri, 30 Oct 2015 15:07:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g92si7825982qgg.45.2015.10.30.15.07.31
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 15:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsHpa-000891-TJ
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 18:07:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZsHpX-00085p-O7
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 18:07:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZsHpW-0008Rk-Nl
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 18:07:27 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZsHpU-0008RM-NA; Fri, 30 Oct 2015 18:07:24 -0400
Received: by wmeg8 with SMTP id g8so2249355wme.1;
	Fri, 30 Oct 2015 15:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=K1wFlth9ObtP3QZ14fIePBTZpDn5gs5Sj8BPPSKdDiQ=;
	b=iWKk9Nywus4JvMCSIMwtOETnBFmTPijw7FyL+FpA060Juxg8hAt7m3mQ/iPnB0Ujfz
	NzLyDo8asTAVwRgkO+4QUkAspcQmdmHPxa55CN7arZml8t8a4/dcbJ7d5uQP7JtysD+/
	KXs1dCm2H2cawnYA1asBU8neJmmAF7o3Y+4os0fKpsoKo6trFLblJjfsNTief4NYk9j0
	tNXQmHmM92Odym+Sk3XUhoY9VNj6hl8bXvryllp6+uyf3WQaiflLO/c0ek00KMyqu5YG
	unosBmrCDzQADwNyQGgqtwbBpqhIj22UKZWebD4WsSu/nXiiwVm9F/XGCZJuieRVgAey
	yzHQ==
MIME-Version: 1.0
X-Received: by 10.28.17.71 with SMTP id 68mr412473wmr.59.1446242843981; Fri,
	30 Oct 2015 15:07:23 -0700 (PDT)
Received: by 10.28.88.75 with HTTP; Fri, 30 Oct 2015 15:07:23 -0700 (PDT)
In-Reply-To: <CAFEAcA9h-XygVyHGB_zQ_VjRa1K89TT=axuH4suh47m5r7m0uQ@mail.gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<8f5368aaa0623a87797edc2305d7f7eac40b2e32.1446182614.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9yMi1Ye7n2sQtQ8-fRoothTV=3TjeXmnQCJbE4=0AHGg@mail.gmail.com>
	<CAPokK=oiMULpbMWiCXLA+NVNgKd78vLWZnc4Sekrk+FYakFXfA@mail.gmail.com>
	<CAFEAcA8yZOfDhXG+u9W3xhSuMk_cwdGYJ6V-1NVW=jb8HA6RRg@mail.gmail.com>
	<CAPokK=riDMV3v7BZ_2r8U6mi28ELvfgEKut5Lx8XX0Tr4UtGJQ@mail.gmail.com>
	<CAFEAcA9h-XygVyHGB_zQ_VjRa1K89TT=axuH4suh47m5r7m0uQ@mail.gmail.com>
Date: Fri, 30 Oct 2015 15:07:23 -0700
Message-ID: <CAPokK=oGxA91BenSKW2-Jsy8Dce6Hvj-Rd3i_Ux6O7f4fW10tw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::241
Cc: Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH v2 4/5] arm: boot: Add secure_board_setup flag
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
X-TUID: 1Ab7Emx1OMuh

On Fri, Oct 30, 2015 at 3:04 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 October 2015 at 21:24, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Fri, Oct 30, 2015 at 2:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> The other question is what happens on a board like this if
>>> the user says -enable-kvm -cpu cortex-a15 ? Does that get us
>>> a CPU without the EL3 property? (I forget...) In any case it
>>> shouldn't be an error unless the board genuinely can't work
>>> with KVM at all, and if we're using KVM then the board
>>> blob definitely won't be running in Secure (and can't flip
>>> to Monitor mode either).
>>
>> I think all we can do is exit on !kvm and have the board if() the
>> firmware blob for the same. What is supposed to actually happen when a
>> virtualized guest running under KVM calls SMC? Does the VM have any
>> say on what that SMC does or is that the property of the host OS? The
>> latter suggests that Highbank Linux simply cannot be run under KVM.
>
> The VM can intercept SMC, yes (HCR.TSC causes SMC to trap to Hyp,
> regardless of what the SCR settings are). I don't know whether KVM
> actually does trap it. Typically the need for SMC calls seems to
> have only been for A9 and earlier CPUs, though -- mostly the A15
> managed to avoid the requirement, so it hasn't been necessary for
> KVM to deal with random board specific SMC handling. (Do we need
> the SMC handling for the A15 variant of the highbank model?)
>

I think so. This patch series repaired both Higbank and Midway,
although I am use a very generic Kernel so maybe a Kernel config gets
Midway in better shape. My gut feeling is yes, we need SMC for the a15
too.

Regards,
Peter

> thanks
> -- PMM
