Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2417592ejf;
        Mon, 8 Aug 2022 03:15:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR655M/STuUszkdfhZGowDCurFQiJRqeUJ8MDETSAFcxyxysD/QrGUcaOOgJ2VmxwFQpCXIZ
X-Received: by 2002:a05:620a:b86:b0:6b8:d74e:1e08 with SMTP id k6-20020a05620a0b8600b006b8d74e1e08mr13233171qkh.166.1659953713313;
        Mon, 08 Aug 2022 03:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659953713; cv=none;
        d=google.com; s=arc-20160816;
        b=j7zgA/ajFcgB/DYekcJZOWrijooFxuEjb5mODQZxXAijVO+7h0xSaR7mhJ9Ww9uhNf
         AIWlsipzvdBOuT7a2jUWp+XMVUR0EH6C6meebYv8J72+Ehx38qFgUGInmUBB7Q3CS6HD
         N5CQ7bdUq2LtY4Dmr+fyyhZwZ0hRUbOvQga2/TdJRZ+x0Eemw7dvmdl0k7p32qyD0kZS
         H3SxyBh74752ytOkCxq3KXZ41TWRYmKJMNUGkiGskcO+NrygaUmpVerPWy+xKVYisHmN
         YJZos15epa6d5UA6JtGy91RA/KbFMDnJj8gr3IGO0NwR2+fNMSrS278Nps7i9fpJSJlH
         sVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=Hdlgc9WE/iXOKd3UZ7uHM2IMGLqlMVapp6NC0gwp+E0=;
        b=iJEQ0YQjkbjW7RJplU4uqIJMLEMokq+/71J4d0MT/KSfUqGIoh9HwWeSgY7/w0gbi4
         L2HuWzd0MfFk4jlx20JuhjsQHvOZSJyHWVrbLvtuG7VwmmaS8o6bQSXze+Pj5/whDY+i
         6iINIttbpu7f90k9HBanhPiqQY7iAw/fH3U3vCQoTfQg4Q0nNl2+j9dn79e+GG780+ra
         5SdgB4WJGmDggkCKYqP4hd+pzQT72f3rMjfu/BYh75hg9MTldn1Bo9G41jEqsPUZJcKi
         XIq1EbYwsgGtGKBvow6I8K8TzkgxqrbRYnb5Kp75a0ZvbNpTonodG055Cp5Iqp+Pn5DI
         SFnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NjnEpgUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk10-20020a05620a1a0a00b006b92af08b5esi3808389qkb.576.2022.08.08.03.15.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Aug 2022 03:15:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NjnEpgUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oKzmy-0000oc-Ns
	for alex.bennee@linaro.org; Mon, 08 Aug 2022 06:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKzmj-0000nu-TN
 for qemu-arm@nongnu.org; Mon, 08 Aug 2022 06:14:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oKzmg-0007Mk-EP
 for qemu-arm@nongnu.org; Mon, 08 Aug 2022 06:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659953693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hdlgc9WE/iXOKd3UZ7uHM2IMGLqlMVapp6NC0gwp+E0=;
 b=NjnEpgUzPetCrNeLFuOxGnrM4/BeFaJr1k60NbRU5keDPiKp13x6rjjGPH0HrJV91icYYR
 DOQkTxoMj8x9GoGNIBE4G0/swrK64Nt503Ud4bAjoRdgU8OkVAd8pZ99iPKzh5W0T+gvCG
 v3uPWVhABomUhw/GJW9z8RZx6ka2Vq8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-t1jK4R_eNxWeyg38L0SEYw-1; Mon, 08 Aug 2022 06:14:50 -0400
X-MC-Unique: t1jK4R_eNxWeyg38L0SEYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2206811E81;
 Mon,  8 Aug 2022 10:14:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65F97400E403;
 Mon,  8 Aug 2022 10:14:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4361321E6930; Mon,  8 Aug 2022 12:14:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org,  qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,  venture@google.com,  Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com,  hskinnemoen@google.com,  f4bug@amsat.org,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  thuth@redhat.com,  Hanna
 Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@gmail.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
References: <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuvY8/WL0Jojv1Uj@redhat.com> <877d3odpm8.fsf@pond.sub.org>
 <YuvjJ7+B61UCLDrK@redhat.com> <87bkt0c9gf.fsf@pond.sub.org>
 <YuvpYExeQfW2zUd7@redhat.com> <87lerzxnc5.fsf@pond.sub.org>
 <YvDKljfYh+DF4029@redhat.com>
Date: Mon, 08 Aug 2022 12:14:48 +0200
In-Reply-To: <YvDKljfYh+DF4029@redhat.com> (Kevin Wolf's message of "Mon, 8
 Aug 2022 10:34:30 +0200")
Message-ID: <877d3jrqhz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SPzS8wI2wBBR

Adding Paolo and Eduardo since we're wandering into QOM-land.

Kevin Wolf <kwolf@redhat.com> writes:

> Am 08.08.2022 um 08:26 hat Markus Armbruster geschrieben:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Thu, Aug 04, 2022 at 05:30:40PM +0200, Markus Armbruster wrote:
>> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >>=20
>> >> > On Thu, Aug 04, 2022 at 04:56:15PM +0200, Markus Armbruster wrote:
>> >> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >> >>=20
>> >> >> > On Thu, Jul 28, 2022 at 10:46:35AM +0100, Peter Maydell wrote:
>> >> >> >> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wro=
te:
>> >> >> >> >
>> >> >> >> > Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
>> >> >> >> > > An OTP device isn't really a parallel flash, and neither ar=
e eFuses.
>> >> >> >> > > More fast-and-lose use of IF_PFLASH may exist in the tree, =
and maybe of
>> >> >> >> > > other interface types, too.
>> >> >> >> > >
>> >> >> >> > > This patch introduces IF_OTHER.  The patch after next uses =
it for an
>> >> >> >> > > EEPROM device.
>> >> >> >> > >
>> >> >> >> > > Do we want IF_OTHER?
>> >> >> >> >
>> >> >> >> > What would the semantics even be? Any block device that doesn=
't pick up
>> >> >> >> > a different category may pick up IF_OTHER backends?
>> >> >> >> >
>> >> >> >> > It certainly feels like a strange interface to ask for "other=
" disk and
>> >> >> >> > then getting as surprise what this other thing might be. It's
>> >> >> >> > essentially the same as having an explicit '-device other', a=
nd I
>> >> >> >> > suppose most people would find that strange.
>> >> >> >> >
>> >> >> >> > > If no, I guess we get to abuse IF_PFLASH some more.
>> >> >> >> > >
>> >> >> >> > > If yes, I guess we should use IF_PFLASH only for actual par=
allel flash
>> >> >> >> > > memory going forward.  Cleaning up existing abuse of IF_PFL=
ASH may not
>> >> >> >> > > be worth the trouble, though.
>> >> >> >> > >
>> >> >> >> > > Thoughts?
>> >> >> >> >
>> >> >> >> > If the existing types aren't good enough (I don't have an opi=
nion on
>> >> >> >> > whether IF_PFLASH is a good match), let's add a new one. But =
a specific
>> >> >> >> > new one, not just "other".
>> >> >> >>=20
>> >> >> >> I think the common thread is "this isn't what anybody actually =
thinks
>> >> >> >> of as being a 'disk', but we would like to back it with a block=
 device
>> >> >> >> anyway". That can cover a fair range of possibilities...
>> >> >> >
>> >> >> > Given that, do we even want/have to use -drive for this ?    We =
can use
>> >> >> > -blockdev for the backend and reference that from any -device we=
 want
>> >> >> > to create, and leave -drive out of the picture entirely
>> >> >>=20
>> >> >> -drive is our only means to configure onboard devices.
>> >> >>=20
>> >> >> We've talked about better means a few times, but no conclusions.  =
I can
>> >> >> dig up pointers, if you're interested.
>> >> >
>> >> > For onboard pflash with x86, we've just got properties against the
>> >> > machine that we can point to a blockdev.
>> >>=20
>> >> True, but the vast majority of onboard block devices doesn't come with
>> >> such properties.  Please see
>> >>=20
>> >> Subject: On configuring onboard block devices with -blockdev (was: [P=
ATCH v4 6/7] hw/nvram: Update at24c EEPROM init function in NPCM7xx boards)
>> >> Date: Mon, 15 Nov 2021 16:28:33 +0100
>> >> Message-ID: <875ystigke.fsf_-_@dusky.pond.sub.org>
>> >> https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg03173.html
>> >
>> > My take away from your mail there is that in the absence of better ide=
as
>> > we should at least use machine properties for anything new we do so we
>> > don't make the problem worse than it already is. It feels more useful
>> > than inventing new IF_xxx possibilities for something we think is the
>> > wrong approach already.
>>=20
>> The difficulty of providing machine properties for existing devices and
>> the lack of adoption even for new devices make me doubt they are a
>> viable path forward.  In the message I referenced above, I wrote:
>>=20
>>     If "replace them all by machine properties" is the way forward, we
>>     need to get going.  At the current rate of one file a year (measured
>>     charitably), we'll be done around 2090, provided we don't add more
>>     (we've added quite a few since I did the first replacement).
>>=20
>> I figure this has slipped to the 22nd century by now.
>>=20
>> Yes, more uses of -drive are steps backward.  But they are trivially
>> easy, and also drops in the bucket.  Machine properties are more
>> difficult, and whether they actually take us forward seems doubtful.
>
> Machine properties are also not what we really want, but just a
> workaround. How about implementing the real thing, providing qdev
> properties for built-in devices?
>
> Looking at a few random users of drive_get(), they look like this:
>
>     DriveInfo *dinfo =3D drive_get(...);
>     dev =3D qdev_new("driver-type");
>     qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>     qdev_realize_and_unref(...);
>
> What if we assigned a name to every built-in device

Before we continue: I like the idea of giving onboard devices
user-friendly, stable names.  "serial0" beats
"/machine/unattached/device[13]" hands down.  Even more so where the
"device[13]" part depends on other options (e.g. with "-vga none" it's
"device[12]", both for i440FX).

The question is what these names could be.  They can't be qdev IDs,
because we blew our chance to reserve names.

Could we solve this in QOM?

>                                                     and had a
> qdev_new_builtin(type, id) that applies qdev properties given on the
> command line to the device? Could be either with plain old '-device'
> (we're already doing a similar thing with default devices where adding
> -device for the existing device removes the default device) or with a
> new command line option.
>
> The qdev_prop_set_drive() would then become conditional and would only
> be done if the property wasn't already set in qdev_new_builtin(). Or
> maybe a new function that checks for conflicting -drive and -device.
> Though that part is just implementation details.

The idea sounds vaguely familiar.  Whether it's because we discussed
similar ones on the list, or because I mulled over similar ones in my
head I can't say for sure.

Overloading -device so it can also configure existing devices feels
iffy.

We already have means to set properties for (onboard) devices to pick
up: -global.  But it's per device *type*, and therefore falls apart as
soon as you have more than one of the type.  We need something that
affects a specific (onboard) device, and for that we need a way to
address one.  The QOM paths we have don't cut it, as I illustrated
above.

