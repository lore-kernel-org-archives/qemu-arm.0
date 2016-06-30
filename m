Received: by 10.25.21.96 with SMTP id l93csp480489lfi;
        Thu, 30 Jun 2016 11:22:22 -0700 (PDT)
X-Received: by 10.98.46.70 with SMTP id u67mr23581791pfu.134.1467310941753;
        Thu, 30 Jun 2016 11:22:21 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id fj3si5462382pab.156.2016.06.30.11.22.21;
        Thu, 30 Jun 2016 11:22:21 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751610AbcF3SVq (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Thu, 30 Jun 2016 14:21:46 -0400
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36577 "EHLO
	mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969AbcF3SVp (ORCPT <rfc822;kvm@vger.kernel.org>);
	Thu, 30 Jun 2016 14:21:45 -0400
Received: by mail-qk0-f195.google.com with SMTP id r68so15732753qka.3
        for <kvm@vger.kernel.org>; Thu, 30 Jun 2016 11:21:32 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=eyQ2NgWZeoxyz/buT4Yg44yK98Jx/fiN6raIo892d8Y=;
        b=iVQ4UbtMm/aFRndLDHbwmCMuYA8NE3nj82Ol3e5jF/pHsDuFGXfmmzKvSzJGFYLH+J
         dRCLplt5FCvKWvK4BUwLozwdyx+fjjhkjcia9A+yZgzsZw7TFgbruuO1AQwrvOAriZT0
         8RXvat4Qrg2maanU4tAw8s09gWPyCSWfy7WDSN0JbAHVj4N7r9mXl/7L74nROk0mO4n9
         CQEcPyoAGlS5I2Csw9UhNj98Er+/+dUZsuH+N9c1520Ef9ZSzR1pcj5yc9Vr8i4tcAKf
         Dd0KCZiajmPEkIDTpqs0hTdX84dk4vFRcA+H+S59I/Yd5OpT/ZFtd652q/yho6vJUUUF
         VCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=eyQ2NgWZeoxyz/buT4Yg44yK98Jx/fiN6raIo892d8Y=;
        b=L1Y7s0nWYrsDv1mJffKZBFsvQh3w6qUioAcukawyhuXmShdlqWxemrYN7s56dXdFHb
         c8y8vIQOCDKND6v2yeh7H6R6er4MNpWuAQg2WjNnS4diEYnRcPs3Y3kUGQUuFQrwXWNw
         mqaVPEGynY2OHAUMBxIVGvmApKCWdwCpAEzr4ZEXyL8sqjz5IUGxCPi9zFZtaKn7DcQS
         xdH+C6+FsqP9p3rs7pfxQMoZ2ZScDVHyez+5Fvd71aeXbsens60Ma0p/9BYnWWgnl6LG
         UkqsygZ/mg09iMmbHKLiGvuYR8nehK6wy6SP8zsOZomrloUHG3LoFhJKAzL3N9mGQnhQ
         YRqw==
X-Gm-Message-State: ALyK8tJcO+nweZwTWK3MxkAPHBFQCn9uQ/i/O1rpquFZFNrQZMyz2yIG5dEAoN3Lw58SWTLNiRfgAaXTSz9vDg==
X-Received: by 10.37.214.211 with SMTP id n202mr7243725ybg.124.1467310891829;
 Thu, 30 Jun 2016 11:21:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.83.35.205 with HTTP; Thu, 30 Jun 2016 11:21:31 -0700 (PDT)
In-Reply-To: <daa5a9d7-bc26-71ab-cc74-c3a6f0f8787b@redhat.com>
References: <1467150268-11038-1-git-send-email-andrew.smirnov@gmail.com>
 <1467150268-11038-2-git-send-email-andrew.smirnov@gmail.com> <daa5a9d7-bc26-71ab-cc74-c3a6f0f8787b@redhat.com>
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
Date:	Thu, 30 Jun 2016 11:21:31 -0700
Message-ID: <CAHQ1cqEKQvCWWbY2T2ZWn12arfp3J=qUxxgn-Uwx83Q7OemZvw@mail.gmail.com>
Subject: Re: [RFC PATCH] exec: Support non-direct memory writes in cpu_memory_rw_debug
To:	Paolo Bonzini <pbonzini@redhat.com>
Cc:	qemu-devel@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leon Alrae <leon.alrae@imgtec.com>,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"open list:PReP" <qemu-ppc@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:X86" <kvm@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: oEa9zswNWvb3

On Wed, Jun 29, 2016 at 8:55 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 28/06/2016 23:44, Andrey Smirnov wrote:
>> Add code to support writing to memory mapped peripherals via
>> cpu_memory_rw_debug(). The code of that function already supports
>> reading from such memory regions, so this commit makes that
>> functionality "symmetric".
>
> It's not entirely symmetric however, as you cannot write to the MMIO
> registers of romd devices.  Is this correct?  So I'll leave to others
> the review of whether the functionality is appropriate.

What I meant by "symmetric" is that with that change address_space_rw
is used in both code-paths: for reading and for writing. As for your
question, I think so, the reason why I kept it that way was to
preserve the old code's behavior (see
cpu_physical_memory_write_rom_internal). However according to the
comments/documentation in memory.h writes to ROM devices in ROMD and
MMIO mode should always be handled via callbacks so there seem to be a
contradiction there. I don't know QEMU codebase well enough to make a
call on who's right, so I tried to keep the old behavior.

> Regarding the code:
>
>> @@ -2621,7 +2625,7 @@ static MemTxResult address_space_write_continue(AddressSpace *as, hwaddr addr,
>>  }
>>
>>  MemTxResult address_space_write(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
>> -                                const uint8_t *buf, int len)
>> +                                const uint8_t *buf, int len, bool force)
>
> I would prefer to leave this API as is, and instead add a new API such
> as address_space_write_debug or address_space_program.  It's okay to add
> the "force" argument to address_space_write_continue.

Having thought about that, I agree. Will update in v2.

Andrey
