Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2133672wrg;
        Fri, 17 May 2019 11:07:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpCVHo7NXShlh+Sgsg8MkSUmrhvbowZAlYFJRo5WWlgNVSbG5orxKOp1guePNGTCYGC3bi
X-Received: by 2002:a17:906:5217:: with SMTP id g23mr41456625ejm.9.1558116427261;
        Fri, 17 May 2019 11:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558116427; cv=none;
        d=google.com; s=arc-20160816;
        b=dYW0hTucIwAqM0oZ7lVGmTAzYVevfixw6Cz9Fw0OxDpzgyBZjZgW9lvHzygiIYC4ls
         625UQmNe9HVCb35snDlQwLSjNkfrLWVxfvhAF3K0gKEzargKq0nephORYUUOmERKzCfv
         TSieoQR2M06U9IYV0zLtCSOuOysT/PbXrztsHdvhXGumOwRj90UVLfMIh16Dr4JzlHer
         /04vSRLvS00DRyx1nSLQTLjTdcQ01rLzNfIWZvbRnwr1T8LYpy3/15hwgDdC8Q+wTIMA
         3NXInpo2Zr5EfgXPlRYTz6v3TLkjGxNMKR+ZYLZu64YdgfeEVkrC5CFdc2Yvo8EZinoj
         mNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=HAW1FwZE/zCObPbbvOiiTI/oRfbgDzfCgFfxjknMTyU=;
        b=OrtqDhmd6ODyLYdRpqa8pu0VSn5an391T7TWqLkSaX2qBIJrpLIgnqcXmc+WkB/Jn8
         0qFmBzrT811nc6y1rlEcOagGMN7odvwWoD94hRdWTI+wkslDdhOvhgKN++vDDJPiI64r
         v4FWXznktuhMGGyo9AWpe/vyTROvQCJXlMpjhljAD2Sb7y7L/XEP5FFaIbYZNzDDEyYO
         KFmOLYZNnufle5htUM9l26V4RBshgGNNsFCIkDeUBBJ+RC4IVSlaZnxdFa/3yolzWUrF
         CjCjRdbUQTyPEv2TM6L1yXWCDxuuJbZ7YI6uP+BtE/tI6YgFCDdmj6oNmXX9JHDBY662
         sRBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DeL6Y3Ff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13si5993591ejt.303.2019.05.17.11.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 May 2019 11:07:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DeL6Y3Ff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRhG6-0003Bs-9z
	for alex.bennee@linaro.org; Fri, 17 May 2019 14:07:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRhFr-0003B6-LS
	for qemu-arm@nongnu.org; Fri, 17 May 2019 14:06:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRhFq-0001y3-A1
	for qemu-arm@nongnu.org; Fri, 17 May 2019 14:06:51 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42072)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRhFo-0001wC-VD
	for qemu-arm@nongnu.org; Fri, 17 May 2019 14:06:50 -0400
Received: by mail-ot1-x343.google.com with SMTP id i2so2177718otr.9
	for <qemu-arm@nongnu.org>; Fri, 17 May 2019 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HAW1FwZE/zCObPbbvOiiTI/oRfbgDzfCgFfxjknMTyU=;
	b=DeL6Y3FfVPu9o3tNjgdR502QlavkA4teLKI5leb2ClF4w8XN3OIQf/ZTTjeXHVbi9K
	ec83n98UPshD/Bkhj0OnS+d1TkMseWeFicJuB5YLWUwMLeDZ1ejmq5o7QWtVW+fQ8w9U
	LrZXr1tXiOgzA3LnbYF9LcyX+A9STJ5h8bOILPL0lXEMRxhNdPYI7XQ2QjqSwbphZR7z
	bN+NgyYfPk8ikOXDXlygxqc2l723CQJOXCIHDBeLJSvCTBSnNtNohLMxozZuGswFnDVE
	MerJ0uuoArswGY8J+7CBWTH/K/XFjWKBN2WLnFvlZQ0171jOT4beQEdxNmvCqpTVZ0gR
	RQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HAW1FwZE/zCObPbbvOiiTI/oRfbgDzfCgFfxjknMTyU=;
	b=LjMFhKaHJO1xLc4uk2mcZVSUKLZHE7UGLmfBprkYS/IOSE6/bb3g+Lp2Q675SuSA4T
	pWDJU0c7LvIuomzR+CPP4IZATvN1Ot/9e3ISCK++j4jeVtuT8q/U81PE6Pl9zMQGVxT1
	iLpbjpfTyQ02RsogHdyuRZx3UN3B4dHfFJ8Xcy6PyrMGUyY6ANKPVkvTTQ1Apf75aU+i
	BMEUgon+CrTgscpVm3DxBrYi76XK4IKMtdqxzyieYcfDZ6Etvp1BYRGOURA1z3ZFIbeP
	Ktgyl6Wy8jgStR0DEXH13bFL+3NeKBVfGO1hIoSps8y3W59CEy1Zu0E5ReRKJRMHgQoL
	ZqjQ==
X-Gm-Message-State: APjAAAW5VmzyjqXNoA7ADSaifSDRtpVllTfjGFw6glG0cdz/V3RpvM35
	1HM5r/7kOWWF1LAea15EVvN7vydqlqmJ23kSQd/n+w==
X-Received: by 2002:a05:6830:209a:: with SMTP id
	y26mr5073672otq.232.1558116408251; 
	Fri, 17 May 2019 11:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190507163416.24647-1-philmd@redhat.com>
	<cfd72da5-720a-0684-f3c5-e0ea1360bef3@redhat.com>
	<20190517175621.GK4189@habkost.net>
In-Reply-To: <20190517175621.GK4189@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 May 2019 19:06:36 +0100
Message-ID: <CAFEAcA8iGcgBMbtc_XaXKH-j1fExKrS_fzhgCDYy-_AQZJPesg@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Joel Stanley <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-ppc <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VNjjh6OJ5+ea

On Fri, 17 May 2019 at 18:56, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Fri, May 17, 2019 at 12:32:18PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi Eduardo,
> >
> > On 5/7/19 6:34 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > > Hi,
> > >
> > > This series looks at Eduardo suggestions from [1]
> > > and Thomas commit aff39be0ed97 to replace various
> > > object_initialize + qdev_set_parent_bus calls by
> > > sysbus_init_child_obj().
> >
> > Do you think you can take this series?
> > Else, via which tree it should go?
>
> I was expecting the maintainers of each architecture to apply the
> patches for their areas.

This in my experience rarely happens, because splitting up
a patchset is effort and there's a coordination problem
working out who's going to take which patches -- it's why it
works better to have several series each of which covers one
submaintainer's area, rather than one big series which then
doesn't have an obvious path into the tree.

(Personally I also tend to treat omnibus patch series as
"somebody else's problem" whereas patch series that are
mostly or entirely arm changes go on my list as needing
to be dealt with...)

> Are the arm, microblaze, mips, and ppc maintainers OK with that?

No objections for arm if the patches have been reviewed.

thanks
-- PMM
