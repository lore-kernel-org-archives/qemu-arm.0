Received: by 10.25.208.137 with SMTP id h131csp1788987lfg;
        Tue, 17 May 2016 06:06:58 -0700 (PDT)
X-Received: by 10.140.101.137 with SMTP id u9mr1207245qge.92.1463490418260;
        Tue, 17 May 2016 06:06:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v5si2116705qkv.204.2016.05.17.06.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 May 2016 06:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2ei9-0004L6-Pg
	for alex.bennee@linaro.org; Tue, 17 May 2016 09:06:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2ei2-0004Dn-QZ
	for qemu-arm@nongnu.org; Tue, 17 May 2016 09:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2ei1-0007gl-Pa
	for qemu-arm@nongnu.org; Tue, 17 May 2016 09:06:50 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2ei1-0007gM-LQ
	for qemu-arm@nongnu.org; Tue, 17 May 2016 09:06:49 -0400
Received: by mail-vk0-x235.google.com with SMTP id f66so18658972vkh.2
	for <qemu-arm@nongnu.org>; Tue, 17 May 2016 06:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MCX5pJHFGRC1Jz54raLfV9BebRp17WpiQ66ExiCxsEE=;
	b=YN5uEJ3gOb85JcElAxqvCZ1JjPZLB6LqLGyXX2+AVWAVxdx5D1lXDpQ+fkMIQbVEyQ
	iQ2qys0H+Z7yQFlvxcPpQgI6Ppm3oY/p3klsXQ0vJjWju900KgzVAeJ7ovDkvO7XxlTp
	1DLgNoISn9recdXbnRPFlY7UagBGK/b9qXlQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MCX5pJHFGRC1Jz54raLfV9BebRp17WpiQ66ExiCxsEE=;
	b=AdDqZR4xRBDJup0blGT/j/MPzNy9xKeGtdUgDIY9A1BkSS81tZUxI4GYfmESmJoxUy
	DePq/vBYxWxLya3I73FaBqTJHigaNh5qwE85XvzFhB++p7BR/NECOZBkEOWbxFvjGwjR
	rkiPXQaOKXcwrpxJgIqwz0PQnOu5/Q5vwA1poyd1xwSMicgyhYCwYSRh4aLlMuxJ0sb/
	d8PpI0IfX5+qNXT0Fr28Tpfgg9sP0bubexDNJWX5SaNNq1KL0PGn17603QaYSRuvrPhe
	FehdwCDiqEY5vdtrJ+bL4dD9YyECkk1lX0Br1KMeVDVVifNk4bt63f8HmtXEGwnjos7A
	MBEQ==
X-Gm-Message-State: AOPr4FXSDwO7jQ7zgKh+DuICGcKjGZcRk7ZTvLEOkvPJ5O3iMUOuinHJlglytdvFaj2Ebfq4Ak/WhqXVQbeKu6F+
X-Received: by 10.176.4.102 with SMTP id 93mr558195uav.125.1463490408095; Tue,
	17 May 2016 06:06:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 17 May 2016 06:06:28 -0700 (PDT)
In-Reply-To: <20160517125058.GU3731@toto>
References: <1463487258-27468-1-git-send-email-peter.maydell@linaro.org>
	<1463487258-27468-2-git-send-email-peter.maydell@linaro.org>
	<20160517125058.GU3731@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 May 2016 14:06:28 +0100
Message-ID: <CAFEAcA_9=rS_pG1ci41qCFXCfJ7rx4Muf3zVBfVFwUJ64WOtbQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [PATCH 1/2] target-arm: Set IL bit in syndromes for
 insn abort, watchpoint, swstep
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VH03BVogbkQr

On 17 May 2016 at 13:50, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> On Tue, May 17, 2016 at 01:14:17PM +0100, Peter Maydell wrote:
>> For some exception syndrome types, the IL bit should always be set.
>> This includes the instruction abort, watchpoint and software step
>> syndrome types; add the missing ARM_EL_IL bit to the syndrome
>> values returned by syn_insn_abort(), syn_swstep() and syn_watchpoint().

> Maybe we should have a reference in a comment to the table in
> the pseudo code for AArch64.ExceptionClass?
> It makes it a little easier to understand some of these settings...

I just used the text parts of the ARM ARM as reference for this one,
not the pseudocode (specifically, D7.2.27, the ESR_ELx register description,
has the definition of the IL bit and says which exceptions have IL set).
I think for pretty much any feature in the emulation you need to
look it up in the ARM ARM to understand what it's doing, and we
could end up with cross-references every other line...

thanks
-- PMM
