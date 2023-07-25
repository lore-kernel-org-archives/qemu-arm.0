Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp25456ejb;
        Tue, 25 Jul 2023 11:34:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG+M9sOY3RuwKZqlZoaZWYNfEK9zYOZmJDvC4pmL2ZipgRnd70Er+Rrb2lVJO23w4O8e93a
X-Received: by 2002:a05:6358:7e87:b0:12b:c378:b090 with SMTP id o7-20020a0563587e8700b0012bc378b090mr7965597rwn.26.1690310068032;
        Tue, 25 Jul 2023 11:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690310068; cv=none;
        d=google.com; s=arc-20160816;
        b=aHEDQws+UCKelqQy2zEmzusd6i0/38NHUQZ/AynJXqZi4ZYLo9dmhNu7sy5z1IKbdU
         IedfveLdkxIZVBMEkdgoIKUR7jL0G9tW8SrfJhdupaPEhu5Pg5eCjtDvf0C/nX3ZLdQI
         VW159ybEIZoFt9cv3DHwEb5R0NLdFJ9AAw0o9PYEEUV9jslTEKtq4v5kdVCFabBFWrA4
         UUui45KtDY3JwSluBuwWdy+kGMp8OAtPB3AwuzaWTICoTHEAgI3xuR2DvwAL9T00x2Lf
         RQkVGTukCTmKWz5Pf03soCKlbCbljBH6SuzRNDazknp6J/L3Q2L6R+yc/eUKq12V/S8J
         KIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BykIYyQpxrvywt/Y7yWLAGT2hcQ2rP6iIkuZn6U5BdY=;
        fh=OkHHVp7Mo3A0T1deAExgVGdSackv8dyMjHRlbD2Js2Q=;
        b=YnBTiaHPRzhhSPHC8cLGQycw7a7ftl/OvchBvn8HlDFwI1EFpBkPsHUPekXV5MC2C/
         C14bCoITQz1jJKpUh50pRhoB97MvHP4nvkEYV82I/BYsVpnPeVgtJMvkvQNH5tghryfs
         ig/wczF9sFGOhx5Ttv96O3ZxbTUw8KHWttP2l4lGzFgVP5x46jK+zFr+Y4NhakMoh8Ep
         xgvZqhHZ5w5fGNTmWd6Q5My7dAH3nTYnhHRt6gO1h3Cl47sjZZzrKP4d3cSrlfKuIqAK
         vTEOeTrlAmBebB+qdV0WAvD8o1xD4GKOcWwhF6WcjBatv56MCNzTcQV5iUu8/xMVb4R9
         rRoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ejsqXo9l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2-20020a05622a000200b00403b12308dfsi7080339qtw.184.2023.07.25.11.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ejsqXo9l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMr5-0004SS-SP; Tue, 25 Jul 2023 14:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMr4-0004S2-Ft
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:33:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMr2-0008As-IK
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690310031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BykIYyQpxrvywt/Y7yWLAGT2hcQ2rP6iIkuZn6U5BdY=;
 b=ejsqXo9lvMNYzOUpQ/EwfJFXkCGpbupHspr7NMi/Ge/z8uO0AdTDWuc3a849vhI5gowXmD
 rjPhrj7S2SYUMAl/032G+gFMVL1wgosYPvtRwODTlFIeM91qrUuzHx9VVFlcaiQilW9oet
 V00+Am62vdnc0I/vtlhy8cXs0Kbajb8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-5bDO0883MCChRCEUpkT8cg-1; Tue, 25 Jul 2023 14:33:49 -0400
X-MC-Unique: 5bDO0883MCChRCEUpkT8cg-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-26814a011deso1251439a91.0
 for <qemu-arm@nongnu.org>; Tue, 25 Jul 2023 11:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690310028; x=1690914828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BykIYyQpxrvywt/Y7yWLAGT2hcQ2rP6iIkuZn6U5BdY=;
 b=M1A9MBZJQo7Nb+CriN2jhJ2scike64di1f2B0J8FeIXdFs5faiSzer87InicPeUvOH
 pNCGvIr6aqFTFE1ePvt+DcoxHQx0/XJI+fjLvsgTTZVgzYBESnxbbjs0VbpZt4N9Irgp
 43UT+vUmmmyKg8ONGbZAkFfqCzEiSg1nyZKFTqkUNMmjz+657uk+RCu3Ki4B/+AJRV9g
 NDrxjBeH43Lk5egRd2uy2SbyqNXe/NXbd8rMV21uNeavLbX7L629+rfGgnyVrH8Tq2UZ
 oIiq0bVMJ90tWdyJLL3EEiO7YZi1RfBNzuoHkyJU4gPW5IBmXcxSeVUhqTD7xn+j7qHL
 /Odw==
X-Gm-Message-State: ABy/qLYERW90INPXBb7FoRNiSVG6cE8Y4+dVjYGVQItPPoN+C3CH+qei
 zB+AvTVafWoGh0zL/jjSRMAqTzDpr6FGsAywhC/6yx7OPDre6gXhJOA3tvdwnzKaFZDyDjaVJxL
 nmUkNcYal97yBTH+czEfv5J4+UPOO
X-Received: by 2002:a17:90a:bc8:b0:262:fe45:85f6 with SMTP id
 x8-20020a17090a0bc800b00262fe4585f6mr41285pjd.0.1690310028110; 
 Tue, 25 Jul 2023 11:33:48 -0700 (PDT)
X-Received: by 2002:a17:90a:bc8:b0:262:fe45:85f6 with SMTP id
 x8-20020a17090a0bc800b00262fe4585f6mr41272pjd.0.1690310027842; Tue, 25 Jul
 2023 11:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230725180337.2937292-1-jsnow@redhat.com>
 <20230725180337.2937292-7-jsnow@redhat.com>
 <ZMAT60PpKSIAemZ7@redhat.com>
In-Reply-To: <ZMAT60PpKSIAemZ7@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 25 Jul 2023 14:33:36 -0400
Message-ID: <CAFn=p-YTohvmxET2kk1NWU1X=psVcD1M0oS7BDEZUH521DEQ_w@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] python/machine: remove unused sock_dir argument
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: EiWOsA1Svueh

On Tue, Jul 25, 2023 at 2:26=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Tue, Jul 25, 2023 at 02:03:37PM -0400, John Snow wrote:
> > By using a socketpair for all of the sockets managed by the VM class an=
d
> > its extensions, we don't need the sock_dir argument anymore, so remove
> > it.
> >
> > We only added this argument so that we could specify a second, shorter
> > temporary directory for cases where the temp/log dirs were "too long" a=
s
> > a socket name on macOS. We don't need it for this class now. In one
> > case, avocado testing takes over responsibility for creating an
> > appropriate sockdir.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/qemu/machine/machine.py             | 18 ------------------
> >  python/qemu/machine/qtest.py               |  5 +----
> >  tests/avocado/acpi-bits.py                 |  5 +----
> >  tests/avocado/avocado_qemu/__init__.py     |  2 +-
> >  tests/avocado/machine_aspeed.py            |  5 ++++-
> >  tests/qemu-iotests/iotests.py              |  2 +-
> >  tests/qemu-iotests/tests/copy-before-write |  3 +--
> >  7 files changed, 9 insertions(+), 31 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Thanks!

I don't know if we want this for *this* cycle or not, it's "only
testing code" and it should hopefully be harmless. If it makes the
tests more reliable, it might be worth it. I don't have strong
feelings one way or the other, we've lived without it for so long
as-is.

I'll see what Peter says.

--js

> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

