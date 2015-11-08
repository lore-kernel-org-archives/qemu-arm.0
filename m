Received: by 10.182.105.169 with SMTP id gn9csp777018obb;
        Sun, 8 Nov 2015 10:16:42 -0800 (PST)
X-Received: by 10.140.167.69 with SMTP id n66mr25792836qhn.41.1447006602517;
        Sun, 08 Nov 2015 10:16:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a189si8191330qha.61.2015.11.08.10.16.42
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 10:16:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZvUWA-0007Sr-9L
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 13:16:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvUW7-0007OL-Lo
	for qemu-arm@nongnu.org; Sun, 08 Nov 2015 13:16:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvUW6-0007Ce-PJ
	for qemu-arm@nongnu.org; Sun, 08 Nov 2015 13:16:39 -0500
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:37640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZvUW4-0007Bo-LY; Sun, 08 Nov 2015 13:16:36 -0500
Received: by wiva10 with SMTP id a10so21669862wiv.0;
	Sun, 08 Nov 2015 10:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=b6198VxPAvL6ho0+qIvCuyji6oBP0rqtZUqQP7APPi0=;
	b=FU+Y2jgHaf3IBAD8Sff+o97I5HkEGw2rRByikHxXIXQsw36g+KcNN60yfAWRGhPHPr
	0sK24ktQLs1qxgjy1yWf3mLCW8cAy54IK47a/AKfLXDmUY39m+jzPpOKBl2/tuxi4qDs
	a5psPAxY0gN31XrqGSrTR18EDc/8jEhxD888fIaoLd4C1VPal15CEOq6W4/PJfpREs7J
	/eo/doiJTBwygEa9g4zBLB0WWgYy/vHmr7uMB1ivpFKc0tjGzIzb3yX+YWjaIDulAfvT
	RrELuGwnPpTEQBhj4i6fD018yoZ0+VB2prsDfhbKCORFfju7PNKMGvYJiQnfpsvDk+Ld
	/H+w==
MIME-Version: 1.0
X-Received: by 10.194.209.195 with SMTP id mo3mr16657318wjc.16.1447006595739; 
	Sun, 08 Nov 2015 10:16:35 -0800 (PST)
Received: by 10.28.88.75 with HTTP; Sun, 8 Nov 2015 10:16:35 -0800 (PST)
In-Reply-To: <CAFEAcA9PXVV36qTUW__nSGNudXq4YxqWa4Leg=MfrMsMu1TDog@mail.gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
	<7c00b99113acb1bf62e78f7a71a14eb3b9221ca3.1446428067.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9PXVV36qTUW__nSGNudXq4YxqWa4Leg=MfrMsMu1TDog@mail.gmail.com>
Date: Sun, 8 Nov 2015 10:16:35 -0800
Message-ID: <CAPokK=oMR=KLS1++e+sokuCuV9EV8dKDPgJyQy=_9Bo7bjSo0Q@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH for-2.5 v3 3/3] arm: highbank: Implement PSCI
	and dummy monitor
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
X-TUID: aQH5PN3XCeq9

On Fri, Nov 6, 2015 at 6:47 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 November 2015 at 04:30, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> Firstly, enable monitor mode and PSCI, both are which are features of
>
> "both of which"
>

Fixed.

>> this board.
>>
>> In addition to PSCI, this board also uses SMC for cache maintainence
>> ops. This means we need a secure monitor to catch these and nop them.
>> Use the ARM boot board-setup feature to implement this. All traps to
>> monitor mode implement the nop.
>>

Clarified this a little better as since v3 the non-smc traps are
spinning rather than nopping.

>> As a KVM CPU cannot run in secure mode, do not do the board-setup if
>> not running TCG. Report a warning explaining the limitation is this
>> case.
>
> "in this case".

Fixed.

>
>> @@ -371,6 +410,16 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
>>      highbank_binfo.loader_start = 0;
>>      highbank_binfo.write_secondary_boot = hb_write_secondary;
>>      highbank_binfo.secondary_cpu_reset_hook = hb_reset_secondary;
>> +    if (tcg_enabled()) {
>
> This also needs to be !kvm_enabled(), so 'make check' works.
>

Fixed.

>> +        highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
>> +        highbank_binfo.write_board_setup = hb_write_board_setup;
>> +        highbank_binfo.secure_board_setup = true;
>> +    } else {
>> +        error_report("WARNING: TCG unavailable - "
>> +                     "unable to load built-in Monitor support.\n"
>> +                     "Some guests (such as Linux) may not boot\n");
>
> You can't have newlines in an error_report() string. I suggest
>
>         error_report("WARNING: cannot load built-in Monitor support if KVM "
>                      "is enabled. Some guests (such as Linux) may not boot.");
>

Taken verbatim, although I line wrapped earlier due to new guideline
to stay a little back from 80 chars if possible.

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>

Thanks.

Regards,
Peter

> thanks
> -- PMM
