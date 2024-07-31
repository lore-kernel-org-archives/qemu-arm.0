Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp164605njb;
        Tue, 30 Jul 2024 22:22:10 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXxj88YNqXK7pRfYNnSQK5bXhuNB5BlBQeFBu445OkMtfXj1ELw2xKG1JBLOiJKspN4MUUexvFUTOlERw==@linaro.org
X-Google-Smtp-Source: AGHT+IHHl4Vv/ynkDdCdE7teYDMrgkGfYdhoMTs1cM4oPDKFdgac0tVSk2ITFF1K6RJGFRe4b0ut
X-Received: by 2002:a05:6214:b66:b0:6b0:8392:e20 with SMTP id 6a1803df08f44-6bb559b41f4mr208340316d6.9.1722403330132;
        Tue, 30 Jul 2024 22:22:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722403330; cv=pass;
        d=google.com; s=arc-20160816;
        b=zJ3vp0mIU+0jB+HS3m6efRR2row64R8bIH36PLhFqc9/Ql0HUjpkfusNBKwZl2xdOd
         5Wj6hsWeTJpmQBn+PRhBY+cj1/5irQMFZz7cySXcUTVgg5YibYvXe98AULIYQfNvP104
         AfGla1zk9H3Ff62WfxIyls0T2ubQOEJAh11goxtKfwQShfKx/PB9noQgfgGKJg9ZvoNq
         l5/RVu8/go1SXzCTbuYuBlsLMoleXkPb/99DuyActmefsLuwbobZ+xNChs4eMzmoRKwl
         EA6Ti/Fd+zlsVAksyjNnjdql7ARM3oMedmD3tJSllGcKEhMoXo0TisXTZqoYa3/v18de
         nGBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=U86RpD5NioKVox+0yuvS034lbXN5VQQyeBcH4a1gttU=;
        fh=n8mW/X2rkaehFwaBDSQN+/O12MbG9U5/UOpX0OCIQNY=;
        b=0RFEt9RLF/FiBgQEQu0RlnvuMJXnv1ZLzISybeuPQz9YWjocjZO2wZa0Wcee/KB2Io
         1BOEJ/WuHDJQoQjDIbxfFWv4f3TFqZmAdiTkQH/r96ojrZikFvwyhM27VeQXUGdfyXPc
         vAFVDk6rnVjqVXMxCKGQJY6QFEK5OKYKWYyWjBDnTgwyd87jSnSetP7tZr7vkN1/zBaW
         rEDuSLXCbnOJdqdr70bKPcXvvl9CzRMEBm0l7J7wQZdWL32V/T6Y6nPF7GgAJmusLJ0r
         KU5VLHSj2s7XrXRzh8f2B0y/ADtg9RhHcKvq/IYQPXRmgnYBffvYYH4zC1VQ9ax+cKt4
         bUWg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Om+CYcFT;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-268520-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-268520-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-268520-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fac8ec7si135372426d6.416.2024.07.30.22.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 22:22:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-268520-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Om+CYcFT;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-268520-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-268520-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCE751C215F9
	for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 05:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CE52D600;
	Wed, 31 Jul 2024 05:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Om+CYcFT"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355C12942A
	for <linux-kernel@vger.kernel.org>; Wed, 31 Jul 2024 05:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722403325; cv=none; b=qWnjITT9Ynvha4jxmdksWqwulk96PtwZHzxxEZr7hqHxsChhzDQB18X4TpH+4y482HP88ufx0ZsX3JpWZ5CQzpRbMnCyZlyXbUKbO79m6oowFOx8ftmI15Tz6DkkuYF5EmEgLtIArjZu2Sr0bCxT1Qd+v+JG32YPttXiJmZByJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722403325; c=relaxed/simple;
	bh=PQ0rvOL0SCooKEPFtRsKNPBkA8CYab0m/+Eba8BWVaI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hYvwdbu9TC9tAnsGizup6ys08qenYWBcmjx9qvTx949Gu6M+FwXucH5bHjkbh8FZyb5X84gpflSdSHrv5FWSY42bc3melGA4QpIsqgnlxVEh3UApSU08dyvOb+4pqTlZ4zENzAbsxushaFM84OKfM6grgghr0HcDONClAoBc4wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Om+CYcFT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97588C116B1;
	Wed, 31 Jul 2024 05:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722403324;
	bh=PQ0rvOL0SCooKEPFtRsKNPBkA8CYab0m/+Eba8BWVaI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Om+CYcFTpahto5bnDPvArAw4xmXCYoIk4U1Jmtec425rHsnaWgMYvgD82MgSTYkDf
	 BrdnFzxHEMxOl6pUQ9mfGh9jkvFMpovc5zPzZZ3dkqNrnfOcRdH2mwdo2h7LY8Vk6B
	 D9hyiRBhVIIfPtwyrNW9QP013xQi5EGOi+uKFEul0ZFE1X3AxpbVYpz5yTgbU/ahkl
	 LLF5JOd0uW8iUhcv5JndGTFXURAgj2gluqcpjTRWEMc6pWrjNoHuqKxxcklJ9CMWh/
	 Uel4AmJaZ5nnarALxL+JBnfm1OBeKKvaxD0GsrG5wNkWyWXBCZBPT1EqAoOB2aTtMq
	 +5GKjHwcQHELQ==
Date: Wed, 31 Jul 2024 07:21:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov
 <imammedo@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter
 Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/6] arm/virt: Wire up GPIO error source for ACPI /
 GHES
Message-ID: <20240731072158.3aaf85ac@foz.lan>
In-Reply-To: <ZqigPgTl7quJ553J@intel.com>
References: <cover.1722259246.git.mchehab+huawei@kernel.org>
	<e994c3944d31775d62bbd017dec3adff50ddf269.1722259246.git.mchehab+huawei@kernel.org>
	<ZqigPgTl7quJ553J@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vB6br1T3FLQv

Em Tue, 30 Jul 2024 16:11:42 +0800
Zhao Liu <zhao1.liu@intel.com> escreveu:

> Hi Mauro,
>=20
> On Mon, Jul 29, 2024 at 03:21:06PM +0200, Mauro Carvalho Chehab wrote:
> > Date: Mon, 29 Jul 2024 15:21:06 +0200
> > From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Subject: [PATCH v4 2/6] arm/virt: Wire up GPIO error source for ACPI / =
GHES
> > X-Mailer: git-send-email 2.45.2
> >=20
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >=20
> > Creates a Generic Event Device (GED) as specified at
> > ACPI 6.5 specification at 18.3.2.7.2:
> > https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#event=
-notification-for-generic-error-sources
> > with HID PNP0C33.
> >=20
> > The PNP0C33 device is used to report hardware errors to
> > the bios via ACPI APEI Generic Hardware Error Source (GHES).
> >=20
> > It is aligned with Linux Kernel patch:
> > https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.hua=
ng@intel.com/
> >=20
> > [mchehab: use a define for the generic event pin number and do some cle=
anups]
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  hw/arm/virt-acpi-build.c | 30 ++++++++++++++++++++++++++----
> >  hw/arm/virt.c            | 14 ++++++++++++--
> >  include/hw/arm/virt.h    |  1 +
> >  include/hw/boards.h      |  1 +
> >  4 files changed, 40 insertions(+), 6 deletions(-) =20
>=20
> [snip]
>=20
> > +static void virt_set_error(void)
> > +{
> > +    qemu_set_irq(qdev_get_gpio_in(gpio_error_dev, 0), 1);
> > +}
> > + =20
>=20
> [snip]
>=20
> > +    mc->generic_error_device_notify =3D virt_set_error; =20
>=20
> [snip]
>=20
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 48ff6d8b93f7..991f99138e57 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -308,6 +308,7 @@ struct MachineClass {
> >      int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx=
);
> >      ram_addr_t (*fixup_ram_size)(ram_addr_t size);
> >      uint64_t smbios_memory_device_size;
> > +    void (*generic_error_device_notify)(void); =20
>=20
> The name looks inconsistent with the style of other MachineClass virtual
> methods. What about the name like "notify_xxx"? And pls add the comment
> about this new method.
>=20
> BTW, I found this method is called in generic_error_device_notify() of
> Patch 6. And the mc->generic_error_device_notify() - as the virtual
> metchod of MachineClass looks just to implement a hook, and it doesn't
> seem to have anything to do with MachineClass/MachineState, so my
> question is why do we need to add this method to MachineClass?
>=20
> Could we maintain a notifier list in ghes.c and expose an interface
> to allow arm code register a notifier? This eliminates the need to add
> the =E2=80=9Cnotify=E2=80=9D method to MachineClass.

Makes sense. I'll change the logic to use this notifier list code inside
ghes.c, and drop generic_error_device_notify():

	NotifierList generic_error_notifiers =3D
	    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);

	/* Notify BIOS about an error via Generic Error Device - GED */
	static void generic_error_device_notify(void)
	{
	    notifier_list_notify(&generic_error_notifiers, NULL);
	}

Regards,
Mauro
