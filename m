Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp879263wrg;
        Thu, 16 May 2019 10:01:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqye24hj6LCiGgNOJfq9r/CWS5p2yKEBgH5qeYHX19oSlarZBanqGDDuSunszZnIS54Kug0d
X-Received: by 2002:a17:906:9a9:: with SMTP id q9mr39979482eje.171.1558026063074;
        Thu, 16 May 2019 10:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558026063; cv=none;
        d=google.com; s=arc-20160816;
        b=IfrT6R80FFcvG1Sjk3SsBUpTu0bfrM8FjiRgx/XF3QeqdsGd+LNgf9fH1eXL40k8QB
         XC63sFscjDrzK6t3pn9HO7gs3BGkmag43rDoT0dsGY+n0QRt/37jzMM3786u30OvXrFi
         qhpyOevZv+ueuQV7h87pMD6gWJttcDqV/uyDBadHHDEajVQ9XJy4ouvr0CZx3tda0O9c
         NShHQsnn1jMymPdLprhqL1gO706s7oKpbDdsDz3MorWtNH/poTDNsWh/v5QncrixPSbg
         inNOQUWEG+sB+BRmEAIgsxvVrCkK7W3MM4GMpw2qaf2XJzqXSfUVQ3gl6sSB17+YW0fb
         SDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=QJDZ7CodgpGvfdrszIYEpf/Wtql1ZoMXryXX3H6C9Z0=;
        b=SD32Plbz0Wej9/mtFr7x59aEmADCQmwWBHrOVYkuck5r9G44OkgAITaksBoxXJVfun
         mjxwDcTFVhV2pCxA+P8E/lNcJlJbgrdypjlSkcLBGWJd0BA4KI1iKLfQmDaFYJlDatQM
         qmvlDq4qmXB+Jnrd5qIJn8aEIBXXepnmYbcMD2TaMhycGj8qXOUjtz7GUMVLQz2dBb49
         zlKNAJBG6mjX2yWNTZJOv9BvyGYGOzsBYjy0ZQg9eN+MLxMlZwurhi8IqW5svtUuChev
         o4fjzibEmWm+1eKwO91EC+nHBnY4kLy6d3AOA4Nh5lxdnFEkumfqk2ph47kWMZvyyMnP
         oCuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17si4077303edg.88.2019.05.16.10.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 10:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:32959 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRJkc-000290-5M
	for alex.bennee@linaro.org; Thu, 16 May 2019 13:01:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hRJkO-00028Q-DP
	for qemu-arm@nongnu.org; Thu, 16 May 2019 13:00:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hRJkN-00032R-Ay
	for qemu-arm@nongnu.org; Thu, 16 May 2019 13:00:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hRJkN-00030L-5p; Thu, 16 May 2019 13:00:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 277C130BDE5D;
	Thu, 16 May 2019 17:00:45 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E93315D9C4;
	Thu, 16 May 2019 17:00:38 +0000 (UTC)
Date: Thu, 16 May 2019 19:00:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20190516190033.6c8d382f@redhat.com>
In-Reply-To: <CAP+75-XHpLkekrmSxK8FFGkpPJQH=V0+2d6RonQTyJNcSHGaEg@mail.gmail.com>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
	<20190419003053.8260-7-richardw.yang@linux.intel.com>
	<20190514211015-mutt-send-email-mst@kernel.org>
	<d9d265e1-1052-9d8d-c749-5d1e5901f567@redhat.com>
	<20190516074110.GA11938@richard>
	<CAP+75-XHpLkekrmSxK8FFGkpPJQH=V0+2d6RonQTyJNcSHGaEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 16 May 2019 17:00:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 6/6] acpi: pci: use
 build_append_foo() API to construct MCFG
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	"Michael
	S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3CmW2DpB8lwT

On Thu, 16 May 2019 13:01:31 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On Thu, May 16, 2019 at 9:41 AM Wei Yang <richardw.yang@linux.intel.com> =
wrote:
> >
> > On Wed, May 15, 2019 at 07:29:17AM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote: =20
> > >
> > >Thanks Michael for testing...
> > >
> > >Wei, can you add a MCFG test in tests/bios-tables-test.c?
> > > =20
> >
> > I took a look into the test, current q35 has already has a reference MC=
FG in
> > tests/data/acpi/q35/MCFG.
> >
> > And there would be a warning message when reserved[8] is missed.
> >
> >     /x86_64/acpi/q35/bridge: acpi-test: Warning! MCFG mismatch.
> >
> > Is this enough? Or what more information prefer to add? =20
>=20
> Well, the test has to fail for any mismatch (not a simple warning).
>=20
> A mismatch failure seems to be enough IMHO.
Warning is sufficient, we do not fail ACPI tests on mismatch.
It was a policy decision for APCI tests as far as I remember.
We might reconsider it in the future but it shouldn't affect this patch.


>=20
> > >>> -    AcpiMcfgAllocation allocation[0];
> > >>> -} QEMU_PACKED;
> > >>> -typedef struct AcpiTableMcfg AcpiTableMcfg;
> > >>> -
> > >>>  /*
> > >>>   * TCPA Description Table
> > >>>   *
> > >>> --
> > >>> 2.19.1 =20
> >
> > --
> > Wei Yang
> > Help you, Help me =20
>=20

