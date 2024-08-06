Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1316805njb;
        Tue, 6 Aug 2024 11:20:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViXkdm2u4YQcn55I1a5DUfVog5MURJm+LxaVEnFQiOLnC6byEPhbdParmzYopQ2g7/X9mQwqYVyyEb1Vm4FFXPS6n36dWa
X-Received: by 2002:a17:907:1b26:b0:a7d:a178:cd35 with SMTP id a640c23a62f3a-a7dc50a389emr971046266b.64.1722968410708;
        Tue, 06 Aug 2024 11:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722968410; cv=none;
        d=google.com; s=arc-20160816;
        b=Xoc1AQ50TEiWt1UdwteH9phZZyBn/7hmFGpQVQmx22hhBkq9YidC/9tQlAbLGLOuMc
         1ZiMB2D2BoSKBHJ/3Qv499IMdJhiX6NxzLmofwbO93Qvb6R10AB1fZ+Ax2kL6F27Z8O/
         tCSRpfrEsJziRklcxnHN/qAVzr4XfnyXbdozRJs6kj0VIg/BK+aSaBTI8V/yTlalPL8e
         9DIXVJrrIIGT48GeZmQLAKBW3b0xbR3/6HwGc9h79kMhkepcrTBzAf/cSvZX42esNQn9
         K10vr+EryGUZgoQrP68lSRukPnqhRHfjV3kXrK6CX+R3+/lX6EHCsD5mWRCVx4zTQOnz
         Zf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=F2Q8ARQWPkZG7WAqjFmxJ/8+odByxc1YLJGGmnQA2as=;
        fh=15nOxplZ4RVAKurBrf3PkmSNGgFTp53oESbwAGoeRSQ=;
        b=TmuXYCbJBnNW5bVCg5VBjYSltiy75ZwFbBbVyWIwo863TwwqOQ/bYxsPita9mO4TSv
         Fy4AjNlYYY5DFwO4lV0uV/1x6wwzNtUOMn6VL5RV1szUIOnUMZX9BAuBcL9R/dI40ZcD
         nGLMWQla3NgVd8xMZjiubKunT2NUZNVfM6wj0Gohs68NZoxzYqDEbrCxkxN0FDOeiYLT
         JVxycgEBqnDl7RskvSeU7H4DNA86dEng48d+IrDzTUurdGICNOoRhtY62CY88TNbEwyw
         Z3SftIMnTlZLhqwnwSfxwPwq1W/trKJu/9mbjkSiotNxO3dl/HNtWoq5w+ErhOP+kPQD
         X38Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pET9swHU;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a7dc9d36c5bsor370357066b.10.2024.08.06.11.20.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2024 11:20:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pET9swHU;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722968410; x=1723573210; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F2Q8ARQWPkZG7WAqjFmxJ/8+odByxc1YLJGGmnQA2as=;
        b=pET9swHUUgB0Nm55PnsSm/qJZV40X4JdKx471YkGEornbgR9h9vT94lE+VIWGEHIVG
         jBbNKJXxxN1uyoX5/Wrt6tBKL4HuUvM1yz6bhEzFmGqVOyauoE72uRdtaCmgcsRfdzQW
         9khr7NiQMmN8occRnWKHIebf8U8tOBwThU2veplXb6S3e4FNfI437DBAj/5dn2eS/XBo
         fjWV0XoQyEGaD0v2rKm39dEoxpnhaqG2Cc5MHGSx2B03+k20uofdb27deF61sl7lHku/
         EJ7IiJOm+CaMREBYfPoOet+PNmgByHC0VHhHghXtkVKg/86lGCseRvCHM0sNMA7BTGX9
         bdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722968410; x=1723573210;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2Q8ARQWPkZG7WAqjFmxJ/8+odByxc1YLJGGmnQA2as=;
        b=MLUmp5NGmhXF9l1jXZ9v/SwngFnPv247Oa4uCOEiYAWKqUMYB4WJ0ez02erYCnvdWP
         Xgl8omN7GOqWVhq+VeYpsp2EFLDPKh4lURJZJLoKnpDKDq900FZ/kVzE1GqWg/qkty0L
         58B3JfKBXbChRWI5KlgQ7W/0FD1InaolBxriZa0rMMkqEQYuxXtvhTShMTj29iQVLN2j
         t+G7qtqz4AVqXRvMcbagb8v1P6nHi9f24peKfP2Uwhj3HGkBImad70+eVec4F3ym08Mb
         VHia8lYCedMo835fiVeyJsl/dbYmWJtIZ9mhUQNbHHHVAfnnkS+pduEWEKL/I/Lj9uwo
         Xj2w==
X-Forwarded-Encrypted: i=1; AJvYcCXfwpb+qx8tHIReV3aiVgtSyYakpZvyqZniI3hYlRPq3SHsbKUIDTkHsXLC0mzn9XkdYYCNCDxxnLa1WGNEv4tPSNGLpoR5
X-Gm-Message-State: AOJu0YyQFb7QPVoTSYE3mmwgAV8qP+dZndLvu25l7WbePpNQQmFgMO0k
	G9iQMCIzPJvBZnjC5iGBQXmvdrZ4MAOK5wt1OS3Mhsr10+ZI9yra3v0UndqI3OV7rQ==
X-Google-Smtp-Source: AGHT+IGPn0ybi8q2QWtQUgttzKHLgQajIsoU7p0aIZGtYSOCPmuSWlb4w/FOZI/RAhpXXrZvysLW0A==
X-Received: by 2002:a17:907:6d17:b0:a77:dde0:d669 with SMTP id a640c23a62f3a-a7dc506c299mr1149565066b.45.1722968409637;
        Tue, 06 Aug 2024 11:20:09 -0700 (PDT)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.200.25] (83.8.56.232.ipv4.supernova.orange.pl. [83.8.56.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d89a9fsm563924066b.156.2024.08.06.11.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 11:20:09 -0700 (PDT)
Message-ID: <9964eb0b-7466-4e99-8fbd-82f7efab1af9@linaro.org>
Date: Tue, 6 Aug 2024 20:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Bump Avocado to 103.0 LTS and update tests for
 compatibility and new features
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Radoslaw Biernacki <rad@semihalf.com>, Troy Lee <leetroy@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Beraldo Leal <bleal@redhat.com>,
 kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Paul Durrant
 <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>
References: <20240806173119.582857-1-crosa@redhat.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <20240806173119.582857-1-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Yw5nQ7Tldn/5

On 6.08.2024 19:31, Cleber Rosa wrote:
> This is along  overdue update of the Avocado version used in QEMU.
> It comes a time where the role of the runner and the libraries are
> being discussed and questioned.
> 
> These exact commits have been staging on my side for over 30 days now,
> and I was exceeding what I should in terms of testing before posting.
> I apologize for the miscalculation.
> 
> Nevertheless, as pointed out, on the ML, these changes are needed NOW.

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

SBSA Reference Platform tests can be done in 1/3rd of time is a nice update.

Serial run:
real    6m20,324s
user    12m18,446s
sys     0m36,686s

Parallel (4) run:
real    2m22,658s
user    11m50,514s
sys     0m26,088s
