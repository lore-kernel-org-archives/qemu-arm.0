Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E64C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 13:55:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whpDE-0002mF-5l; Thu, 09 Jul 2026 09:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1whpDC-0002lY-8t
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 09:54:46 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1whpDA-0000Q6-J5
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 09:54:45 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-381018b9375so2070594a91.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 06:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783605282; cv=none;
 d=google.com; s=arc-20260327;
 b=m7CmFIpz8OLzdEN37hMRtxz1Ma1stq/OcKpiN1TwKFOdMbWHXq+5nDbzAQo6mfmuTI
 kEY6ef3XuxIQM1bHuKYurfqFFNfklyQrbpwFvcvICEjzFn1PfRAymTqgwSdt3vTT2c6N
 SbT5lYKOcMb2bcW4/+SJCfjnKX4/ZMMqpZzOlCOpHTz+91LI17J4n0G9DPXITPgjL0Il
 KBx4FQoaKKK1CcU3WiATCFm00tJut84ErV28nKlxPT/VlbyxvtY9XHrctbQBdNZ6TqH3
 wTChutprOrJlxOSLVRlCKzfnEL6hWx2Pv/OUDzxRWGw2WfuG3AtrfNRTtlNVlKctgg/t
 pwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=N/SxFcNMNZJt4Ldv8rYYoLqhtuevn48hV5E6n1GgtSc=;
 fh=PeRw1Ct6Nl/ygaGGyl8vGeuaRTOaHVsP6R73jsvsHgs=;
 b=UFqOv5+aHrBLLuUAUdOAE7tHKL3oB9PeFAA56kYg6yWySpIhKSGpxj6/RHQ2DFNMkH
 cJ6mWd4QWRSZBBL9wJHYQxuR0ks8SGTwPynUC75ymGe/Q2eGPTTUgcKUAMAnHSE4DRq+
 arByd+svHX5oZXnN7IgGynmp5A9GpWMR3/ATw75HlZw6/x2/ZZMn6lE3xWKqZ40Bkjw9
 3ZzSfFog0IBqnqcLVwcNwlHFJHQUl13wiFluAb6nmYtaMrgjRsQFhYOfLagcPbH4KVJq
 K48nHtntPUeBuNUcXeuIdL7Om938AQeBAoR+PO8qlrZ7IMeLPTGp84nNqIwaQ/jQ08sK
 xbyg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1783605282; x=1784210082; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=N/SxFcNMNZJt4Ldv8rYYoLqhtuevn48hV5E6n1GgtSc=;
 b=RTDkCR8WyWfOIwxfWdivY55jBpaZNoHIi6ZtRWjHPjGmpmrNCs+yFnLZ274OElH8us
 3ilGDNo3MJg2zDkTtEZT7WW3q3Jeru0xxUwh6duMBWxkc31mFR51zlzuyXXgSSoATAj3
 384M2uU0/ZThMfh+KIg02HVJh2ApfCfWHqjlBqqGAYuBLF0o8BUsVG3FjMYun0dFsUz9
 BrKzW11F3glsHya8NIbyKUNB7LBTLTew8LvVqcSIACHrbbd5RukrE0Zvsi7i/xMw11ee
 fi0dWfKJZduQI8Ydz886GXONicrJ2SELSooeQMlGj5JSIBN1vtjLR34027N8DVTyq8hU
 TjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783605282; x=1784210082;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N/SxFcNMNZJt4Ldv8rYYoLqhtuevn48hV5E6n1GgtSc=;
 b=JhibMGAgJpdos4hTvTufv+fnzi1X1d0YIEcCHgYAuIHC1WB1IGw7c1+ponIRMOveSi
 V/D6fbRwJvrTEnSC+RV/kEiAmA3yY14hsvvlxXj5T3GsJtOYHnaKCMIBpMMr0eOlsMg+
 zWO+59hTrUkIDYff/ZhkivFUqmZGQn+VckiCEjvMUiwsT0LwC07FN7S2FgK/VD1TQjeg
 qKQSMhcwBw636dBgSskRd9wqKjAwXgLuozHog4RWvPfTPzve2nQ3RJPQXNv7j6RG1Ho2
 b2F8tNXRaocqJRZauQmPgTvteOcIQK4FMlHOE1Tso/Mll80Qs1nMhfAvRo4NWlPoUdeI
 N0zQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqqm4jImnBIWtyraLjySO+5JZXV/rHfCgdGk4fcH+vAgX588MJu8lKdTx/FK4zPxnMHeIUA/LLUQA==@nongnu.org
X-Gm-Message-State: AOJu0YzKOAboOm09KXvjv3YTyP04CwWSrqTbt9ERaewKUnFnzhEgbqqe
 VNFzi9ainULKNtgUHBM3toNabsZ9Fwl8QjS6TzCTmlqYrtIkUOzRD1+nQvYyzkPQVZx19YcyXgF
 Bcu9BH15yCNHQDmeDyTG9YeEOV/5b/Pk=
X-Gm-Gg: AfdE7cnybz7W34cYNLj+eFVqVGhDLU1pHuA7YqDeFQoGdOcWmVaLwrZCo2ksJGCq0G2
 4UEQMH9bZNrLD+lZRpqX/1vdQOcykt8MzeOuyE+uo8YEzY19zBe4tub+1iDyNYmXWtb8GCFVUu6
 mbVjC6Z9FD5jGm2YYrZVuTiCXxw9IqrS2hV0a1HkPp3zSLjx4TYSUcr+Vt89KFNsuHe24mxk/SI
 hheIS2XNstxodIhYA9Uy4kM/tanb0/lDedPNCrvN8UjuOHjhbZBoyoeWnrtKTviQ5LtKtXlWpiV
 MkhDUiLIyndA5NROZwIFs7jXz1HL
X-Received: by 2002:a17:90b:33c8:b0:37f:9ce1:cdb3 with SMTP id
 98e67ed59e1d1-3894279ba33mr7328995a91.33.1783605282473; Thu, 09 Jul 2026
 06:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <87o6gge6b0.fsf@pond.sub.org>
 <CAFEAcA9goRQuxw3VD7AqUOHHTdOXu8MSfCxdQMBviE3QgGD58w@mail.gmail.com>
 <87zf00cn7m.fsf@pond.sub.org> <ak-i1dNY_RrGNHAM@redhat.com>
 <CAFEAcA_=rz22ZqPr77REQa5BJRZVuEkriq-gJ9xGg4E46JPUxQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_=rz22ZqPr77REQa5BJRZVuEkriq-gJ9xGg4E46JPUxQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 9 Jul 2026 17:54:30 +0400
X-Gm-Features: AUfX_mxCpgQ9_NwafLskUA2MzJqouf8Rog06wvsTXmTy-VGH8G1_GSGXtS0d00Y
Message-ID: <CAJ+F1C+BiqriKhDO-vY15z5iQECVarJN-NoemiaW3w93c3EpNg@mail.gmail.com>
Subject: Re: A few Machines crash when "no default audio driver available"
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Jan Kiszka <jan.kiszka@siemens.com>, qemu-arm@nongnu.org, 
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi

On Thu, Jul 9, 2026 at 5:44=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> On Thu, 9 Jul 2026 at 14:32, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> >
> > On Thu, Jul 09, 2026 at 03:22:05PM +0200, Markus Armbruster wrote:
> > > Cc: mainainters for "Overall Audio backends"
> > > Peter Maydell <peter.maydell@linaro.org> writes:
> > >
> > > > On Thu, 9 Jul 2026 at 12:44, Markus Armbruster <armbru@redhat.com> =
wrote:
> > > >>
> > > >> I stumbled over ARM machine musicpal, PPC machines pegasos1, pegas=
os2,
> > > >> and MIPS machine fuloong2e crashes.
> > > >>
> > > >> I run them like this:
> > > >>
> > > >> $ qemu-system-aarch64 -M musicpal -nodefaults -S -display none -mo=
nitor stdio
> > > >
> > > >> Died when device_set_realized() tried to propagate a "no default a=
udio
> > > >> driver available" error to &error_abort.
> > > >
> > > > Is this something we want to have be a possibility the devices
> > > > have to cope with? Can we have the "ignores all audio data"
> > > > backend be always available instead?
> > >
> > > There's plenty of precedence for /dev/null-like backends.
> > >
> > > > Otherwise every audio device needs to cope with "there is no
> > > > audio backend available" and implement "do nothing with the
> > > > audio data" itself.
> > >
> > > Yes.
> >
> > We've got a bit of tension between "no defaults" and "builtin audio
> > devices" here.
> >
> > Cnosider if I had instead done
> >
> >   qemu-system-x86_64 -M pc -device ac97 -nodefaults
> >
> > It is not unreasonable to expect to see an error because you asked
> > explicitly for 'ac97'  and forgot to wire up the required audio
> > backend, and asked to NOT have any defaults.
> >
> > But with your 'musicpal' machine example, you never asked for the
> > frontend device, so you should be forgiven for also not asking
> > for a audio backend.
>
> Ah, so this is because of -nodefaults, not because QEMU was
> somehow built with no audio backends in it.
>
> > If we guarantee a /dev/null audio backend always exists, we help
> > the second case but degrade the first case
>
> As a possible analogy, for network devices we just warn in
> the analogous "device created but no backend wired up":
>
>  ./build/x86/qemu-system-x86_64 -nodefaults -device e1000 -display none
> qemu-system-x86_64: warning: nic e1000.0 has no peer
>
> and the effective behaviour is that output packets are dropped.
>
> We could make audio devices do that (which would be basically
> equivalent to "if we need an audio backend and we don't have
> one, warn and create the null backend").
>

Note that we don't have a real "null" backend. The "none" backend does
mixing/resampling/volume before dropping the audio (its parent is
MIXENG_BACKEND). I think it would be worth to add (so one day we can
compile qemu without the whole audio/ engine)

