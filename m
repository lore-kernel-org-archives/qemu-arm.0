Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8A3CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 18:55:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8kBF-0000xS-Bl; Tue, 14 Oct 2025 14:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1v8kBD-0000vQ-Al
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 14:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1v8kBA-0004fm-86
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 14:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760468120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/p8swltn70q5Be/COE2+/cmY5uhZbRHrzBOHh4B8yY8=;
 b=XNnJ6z8dKQ88apyuRv69cLVEgEJrlO5VjKcC5TJmnuqxQ7/ECGCYRt/ENVqgazfXWC4CWV
 iT8f1FOCHqV6PamdKRcxfoY6CTuo1uH+o5Y5AU67zMZ72Xs7KALL9hqwHD2q79xdrOLp7N
 YcJXRi057QXXIUYDrBLnbgNNgtUPQaQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-i9tgJZB9NLOH3YSJDYIC8Q-1; Tue, 14 Oct 2025 14:55:18 -0400
X-MC-Unique: i9tgJZB9NLOH3YSJDYIC8Q-1
X-Mimecast-MFC-AGG-ID: i9tgJZB9NLOH3YSJDYIC8Q_1760468118
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-746b28ff4c5so84966087b3.3
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 11:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760468118; x=1761072918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/p8swltn70q5Be/COE2+/cmY5uhZbRHrzBOHh4B8yY8=;
 b=UPbn8hE86XcLOrE/f8f2WXQ5Rh8p0ShMctYmDEJ9cOVtsECBkN9yaj4sBeTibNAvpC
 bJEdWSO1O4ztAZPOxxVzh2yaPqFD+JcOBrQQ/grzYDEgrj/E5eCI0notQuv1C5WabILp
 IIvhyIFYFKofT1eDzk4nt3lSUI1DsfyYHH/Ru+VPIZhUGZ6Hrt7XO8qM2kdx4npfoKTK
 zhiIL81B3V/+YAR0DzNfwCZejjHedM5BYcU/d+ne0p4eykqVgImKyUWIDRUouyK7emU8
 9Jz09sOZC+pmSn2q8nDbGVVil2vyP0O4oExa4nWawvVl9syfhqX50Vih2+WCs/CV8glX
 pv2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZU7Zy25q4KOqOYCPFGgxZioLDpOoLDQTpIk1iT+/saPcKKRJpzXE3ev6gma8pXZL5dQbzbdpbbw==@nongnu.org
X-Gm-Message-State: AOJu0Yx5YL5feLgLXaRCaVPPQIKXGxpaRpQxuud7AjlzrozIhY39nIki
 dxQL4mBRzw2pEpLSntbBrbM7QJRnfT/jCe8U/FAGxiy5O9NR52hjOQnx9g0Hg+wOGpACOUpk+36
 yfoQc1xA2nZ8/anlGVOfAXMia84PuZu7iwU5nbrLjmlpl2Kp+0hWY0dhe6fGhsHcX+mB7iCKfl8
 MgZvbGIGlcVEdMQspGPeheXo2QzNIT
X-Gm-Gg: ASbGncvrVLM3//sMhA7eVGIM1FbCD/SQSDP0KgnqX4lXZPGj8sfIuP1gl8LbW7QzKSy
 eW6BEp3dl+a/zMaaebPx43y9juOMTOaq+b+ztp5tjE5h41QsLEvqNYDISU4OAHcHFyT1bml9/Pu
 szSjrrZfZS1SdJzH9gjQw5dEfpXh0gjoUeJwIsyiJ7Yv9dcIxd6qUf
X-Received: by 2002:a53:4c08:0:b0:63c:f68b:2c52 with SMTP id
 956f58d0204a3-63cf68b2daemr8335057d50.43.1760468118134; 
 Tue, 14 Oct 2025 11:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkB7NTDT0t3LYsXtV68vSWShb0yyz3IkvrB0VWqYfKedaBM09dwcpCRIfDfgKVsBQ7NcODpCtbe/xeVDd+lCw=
X-Received: by 2002:a53:4c08:0:b0:63c:f68b:2c52 with SMTP id
 956f58d0204a3-63cf68b2daemr8335029d50.43.1760468117256; Tue, 14 Oct 2025
 11:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
 <20251002020432.54443-3-gustavo.romero@linaro.org>
 <CAFn=p-bscu00jtyfm+SmeYqB7gt6eA+F8uuYb8ng6rTe_a=HTA@mail.gmail.com>
 <a0d4ba3d-f799-4ec3-8d3b-efdc33527242@redhat.com>
In-Reply-To: <a0d4ba3d-f799-4ec3-8d3b-efdc33527242@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Oct 2025 14:55:06 -0400
X-Gm-Features: AS18NWD_a-xwuO0EevTPHGnUpUHZqTXOmqUDofO8o3B1-gQKmlGWn_6ZThV2lMU
Message-ID: <CAFn=p-awbF01tQr9xnRX8EqPBNoafGP+N2W-hoMwc68cmwQzLA@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] python: Install pygdbmi in meson's venv
To: Thomas Huth <thuth@redhat.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-devel@nongnu.org, alex.bennee@linaro.org, berrange@redhat.com, 
 qemu-arm@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xXJW-t9tCuhTVAiecX6vqEJdqlkNKDbKW_9KM3ZzNQ0_1760468118
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 14, 2025 at 2:21=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> On 14/10/2025 19.39, John Snow wrote:
> > On Wed, Oct 1, 2025 at 10:09=E2=80=AFPM Gustavo Romero
> > <gustavo.romero@linaro.org> wrote:
> >>
> >> The upcoming changes in the reverse_debugging functional test to remov=
e
> >> Avocado as a dependency will require pygdbmi for interacting with GDB,
> >> so install it in meson's venv (located in the build dir's pyvenv/).
> >>
> >> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> >> ---
> >>   pythondeps.toml | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/pythondeps.toml b/pythondeps.toml
> >> index 16fb2a989c..98e99e7900 100644
> >> --- a/pythondeps.toml
> >> +++ b/pythondeps.toml
> >> @@ -33,3 +33,4 @@ sphinx_rtd_theme =3D { accepted =3D ">=3D0.5", insta=
lled =3D "1.2.2" }
> >>
> >>   [testdeps]
> >>   qemu.qmp =3D { accepted =3D ">=3D0.0.3", installed =3D "0.0.3" }
> >> +pygdbmi =3D { accepted =3D ">=3D0.11.0.0", installed =3D "0.11.0.0" }
> >> --
> >> 2.34.1
> >>
> >
> > Do we need to vendor pygdbmi? Currently, mkvenv does not consult
> > online sources and so if this package is missing, pulling in testdeps
> > will fail.
>
> This is handled by the "check-venv" target which is called now when you d=
o a
> "make check-functional". See:
>
>   https://gitlab.com/qemu-project/qemu/-/commit/75b1786996c422878d09bd12f=
166004a7d32e459
>
> Works fine for me, did you hit any issues here?
>
>   Thomas

Ah-ha. I am working on dropping qemu.qmp from the tree and had moved
this machinery into mkvenv.py - I didn't realize that the Makefile
invocation here passes `--online`. The core groups for mkvenv still
operate offline only, I didn't realize we let it go online for tests.

Before these dependencies get more numerous: do we accept that "make
check" might only work if you are online, or do we want to enforce the
idea that "make check" should always work offline only?

(like "make check" works offline and "make check-extras" may require
internet for deps?)

--js


