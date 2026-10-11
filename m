Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D04CA9EBD
	for <qemu-arm@archiver.kernel.org>; Sun, 11 Oct 2026 20:23:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xG04k-0002Xo-Jn; Sun, 11 Oct 2026 16:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xG04h-0002XX-CQ
 for qemu-arm@nongnu.org; Sun, 11 Oct 2026 16:23:15 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xG04f-0000sl-Bj
 for qemu-arm@nongnu.org; Sun, 11 Oct 2026 16:23:15 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b167ffd132so1885574a12.1
 for <qemu-arm@nongnu.org>; Sun, 11 Oct 2026 13:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791750191; cv=none;
 d=google.com; s=arc-20260327;
 b=cWkVpVHdzRNCmvYwUcy7P3dXDC2xtwrLi7NCvp9QnLj69maqebOVAwprgQPh+sTNqW
 2DVnaUuMfH1T76sfheozvItBpjrGtlzPQyt34phCc0ezknNRI+vWGWNgE6dIH23Yu2oo
 UwYXqu1fkNHv+8GGpxOigxoQpMEsAgPhyB7Dkc5pNjfTNfryfA9bW69sdd+EFnrUo/kA
 58dJ4AbzU+HidSBaeLH5hhCH9jef8phImcJGyt6z6Hw66MSAx2uHELNiv8wT5QRZKv3T
 aIcnDe3YHjyq719BYsmWyeLLF6Uvt+lSdGXUB5O5/Se36ldsw7Q30H/ozBEAIcdbEjO4
 DE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=kfE7/eBkbup7NiJ69iRwL+0r1oKf+aElQ+buEAkb1Lo=;
 fh=ovuPOH2OyJ2wgSt5sHsdm82lKdB6kw4bV8ScuMUqxRg=;
 b=pMveyLGdRH/ifhcE/jFx3FOM9rVY4bKQjzGnouif64j6i2tUu+vypGdsIlPHAko6zs
 Z7vCEBEQrJbOk5BrCNIrSUbBzC1MYj+xqCPqrN2Gg7zCmBxFpfMPQxex7NKvkUI0upXz
 gvZG8fbNQTQXJAqVt9D5gjXfm8IgL4VAaVnvRY8X63C4R5TFFZVfZA5FiyQ4SAYNNMGU
 0PzA4RElFYsFXNP5bCIZ6nqZNpXyKwtmpPrd8U/iaw0bYCldh76P6d3TGzqmuTHrGLFV
 PKDF3IOx9moV2HczCOLQbTVqrGyLjV8Tx1Aqn1M+2Sx/zjp4tblm6j5oZ1P83XkHR6F6
 NGeA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791750191; x=1792354991; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kfE7/eBkbup7NiJ69iRwL+0r1oKf+aElQ+buEAkb1Lo=;
 b=mc8cTRu3Z+jm53d59YpilPLvjmSWgYHyiWSOENcjKk6yaDhD1dngo9CQVYW5OT+T1t
 cWFrqfjggzYn1nQkiEya771/5YQXK9GpXvJH/SB6j42JByLNNF+1dmPWsw9sJ8+6Af+Q
 FE8QZLwx7R4vJ1FArFfIyYKJJ1bjCDvLbT0NfmHWr/oPLVNufHOTHhL4HWVrxq1rk+gG
 6f5bSixgoEf1ekKCOvlwVXsp9ExRTnpdAYpwnQvWA8TWeCRLZ9TM1MZ5d2azyaoMwVXZ
 nrT0vCzzTF9ggXsBPOGT56qaPupUd3i4BSH+AdH/h5M643YDX+gCXZjPMUlZCYDPUw7j
 qxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791750191; x=1792354991;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kfE7/eBkbup7NiJ69iRwL+0r1oKf+aElQ+buEAkb1Lo=;
 b=mQc3stMuPqmyHxqoiKsK9b41DCQ7xmamkrrsmSvMf2WqQcgcLOawC0ec9xMHGc2yhZ
 yZYr8wnqfSngtrjpOL5Tgc5zuWiYzYoksOjV0dus9ZCS9+WWVb6XkBCyZ21j/78EYlkN
 Ullq0759lKB9O+zqS90AQfqpYzCfZ0e9ywTNImlt+dG3FB4E8gRJryEbZl1eu88ujYnX
 95EbZeT5tzg6G2Cz4OPvG4hrkStU1m7yjDF5iwkLfFFKOYUFw35QthzhYPxZMMyOD3lm
 CELYC6Va2ueOwWgGwJzvM2xff3YJNIGLEGNmALW91XBBBQcdIVOqImd+7Cgx1psZqmLQ
 QioQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCJ+Zh46rXHuSvbXeZdfRgk+cKc22ZL78Eslp528QNCHBQ9fXsr3V+oJm6ZbtgfNmLGs36Mys5aA==@nongnu.org
X-Gm-Message-State: AFq9FYKVjpeVJLjPEO/ZoWpBs4eyJjrrrlX25dNkUTSIyLSy2PSzMu3e
 qIGQmM1yDD46XW/cYjNLlyRtTdQoR1QJaVrJmhm9UQj+4jitGYug/RqXVO3Aruig/SPhzi8v9Tg
 0CWyJfqTi7g4VSDbGlIm/tbTPcoACyz8=
X-Gm-Gg: AYBFou2LaucWcgqm+uKQAEgtj0srQlMe8noSDBSn+OZCUIy11FbLZjEQeWBCiiBiEXh
 H0oizurpPfDnQd1EYQfoetFYOFD0a0wNOKr5PYqj7QZn35yLfHWsYeF3zBTXZXwa+m6MbcLed3m
 68TZYxlQIfgZXADvDI0CzN/Rbw1v0SgPgBq0XsxI82b8xyfTQBCNhm6CkK7dgL/Glvl2DmoCCfm
 V6ztEsV07vRcJ+puwY0CINhORRS2A7U0M90wiU1T+yUv3xwpIdh2QMUlJoRVeHVRZ55z6E+r4/z
 plt+E0GljZOmnJwpg3Ot3UP2gGICM8r/FsVDK14dt8dfH6w3XNoKlcU=
X-Received: by 2002:a05:6402:44cc:b0:6b1:b97b:745 with SMTP id
 4fb4d7f45d1cf-6b1b97b0ab0mr1267030a12.29.1791750190402; Sun, 11 Oct 2026
 13:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <2390b3d7-6918-41e3-8532-c19de4cdd1ff@oss.qualcomm.com>
 <asdlbOZBSYIaCMIh@redhat.com>
 <CAE2XoE91XxoJRFpQ_1jhmX6LdxMyN16CF7RXxM62C5Ctkc1tig@mail.gmail.com>
 <42fd67c0-c20d-4bc4-bede-79073e4be4a1@oss.qualcomm.com>
 <CAE2XoE-gN5-vmE8r00Ds_Z=E1WePSFi_MJXjmy9ZuXEU_=o31g@mail.gmail.com>
 <3034c146-0697-4db7-acd4-8076b317a09e@oss.qualcomm.com>
In-Reply-To: <3034c146-0697-4db7-acd4-8076b317a09e@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Mon, 12 Oct 2026 04:22:57 +0800
X-Gm-Features: AclHuK--KRtqN_khFMKx1iUr7GPeS69W5S4eguEq-loH2D8D0iZx-2WWsU_VIgs
Message-ID: <CAE2XoE-gCTrpEeCROz9JMpPnTQXQ+AnBTR4RwdQhYizkExjK9w@mail.gmail.com>
Subject: Re: [PATCH 0/8] qom: pass TargetInfo to the is_available callback
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Stafford Horne <shorne@gmail.com>,
 qemu-arm@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Alexander Bulekov <alxndr@bu.edu>, 
 Darren Kenny <darren.kenny@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Oct 9, 2026 at 2:34=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/8/2026 10:13 AM, Yonggang Luo wrote:
> > On Fri, Oct 9, 2026 at 12:06=E2=80=AFAM Pierrick Bouvier
> > <pierrick.bouvier@oss.qualcomm.com> wrote:
> >>
> >> On 10/8/2026 2:46 AM, Yonggang Luo wrote:
> >>> On Thu, Oct 8, 2026 at 5:42=E2=80=AFPM Daniel P. Berrang=C3=A9 <berra=
nge@redhat.com> wrote:
> >>>>
> >>>> On Wed, Oct 07, 2026 at 01:25:46PM -0700, Pierrick Bouvier wrote:
> >>>>> On 10/7/2026 4:47 AM, Yonggang Luo wrote:
> >>>>>> This allows a combined binary to register machine types from all i=
ts targets.
> >>>>>> Consequently, QMP `query-machines` can return machine entries from=
 every
> >>>>>> target, even when `none` is selected. For example, a client can qu=
ery the
> >>>>>> combined machine list with:
> >>>>>>
> >>>>>> ```json
> >>>>>> { "execute": "query-machines" }
> >>>>>> ```
> >>>>>>
> >>>>>> The returned list includes the registered machine classes from all=
 linked
> >>>>>> targets. This is separate from selecting a machine: with `-target =
none`,
> >>>>>> `-M virt` reports the targets that provide `virt` instead of choos=
ing one
> >>>>>> arbitrarily:
> >>>>>>
> >>>>>> ```text
> >>>>>> qemu-system -target none -M virt
> >>>>>> unsupported machine type: "virt" for target "none"
> >>>>>> Available for targets:
> >>>>>>   aarch64
> >>>>>>   arm
> >>>>>> ```
> >>>>>>
> >>>>>
> >>>>> From the long conversation on a previous thread, I thought we reach=
ed
> >>>>> the conclusion that if we didn't expose any ambiguous name, then -t=
arget
> >>>>> option is unnecessary, or maybe I got lost on track of this thread.
> >>>>>
> >>>>> https://lore.kernel.org/qemu-devel/ar_coT44h5-zJPVV@redhat.com/
> >>>>>
> >>>>> I'm not sure which semantic we want to have with -target none. If t=
here
> >>>>> is no ambiguous name registered, we just don't need it at all. It's=
 a
> >>>>> win-win IMHO.
> >>>>
> >>>> Yes, if we expose unique names for every machine, then -target is th=
en
> >>>> redundant.
> >>>
> >>> so how to diff riscv32-virt and risv64-virt? oh so for this machine w=
e
> >>> needs two name?
> >>> "virt" needs register twice for it? or register only a single time,
> >>> but we prefix the target_name()
> >>> automatically? for example machine::name =3D=3D=3D "virt", but we can=
 use
> >>> "riscv32-virt" "risv64-virt" to reach it?
> >>>
> >>
> >> Yes, ideally we should have different variant of virt for 32/64 bit.
> >> Same goes for cpu max types.
> >>
> >> QOM type is always registered unambiguously ("$arch-virt"). Then, for
> >> the "alias" name, which is virt, in case multiple matches are found,
> >> command line can return an error with list of unambiguous names to cal=
l it.
> >>
> >> $ qemu-system -M virt
> >> Multiple virt machines are available. Please choose one of them:
> >> - aarch64-virt
> >> - riscv64-virt
> >>
> >> There is no "parsing" of the argument, it's just the real QOM type. Th=
en
> >> we can find which target it implements from mc->targets.
> >> And then, we can automatically choose which cpus should be available
> >> based on that, thanks to cpu->targets.
> >>
> >> For existing binaries, nothing change.
> >
> > Good, I think we found a clean way now, is_available should be
> > removed, and TypeInfo::targets and TypeImpl::targets should be added.
>
> It goes into MachineClass only for now.
>
> > I think
> > for "virt" we can add a shared hw/machine-virt.c instead, and forwardin=
g to
> > the $arch specific virt. so that we only have a single "virt" registere=
d.
> > And it's
> > targets is
> > QEMU_ARCH_I386 |
> > QEMU_ARCH_ARM |
> > QEMU_ARCH_RISCV |
> > QEMU_ARCH_LOONGARCH |
> > QEMU_ARCH_M68K |
> > QEMU_ARCH_OR1K |
> > QEMU_ARCH_XTENSA |
> > QEMU_ARCH_HEXAGON
> >
> > So that we won't have a list of conflict QOM names for "virt" machines.
> > As now we indeed have only a single "virt" machine that redirects to
> > different targets.
> >
>
> The idea looks appealing, but I don't think it solves the problem to
> have multiple virt variants available at the same time.
>
> The "alias" idea you introduced before is good, we just need to add a
> check if an alias is really unique, else return an error, as explained
> previously.
>
> If "-M aarch64-virt" works for both the new and existing binary, and -M
> virt only for existing binaries (and ambiguous for new one), I think
> that's a safe approach.
>
> >
> > For other types also conflict can be handled in the same way, such as
> > "-cpu host" "-cpu max"
> > maybe others, but I think they all have the same way to deal with.
> >
> >
> > That's why  TypeInfo::targets and TypeImpl::targets better than sole
> > Machine::targets
> >
>
> One step at a time.
> Let's keep focused on declaring targets for a single machine first.
> Then we can iterate to solve the "virt" problem.
> Then convert all the existing machines and add a check in machine-target.=
c
> Then, and only then, we can see what happens with cpus.

I tried this idea, but I faced a fatal error, because the
target_info() is not available until
the machine selected(the target arch will be select just along with
the machine selected), so basically
all calls to target_info() would raise an error(null pointer), how to
deal with it?

>
> Regards,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

