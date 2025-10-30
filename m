Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FC5CCF9E3
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Oct 2025 16:39:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEVf7-0006HJ-LW; Thu, 30 Oct 2025 12:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vEVf6-0006Gm-0K
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vEVeo-0002u6-TR
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761842261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5GWk18a/VA/4RMIoI7ifBwmIEmAQLQHusjUKulED2o=;
 b=DyM6t8jXPNsDF4DWryqCGhBwxswdo96oWGn3Om1f8SRNcgFupvM8jiMKm/HIY8YM+6vvmY
 /pnloUnc+2xv7Sa5j6mXcygyQynIhKOrRZNb8Wi6Ao/0q0rO88Drl7h7OhtvF8NXmHWilY
 gIG1nuX5n5oU+Olotdi6sr/CF3iORxw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-_uaXlUcMPZ67_0lZDbWojQ-1; Thu, 30 Oct 2025 12:37:38 -0400
X-MC-Unique: _uaXlUcMPZ67_0lZDbWojQ-1
X-Mimecast-MFC-AGG-ID: _uaXlUcMPZ67_0lZDbWojQ_1761842258
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-87fe7c9134fso16704666d6.0
 for <qemu-arm@nongnu.org>; Thu, 30 Oct 2025 09:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761842258; x=1762447058;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f5GWk18a/VA/4RMIoI7ifBwmIEmAQLQHusjUKulED2o=;
 b=DB133i00Oai0Hp7/RWTCGIa83SZ1LJ/Z1DIEZizXtDBtRfaycyPNo8T+zW5tdNAJrB
 Tu//dQEdaMxURBKnBdv67DZTXBmIxCVyk2OYazqzxMHOtXM3sKEuOBZhWQrDSU2fY1fZ
 im8W/tcv3+zrCeMvTqGD0V+hKYtOBoGuvHtGhg/PPGfRlUxVu6gch/fvGJR1CF+k4+V1
 GVXZh2V/R64vN56FDvdCd0kBHdgmUlrX3NNlMTVZyTXfvv4fK0V6Aga1Q5NLdTHAiDts
 ZHuhhdCNZTX5VC828Ox0/luyxr4uO5hUeruJCaIW1gpnBM1vZ7dhRAftLVlQ37k5NFTy
 UGBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSosSKFnkuHup/pQq9vsrt3FPRfMAKrgfwNC2Js3czdOEktoxtfBD4CobfvQ82MWgRleDKfe8lfA==@nongnu.org
X-Gm-Message-State: AOJu0YwfOx+MU0gthLI/G0RAjlu8UjkH9IyThBJUPuX5ncarLwGWNkBg
 9Z9x5wFBUPuEm7UqRfftZ3+MiMNDuCbdPpK40kgHjTPTFLaZhFXqq6IM05d9X4MrOC0YjilS320
 8Wmvqf8erXoB7sS1sRW0CaZ+MbD1qw5rwMA3vblwWSoDkNUsw1Qo7Og==
X-Gm-Gg: ASbGncs52KTt/qisCUkqzUGiRyLdThH9pxp5R/MHAED1inv0GKZcb/THTYKRGGzfgyP
 PWu+UH1rsCB+W4ocHnWqvZ0nzI4gp4F5Wd909J11R6PYVFisb/xM6cdxxk4a+2fYCOuVGJlEQQj
 CcBulw8Kx48VDVp7+YMZ+KQpsKHORLww5qr1kEe4I0y4qJ46iylGSapHMvryan1bq0bnavxUXLe
 b2gNa1epPKcOQO9ne5x3KbfymsrUZRWuUFbkQBA5/kpcr/aqVWw7+CKjQg5qat9rDi1aUaRN0wc
 MMtwdYIVaM/LE02JmiWLFeiktlcx5CuihZD94ij4M5WKquoZnjimMgXcve+3n+R1Tbs=
X-Received: by 2002:ad4:5dc6:0:b0:880:2254:36a4 with SMTP id
 6a1803df08f44-8802f51a221mr2259186d6.63.1761842258037; 
 Thu, 30 Oct 2025 09:37:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECJD9TgfT/YKeT2Wh3bDcLgKYB8ORBrpVG12HNnDI1GZXwYpMmBWbiaa3R362AT9zFypoT6g==
X-Received: by 2002:ad4:5dc6:0:b0:880:2254:36a4 with SMTP id
 6a1803df08f44-8802f51a221mr2258746d6.63.1761842257513; 
 Thu, 30 Oct 2025 09:37:37 -0700 (PDT)
Received: from x1.local ([142.188.210.50]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc4944d57sm122956836d6.35.2025.10.30.09.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:37:36 -0700 (PDT)
Date: Thu, 30 Oct 2025 12:37:34 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Alexandre Ratchov <alex@caoua.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jan Kiszka <jan.kiszka@web.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <huth@tuxfamily.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Zhao Liu <zhao1.liu@intel.com>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: Re: [PATCH v3 19/35] audio: register and unregister vmstate with
 AudioState
Message-ID: <aQOUTmDMzvKePrIW@x1.local>
References: <20251027151045.2863176-1-marcandre.lureau@redhat.com>
 <20251027151045.2863176-20-marcandre.lureau@redhat.com>
 <ffab95ce-9b5d-43ea-93a7-611de6044ad8@linaro.org>
 <CAJ+F1C+qnkm=F1q0YSHZ9WbAMcz+-NJo5mzj1b-DcU24dNpRLQ@mail.gmail.com>
 <adbf6cd9-72b0-4ce9-93a6-4f83338ca8a3@linaro.org>
MIME-Version: 1.0
In-Reply-To: <adbf6cd9-72b0-4ce9-93a6-4f83338ca8a3@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 384sHCm-A5XmpJY1vKbGy5f-k6DtGMCKA-M_2buMbng_1761842258
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Oct 29, 2025 at 10:42:00PM +0100, Philippe Mathieu-Daudé wrote:
> On 29/10/25 20:00, Marc-André Lureau wrote:
> > Hi
> > 
> > On Wed, Oct 29, 2025 at 5:51 PM Philippe Mathieu-Daudé
> > <philmd@linaro.org> wrote:
> > > 
> > > On 27/10/25 16:10, marcandre.lureau@redhat.com wrote:
> > > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > > 
> > > > Proper lifecycle management with QOM state.
> > > > 
> > > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > > ---
> > > >    audio/audio.c | 7 ++++++-
> > > >    1 file changed, 6 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/audio/audio.c b/audio/audio.c
> > > > index 4c3c3fd52f..853930bb48 100644
> > > > --- a/audio/audio.c
> > > > +++ b/audio/audio.c
> > > > @@ -1614,6 +1614,8 @@ static void audio_vm_change_state_handler (void *opaque, bool running,
> > > >        audio_reset_timer (s);
> > > >    }
> > > > 
> > > > +static const VMStateDescription vmstate_audio;
> > > > +
> > > >    static void audio_state_init(Object *obj)
> > > >    {
> > > >        AudioState *s = AUDIO_STATE(obj);
> > > > @@ -1625,6 +1627,8 @@ static void audio_state_init(Object *obj)
> > > > 
> > > >        s->vmse = qemu_add_vm_change_state_handler(audio_vm_change_state_handler, s);
> > > >        assert(s->vmse != NULL);
> > > > +
> > > > +    vmstate_register_any(NULL, &vmstate_audio, s);
> > > 
> > > Please avoid legacy APIs:
> > > 
> > > /**
> > >    * vmstate_register_any() - legacy function to register state
> > >    * serialisation description and let the function choose the id
> > >    *
> > >    * New code shouldn't be using this function as QOM-ified devices have
> > >    * dc->vmsd to store the serialisation description.
> > >    *
> > >    * Returns: 0 on success, -1 on failure
> > >    */
> > > 
> > 
> > qdev/Device have vmsd, but not plain Object (or legacy code without object).
> 
> Hmm right. Cc'ing Peter & Fabiano.

Thanks, yeah this looks fine when it was already there.

When looking at it, what's interesting is vmstate_audio is actually empty..

Explanation in da77adbaf61, since 2021.  Maybe we could drop it completely
at some point as I know we start to deprecate machines over 6(?)  years.
But I don't know when is proper.

We also hit similar issue with TAP device where there was a demand to add
compat properties to TAP however it was not a qdev, hence it cannot use
compat properties mechanism..  I wonder if these devices will be (at some
point) be converted to be type device.

-- 
Peter Xu


