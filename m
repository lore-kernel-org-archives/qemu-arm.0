Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2730350lfm;
        Fri, 17 Jul 2020 12:19:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5yQW84RQJI44LdZFKGK+6aDLiWupnmXPZdQfledSCb+3e8aW4aHvcyNKxSHxX23gpNHcg
X-Received: by 2002:a25:a088:: with SMTP id y8mr3630229ybh.253.1595013546050;
        Fri, 17 Jul 2020 12:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595013546; cv=none;
        d=google.com; s=arc-20160816;
        b=eWzK8MFzazkYvtMoXFvGXyynswUmkS9T5tsiFlvAffgNM/IxcuMSDlmesHE9f2E7Ox
         5FkSQblSmcv08gn/LzFBFVmPziLefp0meIwoz5VduoZxhDlefrMwF/Mh7Yd5TgSfkfCC
         UV17mCnq1KNMDOUQQav/tdhg6V2OP39Axe/usZ5j3rEuVxRRPAy2CR+UEQwit2+vC+wu
         KTIfID1Vy1Msn8tfGv6mtU+jhj25SB75N+422rC7OaoK3Q7FtOeguiXWi+efv0BE1Bue
         qoBnl2xC2RbaYhaPNndkDUKenevOIwbBfVvu74P7f4wJ2Mc2BktUiCs9JFSkvovnGQpt
         JRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fFbV/WGauIu1qFQIk6uPeGGvzT8eOMCTPMLKkZgsQ98=;
        b=gg8HpYxlilVCfPfzMG+ZivBWBnQMGxJlStIyhXL2q3zRTvs3qQ9Y5nf8Zm4fHZKaTu
         UYcoXJ7qq9rgxJ5plsRm8Rry/8+2uU2hbwcIH1Jlt2058l1nmz9ZWYxxaCpy0N54ilbC
         WCLRTV7LyhwoyausA+ylEPf5ViYHSfOg6Xarj5xEym2PYaAR6LVHkhlkzQJRHZf4FqEY
         GH6mgDPlHWbrkr9Wtw7LmIXjIoKg8S0vNJNR9v5etV35vaEyFX5Wzy+jaqxi1nInPi3g
         +gz7YlJN61JAMTQO/kIkeZ5LS/0Zr57UfXFdRxYwd+gqhf3H/2zNcnvYz/aV9eqnHq34
         vaRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=SIar3bPc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v137si9469586ybv.363.2020.07.17.12.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 12:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=SIar3bPc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwVsv-0005XY-EC
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 15:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jwVsn-0005XF-Ru
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 15:18:57 -0400
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43]:36381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jwVsl-00042N-A0
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 15:18:57 -0400
Received: by mail-vk1-xa43.google.com with SMTP id s192so2354227vkh.3
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2020 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fFbV/WGauIu1qFQIk6uPeGGvzT8eOMCTPMLKkZgsQ98=;
 b=SIar3bPcs0dfke/pPi8cYDDCDMNBjiyuqTCpJcCM4LpjamQnBqRo80u4VKo8MVMr5W
 5bAYiVpzHi1hS9y+OcjyGwmlgobehlWZCYyjRlRwD04BZfIbtgqyULd3z1W2DLcJ92zt
 ZSfneuTGjN4DW7LOUWmkDerdDbWODDsZyBY2yiqySBCznaTtjO5OkE6BHm1j38N50MY6
 JtwkJA9baVc73YApkX3pKDzqS+npV+RVpzm+mWOM7qng1Ad2hWGYi3XP6U00ZQamNxXG
 T9LY61NhEZITwbadmrgotk9IZJGx5/qg1+YE06Hr2OzT0MXtxvHUtJ1R8GzodXGBhX/W
 fCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fFbV/WGauIu1qFQIk6uPeGGvzT8eOMCTPMLKkZgsQ98=;
 b=qm6D8UhNAScsFpul2wu2I6aIOY68JqKqy4GrZ3MtYTQzoQUB6wm9mkpqHxqFYKjM1B
 DLs3Q1c3jtHXzkamQGGnl3B9TUXDunjOVyzFybd4bPoQy9nQPAE5FQaMNjkhEbjo2drf
 uu9CACE9Su9I+zo22Ke13tTJYd+iuiziEROvh4YxJTjUIOUdK/2s1/N8AQiRnEr9J44y
 4BbihOoVzSBy6+9c7jaRrO/uYNqOKRQAVMT5319pu6JiSqSkuQvjneY/cMpzb5fYpd8F
 WrDLt1EV/m0EfjjXFPNRaWvZnVsrxolG3sPwaneDKWmJYFT/C1QgVUkVXPkjfL3xRuNi
 1+cQ==
X-Gm-Message-State: AOAM53157/4wyaWQ13Rg4xxvmD8IabykybPfZ2N2564qBQgzrEhme5Wy
 uy/zuq/rKKBN73BxdZ9ugafsJszJxW8KIWpUgflL4g==
X-Received: by 2002:ac5:c76e:: with SMTP id c14mr8789092vkn.60.1595013533750; 
 Fri, 17 Jul 2020 12:18:53 -0700 (PDT)
MIME-Version: 1.0
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
In-Reply-To: <bc258d6f-059d-618d-6ccd-94c04082bb25@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 17 Jul 2020 12:18:42 -0700
Message-ID: <CAFQmdRbdSYOGw1o2ur_dYdSAZZfvQMfz4PX1Hmu+XvX7b9B-QQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Qemu-block <qemu-block@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>, 
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a43;
 envelope-from=hskinnemoen@google.com; helo=mail-vk1-xa43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7X7xHKrVfjxr

On Fri, Jul 17, 2020 at 2:00 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 7/17/20 10:27 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 7/17/20 10:03 AM, Thomas Huth wrote:
> >> On 17/07/2020 09.48, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> +Thomas
> >>
> >>> On 7/16/20 10:56 PM, Havard Skinnemoen wrote:
> >>>> On Wed, Jul 15, 2020 at 1:54 PM Havard Skinnemoen
> >>>> <hskinnemoen@google.com> wrote:
> >>>>>
> >>>>> On Wed, Jul 15, 2020 at 3:57 AM Philippe Mathieu-Daud=C3=A9 <f4bug@=
amsat.org> wrote:
> >>>>>>
> >>>>>> On 7/15/20 11:00 AM, Markus Armbruster wrote:
> >>>>>>> Now my point.  Why first make up user configuration, then use tha=
t to
> >>>>>>> create a BlockBackend, when you could just go ahead and create th=
e
> >>>>>>> BlockBackend?
> >>>>>>
> >>>>>> CLI issue mostly.
> >>>>>>
> >>>>>> We can solve it similarly to the recent "sdcard: Do not allow inva=
lid SD
> >>>>>> card sizes" patch:
> >>>>>>
> >>>>>>  if (!dinfo) {
> >>>>>>      error_setg(errp, "Missing SPI flash drive");
> >>>>>>      error_append_hint(errp, "You can use a dummy drive using:\n")=
;
> >>>>>>      error_append_hint(errp, "-drive if=3Dmtd,driver=3Dnull-co,"
> >>>>>>                              "read-ones=3Don,size=3D64M\n);
> >>>>>>      return;
> >>>>>>  }
> >>>>>>
> >>>>>> having npcm7xx_connect_flash() taking an Error* argument,
> >>>>>> and MachineClass::init() call it with &error_fatal.
> >>>>>
> >>>>> Erroring out if the user specifies a configuration that can't possi=
bly
> >>>>> boot sounds good to me. Better than trying to come up with defaults
> >>>>> that are still not going to result in a bootable system.
> >>>>>
> >>>>> For testing recovery paths, I think it makes sense to explicitly
> >>>>> specify a null device as you suggest.
> >>>>
> >>>> Hmm, one problem. qom-test fails with
> >>>>
> >>>> qemu-system-aarch64: Missing SPI flash drive
> >>>> You can add a dummy drive using:
> >>>> -drive if=3Dmtd,driver=3Dnull-co,read-zeroes=3Don,size=3D32M
> >>>> Broken pipe
> >>>> /usr/local/google/home/hskinnemoen/qemu/for-upstream/tests/qtest/lib=
qtest.c:166:
> >>>> kill_qemu() tried to terminate QEMU process but encountered exit
> >>>> status 1 (expected 0)
> >>>> ERROR qom-test - too few tests run (expected 68, got 7)
> >>>>
> >>>> So it looks like we might need a different solution to this, unless =
we
> >>>> want to make generic tests more machine-aware...
> >>
> >> I didn't follow the other mails in this thread, but what we usually do
> >> in such a case: Add a "if (qtest_enabled())" check to the device or th=
e
> >> machine to ignore the error if it is running in qtest mode.
> >
> > Hmm I'm not sure it works in this case. We could do:
> >
> >   if (!dinfo) {
> >      if (qtest) {
> >         /* create null drive for qtest */
> >         opts =3D ...;
> >         dinfo =3D drive_new(opts, IF_MTD, &error_abort);
> >      } else {
> >         /* teach user to use proper CLI */
> >         error_setg(errp, "Missing SPI flash drive");
> >         error_append_hint(errp, "You can use a dummy drive using:\n");
> >         error_append_hint(errp, "-drive if=3Dmtd,driver=3Dnull-co,"
> >                                 "read-ones=3Don,size=3D64M\n);
> >      }
> >   }
> >
> > But I'm not sure Markus will enjoy it :)
> >
> > Markus, any better idea about how to handle that with automatic qtests?
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
>             dev->conf.blk =3D blk_new(qemu_get_aio_context(), 0,
> BLK_PERM_ALL);
>             ret =3D blk_attach_dev(dev->conf.blk, &dev->qdev);
>             assert(ret =3D=3D 0);
>         }
>     }

Could someone please remind me what problem we're trying to solve here?

Currently, if the user (or test) doesn't provide a drive, we pass NULL
as the block backend to m25p80. This means we'll take the code path in
m25p_realize() that does

        trace_m25p80_binding_no_bdrv(s);
        s->storage =3D blk_blockalign(NULL, s->size);
        memset(s->storage, 0xFF, s->size);

which will look like a freshly chip-erased flash chip.

Are we looking for a more elegant way to replace those three lines of
code (+ a couple of conditionals in the writeback paths)?

But we don't even have a dummy device that looks like an erased flash chip.=
..

Havard
