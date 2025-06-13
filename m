Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp150826njc;
        Fri, 13 Jun 2025 03:18:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoaIIsgsA148frBlAnDP2lG1MDK47y4WtjOybQ9tEpVqWhinck5jOtlDAaF+sNiELO4xSuqe60iXRJEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHmDSNddjcYcMPJlzKg1OxuMqPpp9dZM1eP7ATq6kgBvKmTXWomj23Mo3I3fuZzuM1hCfVG
X-Received: by 2002:a05:620a:3944:b0:7d3:8566:e9ad with SMTP id af79cd13be357-7d3bc447b50mr344115285a.34.1749809895516;
        Fri, 13 Jun 2025 03:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749809895; cv=none;
        d=google.com; s=arc-20240605;
        b=MhYB6iiDP11u9VGbR9zXVHaPP5cpxR6SM0Qv+BvOfLlZMwKGnNqXd4m5OUCI0yWAhU
         qp3lanm9NKltsElZcsyvBPyxHu8kZkqk1/d7ogRsSi5HnLfZ675wxa+0zeLEGbflsL0g
         0mQ7DnMDiLYMivd8bgfTaWfWcWjbyiKZEkGaxkPZY99YGQSieCE4qYjAYQgf3WkGnQXE
         QFBrL/rIwFzvAEOACaJuzxahjyJ0fWUBLoVgTRWE5akxB+pXh62ZlGj3+vOmbRfUAXM/
         plbf/gr6TYa80v/x0XGcE41SlqEeJu7xcikSjQ/5Y/6eF8YObLeoZwB6x85bpz1rGwYu
         v8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=9Gppa7BAPiTJbTtafNpUQg+an3/WD3nhPG5Bw17Zkcg=;
        fh=Us5tVY8socVXVZo5TmC54qIfAVH0+Jek0S15ADmYO90=;
        b=JHrQus0JfcRQREtlZPlRyL5auk5joKh+XHeyXUFsM73eARgK/zlGyL5hfDmd9pI+Xp
         q/rEpi4XrjrC+Q3Oe5IYBHmaslHoBcbQvvRPtR9muwJoqT2lOtczdz1b8VqARKU02nAh
         MDgzV2FvQjlQRCHrFzOaUepwfozT+rPmBQHk7Q2LPvHTRvIn7dMaBte6uDnjy6MSy19t
         KyUUIxIu2ndHuliVtBYAiVDwDkPiMsksposfgjzQpMX8Eov4Sn1zGyrjhHdK/RieBXAh
         vs6Ssg3oGemnP0BKcWxmszDS07p41gQgPPM02D6q32F/i2Ncq10K3CDMY4AwuJiJaB1O
         fTzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Da7CkhRc;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ee0caesi282567985a.384.2025.06.13.03.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Da7CkhRc;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749809895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9Gppa7BAPiTJbTtafNpUQg+an3/WD3nhPG5Bw17Zkcg=;
	b=Da7CkhRcNnHZP5DIGN5dMbsvTilqQ4lyvaR7gG/8EB4WmcULs6KUz2dQV+7ZL2M1EMd1tw
	JeolluDPnhd1yoBy7SIKc9oibkgx+zBaKXbOcLOJrWX+fHySgreeJCQnHMMu51A4fBeU0z
	7aNGIwIacUzj3k3NWxw+e61c1KNveVQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-h0ZGwBWjPZK4UYmdwsVIKg-1; Fri, 13 Jun 2025 06:18:12 -0400
X-MC-Unique: h0ZGwBWjPZK4UYmdwsVIKg-1
X-Mimecast-MFC-AGG-ID: h0ZGwBWjPZK4UYmdwsVIKg_1749809891
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so1012472f8f.1
        for <alex.bennee@linaro.org>; Fri, 13 Jun 2025 03:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749809891; x=1750414691;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Gppa7BAPiTJbTtafNpUQg+an3/WD3nhPG5Bw17Zkcg=;
        b=tiRMZ+abHsKpQJg6oPF+O8fhfrMDVZ7fPr20YAdn1sbezXXSmWESZYw3q0XXeHqTHK
         bLcF3LlmZUKyki/Tial6NnxCOnfwpBp7rEUDSFNg0CrHy1LRu15r+if2A1YmnG5ELAey
         x6dThgbVo/K6n6e8jV1YE6IPALjGwlGh+gHzQzx45nR0r93CwP8qI5ER+dBAAdcfQ+F7
         xP+wOtu5WzkkOqQd5Tg+vJA9JIT55wbDaijyKAlUCs6w6GL8nT7DNV+5MJe2puEUgpXB
         ORd/ssuy15VyxqJqOBS+mEz9Z/evuI7uC8v0qj4JCdR/Tz1Ro3P5iiy9X7ZvlgXZ/lCk
         RgTw==
X-Forwarded-Encrypted: i=1; AJvYcCWHQpErZMqC6f9bB4wDDLLsgRsKWmX7m3L745TiSlKjUtQ99UMEV83e2UkdKQIwHdIubR0WgzY9NuiotQ==@linaro.org
X-Gm-Message-State: AOJu0YzqFQur31eXzdAKO4Nv1Bit9DLx/l61IPhBmDljclZ+R6dscr0T
	Ll/QBzYqGtrJmqeNSc+0y8Z1ol+hIut5R6XJ7jCaYYhiJ2Pu61JKxzqR7jFJznuE1pPeFEV7u3S
	LwaCa+PGRCO2AgDJ2x2mYW8bR8bs+uY6BndiVwf3UCdqwleY/UC7NNSr2wQ==
X-Gm-Gg: ASbGncs1gmi2FQfF2b4MJdZuNCkTMJR3JRSDkqMqGi0SFeEFr2ud/L5gzx0GKw4ROVl
	eY6gtRp6u5FYYrK55GoqfgCnpcRD1n+cUu91ipwa56DaJJgJfIywrRFS0JFzDTcj6BTDEZ1Ps39
	EZf+3gbnyZZO8sRhoEXg7zrCvSON9kiywnQM6mlf6KLOxb9VILrka3KB64sa0UZnXW0n+/ztqU7
	9rCmRhUvRbOkSAASno9Fl5y1PoheSbL5ZWmYmpSFiqaXNN9purhsu01jIbvBQdDHN/RTqxz2Uh1
	QPIe7bDDNGAkQkGEEL578tvis0kvd+QbVxHi/Wb2tMp0VPOw3/+0OigTOrvaCw==
X-Received: by 2002:a05:6000:240d:b0:3a4:f7df:baf5 with SMTP id ffacd0b85a97d-3a56850045amr2490682f8f.0.1749809890601;
        Fri, 13 Jun 2025 03:18:10 -0700 (PDT)
X-Received: by 2002:a05:6000:240d:b0:3a4:f7df:baf5 with SMTP id ffacd0b85a97d-3a56850045amr2490620f8f.0.1749809889999;
        Fri, 13 Jun 2025 03:18:09 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ltea-047-064-114-027.pools.arcor-ip.net. [47.64.114.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089d8sm1923446f8f.57.2025.06.13.03.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 03:18:09 -0700 (PDT)
Message-ID: <3797652b-86a5-4abf-becb-de62dfebccd4@redhat.com>
Date: Fri, 13 Jun 2025 12:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] python: update pylint ignores
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Yi Liu <yi.l.liu@intel.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Fabiano Rosas <farosas@suse.de>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Ed Maste <emaste@freebsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kevin Wolf <kwolf@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Blake <eblake@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Troy Lee <leetroy@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <laurent@vivier.eu>,
 Ani Sinha <anisinha@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-block@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 Maksim Davydov <davydov-max@yandex-team.ru>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger
 <eric.auger@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, Hao Wu <wuhaotsh@google.com>,
 Mads Ynddal <mads@ynddal.dk>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Rolnik <mrolnik@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Alessandro Di Federico <ale@rev.ng>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Hanna Reitz <hreitz@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Hyman Huang <yong.huang@smartx.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
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
 <20250612205451.1177751-3-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250612205451.1177751-3-jsnow@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qY0qFm5ZCS3QZILCGDcN4of3TjJxckylv6KJfHCIj28_1749809891
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: sLum293LMPnz

On 12/06/2025 22.54, John Snow wrote:
> The next patch will synchronize the qemu.qmp library with the external,
> standalone version. That synchronization will require an extra ignore
> for pylint, so do that now.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/setup.cfg | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
