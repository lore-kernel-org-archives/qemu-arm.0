Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1084716wrt;
        Thu, 4 Oct 2018 09:14:21 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60DdSlfFvplKLUzWXDD4Fm0ozsvBqZBw97DAWiM8rsdQeyfMySFbAgVdMn2DyCsqDvmKOBI
X-Received: by 2002:ac8:3347:: with SMTP id u7-v6mr5802892qta.73.1538669661613;
        Thu, 04 Oct 2018 09:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538669661; cv=none;
        d=google.com; s=arc-20160816;
        b=p4ujMo/DhjbzoZWjTyIQ4LgX1hySwZ/Cf+ybazNsGJsL4q8Ht17P4Ft6YmHdEZC7Cn
         eYbTeEhnaIaaA96UGMaJJhPVLGo4etqBlZpqPiQw2VsZuOibadf7SuDgAHRKGzfR5lFX
         AIMLINs+StMnLU63YThS7olBdQtK2eGMJ714aqILPwavkfuC5f8mJkVLXSktGRhdNY+h
         uCKnmM9UWVGs71LWDmRLWwnMQ0pLQluyARIFZJkiPprwmjq9EqwvYCIpAa6zG2sQQ2iS
         0BSnkcsQVlxI5E5IF6L1N4kkyX2ovL2wgY/3P1r9malG1H33ja9TOMUTCRDKrr6ftbYb
         On8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=vPMxcx+100aBsCmN7HzoWgn7rQ/LKOeo0K+wyu/7uPk=;
        b=z3Z14y3QGM8svn+r6ku5DQmULm8qP7K7hI0XgoeT6KoXCiWUi3j6xKGZQmOy2MY4iU
         WV331pNjvnoZdNy4/M4FhBBMBPGIlf77SdT/jxLXmIXzhZi+XrMfUz2AayZm+EP3MmLa
         Z3j3HdbOK/WDO17pqwY0G1ym9Rvs7gw5diwoilB3jawRrZar4+baBeb89LtR6NdT1imb
         uviV3ZUZ4/UsbR8imiOpuSwBtzmLrwwwwuTOPqcGtQM6lbohc/ezwbko5NHBKUDo6ZZk
         0zVnLFR+NUiSZAzgVqVh1Wk8+oeXeTtDAxpY1ea+TyzVCW60CWIAxIGBxiFPa78pQ5uk
         Z+VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13-v6si3536220qke.305.2018.10.04.09.14.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 09:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g86Ga-0002dy-NI
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 12:14:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g86Fo-0002Bd-EJ
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 12:13:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g86Fn-0003Xa-2l
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 12:13:32 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40289)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g86Fh-0003Gi-4y
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 12:13:27 -0400
Received: by mail-wr1-f68.google.com with SMTP id d2-v6so6128435wro.7
	for <qemu-arm@nongnu.org>; Thu, 04 Oct 2018 09:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vPMxcx+100aBsCmN7HzoWgn7rQ/LKOeo0K+wyu/7uPk=;
	b=bmL2wwfreJqdNvT42mfJfLoYLdlra4YRAC793a04RO46skKl8zcsvRBq2JfLYQpbE2
	yZYTKbv9pd9ANTFduLmiTO3/j64zLBpJs3qxW7asttRILAoJdnaOkPYElSN7oeEdk6H6
	2QypkCsN5UPit7g/3QsomTqCNGHAqjCwbh713b47pdRrSPv5pDlBYNOS0N5KqoKOLH+g
	NsWVdmVtWPBXaWqaEiom9aojQoQrnt0QMn+1ho7qu5Q4F3HWpUcgjaih+VfZS9V2Fmwb
	foPL5PB/eIvED0f4k/lhS5diojo3HRs6toPuEvrb9SKvpov7OcfQ4XCqMGzZzN6YiOpo
	XwJw==
X-Gm-Message-State: ABuFfojRgLt0dWKiF5javtrLI9L0Wtw62VBOIxT2dcLg4XeQQr6/NT7T
	qrvWitSii68VdcQc8e4SNv9IRBdoerY=
X-Received: by 2002:adf:fa04:: with SMTP id
	m4-v6mr5063479wrr.182.1538669598356; 
	Thu, 04 Oct 2018 09:13:18 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	e14-v6sm4366961wrs.69.2018.10.04.09.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 09:13:17 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <08d9d1e0-3c37-4b69-bb68-bf993b91289a@redhat.com>
Date: Thu, 4 Oct 2018 18:13:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002142443.30976-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/9] Clock framework API.
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, konrad@adacore.com,
	luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L3lfKjb0NJdE

Hi Damien,

On 02/10/2018 16:24, Damien Hedde wrote:
> This series aims to add a way to model clocks in qemu between devices.
> This allows to model the clock tree of a platform allowing us to inspect clock
> configuration and detect problems such as disabled clock or bad configured
> pll.
> 
> This series is a reroll of the v4 sent recently without the reset feature as
> requested by Peter. I also took into account the reviews about migration and
> other suggestions.
> 
> This framework was originally discussed in 2017, here:
> https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg07218.html
> 
> For the user, the framework is now very similar to the device's gpio API.
> Clocks inputs and outputs can be added in devices during initialization phase.
> Then an input can be connected to an output: it means every time the output
> clock changes, a callback in the input is triggered allowing any action to be
> taken. A difference with gpios is that several inputs can be connected to a
> single output without doing any glue.
> 
> Behind the scene, there is 2 objects: a clock input which is a placeholder for
> a callback, and a clock output which is a list of inputs. The value transferred
> between an output and an input is an integer representing the clock frequency.
> The input clock callback is called every time the clock frequency changes.
> The input side holds a cached value of the frequency (the output does not need
> one). This allows a device to fetch its input clock frequency at any time
> without caching it itself.
> 
> This internal state is added to handle migration in order not to update and
> propagate clocks during it (it adds cross-device and order-specific effects).
> Each device handles its input clock migration by adding the clock frequency in
> its own vmstate description.
> 
> Regarding the migration strategy, discussion started in the v4 patches.
> The problem is that we add some kind of wire between different devices and 
> we face propagation issue.
> The chosen solution allows migration compatibility from a platform version
> with no implemented clocks to a platform with clocks. A migrated device that
> have a new input clock is responsible to initialize its frequency during
> migration. Each input clock having its own state, such initialization will not
> have any side-effect on other input clock connected to the same output.
> Output clocks, having no state, are not set during migration: If a clock output
> frequency changes due to migration (eg: clock computation bug-fix), the effects
> will be delayed. Eventually the clock output will be updated after migration if
> some (software) event trigger a clock update, but it can not be guaranteed.
> 
> There is also the problem of initialization which is very much like the
> migration. Currently, in the zynq example, clocks outputs are initialized in
> the clock controller device_reset. According to Peter, outputs should not be
> set in device_reset, so we need a better way.
> 
> It is not simple, since we can have complicated cases with several propagation
> step.
> We can't initialize outputs (without propagating) during device init and uses
> inputs value in device_reset to complete the initialization.
> Consider the case where we have a device generating a frequency, another device
> doing a clock division, then a device using this clock.
> [DevClockGenerator] -> clk1 -> [DevClockDiv] -> clk2 -> [Dev]
> I don't see how we can handle such initialization without doing some
> propagation phase at some point.
> 
> Regarding clock gating. The 0 frequency value means the clock is gated.
> If need be, a gate device can be built taking an input gpio and clock and
> generating an output clock.
> 
> I've tested this patchset running Xilinx's Linux on the xilinx-zynq-a9 machine.
> Clocks are correctly updated and we ends up with a configured baudrate of 115601
> on the console uart (for a theoretical 115200) which is nice. "cadence_uart*" and
> "clock*" traces can be enabled to see what's going on in this platform.
> 
> We are considering switching to a generic payload evolution of this API.
> For example by specifying the qom carried type when adding an input/output to
> a device. This would allow us, for example, to add a power input port to handle
> power gating or others ports without modifying the device state structure.
> 
> Any comments and suggestion are welcomed.

How would you instanciate devices and connect their clocks from the
command line (with the -device option)?

Should clocked devices have DeviceClass::user_creatable = false by default?

Thanks,

Phil.
