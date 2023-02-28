Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5656894ejc;
        Tue, 28 Feb 2023 03:39:04 -0800 (PST)
X-Received: by 2002:a05:600c:4587:b0:3de:d52:2cd2 with SMTP id r7-20020a05600c458700b003de0d522cd2mr1935179wmo.4.1677584343896;
        Tue, 28 Feb 2023 03:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677584343; cv=none;
        d=google.com; s=arc-20160816;
        b=KLAAkNW+y1pjV1e483BATjlg4MUf0UVQUj1ANt9s0F7kdGBH6aCh27hJUlvXqJVo+X
         Ni7ehmBWsANBfTHtKhrQkKQ31q2asqSO5wZRtZmyGlGSkUlVtqdCMFWJC2AgbGy8bTAz
         6oQYzYwiH2qWYXAcSDR+FqmB9K3xespWF3bKtvjvbDXTX35YXwNpQb654eyvzsic7Slc
         QkqBbZJu6l10x2fEjjKvyREmRykwWGHP7v8M7mWzMMnN+rOTFv3Ee3GlZYj2dwdZawm/
         GkdkXfE9dmKmzrMRHiHiKSbGUHK/IvpFDi41/7GTw85IqRcufIZlJeltbHdLv7i+uqmE
         VLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=g38SaBYL8DRx2FSkktTdAE/jD1zykcejSRVyVTpAMQo=;
        b=0m2FiBCJQ7D9+A+7QkFOA+bkHMbMvq6fjShH9HJ0pat+iF5yqqfu71pDE48mBOia5T
         Jxhqe6kdyB1d0XYQwtcZP/xTDt+yMPFXuNBlmnTQXAFs2cclMQTj+E8AcocKJ6BIm/bw
         YWoZc88R2uWePYNY8wYEOr26GuB/FAJHjZ1mSgVSe+eYKJL+sxZLjkAb81+XNarbVoto
         cFknRCe6FNFJuycH3h5HivE5JKnsjNCc9Q+AoPMRkmhuSL8HMzg5aYJozKq0FWw0Q98L
         C+WdCNXL5iZnIgLlGROXXKH0s63tUPPESAwzXxCsSSMZ30o8eKodis05Ybzng8NJYNMI
         pmQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/c5yKnT";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f12-20020a05600c154c00b003dc49e01321sor2864739wmg.25.2023.02.28.03.39.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 03:39:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/c5yKnT";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g38SaBYL8DRx2FSkktTdAE/jD1zykcejSRVyVTpAMQo=;
        b=H/c5yKnTAe3WrJAZGeBk8gKBIxgmMUfxF2fJBcM2v5ZoUyMr4nuK662KETjG5zNdYY
         WrB8invLlKyC9lazmdkQscICdBgjJaaziCFqcXsGog8ARTkmnt4UGZLI7LwAYn1qUd2J
         Sh4ZPMhHM3yOFlVVEtAlYHukECzwy1++5/kK9UzONCHWWuyQyv1jyFmHGBUVOd1xW6/1
         qtXNIADax2UKQdvdbzmcra01WWmATB0vcH+yyFno3gS7jjyq80iA4n/HEZfar+ijvVyd
         ngNgYe5+wxajqkYtITYTG4Wm1eBSCPCTNdPLJPPTTJ9aRN++9O3bwrP6P8QGnbeHu17M
         RqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g38SaBYL8DRx2FSkktTdAE/jD1zykcejSRVyVTpAMQo=;
        b=NuvPJ2kFZfd+NI6rtVYyHumZM8wxttVc2s8c26aDetJNGi+IBpK9Jy7Bz4ye0ec1YA
         q6wbNDiuvQqdTD48kAgAq1bpvTbU9ZxX4kCwaRCnS0/cVltp4PmpZ4+0EHdpmh6Y6zCe
         woXNDWH4jvpLkrK/9q2jinOAK+KKwkwvjZP5TPkMPjLIf8eNl5rqMWsTkMaXR8kQbAeb
         PMLchZTEckJsK7aplW4OlLzPXG2ms0GZv2nc6yOS5D+sj0RS1Cc1b6dC14eGbx6wNclx
         rOP7grWDS6h6r/ol6gTLSb4dksHm6UydzJ1Ghjxm+b9gtD9eGLlt9g4jL7VPikSW+0H9
         N6TQ==
X-Gm-Message-State: AO0yUKX7K/j+BCtsZ9H4w+he8kfgPDcScrHD5mlnKtbX9dys1dzzqZ/1
	V5WgIJIBPMO//n1LUYRuZwUbTutthFDGmQrfV0o=
X-Google-Smtp-Source: AK7set+Xo1TX3HB9ryPac3cQFOKMEB2p59juW/GbkFfR2j1qUzkV6JmktjAsL8EP8qQGmf76hvsU1A==
X-Received: by 2002:a05:600c:2ed3:b0:3eb:2de9:d01 with SMTP id q19-20020a05600c2ed300b003eb2de90d01mr1888791wmn.18.1677584343342;
        Tue, 28 Feb 2023 03:39:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c348200b003e8f0334db8sm16070937wmq.5.2023.02.28.03.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:39:02 -0800 (PST)
Message-ID: <ef18fb1c-cb49-d367-d9b2-f729667faacb@linaro.org>
Date: Tue, 28 Feb 2023 12:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/7] tests/dockerfiles: unify debian-toolchain references
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-3-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224180857.1050220-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: j0Ujd0LPq0MK

On 24/2/23 19:08, Alex Bennée wrote:
> We use the debian release number elsewhere so fix it for consistency
> along with the broken comment.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/debian-toolchain.docker | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
