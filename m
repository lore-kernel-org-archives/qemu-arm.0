Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp717445njb;
        Fri, 6 Dec 2024 01:26:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWpZ4T3tRlI5FyDy2iz+WgTL0M1724O6Z2vxM2eK5hVhRCAHjH9yCPcJ9Ah6URESJ8sr54fEqQ46gB97A==@linaro.org
X-Google-Smtp-Source: AGHT+IGYhHRqnz5/AnMOFp2XbQmRgkStnxb4g5scueoK2sNd5XydcBZztMajFfjGVavs4cv5A8jf
X-Received: by 2002:a17:902:ce91:b0:20b:70b4:69d8 with SMTP id d9443c01a7336-21614df10fcmr32176045ad.37.1733477172816;
        Fri, 06 Dec 2024 01:26:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733477172; cv=none;
        d=google.com; s=arc-20240605;
        b=FJ3mttQ1oyRycCOouC3VPQkEgfeOmhnDVZZugAsQ/z6jFj7y/lX1SOwM7El99r0YDd
         S6G3njo9gZYmYdC03xa/upmgoEySDdU3iWnMcGlscwDyOgIssWjzvdiOOFJQ27MpUu6m
         QWQOhxA41uOC7x8Uff0YSRNegrjo4uWM4oYXdTJ41by+NscOGZq8swUGzjUCkZf1/fKk
         EksknnCI/Fvg5NRWhUHG+hEgL/AQeW1m/1yKoInkXTA+40/RSC/dJJeep4kxET0KTkdy
         0mb9vUKTt4+tYseY0i26PmYDwF8nMfxLQlJuekEAwDOwje3ZdAWvXl9oxsBFUIWnJRGx
         2HCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id;
        bh=/LnVTfUa6Hh3rDa7BxcKZ+rx2jXM5+G06YSRtDXYExk=;
        fh=8fCnlfx1XMnRpZGm4Y7IMulm4zxpjVv4sGSA4/DgluQ=;
        b=Nn1/iNfPuwj0q5jQhVV3wDfhQ28Hm0FRcicN+/Rc+nmnY00iOzowUap/ODkzNR64RI
         SV1zmJwgvPLSiypDWYAgcsfueX/kYOewcp4nJDtHexZKMBLqdXvO8WfW6nwv75UpnKBY
         cPHnwDeRiwOz1D4koi7yf9ipnnjbjBIBtM5NVKWHmO+sp2EopV1UYSasiz3sLcbL1gCC
         B3cfjpit0uvni93oolDA+mWJcDzOt7/v/fEjxg8fW66wQuMvSFvbx9DDMqAwbxpG3BdG
         sCmJhC5Gv9jMG5zA9vtzDLdE5Kesb08WF9nYAXz5s8cVSS+7iFe1Uuf1G40C5BpdCsMJ
         Uc3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=qnnk=s7=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=QnNK=S7=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=QnNK=S7=kaod.org=clg@ozlabs.org>
Received: from mail.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fd156bcf1esi499003a12.192.2024.12.06.01.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:26:12 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=qnnk=s7=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=qnnk=s7=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=QnNK=S7=kaod.org=clg@ozlabs.org"
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Y4QqK3glQz4x69;
	Fri,  6 Dec 2024 20:26:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y4Qq64VzFz4x68;
	Fri,  6 Dec 2024 20:25:54 +1100 (AEDT)
Message-ID: <53394e0a-8e31-4284-9c19-bba0abeea2e0@kaod.org>
Date: Fri, 6 Dec 2024 10:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs/system/arm/fby35: document execute-in-place
 property
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Troy Lee <leetroy@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 alex.bennee@linaro.org, Alistair Francis <alistair@alistair23.me>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
 <20241204203912.3037515-3-pierrick.bouvier@linaro.org>
 <c2e4c538-2e0b-4882-8a92-6ff439cebd09@kaod.org>
 <3ba7dabb-67cf-450f-828c-5adf7332fc91@linaro.org>
 <96b027f9-3637-4416-9eba-a175635026ca@kaod.org>
 <a9401d13-d23b-4d18-841e-4239e216168f@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <a9401d13-d23b-4d18-841e-4239e216168f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7HWoMEDOvO92

[ ... ]

> I'll add this.
> 
> This machine model supports emulation of the boot from the CE0 flash device by setting option ``execute-in-place``. When using this option, the CPU fetches instructions to execute by reading CE0 and not from a preloaded ROM initialized at machine init time. As a result, execution will be slower.
> 
> Is that ok for you?



With that,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.
