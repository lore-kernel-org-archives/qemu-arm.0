Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp867086njb;
        Wed, 8 Jan 2025 06:08:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZPL2vHfLl0AgE9AQSIDOe85OEB8MHSESaifWuh+6Jr2PlJOYB0hsiQsahivkHQ1ns1+XS
X-Received: by 2002:ac8:5f88:0:b0:467:6c3a:1a32 with SMTP id d75a77b69052e-46c7109dd29mr59744821cf.55.1736345294200;
        Wed, 08 Jan 2025 06:08:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736345294; cv=none;
        d=google.com; s=arc-20240605;
        b=Tg+vsB78kuD0pMlDfGPV0dZmlYAug27f6nPbAUGgtHf0A6axBVie6+0xZ94HzC6Ogn
         MkA2IEw9X5uz7sCBDXKiVftcq4Hg+NyNVva2Kf9Kd7WWDtD6mRS+DrC5hqY/JLAj+OFR
         2zKUe+YSDdSdcNPlSU4D1OIcEeO3Rsu9SmiTVTC6wm0cbFyV1vkc0UY0kgDMRdqmVZZU
         M1XK0WdxivXhsqeCUx/CacqLpya0l2y8h/y9s8fWYEoqKgprfG3O0BTDkB8vBQj94umN
         0oHWvlTQKacO7shrizWs+8eUfjmTdaMDv9Zw6/afyTaD1Q682j+SxhJV9lScPwLrX/Ld
         v04w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=qpxohD9h8i5S6p2TPOGVlTOYpkDWuNlt9sflRvsbfoc=;
        fh=etlUlT9YTuxLNCn9a37I+Y2rZfaCHvtJEafpa9OIIos=;
        b=Ih+o+T3HlHcsgPdJKy7kGFd8sJwq18n09+PqEF9L3e+513G00nqPb00NvAKx0qesZm
         jns7/m39Cta1yy9Taubk8p2ZQpHBSwp21uquhP606Dox9Ci9w9GV5vvDIcJSMF+vKN97
         Hm9F664XNb+oXtr4QyzE15DIO/ncaucyB7FW8N3zBH9Rsf8iIcQvRMqGV+Z8fyGBn1RI
         dz1XLWyN1UmxEwBic4j/QBhqX99EMeCjQRHtQ1UnN9EctDgBMShw/kRW1WXxQIK7UcRj
         9yFCy0KpV1p3QxEsPEsZHEWCk184xuFQx3qQpZAoij4zkPzQbBMxfyHg+ZaVMmRTWzX6
         jZWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ipgP41lT;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3eb99829si466708121cf.223.2025.01.08.06.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:08:14 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ipgP41lT;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736345293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qpxohD9h8i5S6p2TPOGVlTOYpkDWuNlt9sflRvsbfoc=;
	b=ipgP41lTWa2ri2Qp2/EHLSNpqSsddMbauH5137Q+lKxfStsAzmgl1vSC9FL+FxMRnojLk/
	GWA7WZ4rFToYHtofZZPrqP9B6jqApQMAL5Bil66th0KWOrFTMp0n0L4Y3u9UsrL+lNK0mD
	wBnBeTNqmQshd5NR9i1z1y+kaFoRuv4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-MhQRFFvbPQSh1HcjViOmMw-1; Wed, 08 Jan 2025 09:08:11 -0500
X-MC-Unique: MhQRFFvbPQSh1HcjViOmMw-1
X-Mimecast-MFC-AGG-ID: MhQRFFvbPQSh1HcjViOmMw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385d735965bso9634900f8f.1
        for <alex.bennee@linaro.org>; Wed, 08 Jan 2025 06:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345290; x=1736950090;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpxohD9h8i5S6p2TPOGVlTOYpkDWuNlt9sflRvsbfoc=;
        b=wvb4OSuBfSTcPIfP7bwd5t/Q7V6+MPK4SCgIWwB8jFAIrP8zRxUgPICIt+2rrvfpsw
         yeELYpUQfQ2uw7/CAzxWDitlgEA+1B0FK3SBGGuprT76WL6Y2QXA6Q0nxUUJ0ZuohZY9
         wRzPIh4ObVLyH1xD8uDFhnk+8iAXa/vbGl/nX76N5sZJXG5MYbSOF6PePdGmNYuTwz03
         Zv6e0EhyD0N2uSpw2keq57Zwa6W+AnCJawARFW2sDaEbxi7XR8uuVFqGQYfbYKfMorey
         8c300fY+qVrYwecz3whyeEx8ID7PnHHqhMDk4L61MmXe+geN0l5h9LaITjPGD5csR7+9
         rKgA==
X-Gm-Message-State: AOJu0YwiJ58HiHWeprQKQifACs1AcI9+B8Z9CNx7Wm+v52ACmcQSZ0B+
	ClX+pIsiODjD9Uqg/kURbiEN6YvGKXlQg7ME7kjhEDssJohGYRdpG2PzFXkypqXBjYbO8P3i8Wj
	ETtTi38j+8lh4ylwlQFeFQAubjC4jdIEclYhyMJSPi42yYOfxXtsen/0R5uwYyPzwKFU1YDO/Er
	tNiJzsODqI7RPKyvSWgKTxuqAaN8tYaJGMPA==
X-Gm-Gg: ASbGncsQ0e9Ak2RTWZOLjrjtYSiHT+FE8bxeOaad9mkmp+dMJQpbiyeZrkjlLTS6+WN
	0trZJrBY1DQe8FuFI5VbBK1yqGjXG2SHMXgIDsWZ2cN5HIk62yi857bqiMy58WncC1LdF2IAU+f
	kcPUXy+2UtZJvOau6d/LrSqjdVXKkPb5uymPdcoOr7rPWX2dRUSox9uvbyUg3QpQSdimQX4bxq+
	KELfnh0EJRGZCXQtAisL956FSxEXoTlYN5YQm+gFFdZAySM4s9EUy+caHoQ+tBjg79zufcIvIQt
	rl7DUA==
X-Received: by 2002:a5d:598d:0:b0:386:3711:ff8c with SMTP id ffacd0b85a97d-38a873067b9mr2494037f8f.23.1736345289804;
        Wed, 08 Jan 2025 06:08:09 -0800 (PST)
X-Received: by 2002:a5d:598d:0:b0:386:3711:ff8c with SMTP id ffacd0b85a97d-38a873067b9mr2493901f8f.23.1736345288473;
        Wed, 08 Jan 2025 06:08:08 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8289a0sm54475531f8f.7.2025.01.08.06.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:08:07 -0800 (PST)
Message-ID: <cc39bbff-e5aa-4b24-8cb1-49148c370ff9@redhat.com>
Date: Wed, 8 Jan 2025 15:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/32] tests/functional: add zstd support to uncompress
 utility
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
 <20250108121054.1126164-20-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250108121054.1126164-20-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xZPs4oDZB1rPVS6ARumLhDJCEx1ixK_ML6IvtAw8AK0_1736345290
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Seh4CC14w3t6

On 08/01/2025 13.10, Alex Bennée wrote:
> Rather than using the python library (which has a different API
> anyway) lets just call the binary. zstdtools is already in out
> qemu.yml so all test containers should have it around. Tests should
> still use @skipIfMissingCommands('zstd') to gracefully handle when
> only minimal dependencies have been installed.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>
