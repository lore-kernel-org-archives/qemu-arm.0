Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp161060njc;
        Fri, 13 Jun 2025 03:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2dbrsCUYYRGLLvxFRKS6Si4oZDpCZ7Y2xBrCWRCvXTqVkwugITy0A+i5bJMnQpL+bVSDGXiIyLVO2jA==@linaro.org
X-Google-Smtp-Source: AGHT+IE1ULTy03TOfxD2XBDJW1rN7NC/UEDuGaA6byK4H7SsmnODljMkRD+ct5sMVLSVD4JCgrQV
X-Received: by 2002:a05:622a:2618:b0:4a7:1417:37e8 with SMTP id d75a77b69052e-4a72fe986f8mr35933251cf.10.1749811295717;
        Fri, 13 Jun 2025 03:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749811295; cv=none;
        d=google.com; s=arc-20240605;
        b=SHFALnTjXH6ZFiMoIWvV9+VzEjQspWdXeaIAI5IAyLajmXurb9ClEANngwaPtR8RBF
         J5R/CYhgBT0eHZBaOg+yHxatbXKfL8vXkMntyy1ARbsHEYhuZ9QACkz8+iXkSqpu8C5l
         lWnnyCS5NRs415Nq6TGtaNkDbtz52NHtbtLKOy7Gs34hYaelPTSFYBu78fCmzdMxuUXM
         YD1cFcZs6xfB1muXyZknljjxXL1StRL3qOOshlI1Z3Q9W3Rtvb/wu37DoLSNRnIhgIO8
         G8rE/+fIl8+a31BussPhHZgI4MjgPhOGUDGV/7cTjUEP8anH3U+FGBx6SjN2cr0jjF05
         wVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=figJZmNZUAIV8ivTAUr2WUKY/O33ofJJymTbtraOGVc=;
        fh=BHWn/Li6sAo3gEu6qV1Vis8MwMpz2sMl38uKFGeMffc=;
        b=GEUQsDVrd0hNKp8xrcrVTIblxuupeeS+bx8bvunIU3acVTnURT+yZnR6A93G7VR6bf
         lL2xObZvHqrNK0vAlLU1X2dqzzKl4ypweE0yooU9rf5QJLul3aYuOb4LiDscNslq2ElJ
         xDO6Q3qnkqcVIOv/OUwrKx/vcnqOtm5rP7XgB7pd1A3NdAoYw69Rf57DtY0peWffdM0a
         0xY5Hzq3mZdnpwRE4vkZFHA71+R9CYLkcSoEQ1fshbBRew5xiscwcKiY8Q+NopZjbwqD
         9azr2B91u774y7QhiPnp96JJs+1HVFUcppVrEaa4LRAH6NXoI+Qzh6FgJmgyrm5yTUfP
         4FxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UXtFZTh3;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4ec5e9si26814091cf.455.2025.06.13.03.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UXtFZTh3;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749811295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=figJZmNZUAIV8ivTAUr2WUKY/O33ofJJymTbtraOGVc=;
	b=UXtFZTh3l+3u9W9BbmQTyJgcfu/CTEIxgAhfWsXqN2aYvgdPfyr3P2muYJpzHGzEsinCsX
	qUhEIbvAVlmdFjFSKTdg9jyTn+ASr1QKXcju+vdl/e1tit0G3190aBlP5L2nDgGsouHHPw
	5rxxbEi3TT4M01eOiyL6PiAid3XV/WE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-cGyKOThcMAmmLel1sbdNOQ-1; Fri, 13 Jun 2025 06:41:34 -0400
X-MC-Unique: cGyKOThcMAmmLel1sbdNOQ-1
X-Mimecast-MFC-AGG-ID: cGyKOThcMAmmLel1sbdNOQ_1749811293
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so1269044f8f.2
        for <alex.bennee@linaro.org>; Fri, 13 Jun 2025 03:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749811293; x=1750416093;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=figJZmNZUAIV8ivTAUr2WUKY/O33ofJJymTbtraOGVc=;
        b=iJQJKsRQ7wndXuG6y23Ll5dNlYGFch5Bi9qLUp/gmrzu6IGh+7YtmG5cmJ6FNLj5IR
         mzHOJ/ZZnBUPb9I0aTuLFDng35fFn9acmFEDEJCgSEpYJuv7qA6ZKqkGpunP0OHmmw1c
         fCEZ8ShV/EzvWe2b25R07RT9LQLwwMa5B2UWw3mrgrcjdb+NqGVfk4UMDH8zGSE84Fsm
         aySZ9xCvlB+k0dsdFmEmKChmtzf3FN2MF/7VywbvGSqMKm6HLp2MSHMm+HWtfJqHYUhu
         ihtSQqXDGH8fYqKrFTnQ8wjiSbSQJfMI/xN4uWOPf2GguDQdtUZQHpcW7QJxhKhLJLF2
         t9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI8fJ7rhZXi+rj1gpkE1uGPuS+PszvyxBWo0ZbepkkJSiooJ2n31JFtamSWz3I7yU3UdkrfYaPXvJVtA==@linaro.org
X-Gm-Message-State: AOJu0YxSO/UdbSpCqn/YeFl9XsYyJ16mKpbWom2lq2lgXXf1Sx9QVKlk
	aknMmA/twsy3kGtAsCz/6DThzWkAFHkQeR11O15qtdaSRD7yABJtzEUZsJGKrYIxaGU8usa31pe
	XNKNyNaL8aXAbtL12qcsGcjQbql0avrDwOffu4t7K0B2FaB8WeefplaIpSUmNDuXx2Lsl
X-Gm-Gg: ASbGncu5vBeaycAIgMkkF/KZGBD57VgSTvvgsGcx51aLT35qYbM1gMDM3nLd217n8Jc
	a7t7iYi+r3wFdDbuqFfJKeiOsFcMwdSmMiS3n8xwRcKN5mimp+Fy/M/UAdyXEseRDDpWxy+jskr
	BUkjwRpEKlUfparyftguFRqOGYr49+pXEAOqhvE9WAOVrh/sQHB8jtAzaUWMSlnkm5fvvswp771
	S8+pErojrcKj7AJfvtE5zswcPNu2NR54pytpU8wtv+XuYYA4ez1RJCy/McXjF3eHi7MfkJVf+OD
	SM9Xjev9pbMEetMWDV6Zhr5WAIRiqr0jGsBIvpHGl8BP5sq/mvfR6/yqnm+f/w==
X-Received: by 2002:a05:6000:2312:b0:3a5:2599:4183 with SMTP id ffacd0b85a97d-3a568717a0bmr2102226f8f.25.1749811292667;
        Fri, 13 Jun 2025 03:41:32 -0700 (PDT)
X-Received: by 2002:a05:6000:2312:b0:3a5:2599:4183 with SMTP id ffacd0b85a97d-3a568717a0bmr2102200f8f.25.1749811292158;
        Fri, 13 Jun 2025 03:41:32 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ltea-047-064-114-027.pools.arcor-ip.net. [47.64.114.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c19esm48431355e9.25.2025.06.13.03.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 03:41:31 -0700 (PDT)
Message-ID: <932ebe19-e581-499b-9294-022f3fb4d76a@redhat.com>
Date: Fri, 13 Jun 2025 12:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] python: fix illegal escape sequences
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Yi Liu <yi.l.liu@intel.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, Fabiano Rosas <farosas@suse.de>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Ed Maste <emaste@freebsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kevin Wolf <kwolf@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Blake <eblake@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Troy Lee <leetroy@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <laurent@vivier.eu>,
 Ani Sinha <anisinha@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-s390x@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 Maksim Davydov <davydov-max@yandex-team.ru>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, Hao Wu <wuhaotsh@google.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Rolnik <mrolnik@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Alessandro Di Federico <ale@rev.ng>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Hyman Huang <yong.huang@smartx.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-rust@nongnu.org,
 Bandan Das <bsd@redhat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org, Fam Zheng <fam@euphon.net>, Jia Liu <proljc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Kyle Evans <kevans@freebsd.org>,
 Song Gao <gaosong@loongson.cn>, Alexandre Iooss <erdnaxe@crans.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 qemu-ppc@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Beniamino Galvani <b.galvani@gmail.com>, David Hildenbrand
 <david@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Eduardo Habkost
 <eduardo@habkost.net>, Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>
References: <20250612205451.1177751-1-jsnow@redhat.com>
 <20250612205451.1177751-6-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250612205451.1177751-6-jsnow@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2gbzIikzb8Sm_phhTgoXgUSaXPKyc_QmyUgPLsDSD8Y_1749811293
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: DViN8Jybifmz

On 12/06/2025 22.54, John Snow wrote:
> \{ is an illegal escape sequence, to get a literal backslash we need to
> use \\.
> 
> This is being fixed because of an issue spotted when attempting to use
> the pyupgrade script.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   scripts/feature_to_c.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
> index 807af0e685c..5f8fa8ad5c6 100644
> --- a/scripts/feature_to_c.py
> +++ b/scripts/feature_to_c.py
> @@ -25,7 +25,7 @@ def writeliteral(indent, bytes):
>           elif c >= 32 and c < 127:
>               sys.stdout.write(c.to_bytes(1, 'big').decode())
>           else:
> -            sys.stdout.write(f'\{c:03o}')
> +            sys.stdout.write(f'\\{c:03o}')
>   
>       if quoted:
>           sys.stdout.write('"')

Reviewed-by: Thomas Huth <thuth@redhat.com>
