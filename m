Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2123293wrg;
        Fri, 17 May 2019 10:56:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwogS5CSgGlCkxD247yn/RlRRSb8DBGuJpgTOyR6OmI5IPr6/rNzHsQV71fgfQM1f0l0ZhF
X-Received: by 2002:a17:906:3586:: with SMTP id o6mr26568772ejb.253.1558115812201;
        Fri, 17 May 2019 10:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558115812; cv=none;
        d=google.com; s=arc-20160816;
        b=rcf0aFIamxY7goVBmDsMRokBhXXW+V7/f+7FnAbmZJBiGt5gqf5xouf3QALt5GwApo
         f1DTQ8HrrhWAXXKD5n1EUL82qXiUxx4VzVHp7v75/fzddd3Xr4u8k5pS2q4K0+CESHnL
         wVUkgRQ+lUdjjFUy1ow8urAVxqFZe41esWuAphn1e5f7vW3VUISw+WOgwn20Z544CjtZ
         IHDXTEODNxgIS0ZUED2ieOBSi1DmMz2g+65nNL0RFHvffsIJ7GJXxMCY6sai7Omq13H0
         qEJ6yhxgKVUxIbap2HWsWoU5F6gK3AMEj1EtYId6rq5Tp2m63KUoMj9S7HS84VL1rVuV
         3AmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=7X4A91ZX9qHtO/4MDV29/rw0Vhltp7USSsQ8aa1T5aU=;
        b=UeJhsSXypSEAjkvitYrAg1SuM7FP7luUlSLKBywUbs4vX02jrBJM4agYW+nRZ/OR+f
         Zr5CwllKPgBj7rEDl1AObbVJqPCzPKZBvZXioFni+Jt/Pv1vaVwdsn5dVIL41NTtDmQM
         OStSpOAkt+jzrbuh3yFbpNNsHp8nQai/SDTH8vTqgPJu3tj0hhvynoKEerlGm/u+x0Ej
         bEhyyX/55TYRFIFZADbyjkiyCLYHX2Lkstof9p++0dqpcqbdQ60Yd1Au+ysPhUmISM1p
         19uWozTtd+pZD4JsAs/adAIeSsSIwaThTzmYZxJxGhDebjOUKIQayfz0YCDIOdhvJiUM
         +zUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si3228882edg.424.2019.05.17.10.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 May 2019 10:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51886 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRh6B-00077t-C0
	for alex.bennee@linaro.org; Fri, 17 May 2019 13:56:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hRh63-00077i-Ep
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:56:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hRh61-0002wS-Lp
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:56:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hRh61-0002sw-E4; Fri, 17 May 2019 13:56:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D89530C0DC8;
	Fri, 17 May 2019 17:56:30 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E6A85DD64;
	Fri, 17 May 2019 17:56:22 +0000 (UTC)
Date: Fri, 17 May 2019 14:56:21 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190517175621.GK4189@habkost.net>
References: <20190507163416.24647-1-philmd@redhat.com>
	<cfd72da5-720a-0684-f3c5-e0ea1360bef3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <cfd72da5-720a-0684-f3c5-e0ea1360bef3@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 17 May 2019 17:56:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 00/16] hw: Use object_initialize_child for
 correct reference counting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Paul Burton <pburton@wavecomp.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Joel Stanley <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O98V1/CvbLnU

On Fri, May 17, 2019 at 12:32:18PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Eduardo,
>=20
> On 5/7/19 6:34 PM, Philippe Mathieu-Daud=E9 wrote:
> > Hi,
> >=20
> > This series looks at Eduardo suggestions from [1]
> > and Thomas commit aff39be0ed97 to replace various
> > object_initialize + qdev_set_parent_bus calls by
> > sysbus_init_child_obj().
>=20
> Do you think you can take this series?
> Else, via which tree it should go?

I was expecting the maintainers of each architecture to apply the
patches for their areas.  But I'd be glad to merge it through my
tree if it makes it easier for everybody.

Are the arm, microblaze, mips, and ppc maintainers OK with that?

>=20
> Thanks!
>=20
> Phil.
>=20
> >=20
> > Important comment from Eduardo:
> >=20
> >   It's possible, but we need a volunteer to review each
> >   hunk because the existing code might be (correctly)
> >   calling object_unref() (either immediately or when
> >   parent is finalized).
> >=20
> > I tried to split it enough to make the review process
> > easier.
> >=20
> > Regards,
> >=20
> > Phil.
> >=20
> > [*] https://patchwork.ozlabs.org/patch/943333/#1953608
> > v1: https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg05931.ht=
ml
> >=20
> > Philippe Mathieu-Daud=E9 (16):
> >   hw/ppc/pnv: Use object_initialize_child for correct reference count=
ing
> >   hw/misc/macio: Use object_initialize_child for correct ref. countin=
g
> >   hw/virtio: Use object_initialize_child for correct reference counti=
ng
> >   hw/arm/bcm2835: Use TYPE_PL011 instead of hardcoded string
> >   hw/arm/bcm2835: Use object_initialize() on PL011State
> >   hw/arm/bcm2835: Use object_initialize_child for correct ref. counti=
ng
> >   hw/arm/aspeed: Use object_initialize_child for correct ref. countin=
g
> >   hw/arm: Use object_initialize_child for correct reference counting
> >   hw/mips: Use object_initialize() on MIPSCPSState
> >   hw/mips: Use object_initialize_child for correct reference counting
> >   hw/microblaze/zynqmp: Move the IPI state into the PMUSoC state
> >   hw/microblaze/zynqmp: Let the SoC manage the IPI devices
> >   hw/microblaze/zynqmp: Use object_initialize_child for correct ref.
> >     counting
> >   hw/microblaze/zynqmp: Use object_initialize_child for correct ref.
> >     counting
> >   hw/arm/mps2: Use object_initialize_child for correct reference
> >     counting
> >   hw/intc/nvic: Use object_initialize_child for correct reference
> >     counting

--=20
Eduardo
