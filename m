Received: by 10.28.4.212 with SMTP id 203csp5052642wme;
        Wed, 9 May 2018 00:41:51 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo3JDd7lDTQO9oSsevHn/ooO6HBRhmPGeCMizEy8Tykc3tz/XfswFMHjKF6p0FJaKw07xrH
X-Received: by 10.55.0.129 with SMTP id t1mr36803070qkg.31.1525851711348;
        Wed, 09 May 2018 00:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525851711; cv=none;
        d=google.com; s=arc-20160816;
        b=g679x8yTisKl1qzlrtXU4NZL7GSFuM/eYJCf+Kha9sVoNyE3y9KPK/JZlCJj7KG8Ol
         A1PVvN+0RrpTK+2K2ehHEEQA+B8xhPYmMRzJCST7UMUrvqfN/tm5T4i+oD7R/A5XDAXB
         cIQJA0nEwFIVDoI1U+gqHeJ8obZRJhV6eZcUGtVZOfy6hWeOEQFAvTschzfsQiz2y3Ww
         BzZ/LcHuvx9oSu0xBRzNvdAFyZ3jQv+ROI7InXAu5DclfxjEuVJRKqlaHCLN7uxlRVCC
         geYrWYXNhYD7Af1C13I5JL+GvHF4fHViwhB60i61tEfqGigi0Eb55DjMkPzf+mtS+7v8
         S68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=f/J8C7YA9jPyJ8P6O/Az/sU2dCBXKsBRk3RYGrAeD3o=;
        b=GLQgMXyJoOHkwHQoVHxKm4U0Ddmx9Y3QL/FxmVUMTZz/tTIqasWMC+TH8mznAC7bsF
         6nf4wPA19tUcRWqLgZp55YG3GoD8cOFsMhzTwmQg5I/pA3hLR7VP9T5F6OVsTEoeNCzT
         GZqypYSl01J/0ApNxCaev2aG7UpYdsG042uPnH7r0GWfvEY2imBF6D61qkmL7poO+D6A
         HF+43TGrx7vTEM8utW3IFAlHb7TEtk70Yuw/G+AQA9jrblSOHF0SY175nspEkm7dSqJz
         m+E63D8rpCtxz0BbNfbODfB2fIKF4UoIXFqsLEhHT7spEf6cJRefrh5D+Sqw27Guwfba
         A0EA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l47-v6si3592507qtk.30.2018.05.09.00.41.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 00:41:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGJjS-0002zf-JP
	for alex.bennee@linaro.org; Wed, 09 May 2018 03:41:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fGJjG-0002zL-B8
	for qemu-arm@nongnu.org; Wed, 09 May 2018 03:41:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fGJjB-0001e4-E9
	for qemu-arm@nongnu.org; Wed, 09 May 2018 03:41:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44172 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fGJjB-0001dR-8C; Wed, 09 May 2018 03:41:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58410818F6F2;
	Wed,  9 May 2018 07:41:32 +0000 (UTC)
Received: from [10.36.117.98] (ovpn-117-98.ams2.redhat.com [10.36.117.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC4F9215CDA7;
	Wed,  9 May 2018 07:41:30 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>
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
From: Thomas Huth <thuth@redhat.com>
Message-ID: <87f9536a-3413-419e-5367-90bd60ba27d8@redhat.com>
Date: Wed, 9 May 2018 09:41:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180508164040.GL25013@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 09 May 2018 07:41:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 09 May 2018 07:41:32 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-ppc] [Qemu-devel] Running QEMU without default
 devices / kernel / bios
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1W5xjQPPT9mc

On 08.05.2018 18:40, Eduardo Habkost wrote:
> On Tue, May 08, 2018 at 07:33:46AM +0200, Thomas Huth wrote:
>> On 07.05.2018 21:32, Eduardo Habkost wrote:
>>> On Mon, May 07, 2018 at 09:13:57PM +0200, Thomas Huth wrote:
[...]
>>>> Without "-accel qtest", things are not that easy, unfortunately. Lot=
s of
>>>> boards require "-kernel" or "-bios" and refuse to work without. So y=
ou
>>>> can hardly test "-nodefaults" automatically in the normal tcg mode. =
(But
>>>> maybe all boards should allow to start QEMU in case you've at least =
also
>>>> specified "-S" ? ... in that case we've got plenty of work for
>>>> BiteSizeTasks ;-) )
>>>
>>> Hmm, maybe it's not a bite-sized task after all.  :)
>>>
>>> Should we do this gradually?
>>>
>>> * Working with -accel qtest is useful, and sounds like an easier goal=
;
>>
>> We're pretty much there already. Apart from the SD card problem (and t=
he
>> xen boards), all machines should work with -nodefaults in qtest mode n=
ow.
>>
>>> * working with -S seems desirable too;
>>
>> Yes, it could be interesting to load the firmware / OS via HMP or GDB
>> after QEMU has been started.
>>
>> Maybe we'd simply need a new function a la:
>>
>> bool cpu_starts_automatically()
>> {
>>     return autostart && !qtest_enabled();
>> }
>>
>> And then replace all spots where we exit due to missing -kernel or -bi=
os
>> parameters, e.g.:
>>
>> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
>> --- a/hw/m68k/mcf5208.c
>> +++ b/hw/m68k/mcf5208.c
>> @@ -286,7 +286,7 @@ static void mcf5208evb_init(MachineState *machine)
>>
>>      /* Load kernel.  */
>>      if (!kernel_filename) {
>> -        if (qtest_enabled()) {
>> +        if (!cpu_starts_automatically()) {
>>              return;
>>          }
>>          error_report("Kernel image must be specified");
>>
>> Does that sound like a plan?
>=20
> Not sure.  If a given command-line fails without -S, I would
> expect it to also fail if using -S and the "cont" monitor command
> is issued.  (But not necessarily if "-S" is used and "cont" is
> never issued.)
>=20
>>
>>> * working without -S (even if the emulated CPU crashes and burns)
>>>   would be interesting.
>>
>> Not sure whether we really need this. It's likely better to give the
>> user a proper error message to use "-kernel" instead of just showing a
>> crash.
>=20
> I think I agree.
>=20
>>
>>> Related question: what are the use cases where we require
>>> "-accel qtest" and "-S" wouldn't work?
>>
>> Maybe there are some boards where you can not load code via HMP or GDB
>> once you've started QEMU with "-S"? You'd end up with a mostly useless
>> HMP prompt in that case, which is a little bit ugly, but not fatal.
>=20
> You have a point.  I guess the definition of "useless" here
> depend on what are the use cases we want to address with -S: are
> there reasonable use cases for using -S and never issuing "cont"?
>=20
> Would it be OK if we reported errors like "kernel image must be
> specified"  only when/if "cont" is issued?

From a users point of view, this would be great, yes. You could start
QEMU with -S, set up your machine via HMP, QMP oder GDB, and then try to
start with "cont". If you'd screw it up, "cont" would yell at you and
you could try again.

From a developers point of view, this sounds like a nightmare to get it
right with all the QEMU machines that we support, though.

>> Apart from that ... I can't think of a case where "-S" would not work =
at
>> all once we've introduce something like cpu_starts_automatically().
>=20
> I'm being convinced that "-accel qtest" and "-S" are not expected
> to be equivalent, so my main priority right now is to document
> what are the differences.

Hmmm, I think I originally slightly misunderstood your original
question.... and until now, I also thought that "-accel qtest" would
enable the qtest interface in qtest.c, but it seems like this is rather
done by the "-qtest" parameter instead.

So as far as I can see, it theoretically should be possible to replace
"-accel qtest" with "-S". But I'm also not an expert here.

> I'm reaching two conclusions from this thread:
>=20
> 1) "-accel qtest" has additional purposes other than the "don't
>    run any guest code".  We need to document them clearly,
>    and it probably can't be replaced by -S directly.

There are just two things that come to my mind why we could not
immediately replace "-accel qtest" by "-S":

- There are some few qtest which override "-accel qtest" with "-accel
  tcg". But I think they could simply be changed to use the "cont"
  command instead.

- We should also consider that it is possible nowadays to build QEMU
  with --disable-tcg. In that case, you depend on KVM to be available
  as accelerator. As long as there's still "-accel qtest", it should
  be possible to run "make test" (just the tests that really need tcg
  don't work anymore). But if we remove "-accel qtest" and replace it
  with "-S", the tests can't be run anymore if the host machine does
  not offer KVM (e.g. on an automated builder machine). We could add
  an "-accel none" mode instead, but from a users point of view, that's
  pretty much the same as the current "-accel qtest" mode...

 Thomas
