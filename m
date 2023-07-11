Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1627983eje;
        Mon, 10 Jul 2023 21:43:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlECJO/KV+QlkPHDTQSqrxaUrR8hwb7MuQOwmJvJpa+XhCkgLA6SVH4aKS3IF0fiHlnXVMEo
X-Received: by 2002:ac2:4885:0:b0:4f9:7eba:6093 with SMTP id x5-20020ac24885000000b004f97eba6093mr4710364lfc.32.1689050627926;
        Mon, 10 Jul 2023 21:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689050627; cv=none;
        d=google.com; s=arc-20160816;
        b=qs3D9sUqexT0r4fYJ0YyH3x0SkS0AfXSWkydXSKDvvfbfxWf5557p7zzHss9XalPqt
         V71P7kg3Y4xPR5zLY0HugkYsE8J3N7x+l0YoS2UQKyIQdWVBvA3XuXshOZYT0q8uhavT
         r7PqJACGhj1K5/jmB/LuJPycP+Ga+WNrzqQjB5IlTz5+Q44yR7W35sxUnZkdfe8kyDW7
         +UXwzZdYx+mKuHLt+njlIpIrD8mmZxTuyWMQ8Xbmz8qX4PWXNEgPFYo3JnkOOMeGhNNm
         xQ7VEZYTDBqFy7NXpfc2FSYrf36G/dgqe3LAPuVdWi+/PBvCQjW7VbauoZxEQ09v563F
         KrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature:dkim-filter;
        bh=7Qhrt9jVMyHbjYsAOua1FkC57fPfaEUIjTpUnGEDmEw=;
        fh=wE3JiYKzBhoF47tDcc0NgtFfBAQEtJFnVv+TII6Wu8c=;
        b=lbzP0a4Z+ptU5ogwJ84SHUSCYUD8rZ21yeSe8a8pBBi/8iX+k/2QzIO6bnjsdfqw7o
         4VHdFRtTVmvQm+KI74dACH8T1Q+ATdRtclw088rJHMt1Ii+L+SqjTAjKx9b9Ij/b+OF0
         v5zs+Ju6C1ac+ksTF6eSFVcuMhU0PQI4yOqmxQlmH8JSWtC5frHEH4OneFMEMGTIG59e
         a3/edsjSzRQKMOpv6O1/MRv1SDT5MlR+1DKSH8CJV4/FT2WZNxmwz/ZIpyDVnmBKtgog
         JLopFh1OIxuRY8l2lUAlNfQzQnFXl1Ew3F90lb3cmLBSpWDasbWn8NMf9OPYDoDVQ9ZG
         aE4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ispras.ru header.s=default header.b=Gt9Urydf;
       spf=pass (google.com: domain of pavel.dovgalyuk@ispras.ru designates 83.149.199.84 as permitted sender) smtp.mailfrom=pavel.dovgalyuk@ispras.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Return-Path: <pavel.dovgalyuk@ispras.ru>
Received: from mail.ispras.ru (mail.ispras.ru. [83.149.199.84])
        by mx.google.com with ESMTPS id o16-20020a056512051000b004fbb37d6ff7si341340lfb.50.2023.07.10.21.43.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2023 21:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pavel.dovgalyuk@ispras.ru designates 83.149.199.84 as permitted sender) client-ip=83.149.199.84;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ispras.ru header.s=default header.b=Gt9Urydf;
       spf=pass (google.com: domain of pavel.dovgalyuk@ispras.ru designates 83.149.199.84 as permitted sender) smtp.mailfrom=pavel.dovgalyuk@ispras.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ispras.ru
Received: from [192.168.0.100] (unknown [62.118.138.151])
	by mail.ispras.ru (Postfix) with ESMTPSA id E6F8F40737B0;
	Tue, 11 Jul 2023 04:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E6F8F40737B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1689050627;
	bh=7Qhrt9jVMyHbjYsAOua1FkC57fPfaEUIjTpUnGEDmEw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gt9UrydfnGX3XUXlil5RDqeNVY1tEvug4HOVzZJp7rDoxbldOPYX2oVYI10al2673
	 cNfrEVWtH2MOZs8Hq277UKvsMNsX8YXBzomMyChI3kquZVJdAX/OCk33rcfkENZvYz
	 fyncfQ3PCh65HqegyPoN7sscXOAfX73LvH3VD1zI=
Message-ID: <e7590da1-4586-17d7-b036-ecbfe179e3aa@ispras.ru>
Date: Tue, 11 Jul 2023 07:43:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: tests/avocado/replay_kernel: ReplayKernelNormal.test_aarch64_virt
 failing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <666fb6bf-f3dd-f0b8-877e-9e73acf31c7d@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <666fb6bf-f3dd-f0b8-877e-9e73acf31c7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: XEp0D47eVHA2

On 10.07.2023 20:14, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> Per tests/avocado/replay_kernel.py:
> 
>      def test_aarch64_virt(self):
>          ...
>          console_pattern = 'VFS: Cannot open root device'
> 
> the test is succeeding, but Avocado reports an error.

Does the emulator exit when error "Cannot open root device" happens?
Therefore 'quit' command can't be processed in this case.

> 
> I could get a verbose debug.log, so sharing it here, enjoy!
> 
> Regards,
> 
> Phil.
