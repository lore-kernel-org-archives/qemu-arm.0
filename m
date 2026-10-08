Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4584ECA600E
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 09:47:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEkiH-0006Jq-0k; Thu, 08 Oct 2026 05:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEkiF-0006IT-3o
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 05:46:55 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEkiD-0005O2-8k
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 05:46:54 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6a9a20a5e72so3610817a12.0
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 02:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791452811; cv=none;
 d=google.com; s=arc-20260327;
 b=YMOO5GAutBcK5Tbib1Qvi8VVm2Dbth1xFbONGTXKQjwoapc6oWBBPZ7H/gtCMWtrsn
 x0SWmncWF23WCgXBbAwJtWLPEiaFqNrx6rFqA5MsueZL6r/PTSSAeJqX8zkXkIBhn6Sz
 rDGvvcX6UQTTADVt1hRp955DQeVSlx4s7wqO9y6pFDG5BxCNL2V6T6YUfukKwrtN/AXm
 XAIhFZ2RaKu+7Vtdtp9ayet0796nvm3WJdyd8f/fMcoqB6og89tHfaCAII8x3FtAed6B
 10vIHVzCutpFz9mcxmCXfTmnuXKaZkWbXVuyUpDVGhK15kwZOjsF4MR9d4WdsMvJR7ud
 NbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ogoTnumva6fXnSeYYYO0LBVKnfyDOFR0a4ATggkDipk=;
 fh=BQTLXNJRBwoXB4fUMAJ49afpq4RVFBmYHS1hEqVLENs=;
 b=lb4D1koWSOpRkvxMeA7B6fnIyl2nWxGR3/KDVb29ZogFBzx6k3vtPC50VPFppITM7k
 uAZ3sXpLc2MxcDp5LKeWXvAnZ/uEQa0WOsCyyYVammfyM2h9MevjJbkvd/9NHfxRNc8a
 SnQmAMXsUvzvC+Jfbl4nQ0pdqpgfmmODK6IClk80RupekoOW2JqWusBaTFnOYCxM0Z6W
 5p+8l8epT/6qTQ8VJbqiN5tGD+HNUrxOksKVvIHr47s7UHCbA9k97zsykrXV0gpD4wvC
 lHXFdkp7MSWwd36tPpXv3+92YgopH99PNqZYcYZ01XK1au2KNapMKqnWvQ0Y7tz6Gauc
 p9ww==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791452811; x=1792057611; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ogoTnumva6fXnSeYYYO0LBVKnfyDOFR0a4ATggkDipk=;
 b=k2jYUEM63bUBXcDw5+RND2qZR0szId4PoZ2xVxX1SKaJJi/B6MXRRQjyyA8YfmjmJq
 07XZnqZJes9uFHl/cjJAywZxqIe9mLWxpDBLhbYBLrO9s95gXzJ12+9ACY/wq5U8aVQ+
 OnOUdUCi8lZAr15NPS/ItLf9dj2y3H7OGET0uiMsoUi9qxOK++T1ocwPvdfgRANAhIOb
 cUAN4T5/lbwI82jkV6HitIP+e8OO4djOVPXjEU9TgeOpcypSbrc/8AcGtI1QNCPSp24u
 hj+IGm9deNdjKmMWJP/ex0cuNG85Op+5cEHQzQ8d2jLwLfFeCEvLeQfvd1PSdUppVrR3
 DGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791452811; x=1792057611;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ogoTnumva6fXnSeYYYO0LBVKnfyDOFR0a4ATggkDipk=;
 b=L0LF2Kh/Sxst2Bs0oGmhRdS1DC+bqbicVT874hTQss3wjhe8er0XKqo/s7ufuff8vy
 969E1VzZFXR/2qO/Sw/wmJ3iifMq7c7SncUvL8979r8D41uXTiTwX+nTTYZDEItmf+hC
 lhdMqXZFdzUc5of0Jm9KZgE52czM4D3Sl8YkFgW342F/o7GFhTN+AG0Y9HxPub2dVLwL
 tgVh3fT2z8DBBXahlEXDJa+shXWNrSNaB0mgy9jVxOo6bL50kurGWRyS3b9cxtNFIMPY
 OIiVh25F3Oa9NEVAhcwh9IfY20onRjVV7bJuqdkNt9BUtfRu+WepRlLzrnoa2ZBc/qyk
 a6IA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwKgp//GYPAvd24St7nFG/4Nht/J/MntetLvtSQFELMxuVaTgS+++cROOK3HXRut5AuS3tKclXENg==@nongnu.org
X-Gm-Message-State: AFq9FYJ5T5ojCZO7tD3jJkp28ZJVApZPrlhTGVtsQFAUx3oYn8uONOpX
 LQFk53ikeqeer9UUUd3vSgGC9lCi0RnegiB4VJp/fKrzTPKpLYzII5l2WkeNLCZ2osj/y2hO1s3
 9llTualRu62RhOfu07nhI1mlNM34mqzg=
X-Gm-Gg: AYBFou3yVD6oE2HAkvpfL0MvhMqL4PVDqTBec3AHTgMweBY+WqJlkh4LicRv8Gm9Dmg
 tq62wgipO5Kl6u6xHBoIumL3JNj/GPSlPeDvOQk7UHCeIDI/qzCeN9wuZZJQYNXL0JKZhSKPvin
 7YjIShL253hs5yBcQ9xjhQrtm2UsZBHB3QDGkZLnuZESzzK2SjDYbQYuQOPqAivafx62rgVLNSD
 +DFVfhp62nawcQ/X1CEWtKcGAo98bwY4fQtDNjVY8ZKGdgYIB1Qh1AMMKXEMsW9/d8d2RXRAgBc
 g95ndq3nPMUlwENWh8SDrfaZpmMfeBG7choUgYNQhjCLfAbbWX9K77I=
X-Received: by 2002:a05:6402:23c2:b0:6aa:e3f3:c9df with SMTP id
 4fb4d7f45d1cf-6aff453bc29mr3869590a12.20.1791452810906; Thu, 08 Oct 2026
 02:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <2390b3d7-6918-41e3-8532-c19de4cdd1ff@oss.qualcomm.com>
 <asdlbOZBSYIaCMIh@redhat.com>
In-Reply-To: <asdlbOZBSYIaCMIh@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 8 Oct 2026 17:46:35 +0800
X-Gm-Features: AclHuK_-C3RblRSJNtuVriKClZfH97RQs0eiitiJZBPRp79j3snPqumTItsdNYM
Message-ID: <CAE2XoE91XxoJRFpQ_1jhmX6LdxMyN16CF7RXxM62C5Ctkc1tig@mail.gmail.com>
Subject: Re: [PATCH 0/8] qom: pass TargetInfo to the is_available callback
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
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

On Thu, Oct 8, 2026 at 5:42=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Wed, Oct 07, 2026 at 01:25:46PM -0700, Pierrick Bouvier wrote:
> > On 10/7/2026 4:47 AM, Yonggang Luo wrote:
> > > This allows a combined binary to register machine types from all its =
targets.
> > > Consequently, QMP `query-machines` can return machine entries from ev=
ery
> > > target, even when `none` is selected. For example, a client can query=
 the
> > > combined machine list with:
> > >
> > > ```json
> > > { "execute": "query-machines" }
> > > ```
> > >
> > > The returned list includes the registered machine classes from all li=
nked
> > > targets. This is separate from selecting a machine: with `-target non=
e`,
> > > `-M virt` reports the targets that provide `virt` instead of choosing=
 one
> > > arbitrarily:
> > >
> > > ```text
> > > qemu-system -target none -M virt
> > > unsupported machine type: "virt" for target "none"
> > > Available for targets:
> > >   aarch64
> > >   arm
> > > ```
> > >
> >
> > From the long conversation on a previous thread, I thought we reached
> > the conclusion that if we didn't expose any ambiguous name, then -targe=
t
> > option is unnecessary, or maybe I got lost on track of this thread.
> >
> > https://lore.kernel.org/qemu-devel/ar_coT44h5-zJPVV@redhat.com/
> >
> > I'm not sure which semantic we want to have with -target none. If there
> > is no ambiguous name registered, we just don't need it at all. It's a
> > win-win IMHO.
>
> Yes, if we expose unique names for every machine, then -target is then
> redundant.

so how to diff riscv32-virt and risv64-virt? oh so for this machine we
needs two name?
"virt" needs register twice for it? or register only a single time,
but we prefix the target_name()
automatically? for example machine::name =3D=3D=3D "virt", but we can use
"riscv32-virt" "risv64-virt" to reach it?

>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

