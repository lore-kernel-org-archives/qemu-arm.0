Received: by 10.182.105.169 with SMTP id gn9csp97975obb;
        Fri, 30 Oct 2015 13:59:50 -0700 (PDT)
X-Received: by 10.140.101.73 with SMTP id t67mr13390948qge.71.1446238790697;
        Fri, 30 Oct 2015 13:59:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d7si6136017qkb.40.2015.10.30.13.59.50
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 13:59:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsGm6-0003Zd-FA
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 16:59:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZsGll-0003If-H7
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 16:59:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZsGlk-0007zm-E2
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 16:59:29 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:34335)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZsGlk-0007zh-7c; Fri, 30 Oct 2015 16:59:28 -0400
Received: by wikq8 with SMTP id q8so18758534wik.1;
	Fri, 30 Oct 2015 13:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jp/iaCwrCvVS8S6lJyGi0se0lSwJN9DpeMGgd5SzwZI=;
	b=sXvFBnu/C4/lyFVSusIHphWvCro17mLc+DTS+P+zJvKS1lShrA2DOyELvjQ51defiB
	Vu2OYNx3SmyO+KdKf1Mp3afBnx0S8MPIiAxs5LMhFZWWsPXQCI9OulS9urIhsX7iMO2s
	sFwApsJE8JH3qqXcnCbOYHUrUihYiDSJe5dAbGf3ZPgUU5Rc4XfuoyPwZOH/HRNzj8uC
	+uEbkTNXbTbHKTm5R0rL08nPIjtvoAAja6Gg3ZJPqI0wgnt7pn1EcuvwSpK0Qm1ZJIEk
	+aFgZGty9btAwLOjyUWZyRmRiqXOAOuglihLwuzGEWh6GbngPLFOvhqHUheb89iH2FTg
	yfFw==
MIME-Version: 1.0
X-Received: by 10.194.23.228 with SMTP id p4mr11938035wjf.151.1446238767633;
	Fri, 30 Oct 2015 13:59:27 -0700 (PDT)
Received: by 10.28.88.75 with HTTP; Fri, 30 Oct 2015 13:59:27 -0700 (PDT)
In-Reply-To: <CAFEAcA9yMi1Ye7n2sQtQ8-fRoothTV=3TjeXmnQCJbE4=0AHGg@mail.gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<8f5368aaa0623a87797edc2305d7f7eac40b2e32.1446182614.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9yMi1Ye7n2sQtQ8-fRoothTV=3TjeXmnQCJbE4=0AHGg@mail.gmail.com>
Date: Fri, 30 Oct 2015 13:59:27 -0700
Message-ID: <CAPokK=oiMULpbMWiCXLA+NVNgKd78vLWZnc4Sekrk+FYakFXfA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: Rob Herring <robh@kernel.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-devel] [PATCH v2 4/5] arm: boot: Add secure_board_setup
	flag
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wgXgLhEitOHf

On Fri, Oct 30, 2015 at 1:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 October 2015 at 05:34, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> Add a flag that when set, will cause the primary CPU to start in secure
>> mode, even if the overall boot in non-secure. This is useful for when
>
> "is non-secure".
>
>> there is a board-setup blob that needs to run from secure mode, but
>> device and secondary CPU init should still be done as-normal for a non-
>> secure boot.
>>
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> ---
>>
>>  hw/arm/boot.c        | 3 ++-
>>  include/hw/arm/arm.h | 6 ++++++
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index b0879a5..6680d45 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -495,7 +495,8 @@ static void do_cpu_reset(void *opaque)
>>                  }
>>
>>                  /* Set to non-secure if not a secure boot */
>> -                if (!info->secure_boot) {
>> +                if (!info->secure_boot &&
>> +                    (cs != first_cpu || !info->secure_board_setup)) {
>>                      /* Linux expects non-secure state */
>>                      env->cp15.scr_el3 |= SCR_NS;
>>                  }
>> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
>> index 9217b70..60dc919 100644
>> --- a/include/hw/arm/arm.h
>> +++ b/include/hw/arm/arm.h
>> @@ -97,6 +97,12 @@ struct arm_boot_info {
>>      hwaddr board_setup_addr;
>>      void (*write_board_setup)(ARMCPU *cpu,
>>                                const struct arm_boot_info *info);
>> +
>> +    /* If set, the board specific loader/setup blob will be run from secure
>> +     * mode, regardless of secure_boot. The blob becomes responsible for
>> +     * changing to non-secure state if implementing a non-secure boot
>> +     */
>> +    bool secure_board_setup;
>>  };
>
> I thought you were planning to have the generic code do the
> S->NS transition; but I guess it works better in the board
> code (we have to go up into Monitor and back down again, right?)
>

Yes I had to change my mind on this one. The issue was that ARM arch
doesn't guarantee a NS switch by simply modding SCR.NS inline and I
wanted to follow this convention. The recommended way is via eret
(presumably from monitor mode?). So to implement this for highbank I
do a dummy SMC after the SCR.NS switch (from secure EL1). This can't
be done generically as board-setup may or may-not install a functional
monitor.

> Is it an error for the board to set secure_board_setup if
> the CPU doesn't have EL3? (if so, worth mentioning in this
> comment; maybe assert?)
>

I don't like assert, as has_el3 is in theory is user modifiable (via
either -cpu transplants or directly via -global). I think it is an
error_exit().

Regards,
Peter

> thanks
> -- PMM
