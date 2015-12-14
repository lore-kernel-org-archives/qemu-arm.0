Received: by 10.182.158.201 with SMTP id ww9csp1857636obb;
        Mon, 14 Dec 2015 08:19:36 -0800 (PST)
X-Received: by 10.140.32.162 with SMTP id h31mr41175839qgh.93.1450109976059;
        Mon, 14 Dec 2015 08:19:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s59si1410011qge.110.2015.12.14.08.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Dec 2015 08:19:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:60761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8VqZ-0001Ut-5F
	for alex.bennee@linaro.org; Mon, 14 Dec 2015 11:19:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1a8VqW-0001SQ-Hu
	for qemu-arm@nongnu.org; Mon, 14 Dec 2015 11:19:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1a8VqV-0000XK-Bs
	for qemu-arm@nongnu.org; Mon, 14 Dec 2015 11:19:32 -0500
Received: from mail-io0-x236.google.com ([2607:f8b0:4001:c06::236]:34681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1a8VqO-0000W5-1u; Mon, 14 Dec 2015 11:19:24 -0500
Received: by ioae126 with SMTP id e126so48906704ioa.1;
	Mon, 14 Dec 2015 08:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=vsYn3gLrk/bkOyDyJTn+5Mzmzb1/gijwHv8MyBBSOEY=;
	b=vn9DcMt7Eoy+aSvxWjgpZs2uBR/jJjozrf4tpePdJ8LBOWfTnaGQBNNKSEaAbwpPc0
	eRKXwFruA5AXbAKDnFwF57iVsi9xS8fSaRPxboAEWIb8CdVcgMMMWEmwEdToS7PpIRFZ
	iKL87mbo3znszYe6wYHTra7qWhsO/iNsdmspBlrLG/vXtLQ3c/PCd4GV8X75tBbXQ8hs
	nYsJ8TkaRjswQQu17mUgMvnlNw6elVyKPe1ZWpL2TwP9WRvGbl7btgA9x0Nq+Nl9+0mB
	E9JwT4qIrT7lIl0Okpui1P0OWjlIjlENINYz+BslWhVabuwXEyAmWcZwAXpMGjOuu7GO
	Ll/w==
X-Received: by 10.107.9.137 with SMTP id 9mr6787653ioj.112.1450109963473;
	Mon, 14 Dec 2015 08:19:23 -0800 (PST)
Received: from bigtime.twiddle.net (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86]) by smtp.googlemail.com with ESMTPSA id
	or1sm6708144igb.4.2015.12.14.08.19.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Dec 2015 08:19:22 -0800 (PST)
To: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-devel@nongnu.org
References: <1449773244-17078-1-git-send-email-serge.fdrv@gmail.com>
	<566B5E9E.8040108@twiddle.net> <566C7D38.4040609@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <566EEC05.2080702@twiddle.net>
Date: Mon, 14 Dec 2015 08:19:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <566C7D38.4040609@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::236
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Anthony Green <green@moxielogic.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae <leon.alrae@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-*: Get rid of "PC
	advancement" trick
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
X-TUID: 0i2sU2tydL/6

On 12/12/2015 12:02 PM, Sergey Fedorov wrote:
> On 12/12/15 02:39, Richard Henderson wrote:
>> On 12/10/2015 10:47 AM, Sergey Fedorov wrote:
>>> The "PC advancement" trick was used just after recognizing that a
>>> breakpoint exception was going to be generated. This trick has had two
>>> points:
>>>   1. Guarantee that tb->size isn't zero: there are many places where it's
>>>      expected to be non-zero. In fact, that is even stated in the comment
>>>      for this field.
>>>   2. Try to satisfy disassembler's check for instruction length. To this
>>>      end, PC advancement was done for estimated instruction length, but
>>>      actually, didn't work properly in variable-instruction-length cases.
>>>
>>> Substitute this trick with checking for TB size at the end of
>>> translation. If we get an empty TB then just set tb->size to 1 and skip
>>> disassembling. Setting tb->size to 1 is enough to get correct behaviour,
>>> whereas an empty TB doesn't obviously need to be disassembled.
>>
>> This doesn't help when the TB already has instructions, the TB would
>> ordinarily cross a page boundary, and the breakpoint is at the page boundary.
>
> I see your point. But I am wondering why most architectures stop translating on
> a page boundary whereas i386 and m86k don't. There are some comments which say
> that's to ensure instruction fetch aborts occur at the right place. Isn't it
> necessary for all architectures?

In order to support targets with variable-sized instructions, like i386, where 
a single instruction may straddle the page boundary, generic code can handle a 
TB taking code from two (and only two) pages.

It's true that some of the way we treat i386 TBs plays a bit fast and loose, in 
that it's possible to design a code sequence that will report a page access 
error at the beginning of the TB, rather than another runtime exception which 
might have been visible if we'd executed the TB.

I believe that someone fixed that for arm thumb, but no one has bothered about 
this for i386, m68k, or s390.  Because it just doesn't happen in practice; one 
has to go out of one's way to design the errant code sequence.


> At least for those architectures which do stop translating on a page boundary,
> I think this patch is applicable. Certainly, it would be better to have a
> single solution for all architectures.

For that, I think it might be interesting to arrange for non-empty TBs to exit 
prior to recognizing a breakpoint.  So that a breakpoint TB is always just the 
one operation.  Except for the fact that "generate an exception" has 
traditionally been a target-specific helper, we could almost make the entire 
breakpoint generation be done in common code.

I'd think something like a generic "must we end the TB now" predicate would be 
the proper hook.  It would contain all of the usual stuff: tcg_op_buf_full and 
checks for singlestep, but then add "is there a breakpoint at the next pc".


r~
