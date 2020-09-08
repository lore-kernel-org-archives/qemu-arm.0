Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp896131lfq;
        Tue, 8 Sep 2020 12:55:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNZX2TraRTfhNpdQHZTA00vDrOWNf2SS7oveOTZTWhhVSRRlivyxTBApcrLA7LTq1x07Ss
X-Received: by 2002:a5b:3d2:: with SMTP id t18mr689664ybp.333.1599594912628;
        Tue, 08 Sep 2020 12:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599594912; cv=none;
        d=google.com; s=arc-20160816;
        b=fIjS7eWC0nEkXrL7abHY8p0sMu8FsaV1Z+B6LqeM9LPJ6+5tvroYjUkWALCDtNQuif
         YCIgBWrCRI7x3GVCRZFWdk5qoA2gGAhYPGifBd1MUlWasnuz0Wq/qHpAUE77oUtndnTV
         9zKVsYil64aQ0hpLoeryTxf6QEKncBMqFyUY/MTRlXWQGQY8IeUr1hVtY66LQOD0LqdK
         KYcRRmCgXrKu0BL75QWca14kH9YxGeWAAwH1heWIpmu5IDNGUMAS3oS2YCzOvvhO/54l
         QjekQi3S0gsuCU8v680wz/iPNEf5BE/qkS/kcPBRWYZRvU5gYqsbre1OCz9MHyo91f/S
         yWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=LK+eNEA0rNcsZ3UKbTcJ4LEvVJ3ijGeAYxPUTjYndnk=;
        b=trLMxTOJ6xg4H+/OBZ0GvAq0fDhxY4mEl0cg+63POm+G4OhQz75g2Ak4IbDb/uWn4L
         Gkp7yPNPBa2iaY4wqEtEg1pyCxt0N03JLGPH4IraihuHArDFTu6GQPFT0k2i0rpJuFYV
         L8ATQ7ikTGpRejyx6S1f7oGZyOHSdCIqZG7CI/5O3XgXCmX3jjpi7oT/ezboplRAgBTs
         sFtvpmSt0pd3lv6+lMFbbACK/l4xcy0tSayc2VVXT9WAELr9uikybVoB2quMetN+rBDn
         1+c165VNwAIuF8gRhiX4wxV1Hqk8CWYJpn0w/VH+L5xsdY9grnc1VVu6z2qDANNsj4wS
         2IFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PlLisMwz;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id v7si374776ybm.244.2020.09.08.12.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 12:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PlLisMwz;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599594912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LK+eNEA0rNcsZ3UKbTcJ4LEvVJ3ijGeAYxPUTjYndnk=;
	b=PlLisMwzO9raOp3lYJ17yiRcHZbgf0hiC4qwLCwzeQLX7sF0p/T3KtqXa8JlGXpcbIdjg8
	klyEo/Mi5BfR3w002FQc62+2Z1ydgdsJeaHTDh+sQuT+L34VKzN4eAZpQl3V7fvuOhlfxJ
	D/rvdlKXuDGKGMFw1DTNLqXnBt0tuyo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-j6Z1gUntN2eZEkQ8VAEEjQ-1; Tue, 08 Sep 2020 15:55:09 -0400
X-MC-Unique: j6Z1gUntN2eZEkQ8VAEEjQ-1
Received: by mail-wr1-f72.google.com with SMTP id f18so20062wrv.19
        for <alex.bennee@linaro.org>; Tue, 08 Sep 2020 12:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LK+eNEA0rNcsZ3UKbTcJ4LEvVJ3ijGeAYxPUTjYndnk=;
        b=M4YRWOSBQYBbmthjLyQMKMapqZUT8/zncB39BCdlhq4UBENOUUew4skGlNZutOXPVb
         2TUto/IYzRY6PUVIeUzR69lMWdaT7LPhwPeIp0o3Lnw55hbghkAw+sQ9OfehqlGOIwcT
         D+o/77hAu3vtdeNZSwVHVwfOVjuIYWUI8Oz3vlSTbYlOvKM+CcMKe0RgPhALQvFpId5r
         9X/phNei3gnz5beI46+PBsYQITsVuwZ8XdElr08/SK+hCvk8/GwgBPRKUVtsmt90tOg6
         1qzyx2JFKeizCOLtHB/DxQipX/qRJKHOuSKsABtN2hGmv8mslwnz5nykfutV6QNrpiPO
         oF1g==
X-Gm-Message-State: AOAM533K+1ATqDh+aaNGGOgpQVROJk9fnRfBkIHsTIZpyw6HxE3wdrvf
	kog7PLGrXyGO7u/pB5MiH3evv5klYRunGdMs3etkmRjGOnoJFQQpPS3VJJS41gwOYZ3QG6L+SQ3
	IuTaf8DyZiTGUG1by
X-Received: by 2002:a5d:4152:: with SMTP id c18mr125719wrq.277.1599594907392;
        Tue, 08 Sep 2020 12:55:07 -0700 (PDT)
X-Received: by 2002:a5d:4152:: with SMTP id c18mr125679wrq.277.1599594907090;
        Tue, 08 Sep 2020 12:55:07 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id z19sm581829wmi.3.2020.09.08.12.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 12:55:06 -0700 (PDT)
Subject: Re: [PATCH 3/4] tests: bump avocado version
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Willian Rampazzo <willianr@redhat.com>
References: <20200907042000.415931-1-crosa@redhat.com>
 <20200907042000.415931-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <f92090b8-d401-1f99-cb3a-32ddebc7951a@redhat.com>
Date: Tue, 8 Sep 2020 21:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907042000.415931-4-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: 9NUEKdJQPgEC

On 9/7/20 6:19 AM, Cleber Rosa wrote:
> From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
> 
> Reverse debugging test uses gdb remote client of avocado framework.
> This client was fixed since the currently used version 76.
> Therefore this patch bumps the version to 81 and fixes command
> line version compatibility issue.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Message-Id: <159903462803.28509.16851113546106095750.stgit@pasha-ThinkPad-X280>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/Makefile.include | 2 +-
>  tests/requirements.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 9ac8f5b86a..0687c8bcda 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -517,7 +517,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>              --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>              --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
>              $(AVOCADO_TAGS) \
> -            $(if $(GITLAB_CI),,--failfast=on) tests/acceptance, \
> +            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
>              "AVOCADO", "tests/acceptance")
>  
>  # Consolidated targets
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index f9c84b4ba1..036691c922 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -1,5 +1,5 @@
>  # Add Python module requirements, one per line, to be installed
>  # in the tests/venv Python virtual environment. For more info,
>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> -avocado-framework==76.0
> +avocado-framework==81.0
>  pycdlib==1.9.0
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
