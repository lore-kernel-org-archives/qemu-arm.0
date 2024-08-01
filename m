Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp735199njb;
        Wed, 31 Jul 2024 20:25:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDpamxD49YXQe12XroyiFUx1lYWHTRxV1aTvnCduyFNN4TRW737thz3b5XPSnouZfGa+WEiOaPc/7CYynO13xzJiNSvCWd
X-Google-Smtp-Source: AGHT+IGWryLEZ8modo4iTZW/LwphcFVEpZtRybYR/IHKs97Q3aw9i5IrFJQbIdV9g+C7OWUloGh+
X-Received: by 2002:a05:6214:4301:b0:6b4:dd2a:aa44 with SMTP id 6a1803df08f44-6bb8d79dd70mr6139316d6.37.1722482712091;
        Wed, 31 Jul 2024 20:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722482712; cv=none;
        d=google.com; s=arc-20160816;
        b=UrlXon9Lw7x/lqkhGECBp5/kxba7zNVQIvb2cuzzooHUJ4u1kxy0Zjec5xhlubY2TY
         h8m9dlhuJ7UqX7BsJYOXP8D34xUGFY4vlKsGzh/SD8951tQrxpxx83dPr6zmL/d2xG5k
         D97xeSZ7Km5OEBVYTWst+e0YAUFdO497nWznsqr0+VUjj423d3Q2fkVsEkOy6Dq5fPZh
         +RMho5vsvAxFqRY8FmVuAmkyxS0SOBH0GH+FC0PLzIZbtcIGnfScp8wpNBIV38a8GLQJ
         +vcPEmm/7r37vLBTRZu2XZ77u7bMWSyE2Hte7jVsjTumtM4rk8gJGcUeMuw7x8dl8aft
         61rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LIA8qtIEwBqGQojB8vR+PEMLSgLeUXkAJyI8y+mq9FA=;
        fh=lB3ninikei5a1wLTF6Lf8dC/Xd4TCVAz0HIdXVAyFWo=;
        b=OuA0f6bAmbdxZYOWIy5Qhbrz76ltT2oQih1utT5Ag1zDWXqbmvHTHKDz29c74Zco/b
         sYktmUMDt0KLPaCo4jC2FcHB8+uMg2Hdk1i8ooID01uSG35ntBIe+23NHU0eid3Ta2KX
         aXgXnzLQWsdyN85sZsC6i3Xfiaer/4Kxd6hUHtxcXJRxoeGkkFEI2DluSnTrXPF/Ut3i
         Xm50XrxmXERofOEfzW2Tfqvsi2R/u5Vcl5Yip8SLyZj0+ERC+EK5b5SYjfDiVLXFFDJR
         g4JfcHash+M8M9Jro45I75M+C27DFKUwCRbF0nshWmx3Mg4EGqvS6Lk5IfCPLIx6x9EA
         hnvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CidlYpRH;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3f90340fsi168373376d6.185.2024.07.31.20.25.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 20:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CidlYpRH;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722482711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LIA8qtIEwBqGQojB8vR+PEMLSgLeUXkAJyI8y+mq9FA=;
	b=CidlYpRH16vBsI5EwsppOBqs3TfUcywPOdgN7Ls20a/d6lCyqEB6UM5PjMf+MXudO4NPZ8
	Sb5TnjSuF1JCkrHBLzqlpTGJUDworfyNNMrdIlw/BTDoGYwMz25rnysxPA2lajyrbhimtK
	hWBhXcRHZ/TtbHah63aaY3rFoUhP3ME=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-WAecVcIjNjqu-Ngly5cvGA-1; Wed, 31 Jul 2024 23:25:10 -0400
X-MC-Unique: WAecVcIjNjqu-Ngly5cvGA-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-66a2aee82a0so125419387b3.0
        for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 20:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722482710; x=1723087510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIA8qtIEwBqGQojB8vR+PEMLSgLeUXkAJyI8y+mq9FA=;
        b=O2IkOAvKwsw2LdTHBfRBTsYST1WaIJrTblawB79J5RtwiuFsRuDC3tZ6BmpcVHxuV0
         MarthUoMwgrkEyG9XvkwYI7lrJhAha+MkSePCrqghXLEwVzm93YEO1wyuL5yPA81XEIw
         06vjRvjaVxGcMS1xUzosjnY9y1+C6fSr7Yj+UKthN9g7YW/XIEKiL0ilLkPfxs/eZgll
         UNiaZgob6eXJTVSXbc5/K+rSGF9jZHavkbbX2FTfwtYkuZZn75vxhjNqqsFsOHUYDeZ0
         rkgiQgXpM4mJG3CMFxxM9v6jqIkIDPkOrX2vcePNbD097kXBNXLlkKlorqefaq5QOOIY
         DD4w==
X-Forwarded-Encrypted: i=1; AJvYcCW4paLO7mi1D/82JR1o7HKYyy2mNAnrVROgsFcCCRIsWLgb/OFs1EJFBt5vQa7ziNDZTxu57bbAk5Ml36kEXiO8HNce00cO
X-Gm-Message-State: AOJu0YwRKM0n29cL9iMuhTM5L4gv1+3b1UrUqZGiZhOZDjX5MWHVoWDh
	/Nj24KgzpwXtES6ewJX4klL6ipi8NZUOIFs0vPh/GqPkwfFLHgWs7oMjFI26+Sae3bQ2WQgbX8s
	ZtubU9w94bqS9cuQLScQQ03/WML9PuaOJfEzKwbnfLCRAtn6lCdw8Hz8DMxGvIWAomj1IfvZCfF
	MWaWwdnoqc94H5ts87E3IIJeM7iTQQ
X-Received: by 2002:a81:5b04:0:b0:66a:843c:4c38 with SMTP id 00721157ae682-687521b9560mr5159457b3.37.1722482709705;
        Wed, 31 Jul 2024 20:25:09 -0700 (PDT)
X-Received: by 2002:a81:5b04:0:b0:66a:843c:4c38 with SMTP id
 00721157ae682-687521b9560mr5159337b3.37.1722482709450; Wed, 31 Jul 2024
 20:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240726134438.14720-1-crosa@redhat.com> <20240726134438.14720-10-crosa@redhat.com>
 <Zqd2edn1-aNiVriv@redhat.com>
In-Reply-To: <Zqd2edn1-aNiVriv@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Wed, 31 Jul 2024 23:24:58 -0400
Message-ID: <CA+bd_6JBpV3A_yyi_R5uELfZkf4zfKJSW9YuZd+am-guK7-QjQ@mail.gmail.com>
Subject: Re: [PATCH 09/13] tests/avocado/boot_xen.py: fetch kernel during test setUp()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, David Woodhouse <dwmw2@infradead.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
	Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: mve0NOj84nsC

On Mon, Jul 29, 2024 at 7:01=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Fri, Jul 26, 2024 at 09:44:34AM -0400, Cleber Rosa wrote:
> > The kernel is a common blob used in all tests.  By moving it to the
> > setUp() method, the "fetch asset" plugin will recognize the kernel and
> > attempt to fetch it and cache it before the tests are started.
>
> The other tests don't call  fetch_asset() from their setUp
> method - what's different about this test that prevents the
> asset caching working ?
>

The "wizardry" of the "fetch asset" plugin limits itself to analyzing
test methods and the setUp() method.  This test currently does that in
the "fetch_guest_kernel()" method, which makes it blind to the "fetch
asset" plugin.

If there are other tests doing that (in custom methods), then a
similar change would be desirable.

Regards,
- Cleber.
