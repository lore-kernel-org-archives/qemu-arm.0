Received: by 10.182.105.169 with SMTP id gn9csp122453obb;
        Fri, 30 Oct 2015 15:05:02 -0700 (PDT)
X-Received: by 10.140.27.149 with SMTP id 21mr13108272qgx.50.1446242702018;
        Fri, 30 Oct 2015 15:05:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w90si7794219qgw.115.2015.10.30.15.05.01
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 15:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:53385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsHnB-00071J-HV
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 18:05:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsHn9-00070P-JB
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 18:05:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsHn8-0007TP-Oz
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 18:04:59 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsHn8-0007TI-KX
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 18:04:58 -0400
Received: by vkex70 with SMTP id x70so55737901vke.3
	for <qemu-arm@nongnu.org>; Fri, 30 Oct 2015 15:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2EK3viB2oKuuDql7f6bwCRo4X05P8mc56bgWFbDJrPc=;
	b=ZfKNXxSyE8ubD6tziMmA+GHchJeId78s04RBmQXyrjrKSg+BjlZBU6EN0DKDkYhkHg
	5OFWo5akG0SWhnX1+CyTLwVKtSnUX5NXWW6sRCxiSCvb5XGMECMhhVT6ZK2ljhhnzll1
	Rnr6Gcit1y5fJ9/RVzozOUQZ2nVeHrMQ9DPpmHTx6UfeHzcxF+lD5yRUsLVE2wWGMRKI
	7VESgwYAH2jPGXPJtzy7KItVVKRoRXhsp5PARdS6Y4yahV7vjC+EqnD1N3CExJ4F/20V
	HDK70uG+ghe391cGcrAFKFXtwZ11S6j8klRosvVsUvKp7I7i9TqQVRpCoFeci6o1qG3S
	qKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2EK3viB2oKuuDql7f6bwCRo4X05P8mc56bgWFbDJrPc=;
	b=UhMmu/h9CJLf3hiPRXehZZfRwWW8U/qOuZQKqXxvBicyDWnPwob6pN+oXZsEIiZbGu
	kSNUV4y+Rssga/uGpIqUIbpviJwQK1FR03Yg2pGqH1xYmandQJ0zS1z6G4NWltT+MJMh
	vjR4dGTJUeiRjKZNNjJviywI0gpIS8VME4hWqGKUrLOfE9aw4x9R3FW29bNpYldJGq2V
	UyBvhl+YNlikbu7rh6JvVWQ1nrj8FyNun/ak4W/rYJ3CDlVsIY0LgUBSAiglOtMAr2aM
	VupjhVdQ1OFGUHIuppDDWKS0u4Sn6NgUtg2eUUwbaHSSZrH8REHq2xg4raxECvFc/pyX
	WV2A==
X-Gm-Message-State: ALoCoQkBbz/j7iU6n4ilSmzJnheCo3Y8MyfzZsG/y6Tw+M8gouLKWwtyMMCmdtM1GmzHOl/sCw/m
X-Received: by 10.31.8.69 with SMTP id 66mr6823160vki.82.1446242698122; Fri,
	30 Oct 2015 15:04:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 30 Oct 2015 15:04:38 -0700 (PDT)
In-Reply-To: <CAPokK=riDMV3v7BZ_2r8U6mi28ELvfgEKut5Lx8XX0Tr4UtGJQ@mail.gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<8f5368aaa0623a87797edc2305d7f7eac40b2e32.1446182614.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9yMi1Ye7n2sQtQ8-fRoothTV=3TjeXmnQCJbE4=0AHGg@mail.gmail.com>
	<CAPokK=oiMULpbMWiCXLA+NVNgKd78vLWZnc4Sekrk+FYakFXfA@mail.gmail.com>
	<CAFEAcA8yZOfDhXG+u9W3xhSuMk_cwdGYJ6V-1NVW=jb8HA6RRg@mail.gmail.com>
	<CAPokK=riDMV3v7BZ_2r8U6mi28ELvfgEKut5Lx8XX0Tr4UtGJQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2015 22:04:38 +0000
Message-ID: <CAFEAcA9h-XygVyHGB_zQ_VjRa1K89TT=axuH4suh47m5r7m0uQ@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::235
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
X-TUID: HMq7/+wj4W4a

On 30 October 2015 at 21:24, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Fri, Oct 30, 2015 at 2:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The other question is what happens on a board like this if
>> the user says -enable-kvm -cpu cortex-a15 ? Does that get us
>> a CPU without the EL3 property? (I forget...) In any case it
>> shouldn't be an error unless the board genuinely can't work
>> with KVM at all, and if we're using KVM then the board
>> blob definitely won't be running in Secure (and can't flip
>> to Monitor mode either).
>
> I think all we can do is exit on !kvm and have the board if() the
> firmware blob for the same. What is supposed to actually happen when a
> virtualized guest running under KVM calls SMC? Does the VM have any
> say on what that SMC does or is that the property of the host OS? The
> latter suggests that Highbank Linux simply cannot be run under KVM.

The VM can intercept SMC, yes (HCR.TSC causes SMC to trap to Hyp,
regardless of what the SCR settings are). I don't know whether KVM
actually does trap it. Typically the need for SMC calls seems to
have only been for A9 and earlier CPUs, though -- mostly the A15
managed to avoid the requirement, so it hasn't been necessary for
KVM to deal with random board specific SMC handling. (Do we need
the SMC handling for the A15 variant of the highbank model?)

thanks
-- PMM
