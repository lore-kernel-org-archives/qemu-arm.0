Received: by 10.182.105.169 with SMTP id gn9csp1919597obb;
        Tue, 10 Nov 2015 10:00:35 -0800 (PST)
X-Received: by 10.140.25.166 with SMTP id 35mr6167985qgt.96.1447178435736;
        Tue, 10 Nov 2015 10:00:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 127si3814970qhf.115.2015.11.10.10.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Nov 2015 10:00:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:34634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZwDDf-0000XW-3z
	for alex.bennee@linaro.org; Tue, 10 Nov 2015 13:00:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwDDc-0000VI-EF
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 13:00:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwDDb-0006Jc-GM
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 13:00:32 -0500
Received: from mail-yk0-x231.google.com ([2607:f8b0:4002:c07::231]:36532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZwDDb-0006JX-9e
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 13:00:31 -0500
Received: by ykdr82 with SMTP id r82so6936257ykd.3
	for <qemu-arm@nongnu.org>; Tue, 10 Nov 2015 10:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PxmeM6ymOpN4nklVBwV0LeHgVsntTK13ihPmcdAHT1c=;
	b=afTECLdB2e5++9L2p3hj45XR7C5q872kU+CShRTCkUeDbOnu1DSxNYNo7fxjTNYlh2
	s+FxUjeGd08fKwH184/0e2RP/YJ1qsSwFghL3QzMqJ9gaxt90nhUvmejd/UCNrtktM9R
	0/HJeTsXS3FDJFkrSIS25e3uie69qEoQataRsC68X4A1g1zB2zyCPKkXwyrUBrkoyzOC
	7RB7YBHiMzQ3jrViXrRZrmdAZnbofiZ/eZH66KM8IajUqzAgIZljZFY6Ev7an+ud62fk
	aXktPjzUg0cCYFgrZ9egSpb+n7qZ2i7D+ojJikZ/qVf22SVtfp7Ayxbc4JD58fYLXjtp
	bWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PxmeM6ymOpN4nklVBwV0LeHgVsntTK13ihPmcdAHT1c=;
	b=AvrnYfOpnLctzJ+a/obEsR7fDe5YooqejdnJAEusTSMjt02irbeMVhlTvSNpSHjKd9
	tdG5xWJFmSBPjiI6Dbnn5s+ujZpoxSaSjN+6q+Hz08drMZQdgg0W51huxyw7AJHY/LEs
	Nt6vHkZccXbj/Kh9cS7Yvq/Um5ea2coSFiXJHZkhbMmqKVKWSJyvWGxR2URh+5FXQRO8
	xQB3fFda/d9p+34+pr6azeJSYshS2vEP6RLo9ZDZ0MF7ehpc7gbeufYAo+v0mblM62dd
	ntBgXgReDhQFWxOFkFKdk9nfpmZzGfC4re0XyqDqWLLlGpdcW95fDj7/lgvZviOuhSBI
	DLMg==
X-Gm-Message-State: ALoCoQl6HtqmVmWV33J5H7eyc5LfcVj8oU020mo/zK3XAQhnmJ2WmpsPaXz2nScvBVKt4bWake/w
X-Received: by 10.13.204.2 with SMTP id o2mr538409ywd.160.1447178430803; Tue,
	10 Nov 2015 10:00:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 10 Nov 2015 10:00:11 -0800 (PST)
In-Reply-To: <57f84029331603f30f01511915e6b202e8424e7c.1447004487.git.crosthwaite.peter@gmail.com>
References: <57f84029331603f30f01511915e6b202e8424e7c.1447004487.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2015 18:00:11 +0000
Message-ID: <CAFEAcA-_jbVpsDp1br-2NX5aX_J49iBvuxKpjm=Ct0iG=v_8bg@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::231
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
X-TUID: MR2ge2JGtU4q

On 9 November 2015 at 07:07, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
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



Applied to target-arm.next, thanks.

-- PMM
