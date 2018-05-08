Received: by 10.28.4.212 with SMTP id 203csp3776066wme;
        Mon, 7 May 2018 22:41:32 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqPdQyam1eTb3SpsBWh5N1JM4BbKg0nbl1CzWZq02R170JGUXQiQOWIPj7Vzxgx/GOV+cV8
X-Received: by 2002:ac8:10d:: with SMTP id e13-v6mr34438479qtg.403.1525758092482;
        Mon, 07 May 2018 22:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525758092; cv=none;
        d=google.com; s=arc-20160816;
        b=M0we/VMAlt/UAsxD3AYEbwbpwt/IM8f46iqBgjA6VO+0BjP9vumoO8LKtW/9YvTIBK
         uFtmT5Zgzf6SB3pvoWdaI8RnKIZRz54SHUoVKUPFIF7qmdQPLB6AKhC4eeQAZq8Mh3k5
         rqzvyLuB2IZbjkYCiaS1h3ygEhkktO6aZEv6ysoTX3meIWhSdPeqUv1K9HtGpzKyzpEB
         WtuylEkPV+PqCW+cBA2/nL/HMWKtSE1Jd6eZnTLiLGOgjDOAf9ogUgB5rh5iBA62mBPL
         kKU3wvZQFagiuvhDubEsXhniXojDtp6qjaTSS+GsEGCmZoJ6px9slSkyd1m7pFxcRqiT
         F/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=xnrBbcqMQBxb4TeWJU8/n/+i1BW8ljlKFPvLGRogjpo=;
        b=v6dutt1dR18dfTmntZM9FdPFk2L0xNyASF/dJ92IllUq8Wh2qfMFXAqk+3+7moBLRw
         lxuK/m0PAwTh7T0Ze86R7aeNfFPeQ5NYRxtvYVXYZLKTCz9js/5jBSiiRv7bM+sIs3Sc
         F3HvhgEEIAw+9HUajyAG0nNZzXTvKQWxtKTQLcip3O8cLYDWAcTCO6HehtUP8Mrkz3gt
         m3mShUaE/YxA87kPwCPKGpujvty8qZ5JrbX3C1PoGC5u/bCElMYaOf5aGU39pfVPWqrO
         uGvv3UbkhWeb0vMxhzTL62RhiZ4F5pu18kc/9UYK3kk4yYhQ9liIUrIlS4rB3C8XVhJl
         ralQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s26si5246021qkl.331.2018.05.07.22.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 22:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFvNT-0000IZ-Ul
	for alex.bennee@linaro.org; Tue, 08 May 2018 01:41:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fFvNJ-0000IH-H2
	for qemu-arm@nongnu.org; Tue, 08 May 2018 01:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fFvNF-0000eP-Hx
	for qemu-arm@nongnu.org; Tue, 08 May 2018 01:41:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54072 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fFvNF-0000ZI-Bs; Tue, 08 May 2018 01:41:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF165406C744;
	Tue,  8 May 2018 05:41:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FB6E2022EE0;
	Tue,  8 May 2018 05:41:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 40BC11138645; Tue,  8 May 2018 07:41:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
	<20180507135330.GS25013@localhost.localdomain>
	<87h8njtnok.fsf@dusky.pond.sub.org>
	<20180507182126.GC25013@localhost.localdomain>
	<4bba0be5-a52c-48ad-3df4-4e9be3624dc0@redhat.com>
	<20180507193220.GF25013@localhost.localdomain>
Date: Tue, 08 May 2018 07:41:01 +0200
In-Reply-To: <20180507193220.GF25013@localhost.localdomain> (Eduardo Habkost's
	message of "Mon, 7 May 2018 16:32:20 -0300")
Message-ID: <877eoeso0i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 08 May 2018 05:41:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 08 May 2018 05:41:06 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] tests/device-introspect:
 Test devices with all machines, not only with "none"
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ng71fNDZ+oey

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Mon, May 07, 2018 at 09:13:57PM +0200, Thomas Huth wrote:
>> On 07.05.2018 20:21, Eduardo Habkost wrote:
>> > On Mon, May 07, 2018 at 06:50:35PM +0200, Markus Armbruster wrote:
>> >> Eduardo Habkost <ehabkost@redhat.com> writes:
>> >>
>> >>> On Fri, Apr 27, 2018 at 08:31:58AM +0200, Markus Armbruster wrote:
>> >>>> Eduardo Habkost <ehabkost@redhat.com> writes:
>> >>>>
>> >>>>> On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
>> >>>>>> On 26.04.2018 13:45, Markus Armbruster wrote:
>> >>>>>>> Thomas Huth <thuth@redhat.com> writes:
>> >>>>>> [...]
>> >>>>>>>> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
>> >>>>>>>>      qtest_end();
>> >>>>>>>>  }
>> >>>>>>>>  
>> >>>>>>>> +static void add_machine_test_case(const char *mname)
>> >>>>>>>> +{
>> >>>>>>>> +    char *path, *args;
>> >>>>>>>> +
>> >>>>>>>> +    /* Ignore blacklisted machines */
>> >>>>>>>> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
>> >>>>>>>> +        return;
>> >>>>>>>> +    }
>> >>>>>>>> +
>> >>>>>>>> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
>> >>>>>>>> +    args = g_strdup_printf("-machine %s", mname);
>> >>>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>> >>>>>>>
>> >>>>>>> This runs test_device_intro_concrete() with "-machine M" for all machine
>> >>>>>>> types M, in SPEED=slow mode.
>> >>>>>>>
>> >>>>>>>> +    g_free(path);
>> >>>>>>>> +
>> >>>>>>>> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
>> >>>>>>>> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
>> >>>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>> >>>>>>>
>> >>>>>>> This runs test_device_intro_concrete() with "-nodefaults -machine M" for
>> >>>>>>> all machine types M, in SPEED=slow mode.
>> >>>>>>>
>> >>>>>>> Has "without -nodefaults" exposed additional bugs?
>> >>>>>>
>> >>>>>> After testing this with all machines, I had to discover that
>> >>>>>> "-nodefaults" does not work so easily: A lot of the embedded machines
>> >>>>>> (especially the ARM machines) simply refuse to work with "-nodefaults"
>> >>>>>> and exit immediately instead. E.g.:
>> >>>>>>
>> >>>>>> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=qtest
>> >>>>>> qemu-system-arm: missing SecureDigital device
>> >>>>
>> >>>> These are all bugs.  --nodefaults is supposed to suppress *optional*
>> >>>> devices, not mandatory ones.
>> >>>
>> >>> I'm not sure I understand the requirements.  What exactly is the
>> >>> definition of "mandatory"?
>> >>>
>> >>> A machine created by "qemu-system-x86_64 -machine pc -nodefaults"
>> >>> is useless because it has no any device to boot from.  How is
>> >>> that different from a n810 machine not booting because there's no
>> >>> SD device?
>> >>
>> >> I propose:
>> >>
>> >> * Stuff that's required for QEMU to run is not suppressed by -nodefaults
>> >>
>> >> * Stuff that a real machine has soldered on is also not suppressed
>> >>
>> >> * Stuff that can be pulled out of a real machine may be suppressed, even
>> >>   when that means the guest won't run
>> > 
>> > Makes sense to me.  It looks like the only obstacle for
>> > tests/device-introspect and device-crash-test is the first rule.
>> > "Guest won't boot" isn't a problem, but "QEMU won't run" is.
>> > 
>> > The first rule is easily testable, too: running
>> > "$QEMU -machine $MACHINE -nodefaults" and not having a working
>> > QMP monitor should be reported as a bug by automated tests.
>> 
>> You mean with "-accel qtest" or without? With "-accel qtest" we should
>> pretty soon be fine, after Peter's current PULL request has been merged
>> (which contains a patch from me for fixing these SD card problems with
>> ARM machines).
>> Without "-accel qtest", things are not that easy, unfortunately. Lots of
>> boards require "-kernel" or "-bios" and refuse to work without. So you
>> can hardly test "-nodefaults" automatically in the normal tcg mode. (But
>> maybe all boards should allow to start QEMU in case you've at least also
>> specified "-S" ? ... in that case we've got plenty of work for
>> BiteSizeTasks ;-) )
>
> Hmm, maybe it's not a bite-sized task after all.  :)
>
> Should we do this gradually?
>
> * Working with -accel qtest is useful, and sounds like an easier goal;

This is immediately useful.

> * working with -S seems desirable too;
> * working without -S (even if the emulated CPU crashes and burns)
>   would be interesting.

Nice to have for consistency, I think.

> Related question: what are the use cases where we require
> "-accel qtest" and "-S" wouldn't work?
>
> Are the requirements and goals of "-accel qtest" documented
> somewhere?  Without documentation, it's hard to say when a given
> qtest_enabled() call in the code is reasonable, or a hack we want
> to get rid of.

Good question.

    $ git-grep -l qtest docs/
    docs/devel/testing.rst

Its section QTest doesn't mention -accel.

The accelerator was added in commit c7f0f3b1c82.  The commit message
mentions it [lines wrapped for readability]:

    The idea behind qtest is pretty simple.  Instead of executing a CPU
    via TCG or KVM, rely on an external process to send events to the
    device model that the CPU would normally generate.
    
    qtest presents itself as an accelerator.  In addition, a new option
    is added to establish a qtest server (-qtest) that takes a character
    device.  This is what allows the external process to send CPU events
    to the device model.
    
    qtest uses a simple line based protocol to send the events.
    Documentation of that protocol is in qtest.c.

Less than clear.

In my understanding, the purpose of the qtest accelerator is to suppress
guest execution.  We later put it to secondary use of suppressing
whatever stuff (such as warnings) gets in the way of the test suite.
