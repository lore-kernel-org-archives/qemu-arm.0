Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp750843njc;
        Thu, 20 Mar 2025 00:09:35 -0700 (PDT)
X-Received: by 2002:a5d:59ab:0:b0:391:2884:9dfa with SMTP id ffacd0b85a97d-39979575675mr1954460f8f.13.1742454575509;
        Thu, 20 Mar 2025 00:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742454575; cv=none;
        d=google.com; s=arc-20240605;
        b=jApR/FockQQda9FGrTD0Uv5kBWBd0mwwIdMrgFvPlfD61xQFZDP/9hyimMqrctkMAO
         WvxjhdLNRJ4PaDR3e46cs1Trox3OB1B2IhqLanXvVOB9Z9tSnyA88ZQQh5Mn7LWBGbzA
         GUHhDNNS+YWzNiGI8qMgoOoB+pxLQqMwFVLWa74WcWs4sApCcbKEA+raVEkfrsGouJnq
         v/SV9ORyAwErGTCUlEPq9BxFDe/2atf2PyTPjjdInvmhpCA9zk/5E0s61PkvEt1z/HAg
         PKR7Lkt0PvximiosO5wze9gjvr/vMbI8/nA9y2VZdR5Q7dz+2+RaweWyni1j2AWw+UAV
         hbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0ZLyBlDMyQlgqDV6uPJNb9HIoPbEBla3hQLiDPbRusA=;
        fh=VTjyscoH3jg4EEBGXGBCijT0Cth03TkL5RpTsM1FyIc=;
        b=Hr+qNgFRL/0tz4nFkU94gT/O0zPV5e+F0/rJb+lefztp0ala5kHlLZY4O0sn4f/lv5
         7ABpbtYzOgKQ3WsLlsks/k2zB7UpF8NU57i9G5HdJ0o9gynZXxYlmh7jpoFtBgNkMuwB
         4bzSEgUkws0YlqQjf1DT+zdRg77DyoCRVAFrlrNdqqzL0pWwmGc7MeTHncq/ujmoSCPJ
         j6a7eCwCg0NnHD0ox3WLfj1eRLYif90Zyvw6Wlib2FelDN8gFnuOdLAaNfyCUCPK3MHr
         YxPMlsa0NlDJDC6dya8Jf54suR8FEiDXMqatsTqI3QiJdEnqRDSNfB/ODaXTWbkWtK+0
         mD3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YJOtfzva;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d43f84b4asor9485735e9.5.2025.03.20.00.09.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 00:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YJOtfzva;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742454574; x=1743059374; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ZLyBlDMyQlgqDV6uPJNb9HIoPbEBla3hQLiDPbRusA=;
        b=YJOtfzvaz08kjMWbCD3lyPK/0ixoS2DMBD8i5CunjAs2NemoEk0jR165Cq5mAZb8sz
         OLOoYYJh6LAGpaEIwY4miOvwmFhQ4zKh2wYT/NsTFyAOPJm2mUGwwjtVKt9usRx4uwdq
         oDD1xyBMQUio40EO5+M/dnyUYSikY2U0UjqeT5RMUmrZym3GFw0J61U5jS52MZ9/BHxX
         NPCZQWXUCP2g0iYZfoWvRpfDJuSFlU/jccQ8WT2fIG3Oq79jEykOKnZjnh7n01aWHjuF
         R8Kt1wZxeZ5OyLCN+H1f49pJ+9i6achtO/E96vQ804zBESWckcBaxHffqJYD0x/yKx6Q
         Oxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742454575; x=1743059375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZLyBlDMyQlgqDV6uPJNb9HIoPbEBla3hQLiDPbRusA=;
        b=lbNZTwxjoDtE0lV2Hf2mXCdDiKnHfXu178qsMrOFkiqgm27WR9WWbg11tDzdPWWXey
         GEeaCf1CiYAExeRGkzhybbe60cLhv4Rt9cghP8GybVpwdjivt1CqkLgu8jLNNYt9yyGQ
         gku+WAP73m5spY8Zs6bwApEspsQ8jfyiBGxzb93FyPsJe9fll6TrEbYWdhiUtcdHCXu0
         01FtQzIxEtoGj5tmIaVLDdYQwqJeK9G4pLQbrYt5sPl0UGwOgeYmjwVFuzTQCwBGmomA
         9E5fovx0l1hNf94UeJr7dlmEJFjUU9p8Bu/gSBeOXqz3hAM/e0tOFXWPlMqltGam+BSM
         iy9g==
X-Gm-Message-State: AOJu0YwZCb2nuxGg8MlIvvK7fhPMh9NP7r+fqVF4QRp48veVelFUb7jo
	N4MfaiflQV1sy8r0PihQ9upWQWTgtUICbcZSyl8mw1WpUPRUpw01oS/ssKit64z56antQY8n2yB
	Osbo=
X-Gm-Gg: ASbGncuzH3uVrsHFw4kxgsqCBl3Y9zBFAD6xLJb6JKuzPhXrrx+dKjrBUB9pNSOD5iz
	XxFRJ93+cUZbgSfy1GZfzFo0BZ2W8qokZP5iIpDzbMwYhtC76WYyY3hPTEEO9hMNTJ3HsQzXm3G
	klgWd4AHJ5b1q8LQ1nrvU2jXEflbuJSpJQ3UKSg+kxMU1qeFABfwi5yrD6cfB5ryWxuaNSQvAbA
	nw9p4a9pJ8ttmLOrrTzvZSK+DlADJG9tlH2+tHAPjXzjI2ZHZgf3Xwa78zqpbzkWMI2VAvs38sp
	8W3hO4TBfB6xokuAQKVKAxXbUnMc0rBgo3fjU0wJhPJxwKZtdaFIjnWvc0aGNaJfzpmlP+wbaNd
	RG/NWkSv5RbyA
X-Google-Smtp-Source: AGHT+IGvlP5S7xHLPzO6ycdt9LsCQsi1xc+qpkSeBZx+zfG4W388TfEr27oGs6RXFanujJWTA7KdZQ==
X-Received: by 2002:a05:600c:cc:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43d4915e6bemr17966175e9.3.1742454574503;
        Thu, 20 Mar 2025 00:09:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c4f9d59dsm23009737f8f.0.2025.03.20.00.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:09:34 -0700 (PDT)
Message-ID: <1d109799-c8d1-412f-b829-ad223d691511@linaro.org>
Date: Thu, 20 Mar 2025 08:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] include/gdbstub: fix include guard in commands.h
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-2-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250319182255.3096731-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JR5f/L/78fXP

On 19/3/25 19:22, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/gdbstub/commands.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
