Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp651234njb;
        Tue, 7 Jan 2025 22:42:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMH99j9k0ZCFOYF/rKnGMi/r8qVK6WtubgDZRc67gImHJn2IzBMScd4PeCxdg9jKMJED9+
X-Received: by 2002:a05:620a:2a08:b0:7b6:c92e:2e74 with SMTP id af79cd13be357-7bcd9709396mr225191985a.20.1736318525263;
        Tue, 07 Jan 2025 22:42:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736318525; cv=none;
        d=google.com; s=arc-20240605;
        b=lnSqbANzc4kqPte2y/abuH8MRAp6Ol5IpB4CukkVAXpWl13lbP5fRBPdMFOpVsyfRB
         LpEhkCx6Jq47sdjt5jhMZMapY2LEyRGwvhMzs5Mvre35BfngeLBCsIdhjRUkfxpUH6iv
         U9udPKWd3c3jIxkU87USfz2SBZK6OPW4JlhWfTb5mQfMyGtYpAkPzP5tVvNb+O/tphMf
         Hx3Ls9zM956WPsJBBI5ijzxfI5XqeEYsz3Tbr6JvcJHojq/+8XWvgsScHUjPOuvXmTI4
         nQq8ZM3BwTHA/LhwJRgTHAaO9N3N5C9wiUoEa6oPAIfapcl5FfmMP3rMklln5Mtqv6lP
         5Tkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=XhxNRVTCKtc9/WFiD1+tRaBv/KR4USKjJ+CA7V9EstM=;
        fh=sANZkUZC6MKnhiWDQo2GZcy6gQ38YYjN+b7Qwq+md2s=;
        b=PhKSiJy6s65s8znC6Y+NDcptZFk8IvWE7xN0fIO6GKV6RfJ5OhyEBm6+/KE8oiDSUG
         eku88fEmBwyRsBoEiakrFCasUWtd7T2cDKZrFsaPVw2erXFk07JmCar38Il5fvbSyOQ7
         HNHc7gJHQ4Zs4Nq2QRTX25p5b7fIzWQgFAt9ghioNlcCA3hsGmBh4KYqzN4itLxujzAW
         B0yWyUeuiuqV7fXOE1anth3jgG0dC3g8RptxeB7wdDr4BN+rJU6jtnZzCfxk0BbHvcMB
         8UIa7H5bAneUbJOD5U/rhUfEewWXhmucPF6J0TaTM9NxILGvxElv9YlqExm25mxZeoAl
         H2fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JthrPfC9;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac2ad6d0si1047163585a.138.2025.01.07.22.42.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 22:42:05 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JthrPfC9;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736318524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XhxNRVTCKtc9/WFiD1+tRaBv/KR4USKjJ+CA7V9EstM=;
	b=JthrPfC9Au0HFN26Og31rnqPk6wq0+WVxqRt++yivbrap93YDE7Z1BK6WpdS7cqOQmfJr8
	Hv84u2T2GB3360BlFLQO7WWwnDtHpTmiU3vAkoJGplT+YJ4uBlCMs7gVHSMx/bhR49zTYT
	KkgvRSM4mS4qihOT0hVLWEHsYNESlAs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-Z08cIMsGOEiOiIMUqjoQrQ-1; Wed, 08 Jan 2025 01:42:01 -0500
X-MC-Unique: Z08cIMsGOEiOiIMUqjoQrQ-1
X-Mimecast-MFC-AGG-ID: Z08cIMsGOEiOiIMUqjoQrQ
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d3fe75a9f0so15313154a12.3
        for <alex.bennee@linaro.org>; Tue, 07 Jan 2025 22:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736318520; x=1736923320;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhxNRVTCKtc9/WFiD1+tRaBv/KR4USKjJ+CA7V9EstM=;
        b=hhScCmX2YWuwXbYUZ54zuJc9O3TFdhhpRVriEFpDnKPY+/7YcG0EDMgUQJCuk0UJBb
         Nv6Muz7RX/XLwXgMG81bjTjvGrp0zj/JPexc1+e6ZsRpMirH4YPpFvyn3KS76q9Xsa07
         gz2bzsRgJFOC536Ggeg7sKflUTk98JI8vlmor4LtKfN+wMxEvhr0JORwekbz6ma3hkmE
         Oj/f2y7DvafMMBYPDugnawoSO6oG4fMLg4Is5u7CxYzx13ujWCmTNa4XovwZC4Y2uKKN
         FUgIIXlKuVk8roXla3X8WspZtZu8N/4K+667aFu5lciKIE9c1x5TyFrWmI9lDXYew55m
         6Ncg==
X-Gm-Message-State: AOJu0YwsVe46x7nCiPqgL/gj70pxNizCzmZXQJWAhofzGzFE2KSo1iFs
	8CeKHOvkrdS1C+EiagRddonLsq0aQfQI9EELQnutVtBikaUCDBhmfboBFmC+HUclNgdG9doGHYJ
	GJzVtJae8ZnaYhpn4s8Okh30iT+K5edCulSdZ/cv9VQPQIEjmgy9qVNQZZrR5Ww9XxO10+/sNQI
	E7sHDbNyffqaKWrYD9m7ONESh6mtGk5ejw4A==
X-Gm-Gg: ASbGncsj7JUAGqSNyPknQ7ThuhvNoyFPDo15aneIrHIgp1SMhqnfry3wk3hgpVmKEWe
	8T96p5pEsf2KgH1Bpxr6sjfQ4S5Vy6mFNgadTqhXp7xwiiycLtbWwMz2FCSEk9EzHL/bZeI+bCg
	yDSetL8ZGiHCw6Bg2aHufEQM10Euf61amQ+Kx2rU6zzx8DIITIufedYAsn9JxtkPZp7xqDkVgyj
	OcVg/Xn2f7ua+1Zc3pbsdThrFd84Xf1nRmapdEbMtnB2tbxqh4PrF9GZ4IysX5bugOW7Jua9/ad
	j/Ap4+Wyx3Le
X-Received: by 2002:a17:907:3f89:b0:aac:501:5629 with SMTP id a640c23a62f3a-ab2abc95256mr130842066b.56.1736318520490;
        Tue, 07 Jan 2025 22:42:00 -0800 (PST)
X-Received: by 2002:a17:907:3f89:b0:aac:501:5629 with SMTP id a640c23a62f3a-ab2abc95256mr130836366b.56.1736318519970;
        Tue, 07 Jan 2025 22:41:59 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-182.web.vodafone.de. [109.42.49.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06da76sm2458615966b.194.2025.01.07.22.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 22:41:59 -0800 (PST)
Message-ID: <b7618b1d-a48d-459d-9768-40830c866560@redhat.com>
Date: Wed, 8 Jan 2025 07:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/29] tests/functional: add zstd support to uncompress
 utility
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Nicholas Piggin <npiggin@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Weiwei Li <liwei1518@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 qemu-arm@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
 <20250107165208.743958-20-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250107165208.743958-20-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3R53jyuINaBhhdd6PlyZD9K6g1VbAbSTmRO8leJMhSU_1736318520
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4Kfc0zwtThhB

On 07/01/2025 17.51, Alex Bennée wrote:
> Rather than using the python library (which has a different API
> anyway) lets just call the binary. zstdtools is already in out
> qemu.yml so all test containers should have it around. Tests should
> still use @skipIfMissingCommands('zstd') to gracefully handle when
> only minimal dependencies have been installed.

Thanks, sounds like a good idea to have a common function for this. Just a 
comment below...

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/qemu_test/uncompress.py | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/tests/functional/qemu_test/uncompress.py b/tests/functional/qemu_test/uncompress.py
> index 6d02ded066..404eee1f83 100644
> --- a/tests/functional/qemu_test/uncompress.py
> +++ b/tests/functional/qemu_test/uncompress.py
> @@ -12,6 +12,7 @@
>   import os
>   import shutil
>   from urllib.parse import urlparse
> +from subprocess import check_call, CalledProcessError
>   
>   from .asset import Asset
>   
> @@ -38,6 +39,18 @@ def lzma_uncompress(xz_path, output_path):
>               os.remove(output_path)
>               raise
>   
> +def zstd_uncompress(zstd_path, output_path):
> +    if os.path.exists(output_path):
> +        return
> +
> +    try:
> +        check_call(['zstd', "-f", "-d", zstd_path,
> +                    "-o", output_path])
> +    except CalledProcessError as e:
> +        os.remove(output_path)
> +        raise Exception(
> +            f"Unable to decompress zstd file {zstd_path} with {e}") from e

In tests/functional/qemu_test/tuxruntest.py we had to add a

   os.chmod(..., stat.S_IRUSR | stat.S_IWUSR)

to make sure that the write-protected compressed assets are usable 
afterwards... Would it make sense to add this here, too, so that the callers 
don't have to do it on their own?

Also, could you maybe change tests/functional/qemu_test/tuxruntest.py 
accordingly to use this new function here?

  Thanks,
   Thomas


>   '''
>   @params compressed: filename, Asset, or file-like object to uncompress
>   @params uncompressed: filename to uncompress into
> @@ -59,6 +72,8 @@ def uncompress(compressed, uncompressed, format=None):
>           lzma_uncompress(str(compressed), uncompressed)
>       elif format == "gz":
>           gzip_uncompress(str(compressed), uncompressed)
> +    elif format == "zstd":
> +        zstd_uncompress(str(compressed), uncompressed)
>       else:
>           raise Exception(f"Unknown compression format {format}")
>   
> @@ -79,5 +94,7 @@ def guess_uncompress_format(compressed):
>           return "xz"
>       elif ext == ".gz":
>           return "gz"
> +    elif ext == ".zstd":
> +        return "zstd"
>       else:
>           raise Exception(f"Unknown compression format for {compressed}")
