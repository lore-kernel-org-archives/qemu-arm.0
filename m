Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp878463njb;
        Wed, 8 Jan 2025 06:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErgp/GF//py4CVKQrf+ZxUe5M3vWKUOA19Jj9ZJndsy05ICWbu/OyukQ12MINyGMamrgqh
X-Received: by 2002:a05:6102:2b89:b0:4b2:5ecf:d124 with SMTP id ada2fe7eead31-4b3d0dc0500mr2464778137.14.1736346222952;
        Wed, 08 Jan 2025 06:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736346222; cv=none;
        d=google.com; s=arc-20240605;
        b=a2aQCLHk6b0qcWw0Qr3u0IkgNBd5q7+PfQRygwPGl09Kt3d2YEgA4rOKWg3yi6Se0m
         tr8dsgHKhiRadaygWm2JCpWALDnjvdEm7gbN1rYrWv+ZHZIR6luXzc3WEvL36d/VHGHj
         +9dT+v2tjsIk0OeAE9JUYgoGMFtkjBUtdApGlsi7rr4fGPiwu1o0EJlsmZQIC8eXBATS
         gravZibuuKZ2XMKaL0EMyToB9kQ3qkLdQK9Rqo6TB7jiNZdjT7XH7wK1+Q5WdVCrmpjz
         hN1hJeQM4wMoWKWtAjqvjpY5Lqkn6klI6YIVCbkOnCTCxS+V9TwzGpPwdxyrR3fohLtT
         Cehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=K8lISznkSsY7JYLY+0cSfE3/Spssu6TIycJ1SVGaqA0=;
        fh=etlUlT9YTuxLNCn9a37I+Y2rZfaCHvtJEafpa9OIIos=;
        b=UEn7A6KDEmAYzWrB/0mZt3chFhpEqp6eK/jc+nSFv8lyVarXevhR6qSNd4sLPH3tXs
         PbHwUHmfsovWA3Rpf/JKG4qCMoFvIagte3z/OkS54vVIJEAdj9c9Pq9Bfw7AJmXb/35s
         S9XzZ8yDwgevLqWhntbA1oV1Fq56IWX0gUKfMRlzf5a4GzjSI1MiyqHDSi5Byo5dpmrL
         B3s41DlQcS2AOG7Ywyf3n9b2hkVsv9TEZx6FMxvYTX9R2NI3K/E+pQI2id4yL2vMhAON
         dI1369F5T3EWeb3UcU6vkarKld23n1rGW4go6RW7vStPzodfoeLJV2L8yzPfRH12X9Cp
         fpAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T7dgWD/E";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2bf9ab84csi10509368137.178.2025.01.08.06.23.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:23:42 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T7dgWD/E";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736346222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K8lISznkSsY7JYLY+0cSfE3/Spssu6TIycJ1SVGaqA0=;
	b=T7dgWD/EiOMat/A4sY5++JPVB3h49sYWVCHlTctOzmHzovsjUgyCZupVv8ogXRMlirscC2
	/y9lYlwnwD4prmNvydgaMaVuGQkjSI6IzKIsIPN4I+2HzCSZx9KQDxyDOHqFbosMAlhHCg
	wPs+j35FYfLMAqhTfT7a7NMFBQ6GfbA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-XJY2KJgqMPaEaMUSKn0PjA-1; Wed, 08 Jan 2025 09:23:41 -0500
X-MC-Unique: XJY2KJgqMPaEaMUSKn0PjA-1
X-Mimecast-MFC-AGG-ID: XJY2KJgqMPaEaMUSKn0PjA
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8edc021f9so278823236d6.3
        for <alex.bennee@linaro.org>; Wed, 08 Jan 2025 06:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346220; x=1736951020;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8lISznkSsY7JYLY+0cSfE3/Spssu6TIycJ1SVGaqA0=;
        b=G93hzEABFS+Hs/y33z8GChDvINVCPnf1kutRray9n2nnrEiEc6YkFp83eu4vGca/fp
         w7NcJuUAmo7sIkG4CnCtBN63GJaf21hBwWorFHgn6SbwiTjZpzKdA/YwU0zuuHhST3u2
         7ZYYTTvNBNV76rh6QfUQxICOWFJhf03GclHzeQh1Moy3PaVIonmQ/yXGjV84b+62TBtZ
         4w3f5vnQHtOSxZC+dAWE4hh2gRl8SDcZPCTzNFEZ5Xs8HhN6VQI4LPpkkN3KaCs/MXcz
         dx63Fs81ZsaLFxTnDDo0iz+H9NwaWhw1vQx71X302inA2G/Tr4CiVD18IMFbK9vU0PK8
         6jaA==
X-Gm-Message-State: AOJu0YzvLE0hRhelAhxcnI7Khwjq8rTymEiiIG5GJNW3qOZ59Szi7wze
	9XTYhM1lovJEoEkU07jQUQA5IhKrZ7fWDIjOSoeyj5LUPWe6WcdbYIm52b+Z5ZMIdWfl9HUV4Bo
	puhlDX7klxmoL80zkv/cPafs4UlWOrr8fo+Xrpjf2EuCmM979dXKyJfsCA7tAHHjKRHNgeBpzQs
	SvVhhg03fRYHX+mt+ZEPB4K35sGIvKoPh+Ew==
X-Gm-Gg: ASbGncs5BYkxIYNSK/4bYbzLWPZja3BKfUv+LBtaOmPfyHk1p7W66M4PNhvPXR4T5YD
	V/X8wL8XBKuH0zGmTuM+om/aVJv0emGXHfIRJgVcaNf7cias+Op4EImbS30pAHZWHPJ7NrhTtUs
	CwEtT02WZdhHa86tzL78EjcAtlCulV78Gwr9jWV2d0HkyFciQL8bzr6l4O43ZwEFyIx8kpsX2HH
	S1d/hGS14l8iGidvj2jSulkgF/zPp91EqYWr6wQKJxainY5A7b4X+inmHvRBfH1Mq6VZhgR1AoR
	lw0CQw==
X-Received: by 2002:a05:6214:21eb:b0:6d4:215d:91b9 with SMTP id 6a1803df08f44-6df9b2384bemr49512606d6.11.1736346220717;
        Wed, 08 Jan 2025 06:23:40 -0800 (PST)
X-Received: by 2002:a05:6214:21eb:b0:6d4:215d:91b9 with SMTP id 6a1803df08f44-6df9b2384bemr49511676d6.11.1736346220188;
        Wed, 08 Jan 2025 06:23:40 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d3db8sm190818236d6.104.2025.01.08.06.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:23:39 -0800 (PST)
Message-ID: <fc682b87-faef-493a-9edc-e83e7fb1fc5c@redhat.com>
Date: Wed, 8 Jan 2025 15:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/32] tests/vm: partially un-tabify help output
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
 <20250108121054.1126164-29-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250108121054.1126164-29-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yDfwituQYFByZl9OTCLjVYOzoNWRdVYLagd_9jB4-dY_1736346220
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 29MopLZSBKlF

On 08/01/2025 13.10, Alex Bennée wrote:
> While the make syntax itself uses tabs having a mixture of tabs and
> spaces in the vm-help output make no sense and confuses things lining
> up between terminal and editor. Fix that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/vm/Makefile.include | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
