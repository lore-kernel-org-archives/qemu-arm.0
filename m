Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C1606A32E
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 11:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eFC/eao+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOvWU-0003Q9-DJ; Thu, 05 Nov 2026 06:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOvWO-0003Li-92
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 06:20:44 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOvWM-00037h-FH
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 06:20:44 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6b4f7d3cd98so2052681a12.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 03:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793877641; cv=none;
 d=google.com; s=arc-20260327;
 b=lVJmgTQKvCsihl2fiPsI7d6UIdlZBdkxnNOtlcCZMlCZgXR6k5XJ1ntopq0uXO9I+t
 Px0T2MkJtmwgZ/g+8PvCw5RTBt44LcYbOgXFQZFoXv7zaCu0ZKdX5oiICBL0CQPzIjxj
 lJztJNytWabHBYRyVZgQ92IaRYL/U+EqZbDId2IUwawK2c28wCl/1Uat7cSswRDOCfSS
 WDL/xgr+zMSM35u1yy1/+XuxsqnyqZIkv94ragzNfk97cjQHw5Ab++fz8dywgWak5JFn
 dvblanuKQydVlK8rX0xL7VmBfyD1cgYBqzTfJZfH6fmJAFCAbfHXARGTryWCkIvzE31c
 GcwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=PlNb1BYPWHkmMzUQSlxQ2cyH6wtWvDkLLKaViisxyso=;
 fh=KxAWneJJ7ifWa9Np+kY+e+75vzUi/TXkJ/D+z7YLu7U=;
 b=Eg6YfTGUJR9Sxnv7cmgnbSI0ev2pMddPf/tAlo+fUVOtXLX5ZCbkvwGwsoOKaLbG7F
 6U6diq9TQLehzkzRKifp1gKCzQpO29rLl/tPj6HQgKwJjOgTiJ83ImCxiTGzbjoD4n/K
 HO4XIpcoPFldQaU0gkR7AVIbF8625I95eJnqTKPCTf21AmOi7FzsisGUK328/blyHusP
 AFc7TKAdi14pdvt2WSAI1mSPTqCutoN1b+GYh9Z3v9AekXPPNtibk5bfdi3OUv/HidET
 /k80HKzB9d3D3GPJ0AVX/nxXaofa8tlnIipQLJs0Jl0pv016R6lLiukgOkyImzwUHmL0
 N/BQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793877641; x=1794482441; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=PlNb1BYPWHkmMzUQSlxQ2cyH6wtWvDkLLKaViisxyso=;
 b=eFC/eao+2kJXZNENSO03FQG1Vei22tv+e4BlLIyvWZ4PwOr9+Rr6nwU6OgQY4KKu/Q
 xWxI1VR11zDs7H94itPnKqyeTp2/u7je75n65PTuiETwqUww3mMegtEYRTHLM/L0J4Lu
 RH8Ku29jE2P3uHFOZfwP1H6taz9uvFIuVsNvGd5L2INYiBEUl+UOTLUgl7S1+DJv83/C
 ICr5dFR9ONYqqQ8yI8JVroUo4CJo80HUw+JjXzqvFwexHy3d5cKiea1zlTUGJlFjwHVN
 FNFhAlAdtv8K9yDqMsIMpebi4lyfK+TbkQXX28kWbIHHkFIfE9071ZLbjJVtkKApW7vy
 2QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793877641; x=1794482441;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PlNb1BYPWHkmMzUQSlxQ2cyH6wtWvDkLLKaViisxyso=;
 b=Ji0Sy1fUCYvbi4J6ncmlmZUn1feCmmeI1JXXiBuKVqE6dIn682xf13G1IIneG/B639
 L9Ou6IMNsB8FOhB87B2cVkUOr9QHeL/IeJGP8F2x39qEbFkr8UO6l+zIpIEAa6ndfjSl
 fHSMh981QvP3eiaPKIB1qPyxsRW6uCq/7mjgyX7YQMRhAO5ThGdnTz+wAJSVO4h9YhnR
 A7XqyCNeu1asM9pL8y8uSZ3C+3vsAw1mXMYHThJsjqwh4JQizvpxqh08caHkSNh6XsTl
 Bdpxa6mQitgB8fXN23K8ZzIug7ng13GkTBoAWD7jSC9+D68Iv1SOvGC13gIiCdUdqxko
 eSzA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzTZmCUpvdXP2Xzl7mwSQ87akO8aOH4s6WZbYTQ75R/ZKuSoLeHsYsCp7f8rxY18ScbXhE3qrWCsg==@nongnu.org
X-Gm-Message-State: APuU4Z8SQPf7qAZqyYOfhimdEitAEc/AvtfV7J4iBbmu+0FRbrXh3QnD
 Rt5YEKtklHjU+0QA8LObwb81TYPqXTAEWpZg1LFIgIxwjKaq0wm3n/PilMLSiKuqejan6lORgDw
 8wLBCV/VGVYqu5jxnOg0pFWQg4tEb1ZU=
X-Gm-Gg: AYBFou3p2pA6r7+Rqi5+3fKs4LVbBp+Z4F33ziA6PsYQSbTv9SN2AC+dwIndrLb1H4s
 ZAhfEMG3At1TUz7BgfmSloLzOGG+wy0bfsnGOxhV5gIXnxlvalA9lsr1XNn9xgX5rnpK+rwdRB6
 pDly91ifK8FthIFBgfFSeHvH0qLQaJxzXkCdW64zbt0EYaZXwMECx1VNTLZtBjC19DHXDDyFM2J
 KfIOikBIS22xeP8n8gbDLYRvQQnMWc+0ARaz7oNGwufR3gOgzypkRcavrYNKJJfHmgxojlG2S3C
 w/H2E16jVVV7e3Y9bHnQWwuDCFMKwjhwnOK5ztirnpOjXVjXhIxfke6hZ1m+SpuDEmUewhMvnpq
 YyM4/qMi45pojgBSDaVERkV24B78rzQRS55DFmQM4VqOuIwtk3IvoJmtZ9A==
X-Received: by 2002:a05:6402:13c2:b0:6b4:20bc:f97 with SMTP id
 4fb4d7f45d1cf-6b4d4687f36mr12944657a12.9.1793877640500; Thu, 05 Nov 2026
 03:20:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031164009.2048-1-luoyonggang@gmail.com>
 <20261031164009.2048-10-luoyonggang@gmail.com>
 <auxigHswmymEQogo@redhat.com>
In-Reply-To: <auxigHswmymEQogo@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 5 Nov 2026 19:20:27 +0800
X-Gm-Features: AclHuK8JaCBfq2iHM6_gWbf_I2SMsgzy25i8IgvXVSDpbsJRrDcKVJDcV5gKWqs
Message-ID: <CAE2XoE86xX=Vzb9K-qREB+zSosq1SiZvbgV_5TaOGTC-XEp3ng@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] hw/virtio: register s390x virtio-blk-pci and
 virtio-net-pci variants
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, 
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Fam Zheng <fam@euphon.net>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Eric Farman <farman@linux.ibm.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 7:03=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Sun, Nov 01, 2026 at 12:40:04AM +0800, Yonggang Luo wrote:
> > virtio-blk-pci and virtio-net-pci added the s390x loadparm property
> > from class_init when target_s390x() was true. Register each
> > VirtioPCIDeviceTypeInfo twice. The s390x variant calls
> > pci_qdev_property_add_specifics(), which now always adds loadparm,
> > and the other variant does not. target_s390x() and target_not_s390x() s=
elect
> > the two.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  hw/pci/pci.c               | 13 +++++--------
> >  hw/virtio/virtio-blk-pci.c | 27 ++++++++++++++++++++++++++-
> >  hw/virtio/virtio-net-pci.c | 27 ++++++++++++++++++++++++++-
> >  3 files changed, 57 insertions(+), 10 deletions(-)
> >
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index 2d2fe02c68e..b5ea0b049aa 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -2901,14 +2901,11 @@ void pci_qdev_property_add_specifics(DeviceClas=
s *dc)
> >  {
> >      ObjectClass *oc =3D OBJECT_CLASS(dc);
> >
> > -    /* The loadparm property is only supported on s390x */
> > -    if (target_s390x()) {
> > -        object_class_property_add_str(oc, "loadparm",
> > -                                      pci_qdev_property_get_loadparm,
> > -                                      pci_qdev_property_set_loadparm);
> > -        object_class_property_set_description(oc, "loadparm",
> > -                                              "load parameter (s390x o=
nly)");
> > -    }
> > +    object_class_property_add_str(oc, "loadparm",
> > +                                  pci_qdev_property_get_loadparm,
> > +                                  pci_qdev_property_set_loadparm);
> > +    object_class_property_set_description(oc, "loadparm",
> > +                                          "load parameter (s390x only)=
");
> >  }
> >
> >  MemoryRegion *pci_address_space(PCIDevice *dev)
>
> Again this is the only bit that we need IMHO, as it is harmless to
> register these properties unconditionally.

Hi that's the first choice of mine, I have did it a long ago

https://patchew.org/QEMU/20261013200525.1340-1-luoyonggang@gmail.com/

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

