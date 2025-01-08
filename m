Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp873484njb;
        Wed, 8 Jan 2025 06:16:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt9OvFA3YKZk2q7quIRKgMoYq9rWhiDcmryvqdVGUnuN1Pleh1dR08QJzlYEFSLR1RRlkb
X-Received: by 2002:a05:6214:4b01:b0:6cb:ef8d:b10 with SMTP id 6a1803df08f44-6df9b2d3775mr55283746d6.39.1736345777699;
        Wed, 08 Jan 2025 06:16:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736345777; cv=none;
        d=google.com; s=arc-20240605;
        b=H4kJuVU0COMJ1LLm0eVbjmivVxS6zvE1CG1OTxOZ9oWuEqlJWV2vluYUC+5Ygy6sCx
         kKm70rwaF7FuOsp0wQnN9WLAfL8RwFkUArp0CJo1EFi/VEjYoYThNd56hPlotOm9AkOh
         9muofkHPAWmhAcKkVlnX1QhA/uAq8SasSgQ0hiO3KX9dReRrL4NveZqeyWGXuJX/pk78
         x6ktO2Ct3AsLjwZzYJNUptinyBZgocfYi/aV6+2tm2jVrryi7FINXSbfEkvWGB9BTIOV
         FEBrQJcvcA5nigxtRK2i/7RAlW5oQ8vUP2KWa7iYqIl492Fe9F9mR6DQDXRkoi8mgO5g
         Qjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=5SxCrXjPyCzH10dGnHirxcsiqvKBep00xpCe5jk1cjQ=;
        fh=etlUlT9YTuxLNCn9a37I+Y2rZfaCHvtJEafpa9OIIos=;
        b=eKeLW7QMnhcw9sGGl+gfhKXDWroc30K2uWT1O54MiPC7/SCwpG+nNdGgUjkd8wfOQJ
         1Yk38soK8eCmEfbViyGJhfrYyFffgTdTwj0z6csHwKeX/dt1rf/bs71baEYZiSZbxnKy
         YYMi1MwEIBADoYyxD20tM+aWm2LF0dNVZdiH3p31OiFWpaNuMc69fdmreQCUZYHQen81
         gIxHYQhG7f5phTzZKrT6KNQgVmd53wqVnmYGF9FC9mhUICLwPE/QcpIWoO3ohT3J3pgr
         CuP6rnv4tRmSr1NLfGO70q7MJNRRnpX4vguS4O5gXveszP6Afv5HkYvs8BL66jYHuP+0
         KkJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FAe6INvI;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18135ed0si468576376d6.116.2025.01.08.06.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:16:17 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FAe6INvI;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736345777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5SxCrXjPyCzH10dGnHirxcsiqvKBep00xpCe5jk1cjQ=;
	b=FAe6INvIHkCFYtPPU6ZllkYrmm6W6zWs0bZT7vlrtxTLsVnc6lxKdFFhYFlu2l+cBhs/70
	JB2xtfjPoSWyX7JM8GsaYD72024duxPXvKWfbQNSR6ZFRR+2fmfmF8vXbntJAg9oa6459S
	T6jJMVi5QvbqltGS8Sh6woZEmRt6dKs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-zLQpJQweMKSfLHhis48Y9w-1; Wed, 08 Jan 2025 09:16:16 -0500
X-MC-Unique: zLQpJQweMKSfLHhis48Y9w-1
X-Mimecast-MFC-AGG-ID: zLQpJQweMKSfLHhis48Y9w
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6dd43b16631so179604376d6.2
        for <alex.bennee@linaro.org>; Wed, 08 Jan 2025 06:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345776; x=1736950576;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SxCrXjPyCzH10dGnHirxcsiqvKBep00xpCe5jk1cjQ=;
        b=pjA6fwnD2GibQQj3UjBhRf98tChpACPL3o9+taW87RAozMpsxTkPDlHozS9SoLElzU
         HijpvkxtyWDZEAyuqhDbOB6Kbbi6Ts5cuyXE4sgsGlleT2ZEjzBZk6Ozcpn4sBIKVEMZ
         M+6KLdoEm8ezPiC706E1g6AorJ3RSk4UJrnVm6JUCyxxhzX9hbHKYjdz+PxyZq0RwLFv
         CD+E+XdSdM1q6Wm35s/MHV4c2YHXzSOT5a3Lcb4MlIWaB/Ti0nWflQVg/5wE8Lnjj4+F
         ua6UpW4rUO2fH+EwoLCQGOY+lk1SjTUAxxlRodycnwFrr8YJ3z2Mz6SY78hNfiKeBxWc
         5Mxg==
X-Gm-Message-State: AOJu0YxU5DiG6IjHl/E39h8ZOyhgsngLsADxGI9pyxlD/wXYC4VvfR2i
	h6jVW12xcIH19VRmM90xi8QsBP9AAK5WI8T298ZnZufXph530mxBh+Qj0YyV9CF7zzTIkrnhFf6
	X3PODEZ1bWpAKryfNZERkxntRCMnNFZn2HHqfVHqhjzkfnG972QraP7+SaPPqsTB5JFRYx+nr9m
	a9JL9Ly7FHtcvnOhM1nh75Hn13Cz6nGZhISw==
X-Gm-Gg: ASbGncsWeEHD587hn5zSUL8Bt6z/PqonCnOBeHeFPPcgyduDuF49M4aOfWes3WcuMer
	iOAE2C7izY/pF2uILxKUh0UMRkRiVPwndPQeGq4nfulzra2okktwEr6uIBcL5DnWmhsRCFpqfPI
	qGN8nDNesiPxpffwZPHv48zcd4NRGnoXTqQBxctpKigEGWUUvtQuUS8Bem6LtRZ2te2sFCOpinT
	NlMbz4BrvK/YdFCbUInmHh4Gd87PCUb7wPFwNmtNpJ7U9H3USC04VSXuJvTF/mThL0/G3I0GLku
	frMETQ==
X-Received: by 2002:a05:6214:5f06:b0:6d9:353b:aa26 with SMTP id 6a1803df08f44-6df9b1ef342mr48896366d6.13.1736345775859;
        Wed, 08 Jan 2025 06:16:15 -0800 (PST)
X-Received: by 2002:a05:6214:5f06:b0:6d9:353b:aa26 with SMTP id 6a1803df08f44-6df9b1ef342mr48895476d6.13.1736345775328;
        Wed, 08 Jan 2025 06:16:15 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137419sm190985636d6.69.2025.01.08.06.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:16:14 -0800 (PST)
Message-ID: <d843d910-9f00-4bf3-a3e7-f983f0b35676@redhat.com>
Date: Wed, 8 Jan 2025 15:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/32] tests/functional: bail aarch64_virt tests early
 if missing TCG
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Laurent Vivier
 <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
 <20250108121054.1126164-23-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250108121054.1126164-23-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nyna2-XLQOpTZeQ1nfrrEkdkCouDvZOpqSqjA5HDK4c_1736345776
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ih1fwCZDsCLx

On 08/01/2025 13.10, Alex Bennée wrote:
> The set_machine and require_accelerator steps can bail early so move
> those to the front of the test functions. While we are at it also
> clean up some long lines when adding the vm arguments.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/test_aarch64_virt.py | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
