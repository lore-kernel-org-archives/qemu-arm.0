Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1316779njb;
        Tue, 6 Aug 2024 11:20:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWSB5mStSDNyHVoxSLsgiXQsLy6zlCx0j4In1gPHyYTdqyKb4RpWjst7Qwa7xrZr3WYYtLTbeNdHwKpL0ggmCHArv60LCK
X-Received: by 2002:a17:907:7e9b:b0:a7a:8378:625e with SMTP id a640c23a62f3a-a7dc4fa1673mr1071989266b.26.1722968404445;
        Tue, 06 Aug 2024 11:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722968404; cv=none;
        d=google.com; s=arc-20160816;
        b=uO8+Aiz2IpmVoPFijTQjVncaruIIR6dp2Ajr53d7tM+AABp5dy7wQbl9lV8/QMF1ts
         MluwL64vrCH4MYpn5xJuo7egTXrFnq4g3IPqmHIEV5iHfPf+cQlqq99O0i9Y8j66NvHi
         S9mynJvjPLwslcyUpLNE6yKolHdUC5f68uw4UT0ZAHasTSG5EySHxZmb3ifEer21fV43
         Q6SkU++GrL6U8vygSWNIPDBI1CSjYKhTZWwh0VHjFJT7eB2c62iwmW7Sj5GNbZhHldnr
         4gkojeBUXTK+hkJ6XgwpEtWIMaK8HxpVrxJQQUZ7f60Xm/lGRbMnub5QMGEdaGLWAGJw
         al1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=UZxCd+zIg8/fTwlkeH78ozUnzNFrJo/odIzAXVX7Upw=;
        fh=/DhNB66WHscaYRd0kDVJA8wB00HqAQdahixTW099ryc=;
        b=O2IY6NnmmqvBlAhOnOj0CTxbRboznIJZ3ms59epmrLKKC09Ovdy6MJUr2LxG9TgsxD
         Q2kzeogHprPvD0z6w424YCQRBf1EYkD62X8TD0fxzjgmsadLcuIlHCixZ+TR0rARszDR
         5ldZiWDvWNBcEdPC+aEtsvRL8iPAGBLTGxPeJkSfukrB7CjLEQmqmQz6fFRzdvObFeAs
         2D0SqtC3lFQTF/XerRzzoZVJ3Eb10CeZCKVltnECfqVo02EHG9uk7MZd7f32o/3Z9lfX
         LbeLsQiHhrOutjGF4Mhxw2oUeS1sCMx/+xmPyiDDzB9Wuh4fTaE93V+XBTRO5dd2yWRD
         2kyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eJRQ6fmu;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a7dc9d00a1fsor220566166b.7.2024.08.06.11.20.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2024 11:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eJRQ6fmu;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722968404; x=1723573204; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UZxCd+zIg8/fTwlkeH78ozUnzNFrJo/odIzAXVX7Upw=;
        b=eJRQ6fmu6rkQKVcByEXu1NmfTyH+a8TsTMExsbPuesxjyjZaGdk3QD2y3XWLo140g7
         XEWeBuaFAIY8mCCqrfMIMuTy5mPKv/6SC7Mfc8xwQSLLCALHGn3YYWrLomb+hNRa2fkk
         +IweV1Rmg15Y9FHdIu20tMgYIavqk6aZc7CBmiy+RpcXt0Vg9q6jsNygk6WSYab1sG2Z
         T+JF5FGP8h08WqNtqeJIf/xyr8Op6DU+n6zLrwr+/SLUb1nCrcVI9a6Eil7U6PjqCjkr
         fHv4m8WnrVnbKocN4f0817p4/Syv+wanWYE9xcVRZps3oWYety2U3L3Ch7rvbmpScv/w
         q5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722968404; x=1723573204;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZxCd+zIg8/fTwlkeH78ozUnzNFrJo/odIzAXVX7Upw=;
        b=LLNIBw3r1/uDJ42QkJq6I0yCOJ6mlKK6/eVon/g8lLAcwt1TL6wiAlTAkrDx/f70IH
         9uKZLJv9KCdzsRd8+/y5a8Z4aLHbT7GyYkX99bfo/h0XE57b8HjMjyM+ef3hByb3Da8L
         slh4N3vM0DHPzQnIiNt2mdkSYlFXbTnSiX/iVjavPnP+XTTNa0AlU0dDJLxKW402jnIb
         5GSUAYHoCSMlCIVh8BPJLEtGrvKiL5nwLlZ04UMksxSNBffzmE0SI43g+Aq7h+0Jh9x/
         1V7LSTOEArX9O5ba19S/cZDPPTGl+QMlguXiWwE2B1R55XrlvsdgaKm8E6B206p/GMMe
         9PDg==
X-Forwarded-Encrypted: i=1; AJvYcCVBYwfVN8EmlWhf825KkUdydVzbc+c4I6mURAbh7EBEyfqLKIkfbrU55eUrxuUbZclA8IHO7AgDBGrdHsGCdvQAs3sbZk3n
X-Gm-Message-State: AOJu0YxlDAwlaZ/xFQFnkCAi0t8OFIF5HtEJxpS+iJssTg5N4aFdz0cr
	IBBi/Sr3O5R5zM3nGRKUZvfO2c3mHSjoTrmC4b+PBI6a2zmx73UTPSxTyz8vG/yL3Q==
X-Google-Smtp-Source: AGHT+IE8dgDyUbnsAjnj8P7IFi+pXso4GIXfTKr8ZQP6PSSV6i5OvK9bz5C2uRKcB1d1teqJ/9q12A==
X-Received: by 2002:a17:907:846:b0:a7d:340e:43a4 with SMTP id a640c23a62f3a-a7dc4fae19bmr1087323266b.31.1722968403412;
        Tue, 06 Aug 2024 11:20:03 -0700 (PDT)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.200.25] (83.8.56.232.ipv4.supernova.orange.pl. [83.8.56.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d89a9fsm563924066b.156.2024.08.06.11.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 11:20:03 -0700 (PDT)
Message-ID: <540fafc7-9044-4e9a-b2c8-2f2f04412b88@linaro.org>
Date: Tue, 6 Aug 2024 20:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] tests/avocado/tuxrun_baselines.py: use Avocado's
 zstd support
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Radoslaw Biernacki <rad@semihalf.com>, Troy Lee <leetroy@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Beraldo Leal <bleal@redhat.com>,
 kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Paul Durrant
 <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>
References: <20240806173119.582857-1-crosa@redhat.com>
 <20240806173119.582857-8-crosa@redhat.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <20240806173119.582857-8-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: o4W4E0n1sfAj

On 6.08.2024 19:31, Cleber Rosa wrote:
> This makes use of the avocado.utils.archive support for zstd.
> 
> In order to not duplicate code, the skip condition uses a private
> utility from the module which is going to become public in Avocado
> versions 103.1 LTS (and also in versions >= 107.0).
> 
> Reference: https://github.com/avocado-framework/avocado/pull/5996
> Reference: https://github.com/avocado-framework/avocado/pull/5953
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/tuxrun_baselines.py | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> index 736e4aa289..bd02e88ed6 100644
> --- a/tests/avocado/tuxrun_baselines.py
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -17,6 +17,7 @@
>   from avocado_qemu import QemuSystemTest
>   from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
>   from avocado_qemu import wait_for_console_pattern
> +from avocado.utils import archive
>   from avocado.utils import process
>   from avocado.utils.path import find_command
>   
> @@ -40,17 +41,12 @@ def get_tag(self, tagname, default=None):
>   
>           return default
>   
> +    @skipUnless(archive._probe_zstd_cmd(),
> +                'Could not find "zstd", or it is not able to properly '
> +                'decompress decompress the rootfs')

One "decompress" would be enough.
