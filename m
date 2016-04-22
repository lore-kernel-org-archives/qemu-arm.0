Received: by 10.25.208.194 with SMTP id h185csp874257lfg;
        Fri, 22 Apr 2016 09:50:50 -0700 (PDT)
X-Received: by 10.233.216.7 with SMTP id u7mr5641879qkf.141.1461343850742;
        Fri, 22 Apr 2016 09:50:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g67si4012661qgg.60.2016.04.22.09.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 09:50:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ateI6-0006Jp-Bh
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 12:50:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ateI2-0006Gf-Vb
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 12:50:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ateI2-0000mW-3D
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 12:50:46 -0400
Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a]:33132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ateI1-0000mM-U8; Fri, 22 Apr 2016 12:50:46 -0400
Received: by mail-ob0-x22a.google.com with SMTP id tz8so51812469obc.0;
	Fri, 22 Apr 2016 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Kk4PK36OwmDc17F2kdnHK+lAv10JqrQ2v8Cp9c464ic=;
	b=HTpaZNxd6hviU0MOcfaJXwAhQNz5YbBRrfgMiCSc5DNL1gE4DPvtbv3Oz5MTopA9y3
	G0ijHOqsm9xI4aQ/VMTU+oEDPMSCUULcIVBCJkFU9aHlJ2fstNKjPiZG8nASgRFjxlex
	iOzmLJtGs7snS3L1v4sapRZ3OTy/owW9Fo3WBuvSQJFxyiEfAzA+GuToXvdGYkl7tFoi
	mNNeW4e8le/XRXBafqVUk7mjVjcZk/hVLvr051fYCzOoHmvEnWIEWz22FLJyRvybShjt
	2vmtAyqGfhgxNVbHEzJqtxvQNxYZY+SZUJvCdvqyRtOUlO8y1oEKqeXHia2oP5tniPUV
	H8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Kk4PK36OwmDc17F2kdnHK+lAv10JqrQ2v8Cp9c464ic=;
	b=bXSblI+0ZvKHbjjQWWnUuQzcJ9RW2s5/JH9sCtSDgxJJY5ZjqE7L2RcDIYcaY9gJWX
	FUKN3Ln2FpLn0veXvvlLA1XfPBs2FtS0gGDTLCorx8I4FtBn+4OndVdPNnTTgjeaCdbA
	Rc6xhMC9pP19HuLI5PKjmeVh1LnJMMmrFbGWs9quLPUuhDrzywbaPaULN1ZCBGMVsVLk
	Gmtaax1NhqLngy4A1/IHW3Xk66Wxo4fNCKiEviikYIYgPM1KNEyCCvoCOt7LstZ0rGi7
	X9OgCFPbHnG8N16k3n8ONdMjXucXF3GbJFNiqJ2vuNmM9XqOAAWN4A2daxP+LlraMmi7
	Y/zA==
X-Gm-Message-State: AOPr4FVm5ittIvRNf1QnjpfRcj23T3GLr8PZpkN4C43DtbCTF8sLVEm7TMAjTEthMLZNBwYeBmZRvVn4H7k3PQ==
MIME-Version: 1.0
X-Received: by 10.60.115.33 with SMTP id jl1mr9744810oeb.12.1461343845290;
	Fri, 22 Apr 2016 09:50:45 -0700 (PDT)
Received: by 10.157.44.196 with HTTP; Fri, 22 Apr 2016 09:50:45 -0700 (PDT)
In-Reply-To: <1461311177.28204.67.camel@redhat.com>
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
Date: Fri, 22 Apr 2016 09:50:45 -0700
Message-ID: <CAPokK=rO16-K-rCJzhmkoSd2ViZDCOJYqUTduB32aO_nBofxoA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22a
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
	Stephen Warren <swarren@wwwdotorg.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Sylvain Garrigues <sylvain@sylvaingarrigues.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9ORnswI3hJc+

On Fri, Apr 22, 2016 at 12:46 AM, Gerd Hoffmann <kraxel@redhat.com> wrote:
>   Hi,
>
>> > Ideally as was mentioned earlier this would be done by simply executing the
>> > existing bootloader under emulation, rather than building all that code into
>> > qemu. However, in the Pi case, the bootloader runs on the VideoCore (a
>> > separate non-ARM CPU), so isn't (and likely won't be since IIUC it isn't
>> > fully documented) emulated by qemu. by the time the ARM CPU runs, everything
>> > (kernel, DTB/ATAGS, ARM boot stub, ...) is already loaded into RAM, the
>> > display is already probed over HDMI and the controller scanning out a dummy
>> > image, etc.
>> >
>> > So I think if that were to be supported, it'd have to be coded into qemu. Is
>> > that something that could happen, or would such patches not fit qemu's model
>> > well?
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
>

Rather than a later boot stage, could we set this up to be identical
in functionality to the early boot stage? This enables baremetal devs
who want to debug from the real bootrom handoff (handoff from
VideoCore).

Doing it over FAT+bootloader code does however have the advantage of
not having to go through emulated SD card and TCG.

Regards,
Peter

> Our sdcard emulation seems to have problems though:
>
>    U-Boot 2016.05-rc2 (Apr 22 2016 - 09:11:45 +0200)
>
>    DRAM:  960 MiB
>    RPI 2 Model B (0xa21041)
>    MMC:   <uboot hangs here>
>
> Recent linux kernels have trouble talking to the mmc too.
