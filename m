Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3846862njb;
        Tue, 10 Dec 2024 22:37:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJPaySUzRgFVpoK3Go9uB7byZHuKfrah7XhtYfyZ/TL0apLUbWID0GwMF9Gb3f6k7oAC2E
X-Received: by 2002:a05:620a:2709:b0:7b1:44ee:644d with SMTP id af79cd13be357-7b6ebc476b4mr285967985a.10.1733899036839;
        Tue, 10 Dec 2024 22:37:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733899036; cv=none;
        d=google.com; s=arc-20240605;
        b=H44Vu7T8mML9XDbMLcp3X3XUVfu4+7xH4MIVjSbXqhLwWGNUVwezacncoihj/760yu
         lVyccFt+q9ZSj/Sgq533XPxX6PZK5aQZuiZo6TpX6Nkv89c4H9Oj6hbZmDBWa8sYWxUo
         vS4siGvqh1K/TWJs/QgfBnqi7zvD9aTt19gj/lOu9/0QNUv8CoPZ/hh/mNG2vL5sctpg
         Am+BzjNz+ZjqNQ6VWXk2SSd4eSC1Gov+8F/tawrG49+DMUSO3XKySJmX7ltofqH5fFQi
         UaEDy38lQhcKFnjx/OSnKLQD3ToK60pg9a3+j6W7/CUr7BSMzs8J/CkFrBq5DZ4hkuFz
         hHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=UqA9i3tjJMDAjaoOUbpXYGF4QW0YsxxNvnVY6xKL2c4=;
        fh=PyRPp6p7Zb4yzib6tbXvkfdudwkdHT8PPxsBOu3pTV0=;
        b=j+Ze4c/qBee0XJ4peeRcYILH45PC/RkcXX4iyf8Kg6GfLKzjClNX7NAGsDI5vRAoru
         vVKHRwoEhD8GSVUOlAK7iX3WtwAZcN++UIx9axyDUM5b8n/NynduxpzpmnIeLu9kZuVK
         wRNIJphiKV6vY2ODyfG7un17qAbSff2vT9CqYRi2+T0CTog3EvmUFdgC5/Vlo4NuavoN
         f9o+Blu2JH3DZ5BY6eZcVr7qDyxcrobfqacbqBiy6MMzHlxvLj56B+7HxDchpBH+7yYR
         fRJEhNMx71l01hOAwPAruidtn1pzE9bFnGkZADESechWxb5mh656YfO6z89PvrqHzTs0
         xEWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DuSXQU+e;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac29b79si155909016d6.455.2024.12.10.22.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 22:37:16 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DuSXQU+e;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733899036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UqA9i3tjJMDAjaoOUbpXYGF4QW0YsxxNvnVY6xKL2c4=;
	b=DuSXQU+e7kPm3KToV7WgdigDGE6yzdM92mv7ETwlu7PXNEr0T+Nu3G7xl44ieQxhBQ+O7T
	H3meTfZArtp8Atrx14r5WQdpsWG5Fu6gC0oSVz3Q9PgiUQfDAUprmnVNIpC7Takaox1wP5
	qJyOAFcfRuB0cRK+uI6UGSITeEeJxuk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-xziSNPulM_2qJBhFNx0H3A-1; Wed, 11 Dec 2024 01:37:15 -0500
X-MC-Unique: xziSNPulM_2qJBhFNx0H3A-1
X-Mimecast-MFC-AGG-ID: xziSNPulM_2qJBhFNx0H3A
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa68b4b957fso340139766b.3
        for <alex.bennee@linaro.org>; Tue, 10 Dec 2024 22:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733899034; x=1734503834;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqA9i3tjJMDAjaoOUbpXYGF4QW0YsxxNvnVY6xKL2c4=;
        b=kSg3eexlusC6m6Xy+d3vQIOG9E5lBYd7vW1BCOj7rOzar6x9UtDHfROz8aKY4HKPBP
         1AVRdWKkhfimH1SQhBkQBqxaBoywhK/h+Xy2epXAxOx5sFnvoX3UxBu3uUwocgwtYgJQ
         aUJjR3y+GcPR0D4LX7hzlPiaWavN8u2YHVukmAJqufs99rQJCEg41f4Ix51pYJGfpSK3
         DTHrJ1k4d7ndnxYT5UpJOhE4y0ZLC+cceG1Lg6W5M1sPW9N5Pv2PKWHVPmeKsbzkR3vR
         CemTEZbMYH4yGU6d/46hqQQSB7ymWKiE4vUjlosdbIxv19dKVv87jZWvzdgl3uHpRcau
         i/aQ==
X-Gm-Message-State: AOJu0YyN074oqlrH3ICpAAttUE9fAZ9N+duz3yOnIvqwAgO/fxeOHicO
	QerqkEBmAod6yJ9/vt8bN1eW/H1LPoe3Ok6o+DX8UpKOddmTbqAjPp9l7mGLmiXe2SkRkayXczn
	34w7yDBC0zoFF+RxkH7wA0QSWkFA88WUKma7dSDoEWgxx7IJyDHQIAMupclfYCu3DLlwQWk3EgV
	ZFx7fWZmwh53/lAGMB7h8lH+N1BnWdMmx2qg==
X-Gm-Gg: ASbGncuf0wTwTil2SA5evhE+9sFCcWmacZcgk8Hmd7pHASEZwdV4hkA0pIDhhzs1RMa
	W0hDXX/FGFBSQ4cGubnqEbuIozXzp+6etbgN/yyfoqKCcw3LJzQQSemczr8aPrtGR/BE0KkDVR6
	wisbcdotyMSdJLQTZpGnUR0daKKnZZ2N77f/QGzSjwDcdCQUKXyocI1SIf7A7zIAqdnrku5gfvx
	5QJO49dCHdMsPKXWTbqffLSlxBWaQMUnwGLL9Ja7do9z/6RfPZlsdhCl0JkeHQNnIH1LTmaaZg6
	dvA23/8=
X-Received: by 2002:a17:906:6a0e:b0:aa6:96c4:ad58 with SMTP id a640c23a62f3a-aa6b151887fmr153549566b.61.1733899034188;
        Tue, 10 Dec 2024 22:37:14 -0800 (PST)
X-Received: by 2002:a17:906:6a0e:b0:aa6:96c4:ad58 with SMTP id a640c23a62f3a-aa6b151887fmr153542766b.61.1733899033642;
        Tue, 10 Dec 2024 22:37:13 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-42-51-17.web.vodafone.de. [109.42.51.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa682772365sm449668166b.200.2024.12.10.22.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 22:37:13 -0800 (PST)
Message-ID: <31d205c5-9261-4453-ae6d-2af0c9e62072@redhat.com>
Date: Wed, 11 Dec 2024 07:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] tests/qtest: move clock_steps to after checks
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
 <20241210204349.723590-18-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241210204349.723590-18-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gbqEKw5VNyZXpyHFbQw3kZvtTyh_aLIWfwj0RCbCoM0_1733899034
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zS231foh1qRQ

On 10/12/2024 21.43, Alex Bennée wrote:
> In the qtest environment time will not step forward if the system is
> paused (timers disabled) or we have no timer events to fire. As a
> result VirtIO events are responded to directly and we don't need to
> step time forward.
> 
> Potentially the clock_step calls could be removed all together but as
> we may implement async behaviour later lets just move them to after
> the principle check for now.
> 
> Future qtest patches will assert that time actually changes with a

s/with/when/ ?

> step is requested.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/libqos/virtio.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

With the description fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>
