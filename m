Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3523161lfk;
        Sun, 12 Dec 2021 14:02:28 -0800 (PST)
X-Received: by 2002:a63:2b8a:: with SMTP id r132mr48155871pgr.434.1639346548373;
        Sun, 12 Dec 2021 14:02:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639346548; cv=none;
        d=google.com; s=arc-20160816;
        b=fZ6VWb+t7nyGKqVUcCsM6ZqZy7NJOkvZNlLNW9edOSvK9j4umN5D7+N0/Zw+eNQxFF
         1PDLuXoGgwVYXoJzmjSkq1M7wpcXwyKejtpnPR60kK0HJ0LrtGRK+11FazYtghDQmoaR
         mbu9AkrYYYMjIMbYjjo3TOKeF5nRqoyJKPlFMhAOtZx/pkWh5XM+pd5xBUJsys+i9xrU
         tfnFP2bIuIXONDOz/2+fDYMcUDhvOkk0kip8l3WllpPwK9R/44B/AYi9QbI+VoT9fWvY
         jmZ0ls56N9hxkhc2idPMXTLHgdDWmHd5iVaoc7Ay6IreyRQ7SRZDMMgmdztauWX28AFR
         xefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=UfhySzGVBKObKOvgjT6ScTbETw8pUEy9aZghfMHtJP0=;
        b=NziSh9MgvbAE3THaKyln4UBDjrrIi91KwPFSVkPrhvD3CrsypPMd9lC9skBPWWJykZ
         9WtSEoEkRgSRLHNBR3jG+fSjoho05KHLw/1bh8v6VIjFC+Ea0I15+CtZ3N8NKIYEqim1
         NkV11C90TSgXUmgC/Tg0rZT+3s4/HxofEFZThRJXbBYGtAYvnLal8IUV7pWnA7emKvuE
         GwW+CXRzWOQDG4vZ0iL/Kdcn7O2WmBY42NLpGgnKR2QxRTS24RZCkJ8TwuoGTbcNVXqf
         b1TNZ7sJyblAbpW/kHo0K4T0W+dYCXWC3BJ9eOnKzlVwBPTcHLqOmOhIBjw6f58dkwp3
         BnYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVl3G9rO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u17sor5659997plg.37.2021.12.12.14.02.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 14:02:28 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVl3G9rO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UfhySzGVBKObKOvgjT6ScTbETw8pUEy9aZghfMHtJP0=;
        b=zVl3G9rO/3WqT7VmFiWswwlAc2HglxzSJ2/Ju1QNPKWJkC6od2cH5Zkn8OhLjZwPid
         ryWYmSh5G4rbEdRCL+ciTMlalWG9ZgDg6pVFmGbj9a1UzJXW/CECtX4RXsJfL16pFi9w
         ZEZmQgtU/BCQxtgQ0mzRSeoYAUvM+ScJYbRqoQBiuuGnNSZlYxSlc2ls7mOsO9tm4B3z
         SR99EnPKfRAhQdTZTtq0tPoQSAGiEcRTPbbpEcaClK/QRn3WvYqB3LvQcGrjPLWFc1tk
         TVcEVgg46ZCkrBKwEdQxBNr58CaxYfYcWcDK7h3TCUXeM4VGazKeGdcf5BOt+zz3OSb/
         t9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UfhySzGVBKObKOvgjT6ScTbETw8pUEy9aZghfMHtJP0=;
        b=adKK8u/kwdS3Z78eMDIg1wPhCLdYwEHDr8MBwieeiFfOQ719wwSA+hUwPMPYWq6k6o
         BFm54dqkXRGewMF2A5EM5qzGfn+iYKgmX4Qm4q6dv50zsTfXFjNfgOhoe0EIRVRPJU6T
         VAknYH4TIXWJsZmxWiUte5RnEFE/768Aj8NnN8zEm3s7qB9nIauJyAvIGtNoDGRsTX95
         M99Y6Cuxm+9S7ZRH6phuB4xKi8Dz+LDj3NK+CicYu0KmePsV8bZpft7niELyGbKZ/Hpf
         s3TWZYdei7UL/TnzmONSoN3bLPgJCLmZKsHDZq8cXbDAaBY6lOGMcUzSOBFUKcQczqQP
         MWzw==
X-Gm-Message-State: AOAM5332ASFzQHCuyV8NiQCfCg9/zBesQbnS3ngw8LjWOQRErvZR88sW
	3t8qykpT3vgPygE1Wd9cpFs+rjeNLRBsMTfr
X-Google-Smtp-Source: ABdhPJwQhZonygITq9dTrEBJv1vSigMaqhFzQPpl3Jic/CJYf16AFehX6K+JGeGvdX0etV3orDRYaw==
X-Received: by 2002:a17:903:2306:b0:142:123a:24ec with SMTP id d6-20020a170903230600b00142123a24ecmr91522351plh.21.1639346547805;
        Sun, 12 Dec 2021 14:02:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id u22sm10672444pfk.148.2021.12.12.14.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 14:02:27 -0800 (PST)
Subject: Re: [PATCH 21/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_its_cmd()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2fcc450a-3c47-d1cd-6c53-4219f5582982@linaro.org>
Date: Sun, 12 Dec 2021 14:02:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 6fMVZkQPgqXk

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Fix process_its_cmd() to consistently return CMD_STALL for
> memory errors and CMD_CONTINUE for parameter errors, as
> we claim in the comments that we do.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
