Received: by 10.182.105.169 with SMTP id gn9csp427857obb;
        Thu, 12 Nov 2015 08:13:52 -0800 (PST)
X-Received: by 10.31.0.6 with SMTP id 6mr4139895vka.109.1447344832843;
        Thu, 12 Nov 2015 08:13:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h142si3111100vkh.140.2015.11.12.08.13.52
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 12 Nov 2015 08:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:47600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZwuVU-00036c-Kl
	for alex.bennee@linaro.org; Thu, 12 Nov 2015 11:13:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwuVS-00036X-Bu
	for qemu-arm@nongnu.org; Thu, 12 Nov 2015 11:13:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwuVR-0000nB-1d
	for qemu-arm@nongnu.org; Thu, 12 Nov 2015 11:13:50 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33470)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwuVQ-0000n0-Us
	for qemu-arm@nongnu.org; Thu, 12 Nov 2015 11:13:48 -0500
Received: by vkbk63 with SMTP id k63so13451302vkb.0
	for <qemu-arm@nongnu.org>; Thu, 12 Nov 2015 08:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eYDdHkEP2Goh+N1jhYuvTEeenYszn8Dp+xHP4o71q+U=;
	b=bB2n1h2RaVvI23eJqOsy3rh60KPbYGg39BPI8L2wz0oxe2i6CbM5HGFbZCQVAFZy9E
	SBr32sVgWG7/arzOrWsVYui1PfNB6BzX7MkgzoEv8AAOSsEkn+GLIkBbI3iMVlmIwuRk
	d8Bwcum8eIqij80Vx9ku+6ZkslQn7MNcMcfqLZPyEfk0DioKG6ceXn6DxRhSJThwEjbp
	DCb7fZ2dYZwlTXgvKniSosvF+5citrfuWJyl/9F7pfWC/Khn25GsHZVH2cRtC1631OjN
	z9mx2p/NXkg1TpDHuEdjbagXG5lWaGj7QIwxTRa4KIhSL4E1jXtfqu+famWEqDNlnHSe
	ThZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eYDdHkEP2Goh+N1jhYuvTEeenYszn8Dp+xHP4o71q+U=;
	b=l4oFVXF19O9XqqqevxpXIS21HCObbCanB7oXBIjhI7nlH5SIhF25rRlblkJjwSc0Mu
	fFz6kiB+egT0TydyGlVcHqL/X7gvCQcvBzYy0dHvWT6LEmpQ3r53cQ3JTqEUUAEeOcB/
	XnwZrn1JvPJizK53RIOU+8SCFGq7ieXoW6CGvPNo52LWjAKjA8u+7CiA11+7PHH5TY3d
	9bhS9yHgQesfUC25RNILmcum1bZkb71doZXw3KayMSMGT7rPWqVoXjWHqqJuEBvNpakb
	0LBj63G6C7GPCynHg6+emsDGG9/YWhjGHsO+X/I6aJhFuoKCFWXpQMpXK0BCh2pwUCLC
	EN3w==
X-Gm-Message-State: ALoCoQk0WSvO9vZE8J0bnKONaG4SzV3yJNVTpBJhQW5RoXK0p+43kE/lkIySquOTIZvh5BHVCnDG
X-Received: by 10.31.15.13 with SMTP id 13mr4238873vkp.82.1447344828388; Thu,
	12 Nov 2015 08:13:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 12 Nov 2015 08:13:29 -0800 (PST)
In-Reply-To: <CAFEAcA-_jbVpsDp1br-2NX5aX_J49iBvuxKpjm=Ct0iG=v_8bg@mail.gmail.com>
References: <57f84029331603f30f01511915e6b202e8424e7c.1447004487.git.crosthwaite.peter@gmail.com>
	<CAFEAcA-_jbVpsDp1br-2NX5aX_J49iBvuxKpjm=Ct0iG=v_8bg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2015 16:13:29 +0000
Message-ID: <CAFEAcA9093OOZnfw_JCruwwgXZtTE=GDqPkOTaprtw6k1FfPZw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22a
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
X-TUID: +JHZvAQOGakE

On 10 November 2015 at 18:00, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 November 2015 at 07:07, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> From: Guenter Roeck <linux@roeck-us.net>
>>
>> Add support for the Xilinx XADC core used in Zynq 7000.
>>
>> References:
>> - Zynq-7000 All Programmable SoC Technical Reference Manual
>> - 7 Series FPGAs and Zynq-7000 All Programmable SoC XADC
>>   Dual 12-Bit 1 MSPS Analog-to-Digital Converter
>>
>> Tested with Linux using QEMU machine xilinx-zynq-a9 with devicetree
>> files zynq-zc702.dtb and zynq-zc706.dtb, and kernel configuration
>> multi_v7_defconfig.
>>
>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> [ PC changes:
>>   * Changed macro names to match TRM where possible
>>   * Made programmers model macro scheme consistent
>>   * Dropped XADC_ZYNQ_ prefix on local macros
>>   * Fix ALM field width
>>   * Update threshold-comparison interrupts in _update_ints()
>>   * factored out DFIFO pushes into helper. Renamed to "push/pop"
>>   * Changed xadc_reg to 10 bits and added OOB check.
>>   * Reduced scope of MCTL reset to just stop channel coms.
>>   * Added dummy read data to write commands
>>   * Changed _ to - seperators in string names and filenames
>>   * Dropped ------------ in header comment
>>   * Catchall'ed _update_ints() in _write handler.
>>   * Minor whitespace changes.
>>   * Use ZYNQ_XADC_FIFO_DEPTH instead of ARRAY_SIZE()
>> ]
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> ---
>
>
>
> Applied to target-arm.next, thanks.

...but it fails compilation on a bunch of platforms when built
with optimization:
/home/petmay01/qemu/hw/misc/zynq-xadc.c:183:5: error: 'rv' may be used
uninitialized in this function [-Werror=maybe-uninitialized]

so I've dropped it again.

thanks
-- PMM
