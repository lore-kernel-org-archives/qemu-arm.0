Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp204863ejb;
        Thu, 26 Oct 2023 01:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAlmjtGHC5TR7G7xqxX7KwvIrIRI9bkX2kU5uoSpHkWZhLmqwi23DDvNKYSg5od42ue3rc
X-Received: by 2002:a05:600c:3583:b0:408:4095:6f0c with SMTP id p3-20020a05600c358300b0040840956f0cmr14650880wmq.38.1698307786804;
        Thu, 26 Oct 2023 01:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698307786; cv=none;
        d=google.com; s=arc-20160816;
        b=edIh+aecAhhhJRvSGc2tbYQ34aMJpdmcrdW/9jtzqkbnCDD54ZXBpqESON7+WMY8A4
         x1WjchZnrY8EEIgV/JjLFYTHyM9CS8UjgXNoNbjKpRR1QTncZgAp3bRImu5fwYh/LCN6
         qHj576qqy5UORuAXpPhiP1lIivS2Vdl1FIkfmNuguc4XoJML+iY8ReHjKslE4QS2lRaU
         juGxn6IramcIpBFuB5TUiYtkRQJGjXUEiCsEgDSDLjnDCft4xz9PyUbwQJ21x7s62Eao
         M1lHsaCzhMpyKBD9Pifs1Qv8qm2g3kCwttqVW9nktqueqmJkRSxD0RBDWztAnZJZv/bv
         CZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IC5m9AAqYvMhf7ADaR+bnPI2wZNYer2Z5KpTC/54nKA=;
        fh=z6xw1DkNqoZ+gNJ+heE9rQv2hR4keKcSA05+RkorVks=;
        b=rgST7kfpRSdaRaaAr9rYhQuLA73zyRnj5zinBOH2BSZLTqvzlZmw/l/ltu5NP7wO8t
         nFA2WGaYNwZWiPHuu0mtUpW3TsaYHum0u96HfZuyc/lJOECvjj4gPkP/n4eKgm2xn3uB
         iP9/8zzDZyQqEzbXjzeRrDBwCr/ZqNxP+FF9HUX+myN4t8MFOe2bG6NOQ7CJWSvV/zdl
         Rj6Buo5eFPxpoblJD5ROYSC3lDIb7rpoQ7GSMsK5gQ1AO8XRBWR1AT6DSjuwtb7gbcoa
         +wnODutpkTB3HV7Zu0YPdUNN1Dkee1fL+LNv6+MjGymPvI8VY9tmU152Hn5DKm76YObQ
         E3gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2N87jF5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j30-20020a05600c1c1e00b004085bcdafa5si193844wms.52.2023.10.26.01.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 01:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2N87jF5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvvQx-00032g-46; Thu, 26 Oct 2023 04:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qvvQp-00031j-99; Thu, 26 Oct 2023 04:09:31 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qvvQm-0008NB-8C; Thu, 26 Oct 2023 04:09:30 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-66d093265dfso4384876d6.3; 
 Thu, 26 Oct 2023 01:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698307765; x=1698912565; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IC5m9AAqYvMhf7ADaR+bnPI2wZNYer2Z5KpTC/54nKA=;
 b=V2N87jF5FDTLcx7eWvKEE4aJUVnvgZZ2kfmUQCKO9QzyNKMaKhPwLOaZnUXOtRLL3r
 NIlNww1OTVGlbiKJiFbOVpkG0/DmLMHAn9O7jrAchb25F9P2SzqNSoBnKh0k7bqZumVh
 4nYCulZvjy4XtQ4bwFlnZleLHzQXRGz1ZWD72pmWlDpd9rafrkImczMEcp+8nHD+9Wnw
 71EPuMuqlJLW6XV14SKzHziHmi6dpcP2jfwu2xoMF35hZRLtQypHe6m0N/gXQXGxdZsP
 PJR8utk4uNUZx6GdGE5nLvwKv+7NgU+21eptHphlYzmIVXAyNdg9J9CpCNxkRsMS0M3P
 EQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698307765; x=1698912565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IC5m9AAqYvMhf7ADaR+bnPI2wZNYer2Z5KpTC/54nKA=;
 b=lPnIULeahZ4TFAPFQP1HjyHsdwkHyvGAzxFKXIr/U4hdUo5ZkNwVFW+iJnoQw2JnXi
 RmPvHyjo/2HDtTt8AlgHPw90JamvY3iAFuMO9Bap1nlt0Yx8QUoXV8v2t745DsBy87RB
 I9Eknbg6opUJltcAQq3uMk0R7xhYDzE1MTY48Li02kSwEBnXXoBNdUZeq0PZSVBX4h89
 batvbHz84UPRANt+5OYxJ9UFXVIKp/svopKEadL16Oi2JWMIHV1fYTGMjb0rb7ZiGWDB
 WguEqVIxzhYyV39SIdZcUIwPOrIhOpoV/Qc/s+YltWFsnkx7SH8O2fTEyTDmz1f1u3G2
 c/ig==
X-Gm-Message-State: AOJu0YwSTBW9wxk3MCpZm/ohpT/4bXzVaKuRY6Wo9eABnpMIsIrZjoFI
 7Vtjo86LVbozGfCmZ2S4j0p9wmExp/RrLAst3jU=
X-Received: by 2002:ad4:5aa3:0:b0:66d:6526:d605 with SMTP id
 u3-20020ad45aa3000000b0066d6526d605mr21732046qvg.63.1698307765425; Thu, 26
 Oct 2023 01:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
 <20231025190818.3278423-16-marcandre.lureau@redhat.com>
 <4b2a7827-b0a0-4cd5-81a4-d4129a53ac82@redhat.com>
In-Reply-To: <4b2a7827-b0a0-4cd5-81a4-d4129a53ac82@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 26 Oct 2023 12:09:14 +0400
Message-ID: <CAJ+F1C+q1N0MWGHH=L82iyL-gCp__U+eELo9=y5fz0rexUFptQ@mail.gmail.com>
Subject: Re: [PATCH v6 15/23] ui/gl: opengl doesn't require PIXMAN
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Eric Blake <eblake@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4ssz0xcvgfLp

Hi

On Thu, Oct 26, 2023 at 10:44=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:
>
> On 25/10/2023 21.08, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The QEMU fallback covers the requirements. We still need the flags of
> > header inclusion with CONFIG_PIXMAN.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   ui/meson.build | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/ui/meson.build b/ui/meson.build
> > index 3085e10a72..7c99613950 100644
> > --- a/ui/meson.build
> > +++ b/ui/meson.build
> > @@ -60,8 +60,8 @@ endif
> >   system_ss.add(opengl)
> >   if opengl.found()
> >     opengl_ss =3D ss.source_set()
> > -  opengl_ss.add(gbm)
> > -  opengl_ss.add(when: [opengl, pixman],
> > +  opengl_ss.add(gbm, pixman)
>
> I don't quite get the above line (sorry, meson ignorant here) ... does
> "pixman" simply get ignored here if it has not been found?
>

Yes, when it is 'not_found", it's simply ignored. Essentially, this is
making pixman from required to optional to build the opengl source
set.


--=20
Marc-Andr=C3=A9 Lureau
