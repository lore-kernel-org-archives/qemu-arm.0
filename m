Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FDECCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 19:01:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEBPb-000519-KE; Wed, 29 Oct 2025 15:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vEBPZ-00050d-Pu
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 15:00:45 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vEBPL-0000m9-Ta
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 15:00:45 -0400
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4eba67d4b1bso1211161cf.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761764424; x=1762369224; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EXspraXHM0TPtF5KOO/3bIdmauHuTzRo+mAsbwuwqB0=;
 b=GdIem8LfYBbRsssP233ElUwrocIj0SBkxU2/e4hq6wf2EW5V61f4kRGnmY8PWiQ5so
 51l8t590/Dm8x4v46gvx4XGWHIGxgdFqqDUS9Bf85qwzO/jI/SPexwbn7nmpA8cx1QLA
 mywzTvSF7DrNv+7K4rtKYP3fnkjbtaGQUuT1iAlNcBr+T/95D1U/eXm3iPE40cjrF6EK
 03IPclk/EVpZgTh0wxv467ALvXct8UFb0b9jbUrFH8NHZebaJkZqxlxpsyeYL8LT7wWj
 V3Zyha4TYNK3MExt9kPSH7AgxN2e7RlxHFoFhXs8CiE8y3ZQ4xx4sSpmtG4ZGwi20Nky
 VvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761764424; x=1762369224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EXspraXHM0TPtF5KOO/3bIdmauHuTzRo+mAsbwuwqB0=;
 b=S6TBxrCDQ35JfZg66PA3ILPlKeuaCfbB8Tx++OFFH6Wqr81/0Pqaxe6Ga9PTK/q0F6
 dliAli6jmUP6gzzOTMuoJsTtZiID3kDnHe7M2hvngX453DnTt6syzTE3zWkoD6D6vJyx
 pjo6dJ6zvvNfbBTn6NuJ0SHlZsKWLC90s62Q0laOjAOGCXK5A/dqYHvUe1rZpBjWL4CV
 osqvuYdIWeT72kHUYwxUEY7phak3BGjZgMVwLWuWoEYH/Y+zVepDGw0YQrNGMqCWI11j
 CN1BpboRdO/SPIKFhpPtspmwE+5LjeAN6Bbwqx2QeH5H/7WSrZDjN4Gl+DQjb2N7L1gd
 2x/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt18UZWsaSixwJgCf65+kTVu+Vgq7knEWD9072JPYhmZJX0hNjucffP3/oWIxFskP6VheVwXXwkg==@nongnu.org
X-Gm-Message-State: AOJu0Yx2QoLlu7qQtuLuZstjDL5fS/mm5AVh6L8PSW9MkMe3PhjRSE5N
 whXUgjzD2MHCYGyPkDNUwIeSOfCJ5iGGzHX30VuLP/iPEr6ZY5IFcw111u9Wz/qYC8mRMSx6S/k
 cCRarMxK+1+FgCZaQ99k+r+KvrulZMms=
X-Gm-Gg: ASbGncuodrdAtTYAQfJiUssd9/tJgjBeXcMmXN5wtj1DZAhYMhr7Sj/ziaNmtDY9+yk
 tjwXqBh9CPWEnWP5awzhaagYIJwHpYXFKuyk6am+gRuYHRyoQpFbjuVD0Lo6l8ejkglqb1f7eB3
 tPopFU7EvSVVkCQKmB0l5rpuEZFZfzmjaM9PktWuzSuvth8wH/jwfBO/avQjInleRqDv2f0XNTE
 REn6horP/XIFwzpLjzPRdwlWWeNSvVcZaYcMCCEbL5NUzn17f2yWwbuOrp4nR744ECeA13jDg/5
 bjQKSeA0k4PZKmFh
X-Google-Smtp-Source: AGHT+IEvwl9ZaBXLgW6Jp5ufjUJvfE2JG69Ga6dE1zeEiTu7jaenR63Bdvl1/+S1N6+Y+zr2HCLCThIYwGdsoZ30zOs=
X-Received: by 2002:ac8:7c43:0:b0:4e8:a3aa:7a89 with SMTP id
 d75a77b69052e-4ed21f4e861mr6352201cf.45.1761764424096; Wed, 29 Oct 2025
 12:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251027151045.2863176-1-marcandre.lureau@redhat.com>
 <20251027151045.2863176-20-marcandre.lureau@redhat.com>
 <ffab95ce-9b5d-43ea-93a7-611de6044ad8@linaro.org>
In-Reply-To: <ffab95ce-9b5d-43ea-93a7-611de6044ad8@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 29 Oct 2025 23:00:12 +0400
X-Gm-Features: AWmQ_bm9VFQyXo1ysdqgFgjThZg-_49lCrPUaj86svbFMyq-tMJzIWSelD-c5CM
Message-ID: <CAJ+F1C+qnkm=F1q0YSHZ9WbAMcz+-NJo5mzj1b-DcU24dNpRLQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/35] audio: register and unregister vmstate with
 AudioState
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Alexandre Ratchov <alex@caoua.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Jan Kiszka <jan.kiszka@web.de>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, 
 Thomas Huth <huth@tuxfamily.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Wed, Oct 29, 2025 at 5:51=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 27/10/25 16:10, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Proper lifecycle management with QOM state.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   audio/audio.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/audio/audio.c b/audio/audio.c
> > index 4c3c3fd52f..853930bb48 100644
> > --- a/audio/audio.c
> > +++ b/audio/audio.c
> > @@ -1614,6 +1614,8 @@ static void audio_vm_change_state_handler (void *=
opaque, bool running,
> >       audio_reset_timer (s);
> >   }
> >
> > +static const VMStateDescription vmstate_audio;
> > +
> >   static void audio_state_init(Object *obj)
> >   {
> >       AudioState *s =3D AUDIO_STATE(obj);
> > @@ -1625,6 +1627,8 @@ static void audio_state_init(Object *obj)
> >
> >       s->vmse =3D qemu_add_vm_change_state_handler(audio_vm_change_stat=
e_handler, s);
> >       assert(s->vmse !=3D NULL);
> > +
> > +    vmstate_register_any(NULL, &vmstate_audio, s);
>
> Please avoid legacy APIs:
>
> /**
>   * vmstate_register_any() - legacy function to register state
>   * serialisation description and let the function choose the id
>   *
>   * New code shouldn't be using this function as QOM-ified devices have
>   * dc->vmsd to store the serialisation description.
>   *
>   * Returns: 0 on success, -1 on failure
>   */
>

qdev/Device have vmsd, but not plain Object (or legacy code without object)=
.



--=20
Marc-Andr=C3=A9 Lureau

