Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5016606A332
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d+vCc4ZE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPL02-0006U5-Dt; Fri, 06 Nov 2026 09:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xPKzy-0006SA-Mo
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 09:32:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xPKzw-0008Mp-B9
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 09:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793975573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFgof38YVmuhepQLwF5AfzYRURG39/TBDJ0Tu3cg9+s=;
 b=d+vCc4ZEqk9hB1F2ZtLr6QRRe54YMjMEQzQlzMJv13h7o4uLz6ejtqRK05owWGDh0LM0Ok
 rvbeqRxtDaEZKu8kl0+h2Uoxc0SfUheW5AMXz4eUA6R4T16sEj8M6v+R0rKHpSHeC5zboA
 T3sYZGr2pA2p5kMXLtYoYK02jJSfDdU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-Ud80v8qUNsyh81KJoEGSCg-1; Fri, 06 Nov 2026 09:32:52 -0500
X-MC-Unique: Ud80v8qUNsyh81KJoEGSCg-1
X-Mimecast-MFC-AGG-ID: Ud80v8qUNsyh81KJoEGSCg_1793975571
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3b08364cdc7so808031a91.0
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 06:32:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793975571; x=1794580371;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KFgof38YVmuhepQLwF5AfzYRURG39/TBDJ0Tu3cg9+s=;
 b=MLelWpVPawrKjbpCWajXdIW6Ta9afNyKp1zyQ2ZAQf4iQO9HBYQMh+/LEY4gF+qdFi
 ktBOTt1JO2ep42kOzbjWUSgUROgNpsBAB4KOoOCvURwKxsTtZO34/VzQ3W9hhhZNYyM4
 jxwYQykbqI93h2PcBZoTbyAWbDrAUTJI/OSDyyaThlnIr16gS8PdYPZlJvUuSGkDRQ1Q
 +1NhT8CLWgZJjtuW9hQQDd5rdwGKWrX6tmQhberhx5oFxXAMMFwZc82lG45C/0UbzLSa
 ht6LalN14INexQgZGZD26bNkpKTOiv9AiBP0Gv2N9DTpY6DCLtgONqYHCcRldjV2xvrV
 lA9Q==
X-Forwarded-Encrypted: i=1;
 AL+hErGIAsftFC250LG3+vghBeBNITigu3ubmi+xFA4V8hm0A+TmTBbBvII/2INORJENjOjt9ZQBUf7NCw==@nongnu.org
X-Gm-Message-State: APuU4Z/JjRRNrQTMUz/bsQHIFKQ6N5yDAss7a6A1wX+NfDDaUtceGTcv
 oEVlPTmwSiQoNaymVtQv5B8BEHArkU4FO8Mo9yQjXZYCSmljDfdvsNR6dZTkeYuffiNdjduS8OF
 afsdW9G1rtg4LwULt3Cd7ja3BqlfB8nrmWaHEVVMDjxHmmcP92cial7yQIVOcRAz4/Vh3ZaCD2n
 MFJtZXnkaJy9sf0dTcM1D2pk1/c2VB
X-Gm-Gg: AYBFou2IKWxpOKouimWKcqrdSFoDb3smBX3VT/zxhjNV2i1j0QeQfuDXKct1oXyyByB
 3DhbxJZhRTJnzMVYY0TlRsCRlVPS1pjyEG9Nod7dw65HWOf5kiiXgMxjuc72KrDYu2kOkcBBXUp
 EDSRwOuoJqdESXUHAWRGnyTuDI7Kd4jtUmcmGGZRolkmVl7k+ifoQZLOiP1B8ywCklt6MkkUPD+
 xYNS92CZrb6mO6p5RE30b9Y+qaj43Cika56uJHN01Sne62Mr7AWEegHie6rHc4hJMW3yskB3hLP
 hA==
X-Received: by 2002:a17:90b:4acc:b0:3ac:9e76:aa9b with SMTP id
 98e67ed59e1d1-3b0db5f17abmr2690758a91.7.1793975570837; 
 Fri, 06 Nov 2026 06:32:50 -0800 (PST)
X-Received: by 2002:a17:90b:4acc:b0:3ac:9e76:aa9b with SMTP id
 98e67ed59e1d1-3b0db5f17abmr2690726a91.7.1793975570320; Fri, 06 Nov 2026
 06:32:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-28-berrange@redhat.com>
 <31bf0fb1-06fa-4bae-8b22-853f80548f9e@redhat.com>
In-Reply-To: <31bf0fb1-06fa-4bae-8b22-853f80548f9e@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 6 Nov 2026 18:32:38 +0400
X-Gm-Features: AclHuK_pAxkav4OTh3uql40djULH5fMEJ-oSsUYthtVGQo9W5daHH-dJ8IAFL2k
Message-ID: <CAMxuvaxAmTShKMxxhtMxVEjB5QL+d5Qgw44efB4WeRAC9oQS_g@mail.gmail.com>
Subject: Re: [PATCH v2 27/28] hw/display: mark cirrus and QXL as secure
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: giDpSgpM_perFeTg6jxA3N9T8bljXjoaMX9u2DhjU9I_1793975571
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On Fri, Nov 6, 2026 at 4:23=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrote=
:
>
> On 29/10/2026 14.12, Daniel P. Berrang=C3=A9 wrote:
> > Most of the display adapters are emulating old hardware which is not
> > relevant to virtualization use cases. The previous commit added the
> > generic, simple devices.
> >
> > This proposes two further devices based on their historical widespread
> > usage in virtualization use cases.
> >
> > Cirrus (PCI, not ISA) was the recommended default for x86 for an
> > incredibly long time and while it is now discouraged, it is likely
> > to still be in common use.
> >
> > QXL was the recommended default to be used with SPICE, which is designe=
d
> > to service virtualization use cases and is still commonly shipped by
> > many distros and often used by default in mgmt apps still.
> >
> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> >   hw/display/cirrus_vga.c | 1 +
> >   hw/display/qxl.c        | 2 ++
> >   2 files changed, 3 insertions(+)
> >
> > diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
> > index 0a8c74e1374..8232c5c4687 100644
> > --- a/hw/display/cirrus_vga.c
> > +++ b/hw/display/cirrus_vga.c
> > @@ -3013,6 +3013,7 @@ static const TypeInfo cirrus_vga_info =3D {
> >       .parent        =3D TYPE_PCI_DEVICE,
> >       .instance_size =3D sizeof(PCICirrusVGAState),
> >       .class_init    =3D cirrus_vga_class_init,
> > +    .secure        =3D true,
> >       .interfaces =3D (const InterfaceInfo[]) {
> >           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> >           { },
> Considering that the cirrus card also had a bunch of security-related bug=
s
> already and nobody is really in the mood of maintaining this anymore, I'd
> rather not mark this as secure. I'd recommend to rather drop this patch.
>
> With regards to qxl, maybe better also omit this for now 'til we've got a
> proper maintainer for this again.

+1


