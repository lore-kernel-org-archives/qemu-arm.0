Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp197637ejc;
        Tue, 24 Jan 2023 23:45:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/OrqBSC5N1NEd1/RcECxGqmBqXCuGw5Z3aiK1bdkh1r/bgHnJkAAUdbPkcWznzufhufPkI
X-Received: by 2002:ac8:5756:0:b0:3a5:c851:29ff with SMTP id 22-20020ac85756000000b003a5c85129ffmr2721909qtx.23.1674632704984;
        Tue, 24 Jan 2023 23:45:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674632704; cv=none;
        d=google.com; s=arc-20160816;
        b=qONjwJFkTsQ10PZYPp3vPslJelksdZfMgDslHH17qqKzmIR6lPfEal1PbZAu9SPANL
         GN6hnz/KT4BuRCz3hyt69DI3M8r7Toq3+CyG4fo1JasIjBDvrU7a+1Q3nSBSwkH/ZPUo
         pYhhw29xjMFa0D4x5dbhjsh0yQWsmchXa/VptejslzayjE4ZwGoZ1T+XUaB3EcHsADfP
         963EHyqzZpSXgK8YBl9DaBzCfSUuhnd/iM8bVRX3c+zdrR8G0vhb7qnQS+A13NMKvYwN
         Rdr3H2kN82EQIxNBqVH+RONfAO0zsUj4s59p4WzGlOeuYuDrEQC+ysiizvsxdWHaHTAo
         Fvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NZXrEOZNrjD0LfHadt43o6PEtuIH7GBerz/Kzc4W35w=;
        b=Y3loOorRUvpb9qO364iNWtmxSMP9khIM/ksgz2+bwTismH2OjQT65AWZm8/72nvpVI
         TVPhDSzB6AdksXH17Hp1NRUsaonpGnUMjE3wM1km+jBLkV8bhGgX4W52hiAgcBYIsdBP
         RcOnR/Je+qhvL2xUbFoA7Rdc6tz/spF2UQTZ7+n+4KY7owdEvEM7pHV24vmjHYPzGdP1
         J/RJ2131PQsrUBRSxrrAQlulTUsZ/AImxgJCupmV4LkWQmxBgxsCJllMFRcMK5AEI3SH
         QJsOqF85WponLBBXWB919VSBTjeClie1kOUL8eYQmKzp3k9BGyUFzLJxE3qMNn9zXkn0
         C55w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HkwNUkEV;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v19-20020ac87293000000b003b62b4723fasi3283994qto.522.2023.01.24.23.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:45:04 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HkwNUkEV;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674632704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZXrEOZNrjD0LfHadt43o6PEtuIH7GBerz/Kzc4W35w=;
	b=HkwNUkEVVLLaRIr95uYNyy6Nj8l7U0CLOGQJDDAM1ZWQctNGYgv+eysEMf82kSc9g9XxzL
	DpIo4rnhbPV40ig6Ld6wPat/TDPWZm3K5HLw2leDaDWKAMdxlnuXDAa4M+LJV/57ihhBHI
	rlCz5MezjfFqiMAGSrBD60/PXTyRYpI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-329-uA2pzhpFNT2lhIb_gjIHxw-1; Wed, 25 Jan 2023 02:45:03 -0500
X-MC-Unique: uA2pzhpFNT2lhIb_gjIHxw-1
Received: by mail-qk1-f199.google.com with SMTP id s7-20020a05620a0bc700b006e08208eb31so12430747qki.3
        for <alex.bennee@linaro.org>; Tue, 24 Jan 2023 23:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZXrEOZNrjD0LfHadt43o6PEtuIH7GBerz/Kzc4W35w=;
        b=6kL45dMZKx7fF0IzgacJywsiKtLH1xWlqKDaexM1DWppTv8HeuInleNVY/vkNDtTFA
         o295PVm63GsxVQy8PR9nCoKfA/RDDcCmPeAiIfobxdDVlsQg1rdCNxdpzuC/go1DEi4W
         VCxPq0G9+lBwlpaCpJ8ZXs0YvVCtCF51NRfTHp8Rhn2RRIz4xQMJq3JqBR64r28jYPV3
         islOgC2WDklVqacaCfLdF/bTd0K5deHuavinEjgx07oXEG3dr6NbdoaAz0NAE15GsdxW
         3eKL6DlGoz3BWyoPmKXDC2jKnxKTC33uM1q/vqC6mkHvrS8B0BFLNbge450JkKjSqQ1v
         5/5Q==
X-Gm-Message-State: AO0yUKWTz7sst6oq1wnbXtfbP16DUGqOEgMQas7fP5CGojob70ONR9uq
	NoaB4fmTLYe7+1mhajQe5Utb9bY7QJ47N44ApkbqkbnpGvckALBM3WXPAdv5VNr/BMhs223xJtQ
	1liFz3vn8e0ygPvMLOxCYGDhl1+6mNI1L7/5bY4gLNIHyaxkFPD20rnYBCEPbIBes
X-Received: by 2002:a05:622a:14e:b0:3b4:d5be:a2e0 with SMTP id v14-20020a05622a014e00b003b4d5bea2e0mr2721102qtw.20.1674632702681;
        Tue, 24 Jan 2023 23:45:02 -0800 (PST)
X-Received: by 2002:a05:622a:14e:b0:3b4:d5be:a2e0 with SMTP id v14-20020a05622a014e00b003b4d5bea2e0mr2721029qtw.20.1674632702190;
        Tue, 24 Jan 2023 23:45:02 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de. [109.43.178.209])
        by smtp.gmail.com with ESMTPSA id y18-20020ac87092000000b003ad373d04b6sm2830638qto.59.2023.01.24.23.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:45:01 -0800 (PST)
Message-ID: <92d370f1-a06b-75e9-469b-944674d53c79@redhat.com>
Date: Wed, 25 Jan 2023 08:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 09/35] gitlab: add lsan suppression file to workaround
 tcmalloc issues
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230124180127.1881110-10-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ua6MlHClbGuB

On 24/01/2023 19.01, Alex Bennée wrote:
> The up-coming upgrade to Fedora 37 will bring in libtcmalloc as a
> dependency of libglusterfs which confuses our fuzz run. Rather than
> disable the build lets use LSAN's suppression mechanism to prevent the
> job from failing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml             | 1 +
>   scripts/oss-fuzz/lsan_suppressions.txt | 2 ++
>   2 files changed, 3 insertions(+)
>   create mode 100644 scripts/oss-fuzz/lsan_suppressions.txt
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index f09a898c3e..9a6ba1fe3b 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -511,6 +511,7 @@ build-oss-fuzz:
>       IMAGE: fedora
>     script:
>       - mkdir build-oss-fuzz
> +    - export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
>       - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
>         ./scripts/oss-fuzz/build.sh
>       - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
> diff --git a/scripts/oss-fuzz/lsan_suppressions.txt b/scripts/oss-fuzz/lsan_suppressions.txt
> new file mode 100644
> index 0000000000..02ec0a6ed5
> --- /dev/null
> +++ b/scripts/oss-fuzz/lsan_suppressions.txt
> @@ -0,0 +1,2 @@
> +# The tcmalloc on Fedora37 confuses things
> +leak:/lib64/libtcmalloc_minimal.so.4

Reviewed-by: Thomas Huth <thuth@redhat.com>
