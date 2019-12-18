Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1309161lff;
        Wed, 18 Dec 2019 12:44:31 -0800 (PST)
X-Received: by 2002:a63:f64a:: with SMTP id u10mr5035043pgj.16.1576701871780;
        Wed, 18 Dec 2019 12:44:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576701871; cv=none;
        d=google.com; s=arc-20160816;
        b=0SKULHEB6QrTwsv/QzMnjbjjCM07yXevnMCY/m+CSI+htDLlz8JJoceYadqrc+Bo8x
         ZC19zucKOyVVjUUv3z+V2/yPhYorP70qafGt1xMOVJ0KtkC+5LaNZ5CUW/ubLbwDphX6
         aPg4HgRFb5NU8Hy7LF5J+4aJekM7DJIUnbhJC1rqGFJIfX7+hc2T4VL/hXh2pTHwdOpw
         vhX77d+BKtwRhstTQ9+lksAVKeAxNtD9TQJyxYgAE4FZ5MzrvkpxqiyekJ+VUdz5Xr8y
         5HfDUoAiDfEqyt2JulZSkfefsABtSRdGYqwvV+bRTDnUqs6WQz3hKCy64HkEawyf4kNy
         uy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=hx95OyaG6MqHCdsFBIXIiXsvovMiVCSH3FKPDjN/6WY=;
        b=hMmPQj/SoqchnVyad81TgOJ3VwR0bec3EDFs1MqTMxjSUmkP93dhZv8hhzh6FwsOOF
         3cHOEH/Uo+Juml8s5wCyaUQQVR23mNMAf8zYyqmZF21WmNxwNyp0qoGLwEwXUCyQqEBN
         3YJavtWTda4hu6Nj+WNb9aeDrtA4TBJyFph5LTztTU3W3NJL/9aRDW6J3Chx4HQQEGkV
         H78LK0SEF1aISbFhLO3KUoD+n5x2r5HVbcmcZYQCAV84jo/8BZ4whaLh0j3uODpZWw7x
         43/sQ2jkLUCK5h/l4dhNbN3/ftWQOoOcldluJJN1n5Pz6SR15ijK12jvXGxRDvjlAP+w
         MYww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UsNnZgRb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w12sor3575054plp.38.2019.12.18.12.44.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Dec 2019 12:44:31 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UsNnZgRb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hx95OyaG6MqHCdsFBIXIiXsvovMiVCSH3FKPDjN/6WY=;
        b=UsNnZgRbhrHE74s+Y0gT23UUgUs1jGC47yo1iLtrOGZpR4nYucTXmbtGGb5MHA8dIf
         4RjYWukG1+PXQgM+WvoXqVwMd6dsnhsfeEMp88gTGi4zssIU56jIuRyN7bZikZvg2oY9
         5QQuOB2CeEqjG58lsS8yJD/HI14Mceq4BGE4194tENFkxkdHkhutttnJWQ/maa/3v5hI
         xMwybm+viLIQQ7O1Gcl1QrHWU/IAjO25g2gWwUJOMsOfK1R/rsApvajg5atogy1fnnM1
         9M2b7yzgi7/2Es3mOzVpzZnNu/farTn+N3wof0vTuOa2VGjnAwijYOV/f+sMP9a6wTKe
         WPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hx95OyaG6MqHCdsFBIXIiXsvovMiVCSH3FKPDjN/6WY=;
        b=iLLNor7y1pGGSsAXT1dHRxUWYLAsVp+1kIHrO2+ivg8+P6N9G/qFPzJBS0teHk7MXs
         zOmpaEw3jeEpEVE5K4qN1mIWFJdaFxU8JnD33LhixsfPzWFn3cjlQppJMd8UJW9Z9Wye
         gDcPYMdghpzwedw47B1rng+WGlPDTIT3Y6VrENt9L34R8CmPaP3Ucbt7YFiKGbDHUiGL
         LUf55bxrPvcLkWJ96OgLGbXhhh/5ccIey8HdWxEJeDPLlOKOw/rdyv66dOQlpMwp8rsG
         7TmRR1u5PoRp2jH7LPq6s8n811Z8KH0I3u6sHwLCFIbh8sVxXB9iTU/TscPw6JxRH8Cz
         BlZQ==
X-Gm-Message-State: APjAAAUfWwzqmT/ykPw47hVIYmrDKdQ+JQLu9KyA027vqpO1pkqdZDU0
	4fu7uDTz1WgPSAlxTMPC0oZNa5JI
X-Google-Smtp-Source: APXvYqwVxVL3Hy6fs5yv8x16VFaZHBLw+vLi/oQiTCjEj3vG/sK7eDsdh4TZ3GUPpQeDAknI3gdWsg==
X-Received: by 2002:a17:902:363:: with SMTP id 90mr4845316pld.71.1576701871230;
        Wed, 18 Dec 2019 12:44:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445? ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
        by smtp.gmail.com with ESMTPSA id ep12sm2325545pjb.7.2019.12.18.12.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 12:44:30 -0800 (PST)
Subject: Re: [RFC PATCH v2 14/14] chardev: Use QEMUChrEvent enum in
 IOEventHandler typedef
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paul Burton <pburton@wavecomp.com>, Alberto Garcia <berto@igalia.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>,
 Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-riscv@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20191218172009.8868-1-philmd@redhat.com>
 <20191218172009.8868-15-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a733dce0-4a2e-c0d7-38d5-2ab64ca4d968@linaro.org>
Date: Wed, 18 Dec 2019 10:44:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218172009.8868-15-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: UxMIs1xcsaDe

On 12/18/19 7:20 AM, Philippe Mathieu-Daudé wrote:
> The Chardev events are listed in the QEMUChrEvent enum.
> 
> By using the enum in the IOEventHandler typedef we:
> 
> - make the IOEventHandler type more explicit (this handler
>   process out-of-band information, while the IOReadHandler
>   is in-band),
> - help static code analyzers.
> 
> This patch was produced with the following spatch script:
> 
>   @match@
>   expression backend, opaque, context, set_open;
>   identifier fd_can_read, fd_read, fd_event, be_change;
>   @@
>   qemu_chr_fe_set_handlers(backend, fd_can_read, fd_read, fd_event,
>                            be_change, opaque, context, set_open);
> 
>   @depends on match@
>   identifier opaque, event;
>   identifier match.fd_event;
>   @@
>    static
>   -void fd_event(void *opaque, int event)
>   +void fd_event(void *opaque, QEMUChrEvent event)
>    {
>    ...
>    }
> 
> Then the following files were manually modified:
> 
>   - include/chardev/char-fe.h
>   - include/chardev/char.h
>   - include/chardev/char-mux.h
>   - chardev/char.c
>   - chardev/char-mux.c

My guess is that the only change that must be done at the same time as the
spatch is the typedef in char-fe.h.

In particular,

> -static void mux_chr_send_event(MuxChardev *d, int mux_nr, int event)
> +static void mux_chr_send_event(MuxChardev *d, int mux_nr, QEMUChrEvent event)

this doesn't appear to be required -- int will implicitly convert to enum when
performing the call, and it can't be related to the typedef.

Yes, we do want to propagate the type up the call stack, but it would be nice
to see the spatch results on their own.


r~
