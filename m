Received: by 10.182.105.169 with SMTP id gn9csp104287obb;
        Fri, 30 Oct 2015 14:15:03 -0700 (PDT)
X-Received: by 10.140.216.213 with SMTP id m204mr13647714qhb.34.1446239703017;
        Fri, 30 Oct 2015 14:15:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n61si7631067qge.12.2015.10.30.14.15.02
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 14:15:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:53186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsH0o-0002gC-Qe
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 17:15:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsH0l-0002eb-S4
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 17:15:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsH0k-0003qM-NN
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 17:14:59 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:35823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsH0k-0003pu-Kk
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 17:14:58 -0400
Received: by vkfw189 with SMTP id w189so55360913vkf.2
	for <qemu-arm@nongnu.org>; Fri, 30 Oct 2015 14:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Yk9rxSNscPbxkQktpXuyvhXr+Eg4vgX+K8sBQqMzsCA=;
	b=sDYp2TtwXUkK2JY2BrLnSLdcXHoyhIlW2FQKP0HbuWy1/lvvqSold+9+Uymzed6pya
	2WGqAr+GGRmdyhMt9qNRU8PqNqvSiO/Xxq4arnBjifSq2zoFYXEBFE0Lx0rpffREaHlN
	2egZ3+RSECtjoAU2ZflgS/S6kPrrHp+WDjViXtUB+wGmZBOtlUR2oPRmVLHDjGE9a9R8
	RFcO7atbSk3L3cIxkgFtiiAus7hOKb0JVHnAWVtwdcvbwhKOJCf/V8302IZ2zIsqGReF
	qJ4VSnfZqthvloaMygAJ95ksuMGKN22R+DdNchwO7dqBNYvnhTi2bS62R9nnBooctqFb
	mbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Yk9rxSNscPbxkQktpXuyvhXr+Eg4vgX+K8sBQqMzsCA=;
	b=LXxie7cL5uMjX4XAT4akWwAq0M72UN8pS3drAqj7sbHTAM+6CyeRJ7FtSXcCxnFcAD
	dOFHqXLoX6TEn9O1xEub6rp9DtXOYupXS8hiocXmdQZbHOdCFe4405bYHyHq7kCSSd1f
	xZQ0erQytLYJrxIeegA8ALW6A09x/NGab+EEgTRJnCD0chP7Rflz4iCn8qLrHkkB0gAN
	P7N3bvM2bLaBEQ6b6281/hY77trX0gyX2HXcpVCAK3pKFQBjEK2x4bpqF+3WMaQ8zZMs
	ljE3SwuzZIrd/5tGJ2UvjopThrTZfPU1X6bCOvWIyvrucYbCpyDOE92u39ZZKfyXf80E
	HPFg==
X-Gm-Message-State: ALoCoQnVGOBhf2x5rdU8LpgGRqfGBhaG5w56pkplSVXwhA/EfIgZSVSq1yG/aDq6CpaW269ZV9bS
X-Received: by 10.31.56.72 with SMTP id f69mr6279972vka.27.1446239698171; Fri,
	30 Oct 2015 14:14:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 30 Oct 2015 14:14:38 -0700 (PDT)
In-Reply-To: <CAPokK=oiMULpbMWiCXLA+NVNgKd78vLWZnc4Sekrk+FYakFXfA@mail.gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<8f5368aaa0623a87797edc2305d7f7eac40b2e32.1446182614.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9yMi1Ye7n2sQtQ8-fRoothTV=3TjeXmnQCJbE4=0AHGg@mail.gmail.com>
	<CAPokK=oiMULpbMWiCXLA+NVNgKd78vLWZnc4Sekrk+FYakFXfA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2015 21:14:38 +0000
Message-ID: <CAFEAcA8yZOfDhXG+u9W3xhSuMk_cwdGYJ6V-1NVW=jb8HA6RRg@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::231
Cc: Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH v2 4/5] arm: boot: Add secure_board_setup flag
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
X-TUID: vciRwThdMEl3

On 30 October 2015 at 20:59, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Fri, Oct 30, 2015 at 1:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> I thought you were planning to have the generic code do the
>> S->NS transition; but I guess it works better in the board
>> code (we have to go up into Monitor and back down again, right?)
>>
>
> Yes I had to change my mind on this one. The issue was that ARM arch
> doesn't guarantee a NS switch by simply modding SCR.NS inline and I
> wanted to follow this convention. The recommended way is via eret
> (presumably from monitor mode?). So to implement this for highbank I
> do a dummy SMC after the SCR.NS switch (from secure EL1). This can't
> be done generically as board-setup may or may-not install a functional
> monitor.
>
>> Is it an error for the board to set secure_board_setup if
>> the CPU doesn't have EL3? (if so, worth mentioning in this
>> comment; maybe assert?)
>>
>
> I don't like assert, as has_el3 is in theory is user modifiable (via
> either -cpu transplants or directly via -global). I think it is an
> error_exit().

The other question is what happens on a board like this if
the user says -enable-kvm -cpu cortex-a15 ? Does that get us
a CPU without the EL3 property? (I forget...) In any case it
shouldn't be an error unless the board genuinely can't work
with KVM at all, and if we're using KVM then the board
blob definitely won't be running in Secure (and can't flip
to Monitor mode either).

thanks
-- PMM
