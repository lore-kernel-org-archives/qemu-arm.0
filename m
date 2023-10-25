Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2953622ejb;
        Wed, 25 Oct 2023 11:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/5NmY/UMFv8OxN3fKbNwY9J51YZAEme2gOh8Zvtq6PtarRObbXFLZ5esFBjUGFyhyH+Tl
X-Received: by 2002:a05:600c:3145:b0:406:849f:f3cd with SMTP id h5-20020a05600c314500b00406849ff3cdmr13599430wmo.29.1698259521402;
        Wed, 25 Oct 2023 11:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698259521; cv=none;
        d=google.com; s=arc-20160816;
        b=GBCfP6+8XvL/2v85hruuZjZb7mQE3mTOhkFG5tXUsMTZAafbbonPTGH3kl3EylmDNl
         UH0XKCqR2NmWyRhWf8kAANlZxXHTRsuoormKcIT9CXp0fZsuTbXYQkSZv2NOm3vuI6W+
         lzNnjc+HxcyKlI5dxwpL8QDysKlQIibVEgbt9b72a8wrjdvsRqIBMmbdfMWrITyUW+HL
         JBwpiScKgcUNHKCzm1cbULCCalad+r2kN+6PRBF6e1+F0ci4MHrLX76LOra3tz9raDNK
         80uOxXuPDQf2Xfj3eAhJeO6JX3WGReokHaDM57hH9CSc0Ko993Am0mGY+mVNN+CR5BWf
         rnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=x8tcDalo98Jqvuxyk5/hMSLaaPuSGrJqcNmoOeLVX9Q=;
        fh=PtJCBIvinW7B3gtAF+8dZxmQhnbsxbmF3dE5/qOdwzk=;
        b=DUvh7Hpm/stabhqZjNfLp5ZKxET7qaxqSFOlp55wyhMbfjH81uerpBIpduwIaZ49pP
         3N48I6XnGoHXahMEU1Z2C9sibpuCLvkgMuw11tJp5+a9oORWVx34kNJ7SU9sJj9sCJzJ
         sOOvT6ubW52UGYmFcwQjmY6iA9n+iEH7frhUo8FyCGMejWOzQNunY2KUCAyej56ZrhMe
         ReRcR1g2OqDT/eFtwXADWZWz1nQHOlIoP6BBLOMbNbXspN1LwkeRtDl3ArOUe5ekMFZ7
         dyNqkipW0ytnZm4Qqg/oV7UADxyUjKGSBjV/Qj8fyjy8owLccV/fDKclSs0Ku7Ftc3Te
         5Ycw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyajNDpU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020a05600c3b0300b0040500898f26si353150wms.102.2023.10.25.11.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 11:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyajNDpU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvisA-00088k-TV; Wed, 25 Oct 2023 14:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qvis9-00087Y-7c; Wed, 25 Oct 2023 14:44:53 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qvis4-0001Vh-5s; Wed, 25 Oct 2023 14:44:52 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9c2a0725825so14501866b.2; 
 Wed, 25 Oct 2023 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698259483; x=1698864283; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x8tcDalo98Jqvuxyk5/hMSLaaPuSGrJqcNmoOeLVX9Q=;
 b=gyajNDpUePvsJA77H/hNgF0G172CZA7kGm2+xkj0537lupXCOZTuWyCzQbMX9pl/+7
 VIW/bo5A/+q1Ackb0jvhEr+brWWmugwWKmGz3zH60teP4vWRW1FxmkBB+DUyuo5TpYxY
 cVmXMMYV4g2XyMSTPmCPvgyuA0ZtE0RiHlOS6TwNOZYc3M0xjz/RP9QhL7wOGSC45cwJ
 h3g9b3H4DjyMz/DOENyZ8n8GZk+mAeWG65sg71XKUlQZu7T/7TWHTR0CdfdakJp+z2J1
 uxH7FROc6ZjWElqwt7484FBgprY2GjhAi2tw55MKnenyLW9wb5inxcWR3gO6tUeqVygb
 RrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698259483; x=1698864283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x8tcDalo98Jqvuxyk5/hMSLaaPuSGrJqcNmoOeLVX9Q=;
 b=NTE/jNRgQZUOTRgVx3Hu6jasgtn0vQQ4pZcy30lRIoVvUvZbhs/ib34sWi/UJlgTHs
 dGLtoIziozBN6VrJ2/oxyWRCjNBZROfkZQ48Q4soAVrtDxapab7KSIwlGjqYlYYVrc7w
 KtyuCKkCEUVdq09FK5hQpDFLNMjCrbUlcwgrZlR08Ex0cFQ1AXHU5EDO0JdViF3V3x9Z
 OpCydYNfeCC7qKFuDLogtO+anySoP36KYFpAad0z2qyQrXf4CE5TABXBme+NdlhSgewL
 ru5craM2Y5R9MO2X7NU7nqQgnrRfZxkH0HiHR239p+4ZwwlpNnQeiIBQnTM21G37RSwm
 vIyw==
X-Gm-Message-State: AOJu0YzF73dcH0u7poV2qvpCa0+GzcxHbkTp/dthNnPbIV+IQFVUPaK0
 vpSr7DFnBfbFDpkrw3d1GXiw8tND7v2J27s/2is=
X-Received: by 2002:a17:907:9618:b0:9a2:139:f45d with SMTP id
 gb24-20020a170907961800b009a20139f45dmr11764020ejc.43.1698259483133; Wed, 25
 Oct 2023 11:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
 <20231023113047.2572137-13-marcandre.lureau@redhat.com>
 <52338f56-cf2d-4eba-a6a4-5ca517f9fea6@redhat.com>
In-Reply-To: <52338f56-cf2d-4eba-a6a4-5ca517f9fea6@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 25 Oct 2023 22:44:30 +0400
Message-ID: <CAJ+F1C+Z2dVskKx=xAAXScoBuwKdZ17F3p+ULwSxs_pnM58XPw@mail.gmail.com>
Subject: Re: [PATCH v5 12/19] ui/vnc: VNC requires PIXMAN
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NK233iWhywx2

Hi

On Wed, Oct 25, 2023 at 3:53=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> On 23/10/2023 13.30, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   meson.build    | 6 +++++-
> >   ui/meson.build | 4 ++--
> >   2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/meson.build b/meson.build
> > index 395d7155f6..c4dd9e01ea 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1536,7 +1536,11 @@ endif
> >   vnc =3D not_found
> >   jpeg =3D not_found
> >   sasl =3D not_found
> > -if get_option('vnc').allowed() and have_system
> > +if get_option('vnc') \
> > +             .disable_auto_if(not have_system) \
> > +             .require(pixman.found(),
> > +                      error_message: 'cannot enable VNC if pixman is n=
ot available') \
> > +             .allowed()
> >     vnc =3D declare_dependency() # dummy dependency
> >     jpeg =3D dependency('libjpeg', required: get_option('vnc_jpeg'),
> >                       method: 'pkg-config')
> > diff --git a/ui/meson.build b/ui/meson.build
> > index 7c99613950..b3525ef064 100644
> > --- a/ui/meson.build
> > +++ b/ui/meson.build
> > @@ -46,8 +46,8 @@ vnc_ss.add(files(
> >   ))
> >   vnc_ss.add(zlib, jpeg, gnutls)
> >   vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
> > -system_ss.add_all(when: vnc, if_true: vnc_ss)
> > -system_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
> > +system_ss.add_all(when: [vnc, pixman], if_true: vnc_ss)
> > +system_ss.add(when: [vnc, pixman], if_false: files('vnc-stubs.c'))
>
> Is the change to ui/meson.build required at all? ... if I get the first h=
unk
> right, if "vnc" is enabled, that means that pixman has been found, too?

Well, this is a bit more explicit, to get the dependencies correct
(flags and such) without relying on other system_ss units
dependencies.. I'd keep it.


--=20
Marc-Andr=C3=A9 Lureau
