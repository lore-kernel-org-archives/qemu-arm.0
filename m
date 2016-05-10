Received: by 10.25.208.137 with SMTP id h131csp1816524lfg;
        Mon, 9 May 2016 17:17:36 -0700 (PDT)
X-Received: by 10.55.15.229 with SMTP id 98mr21422265qkp.53.1462839456539;
        Mon, 09 May 2016 17:17:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k41si12591657qgk.59.2016.05.09.17.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 17:17:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43717 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azvMl-00084H-2h
	for alex.bennee@linaro.org; Mon, 09 May 2016 20:17:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1azvMe-0007x8-NM
	for qemu-arm@nongnu.org; Mon, 09 May 2016 20:17:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1azvMd-0000tv-84
	for qemu-arm@nongnu.org; Mon, 09 May 2016 20:17:28 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1azvMd-0000ta-3W; Mon, 09 May 2016 20:17:27 -0400
Received: by mail-oi0-x243.google.com with SMTP id d139so28735690oig.1;
	Mon, 09 May 2016 17:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=5UiiLNzsZmWpohig7Wg+tdYcyieu6okc4lEbQ4a6UUo=;
	b=dhwBq7j66YK/9uDkjeyWN9hmuUbJ8hPnmIeo50Y+JM7VlxpJT8OcMTNJye+GloQGHe
	UVs0r/LgVfGuoPWwinCSDbK+h/Y93TuVga9C8lxVy+xZXhnT3yDn310+oOZah1ovlF8f
	/HILS8xI1vwXIXt6dZj9Mj8I27OT3W0MZ89cgxHijn1hD9xjFh+ixm+nxPDom4vNP4m1
	LZR3rsbvHPRYBbhjgLEZqUdsXWxH6RWwBhlATbfPH2da1Ni8pfg5txOThJNN0+PgO4nc
	RygpGAZ6V61Y+pVgJasCDVksIfwBsefaOSu3nfKHsDXoRy7uxhZWIVOHplIwMgj3FHNX
	ZUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=5UiiLNzsZmWpohig7Wg+tdYcyieu6okc4lEbQ4a6UUo=;
	b=jxWwoAZjVX4mxk/9hnJMgqteMoB2vs7KztvrDCYbMh50MxSfDZ0Dx4AVXjJWDLC7Sw
	7FvNriE5nDsedUFldHpn50JuvoCm+5HAZpUel6i+H0B4jsF1OO0sB0N6N4RmXB+zZpgc
	wV95WZIXY3MXZIjD8uhwoxjk5xQMnaT+CB86Stdsy3VneRisbVNZE1sEHmvtu5yjIJQQ
	d0VLOKbfQnZn7G+nZEowKm3Foa/LE6Gv9WlXMgPvHlrlr2gT1o8VPxUX2p3YATRANieG
	zRbU0bZTdsAEui6LtZj2aEJT3TprAzdmMKpGZVh7t34QCpA0Hn21gFkzHrfwMXhQ7DBh
	VC2Q==
X-Gm-Message-State: AOPr4FXxqc4tPjF4ejbf9DaE3oz4RmWr+BipZSN41596BD8P/syE9aR1c34IMAIj+4gs6u+hafkPcqyz7CYr6g==
X-Received: by 10.157.49.1 with SMTP id e1mr1515211otc.148.1462839446499; Mon,
	09 May 2016 17:17:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.142.193 with HTTP; Mon, 9 May 2016 17:16:51 -0700 (PDT)
In-Reply-To: <CAFEAcA9cGbU+LdZD9YzkJ8VMEyt+gKd5+8qi+Q-m+tgtNBg10w@mail.gmail.com>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
	<CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
	<20160507015121.GF16305@toto>
	<CAKmqyKMNbNoph2s1F4ZnC_Dqc-t_=bRtm5+oAHXnvdF09KHVeg@mail.gmail.com>
	<CAFEAcA9cGbU+LdZD9YzkJ8VMEyt+gKd5+8qi+Q-m+tgtNBg10w@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 9 May 2016 17:16:51 -0700
X-Google-Sender-Auth: XfXdDX7P6xB7TGaM-2HTBrxIuco
Message-ID: <CAKmqyKOjOwWOp-6kzOunxf0F8c8r+ua62gxFJ6x2vJR2Yaz_Nw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 2/2] target-arm: Enable EL2
 for the A53s and A57s
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2S8lKdiD2EF/

On Mon, May 9, 2016 at 10:01 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 May 2016 at 17:58, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> I might have to look at disabling EL3 support for the ZynqMP machine
>> form the command line, as I can't boot Linux with EL3 but not EL2.
>
> I think it's worth trying to find out why this doesn't work:
> I'd hope that Linux can cope with a no-EL2 setup.

It is actually a u-boot problem. I originally just assumed it was a
Linux problem, but it happens before u-boot hands off to Linux.

It appears that u-boot won't work at all with EL3 enabled but EL2
disabled. It always moves to EL2 before moving to EL1 and there is no
code prepared to handle going from EL3 directly to EL1.

Just for the record, I'm specifically talking about what happens in
the do_nonsec_virt_switch() function.

It looks like there are three options:
 1. Add support to u-boot to drop from EL3 to EL1 (I'm assuming this
is possible, as not all implementations have EL2)
 2. Just wait until QEMU adds EL2 support
 3. Allow a QEMU command line option to start in EL1 instead of EL3

Thanks,

Alistair

>
> thanks
> -- PMM
>
