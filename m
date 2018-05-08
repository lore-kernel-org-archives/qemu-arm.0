Received: by 10.28.4.212 with SMTP id 203csp4380921wme;
        Tue, 8 May 2018 09:40:59 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpNyr+T8bSK8HObmfSr449vTsn+nX5rRmQVDDwoAcYt2f0KjVyWfHJPmYdRa7jzQeCuF/e+
X-Received: by 2002:a0c:ba12:: with SMTP id w18-v6mr21617309qvf.114.1525797659476;
        Tue, 08 May 2018 09:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525797659; cv=none;
        d=google.com; s=arc-20160816;
        b=JjCo5pqCCst3tzQS3Llub205MAWrq/XbDVrzKdunYDzzf/fFsLLn/0NOWh8NxY5jF8
         atzik00+mc5DqOn1a5UEHswotbDbF1xKuU5TiNapl40YJkYsji+ow1MecjyTMHgDXnK0
         jxFHK8dEPgc95ZCn3XrMus9wjmnXvHaJdYTALSxuhaZHk+nohwrXZMVf7maebzOYwCiY
         iBFLZQPH0+2c2PqUwXwCMuThFZmVTbB+H29tQ2WRFPkQnfHzQ+MvNJwoNqFds3iCB8kW
         oV+xUgLzUA2j+tMVIPA4EiylGf9KHOR7Dk80ngoyu5fSYfoTBXn5PydBU8vR2gt7Kjp+
         Qp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=jL+umas4ZjTdHhYjBokB+Dn85ay/04zygpoW5oUI1ok=;
        b=Cw92Wg2La/WUvnfezrWiWH1/Ba8EFC3St92VeSBzAw4ikqwQcGDAZJEDh/TBoD3yYz
         bgFzL4nqJs5553LpuNBPZGfHJ8d/HZX0YLNb5Q3NjcLj+ni5NkAfwREJCatL6PRHRpOi
         R0kwkK0/aV58AoLz3cldlofsJbeOqIcN+VD4dOjmK7FNia/hNPky5xNBxEDyVuqSCesl
         w+myfuDl/DjSudL9FIrrGFUta64PmpuZhH2QEaKjOSGrBe2L7iGQ+1gornpIs9Iuh2++
         wEUb5FImbTVhoc8U+f0RhD5+qKB6Z2eQuq1/Jh1ZRgp4Gw2NK/+RjAOsPp7HP1aKYHnM
         wzcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a82si4972661qka.228.2018.05.08.09.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 09:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG5fe-0004uH-Up
	for alex.bennee@linaro.org; Tue, 08 May 2018 12:40:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fG5fU-0004tX-Tw
	for qemu-arm@nongnu.org; Tue, 08 May 2018 12:40:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fG5fP-0006bb-PC
	for qemu-arm@nongnu.org; Tue, 08 May 2018 12:40:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fG5fP-0006bQ-G6; Tue, 08 May 2018 12:40:43 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7445761B8C;
	Tue,  8 May 2018 16:40:42 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8CD6608F0;
	Tue,  8 May 2018 16:40:41 +0000 (UTC)
Date: Tue, 8 May 2018 13:40:40 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180508164040.GL25013@localhost.localdomain>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5837d14a-b562-c382-f95a-32ef12a4e25c@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 08 May 2018 16:40:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] Running QEMU without default devices /
 kernel / bios (was: Test devices with all machines, not only with "none")
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ECZqw0XBt2FT

On Tue, May 08, 2018 at 07:33:46AM +0200, Thomas Huth wrote:
> On 07.05.2018 21:32, Eduardo Habkost wrote:
> > On Mon, May 07, 2018 at 09:13:57PM +0200, Thomas Huth wrote:
> >> On 07.05.2018 20:21, Eduardo Habkost wrote:
> >>> On Mon, May 07, 2018 at 06:50:35PM +0200, Markus Armbruster wrote:
> >>>> Eduardo Habkost <ehabkost@redhat.com> writes:
> >>>>
> >>>>> On Fri, Apr 27, 2018 at 08:31:58AM +0200, Markus Armbruster wrote:
> >>>>>> Eduardo Habkost <ehabkost@redhat.com> writes:
> >>>>>>
> >>>>>>> On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
> >>>>>>>> On 26.04.2018 13:45, Markus Armbruster wrote:
> >>>>>>>>> Thomas Huth <thuth@redhat.com> writes:
> >>>>>>>> [...]
> >>>>>>>>>> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
> >>>>>>>>>>      qtest_end();
> >>>>>>>>>>  }
> >>>>>>>>>>  
> >>>>>>>>>> +static void add_machine_test_case(const char *mname)
> >>>>>>>>>> +{
> >>>>>>>>>> +    char *path, *args;
> >>>>>>>>>> +
> >>>>>>>>>> +    /* Ignore blacklisted machines */
> >>>>>>>>>> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
> >>>>>>>>>> +        return;
> >>>>>>>>>> +    }
> >>>>>>>>>> +
> >>>>>>>>>> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
> >>>>>>>>>> +    args = g_strdup_printf("-machine %s", mname);
> >>>>>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
> >>>>>>>>>
> >>>>>>>>> This runs test_device_intro_concrete() with "-machine M" for all machine
> >>>>>>>>> types M, in SPEED=slow mode.
> >>>>>>>>>
> >>>>>>>>>> +    g_free(path);
> >>>>>>>>>> +
> >>>>>>>>>> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
> >>>>>>>>>> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
> >>>>>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
> >>>>>>>>>
> >>>>>>>>> This runs test_device_intro_concrete() with "-nodefaults -machine M" for
> >>>>>>>>> all machine types M, in SPEED=slow mode.
> >>>>>>>>>
> >>>>>>>>> Has "without -nodefaults" exposed additional bugs?
> >>>>>>>>
> >>>>>>>> After testing this with all machines, I had to discover that
> >>>>>>>> "-nodefaults" does not work so easily: A lot of the embedded machines
> >>>>>>>> (especially the ARM machines) simply refuse to work with "-nodefaults"
> >>>>>>>> and exit immediately instead. E.g.:
> >>>>>>>>
> >>>>>>>> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=qtest
> >>>>>>>> qemu-system-arm: missing SecureDigital device
> >>>>>>
> >>>>>> These are all bugs.  --nodefaults is supposed to suppress *optional*
> >>>>>> devices, not mandatory ones.
> >>>>>
> >>>>> I'm not sure I understand the requirements.  What exactly is the
> >>>>> definition of "mandatory"?
> >>>>>
> >>>>> A machine created by "qemu-system-x86_64 -machine pc -nodefaults"
> >>>>> is useless because it has no any device to boot from.  How is
> >>>>> that different from a n810 machine not booting because there's no
> >>>>> SD device?
> >>>>
> >>>> I propose:
> >>>>
> >>>> * Stuff that's required for QEMU to run is not suppressed by -nodefaults
> >>>>
> >>>> * Stuff that a real machine has soldered on is also not suppressed
> >>>>
> >>>> * Stuff that can be pulled out of a real machine may be suppressed, even
> >>>>   when that means the guest won't run
> >>>
> >>> Makes sense to me.  It looks like the only obstacle for
> >>> tests/device-introspect and device-crash-test is the first rule.
> >>> "Guest won't boot" isn't a problem, but "QEMU won't run" is.
> >>>
> >>> The first rule is easily testable, too: running
> >>> "$QEMU -machine $MACHINE -nodefaults" and not having a working
> >>> QMP monitor should be reported as a bug by automated tests.
> >>
> >> You mean with "-accel qtest" or without? With "-accel qtest" we should
> >> pretty soon be fine, after Peter's current PULL request has been merged
> >> (which contains a patch from me for fixing these SD card problems with
> >> ARM machines).
> >> Without "-accel qtest", things are not that easy, unfortunately. Lots of
> >> boards require "-kernel" or "-bios" and refuse to work without. So you
> >> can hardly test "-nodefaults" automatically in the normal tcg mode. (But
> >> maybe all boards should allow to start QEMU in case you've at least also
> >> specified "-S" ? ... in that case we've got plenty of work for
> >> BiteSizeTasks ;-) )
> > 
> > Hmm, maybe it's not a bite-sized task after all.  :)
> > 
> > Should we do this gradually?
> > 
> > * Working with -accel qtest is useful, and sounds like an easier goal;
> 
> We're pretty much there already. Apart from the SD card problem (and the
> xen boards), all machines should work with -nodefaults in qtest mode now.
> 
> > * working with -S seems desirable too;
> 
> Yes, it could be interesting to load the firmware / OS via HMP or GDB
> after QEMU has been started.
> 
> Maybe we'd simply need a new function a la:
> 
> bool cpu_starts_automatically()
> {
>     return autostart && !qtest_enabled();
> }
> 
> And then replace all spots where we exit due to missing -kernel or -bios
> parameters, e.g.:
> 
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -286,7 +286,7 @@ static void mcf5208evb_init(MachineState *machine)
> 
>      /* Load kernel.  */
>      if (!kernel_filename) {
> -        if (qtest_enabled()) {
> +        if (!cpu_starts_automatically()) {
>              return;
>          }
>          error_report("Kernel image must be specified");
> 
> Does that sound like a plan?

Not sure.  If a given command-line fails without -S, I would
expect it to also fail if using -S and the "cont" monitor command
is issued.  (But not necessarily if "-S" is used and "cont" is
never issued.)

> 
> > * working without -S (even if the emulated CPU crashes and burns)
> >   would be interesting.
> 
> Not sure whether we really need this. It's likely better to give the
> user a proper error message to use "-kernel" instead of just showing a
> crash.

I think I agree.

> 
> > Related question: what are the use cases where we require
> > "-accel qtest" and "-S" wouldn't work?
> 
> Maybe there are some boards where you can not load code via HMP or GDB
> once you've started QEMU with "-S"? You'd end up with a mostly useless
> HMP prompt in that case, which is a little bit ugly, but not fatal.

You have a point.  I guess the definition of "useless" here
depend on what are the use cases we want to address with -S: are
there reasonable use cases for using -S and never issuing "cont"?

Would it be OK if we reported errors like "kernel image must be
specified"  only when/if "cont" is issued?


> Apart from that ... I can't think of a case where "-S" would not work at
> all once we've introduce something like cpu_starts_automatically().

I'm being convinced that "-accel qtest" and "-S" are not expected
to be equivalent, so my main priority right now is to document
what are the differences.


> 
> > Are the requirements and goals of "-accel qtest" documented
> > somewhere?  Without documentation, it's hard to say when a given
> > qtest_enabled() call in the code is reasonable, or a hack we want
> > to get rid of.
> 
> There's some few documentation in docs/devel/testing.rst and
> https://wiki.qemu.org/Features/QTest - but the quintessence is that
> qtest basically rips out the CPU of the emulated machine and replaces it
> with the qtest stub. So in this case there is no CPU that can run code
> automatically. Thus I think if we abstract this with a function a la
> cpu_starts_automatically(), we should be fine.

If ripping out the CPU is the only purpose of "-accel qtest",
then it sounds equivalent to -S.  But I have the impression that
this is not its only purpose.


I'm reaching two conclusions from this thread:

1) "-accel qtest" has additional purposes other than the "don't
   run any guest code".  We need to document them clearly,
   and it probably can't be replaced by -S directly.

2) It would be nice if we allowed the "cont" command to report
   errors.  This would allow us to report things that prevent a
   VM from running through QMP instead of stderr.  I have
   considered using that to report "host doesn't support CPU
   feature" errors in the past.

-- 
Eduardo
