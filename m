Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp325287lfm;
        Wed, 15 Jul 2020 02:00:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwCa84xzoZeTxTd+9mWJ/Zu4+EzSf+6+3UY4H35k/CtHWkGAuWJ4m1ktwW/qSreVmEY1tW
X-Received: by 2002:a25:bc0f:: with SMTP id i15mr14525319ybh.190.1594803632518;
        Wed, 15 Jul 2020 02:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594803632; cv=none;
        d=google.com; s=arc-20160816;
        b=mxhEuanGf5oS1MHebOhv6oJN2HL69EPRKFoyaPESzXQ22hf2R7vW5kdHkX4a2QfOO6
         YrIIAvyr1Tnl3o40yIG64MO/50ZVEHRqEk4RMLOt0Iip8ehm7hW+281DKm+AnZcHsUJc
         UPJ0Wdx0lLp2U8yhESryUys8PjZeth8calKm6tJJBVwg9TZNmO+s7nYghQgtxlJ6Qmih
         U4FkmAlLTZaI61ubxHtcnA0k0wzyN6onvsQKjpwMdT7OTFGY24AC2F5B2iYUtV29hIwm
         2MDwOTPs0zVQI4R7TmrNrX8Ogqq5bMhzS+TGF+XiskLcce74Obvf5SXKcvSge2huYLXt
         Qsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=t0BMrJsEPpw2hAuVaHkSZsPO66SYWZMMbSqibMKLzHU=;
        b=oQCtAhtEXNuVOQbuUsbGezsRHqamn4aA3JNAXzw66n61EJMdQxMQGXtM/WW3ZeD5TE
         ZjLH0KtBj7E0Ux+FOGYuuvT7VB+3YRIFvgbzZcIxAoWzJc9kBC6PyUIN/1wTO71OtLqP
         wYTLPO4vJiCxRUZopnJ5hxNlUqFlJ9j2V05Xg2zvvITywQaMtz+I+z954pI5k2KHK8S6
         DQZPowyIYgHlF/pKac8T3dchibq9jzFvupN0jsx9ksOj2dCfVWWZWTg45YVcQOKLs7VJ
         mkBfduf4rMKYfkNDMlHOpnsV5ndcDfiHiPAtWfIAJxyeStINtRPkcwJ/KVG4rTT+BgFq
         IVcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Duirda7Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m125si2120012ybc.118.2020.07.15.02.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 02:00:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Duirda7Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvdHD-0007bM-T4
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 05:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvdGy-0007a6-8d
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 05:00:16 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29143
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jvdGu-000775-1Q
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 05:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594803610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0BMrJsEPpw2hAuVaHkSZsPO66SYWZMMbSqibMKLzHU=;
 b=Duirda7YxHztDYELYn5wNea2r2EOCl+N76Mly1LHw7/ytbuOgI935U8QaU97roMZKiL/Yz
 4Elzk6racJ+zv1rjFFI5nQtTudlojGEP0YNf0cQIC3wFbsnNbXH3Lz6MzAJeXPR5pH3hbG
 vVIo0FNgNjuIpPoiZAgMM8aJOpUsrmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-benxDFtRPBGejNj0yGSJvw-1; Wed, 15 Jul 2020 05:00:07 -0400
X-MC-Unique: benxDFtRPBGejNj0yGSJvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 166B78027E2;
 Wed, 15 Jul 2020 09:00:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55EC16FEFC;
 Wed, 15 Jul 2020 09:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D68F21370108; Wed, 15 Jul 2020 11:00:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-11-hskinnemoen@google.com>
 <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
 <CAFQmdRZcygskP3iwss01-Jz67yjAP_JENXjWM2Bp8U=DRzxR0Q@mail.gmail.com>
 <875zaq78xq.fsf@dusky.pond.sub.org>
 <19733456-a672-595d-e721-e0ef26d7f665@amsat.org>
 <87v9iq2hkv.fsf@dusky.pond.sub.org>
 <e87663cf-7cb2-ca6c-a751-e5c1cebc5440@amsat.org>
Date: Wed, 15 Jul 2020 11:00:01 +0200
In-Reply-To: <e87663cf-7cb2-ca6c-a751-e5c1cebc5440@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 14 Jul 2020 19:16:35
 +0200")
Message-ID: <87pn8xywz2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:37:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wzXgDzFS2SQ3

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 7/14/20 6:21 PM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> + qemu-block experts.
>>>
>>> On 7/14/20 11:16 AM, Markus Armbruster wrote:
>>>> Havard Skinnemoen <hskinnemoen@google.com> writes:
>>>>
>>>>> On Mon, Jul 13, 2020 at 7:57 AM C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
>>>>>>
>>>>>> On 7/9/20 2:36 AM, Havard Skinnemoen wrote:
>>>>>>> This allows these NPCM7xx-based boards to boot from a flash image, =
e.g.
>>>>>>> one built with OpenBMC. For example like this:
>>>>>>>
>>>>>>> IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
>>>>>>> qemu-system-arm -machine quanta-gsj -nographic \
>>>>>>>       -bios ~/qemu/bootrom/npcm7xx_bootrom.bin \
>>>>>>>       -drive file=3D${IMAGE},if=3Dmtd,bus=3D0,unit=3D0,format=3Draw=
,snapshot=3Don
>>>>>>>
>>>>>>> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
>>>>>>> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>>>>>>
>>>>>> May be we don't need to create the flash object if dinfo is NULL.
>>>>>
>>>>> It's soldered on the board, so you can't really boot the board withou=
t
>>>>> it. But if you think it's better to remove it altogether if we don't
>>>>> have an image to load into it, I can do that.
>>>>
>>>> If a device is a fixed part of the physical board, it should be a fixe=
d
>>>> part of the virtual board, too.
>>>
>>> We agree so far but ... how to do it?
>>>
>>> I never used this API, does that makes sense?
>>>
>>>     if (!dinfo) {
>>>         QemuOpts *opts;
>>>
>>>         opts =3D qemu_opts_create(NULL, "spi-flash", 1, &error_abort);
>>>         qdict_put_str(opts, "format", "null-co");
>>>         qdict_put_int(opts, BLOCK_OPT_SIZE, 64 * MiB);
>>>         qdict_put_bool(opts, NULL_OPT_ZEROES, false); // XXX
>>>
>>>         dinfo =3D drive_new(opts, IF_MTD, &error_abort);
>>>         qemu_opts_del(opts);
>>>     }
>>=20
>> I believe existing code special-cases "no backend" instead of making one
>> up.
>>=20
>> Example: pflash_cfi0?.c
>>=20
>> If ->blk is non-null, we read its contents into the memory buffer and
>> write updates back, else we leave it blank and don't write updates back.
>>=20
>> Making one up could be more elegant.  To find out, you have to try.
>
> I'd rather avoid ad-hoc code in each device. I2C EEPROM do that too,
> it is a source of head aches.
>
>>>From the emulation PoV I'd prefer to always use a block backend,
> regardless the user provide a drive.
>
>>=20
>> We make up a few default drives (i.e. drives the user doesn't specify):
>> floppy, CD-ROM and SD card.  Ancient part of the user interface, uses
>> DriveInfo.  I doubt we should create more of them.
>>=20
>> I believe block backends we make up for internal use should stay away
>> from DriveInfo.  Kevin, what do you think?  How would you make up a
>> null-co block backend for a device's internal use?
>
> I read 'DriveInfo' is the legacy interface, but all the code base use it
> so it is confusing, I don't understand what is the correct interface to
> use.

I admit the "legacy" bit is still aspirational.  We still haven't
managed to replace it for configuring certain onboard devices.

The thing being configured is a device's BlockBackend.

To understand the point I'm trying to make, please ignore "legacy", and
focus on the actual purpose of DriveInfo: it's (one kind of) user
configuration for a BlockBackend.

Now let me try to state the problem you're trying to solve.  Instead of
special-casing "no backend" in device code like pflash_cfi0?.c do, you
want to make up a "dummy" backend instead.  You need the dummy to read
some blank value and ignore writes.  One of the null block drivers
should fit the bill.

Now my point.  Why first make up user configuration, then use that to
create a BlockBackend, when you could just go ahead and create the
BlockBackend?

Sadly, I'm not sufficiently familiar with the block API anymore to tell
you exactly how.  blk_new_with_bs() looks promising.  Perhaps Kevin can
advise.

>>> We should probably add a public helper for that.
>>=20
>> If we decide we want to make up backends, then yes, we should do that in
>> a helper, not in each device.
>>=20
>>> 'XXX' because NOR flashes erase content is when hardware bit
>>> is set, so it would be more useful to return -1/0xff... rather
>>> than zeroes.

