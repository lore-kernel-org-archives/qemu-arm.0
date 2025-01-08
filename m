Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp868258njb;
        Wed, 8 Jan 2025 06:09:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjrOuGJLjU1YFzVCogWpxsLxRF7y1gIDDWyqkF/4hVDSFyl5cJiJsibC6jd36MiKouqdra
X-Received: by 2002:a05:620a:404b:b0:7b6:d65a:d6ea with SMTP id af79cd13be357-7bcd97c3447mr457262785a.46.1736345385510;
        Wed, 08 Jan 2025 06:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736345385; cv=none;
        d=google.com; s=arc-20240605;
        b=AswsRexPSTSR/Fd7g+pqabATsWgDKO0yAdlBnRumstMpA5Sp8rqM7ATdFIBIfpovg6
         BnY6OZE9hlu3hhLoGRlC2schYUX8mYTc/UJuyWboQnLzdu4Auf7xkxYiWwpdlZ7eE8rs
         npP4EWQ3WKZsg5ROTwMo9ZHmRDOh/S1DhmjC3syUEx+m+ijIAjtTszx9LPeXYvX2reX/
         3brLg9OCfu6uywjdWVZCWsyBL01bQjM1rmnrD5wr5DddcG+Qv3no7cytXBf4UQ1qAhi+
         YgAGOc81sikt/cLRBdgEiVSikPKmFtqdoH7C0cZaoC3Z4FBCK61f8KEk9nKoN7rn1neG
         /HyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=MrFJNaOUOPaaan1zaHG7MPWllkYWyC8JnO9yPqggt/g=;
        fh=etlUlT9YTuxLNCn9a37I+Y2rZfaCHvtJEafpa9OIIos=;
        b=X+y7mTCLF02Bwg11gKiJPrrBOLu+RICezIpxo1+Pdy2GcNmEKSyrruvrWwVCgjEhTO
         m15oTcQqxaJgncZXhidzi2/fcTV99WcUUGm0JEJxlccRKbmVrAl10NigP++95hth22xX
         B/yV48lr3tIrwiZMmaueH2qnWqb0p4hQNphxFpO3o7b8SMKkmh0hYreeuFDcHl79WFDv
         /FrCmGYFog0gUl39kqeC5FngP2c2X+kd7AaO4JN0FZ659pWcGWNijbh8+wV9gcAAAC8W
         5H6Eq9smJl2Y8t+SURUVhR8bvUlcurNGvaRtRIFlzftYWT9BweqIZo4OxlI3aSygZCMc
         8HLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZS3J/efb";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4ce8c3si4972141085a.440.2025.01.08.06.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:09:45 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZS3J/efb";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736345385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MrFJNaOUOPaaan1zaHG7MPWllkYWyC8JnO9yPqggt/g=;
	b=ZS3J/efbfN1UXg5kgFT89gd7Pf3W3TI6JszJ62NFNh9/1OmOeJdGB7LRZgYgt0GSaC4bUJ
	Xr9XuPnpVN47Lren/6iTfO/bPeuEf5F8M6fFTbhXzeBA8LM9im6rpuUsKdhwRwUQIOg25v
	fdMlRYd9U2NsIXBQfFojCd5GdHLeNt8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-YcyrN7bEPyGvklmITEaJYg-1; Wed, 08 Jan 2025 09:09:44 -0500
X-MC-Unique: YcyrN7bEPyGvklmITEaJYg-1
X-Mimecast-MFC-AGG-ID: YcyrN7bEPyGvklmITEaJYg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361ecebc5bso49792205e9.1
        for <alex.bennee@linaro.org>; Wed, 08 Jan 2025 06:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345383; x=1736950183;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrFJNaOUOPaaan1zaHG7MPWllkYWyC8JnO9yPqggt/g=;
        b=nZfMBBd4APyyl+1HIhPzhJiX331PzGMbboo6JCWbTXx9v18RG3jyONy7xI1U77SkIG
         9mAIUGjgoU26664PK28rxqDj5bssTIo1n/vKgCLLgbRRhm0SYOGCN1Xj41nKMIWupLrE
         na8CW6YVy10QDPtJH/eoZjQ9a8f9b6CNEw1CqH4VMBxK/hKRkRt0Kyx1hpA9tQXB9GUJ
         eRChejAN66mELFo9qmMpzqSoj4S09wo9sIxN4eaguD+LEFRuICuLUPdF61JsSbGng5Bv
         EtD6zI9fc5lmAuYYViRF21s4mr7v7J/xt+y4y9zLXEfsKIwTh6rq6uLiVgYWlLy8OrGW
         APVg==
X-Gm-Message-State: AOJu0YyXk1hge/CX4k/A8ig68dleY6r7nLWDb1jEW8w3Thy5BfYdRWjm
	hljGfVs4sfUkz0/yhQtzR6tQqniqBHwLMb8nzZRoxa+pkt2+OKR461u5bqZ/2u3FrYs2n6a9/tO
	BjH03Xvxd8Jnxr+WLGFiUN7MVfNH2CAySL1hXMR0IpZ2QoBcXrg1Tt0Pu+X5BobEPim9XiNCghO
	W6ptV+HjCMud3FZ/NAXGkLtNDWl3z5hKrxLw==
X-Gm-Gg: ASbGncuNaF03fYv5Okxz3SunG9/wAqKxgfhKJfj3IJHkLKvVvVbGM5OpyyHNDnHLoqj
	BWmvqNw/cYaIJCXk2DfPV6ccDKvY2cuSCQ7gEx1gMDPWaj4gyj7Gv3ALjThsS3p5/zlALtfNIXi
	j3B+OLRMGFkh77hoYaeIXPaoYRPl8o8E6+AUcIEcT6NaEIF33e3fQeVgWiabWI/eN2P4O00JOzZ
	JyEWopcP/gJKO/XCnjd5z65A55NJ1F2Qdg1PKBOj3R0xxLNRxgS+MavnZsVvKffxdM3YZDKrbcQ
	ZQU3+A==
X-Received: by 2002:a05:6000:1ace:b0:385:f00a:a45c with SMTP id ffacd0b85a97d-38a87320a44mr2485844f8f.57.1736345382874;
        Wed, 08 Jan 2025 06:09:42 -0800 (PST)
X-Received: by 2002:a05:6000:1ace:b0:385:f00a:a45c with SMTP id ffacd0b85a97d-38a87320a44mr2485760f8f.57.1736345382342;
        Wed, 08 Jan 2025 06:09:42 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1cesm52212856f8f.64.2025.01.08.06.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:09:41 -0800 (PST)
Message-ID: <15fbe517-a646-4a21-ba02-a4a00ece641b@redhat.com>
Date: Wed, 8 Jan 2025 15:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/32] tests/functional: update tuxruntest to use
 uncompress utility
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
 <20250108121054.1126164-21-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250108121054.1126164-21-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _BYytSnxQpmlOpV0L4_G9M9pkDXfhnkHd2U0JI5o8I0_1736345383
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Kt+WmirK41J1

On 08/01/2025 13.10, Alex Bennée wrote:
> Use the utility functions to reduce code duplication.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/qemu_test/tuxruntest.py | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
