Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p187sm12317991wmd.20.2017.06.12.03.30.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Jun 2017 03:30:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A95FA3E009E;
	Mon, 12 Jun 2017 11:31:32 +0100 (BST)
References: <20170609170100.3599-1-alex.bennee@linaro.org> <20170609170100.3599-4-alex.bennee@linaro.org> <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net> <87vao4b4z5.fsf@linaro.org> <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net> <20170611050730.GA12317@flamenco>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: Richard Henderson <rth@twiddle.net>, peter.maydell@linaro.org, pbonzini@redhat.com, edgar.iglesias@xilinx.com, qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [RFC DEBUG PATCH 3/3] translate-a64: fix lookup_tb_ptr hang (DEBUG!)
In-reply-to: <20170611050730.GA12317@flamenco>
Date: Mon, 12 Jun 2017 11:31:32 +0100
Message-ID: <874lvljy4b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: LaKtaOHr3xJL


Emilio G. Cota <cota@braap.org> writes:

> On Sat, Jun 10, 2017 at 09:59:19 -0700, Richard Henderson wrote:
>> On 06/10/2017 01:51 AM, Alex Bennée wrote:
>> >I would agree with Emilio that we revert but I can't quite shake the
>> >feeling we are missing an underlying problem. Would just skipping the
>> >htable lookup (but keeping the tb_jmp_cache) be an OK fix for now?
>>
>> I agree.  It seems like there's some real problem that this is uncovering.
>>
>> Dropping the htable lookup is certainly ok by me.  If that's enough to
>> un-stick your regression testing for aarch64 guest.
>
> Unfortunately not checking the htable isn't enough to fix it for me.

Interesting. It was for me on my more complex command line (i.e. with
network and disk hardware) but while checking on my plain kernel+initrd
image I can reproduce the "hang" purely with the jmp_cache lookup....

> I spent a few hours on Friday trying (and failing) to understand
> what's going on. Regarding interrupts, I see *more* TB_EXIT_INTERRUPT
> exits than without the patch, so my current best guess is that this is
> a livelock kind of thing.
>
> I'll keep digging, but regardless I think we should revert
> e75449a346 ("target/aarch64: optimize indirect branches") ASAP, and
> then reenable the feature ("revert the revert") once we get to the
> bottom of this.
>
> 		E.


--
Alex Bennée
