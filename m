Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1078509njk;
        Wed, 18 Dec 2024 09:07:16 -0800 (PST)
X-Received: by 2002:a05:6000:2af:b0:385:e303:8dd8 with SMTP id ffacd0b85a97d-38a19b15f9emr402590f8f.26.1734541636526;
        Wed, 18 Dec 2024 09:07:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734541636; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQ61q3nTphOHir/RV/SIWD1Vzn2dA8x3BSPqQ/OlxvNQ5lwo0N31yZHkhdyth6ENEq
         0Q84J4cgc/AuXEGGr8G3Rzo5IDXiNWmds/E4ihwitNXCGnMIjgnMTdSsJO0qVyCm8r6S
         LXM9HPCQd/aNdfi7Xrg4+PCcs0OjUrR5/08ugCmGRsWgdCGcC5TVkmBpHNhMO2/VZKZk
         BrNZiKuGpBTXTmVUc5OvCP6nC7v/lytTi+cc5h3OlPGGvbWD/POex+NjdkRnHU0GVO7O
         ouD6Y5IKSfiYMCtjXzd0FKQFLXG0a2SstJwT5AIbKgltxk6qCSGW8MjlZ6bXHqcPYb2f
         TSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=84Xp02vd965R6EVhlhdL+FhhEbC0vWzwkssxj/nxppI=;
        fh=gLpo2kejfU972rpklvPvZQ9jifaBcKF0Clvk3IRrLvU=;
        b=O1o2b73epaPwwJ5ytw3n6NuJkSMys22Ze1MM1ypJwFm8XVl3nTGQjOWUyhibYgveRZ
         wifNz/W5z1EYwSFuGpuq1V6V7tF4ESarYXyqa67hsxmvrWULuQVDaOmq1YaogOLRtB1Q
         0P7JcUDaSueRud9y9tr0Tq3yaNsk1l0fK8QwuJORUdC25f+ebKfDXQ/vV2ApBUdCUMxM
         JEBJ+67Jst8ReBK7pUnA6Vmmv/jDfS6zdh8AjyE8VGD4O7hGTs6UzAb3mmG4K+sVz5Ym
         vy9rGSvX24LHTxikDMZFWVUSuRVXM1vorpmVTMGHMt5v5N7ijDKDRzu0OOK2aFJK+Kyu
         QrVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vMC8llfz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-436362b06d1sor33018405e9.7.2024.12.18.09.07.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Dec 2024 09:07:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vMC8llfz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734541636; x=1735146436; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84Xp02vd965R6EVhlhdL+FhhEbC0vWzwkssxj/nxppI=;
        b=vMC8llfzZHJCIPpUGjW/pKZHobuKJIl/il8ycw7hCCnw/ZT8IWrG9SMNC4zqf+r0Xg
         9SOYW1StRHUVRnjobW8ruCnsi9bzxrF9hp/6Tngmx2XdJltXfXpVPXGa9+Gxe/LLoBqr
         26VD5N/8OQtcSvHSsHeufCNyMJN36vP2Qe5dzP6TotN72Wl5KWtVeq1zr5ngjxoVaq3g
         bd1vqwhTcAR7EQzNDK5ozqyy6l2QBhEhfORm8OgdsZDCa3bZXgLC8P3fUgGmg0pR4NIa
         uHBDxsYm2hT0Sxb21vg795J1zv5fhQW/B/oKvHYXsUqmcapDa01vDPFRDRTxNNoTJDVa
         IhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734541636; x=1735146436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84Xp02vd965R6EVhlhdL+FhhEbC0vWzwkssxj/nxppI=;
        b=CeD5q1V/N9iIF1CynWvIUEAL++Dq0+863iND0Vgcx8SBDHZm6+uAyTceD0XE9SgSxf
         2r2YD/MqGa1+vPwNs9FW0Bgy+h+dyiTBHiyl3F0PNFWCm9eyP8Cz4Im4waR89WI7xoxE
         x65YHeiwMYvHLa9OQhnxhjSoggYDsNlrkJYnBW3L1NCncc5QvNm0JtCeMqin1lHKP6Gk
         Wx/wGWIdRHYsUfGAbtskDja4XUf8EM7iOBs44kX7mjomK0KeeWjSVSmIyZ+pGGq0Sy2U
         MLHDoTJXWc+05eirWxhIs3euX8PulJj3rrn7YdVzOGggl01zPh0zt7swua8NoyABqDWR
         zZFw==
X-Gm-Message-State: AOJu0YyTbYw/jhnDAS021EM1LjXC1BZZsW05Qw3A9oE815uzE7M+GHEo
	wT3QmVLrkkxotq0bAlwaDey97p3XB5UqIqCVMylxO+2C8H+8OL4ioKlKMNStVwRbylIasTQJzaC
	ItUw=
X-Gm-Gg: ASbGnctZRIjcAtE3r5P0Vlspv+MUN0/1HGqYybgK0vd9q/jHxogP5u7V9hWkTSuSr4w
	n0BMwmPeyx1XJpSurhoU7mcxac7u3KRlM91qXF1LiR+Z+5BkliohNKj0mV4CUwuxrPgVlb6TzEP
	QXHNKPo4wY/VqIdB+08gdU03H0FSgNhZySNC86FpWlcG6mUhD2qooJJoIxiEZaXi1vxc3k5T2sE
	EfuKZUwlb7C1NGI4GH/htoQtcMiLnS4areQ+7oomd81dsymLqeEkB7sNwMmxnThcAPs9R1h
X-Google-Smtp-Source: AGHT+IEgBsMsJq+hHwD0O44Y0o0aaOd3ofWzK08cLIPdBnnYipgVFHsDw/GjhdUOmRJDYKCm05ZQaA==
X-Received: by 2002:a05:600c:4fd3:b0:436:346a:fa9b with SMTP id 5b1f17b1804b1-4365c7c9707mr97695e9.20.1734541635603;
        Wed, 18 Dec 2024 09:07:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.117] ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656afc125sm26909535e9.6.2024.12.18.09.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 09:07:14 -0800 (PST)
Message-ID: <f4988fd0-62c7-41ec-baab-2433aee78f04@linaro.org>
Date: Wed, 18 Dec 2024 18:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/27] tests/vm: fix build_path based path
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fabiano Rosas <farosas@suse.de>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
 <20241218162104.3493551-25-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241218162104.3493551-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LXnhY40/LV1Z

On 18/12/24 17:21, Alex Bennée wrote:
> We no longer need to go into the per-arch build directories to find
> the build directories binary. Lets call it directly.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/vm/basevm.py | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
