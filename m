Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2780097njb;
        Mon, 12 May 2025 08:00:15 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW7owQSoGWefbKfM/BnODhtblN+okZZClrkXX50RRhE4oXaDY+NH4AgGKcdhS0UvIWWB1iidpzuRTtDXg==@linaro.org
X-Google-Smtp-Source: AGHT+IED62d2YfGcrFIqJNn8RvGP9VV2CobRQFHUBZicYcVn5PRtRS3ht6aTu9Tvw0rttrZ73v1w
X-Received: by 2002:a17:907:3f9c:b0:ad2:3e8d:6440 with SMTP id a640c23a62f3a-ad23e8d64bbmr824933266b.33.1747062015062;
        Mon, 12 May 2025 08:00:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747062015; cv=pass;
        d=google.com; s=arc-20240605;
        b=lnAB5S712BHepv+y5nXxMnFHujpQcxmR/3vAnVeuWMJoWFwmB8MvtilNAPMWefL6C/
         pHH8P5Zp3MYs8aAYcP8Ds1uHl41KsH7hQprrrCSIm0mwcT/0swmOnstdJCLalgrJBYyM
         lHozW+Os0WkYF0p105aMB6idhzxj5VFV+wXzXWaakpmw1dX3x0TKEYiKmgiLFmzwtfoN
         ZgOyxzHF/NuCtlhBNNK5JPLjmZQFE6KQ2+IXu4RaIVWINkb5/onO6Df4fHcAPmou5MJH
         d2MjZhNi60Hnw0c3w/j3XW7S2PoFQdAtVpI7BvoXC/sNhFQYkocX+M33LUPe0ATuxjSh
         SRcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=eI5J0HXKP1fZkgVktC6av2xKm9xJ4Og8E9m08wcvTwo=;
        fh=DRK0S3+Uy8VlXxDp+Oi8l8QLtMVUJDINTu0zxCNsvWw=;
        b=kUNIovwI5jszoOidSJqogMyIOh51IXY3B2VeGe+QaZaWTjiT1lTfkh1gBksU6eyh7J
         Le7yksHsF0yS+ZNgOBJgi/YPrk4xPgm9maBIJ7O4eAxnb+4yGWnpvQN1yMwGg9ehin+n
         Qq8g6YGsI4cbAg8Nmc8msyAJedtU5Bg7DgvU6pSx69GAiF3eRQgD3e1tAv8J5vHmhpZ0
         vV1wThewYc9Bo2QTYJsiqaE4DCuTvlGi5Eq1Jp/+v0cHMS+T56ugX80rh0B8RL67yKwx
         9TEYQsDthqXdJvobvipydrvN9eA9ePGWTuwh4egD7UXk3Mz3HbdCGRadZj0mzpkJLCLt
         DiEw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W8hyJgL4;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-46183-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-46183-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-46183-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-ad21981f12csi560559766b.248.2025.05.12.08.00.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46183-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W8hyJgL4;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-46183-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-46183-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 954DD19E1DC1
	for <alex.bennee@linaro.org>; Mon, 12 May 2025 15:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F132199230;
	Mon, 12 May 2025 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W8hyJgL4"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ABA230D0D
	for <kvm@vger.kernel.org>; Mon, 12 May 2025 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747062013; cv=none; b=Z27lT8KFA3VxGczF4eMXyQMoZAfExT3iALQfZ6c3DVSIylFQ0dV+60lVp39YuE1+yLL4JUboSBxoEDngi/65amtPwt/JhMUXbL1mdyg3gp3/B4iXkmiA5PV4xow3FAAWn087lovLyRAhFxbMjy7a1gRWHi/4itavhQ/VkFRX9ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747062013; c=relaxed/simple;
	bh=MBp5hP0CjyiWRvIK7Rx0a9L1H4WNHEwwXFNglfgPmbM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LsEfAHE823VhTFCfyx4rWGgSopcj3/K/YidwV9/EpE21yIbEoUNin10Gi2kfxWa9b1QVjK5KC0GLSfYh2GwBrhe95+ylfpLbSkZgeZfGQ53BA2F2GRCf4bmh+Dhr62CPaQSM4oKngp0HVqP8thZnzyIHfSqMdmpG4H8SHjqB/RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W8hyJgL4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747062010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eI5J0HXKP1fZkgVktC6av2xKm9xJ4Og8E9m08wcvTwo=;
	b=W8hyJgL47nlr0kLV78HYjiEVX8gHkaF9b4MwYVCx55LQ+ZUTEyhv2ydxhdmcHL65VGnspg
	Z25iwvw56wI1bt6XA9iYA4GurZRKHIfqvUd7rfZoMtV+kg3SZd8QIDLVrBOXIePv4sCq6b
	1lPW2k2mgvh6+r+mvHMrSROKYqkd0AY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-FqduSv7qMnWoNcewk2hpEw-1; Mon, 12 May 2025 11:00:08 -0400
X-MC-Unique: FqduSv7qMnWoNcewk2hpEw-1
X-Mimecast-MFC-AGG-ID: FqduSv7qMnWoNcewk2hpEw_1747062007
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so19376055e9.2
        for <kvm@vger.kernel.org>; Mon, 12 May 2025 08:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747062007; x=1747666807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eI5J0HXKP1fZkgVktC6av2xKm9xJ4Og8E9m08wcvTwo=;
        b=xIlh5XB238eeGEQWzmAOD4MZhkpI+7c4s+8s8m4weChlwBS+UY6erHKVn99HUDLUFI
         1wipDOa1kDH8QrY8sjd8Gk1gQJ5FfSd7QEO/M2rLk5qM9D7mQeZIVAiKQiB5/JfRGFQR
         DQwvkMcp/iRJejg6Eg0c5vRIZFAVugfp4oNglkxxpDJ8D9/0kZyoBDFvrvHsV17o2LFK
         BtnS4U7ta2b284D4PLEhRNwDhtlH1lZHEA2ojqWIhi5Mmhx//QvdYzLdH/6itVZ3u9f9
         kgyW+8nm6CZreHYcqL3LDlzkiIncBpWBmO3uC6AZ8l1epCJx5NhSYTTbHxcw7KD0Mze2
         /Hxw==
X-Forwarded-Encrypted: i=1; AJvYcCVPycnC55PVbtL9hDt9ZMeVBVTkSEjM7LpV+D3YqLvClvQ9NqPUXV3UduhNaL9EveHl+yI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfWmwO5rE9Hr+evX5R85zDfRxxzHTMmrJBYRcYHg0+X/W++7uv
	qRCdrYuD+Ql+kdQdB9wLfmK8yFURiWRO2aueo82vXEbdDvxOeCfXB7fV8Re07kxccgxQsTuVSZk
	rfXV7iAIjK7oWTM0w9DsxYLfUCGIZtYeSuma7LNiY3SU7v8QS/g==
X-Gm-Gg: ASbGncvCRcy7f0CbWbcbXSl/2svxP1Yg08EKy88c5Co7BkOb9KrhHIcBEYcEX5eJKdt
	bcr68+c8KLJ+vO6qyGVSFuDt2ikjUzjvVmeWWCP6Xsr4OL0ZI6Iz5HtFbtpgjJR+BIAFkZlPlWV
	W9lxI6EDbNsKqyek8d5nOX2k/Ihcm2hH08su4PClshuVlI7PzeRwvxTyrshu3QpO1RcLVex3/qV
	0tmiXyhbLTJB86Ln8bdPA5GMU8c2esi7tr/DqwZYkWFz75xI3U5pTror0xj3c9K7YQYX0DqBNKi
	yWEeti8MZomV/wXmKvYdXqbVA/L9OYRN
X-Received: by 2002:a05:600c:6090:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-442d6d18bfamr121218235e9.5.1747062007327;
        Mon, 12 May 2025 08:00:07 -0700 (PDT)
X-Received: by 2002:a05:600c:6090:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-442d6d18bfamr121217765e9.5.1747062006953;
        Mon, 12 May 2025 08:00:06 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7e26sm171495205e9.37.2025.05.12.08.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:00:06 -0700 (PDT)
Date: Mon, 12 May 2025 17:00:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, qemu-devel@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org, Sergio Lopez
 <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>, Amit Shah
 <amit@kernel.org>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 12/27] target/i386/cpu: Remove
 CPUX86State::enable_cpuid_0xb field
Message-ID: <20250512170002.635aa9fa@imammedo.users.ipa.redhat.com>
In-Reply-To: <aB2vjuT07EuO6JSQ@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
	<20250508133550.81391-13-philmd@linaro.org>
	<23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com>
	<aB2vjuT07EuO6JSQ@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WM8zvBYD608g

On Fri, 9 May 2025 15:32:30 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> On Fri, May 09, 2025 at 02:49:27PM +0800, Xiaoyao Li wrote:
> > Date: Fri, 9 May 2025 14:49:27 +0800
> > From: Xiaoyao Li <xiaoyao.li@intel.com>
> > Subject: Re: [PATCH v4 12/27] target/i386/cpu: Remove
> >  CPUX86State::enable_cpuid_0xb field
> >=20
> > On 5/8/2025 9:35 PM, Philippe Mathieu-Daud=C3=A9 wrote: =20
> > > The CPUX86State::enable_cpuid_0xb boolean was only disabled
> > > for the pc-q35-2.6 and pc-i440fx-2.6 machines, which got
> > > removed. Being now always %true, we can remove it and simplify
> > > cpu_x86_cpuid().
> > >=20
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
...
> > > @@ -8828,7 +8823,6 @@ static const Property x86_cpu_properties[] =3D {
> > >       DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
> > >       DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_au=
to_level, true),
> > >       DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
> > > -    DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true), =
=20
...

> @Philippe, thank you for cleaning up this case! I think we can keep this
> property, and if you don't mind, I can modify its comment later to
> indicate that it's used to adjust the topology support for the CPU.

+1, we should not delete this without due process (aka deprecation).
So perhaps deprecate now and remove in couple of releases=20

