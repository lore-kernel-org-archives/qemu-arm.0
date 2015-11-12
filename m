Received: by 10.182.105.169 with SMTP id gn9csp484960obb;
        Thu, 12 Nov 2015 09:56:50 -0800 (PST)
X-Received: by 10.129.4.137 with SMTP id 131mr17304460ywe.169.1447351010487;
        Thu, 12 Nov 2015 09:56:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g124si10136600ywa.317.2015.11.12.09.56.50
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 12 Nov 2015 09:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zww78-0003ad-1R
	for alex.bennee@linaro.org; Thu, 12 Nov 2015 12:56:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zww75-0003WY-JH
	for qemu-arm@nongnu.org; Thu, 12 Nov 2015 12:56:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zww74-0000tv-FM
	for qemu-arm@nongnu.org; Thu, 12 Nov 2015 12:56:47 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:36948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Zww72-0000rm-D4; Thu, 12 Nov 2015 12:56:44 -0500
Received: by wmww144 with SMTP id w144so99663650wmw.0;
	Thu, 12 Nov 2015 09:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TlR88fAlS7ThmGkQAhYsm8iJDTaor7d8LiLx8qDFQsc=;
	b=a/MCU/mxtviq6CQ9h6NFr4czk+Yzd780MGYoOj7GKHr+wl72+ThKIFhg0kfA4Tu6xl
	RiEcLhxBPJgIBCdipTd1RZH4WOvTftyk16ntycyDmuxLQ03rsTrJ6N5eokInx7HfYWRw
	EE3Nz/uBAB2djvp71vYfK8Hy+kmV+OS1HT0E6w/D0DBkvVRw8kDPagdZ1sTHnczdSaw0
	GnsK0fW53YNq/PR4fgNs1hs2hyWc82EHx2AtveqmOHMKLCO59NYLNN6ue5gDQokMtkqY
	cuFyyotP/nAoWYEX5tKST7gxwDMwO2CUX8OcIG5oIrzL1tPWlUS4fs6TMwlPZYW1zJ/S
	HhYA==
MIME-Version: 1.0
X-Received: by 10.194.10.68 with SMTP id g4mr7850699wjb.151.1447351003474;
	Thu, 12 Nov 2015 09:56:43 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Thu, 12 Nov 2015 09:56:43 -0800 (PST)
In-Reply-To: <CAFEAcA9093OOZnfw_JCruwwgXZtTE=GDqPkOTaprtw6k1FfPZw@mail.gmail.com>
References: <57f84029331603f30f01511915e6b202e8424e7c.1447004487.git.crosthwaite.peter@gmail.com>
	<CAFEAcA-_jbVpsDp1br-2NX5aX_J49iBvuxKpjm=Ct0iG=v_8bg@mail.gmail.com>
	<CAFEAcA9093OOZnfw_JCruwwgXZtTE=GDqPkOTaprtw6k1FfPZw@mail.gmail.com>
Date: Thu, 12 Nov 2015 09:56:43 -0800
Message-ID: <CAPokK=qVdAso3UvNep2+yH6w=dgSst+CoXztLBjojTQ0Jt2_rg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22e
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [PATCH for-2.5 v4 1/1] hw/misc: Add support for ADC
 controller in Xilinx Zynq 7000
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
X-TUID: p78Emjq3pi63

On Thu, Nov 12, 2015 at 8:13 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 10 November 2015 at 18:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 9 November 2015 at 07:07, Peter Crosthwaite
>> <crosthwaitepeter@gmail.com> wrote:
>>> From: Guenter Roeck <linux@roeck-us.net>
>>>
>>> Add support for the Xilinx XADC core used in Zynq 7000.
>>>
>>> References:
>>> - Zynq-7000 All Programmable SoC Technical Reference Manual
>>> - 7 Series FPGAs and Zynq-7000 All Programmable SoC XADC
>>>   Dual 12-Bit 1 MSPS Analog-to-Digital Converter
>>>
>>> Tested with Linux using QEMU machine xilinx-zynq-a9 with devicetree
>>> files zynq-zc702.dtb and zynq-zc706.dtb, and kernel configuration
>>> multi_v7_defconfig.
>>>
>>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> [ PC changes:
>>>   * Changed macro names to match TRM where possible
>>>   * Made programmers model macro scheme consistent
>>>   * Dropped XADC_ZYNQ_ prefix on local macros
>>>   * Fix ALM field width
>>>   * Update threshold-comparison interrupts in _update_ints()
>>>   * factored out DFIFO pushes into helper. Renamed to "push/pop"
>>>   * Changed xadc_reg to 10 bits and added OOB check.
>>>   * Reduced scope of MCTL reset to just stop channel coms.
>>>   * Added dummy read data to write commands
>>>   * Changed _ to - seperators in string names and filenames
>>>   * Dropped ------------ in header comment
>>>   * Catchall'ed _update_ints() in _write handler.
>>>   * Minor whitespace changes.
>>>   * Use ZYNQ_XADC_FIFO_DEPTH instead of ARRAY_SIZE()
>>> ]
>>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>>> ---
>>
>>
>>
>> Applied to target-arm.next, thanks.
>
> ...but it fails compilation on a bunch of platforms when built
> with optimization:
> /home/petmay01/qemu/hw/misc/zynq-xadc.c:183:5: error: 'rv' may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>
> so I've dropped it again.
>

v5 on list. Hoping I can convince you on this one as this is make or
break for upstream linux support.

Something is up with my compile-test scripts or GCC it seems.

Regards,
Peter

> thanks
> -- PMM
