Received: by 10.182.158.201 with SMTP id ww9csp2697588obb;
        Tue, 15 Dec 2015 13:02:25 -0800 (PST)
X-Received: by 10.55.72.70 with SMTP id v67mr39964672qka.47.1450213345326;
        Tue, 15 Dec 2015 13:02:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f11si2888939qge.19.2015.12.15.13.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 13:02:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8wjp-0001nP-3B
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 16:02:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a8wjm-0001in-7p
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 16:02:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a8wjl-0002pk-7V
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 16:02:22 -0500
Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d]:35537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1a8wjf-0002oQ-GD; Tue, 15 Dec 2015 16:02:15 -0500
Received: by mail-lb0-x22d.google.com with SMTP id u9so13746176lbp.2;
	Tue, 15 Dec 2015 13:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=OtSz841GsagjLXxSTNvnsmLEPr5WVpOoBr4BSiSS1vI=;
	b=htBxDnnUD5+umwV/URf2UKvJ4kb+afISQSnU4O31FM1d9HyhMYWkEC4SOFBY/t7s0K
	EXSLXJzGprDXVbGP0JRamQqnUfLsuntL/8i1hbSxPPaAzwcUa3O26kV6udU6LqJPR2T3
	XDSJcyhiUats4hpI/WRRQwo9jGMYmsgCZl+FeMb+OLK/rV+vVqtkkB92zt88koCbnTMO
	b/Oak6OHJ3M5n8jJaiQr3UxUlTW/ca8IOOlgF+NrBxxczX5T/VQ9wiVFljV+5CQnAu2t
	XypY6jzL/HeIaXZimI8sMxg43++2Z4b1n+dtw9aAiCkEZ3yQvhLlkTTTV6BgPb8hemRv
	Ymmw==
X-Received: by 10.112.219.98 with SMTP id pn2mr16853335lbc.93.1450213333951;
	Tue, 15 Dec 2015 13:02:13 -0800 (PST)
Received: from [192.168.0.65] (broadband-46-188-121-155.2com.net.
	[46.188.121.155])
	by smtp.gmail.com with ESMTPSA id un3sm461357lbc.28.2015.12.15.13.02.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Dec 2015 13:02:12 -0800 (PST)
To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org
References: <1449773244-17078-1-git-send-email-serge.fdrv@gmail.com>
	<566B5E9E.8040108@twiddle.net> <566C7D38.4040609@gmail.com>
	<566EEC05.2080702@twiddle.net>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56707FD3.20705@gmail.com>
Date: Wed, 16 Dec 2015 00:02:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <566EEC05.2080702@twiddle.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22d
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
X-TUID: gQeiNETFIObg

On 12/14/15 19:19, Richard Henderson wrote:
> On 12/12/2015 12:02 PM, Sergey Fedorov wrote:
>> On 12/12/15 02:39, Richard Henderson wrote:
>>> On 12/10/2015 10:47 AM, Sergey Fedorov wrote:
>>>> The "PC advancement" trick was used just after recognizing that a
>>>> breakpoint exception was going to be generated. This trick has had two
>>>> points:
>>>>   1. Guarantee that tb->size isn't zero: there are many places 
>>>> where it's
>>>>      expected to be non-zero. In fact, that is even stated in the 
>>>> comment
>>>>      for this field.
>>>>   2. Try to satisfy disassembler's check for instruction length. To 
>>>> this
>>>>      end, PC advancement was done for estimated instruction length, 
>>>> but
>>>>      actually, didn't work properly in variable-instruction-length 
>>>> cases.
>>>>
>>>> Substitute this trick with checking for TB size at the end of
>>>> translation. If we get an empty TB then just set tb->size to 1 and 
>>>> skip
>>>> disassembling. Setting tb->size to 1 is enough to get correct 
>>>> behaviour,
>>>> whereas an empty TB doesn't obviously need to be disassembled.
>>>
>>> This doesn't help when the TB already has instructions, the TB would
>>> ordinarily cross a page boundary, and the breakpoint is at the page 
>>> boundary.
>>
>> I see your point. But I am wondering why most architectures stop 
>> translating on
>> a page boundary whereas i386 and m86k don't. There are some comments 
>> which say
>> that's to ensure instruction fetch aborts occur at the right place. 
>> Isn't it
>> necessary for all architectures?
>
> In order to support targets with variable-sized instructions, like 
> i386, where a single instruction may straddle the page boundary, 
> generic code can handle a TB taking code from two (and only two) pages.
>
> It's true that some of the way we treat i386 TBs plays a bit fast and 
> loose, in that it's possible to design a code sequence that will 
> report a page access error at the beginning of the TB, rather than 
> another runtime exception which might have been visible if we'd 
> executed the TB.
>
> I believe that someone fixed that for arm thumb, but no one has 
> bothered about this for i386, m68k, or s390.  Because it just doesn't 
> happen in practice; one has to go out of one's way to design the 
> errant code sequence.

As I can see, Peter M. fixed the translation of page-straddling ARM 
Thumb32 insns in 541ebcd (27 Oct 2015). The fixed code ensures that we 
stop translating if we encounter a page-straddling insn in addition to 
stopping at an insn from a next page. Thus we put a page-straddling insn 
into a separate TB so that the insn fetch exception would report the 
actual PC value for both pages. Looks like any other arch should do the 
same, right?

But, if we forget about page-straddling instructions for a moment, 
shouldn't every arch stop translating when crossing a page boundary? If 
yes then a breakpoint at a page boundary could only translate to an 
empty TB.

>
>
>> At least for those architectures which do stop translating on a page 
>> boundary,
>> I think this patch is applicable. Certainly, it would be better to 
>> have a
>> single solution for all architectures.
>
> For that, I think it might be interesting to arrange for non-empty TBs 
> to exit prior to recognizing a breakpoint.  So that a breakpoint TB is 
> always just the one operation.  Except for the fact that "generate an 
> exception" has traditionally been a target-specific helper, we could 
> almost make the entire breakpoint generation be done in common code.
>
> I'd think something like a generic "must we end the TB now" predicate 
> would be the proper hook.  It would contain all of the usual stuff: 
> tcg_op_buf_full and checks for singlestep, but then add "is there a 
> breakpoint at the next pc".

This could be a next step :)

Thanks,
Sergey
