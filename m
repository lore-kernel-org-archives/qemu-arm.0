Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6454135wrg;
        Mon, 27 May 2019 09:10:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzU9V8zW7q33M1AiwzLZIl2vdQcQ5Hy3nZP1YkXnWWOlw8Ygw80itZB1IAyzwYKm6+KuV93
X-Received: by 2002:a67:f489:: with SMTP id o9mr57354298vsn.118.1558973445530;
        Mon, 27 May 2019 09:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558973445; cv=none;
        d=google.com; s=arc-20160816;
        b=T8hpRIb1N5pLA8hYxVLIe8im0T87fEuIHvGsaHqJe8wDlJxjr3+Z06GNQj6jm2/BfN
         c6wUTFjNLlqF0mbn67DWfylbeG7kDffAJoZZIlqJXPLFhL/vOqLQ8jYy7nBTFGSRTECf
         Y7Fk9kc0eSP2aGANpGLe05/iSHzTEk5Z6Z0zp4R9GUER5G4rkglxsqmyOr/V7tt/FQXI
         4Gx6/FkuxW+aScII8+ZDnOHIqDA5njtaH4SPnLV3SttU+aMNz9eIRlnxgYFcHU6hJy1E
         GTxcT2nLJp3CZHTnhq5svKT3DC5o6+lBgEW7tZc5RUHXVE1OEDu6jgxzvqSj9t+/w1FI
         NfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=PteWuLIiN/BbO0o4DPcsCRTpEC8VUErV1fB0MXQtoKM=;
        b=VWeT7u1sS0OVTg6OBr8tPAhVBBa8INQ/StbfOo4q3qz1oOZaejExEtOB+T7Qc2PE4Y
         AasJ6kDRLL4EspXcIqZDvwr2ijY5cuigqRiOCpeL3g6EjkhoQG5ujRoArOuqtv9ns/7Z
         jTzdjNPv2sjSqoQtHa/6Ckl44IZSpaeaGNPKrQO3L2gQlpjFpf0gnR9u4PC8A/6krb61
         mnCEZlVz3xL8fr0YePQmLgXkGkLwPjOeKytTvDQ/oAElBuZuEif/82GYwRNrQv6r4Ozf
         wjDsZGT0kXza4a/t0vvp7w0pMujbaIWKtrAHgVld2zDNZa8Oc32kWLh7pJmIlHdlqkBG
         JlEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z26si1158255uao.243.2019.05.27.09.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 09:10:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVICz-0005T7-0o
	for alex.bennee@linaro.org; Mon, 27 May 2019 12:10:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1hVICr-0005Sx-Sw
	for qemu-arm@nongnu.org; Mon, 27 May 2019 12:10:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1hVICp-0003Vg-IZ
	for qemu-arm@nongnu.org; Mon, 27 May 2019 12:10:37 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:33066)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1hVICi-0003AE-Ky
	for qemu-arm@nongnu.org; Mon, 27 May 2019 12:10:31 -0400
Received: by mail-ua1-f65.google.com with SMTP id 49so6663709uas.0
	for <qemu-arm@nongnu.org>; Mon, 27 May 2019 09:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PteWuLIiN/BbO0o4DPcsCRTpEC8VUErV1fB0MXQtoKM=;
	b=t4y0KTnLnaDoRyG2ef/C+IcaZ1deF7BpFUgQSCIameXMVSSJHPP2SwJQcl/aiiblBL
	wpX+mGGpnQvi1VTrFdhYyHoKTTRMq+/YHJ9uC3kFVextMxYJE/HwsRUtqP+FthFi7uho
	BfU4J54YiwrKGduI4AuodrZ29BmPXPgT8ur3YBF2Sa//JvHB94EBIM3ezJLSvPXg/f5/
	BO022ulLLlYjgeUrMhhn7VuVYl5ha4HoqmZi1lOiINVeB9gs/zEqM44IX0Yzo7nD/XVJ
	aHWsrZLZpn50zEComZq1Sk/0q3wn0d7vnFJvTIG5Ez4CoQNOQ1OOmkH/NZ8afI84bfK5
	s2yw==
X-Gm-Message-State: APjAAAWKwC1AF9DRxaZu/BN1j1RK4e3UpIAVX/R0aR/Ag5MvdSv+b+ZL
	dHaE/ncRPZcLwV/0ZUGW3nDQ0H/MKqTloOpYTsJGNw==
X-Received: by 2002:a9f:3241:: with SMTP id y1mr55975uad.107.1558973413782;
	Mon, 27 May 2019 09:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190427141459.19728-1-philmd@redhat.com>
	<dadba93d-fdf3-25b8-b3e2-5b43a4618292@redhat.com>
In-Reply-To: <dadba93d-fdf3-25b8-b3e2-5b43a4618292@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Mon, 27 May 2019 18:10:02 +0200
Message-ID: <CAP+75-UKFxtHrfzAF4G=YD6XDGcDVyvTeHdzYTvOD4vecT0feA@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.65
Subject: Re: [Qemu-arm] [PATCH 0/3] hw/microblaze: Kconfig cleanup
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: psUpENkR2MOU

Hi Paolo,

On Tue, Apr 30, 2019 at 9:55 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 27/04/19 16:14, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Edgar, Peter,
> >
> > Few fixes while cleaning Kconfig, trying to optimize builds.
> >
> > Regards,
> >
> > Phil.
> >
> > Philippe Mathieu-Daud=C3=A9 (3):
> >   hw/Kconfig: Move the generic XLNX_ZYNQMP to the root hw/Kconfig
> >   hw/intc: Only build the xlnx-iomod-intc device for the MicroBlaze PMU
> >   hw/dma: Do not build the xlnx_dpdma device for the MicroBlaze machine=
s
> >
> >  hw/Kconfig            | 3 +++
> >  hw/dma/Makefile.objs  | 1 -
> >  hw/intc/Makefile.objs | 2 +-
> >  hw/timer/Kconfig      | 3 ---
> >  4 files changed, 4 insertions(+), 5 deletions(-)
> >
>
> Queued, thanks.

I don't see these patches in your queue merged on "Fri 17 May", are
you planning to include them in your next batch?

Thanks,

Phil.
