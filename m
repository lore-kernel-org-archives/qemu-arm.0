Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp265941ejq;
        Fri, 19 May 2023 21:23:59 -0700 (PDT)
X-Received: by 2002:a5d:6d4d:0:b0:309:3ddc:1c8c with SMTP id k13-20020a5d6d4d000000b003093ddc1c8cmr2664990wri.20.1684556639249;
        Fri, 19 May 2023 21:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684556639; cv=none;
        d=google.com; s=arc-20160816;
        b=pECpuzkpmcC/6Y0g6nHVNa5krs3vPAP5R3aRCxu9ORvYYy7p3prJS4uMAbTKtPRmeR
         o1jA4on6fZmifjOnrQ1kfSoyRtgShD7FLGePvR5naowijfTORUqz95RkgymEISSzXYxX
         2oLMLRRo/Cs2EnZ4Lnfl4vrK7pTOZ5AP9aq5Dnm67ve7g/Q380zeDu8EzsGuWqbxFKha
         TRSocdO7suaJVarHx5K4Iehs6tUF2/Tp8uFSt60uNb4USN8fH/VJSdgPHYi7bXQw8fqs
         2XhVdlpnoazFnKhbWkNAO250diNpT0LnD2MlVPj01SdkzCIFldIM5ima8NGVIC5cpiWr
         QUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kA74U0YBCDP8AWdZSJYbDDG+Q6IE5pF08wIJjqjbF4g=;
        b=d9TWFAglDY7zVTTfQn8RN43uKeSxJcsR7y6nhHgYLYYcIY9XUW0zo1rFXGIDSBdRds
         vTYULMHKrF5bxHhjVRg10WOWB+FDq0q1cbpDFyqPvraU0HYi1IdSqxjeq++xgASTqIa2
         oJvRX5W8nF0p7kurm1PoEY83VV/H8We+f6NFBSIJ2dQmMsSd9YHwjGmVjW7AWv9hPPoT
         GcIuaPVU1Otpci/vNiHSlUFMJFnwRVd2/OhPrQdOVjSzi5/NTkV/kudYF0PRaeyMMNMf
         2BJhvODeFOGjrXq94apYXDUAWftKlUrMHD7s3RNleNPPzc9dAt9MbtC4LkJapzIZHoJr
         f9lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ngokkeLa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bq28-20020a5d5a1c000000b003062db32aa0sor132434wrb.2.2023.05.19.21.23.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 May 2023 21:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ngokkeLa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684556638; x=1687148638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kA74U0YBCDP8AWdZSJYbDDG+Q6IE5pF08wIJjqjbF4g=;
        b=ngokkeLa8rOoGSng0U8Sr1q6xDNYmZrZtZO7WvS/lYfLf3mciHo1PrD2s5E2UImAor
         AfcdpSj995PIhtS8Z8v+Zja2SxsVrLcMvTh5lu1HZwa6pjTUu14+85UgXXl6m5z34bo7
         At7hg0GhmbRRGHo/H7rPwbnKUK+SJFz1iSNiYeRqHjqi+aM1oB8kfNd55/tj9JtQLbpu
         tKHqka/9wylERoUWK4/luEwAU8qspvEKGyZ8IXnYrHKJUEYXS+033GwbNYt5mswWTnzn
         aprqbKPxuz34RX69959CDMQ6jWINcXDCJ51BOOsmtha4trwYuc1eYBuOLsBVc1YbAU5a
         HX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684556638; x=1687148638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kA74U0YBCDP8AWdZSJYbDDG+Q6IE5pF08wIJjqjbF4g=;
        b=SijJ/LLnWLr3IzHSMuAiwMFanRb3fKUH89hroWaV6y0WxCPBHk11jPScsp15J/mGoe
         gUP8r09wvUhYLi6b3tY5ULooHpBwIMVYG4yKnZI8EYXijacjvhHmkMsPWcITxTPCqAqs
         9DjMi5hGno4wrsvaa+Zh+A025dSiIWPozc5yOzKpW2xY7MEVGck8Tqu2FkqoDn+foFCP
         C2EvBYsPsyFG7Dewgrct6Pvqt7Utx1+ZiUodxhmnnobfmAC6/1gF+R6Wyq8vLcjn4zJI
         +Wpe6aJdeLa6xH67EsZWE2W/cAyjfGlcZIxSr89oJZhcverBejmR4sfDy6SMbWEsWnoD
         ejQQ==
X-Gm-Message-State: AC+VfDzCau6fNghP/XBf0JG+FdRicPfanRl51s+RKQJdYaN5pWgclfHm
	4P7pgJZjWdG0XZKOQ01Z+ZUPLPg90df+4I7+Hppo/A==
X-Google-Smtp-Source: ACHHUZ6l6xpOVLjCXc0Zzll03vX7xT27wryT02p3lzqvYU+sO6xx7PtLRaNWfBoGHs3zEBi+g8cisg==
X-Received: by 2002:adf:d0cc:0:b0:309:46a4:6378 with SMTP id z12-20020adfd0cc000000b0030946a46378mr3157162wrh.12.1684556638752;
        Fri, 19 May 2023 21:23:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (mau49-h01-176-184-41-228.dsl.sta.abo.bbox.fr. [176.184.41.228])
        by smtp.gmail.com with ESMTPSA id d16-20020a5d5390000000b00301a351a8d6sm716531wrv.84.2023.05.19.21.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 21:23:58 -0700 (PDT)
Message-ID: <6ac36631-b2a6-7cbf-0ce2-eb096ae70382@linaro.org>
Date: Sat, 20 May 2023 06:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 4/8] sysemu: add set_virtual_time to accel ops
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>,
 Mark Burton <mburton@qti.qualcomm.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20230519170454.2353945-1-alex.bennee@linaro.org>
 <20230519170454.2353945-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230519170454.2353945-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qP3M1LdycpxK

On 19/5/23 19:04, Alex Bennée wrote:
> We are about to remove direct calls to individual accelerators for
> this information and will need a central point for plugins to hook
> into time changes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/sysemu/accel-ops.h                     | 18 +++++++++++++++++-
>   include/sysemu/cpu-timers.h                    |  3 ++-
>   softmmu/cpus.c                                 | 11 +++++++++++
>   ...et-virtual-clock.c => cpus-virtual-clock.c} |  5 +++++
>   stubs/meson.build                              |  2 +-
>   5 files changed, 36 insertions(+), 3 deletions(-)
>   rename stubs/{cpus-get-virtual-clock.c => cpus-virtual-clock.c} (68%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
