Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp73581ejr;
        Tue, 10 Oct 2023 04:56:41 -0700 (PDT)
X-Received: by 2002:a17:906:254:b0:9b2:b691:9b5f with SMTP id 20-20020a170906025400b009b2b6919b5fmr16663932ejl.41.1696939001656;
        Tue, 10 Oct 2023 04:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696939001; cv=none;
        d=google.com; s=arc-20160816;
        b=yz3Rp7aWGcvvf0YuLPwY2TfJWxtfkAUxDjwPzy4IL3Cjb9lt1Rn/Yh3RFYZkVwav2a
         5e7wOoPptZVXsKYUgqoKA/FfAO4U/3OJ/+/6Dc9H7vamDzopyzReEvzD7o0f6LNHsiq5
         bPr88SjxV4c7wowKZD8Hlrq9iQfS+ejpt0tD9GzvvcHQcsNTv4b2KsJwm1e+jYi2JsYt
         OLOo2uZ+cWeo73fNhm1VbKjqbIfSVhjx6eJy6BvLKWvvNqQIWkOA9WlTtHfFgaQqmaNg
         e003EYgrsOg75MgG0bZ2RcbJFpWaXx7G/Kcj6pviBmcFdPrSnOQM9Uwk3exr9B42E9bj
         Vmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qlfm40CNX39U3MfQmCxVxB/8tsjjTRpwPggE6Oi56Es=;
        fh=laApbzcyDW67yvaQPTErmWsSK5B0H2U8qOdh4S20ATg=;
        b=DjcqQSjftZ6l7X68brX0n1bDwdkrEh3Ahs4JeGEWgBpVX5GZQOlBhdLxczGi3bdczH
         EzXIKugDwSRUy7u4BNUotdlTU7EGxkJtWL3CX0oCeT/YcJZiX906TDcugpscV82efcBW
         vJ6Vs3zkxOSrxF0yzSaHnJ9mSPuZWIA7ySaolHHKhPzfv9tAUFVAC1p69Ku9LAxrOqPo
         iBCPbxrOiTiMklXs12HJNmQa2usDqKOlGcRHGFLXk/e419eJ7TT81neWzogeQ4WRO113
         MMORARFIMcEJG3OYOdFXmqZy4RpKFjyikY+XY2ofZMUfTdUfNrBqGQXcvXjgToc1zGZk
         Cuuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RpBYWR4S;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jl22-20020a17090775d600b009b2cc662802sor4022506ejc.15.2023.10.10.04.56.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 04:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RpBYWR4S;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939001; x=1697543801; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlfm40CNX39U3MfQmCxVxB/8tsjjTRpwPggE6Oi56Es=;
        b=RpBYWR4SWcaSZWwEQlBb8Yb1KmCK83z6bFHQ5qhIj8YHEDeOe0EIAZNsupHIj7ayQw
         ChRy3BZjC9G3xjKtuEv6vaySHq+9WAsa3euGSGeocGtCRZva3F9QeynwWUcUq5onBOhd
         nGvciPx+XrPEX73bKiDWw5F6d2js/JSvq4GMvLO6r6ZDY9Qqb07K7+uRF9Ax8bIKgrNT
         1qmXShG3POJusZ3wAE0/gpHTbUtWnNipJCnvIbUe/ChWjHLhyxtZL8BIOXAC/gkS97b1
         EVvvUUUtmoBTd5cNETNB2kyhDYGG4rajGJuOQuNp4zlPnrbpoiWeKLomnCoJHXqjhJlr
         /7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939001; x=1697543801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qlfm40CNX39U3MfQmCxVxB/8tsjjTRpwPggE6Oi56Es=;
        b=F0oboB6t7RAcntE2SDHy4V7+MC/v9xHloyevrARAeW4trDf9wRWZSwfkGxVQ+2D6Kf
         4TegqGMGOmm1+uev0GhYNMGJU5dR037wj5KNHill9p09QTMsDuSeNaVSc7/maiDIzR1a
         O950BQA3r7teAlVIGVfzG7OrdUySqnRZw+Tk8enVG4CSg/tXUi6xI7OBpQUwTF4H4wCG
         6zFJl0fK8mDT8jP/ch3SF02gKBCfs4leBlOTsw3AcXVaWvt6pqzOVtCJLGqxxCyi9a2O
         OFfwBHta2kp30PAGFFffOKt6zLjuzA9tAvv32L63PfAWmMCuPhZAsM1XVEdWu7w6lZhc
         DKtg==
X-Gm-Message-State: AOJu0Yz8M8tsyM8dzOcXtp58yhkCtDWoy7/edWX5//brsGi34HR8WlwG
	tO3KoqNKfeW/2PGo3rQXK2qmryCB1PWKo6I+yGjKJBvj
X-Google-Smtp-Source: AGHT+IF4BFuHaE3LqrKLl7o1W+AUINASUjohGYH7UDTjoiIC+sZBStWET44grVxDUUzv3JS6z77EIA==
X-Received: by 2002:a17:907:b11:b0:9ae:699d:8a29 with SMTP id h17-20020a1709070b1100b009ae699d8a29mr15104733ejl.6.1696939001009;
        Tue, 10 Oct 2023 04:56:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id kb4-20020a1709070f8400b009adc81bb544sm8337672ejc.106.2023.10.10.04.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 04:56:40 -0700 (PDT)
Message-ID: <bbd46ddb-a848-4e6f-ac5e-dcd2cf99b5c7@linaro.org>
Date: Tue, 10 Oct 2023 13:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 02/25] tests/avocado: remove flaky test marking for
 test_sbsaref_edk2_firmware
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231009164104.369749-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Gutp6rIsInbM

On 9/10/23 18:40, Alex Bennée wrote:
> After testing locally I decided to revert a5754847e0 (tests/avocado: Disable the
> test_sbsaref_edk2_firmware by default) as the test seems pretty
> stable:
> 
>     env QEMU_TEST_FLAKY_TESTS=1 retry.py -n 50 -c -- \
>       ./tests/venv/bin/avocado run \
>       ./tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_edk2_firmware
> 
> yields:
> 
>    Results summary:
>    0: 50 times (100.00%), avg time 2.064 (0.04 varience/0.19 deviation)
>    Ran command 50 times, 50 passes
> 
> Maybe f0ec14c78c (tests/avocado: Fix console data loss) has made it
> more reliable?
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
