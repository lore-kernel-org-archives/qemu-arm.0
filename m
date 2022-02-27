Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1246520lfq;
        Sun, 27 Feb 2022 10:49:06 -0800 (PST)
X-Received: by 2002:a65:6a08:0:b0:374:4256:9ed8 with SMTP id m8-20020a656a08000000b0037442569ed8mr14553520pgu.79.1645987746373;
        Sun, 27 Feb 2022 10:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645987746; cv=none;
        d=google.com; s=arc-20160816;
        b=bfi2P3Ae3AtYcr/UfhEeC0kyEWlqkjEqeianjS8UugjhNntTZNGxQllwSyk1Unhcy+
         KvgU0lP7DaQG+jEIt7EFsXRUxk7C6J4+gwllDwHaoWglSUD/uBklGOfg2MnFCxApf/BC
         T5xMV7eqgV8f373SVypbgKko1R0iDwC3RVmbYeUS5grQYwUUuNlqVixQS8iiC9J/DyFS
         XixBTU8wvGtyIiLcFAJo4ldHoTOfsacZvzG2v4mF/1INemrnh1ty4r2MMj9CJzhtmJXb
         NN99TwResfSDzUxK7SdS/BoA1qjuYRzDa/eozueFYAv/vDY1uAC3nj4VsJJgbB1BexgD
         IU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jYXhyWM0shnA7Wjj+qkIfo23VyLboSH5PH0Du6KNrOo=;
        b=sGmERCt6PRqrh+Mjz4L5+6Vf31uhHNTnEE1L7iH04Mfxj03LQFIuKm7c3z2z/WfQRV
         2yAqh1uOV3i0hEbu86jFnnq5Hw04xddlDhbXYwgDAuGc4NwupgMGValI4msWhJ45qLsw
         l8jyKHbHQ/0K/+41e7fe/ih33xrf8M5scrd13kyjY15C6Ika3dtvQKR6bwWIGHdDu18e
         yulTnwBaxvsy4bjox+p/WBkJlT4ww+8RZBOedXu13U6KCqw7ATcrZI5YHqInudbyY+HU
         LUPhS9nv6KXcX9rPXILuUbF1PxBfeMFQl/GXxiObzHfyknjcWcKke5tL6LnwDGV4p63c
         hHkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qx3Zh4l3;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o14-20020a63730e000000b00373d9816db0sor4787308pgc.67.2022.02.27.10.49.06
        (Google Transport Security);
        Sun, 27 Feb 2022 10:49:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qx3Zh4l3;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jYXhyWM0shnA7Wjj+qkIfo23VyLboSH5PH0Du6KNrOo=;
        b=Qx3Zh4l3GlZzlQp/rjLjjhR4gBYIn+zu0RWfaUVIQL8RyRdfIkpFPbuO3DyOL/ApD5
         XmmiFNJZYIIlXxCTTtn3XxU5w19jYQpbiZbp7jYjXqQBWwlS1K8gWTnOmEEMQcfZYtg0
         7jL5aSttj+PvYSdyElxVDjuU3KmlR1uS3X4x44sHH6jtzAmWJWToBcxk7Rpb0/OdJq40
         I26YCzz/eXuF0wRQCdrJVveYbJzPF22ofDpxWS5A7tFi8eSKS2KFiWjxVvFPM0roBtBz
         9pHazS8aEyuI1EQ3bgt/KwEUhPqcwuNL3uvt0eQh+OPp6LQVfkmw0M4J52/NouvMU0k2
         ISXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jYXhyWM0shnA7Wjj+qkIfo23VyLboSH5PH0Du6KNrOo=;
        b=kaoUlk0Fo46mu7j8UBh0jFnqfpj3olKtiuN0t1TAIv8hIewKJ8QTA0PtlRsTDMc1iz
         kbdiHwK5q6YYvKcR0ES/FQHW6Oz6ON2sh29Xb27jdP1Ibf2HzDnz8E22+a419DEp/PtD
         XoDFgJNtI1N6hteBHhX7R6qoT/Af6mGCB6a4McB0ZnYtgOVYbfJ3OC1QXXre5LdOcXxR
         sA844ZWQ9Bb8iFNONO5D3MRSbU2q0eQjNftRpAuPBtd+JceCl8TMqleMdv4duJoeCdWt
         cjCb/ieMmek9qX7vH8Q0phofOPBDPR0EIBmoDXJBjIIKU0cVeZxPGzDoajFLiyOOLFEq
         InhA==
X-Gm-Message-State: AOAM532Czvgv6rm39lwKK5cXMXTBQV4P2XNA7MGmvPvNrPApEjceuWYZ
	dPy6FmaOB0duP0AJutolxSw=
X-Google-Smtp-Source: ABdhPJyi3EjpODP/s0PJqWJBzQX+ZI1bWUXIfr6wLzhDedh2CezUajj5IJPXu5+kvLksdYlyFnVeTw==
X-Received: by 2002:a63:d74f:0:b0:374:5bda:909d with SMTP id w15-20020a63d74f000000b003745bda909dmr14142244pgi.215.1645987745965;
        Sun, 27 Feb 2022 10:49:05 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net. [88.28.25.32])
        by smtp.gmail.com with ESMTPSA id pj12-20020a17090b4f4c00b001bc97c5b255sm8303283pjb.44.2022.02.27.10.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 10:49:05 -0800 (PST)
Message-ID: <9e7b9bf5-abe9-0203-29e1-4c618a345a1e@gmail.com>
Date: Sun, 27 Feb 2022 19:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/9] Avocado migration test: adapt to "utils.network" API
 namespace change
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Farman <farman@linux.ibm.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220225210156.2032055-4-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: h4jSKA9XlbJ+

On 25/2/22 22:01, Cleber Rosa wrote:
> Since Avocado 94.0[1], the "avocado.utils.network" dropped a lot of
> previously deprecated API names, having the new names into a finer
> grained structure.
> 
> This simply uses the new API names for the network port utility
> module.
> 
> [1] - https://avocado-framework.readthedocs.io/en/latest/releases/94_0.html#utility-apis
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 5 +++--
>   tests/avocado/migration.py             | 4 ++--
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
