Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp492884lfe;
        Mon, 16 Mar 2020 12:59:50 -0700 (PDT)
X-Received: by 2002:a62:a110:: with SMTP id b16mr1317070pff.263.1584388790580;
        Mon, 16 Mar 2020 12:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584388790; cv=none;
        d=google.com; s=arc-20160816;
        b=cJzrqGmQaSVtRMW/8B/6xPxwujJHG4PBq9wduvwjEpTIKIJbSCVsv50Sc3Xo0U9qw5
         oaoj6p0R9WBh2XTdvPY/sKIGF96hMhv4mR4hfYWUob82peZeTpP0Nev5lYaXCscun9rf
         QduTkcrCovKAClmaRZ1JW7bxBoeqUdFUfs6DdGwffSdY5Q3l26RsKnmTig5OmbQCRhYU
         6SqLWBdbWCvVyPT+8zVYY3YLCcx66TXaDwTrS3zkCJCkBbLoGWjX33tQ/3oMXX3x0ntr
         HQZLUzsakBgP/wzZOGDPTXZt6jNrUbQD7GNNBmTiR9iQqfp8mzjxI5ZOBqOCwIsTEix5
         293Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=X1tKqmz/aUUBrpVIGZqEIbolTnTtNvj1VUuBBuqsIao=;
        b=E9RvBlfVh2THpl2+I7GUcmizbFkjwmRJfFmKBNHfbvUaGgLLEkLM2f6wRkivarrMho
         jUc3p1kW9oP/7thpHqCcvXEJ/IhN9xCRq999PPOO779slFozMRuEahAIAsQov7a3Dew/
         xoOdSJlKYuaZgp1Toq1PM8fPMYIuU3Wpa1wtIHnyBYLb8LWbcM9odaum6yq8WWGcI+XY
         mjqb6ae/IvJf7fTNBWr28I3338t9cQKDS8Ik4Wi+hAD1NaU2LCSUF8dudSHok4ag/O/G
         aflJL2Cyq9gwkwmbz6feM4WCuos7xhhzoHxYucCD8E3IwbpA1Bhw7UCCUVuTwSkwNMto
         z6SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O1XCsAUG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u44sor830644pjb.36.2020.03.16.12.59.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 12:59:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O1XCsAUG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X1tKqmz/aUUBrpVIGZqEIbolTnTtNvj1VUuBBuqsIao=;
        b=O1XCsAUG7KnQFPKeGcLaEnNHnts31SOTIrdIbJu3e6fk4jvtpMrwmXunYe9CL6LPSc
         NFRAaX5PcMT+2dkVmzm3w97N841SGDkQwAZwnLoGrTArmAdrrbYKPpkXcJc9Hq/BtJXq
         EBlBNq0GKrwszdKdR18nR9ZgHoUlUoJe2lyorRroTRllKUF10Le6jDA9hn0pBmG84BVS
         iNZmv0Mmvs8RFJeelNzvaeKcv26SlVeQjoCDcQjFQeZ+2Q4cpGmflCydmJoSsVHKxbfN
         8SRhC5sfUZ4rivdreL5dDeuxEYQZIMVDQcGiMFdlyFalDEseIafZ+RgjfLZD04AuaBM4
         9Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X1tKqmz/aUUBrpVIGZqEIbolTnTtNvj1VUuBBuqsIao=;
        b=GZIIEXof8FPMImcLEm2oq/A/gH8Za7Qs5uOqmqNzWq46GMHWh/d7EzW1Algv/5FTB7
         KGwX6Ga2nPA5F1KXc5+FGZMEeuo+haL/Mp0K8SgBf+993TbNawRaIi9v+9m/aOQx5eIc
         +U1UqbJrY+1jspIqCiFMowZaQ4AH4iIHxVTYCr1nnL4fduRdNEdR+CzFdc2TKYUfHh56
         CTk/Xd7Td8tyNBI9tKJ7GGe+ECqeRFgzqTcveQtK6/Y2uVQ9unHyqpnEy+QMVmit5l9x
         lbQUaz9Gk6uB6hyKjUa0D+mKscVTN9LB11yK+Hs4XGWxnw+0COv/zJHNoGb/5gCvGLnH
         Gk0Q==
X-Gm-Message-State: ANhLgQ2sWYDyIc2oteKM/B3nG59h4NTCWxIUQThWUNyxJ3OZPekdyc7x
	dMOzvw2nx6rvs2/P+IdOHe7ILHF8XOw5ig==
X-Google-Smtp-Source: ADFU+vua8Y62HO68abSCHtVU6brXjQrZ4youYgBHnfTiLCJjZ9G81h3Y7J8Tb2KOdrRA4wWxqf1Xuw==
X-Received: by 2002:a17:90a:d103:: with SMTP id l3mr1232122pju.91.1584388790059;
        Mon, 16 Mar 2020 12:59:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id e9sm688015pfl.179.2020.03.16.12.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:59:49 -0700 (PDT)
Subject: Re: [PATCH v3 15/19] target/arm: Make m_helper.c optional via
 CONFIG_ARM_V7M
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-16-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03a44ee7-bf2c-645a-d3c5-3a4dc484e6bb@linaro.org>
Date: Mon, 16 Mar 2020 12:59:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-16-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: iGl57NVpck1n

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> @@ -1,11 +1,5 @@
>  # Default configuration for arm-softmmu
>  
> -# CONFIG_SEMIHOSTING is always required on this architecture
> -CONFIG_SEMIHOSTING=y

This doesn't belong to this patch.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
