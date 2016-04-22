Received: by 10.25.208.194 with SMTP id h185csp841370lfg;
        Fri, 22 Apr 2016 08:43:33 -0700 (PDT)
X-Received: by 10.140.230.20 with SMTP id a20mr3009563qhc.68.1461339813552;
        Fri, 22 Apr 2016 08:43:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x64si3647663qke.279.2016.04.22.08.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 08:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atdEz-0002Td-46
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 11:43:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1atdEx-0002RR-3F
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 11:43:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1atdEs-0001E5-3M
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 11:43:31 -0400
Received: from avon.wwwdotorg.org ([70.85.31.133]:60164)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>)
	id 1atdEr-0001E1-Ro; Fri, 22 Apr 2016 11:43:26 -0400
Received: from [10.20.204.51] (thunderhill.nvidia.com [216.228.112.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by avon.wwwdotorg.org (Postfix) with ESMTPSA id EC8631C0053;
	Fri, 22 Apr 2016 09:43:21 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99 at avon.wwwdotorg.org
To: Gerd Hoffmann <kraxel@redhat.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
	<A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
	<CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
	<DED29353-D9CE-45F5-990F-0A32DB57B4AE@sylvaingarrigues.com>
	<5718FA7F.5030903@wwwdotorg.org>
	<CAPokK=qiaGkd3oZ+r_cLNov4gvAF6Qtv-p6NwxHkY_m4_NrqRg@mail.gmail.com>
	<1461311177.28204.67.camel@redhat.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <571A469B.5050501@wwwdotorg.org>
Date: Fri, 22 Apr 2016 09:43:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1461311177.28204.67.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 70.85.31.133
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] bcm2835_property: use cached
 values when querying framebuffer
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
	Markus Armbruster <armbru@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Sylvain Garrigues <sylvain@sylvaingarrigues.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xn0MAPxjJnHJ

On 04/22/2016 01:46 AM, Gerd Hoffmann wrote:
>    Hi,
>
>>> Ideally as was mentioned earlier this would be done by simply executing the
>>> existing bootloader under emulation, rather than building all that code into
>>> qemu. However, in the Pi case, the bootloader runs on the VideoCore (a
>>> separate non-ARM CPU), so isn't (and likely won't be since IIUC it isn't
>>> fully documented) emulated by qemu. by the time the ARM CPU runs, everything
>>> (kernel, DTB/ATAGS, ARM boot stub, ...) is already loaded into RAM, the
>>> display is already probed over HDMI and the controller scanning out a dummy
>>> image, etc.
>>>
>>> So I think if that were to be supported, it'd have to be coded into qemu. Is
>>> that something that could happen, or would such patches not fit qemu's model
>>> well?
>>
>> I made half a start on this project but had to shelve it.
>>
>> The hard part is the FAT filesystem. The basic approach I started on
>> was to link in the relevant bits of the GNU mtools so QEMU can poke
>> around in a FAT filesystem hosted on a block device. Then just mount
>> the SD card and emulate the boot logic of the VideoCore bootloader.
>> This amount of new code should actually be pretty small, as the FS
>> driver is handled by mtools and the SDHCI can be shorted by just
>> having this alternate bootloader go direct to the block device (fish
>> the blockdev out from the SD card).
>
> Alternatively we can just go for a later boot loader stage, i.e. put a
> u-boot build for rpi2 to pc-bios/ (we already have one for ppc there)
> and run that by default.

The disadvantage here is that people might expect all their options in 
config.txt (e.g. kernel command-line, load address, DTB overlays, GPU 
RAM size, etc.) to be honored on any Pi platform. If we jump straight 
into U-Boot, they won't be, at least not in the typical Pi way.

> Our sdcard emulation seems to have problems though:
>
>     U-Boot 2016.05-rc2 (Apr 22 2016 - 09:11:45 +0200)
>
>     DRAM:  960 MiB
>     RPI 2 Model B (0xa21041)
>     MMC:   <uboot hangs here>

This particular issue is because the bcm2835 timer isn't emulated, and 
the U-Boot MMC driver call udelay or similar, which is implemented by 
waiting for that timer to tick. There's a patch in Andrew's github tree 
that implements the timer, and with that U-Boot at least gets to its 
shell prompt, or did the last time I tested it.
