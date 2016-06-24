Received: by 10.25.21.96 with SMTP id l93csp912912lfi;
        Fri, 24 Jun 2016 00:52:21 -0700 (PDT)
X-Received: by 10.55.82.8 with SMTP id g8mr3019396qkb.133.1466754741388;
        Fri, 24 Jun 2016 00:52:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j5si4012621qka.202.2016.06.24.00.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 00:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGLuW-00065l-Pz
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 03:52:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGLuO-000651-Ob
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 03:52:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGLuN-0003NC-SU
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 03:52:12 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGLuM-0003Mr-LT
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 03:52:11 -0400
Received: by mail-vk0-x22d.google.com with SMTP id j2so140014894vkg.2
	for <qemu-arm@nongnu.org>; Fri, 24 Jun 2016 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m7obEaglkka/GagtAEsJNUTdxgz/2mHSn+gdK4DD/qM=;
	b=Ig/gNSqvChiuZaCRhXOccjIoSg3B4ymdnWTBTai00tchxQETBjGkmBO3Rt5z5CxVDQ
	U60VgAYhFFCk4VGn4pnakh04tiOhtMm4s391Q36bWYk3v4C3fXlEoqlJSpxcUSObf8Wv
	ESOARMxt8Ka5CzSQc243DCz61X/Jb3kPYBk5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m7obEaglkka/GagtAEsJNUTdxgz/2mHSn+gdK4DD/qM=;
	b=SAleVuU/t84YWRQ6pgdt76tYTrgaO3j2L6VdroPNUHpt+RMexNc0xWl4Rre/BQO5V4
	rFE+W9VVRy5lxgjN+G4netLl3PKu19illu3t5csh4BB0XDoXQeaFAoP7ZlRHcBPK9dRA
	RTdhaj054MYGg0jrA21T6J2ve3/fLWSO90hsxOi+FI/Jz/fOGbW96q1pOWOojkd8ttYW
	qfxWCbJJTb99Fsf4abeCdW9tMLb12cok1K2Z5EGW/miUGNebxtXLJ7bNowq7Q3dseTHU
	t+inSi8vIconUIoCGqFTroV8txAmRM7pgBxBlxp/Gm5UMdCDnl5MPjp36CtQ89iK/y7Z
	BXWQ==
X-Gm-Message-State: ALyK8tL0BKxbsOatonpFAa7TRLGGr3U5MzczRqhux6CQBl23nsJjAOtrr5Kb8uVkNrRKQVJQAzZsKpfHFGDyuWVO
X-Received: by 10.176.6.41 with SMTP id f38mr1672764uaf.82.1466754729951; Fri,
	24 Jun 2016 00:52:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 24 Jun 2016 00:51:50 -0700 (PDT)
In-Reply-To: <CAN76PtTSxkNDT+QQ3VicgyLC0LPYuo-7BaEp2AHkQXCfRLTUGg@mail.gmail.com>
References: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
	<CAFEAcA_SRt+uDMy=bAqktW=cGErYkMiAsNGBT7Jbyd1KRGtjxA@mail.gmail.com>
	<CAN76PtRjHq3NPetkobdT_e5O=OvuJ=Q+q+WKHggHo-ShfQAGCg@mail.gmail.com>
	<CAN76PtTSxkNDT+QQ3VicgyLC0LPYuo-7BaEp2AHkQXCfRLTUGg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 08:51:50 +0100
Message-ID: <CAFEAcA82J89CWSQ7AFkTSLTjgKC+Qv-nus6eXkC3_pF2J6K5nw@mail.gmail.com>
To: Kevin Zhao <kevin.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [Qemu-devel] Question about a qemu Aarch64 error
 when adding several SCSI disks
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NQxHjzovhcRG

On 24 June 2016 at 05:58, Kevin Zhao <kevin.zhao@linaro.org> wrote:
> Hi Peter,
>      Follow your advice, I have complied the Qemu v2.6.
> stack@u202158:~$ kvm --version
> QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty), Copyright (c)
> 2003-2008 Fabrice Bellard
>      With this newest version, I use virt-manager to create the guest , the
> xml file is in the attachment. But the Qemu return error when creating:
>      error: internal error: process exited while connecting to monitor:
> qemu-system-aarch64: -device
> pci-bridge,chassis_nr=2,id=pci,bus=pci,addr=0x1: Duplicate ID 'pci' for
> device
>
>      The guest xml file in in attachment. But the XML worked when Qemu is
> v2.4.0.
>       Also I delete the items in the xml :
>   -  <controller type='pci' index='0' model='pcie-root'/>
>   -  <controller type='pci' index='1' model='dmi-to-pci-bridge'>
>   -    <model name='i82801b11-bridge'/>
>   -    <address type='pci' domain='0x0000' bus='0x00' slot='0x01'
> function='0x0'/>
>   -  </controller>
>   -  <controller type='pci' index='2' model='pci-bridge'>
>   -    <model name='pci-bridge'/>
>   -    <target chassisNr='2'/>
>   -    <address type='pci' domain='0x0000' bus='0x01' slot='0x01'
> function='0x0'/>
>   -  </controller>
>       Using virsh create guest.xml, got the error too :
>       error: internal error: process exited while connecting to monitor:
> qemu-system-aarch64: -device
> pci-bridge,chassis_nr=2,id=pci,bus=pci,addr=0x1: Duplicate ID 'pci' for
> device.

Sounds like maybe we just increased the error checking on
our command lines -- you can't have more than one device
with the same ID. I can't tell what the other device with the
same ID is, because this doesn't give all the command line.
If libvirt is generating invalid command lines, that would
be a libvirt bug.

thanks
-- PMM
