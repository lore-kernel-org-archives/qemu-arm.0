Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3846365njb;
        Tue, 10 Dec 2024 22:35:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuogCParQ5QVjERsDiKX0h2WG5WbghBVu9yrxmsSHHfELol2x2iJ8NCZFkGyykqzhJdiJQ
X-Received: by 2002:ac8:7d07:0:b0:461:2150:d59c with SMTP id d75a77b69052e-467892a1ed1mr29559291cf.9.1733898956285;
        Tue, 10 Dec 2024 22:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733898956; cv=none;
        d=google.com; s=arc-20240605;
        b=Dlql/GCRq6RhOZ8Kav4C0xfXoJVhE1E5KxKk2lkoUNy/K88OgKPfxzLgohg1FsRPLb
         CyQGEgwGZmylHYUoVaZQB1BL9TLhHrTUtXQyDjIVojxnZwTSkJSNKNFF5yJZBmjh6i/J
         nwK9X+YPW1APno3GX5pNIJSltcjcaoyQO7WOjBIEq8zgpMU7UtwEBB2Li/YbnvqIIdEO
         P/Es4HOxlAgD+Edt36LATS6y2VMq8jQZrhRnv3NQm3JrqCsLFNb9IAzVLArxpa80qrYl
         1W6t+ERWlfVqFkTwSiC0/jo6wGIiy/C42hzAuqB/zSTz3N4hBlsThwEkTr+wCT1f6KS5
         qCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=mwwII47FzMH3c6sdP6KixaDvcq0h43mBlBIhqiZ1WHs=;
        fh=PyRPp6p7Zb4yzib6tbXvkfdudwkdHT8PPxsBOu3pTV0=;
        b=hCfn+kEGX8sQ07eiVvF/lfG8P9U547TqaHEVkvqqNgzJrYE1OHab+jl2M5KYYAC+5k
         99BL4Eyva0ZSRj/gt0rKFxJBoCraOCieBFVPMF91VD62rUJI+NXN/9yTyh1SeTsm/TL9
         ZpjTZE0h7OY5beXS7Ia6CmjIZbkIhwVaMf1p3AoqurcDGcQg9QTjG/8vRQtxSpbQv90M
         d6kC4R9RESk9hYtWuDKEmWqdXxdu6NTV87mc/wlMQwr81RljCuhnKFD1g7PpUJMUexhv
         msWBQe8+L3YOMkvKDTgS0u1EVAC4nYgrR7PtHE7v+BnxgAaQlVT31MsWpZSB+6JU3zAe
         97UQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E3IiP713;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46785e9b0e4si23528941cf.238.2024.12.10.22.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 22:35:56 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E3IiP713;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733898955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mwwII47FzMH3c6sdP6KixaDvcq0h43mBlBIhqiZ1WHs=;
	b=E3IiP713xLAkwvtk4+0AUYEwHZxLm9nyi410q+y9s8JG06SwJ0ri56rmnlNQWQTdQmQeQU
	YM2Adx3u+BVvHxQlvN5v4+4SeovGYgkKJwa6uhu90b8mKKxt8f7yqYlPMzG6YN/XAlW+jd
	5Q+DeQI4jCrdPfFKdjEBLnQxMOqqsDA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-vrLp7eIKM4qGbg2VRySvYw-1; Wed, 11 Dec 2024 01:35:54 -0500
X-MC-Unique: vrLp7eIKM4qGbg2VRySvYw-1
X-Mimecast-MFC-AGG-ID: vrLp7eIKM4qGbg2VRySvYw
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa6b69163caso12829266b.0
        for <alex.bennee@linaro.org>; Tue, 10 Dec 2024 22:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733898952; x=1734503752;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwwII47FzMH3c6sdP6KixaDvcq0h43mBlBIhqiZ1WHs=;
        b=nqIYD7KDKP57wC5pckYxdLXzCKHrh+fE0M87QZ4lhVJR0RKMJjjd7w3rirtBIlhp2L
         IGOeB3OhTJHjqZtZI4jR8sWB9Zi0bUkff/xJqEscgsQH2P5P1g7LPe3sxeVxNnaQeotg
         9AQO4D5EylGeDKgFmjjACPiV/25wOPpWkMFaQNQZXhigyWrAepBAuXDCmvO3+1+rnvCI
         fda/oGcIgQelNHW/FS/qXfjh/yTUP8gvH3ypwqBKJtpDyl935ItXrdw82xu93gHrTBLn
         IyWhRJzvHdmK1YiEKeJps8IOsASUftAUD9GGNJgf4/19PRE7TOG8cqfMikh1DvfQ/R2x
         WD3Q==
X-Gm-Message-State: AOJu0YxuUTNXqi3aonnpjR6BPO8na3286jFcSp0W69Ies7AmrWsoJvrC
	xAk1kCjtwpRq1GF4TvhPXc8172cF4ntMzDaKfU2Y8H30mRgX/9AhKUOQ3nYezTSlp6iMMHkBVsH
	ztxBTsWApUhMX/JPEhpADWWVCfJiJpGT3qRXQhnwmO4Nezxil4wl6QsvwIxh/w9TMfoOm9PXdaa
	HuOI628KP6hut1cc9yGNE08RhX1OmFnyzY+A==
X-Gm-Gg: ASbGncukcEqaogQ++Y/U8V1IRbw+zpptw+YvZ/Wuf8Kd7bUzC36wb6LZ0l8Jfjk5ZbL
	txCBjJFReBEZYyE9XW8YsaJ/xwXuYFAxzvwG6xiXCuF96Ry8y+uZNIBw7qrizdrhScpa/qDcBtX
	Y2By/Xk1sX+0GncfQIgaiiIs6EmZVvuOM7frNw6O5WWHZP1Xjk3Nz6NQyBBhbih4ojt/mesyM76
	2sGV9lW/lLTSLMY56Vbtv6Ygl9UqiCgmJ0jyl0g+Cbe6PnVLc+iPVsjw+U0KvBPPaywFvWa+CqP
	/PQlcy8=
X-Received: by 2002:a17:906:9d2:b0:aa6:8520:718b with SMTP id a640c23a62f3a-aa6b13df104mr128415566b.56.1733898952015;
        Tue, 10 Dec 2024 22:35:52 -0800 (PST)
X-Received: by 2002:a17:906:9d2:b0:aa6:8520:718b with SMTP id a640c23a62f3a-aa6b13df104mr128408766b.56.1733898951489;
        Tue, 10 Dec 2024 22:35:51 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-42-51-17.web.vodafone.de. [109.42.51.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67f4c4ae4sm469717066b.111.2024.12.10.22.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 22:35:51 -0800 (PST)
Message-ID: <cd066448-3224-4517-b48f-c98c10b99304@redhat.com>
Date: Wed, 11 Dec 2024 07:35:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] system/qtest: properly feedback results of
 clock_[step|set]
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
 <20241210204349.723590-19-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241210204349.723590-19-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vgyZas3cZVFp0Igd9TfLDnJu4ruq9XodHbcxeY9UzLE_1733898952
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wBL8wkIeDhvr

On 10/12/2024 21.43, Alex Bennée wrote:
> Time will not advance if the system is paused or there are no timer
> events set for the future. In absence of pending timer events
> advancing time would make no difference the system state. Attempting
> to do so would be a bug and the test or device under test would need
> fixing.
> 
> Tighten up the result reporting to `FAIL` if time was not advanced.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2687
> ---
>   system/qtest.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/system/qtest.c b/system/qtest.c
> index 12703a2045..d9501153a4 100644
> --- a/system/qtest.c
> +++ b/system/qtest.c
> @@ -78,6 +78,11 @@ static void *qtest_server_send_opaque;
>    * let you adjust the value of the clock (monotonically).  All the commands
>    * return the current value of the clock in nanoseconds.
>    *
> + * If the commands FAIL then time wasn't advanced which is likely
> + * because the machine was in a paused state or no timer events exist
> + * in the future. This will cause qtest to abort and the test will
> + * need to check its assumptions.
> + *
>    * .. code-block:: none
>    *
>    *  > clock_step
> @@ -710,7 +715,8 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>               qtest_sendf(chr, "OK little\n");
>           }
>       } else if (qtest_enabled() && strcmp(words[0], "clock_step") == 0) {
> -        int64_t ns;
> +        int64_t old_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        int64_t ns, new_ns;
>   
>           if (words[1]) {
>               int ret = qemu_strtoi64(words[1], NULL, 0, &ns);
> @@ -719,11 +725,10 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>               ns = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
>                                               QEMU_TIMER_ATTR_ALL);
>           }
> -        qemu_clock_advance_virtual_time(
> -            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns);
> +        new_ns = qemu_clock_advance_virtual_time(old_ns + ns);
>           qtest_send_prefix(chr);
> -        qtest_sendf(chr, "OK %"PRIi64"\n",
> -                    (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +        qtest_sendf(chr, "%s %"PRIi64"\n",
> +                    new_ns > old_ns ? "OK" : "FAIL", new_ns);
>       } else if (strcmp(words[0], "module_load") == 0) {
>           Error *local_err = NULL;
>           int rv;
> @@ -740,16 +745,16 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>               qtest_sendf(chr, "FAIL\n");
>           }
>       } else if (qtest_enabled() && strcmp(words[0], "clock_set") == 0) {
> -        int64_t ns;
> +        int64_t ns, new_ns;
>           int ret;
>   
>           g_assert(words[1]);
>           ret = qemu_strtoi64(words[1], NULL, 0, &ns);
>           g_assert(ret == 0);
> -        qemu_clock_advance_virtual_time(ns);
> +        new_ns = qemu_clock_advance_virtual_time(ns);
>           qtest_send_prefix(chr);
> -        qtest_sendf(chr, "OK %"PRIi64"\n",
> -                    (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +        qtest_sendf(chr, "%s %"PRIi64"\n",
> +                    new_ns == ns ? "OK" : "FAIL", new_ns);
>       } else if (process_command_cb && process_command_cb(chr, words)) {
>           /* Command got consumed by the callback handler */
>       } else {

Reviewed-by: Thomas Huth <thuth@redhat.com>
