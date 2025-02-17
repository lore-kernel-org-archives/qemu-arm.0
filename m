Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp158753njb;
        Mon, 17 Feb 2025 08:42:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXDEjEgZS+V9DTahbP3buu9BxtUzvKIIP2qS+EVWZnDmegCb4IWjBx3v6tah2kPo1dKee7mirZmQ0Kj+w==@linaro.org
X-Received: by 2002:a05:6402:a001:b0:5e0:52df:d569 with SMTP id 4fb4d7f45d1cf-5e052dfd7e2mr5465655a12.28.1739810577139;
        Mon, 17 Feb 2025 08:42:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739810577; cv=none;
        d=google.com; s=arc-20240605;
        b=aQZPXlAUwWeVDd7kmpSWspV4IWHUqSpUvVPhvK8miWdOZSHRtGK6cea3/6PPHK36d8
         DXMW+wlD+adsZZBvakBHshQhh2lnqCEWFrDyyRmbr2Dy7kzZ84nNSI1V7RP3gJq5w/Y2
         r6+7I2Ls/0nNcfyIZz96klY4x80nAIO5BqGTeEw94SahXVdXisOJBps3BiMGFxZG4H2Z
         vQkYhbFY70wV/OEcTQdgkh094U5xFu74SvbxJBXiSEVWUYFQkKQ+NHp93LGZaO/riH8H
         OFbSTdVIswQ9k6SvVx2uJ7YoBOuq0o8McABPIPgTV1HzyryOskElF6TIRBDVIwNDBbmy
         e9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kvaAb01HNcWfLd6UopGyk/zXIjjv/WR9CTT4cfI1NWc=;
        fh=stsyHCMp1wMZj6aU2V6iKde59OKDNzgbDeQXbda3qKU=;
        b=k0qXQ3FvrFeZM2tB/pbepb/zxht8Kb/ugKlOd1zUvM/IF2tZ8WMfghwiVm7yRaetVb
         G9OWt0mJo5r6ObBHucrOVQagZkmRrUsN86xamvm0QjHkiw4mLL9aPspyYvlP/cWYl6Yt
         MNvya24WO/w6b7LNtgM1p1FWABF6Uwwqg7o+GnT/7y6qu57I4s5X9GWIopoObgaLTEB/
         BHHYuEU4e7yKwQ4d6woSZ5/kkm4E8RehMmCwQsRoMU3B/jQekNGvu6+16BIUxJoCU4RT
         Y7fErcCUUUwYV9WSSSnUqeyYmlAR/cRBHJRGhJSxZIurcqY6s5b2RUgr5Rg8NOuynVqI
         WA7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NgA0+MLl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5dece1b73a3sor4138416a12.2.2025.02.17.08.42.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 08:42:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NgA0+MLl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810569; x=1740415369; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kvaAb01HNcWfLd6UopGyk/zXIjjv/WR9CTT4cfI1NWc=;
        b=NgA0+MLlp30YnV95u0uWMr6YjUF3mGlzyxPeKQq/h5GIOp/703+aGNkbOAtN94+UA7
         ls5UYPN5ASp1+PJvaPuHzTPCEuMVuF0zwAlTKJy8nyofJmcOReEcqx8xxlPiKnKH8GpF
         aS2AZLXPpJf0/pvJ9aAsH3DhEQjdmpWwROkcr2J/1/3rS3a/OZ7z3Au5k9q2CnKbuBRV
         JiBMgUoVMZCOhg/b8zAGGrXugynmSf0yKikN1ksGdJOU5t7YHaitpaOWzlMWMiomvyTe
         Jprb52ks203UqCfVD6umY2lU20ZEP5dlz3JViI0yEiHZhKRL8KwC+4sv/5qo9PthRODd
         u29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810569; x=1740415369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvaAb01HNcWfLd6UopGyk/zXIjjv/WR9CTT4cfI1NWc=;
        b=NO3B1B3N/CgslnZXIuF3hcVYbQ4Kv7Q7UqX0xOWLJ7HfPAYUZFX2Z7PCpJZsp5mf4P
         FCGvK2wVxxU45y1Mf1+8dkIVPnc5A4mwrWqJSl0WER14BK42wfO9RMCLwxhAhfRp4p5z
         sRZp6ZKBYoXQlYLymwdQtT+Hfjm8++HVyHQvvE0/jCyXrxV5gWDQetUttHQnrjNSmo9V
         DOMIhxnKg+UdGRI1LDxTGgxWGmIBRa4vuaE0TpLKBqbBQDopPrSHoLvSOu4QB+gPf4KR
         YYhYZWbBg9bqOgbf0lUhafl4mmJFHphM3rN883Fe/buZsWTGsN6PIAv3icP9T3hlm3UO
         G0kA==
X-Forwarded-Encrypted: i=1; AJvYcCXT1DSy5BX0dMC+kx+h3L9aDXRq3oYXctCT0TC/kTwz6574XSHzxtWKXUg/S0rH+4FEPd9MjsLcqmWcKQ==@linaro.org
X-Gm-Message-State: AOJu0Yx4gm9iHct+nhlwRRVcJ3sjQprMRw1aAbNXnv4XKFs8xU2sqyFx
	0eQiVQ1/0nFZFCulCQ/nHtT8hS+al3/m4pd/Cdk+F8RbHflF5y8rqQgNqn9fqnJIqdpa/87fRkk
	zN+vFjvOowGWD0QOktT0pKgf53u/u3QpP4e86Nb2/
X-Gm-Gg: ASbGncvCN1BFFTGOGMY5xYXg73vXPdi3ZiNWzqSZQTc4BDCkqqxZHLx9+10Ntzm21ht
	vJlJqv527PxSqrBRM/HbVde4HGIpfimhYaP+R3eA0FEneNMZYr8JRTEpIo2LwO5mUI0JZ+gO77w
	==
X-Google-Smtp-Source: AGHT+IHoMKEPnQMcZ6g6C4eU29ISG06R9rnydYXJ22WGEag3wC7aIn5aF5iOWnlQXeAkwmghWmroZgs09EjzSZARe60=
X-Received: by 2002:a05:6402:4609:b0:5de:3747:cddf with SMTP id
 4fb4d7f45d1cf-5e036044232mr9774962a12.7.1739810569122; Mon, 17 Feb 2025
 08:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20250217163732.3718617-1-kchamart@redhat.com> <20250217163732.3718617-2-kchamart@redhat.com>
In-Reply-To: <20250217163732.3718617-2-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 16:42:32 +0000
X-Gm-Features: AWEUYZmsWoTAkpuHOEcSF_yIx1KWwvcDMOBoK627n6UBb0N5ZDDqj8z_1CqHpuo
Message-ID: <CAFEAcA_bg-KdNV52oD55YrbzF8z0-i0nJPbhFgzKW-5AfdfvoQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] docs/cpu-features: Consistently use vCPU instead
 of VCPU
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org, Ninad Palsule <ninad@linux.ibm.com>, sebott@redhat.com, 
	maz@kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Alistair Francis <alistair@alistair23.me>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
	Zhenzhong Duan <zhenzhong.duan@intel.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Eric Auger <eric.auger@redhat.com>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, Yi Liu <yi.l.liu@intel.com>, qemu-arm@nongnu.org, 
	Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 8a/qto4KY4PJ

On Mon, 17 Feb 2025 at 16:38, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
