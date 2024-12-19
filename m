Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1811490njk;
        Thu, 19 Dec 2024 09:30:36 -0800 (PST)
X-Received: by 2002:a05:600c:1d1f:b0:434:f131:1e64 with SMTP id 5b1f17b1804b1-4365535de80mr72938035e9.9.1734629436667;
        Thu, 19 Dec 2024 09:30:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734629436; cv=none;
        d=google.com; s=arc-20240605;
        b=gMlRPvrVuES4DiFxcze3pl6SoZhU0QhgoU2f116OdquFld5UAy7ej6Wt6SaYQ0cfdh
         2SM7sjkSFY42CwPnKZYIxMFxPo5xSXSq5xwvspjJ0hbHF2iKgmWTkCZE+E92NeHxFqLn
         peiv7uKq+7mJH/N8KhBqGq/yjuqSLzxfO/wf84rWaRaenwkEI4wdF4Ka9FiqxgpZ3r0A
         Lcy0G0St8wGgyzDYH480is9TGGR/eime2RAsz3P35nZ8wfWUUQcO7aUT5DPoBGnPcTe/
         uGtikqTcC5N6GMgpa9YG1ekOtKLCLRSaoZC1oswo2YyOUS4sTPwM65P+Oy16poZkL3Pt
         r0GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FHozw9de/NvfPGX8IMwamoRKsGIkL6+8Xqk2d+A6kH8=;
        fh=gLpo2kejfU972rpklvPvZQ9jifaBcKF0Clvk3IRrLvU=;
        b=DT03ChTtpNnAzFTb7JeDw6neP8ogzPtlONVdDBDtbSp0Uwt8MbthuTBHUK1JFicvxA
         Lbekw6NWFOPrOOw/EDfY4BSrrhLvm68YfRlS826FWnEWx8JbsGTeXyE4G/ghOfkAPxbU
         VW/EIMb7ao1khZ4WZsfH7WW/0ddd2VhLndX8rfNJRtw68wIBxcHaIQM5/wjJ3CZeu+Ld
         x4W5i17/jdIizZcfcFavJ3Q/IbJbmpykohOrqzgA/K4+k0RHMnkAQwsd/XVuPXhdS0o7
         guInEcCnYLmC6mcwXIIjEaeF/7qeY6oXIHDb0jZc0bdll4Ok77wrhUdikJApCfzAQ3Ir
         EM8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BJh7YoOr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43661217e00sor5981035e9.5.2024.12.19.09.30.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Dec 2024 09:30:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BJh7YoOr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734629436; x=1735234236; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHozw9de/NvfPGX8IMwamoRKsGIkL6+8Xqk2d+A6kH8=;
        b=BJh7YoOrguVIxgWids3f3e8GDdTkYJNFaSpG8q2B54U3p8lL2QWPVeSaQVf77t5wzv
         pJmxEWvtjOuoCG4JWX9A4u/oIRs4iySz8bptHOVVc4dBo2+Q3mHe8/YlY5yYnBDejFKJ
         WcD8KPdPDjNA42wr/RJ4MrS6PNGM5snJsNebXi5MWB9I6Pri2rXg2oFm2ilUVtyS6npp
         qpcmWLGytC7u9teJl4Xc8a2M16zJXAFAD9fdWtmv/0eDguU5eCcaMJQJV+RMUjKsAfFN
         lS3eRvdE6piof0TSLu0BMoEt2C9ZbJuYJ39H1dWuzq+QwCm4ImDGCVHL1Y8yrq2u487n
         xkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734629436; x=1735234236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHozw9de/NvfPGX8IMwamoRKsGIkL6+8Xqk2d+A6kH8=;
        b=hzATlz5Yz+RpyFWZwf+RoIngAP4nAeDY43/6sQRWi8QdfX07NTXWLT/ABihgo8egiZ
         zhRSAEVDsC9SSqvA670o+l9ozkk855aQn4t3vjIt7IHZnMDBgaH13IjWa7a5nywF5OTz
         XlK1vVUjN+UlCjQcC/aijhr9b+V8BXFQ6s+llQblCny1J41iBtH0Na4+hneDl1dSwv5e
         LRMgSYlZV+9ADEDuZr/sVt3NcG3LNjgzfsixGP1PQKcPgVLkgP5LQTPj2CRpW5qM606p
         Tp43V3P52KaFcYP4H3s/bARN7oQZR/P47Nf46rAZOJar7+E/R2q3oRUna86dgJBgEFQi
         +Tdw==
X-Gm-Message-State: AOJu0YzYSwbHNfKcx7irlwYnSmkfK4oz8XALz2AVgZa2OBnSq867JJxN
	vO5buKXS7DcBIIQHtgSqeq2pyqer6b+TSZcBi9ejJpVs+X24V+dq7vZIWFb/0KVul/aWDMs+hvt
	XlYw=
X-Gm-Gg: ASbGncsDi62deCXP8QTtaeY6/PQkaDuHYFKL3rwZR/AyJ+j+b6hLLB9rHX5YGjENv2K
	gFxXzjN8PpUpQqunuN5L4wyifDx7JrRiXLyC2cZebfH3QSUFX7yjU4uP63zXXUwJc2QGtd0atip
	gXlepZmPMoLxjdbU6r0h2cxFvSiYTjeVNUff05I8MwyR1XjwNRrRwvJiT/v3Ahs9NZalW903pM3
	PeDpzLWZQ9CL4ZgRFlElNQ8Ahd5C6lXGe1jzD9wSIIEvG8SW9QCtGUK9UE2jlETLkjcGvk=
X-Google-Smtp-Source: AGHT+IGMc+NJHehstVIw9mDm4wDLjS2kb5W2EfaT3IzYxpHnuZGrK3pbLa5r2CQOFSJkffQaSuW2Sw==
X-Received: by 2002:a05:600c:468a:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-436553fe17dmr60200645e9.25.1734629435607;
        Thu, 19 Dec 2024 09:30:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.67] ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3d5sm24177795e9.5.2024.12.19.09.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 09:30:35 -0800 (PST)
Message-ID: <e19caf9c-f8d9-49dc-8ac6-26925400d9cd@linaro.org>
Date: Thu, 19 Dec 2024 18:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/27] util/qemu-timer: fix indentation
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fabiano Rosas <farosas@suse.de>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
 <20241218162104.3493551-17-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241218162104.3493551-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8BBOP6uuBYZY

On 18/12/24 17:20, Alex Bennée wrote:
> Purely cosmetic.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   util/qemu-timer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
