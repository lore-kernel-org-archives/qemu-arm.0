Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp328506ejo;
        Mon, 11 Dec 2023 08:38:12 -0800 (PST)
X-Received: by 2002:a50:d0d6:0:b0:54c:4837:8b69 with SMTP id g22-20020a50d0d6000000b0054c48378b69mr3138420edf.55.1702312692785;
        Mon, 11 Dec 2023 08:38:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702312692; cv=none;
        d=google.com; s=arc-20160816;
        b=dtS1YF7jYtFD8l/wa5QpEia9BfYeuPEs/zpj43zHDT+5b9j+WC9QfhGDtHTlKV0nsy
         lg+5+SPdlYP3TPnviYSufToPskL6eBpHttnR08G9zWKpez62hDHX3mOTgyUuw4xmgI+2
         AR3rX7YjbyQXt/xzsSjEPI+wKraAbfNPrTIFPoTxpl3hFZ3sdCA0f/BIy7b/P7/tyOy6
         iFuU6USJzO39VUtGyy6kgFClf9KggxX57wDV1pnQPzZqLHeXgvcFvyllb2bdYTEuLCjV
         m31JQKsTChtAsMncG9WYAyjmv34RoYrD4uEdstl2vVcQw+1Dvo0bnkY6tlaPGfo7xDoJ
         TS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=h+dVE4T5CJKL2zc1mU/JUkrygd/A6khW5COf8KfD0PM=;
        fh=LIN1c+usLVQtekpuVQpiJib5J9IPes9pLLH99qh6RZ8=;
        b=n7mbjPMu446N4UeOCyjijHorRHFVmbWXUrJtBpp3bNPatblBgO/nifMc4Nty6K0TZI
         Fjekn+Hs84XM7htBw2TB0HNu9uII+vFM+5Ep9fF8TACmafn36ZjzEvhe5SHenMO4okKE
         ckQZxGZqnPITa0yf6ANnEC1qY/eiddcNKOu5/P0RS9pktCQhbhiQjFPlEHiJeMluJPLZ
         FEuW6KKRdZK5d19ybUnG2mKER9lkSP6ZfHXQbP5qqaPvDIt1y6PrZ5LFVg1o+h8BRaR9
         TvNX2uOkFdQgZx0M1Cq5gALFWgM/RwwxbpMq134+8LpCitZRjtKHZKIUVKuBnvaXqvg5
         efng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jVJq5iim;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t4-20020aa7d704000000b00550d8fdd9a9sor1111832edq.4.2023.12.11.08.38.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 08:38:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jVJq5iim;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702312692; x=1702917492; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+dVE4T5CJKL2zc1mU/JUkrygd/A6khW5COf8KfD0PM=;
        b=jVJq5iimW21jgIJ4OxoqBwGN7yT5FO/PcFdpdJ2mBdmLKgEtfYq4tMXJvhjt+1r2ue
         FySYJpFpf5CAdJ68tkxXXjLKRUHE4NgZ8S8LSlHbIMq/O3AIL93rQfNYC9DLHH5n9TGI
         hRILJzEGMKPmv9f1M5Wc1xQ/lFvP3rGcQ+WMpsPBo7dD9al+W23uaUVhZcgDCOqqvya5
         TKECY6kcywzC7CJzsItNsBCiSS7AnwnyZgLvA9Sv0h5c/c3W94PKAf/Zz22eW/ywBg++
         o8PmSIuyzcg9Pe8quFfUhL0eoJufYb5nE48ahpKWpTu4Eqhx9ETe3kRb9j5HxYDfDpYO
         IRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312692; x=1702917492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+dVE4T5CJKL2zc1mU/JUkrygd/A6khW5COf8KfD0PM=;
        b=I6obY1aqvoZp/aKR8100rgox1WeSjHzbf5ZkQaNVkZGMJc3rStEzezeqw0rRuXqiCz
         JQh67ifiBFE3Op37BOVq1G5jLx3gNZoGKj4wfINrJMXnIw9fUc2bjIj8pcveKmMvlVyU
         Y25OM2bNgTOgztDwoRlNyu9Y43NS01Lo9gf7o3oVxdeGbXuRSbi+N8ZvCQEd8SrKSh/t
         cZJc9sJbZLzORsM6tVNPEHzmtCj6yHRUJSidAFDQ7n6YU/JUhmt4leRqt3jexbJ4Jfza
         BZOB1+rQBsHtzOfd7Zn6XelR2xxSUhVVzAcN+Z1aM0r4rS5aBBoCnCtmjrHEWmAHg25e
         C3Fw==
X-Gm-Message-State: AOJu0Yz42kwyTaYuruJmSbydSbVjAk43mkMoaQRMr43kqq7M9P6+dMNL
	9aqH5Zd3vqb53xos9N49qzuM6agv
X-Google-Smtp-Source: AGHT+IEQ8W9Vm2+c85+H62mp9eZzxAoWOI3l+4PtdLhvJbr135OX6k8KiDy5Xcu45FvNSYJ8/sDKag==
X-Received: by 2002:a17:907:350e:b0:a1f:705b:3de7 with SMTP id zz14-20020a170907350e00b00a1f705b3de7mr2260838ejb.140.1702312692455;
        Mon, 11 Dec 2023 08:38:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cor91-h02-176-184-30-150.dsl.sta.abo.bbox.fr. [176.184.30.150])
        by smtp.gmail.com with ESMTPSA id rd12-20020a170907a28c00b00a097c5162b0sm4995159ejc.87.2023.12.11.08.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:38:12 -0800 (PST)
Message-ID: <f3b4c270-c03f-44c3-b868-3c68efadc37c@linaro.org>
Date: Mon, 11 Dec 2023 17:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] tests/avocado/boot_xen.py: use class attribute
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-11-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231208190911.102879-11-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BS9PXKM4V1mg

On 8/12/23 20:09, Cleber Rosa wrote:
> Rather than defining a single use variable, let's just use the class
> attribute directly.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/boot_xen.py | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
