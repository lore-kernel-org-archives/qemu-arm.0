Received: by 10.182.105.169 with SMTP id gn9csp588977obb;
        Thu, 12 Nov 2015 13:32:12 -0800 (PST)
X-Received: by 10.129.35.8 with SMTP id j8mr17759423ywj.188.1447363932602;
        Thu, 12 Nov 2015 13:32:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e205si11079707ywb.81.2015.11.12.13.32.12
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 12 Nov 2015 13:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:49852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZwzTX-0004jU-0e
	for alex.bennee@linaro.org; Thu, 12 Nov 2015 16:32:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwzTU-0004gb-1r
	for qemu-arm@nongnu.org; Thu, 12 Nov 2015 16:32:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwzTS-0002EO-Tl
	for qemu-arm@nongnu.org; Thu, 12 Nov 2015 16:32:07 -0500
Received: from mail-yk0-x234.google.com ([2607:f8b0:4002:c07::234]:35070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwzTS-0002EG-PD
	for qemu-arm@nongnu.org; Thu, 12 Nov 2015 16:32:06 -0500
Received: by ykba77 with SMTP id a77so115020836ykb.2
	for <qemu-arm@nongnu.org>; Thu, 12 Nov 2015 13:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ogy/qrdBqjbv7G0X7faxxOghBgt/Xv84wxYsk5UyFM4=;
	b=E7Ncv9f7ZSGlpmBlm8+76cNZ4U0xUmufBvduKiwPSb//IbampJkOiL0HWNy6xENmxZ
	XR8l8+XD8qIyw7hVVrGhbePJOBW9esxyba3YpxLI2fRHE7qxssQFHlbS1osVGMkfknvy
	UWYcZOMprC1/sNmP+vQVxmr4BCaeeeKWBT2eFo/aiv1evYV27NUa2nO/4TX5RiMh/tQP
	i03geLgXSbKPeWW1X1Pbul5i+WmeqipSXblC7kZArOTgbm59dcO9Wn9IOqoiNQAiCS1Q
	Wh+jRwtpHh88H/Zr5lMv9VeSMjVpgBUXPhgKHuFWj/wEo2t1fJ4wYxPxerbEWiGUAS7J
	ZSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ogy/qrdBqjbv7G0X7faxxOghBgt/Xv84wxYsk5UyFM4=;
	b=fRh/sBoTmAigGxLr2tFeFd+o+DgfVVfVnqWEOHHnj8eodk2nH//1FxrRaK2E5mU1U5
	G7TnDgUQH+8fCF+f0WX0z4Ttha1YDuG/M94rRw6JL595lVazkIfYSUhgIOj6rVcfDfen
	N7ANkMNG8TLTtqn4ep7DRMS46GuMZD8Fu5KIiiK+B0NPMAcb9jpEI4zEbv3WqiRge68Z
	zYTM71aMTxYAXJnN3BFhzlU7mTzOvhFmNtW8e+Ppjd070+5QND9yYVZcjhgmtU2mDZak
	q5QgXZqFhLETnnkI19SZJE2/pI6snZh7uUc2Z2d04KSX/Sd9wAEKPhPsn0EBrqNKJ9WL
	j1Lg==
X-Gm-Message-State: ALoCoQknICH9DnG6Jn+u1b+/9pcVtZE/Oa5Uk5txMp5/DskS0wrUUN6LgjSSWQqCr6QLrtOTKH/q
X-Received: by 10.129.98.5 with SMTP id w5mr542406ywb.333.1447363926448; Thu,
	12 Nov 2015 13:32:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 12 Nov 2015 13:31:47 -0800 (PST)
In-Reply-To: <da12a1acf1328d40eec6ca59c9e1baa150b7f18a.1447350661.git.crosthwaite.peter@gmail.com>
References: <da12a1acf1328d40eec6ca59c9e1baa150b7f18a.1447350661.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2015 21:31:47 +0000
Message-ID: <CAFEAcA-8u8MshmE3ROXxHWKXPhNVn7_i8C9vcHVqQ5FC8LZGhA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::234
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [PATCH for-2.5 v5 1/1] hw/misc: Add support for ADC
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
X-TUID: QSrM1udBx2BF

On 12 November 2015 at 17:54, Peter Crosthwaite
<crosthwaite.peter@gmail.com> wrote:
> From: Guenter Roeck <linux@roeck-us.net>
>
> Add support for the Xilinx XADC core used in Zynq 7000.
>
> References:
> - Zynq-7000 All Programmable SoC Technical Reference Manual
> - 7 Series FPGAs and Zynq-7000 All Programmable SoC XADC
>   Dual 12-Bit 1 MSPS Analog-to-Digital Converter
>
> Tested with Linux using QEMU machine xilinx-zynq-a9 with devicetree
> files zynq-zc702.dtb and zynq-zc706.dtb, and kernel configuration
> multi_v7_defconfig.
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> [ PC changes:
>   * Changed macro names to match TRM where possible
>   * Made programmers model macro scheme consistent
>   * Dropped XADC_ZYNQ_ prefix on local macros
>   * Fix ALM field width
>   * Update threshold-comparison interrupts in _update_ints()
>   * factored out DFIFO pushes into helper. Renamed to "push/pop"
>   * Changed xadc_reg to 10 bits and added OOB check.
>   * Reduced scope of MCTL reset to just stop channel coms.
>   * Added dummy read data to write commands
>   * Changed _ to - seperators in string names and filenames
>   * Dropped ------------ in header comment
>   * Catchall'ed _update_ints() in _write handler.
>   * Minor whitespace changes.
>   * Use ZYNQ_XADC_FIFO_DEPTH instead of ARRAY_SIZE()
> ]
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
> v5:
>     Fix compile warning
> v4:
>     Addressed Alistair review
>     Minor whitespace changes
>     Use ZYNQ_XADC_FIFO_DEPTH instead of ARRAY_SIZE()
> v3:
>     See [PC changes] in commit message
> v2:
>     Use extract32()
>     Merge zynq_xadc_reset() and _zynq_xadc_reset() into one function
>     Use "xlnx,zynq_xadc"
>     Move device model to include/hw/misc/zynq_xadc.h
>     irq -> qemu_irq
>     xadc_dfifo_depth -> xadc_dfifo_entries
>     Dropped unnecessary comments
>     Merged zynq_xadc_realize() into zynq_xadc_init()
>
>  hw/arm/xilinx_zynq.c        |   6 +
>  hw/misc/Makefile.objs       |   1 +
>  hw/misc/zynq-xadc.c         | 302 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/misc/zynq-xadc.h |  46 +++++++
>  4 files changed, 355 insertions(+)
>  create mode 100644 hw/misc/zynq-xadc.c
>  create mode 100644 include/hw/misc/zynq-xadc.h
>

Applied to master, thanks.

-- PMM
