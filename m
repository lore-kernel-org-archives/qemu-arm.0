Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp4817769njc;
        Thu, 21 Nov 2024 09:19:50 -0800 (PST)
X-Received: by 2002:a17:906:fe43:b0:a9e:82d2:3266 with SMTP id a640c23a62f3a-aa4ef94341cmr423775366b.4.1732209590318;
        Thu, 21 Nov 2024 09:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732209590; cv=none;
        d=google.com; s=arc-20240605;
        b=ibqAukq9i6GK4lIDrW/I3WiuL9aqMuCQox0d/zSzyfquejrumW/FjZhVwCUJyQ5ej7
         8Er1oxVuIvUZQME7rOef5qUnPr4NTq+GtRFwSuY1FMU1CNZBPd3cNlxROFAN/6c8Nuud
         fkMpQi7RGKkC73jTuUJFy7s/g31R/+mimh0SZ5MWAdC+JU51wRegr5pTDAly6tGoeVfd
         GY1E77CYZGXahBN9zwgzz2GFVlMc0dkjSISerq1SCfLO3Wl4tASSK8Nb5ZZoPjWJwo8Y
         qhNSWZFokBQvQhPkEJZmpgwN3r9knLQNsCOdXrKSnsSPZLoT5J0SPzlbdM5vVJxdD1oU
         +XIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZSYfZQtUN2o4b8G/ReClTSg634nDeYmIFhfu9vsCoVk=;
        fh=wtaDo7sj7r1XXeZ9jTroOltp+1mhkUXZ0ZJ4oNTWdMQ=;
        b=TyU211xqTfMxEbM5rvqK9aGOARxyBAarzYyGm1HYEK/EH6Qfu2ty7qAXGZayP2vZkE
         qX+alzX0p3sKG61PQW/ohLRXhgbsCpgmFFFfa6FxupHT1UigrXZlMLXm53mzhkQLgNid
         CBSIFlx7+bwoUJ094ESA+2IUK+zu7YC9vd/jvIV8L9av07Ao1NFAjz+OVosU8p3IsKwE
         2Cp77ckI3fO1dHNGRLX83qOTbRdipSLLXNgBkWsfEzRf7AWDWVA/HWeaGfVnEANZV9h6
         IoY7iqHVUh0rll5/lYn2dUce2YCWQF28rP8tJ64vRoMGch2y6KWBWFP8r1ON856k2+2g
         p4rA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KnNx5HJb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5cff7b6f77esor1864030a12.6.2024.11.21.09.19.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 21 Nov 2024 09:19:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KnNx5HJb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732209590; x=1732814390; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSYfZQtUN2o4b8G/ReClTSg634nDeYmIFhfu9vsCoVk=;
        b=KnNx5HJbnoyL7OxDeLWERGDqwm+69tfDsiRyy4TmVrKnFCpzf7PjmQSL3q8QiOj8Oo
         FM8PgBK6xf6VirQKU2UkCgVN/MEdX6vdrGrRVJdq7ognFDn5ThJ4muEnl14TG8+KUCdT
         W0wQPlawV82f29ez5Cux0CXyEsv4q0LEagCF+jpvQiV9c/UhuFcqQmL1qIC8KIRmBUld
         q8LSrEg68xie+x3rf4DAoeurCynvuNNoR0k+x6GN7rY9A/UilrFBxHE2N0pI2ez2FwRH
         EpKNkWOcIWZde6EfzvGhPmo18sfRevLqleVNcXoqgowsWrQhc01EJ1AGYJO3/PA2+Dca
         UDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732209590; x=1732814390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSYfZQtUN2o4b8G/ReClTSg634nDeYmIFhfu9vsCoVk=;
        b=Ai78Phzq1YK52VhXFA4t7O+he0qRlVIJhYEfXbDdpARWxx7iqwAaa3rQJ+wAL9PIpt
         /askJBbhxCWN02KAEEoEcAhvkuYKoGORG3b53vTQYul3RTgubM42D+ARAcnfqJkI90V0
         4ackuNo9Q6NQ/ZHBHdK/v9iF5Y46xQnsEpcV4eaUxgo6pKGn6egSGGN8Mr1rwaDYcHGe
         fzsAzpjSeaCAcmxWFHzwwmNdiShUJJmbH/FyNalj0DQx7O8pnkhEbV6p2LhZyLsnQ2Gp
         puHZDxh+ONY0OyBHFxJuppJEz5GfVDFxoF9I6MrY6ATN6sIYS+lJ7Nh0EtuYThGW3ygC
         HGiA==
X-Gm-Message-State: AOJu0Yx7MomMNloSHPpZPC6AOpMiTfX42RlATy5JkHGhTZ1igzUNyYtl
	VYaeO/FcJwOVhaGFt14Tn7yIwbRU6Led+EA5pkHL1j3zuWF8Hhu6SIKXghmOE0LTJu4HBL58+Xu
	f2ZAA/XOgyjZZSF1hGleOwZ0AaslwdiBfjZJEKsQ4iIYngS7cUUs=
X-Gm-Gg: ASbGncsdWfSiglqEuW3A5u+/mm/rMu92wnugXF8WP5LBDmV9DTIMiIH3nehdoQacNbU
	j43Q9X85hQx2m6uliAYX9e3lQF1PnlyFS
X-Google-Smtp-Source: AGHT+IFIQYgVWucdZUZm/MGwW8o/x69WrsFwDAecdywlBycUkKs34jmlCDdAqxm02HpSotRtW2wplRUR0jbCuDj5t9o=
X-Received: by 2002:a05:6402:42c3:b0:5cf:d1b2:b44e with SMTP id
 4fb4d7f45d1cf-5d007be495bmr4388140a12.1.1732209589766; Thu, 21 Nov 2024
 09:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20241121165806.476008-1-alex.bennee@linaro.org>
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Nov 2024 17:19:38 +0000
Message-ID: <CAFEAcA8KD4qxY18pJakSeziTioNYDQkd3VYcxYfq9y2KAON4Wg@mail.gmail.com>
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org, 
	Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
	John Snow <jsnow@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	qemu-rust@nongnu.org, Nicholas Piggin <npiggin@gmail.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Ani Sinha <anisinha@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: HeYP5njUoYUy

On Thu, 21 Nov 2024 at 16:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is a mostly testing focused set of patches but a few bug fixes as
> well. I plan to send the PR in on Monday. I can drop any patches that
> are objected to but I think its pretty safe.
>
> Contains:
>
>   - Daniel's clean-up of functional tests
>   - Another avocado->function conversion from Thomas
>   - Update the tuxrun baseline images
>   - Minor fix to the rust pl011 device
>   - Documentation clarification on identity

Should we really be updating the tuxrun baseline images
in the middle of a release freeze period? Unless the old images
are going to go away and break the tests, I think it would
be better to stick with what we're currently testing.

thanks
-- PMM
