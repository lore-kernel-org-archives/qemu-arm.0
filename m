Received: by 10.25.208.211 with SMTP id h202csp1770734lfg;
        Tue, 1 Mar 2016 10:27:02 -0800 (PST)
X-Received: by 10.141.2.11 with SMTP id e11mr1235177qhd.69.1456856822026;
        Tue, 01 Mar 2016 10:27:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u68si2466231qgd.75.2016.03.01.10.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 10:27:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aap0f-00050t-FD
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 13:27:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aap0d-0004yx-MQ
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 13:27:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aap0c-0004vp-TC
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 13:26:59 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:36082)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aap0c-0004vR-MW; Tue, 01 Mar 2016 13:26:58 -0500
Received: by mail-wm0-x22a.google.com with SMTP id n186so50729638wmn.1;
	Tue, 01 Mar 2016 10:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=PpqDzrk41jRh6W9g9f6HvpoHn6UB8gTGzFv9vwQliKA=;
	b=1I4y1hF5Cgii2E5f07KMSORELTew9HMsZpyi3Q9tDlZj98AQ/pwa/vjTCmmShkkhjC
	6F5E/m7SvR0oliJL+PeLRd+kRg0dyFPCNb2hFe9VT6wUPxOwkQ0zFvcSWuGhmIa8etaT
	ddiXVHdAElVoVPzuJ+YKCnOpgCdD1c20sLTDiYW9HK+9Q+6Ljz1/t9Zxr+urWWoFcYUm
	DCTANpgHLt0rhBn5Ly8VE4jSwXCPhS/vtyS5U7F6+C4/04lvcZ6VUkeqicZb9xFRVJs+
	mhX1qM4l8IzZc3Hs4o75jD9MheOAGewKtgoKm5MFu1yx7ZYcOBUuNb7RRPKkRZ8o82/X
	jV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=PpqDzrk41jRh6W9g9f6HvpoHn6UB8gTGzFv9vwQliKA=;
	b=mfnPoW6QawvCa0/Qo5Paly6wPKkgRXEOacugW8oKTDip+voruxXeHJvycvRhxOaIdm
	ifi1j4rifmADaFJIUe/N3gtceKqh6AFu5BRQ9Ft7+LaVaD964b2aDU2nZH+wSKDjoyAr
	Rlz5RWF+gW3XjBZKNtBs31rRlWr+Y78Iky9ObdKWMFmTMkWtitUNEwHcDCvD1xJvd0zc
	5ju315+q+qBS4V1lnakmEDdPDcypxnQK+Y32Ms4OaXc0W8BuJWoBbdu3+1gpC17uOECF
	87xZxKs1oFERfFemu6E1SGFOHKCuYI2Xg0HiQQkHrXpn3cG4lf3Q3+fMiZUI17JnDfUY
	ovoA==
X-Gm-Message-State: AD7BkJILqUd4RjxaEydrUmq3nzP3hqJacJACP86jw8tGn9vdbaC4Wi214X1Al4b9Ql49kkZj0jfyesE5g7/e2g==
MIME-Version: 1.0
X-Received: by 10.28.51.74 with SMTP id z71mr427868wmz.15.1456856817662; Tue,
	01 Mar 2016 10:26:57 -0800 (PST)
Received: by 10.28.157.197 with HTTP; Tue, 1 Mar 2016 10:26:57 -0800 (PST)
In-Reply-To: <56D52825.1010107@weilnetz.de>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<56D52825.1010107@weilnetz.de>
Date: Tue, 1 Mar 2016 10:26:57 -0800
Message-ID: <CAPokK=pf5NkR9=gvhBpExNCPF+DRf4xUUBupgtJWTH0OYDTpgg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 00/17] ARM big-endian and
	setend support
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
X-TUID: /5KZIkSrHHDA

On Mon, Feb 29, 2016 at 9:27 PM, Stefan Weil <sw@weilnetz.de> wrote:
> Am 18.01.2016 um 08:12 schrieb Peter Crosthwaite:
>> Hi All,
>>
>> This patch series adds system-mode big-endian support for ARM. It also
>> implements the setend instruction, and loading of BE binaries even in
>> LE emulation mode.
>>
>> Based on Paolo's original work. I have moved all the BE32 related work
>> to the back of the series. Multiple parties are interested in the BE8
>> work just on its own, so that could potentially be merged w/o BE32.
>> PMM requested BE32 be at least thought out architecturally, so this
>> series sees BE32 functionality through.
>>
>> I have tested all of LE. BE8 and BE32 in both linux-user mode (for
>> regressions) and system mode (BE8 and BE32 are new here).
>> My test application is here, the README gives some example command
>> lines you can run:
>>
>> https://github.com/pcrost/arm-be-test
>>
>> Regards,
>> Peter
>
> It would be nice to get at least the emulation for 'setend' into the
> next version, because it is needed for the Raspberry Pi emulation.
>
> Peter C., are you planning a new pull request? Maybe the number
> of commits needed can be reduced by adding the already reviewed
> ones to QEMU.
>

I have the respun branch based on Peter's comments tested as working.
I automated my tests so the last thing to do is bisect-ability test it
(test every commit for regressions) before I post it. I am stretched
and still have a series to review at the front of my todo list though.

Regards,
Peter

> Regards,
> Stefan
>
>
