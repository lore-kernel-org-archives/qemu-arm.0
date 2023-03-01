Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6629900ejc;
        Tue, 28 Feb 2023 23:14:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/2UjCvm2VPFg9VYgKfvAqFJxZ9rzYlNz1S+AyrfvlitWbSMEXrfwSUKuelS2G05zJPhaif
X-Received: by 2002:a05:622a:155:b0:3bf:bb87:2470 with SMTP id v21-20020a05622a015500b003bfbb872470mr9676080qtw.23.1677654873335;
        Tue, 28 Feb 2023 23:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677654873; cv=none;
        d=google.com; s=arc-20160816;
        b=u3sS33waxuAM92mqLtI66kd+9Xwu7EZz7/Fxi7z5THdRO40siQ5WG4grMH8/3HxdYL
         T6bSaHJU4DB4ZWHp/MfOv7ZmIL5Epvp4ccqJKXGzFnCh4NsZU38tBXntBQxAhECSndbC
         IqmLLDUDUach6OdjAREZcuVhsN/JUeB+uBxerVxYQcLqPIbeHGY4E4TU3rNWvSYtWYMT
         z367cfPmzbprMXd95ZUNw1Kpy/m4o0ZYZnT+oREeyZteKFH02vN/AI71TMc4hH/gTjAF
         g6iT0aCGlva81DtFbvkfyMhsxWM4b7G4JzK9PFeQP71oNltwZbR+N9P0qTaXfB/Bxb7O
         G71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=v2QEBpwPNgq/Y/SIC0d9P/Jht3hesebq1EPx+baJhZA=;
        b=c1M2Kx9D522vSdJCnihoDDVQndA31rj5dJ0He75oOlpgQBKipmxv4Dq/B/xEfOu0U8
         zNLmzgOg7+ZN8bOx+BQz+LaJoLCcsmp/+YL3HZF5hYdXPFO6bColyN0i7yU4f49qSwPv
         LWzUJG5mth1RA8U0iAauZ4zNnm1i4nkEMBWeHQ7xWOHhB6OyNpgmdESvRkpeiCxsanlH
         enFkhoGnoVfEe5RnjFJOlO2O17IUsMa70orM3bAk7Z/6dCLuwsVvKJzpHgxGZn+pX7C2
         k2D1D2RBqgbQhn/PJ8Bnz8akpRCgHrQBnw37dopuccplvlpM+b5eGvoUaf+cr4/kVzIE
         Y8aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JkCKGReA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w4-20020ac857c4000000b003bb7c3c7963si10972568qta.498.2023.02.28.23.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 23:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JkCKGReA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677654872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v2QEBpwPNgq/Y/SIC0d9P/Jht3hesebq1EPx+baJhZA=;
	b=JkCKGReA+KyY0MJcYg/ZK4BluFv63PQYyKDDdyvkbX3141UVcARseJ7DTnEG81awDwZd/b
	NMQ3dxY4hURIQ/8IpKFDx9dn0pj1ljBDxwNtVzpO/ao3uayPqzw2PQBbNWbd2kb6Uzp6ii
	5ya1P42GY8yDb5wU15w4cFNBXlMb3w4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-fKS9kh9ANjmfnO-BeuzEUA-1; Wed, 01 Mar 2023 02:14:32 -0500
X-MC-Unique: fKS9kh9ANjmfnO-BeuzEUA-1
Received: by mail-wr1-f72.google.com with SMTP id m15-20020adfa3cf000000b002be0eb97f4fso2257036wrb.8
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 23:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2QEBpwPNgq/Y/SIC0d9P/Jht3hesebq1EPx+baJhZA=;
        b=Z0KP91VyGW7AWfWJS3InMAYWZJk8uulEkDrNQ+GPBIC+d76vNDVwQZxmaGBRrfVSiZ
         IfNg7JN5ZrjpuSi2vLET9Q2n15uUHtC+fhkb4IpxaJCchb7ObN2BFyfqqSye5y2JVln/
         qrrCDpLDn6F9efqpsM1VdzkVG4sV5C/Pi9YnU+e0KNvcKkqx/eQptcAkFb9VfWmLl83F
         JTgcDSIxEyG1ebCi2lsOtgyNp0YpgJvnSLMRqrA5QtPDy2TvWGrwSvoScjCcY8HhTzN2
         vWcFthcB4owitIJNdVyl3/eZXlq/hT9p6exOitVAGMYytCQJUEc7oZrknJN8sRsR0uIC
         nlQQ==
X-Gm-Message-State: AO0yUKUJaDq5ewk+A8hjohTs6FuZuhTRAcXGAB/ZodrMWpQeVBoTz/T3
	w33Cn0AnvZWhkKlpiI/6UuLZuKSnC72O5f6HtD+pk0oLPKNCqeIalDpRHFnVk5OFPozyoNkZGGH
	GUXrE8CWYT17k4P6cuwk5oiJhMniwfX88NlxXBqhYA84sFnC6wKi8VOitHBuvS7zB9hBoLqTN
X-Received: by 2002:a05:600c:4d97:b0:3eb:29fe:f922 with SMTP id v23-20020a05600c4d9700b003eb29fef922mr3894062wmp.29.1677654870896;
        Tue, 28 Feb 2023 23:14:30 -0800 (PST)
X-Received: by 2002:a05:600c:4d97:b0:3eb:29fe:f922 with SMTP id v23-20020a05600c4d9700b003eb29fef922mr3894022wmp.29.1677654870569;
        Tue, 28 Feb 2023 23:14:30 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.100] (tmo-114-247.customers.d1-online.com. [80.187.114.247])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c4f4900b003dec22de1b1sm16231030wmq.10.2023.02.28.23.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 23:14:29 -0800 (PST)
Message-ID: <72580c0e-353b-bb91-444e-b56d4c6ff7ba@redhat.com>
Date: Wed, 1 Mar 2023 08:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-25-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
In-Reply-To: <20230228190653.1602033-25-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hdWd28IY67OU

On 28/02/2023 20.06, Alex Bennée wrote:
> This test is exceptionally heavyweight (nearly 330s) compared to the
> two (both endians) TuxRun baseline tests which complete in under 160s.
> The coverage is slightly reduced but a more directed test could make
> up the difference.
> 
> tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:
> 
> Overall coverage rate:
>    lines......: 9.6% (44110 of 458817 lines)
>    functions..: 16.5% (6767 of 41054 functions)
>    branches...: 6.0% (13395 of 222634 branches)
> 
> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:
> 
> Overall coverage rate:
>    lines......: 11.6% (53408 of 458817 lines)
>    functions..: 18.7% (7691 of 41054 functions)
>    branches...: 7.9% (17692 of 224218 branches)
> 
> So lets skip for GITLAB_CI and also unless AVOCADO_TIMEOUT_EXPECTED is
> specified by the user.

The explanation sounds somewhat implausible to me. AVOCADO_TIMEOUT_EXPECTED 
should be for jobs where we are not sure whether the job really finishes in 
time, e.g. when compiling QEMU with debug flags enabled, and not for jobs 
that simply run a little bit longer (in the latter case, it would be enough 
to simply bump the timeout setting a little bit if necessary). So did you 
check whether you really run into timeout issues here when compiling QEMU 
with debug flags?

Anyway, if you add AVOCADO_TIMEOUT_EXPECTED, then I think you don't need 
GITLAB_CI anymore, since we certainly don't set AVOCADO_TIMEOUT_EXPECTED in 
the gitlab CI.

  Thomas
