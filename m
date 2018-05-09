Received: by 10.28.4.212 with SMTP id 203csp5279871wme;
        Wed, 9 May 2018 05:04:34 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZraW6KqH1xlVOXLZd//b2QKsDsYm4eUQQrU2o666dPIy+2Zrr4poYrqUJf+Vk0aupNSjTcQ
X-Received: by 2002:aed:3b94:: with SMTP id r20-v6mr23350045qte.364.1525867474883;
        Wed, 09 May 2018 05:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525867474; cv=none;
        d=google.com; s=arc-20160816;
        b=pSG3MFevN53wcRv2JrgwVMRubtMyuadWZckYCCwTyqTjryBKis1oNxn8KjsaF4mw3+
         A9avLJgJpjYb81fINFhEBlzp/Nb2VDqVBCcqnDufJXXjcGrjH/poxA9lrxKnQTmuD4lS
         kqYRfbIGp6hVfiG3XN/inPt1Yca2xcy4WCvAD1F8O6rzgD6z14YVUGpBowgdMb8CCvwU
         cFgV0lMog7zz6LgL/F7nlg9yoOwrPdwIeyZoyX9f6BhJMmMRcoDnETomeIRrdnWVxkXi
         J9GukHD5RilnmGk150eLIawYT6pweIs4WL5bEpMhV0cmLCSu8gK6XjlzNSepNAcV6DW3
         I3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=tQuTRzL5RvPcMedTOFBNQrwWyV8Zl2zuISryCH4eizc=;
        b=LrQpuJ4cf15TRIUi/9SgOpT1lWNLwDBWFKauYkR5RwFKcvmoXXgfSggUc7tmoDBxE4
         XFthG8IAis5ZyN7UVIUwZCzTyTIghjcntrUYyOZMkN9FEJyY0ctWTpJi/Rnbp+Q0a+mO
         MiHRsyNkyv9oTgBZK3osdEBNRTtRs0NJi7Ba3TtbcBcKnRmSESB1hg0O9///0Jez8VZJ
         aigkmer9dOr4KHDKztsqymYMpV/HQQK9sBc9Mop4IdRKXNTKiBQ7duUfaAZPUUA2vtFh
         sZTwmLSpyJ/XTMem7OT0JnFI7BKb4WJoVD90cD+EpfZR/FhsCUVZWgC5anyiWfFLXRx5
         7tmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2-v6si993247qtn.252.2018.05.09.05.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 05:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGNpi-0001Gy-BO
	for alex.bennee@linaro.org; Wed, 09 May 2018 08:04:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fGNOp-00084O-FR
	for qemu-devel@nongnu.org; Wed, 09 May 2018 07:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fGNOo-0006JG-2Z
	for qemu-devel@nongnu.org; Wed, 09 May 2018 07:36:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38684 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fGNOl-0006BA-3e; Wed, 09 May 2018 07:36:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4420B4029862;
	Wed,  9 May 2018 11:36:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E36EE2017F00;
	Wed,  9 May 2018 11:36:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BAA661138645; Wed,  9 May 2018 13:36:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
	<20180507135330.GS25013@localhost.localdomain>
	<87h8njtnok.fsf@dusky.pond.sub.org>
	<20180507182126.GC25013@localhost.localdomain>
	<4bba0be5-a52c-48ad-3df4-4e9be3624dc0@redhat.com>
	<20180507193220.GF25013@localhost.localdomain>
	<5837d14a-b562-c382-f95a-32ef12a4e25c@redhat.com>
	<20180508164040.GL25013@localhost.localdomain>
	<87f9536a-3413-419e-5367-90bd60ba27d8@redhat.com>
Date: Wed, 09 May 2018 13:36:40 +0200
In-Reply-To: <87f9536a-3413-419e-5367-90bd60ba27d8@redhat.com> (Thomas Huth's
	message of "Wed, 9 May 2018 09:41:28 +0200")
Message-ID: <871selawmv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 09 May 2018 11:36:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 09 May 2018 11:36:42 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [Qemu-ppc] Running QEMU without default devices /
 kernel / bios
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O1eCZTMEhvCj

Thomas Huth <thuth@redhat.com> writes:

> On 08.05.2018 18:40, Eduardo Habkost wrote:
>> On Tue, May 08, 2018 at 07:33:46AM +0200, Thomas Huth wrote:
>>> On 07.05.2018 21:32, Eduardo Habkost wrote:
>>>> On Mon, May 07, 2018 at 09:13:57PM +0200, Thomas Huth wrote:
> [...]
>>>>> Without "-accel qtest", things are not that easy, unfortunately. Lots of
>>>>> boards require "-kernel" or "-bios" and refuse to work without. So you
>>>>> can hardly test "-nodefaults" automatically in the normal tcg mode. (But
>>>>> maybe all boards should allow to start QEMU in case you've at least also
>>>>> specified "-S" ? ... in that case we've got plenty of work for
>>>>> BiteSizeTasks ;-) )
>>>>
>>>> Hmm, maybe it's not a bite-sized task after all.  :)
>>>>
>>>> Should we do this gradually?
>>>>
>>>> * Working with -accel qtest is useful, and sounds like an easier goal;
>>>
>>> We're pretty much there already. Apart from the SD card problem (and the
>>> xen boards), all machines should work with -nodefaults in qtest mode now.
>>>
>>>> * working with -S seems desirable too;
>>>
>>> Yes, it could be interesting to load the firmware / OS via HMP or GDB
>>> after QEMU has been started.
>>>
>>> Maybe we'd simply need a new function a la:
>>>
>>> bool cpu_starts_automatically()
>>> {
>>>     return autostart && !qtest_enabled();
>>> }
>>>
>>> And then replace all spots where we exit due to missing -kernel or -bios
>>> parameters, e.g.:
>>>
>>> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
>>> --- a/hw/m68k/mcf5208.c
>>> +++ b/hw/m68k/mcf5208.c
>>> @@ -286,7 +286,7 @@ static void mcf5208evb_init(MachineState *machine)
>>>
>>>      /* Load kernel.  */
>>>      if (!kernel_filename) {
>>> -        if (qtest_enabled()) {
>>> +        if (!cpu_starts_automatically()) {
>>>              return;
>>>          }
>>>          error_report("Kernel image must be specified");
>>>
>>> Does that sound like a plan?
>> 
>> Not sure.  If a given command-line fails without -S, I would
>> expect it to also fail if using -S and the "cont" monitor command
>> is issued.  (But not necessarily if "-S" is used and "cont" is
>> never issued.)
>> 
>>>
>>>> * working without -S (even if the emulated CPU crashes and burns)
>>>>   would be interesting.
>>>
>>> Not sure whether we really need this. It's likely better to give the
>>> user a proper error message to use "-kernel" instead of just showing a
>>> crash.
>> 
>> I think I agree.
>> 
>>>
>>>> Related question: what are the use cases where we require
>>>> "-accel qtest" and "-S" wouldn't work?
>>>
>>> Maybe there are some boards where you can not load code via HMP or GDB
>>> once you've started QEMU with "-S"? You'd end up with a mostly useless
>>> HMP prompt in that case, which is a little bit ugly, but not fatal.
>> 
>> You have a point.  I guess the definition of "useless" here
>> depend on what are the use cases we want to address with -S: are
>> there reasonable use cases for using -S and never issuing "cont"?
>> 
>> Would it be OK if we reported errors like "kernel image must be
>> specified"  only when/if "cont" is issued?
>
> From a users point of view, this would be great, yes. You could start
> QEMU with -S, set up your machine via HMP, QMP oder GDB, and then try to
> start with "cont". If you'd screw it up, "cont" would yell at you and
> you could try again.
>
> From a developers point of view, this sounds like a nightmare to get it
> right with all the QEMU machines that we support, though.
>
>>> Apart from that ... I can't think of a case where "-S" would not work at
>>> all once we've introduce something like cpu_starts_automatically().
>> 
>> I'm being convinced that "-accel qtest" and "-S" are not expected
>> to be equivalent, so my main priority right now is to document
>> what are the differences.
>
> Hmmm, I think I originally slightly misunderstood your original
> question.... and until now, I also thought that "-accel qtest" would
> enable the qtest interface in qtest.c, but it seems like this is rather
> done by the "-qtest" parameter instead.
>
> So as far as I can see, it theoretically should be possible to replace
> "-accel qtest" with "-S". But I'm also not an expert here.

-S makes QEMU remain in RUN_STATE_PRELAUNCH.  Without it, QEMU enters
RUN_STATE_RUNNING.

RUN_STATE_RUNNING with accel=qtest is not obviously equivalent to
RUN_STATE_PRELAUNCH!  The state transition does more than just resuming
CPUs.

>> I'm reaching two conclusions from this thread:
>> 
>> 1) "-accel qtest" has additional purposes other than the "don't
>>    run any guest code".  We need to document them clearly,
>>    and it probably can't be replaced by -S directly.
>
> There are just two things that come to my mind why we could not
> immediately replace "-accel qtest" by "-S":
>
> - There are some few qtest which override "-accel qtest" with "-accel
>   tcg". But I think they could simply be changed to use the "cont"
>   command instead.
>
> - We should also consider that it is possible nowadays to build QEMU
>   with --disable-tcg. In that case, you depend on KVM to be available
>   as accelerator. As long as there's still "-accel qtest", it should
>   be possible to run "make test" (just the tests that really need tcg
>   don't work anymore). But if we remove "-accel qtest" and replace it
>   with "-S", the tests can't be run anymore if the host machine does
>   not offer KVM (e.g. on an automated builder machine). We could add
>   an "-accel none" mode instead, but from a users point of view, that's
>   pretty much the same as the current "-accel qtest" mode...

Different name, same thing, not worth changing.
