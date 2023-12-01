Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp876764ejb;
        Fri, 1 Dec 2023 02:26:27 -0800 (PST)
X-Received: by 2002:a17:906:22d3:b0:9f9:2d85:1ccc with SMTP id q19-20020a17090622d300b009f92d851cccmr480366eja.33.1701426387235;
        Fri, 01 Dec 2023 02:26:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701426387; cv=none;
        d=google.com; s=arc-20160816;
        b=XZs2fB3Tjb8AHATAl4Nwdpe32zxIQVx7AGsT8+4fMU8vdUStR7oVk5wBJOIfAzZYMb
         bL56O3ZBlFu7dKQ0j9lf/QBnczJtdmpHDo3Sl+z8y6jWGmew7Dkpq1AvAwyWV0QBcowz
         7gxTdWvzw8cJy47M99k02wiW0Z6y+hz/bl9SFrkFeqslfGfetkNfSDAIl+/pXYB3QZUC
         hYoXW1knzMFLRb5VkiwL7zGtZ5BGWxRpaXb1u3gs6QX+FTU+TUcbgL9BHyDvcicwjqKd
         yhLSzEdxBjyD15HciV/NoIXvXB9cQImnDplR7Fu6PgIDQ2AZ02XV0aKB3CPSKRP4OlbE
         xBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=C1RneiU4+nk7Afcol9ZQJkrmcjiUv8yu0y1bVXF0AlY=;
        fh=C/d1GziVjP5tVHj9jjg7AvDTPhljk/e5tV4vnHBycxk=;
        b=MLRNqKwsvDOR6yA8cc4P/l14umtzAxhBOl6J/+9uNnAd4Sx3Ax9si2vXfWOi1cwmjg
         RhyY8ykptClHcrfsa4psfEcpZJOQdTZrH76bTmE3yci3KphKH0evZ+15/bV8FaFSw47Y
         yAMqHipNqEYt2RG7AUwOY5TBNnZpJLXYiB8FPUwr8O1jBXnOEwtAW8c2WR2k2RqP4raV
         zQZERs2Ni4tXhPBCxOBvCrag5xzhi/Qlk3eBNT8AjPNm0728BpJpvfp83Fqm7/CxSOp2
         G8oEAoKFAs9nhlLWU3u9inx4BOXARPq/yXsXiJlwzEtieB1GR48tqpr+nyGGGINdTAAC
         J9KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BRmFtN0C;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id qy1-20020a170907688100b00a1a2062c792sor253710ejc.11.2023.12.01.02.26.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Dec 2023 02:26:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BRmFtN0C;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701426386; x=1702031186; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C1RneiU4+nk7Afcol9ZQJkrmcjiUv8yu0y1bVXF0AlY=;
        b=BRmFtN0CCXbRltXn0IUsmdz6FTjbyMC7WzFP/CwY1PkKJRAOXtbat1pZHy+CXA4qf5
         xzZdWY9yinN2d9FSOrbnAdkHgi0lxlz0uhjjlC3jOMdBARplj8IkVQa7ySUv/jSb/BIR
         h/4Nort/3G4YAI0j3Wl+K6edk85sK1p1NVtA+H1DyLg9iwL+ZhCfis7MdPOTciMuirRH
         EuFDuXbBKsEiY6sHi8el3zq1AEkp8fLJb9tpbijO06TVpzMnwY/u3XJxV0VGKAwnsR4B
         8DPagnubtTCr1HEwtjABV9EdLDEs34oYMU1+tzLpdOwrW3UBj7cZH0hKOVs2hDngi+2X
         6dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426386; x=1702031186;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1RneiU4+nk7Afcol9ZQJkrmcjiUv8yu0y1bVXF0AlY=;
        b=WRNBdmIkO/K/6Pv6Hd//+dyo8AGo+0vliBRNXfFmtU/qgPaO2CcdDDfwsnIFoZKpDG
         acpFv6Y3zNsUiRRlGcrRNc1CH02TkbfPCcy7/GY3FC9HgW/uvhA1V4OiLKVErz07Xrg4
         6cq8E+Hj3ncUrLZ/IgbYThtxYByDH4oo0iaDGwumYEr7CNiKwnFkC2vfMR/7/2J8R5at
         1D7OAE5mfQGOVL9nOC3qPzlMA8eK6+MzAqjmuJW/uhz40OQqpZL8GBuuhR2HHMEXm9RV
         ERRzoDJT69lkLOh1N3y7pTQNAYTjR0ZYN8UgYIIuXiKZATDS0tk9RAlf6mzRLpmeHeRD
         1PCg==
X-Gm-Message-State: AOJu0YxxbrJRrlI25WU/xKysK0pDRvgWaETGbIA3dK244bR0nyVapdJx
	r0qlzVNdLI9i3PaCiIj4l7j+o2sgBGeagGFkD7bU7rBv
X-Google-Smtp-Source: AGHT+IGaxDQOnAaUcz7snwjkTB2dZ41KmhUUDihcu6oiK2rKk2wuwpC9VMqX78h2Lho81TLzdnBbIw==
X-Received: by 2002:a17:906:100a:b0:a18:abad:195a with SMTP id 10-20020a170906100a00b00a18abad195amr412107ejm.47.1701426386394;
        Fri, 01 Dec 2023 02:26:26 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id h9-20020a1709062dc900b00a19d555755esm632159eji.117.2023.12.01.02.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 02:26:26 -0800 (PST)
Message-ID: <32e7f859-fa4d-42fe-b7d3-b46ceeb44f44@linaro.org>
Date: Fri, 1 Dec 2023 11:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] tests/avocado: tag sbsa tests as tcg only
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Auger <eric.auger@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
 <20231201093633.2551497-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231201093633.2551497-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dothhRv3idCt

On 1/12/23 10:36, Alex Bennée wrote:
> As firmware runs at a higher privilege level than the hypervisor we
> can only run these tests under TCG emulation.

Can we have this comment in the source please? Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 1 +
>   1 file changed, 1 insertion(+)
