Received: by 10.28.4.212 with SMTP id 203csp3342681wme;
        Mon, 7 May 2018 12:32:40 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpsxpvglrLHUZzj45s9IztKH9L7O/b+cmfPDavW4wq21yYj5iSmsCOiVxciUs0/8YG8Idkk
X-Received: by 2002:a0c:926f:: with SMTP id 44-v6mr5145248qvz.149.1525721560501;
        Mon, 07 May 2018 12:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525721560; cv=none;
        d=google.com; s=arc-20160816;
        b=VXsHQd2jI7toYNNmHZ3ik62tH/sfNFh4DqHGQPdbEUaDc6XW5H7TNfybD8VmXxJlEV
         UEut+aINX03O40kYBQ464YFjA4h6q41yBc+jCwS+P1dwS/wo5i7MlF2+oCJqt1LV88qs
         WADG90PCs8MScvMbi7ZrRCRdbbKPH7rBAgjG/xIC5PBWSydzv0xJ2qXzxr7cv9FCh8Rr
         wDWEt9gGmGyxWr1i/VF8O5WshCFgElqFuupBeJDHhOrw0Pll5heByMK8QBhxFMbGTjS4
         B1QtfzpoAUURkOR2aBkb7Bk0islgZrAcZ5lpWj9AJnNa+y1d/tdGpclsYfgbjm3sNtwS
         UH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=SnjisY4zZCZMtBaVIzMtF/k7o1CRmfjuFmCoD91xxMI=;
        b=OpA43841yhXsMid96VDDvaHqfVzRfKohDHAvRf57JM46PMWFYQ2FDQlAVDCK+avu8d
         gx4VQbUtxrAp8EyDhInFhmgudql5dKnGOC1zc54YFdGHLrM+XrjLuStTL2/3QdoT7YJ8
         3H+kJJ8iiUhPf47/t0lwbTbHe2+3xnP6H8xVzFYX48tu28Zxc2yg0smK21+tjJNzHOwo
         gh3ETJECOK4t8o//niSlag8t/Cp8YN3UVNCFNBrQO2MYtUK7y2dX+ES+hUqsRZeUPG2j
         bkfxsujUC6WuESJDTyvUgzXbSlK/rSQhqnxS32xWTKzJsGri3tpiHIb9C31IUYTw0/xo
         GEqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x20-v6si8486164qtb.238.2018.05.07.12.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 12:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFlsG-00073h-0M
	for alex.bennee@linaro.org; Mon, 07 May 2018 15:32:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fFls2-000727-Hs
	for qemu-arm@nongnu.org; Mon, 07 May 2018 15:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fFlrz-0000vL-BX
	for qemu-arm@nongnu.org; Mon, 07 May 2018 15:32:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45464)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fFlrz-0000uw-2a; Mon, 07 May 2018 15:32:23 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com
	[10.5.11.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 332823180D4F;
	Mon,  7 May 2018 19:32:22 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9828A30B4985;
	Mon,  7 May 2018 19:32:21 +0000 (UTC)
Date: Mon, 7 May 2018 16:32:20 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180507193220.GF25013@localhost.localdomain>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
	<20180507135330.GS25013@localhost.localdomain>
	<87h8njtnok.fsf@dusky.pond.sub.org>
	<20180507182126.GC25013@localhost.localdomain>
	<4bba0be5-a52c-48ad-3df4-4e9be3624dc0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bba0be5-a52c-48ad-3df4-4e9be3624dc0@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 07 May 2018 19:32:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UubQLj4m4W8A

On Mon, May 07, 2018 at 09:13:57PM +0200, Thomas Huth wrote:
> On 07.05.2018 20:21, Eduardo Habkost wrote:
> > On Mon, May 07, 2018 at 06:50:35PM +0200, Markus Armbruster wrote:
> >> Eduardo Habkost <ehabkost@redhat.com> writes:
> >>
> >>> On Fri, Apr 27, 2018 at 08:31:58AM +0200, Markus Armbruster wrote:
> >>>> Eduardo Habkost <ehabkost@redhat.com> writes:
> >>>>
> >>>>> On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
> >>>>>> On 26.04.2018 13:45, Markus Armbruster wrote:
> >>>>>>> Thomas Huth <thuth@redhat.com> writes:
> >>>>>> [...]
> >>>>>>>> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
> >>>>>>>>      qtest_end();
> >>>>>>>>  }
> >>>>>>>>  
> >>>>>>>> +static void add_machine_test_case(const char *mname)
> >>>>>>>> +{
> >>>>>>>> +    char *path, *args;
> >>>>>>>> +
> >>>>>>>> +    /* Ignore blacklisted machines */
> >>>>>>>> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
> >>>>>>>> +        return;
> >>>>>>>> +    }
> >>>>>>>> +
> >>>>>>>> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
> >>>>>>>> +    args = g_strdup_printf("-machine %s", mname);
> >>>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
> >>>>>>>
> >>>>>>> This runs test_device_intro_concrete() with "-machine M" for all machine
> >>>>>>> types M, in SPEED=slow mode.
> >>>>>>>
> >>>>>>>> +    g_free(path);
> >>>>>>>> +
> >>>>>>>> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
> >>>>>>>> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
> >>>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
> >>>>>>>
> >>>>>>> This runs test_device_intro_concrete() with "-nodefaults -machine M" for
> >>>>>>> all machine types M, in SPEED=slow mode.
> >>>>>>>
> >>>>>>> Has "without -nodefaults" exposed additional bugs?
> >>>>>>
> >>>>>> After testing this with all machines, I had to discover that
> >>>>>> "-nodefaults" does not work so easily: A lot of the embedded machines
> >>>>>> (especially the ARM machines) simply refuse to work with "-nodefaults"
> >>>>>> and exit immediately instead. E.g.:
> >>>>>>
> >>>>>> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=qtest
> >>>>>> qemu-system-arm: missing SecureDigital device
> >>>>
> >>>> These are all bugs.  --nodefaults is supposed to suppress *optional*
> >>>> devices, not mandatory ones.
> >>>
> >>> I'm not sure I understand the requirements.  What exactly is the
> >>> definition of "mandatory"?
> >>>
> >>> A machine created by "qemu-system-x86_64 -machine pc -nodefaults"
> >>> is useless because it has no any device to boot from.  How is
> >>> that different from a n810 machine not booting because there's no
> >>> SD device?
> >>
> >> I propose:
> >>
> >> * Stuff that's required for QEMU to run is not suppressed by -nodefaults
> >>
> >> * Stuff that a real machine has soldered on is also not suppressed
> >>
> >> * Stuff that can be pulled out of a real machine may be suppressed, even
> >>   when that means the guest won't run
> > 
> > Makes sense to me.  It looks like the only obstacle for
> > tests/device-introspect and device-crash-test is the first rule.
> > "Guest won't boot" isn't a problem, but "QEMU won't run" is.
> > 
> > The first rule is easily testable, too: running
> > "$QEMU -machine $MACHINE -nodefaults" and not having a working
> > QMP monitor should be reported as a bug by automated tests.
> 
> You mean with "-accel qtest" or without? With "-accel qtest" we should
> pretty soon be fine, after Peter's current PULL request has been merged
> (which contains a patch from me for fixing these SD card problems with
> ARM machines).
> Without "-accel qtest", things are not that easy, unfortunately. Lots of
> boards require "-kernel" or "-bios" and refuse to work without. So you
> can hardly test "-nodefaults" automatically in the normal tcg mode. (But
> maybe all boards should allow to start QEMU in case you've at least also
> specified "-S" ? ... in that case we've got plenty of work for
> BiteSizeTasks ;-) )

Hmm, maybe it's not a bite-sized task after all.  :)

Should we do this gradually?

* Working with -accel qtest is useful, and sounds like an easier goal;
* working with -S seems desirable too;
* working without -S (even if the emulated CPU crashes and burns)
  would be interesting.

Related question: what are the use cases where we require
"-accel qtest" and "-S" wouldn't work?

Are the requirements and goals of "-accel qtest" documented
somewhere?  Without documentation, it's hard to say when a given
qtest_enabled() call in the code is reasonable, or a hack we want
to get rid of.

-- 
Eduardo
