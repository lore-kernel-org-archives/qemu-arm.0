Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2009835lfm;
        Mon, 20 Jul 2020 00:58:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO3nnTR+NjrGEu2f36zQGCHuFCIdnKy+WuXvev3igreyv1J715J/SHS6MJXC64RUpZYyUP
X-Received: by 2002:a25:da87:: with SMTP id n129mr34254325ybf.149.1595231915757;
        Mon, 20 Jul 2020 00:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595231915; cv=none;
        d=google.com; s=arc-20160816;
        b=uoZVAUcLrghaCoiortuJmPweotqzWtrYsdc8y3X/xnKXBBcc5c34FEE8yjDRvd0qhG
         tEZUFAaRgN8VHS9XH/kr/x/bVLByIic+X/gYXA7FfAhBd3GnCR2XT3TIgS2JcvXchUb7
         nMZ7DJ+74oVOqQ9Iv7mySRmpCMVbqzZ28x41RlRgRJx96QFjN0azLmKJ8+F1lZAYBT9M
         7INX+Ji3LjRGjkR7QxmWlss8i7MXQ7jt0+Ycf7upfPUA/7q98tnkkuGnTcKbhVNrrdtx
         RaPj5CktEUOUoOH5QxMJztJZhaicq1WQKwbSRia0b48STUmlPon9F+Fm8LSy+FCSaNuD
         yhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=eoy0XehpgGB/FcfBWwT6NV7B2ZXbt6zhECU0aubmYco=;
        b=u/WfgJJyMTzGLifUWYiInilVK2//ZuqNndwU25nEqGmro8znS/4W1wGygWCtG4l6Ru
         aBh1D78CNmJBxRWXXok//GPjenE7DwkDZ7VOzuTx/O5IvXKM7qg6ktB9Us2dPF6Sktlc
         znK9mWSqSHYB6sbZrdRC6uHGOQkHYrZoeEOlIrg/qkcKSS7xOkpXzgyj3lbZntRV1UC/
         aO+daYvb8ZQhQPQLNcor7PYmguEUlKe/bU/eanVhq66ciM0Z+SwqXLE29cVTp+dpc663
         vIqUPwWWmpNJujWQS/tRijq85+nWUpEQPaFhm3zOP/PKjKryBFrf66UcdLV/KYT/VMZT
         AikQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hcHn12f2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e133si5607478ybe.403.2020.07.20.00.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 00:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hcHn12f2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxQh1-0006WT-3d
	for alex.bennee@linaro.org; Mon, 20 Jul 2020 03:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jxQgt-0006WI-8k
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 03:58:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35368
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jxQgq-0006pX-SU
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 03:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595231903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eoy0XehpgGB/FcfBWwT6NV7B2ZXbt6zhECU0aubmYco=;
 b=hcHn12f23QHCH2WeE36vCMHo3xQ7cHU+oyxl1Wze29XxFav/GdXa5oyJdJBopzCvAfpoL0
 h+Z2winXHeoT58QDDvh7Q9PRa3AuWS6gaOX8uFH/t1G8zOAUiF9kzgS0/WQcZH1/qhYf5O
 SQEw2535XFAPh0nP7ILhjzI1bL3RSeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-VJfx6-LIN0-4a6NrHVDZAg-1; Mon, 20 Jul 2020 03:58:21 -0400
X-MC-Unique: VJfx6-LIN0-4a6NrHVDZAg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFC0C8017FB;
 Mon, 20 Jul 2020 07:58:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D45107303C;
 Mon, 20 Jul 2020 07:58:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6DCAE1141C54; Mon, 20 Jul 2020 09:58:17 +0200 (CEST)
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
 <87pn8xywz2.fsf@dusky.pond.sub.org>
 <b3bc658f-a865-8e6b-c904-01c7724e89cc@amsat.org>
 <CAFQmdRa9FiP6yX=XDrJy5KpjifQyVkQiY6DXtSoJSvfoq7Vm6w@mail.gmail.com>
 <CAFQmdRac6tsZafN3PsnLhPA_Ny032ZAjOFuXkmYvJ-ubjcpPPw@mail.gmail.com>
 <5345d70f-3041-ed13-12e9-9a8e3d803805@amsat.org>
 <416d5243-dc8e-37c6-197f-96dec1c9f5cc@redhat.com>
 <d66bf4fe-7349-a90f-c4fb-a80de7597819@amsat.org>
 <bc258d6f-059d-618d-6ccd-94c04082bb25@amsat.org>
Date: Mon, 20 Jul 2020 09:58:17 +0200
In-Reply-To: <bc258d6f-059d-618d-6ccd-94c04082bb25@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 17 Jul 2020 11:00:43
 +0200")
Message-ID: <87imeihb3a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 02:11:17
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
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: otlKfxo1kiWM

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 7/17/20 10:27 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 7/17/20 10:03 AM, Thomas Huth wrote:
>>> On 17/07/2020 09.48, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> +Thomas
>>>
>>>> On 7/16/20 10:56 PM, Havard Skinnemoen wrote:
>>>>> On Wed, Jul 15, 2020 at 1:54 PM Havard Skinnemoen
>>>>> <hskinnemoen@google.com> wrote:
>>>>>>
>>>>>> On Wed, Jul 15, 2020 at 3:57 AM Philippe Mathieu-Daud=C3=A9 <f4bug@a=
msat.org> wrote:
>>>>>>>
>>>>>>> On 7/15/20 11:00 AM, Markus Armbruster wrote:
>>>>>>>> Now my point.  Why first make up user configuration, then use that=
 to
>>>>>>>> create a BlockBackend, when you could just go ahead and create the
>>>>>>>> BlockBackend?
>>>>>>>
>>>>>>> CLI issue mostly.
>>>>>>>
>>>>>>> We can solve it similarly to the recent "sdcard: Do not allow inval=
id SD
>>>>>>> card sizes" patch:
>>>>>>>
>>>>>>>  if (!dinfo) {
>>>>>>>      error_setg(errp, "Missing SPI flash drive");
>>>>>>>      error_append_hint(errp, "You can use a dummy drive using:\n");
>>>>>>>      error_append_hint(errp, "-drive if=3Dmtd,driver=3Dnull-co,"
>>>>>>>                              "read-ones=3Don,size=3D64M\n);
>>>>>>>      return;
>>>>>>>  }
>>>>>>>
>>>>>>> having npcm7xx_connect_flash() taking an Error* argument,
>>>>>>> and MachineClass::init() call it with &error_fatal.
>>>>>>
>>>>>> Erroring out if the user specifies a configuration that can't possib=
ly
>>>>>> boot sounds good to me. Better than trying to come up with defaults
>>>>>> that are still not going to result in a bootable system.
>>>>>>
>>>>>> For testing recovery paths, I think it makes sense to explicitly
>>>>>> specify a null device as you suggest.
>>>>>
>>>>> Hmm, one problem. qom-test fails with
>>>>>
>>>>> qemu-system-aarch64: Missing SPI flash drive
>>>>> You can add a dummy drive using:
>>>>> -drive if=3Dmtd,driver=3Dnull-co,read-zeroes=3Don,size=3D32M
>>>>> Broken pipe
>>>>> /usr/local/google/home/hskinnemoen/qemu/for-upstream/tests/qtest/libq=
test.c:166:
>>>>> kill_qemu() tried to terminate QEMU process but encountered exit
>>>>> status 1 (expected 0)
>>>>> ERROR qom-test - too few tests run (expected 68, got 7)
>>>>>
>>>>> So it looks like we might need a different solution to this, unless w=
e
>>>>> want to make generic tests more machine-aware...
>>>
>>> I didn't follow the other mails in this thread, but what we usually do
>>> in such a case: Add a "if (qtest_enabled())" check to the device or the
>>> machine to ignore the error if it is running in qtest mode.
>>=20
>> Hmm I'm not sure it works in this case. We could do:
>>=20
>>   if (!dinfo) {
>>      if (qtest) {
>>         /* create null drive for qtest */
>>         opts =3D ...;
>>         dinfo =3D drive_new(opts, IF_MTD, &error_abort);
>>      } else {
>>         /* teach user to use proper CLI */
>>         error_setg(errp, "Missing SPI flash drive");
>>         error_append_hint(errp, "You can use a dummy drive using:\n");
>>         error_append_hint(errp, "-drive if=3Dmtd,driver=3Dnull-co,"
>>                                 "read-ones=3Don,size=3D64M\n);
>>      }
>>   }
>>=20
>> But I'm not sure Markus will enjoy it :)

Using drive_new() for creating an internal dummy backend is wrong.

Doing it only when qtest_enabled() doesn't make it less wrong.

>> Markus, any better idea about how to handle that with automatic qtests?
>
> FWIW IDE device has a concept of "Anonymous BlockBackend for an empty
> drive":
>
> static void ide_dev_initfn(IDEDevice *dev, IDEDriveKind kind, Error **err=
p)
> {
>     IDEBus *bus =3D DO_UPCAST(IDEBus, qbus, dev->qdev.parent_bus);
>     IDEState *s =3D bus->ifs + dev->unit;
>     int ret;
>
>     if (!dev->conf.blk) {
>         if (kind !=3D IDE_CD) {
>             error_setg(errp, "No drive specified");
>             return;
>         } else {
>             /* Anonymous BlockBackend for an empty drive */
>             dev->conf.blk =3D blk_new(qemu_get_aio_context(), 0, BLK_PERM=
_ALL);
>             ret =3D blk_attach_dev(dev->conf.blk, &dev->qdev);
>             assert(ret =3D=3D 0);
>         }
>     }

I figure this creates an internal dummy backend the right way, just not
the kind you need.  For a non-empty one, you get to make up a
BlockDriverState, then use blk_new_with_bs().

Is the simplification of device code really worth making up a dummy
backend?

