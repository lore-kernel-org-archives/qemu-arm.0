Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5266807njc;
        Fri, 22 Nov 2024 01:52:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx8QR9sFKm9LPNDIzKE0BvR4r5ht6AzFw51QvuezOjdqSnnMeSQMP5HR4nByqYmBEzjl2n
X-Received: by 2002:a05:620a:7188:b0:7b1:51e9:ed77 with SMTP id af79cd13be357-7b5144df7cemr246209385a.10.1732269161684;
        Fri, 22 Nov 2024 01:52:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732269161; cv=none;
        d=google.com; s=arc-20240605;
        b=W52DavHKlWJc7QChEP6bk6OF/PI0/TKyxRZ+QIpqCJ61n45cT+IUn+eZ7b76RJ7N4K
         1rp4aZAhK2Dk8PxRyKidi+0t1ZE/mAs02DYrW+8Szyd9yxDQQyO4Fs1D5EDLA/uIcH6A
         Pxq0he5dtkXn8GP9h2VyXb4lmFR/fI/IKB+flO1o5s2G0qMhK6GMnc0VPvHKeHBzUiX5
         cAFlNG3Q6FYgmBzHPVpgor7bO58itYtESGHs4d3mhdSzPMxUmMi0UqdsR0160nBvy/oo
         0CnwSXWaQfU/8p1kJcaaiFXG/Zg2xk8Ov0RzftFC0jRl3qMoHmL+/WRiGkX61MCxqImA
         ZmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=UApX/TM4+eZlLFEmlVCXud+NWSaTgLQXHRhREd6ccw0=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=htkpwRt65dJeGm1X0fnx4uls6XVoCBdz/jsPOKpduhOviQ1lLZXccmabCT3tGX398A
         BOMNgFbn8lsDqt7Bw7RtSMgFm3nGnCW5Kvm2+P/DNGW++U1d5ivuRlNmJaVj/gOi/m0Q
         NLRAKwYf7RqRw1YyCZuUCLg/xBDqWmV6alCpy6X/GhHZDxK7/3ZvJgKmSZnulh8pxV2f
         npRK5YBH1PMSyLUN7itwOX45SHn+vcYT6j6UdOzaD4zFbmV+RTIYntnwi3tXTUqGpfY8
         swrCec8mEOjt+rAlsX5u0li0gXmqH8/Gp+MwRm+Vdfq8O/+N8q/nbxV/XoLokIxFR2kM
         UMiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XojMVfmI;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b51403f498si165671085a.269.2024.11.22.01.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:52:41 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XojMVfmI;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732269161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UApX/TM4+eZlLFEmlVCXud+NWSaTgLQXHRhREd6ccw0=;
	b=XojMVfmIVFOscIJCKsoSZcIUnQ+E92Yi16d2LOnxN6azaK6rHrNeBwtcsMH2dDc8fRecFr
	UfNE1cMOJXXHoFZ4+8ccSgA2+OhDB34sEHoKyWJUhFg7ege+flAUn3kGdpcHD3/Crjkl6V
	x1FSBEF4FWJXRwYleB5m6whLzFawpcE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-J1MQ2HZLPZ6w_7jJcH_XFg-1; Fri, 22 Nov 2024 04:52:40 -0500
X-MC-Unique: J1MQ2HZLPZ6w_7jJcH_XFg-1
X-Mimecast-MFC-AGG-ID: J1MQ2HZLPZ6w_7jJcH_XFg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-432d9bb0f19so15470625e9.1
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 01:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269159; x=1732873959;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UApX/TM4+eZlLFEmlVCXud+NWSaTgLQXHRhREd6ccw0=;
        b=Lg8KbZw+yHA8p1E08yvN5f0degEiIln0tPl0dIwFWErFU04AhK5MHqkXH5eNn79YOX
         OSM658ScuY7W/IYxkjEvpN+wgOz+JyryAxtBV5R58gDtadNachCHzr+QnInzqqvslJOF
         BeUvdCqV/cAnaRI+6Upm5QZ3URN4JVdeb/FHAhqp3EpKYoWrOECRxOwsB4xZb9j474WL
         L5sG7WiG7NmVglz7I7fKvF35/SbPoVcGBsM+MjerRtGBUyrpVgdRuGZUq5fnEL9UbDrO
         7CtOIwIpZrpJ/tYVSLrNkNa5lrqw/99CvypyawH0eFStsQTPs3dMRktov07w7q674FuU
         ikVw==
X-Gm-Message-State: AOJu0Yy/1u6rvmgxE3uF7+DqCSpAgEOz8nNvTewHSOlY4meNnKXN8PIp
	O8igZ5j8Um6me4/LwTEaVfoYPizCJCCN9CmH87pAgogLp4TjTzbPP41rhbbYQtzItBlF6WZyeuM
	QRo8ktg/6RAgq0+oXPpUAqyeLK2vlEvBuwqSMh+N92FKqRbpuFHaZoYRSAxOTcLnq89IiBZLOrs
	yWktZM6KMxsmSP9/Fguyy69gyhr5GLbZOv4w==
X-Gm-Gg: ASbGnctK3O05r4YiHozvmleqncx9sLHRxMVQQ6T5byjKMwoVkAgwU4mxHPIDTG5dUi5
	ZqW36DkLLm1HD295eHnzKuUL2HJxFpU7ReVo13hWMcalsS3uZozYr6SQFhDRKMwVGG+JeMoWzka
	Du2WDHRyPXs8iv1TluZn1Ju9WFcUFt73/XlWV/f+wurROoSQVBqDX1BrRjGEuuaZTQPKu2PcPWR
	RHa0pscwKENGiKcTzhTyYF1EqHTgjgloF5GNxdQdLqcuZ6evvylfmPMeLsT9DG2nKkvtajm/as=
X-Received: by 2002:a5d:47ad:0:b0:381:ed32:d604 with SMTP id ffacd0b85a97d-382604ec1e1mr2209791f8f.10.1732269159165;
        Fri, 22 Nov 2024 01:52:39 -0800 (PST)
X-Received: by 2002:a5d:47ad:0:b0:381:ed32:d604 with SMTP id ffacd0b85a97d-382604ec1e1mr2209720f8f.10.1732269158623;
        Fri, 22 Nov 2024 01:52:38 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb27196sm1931968f8f.55.2024.11.22.01.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 01:52:38 -0800 (PST)
Message-ID: <a4bc5235-ac44-4565-a04d-ff15add43e80@redhat.com>
Date: Fri, 22 Nov 2024 10:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/39] tests/functional: update the ppc64 tuxrun tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-30-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-30-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h9NPePnWk9JoI3t4jbZzQc4SnyUY03poX0YZrQb0OLk_1732269159
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hmfdnlvIG7xM

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_ppc64_tuxrun.py | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
