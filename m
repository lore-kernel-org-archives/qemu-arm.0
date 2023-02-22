Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4189182ejb;
        Wed, 22 Feb 2023 03:13:54 -0800 (PST)
X-Received: by 2002:a5d:6052:0:b0:2bd:f5bd:5482 with SMTP id j18-20020a5d6052000000b002bdf5bd5482mr8136557wrt.28.1677064434329;
        Wed, 22 Feb 2023 03:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677064434; cv=none;
        d=google.com; s=arc-20160816;
        b=yHylzFqBhRCFMwRypDtb4S2ha01n53euyURiGkqVDxX3cYxQk6Z8PM4ka5SI+OFLjA
         zDuNiOlAwteGXfmVsCgqahbvS3SOhKW1cpREnGFqqU4AyOkSua91XWEOE7zMxVfilj9G
         7iSUYxZe9OyfI1EFYVkl1XgxpdaF4woI0qDe3jHGQpyrAUtaTQwq+vVni/yIwsDajl2E
         jOHEf5q40U4XO2Qa8eYbCxVx5PtkxfXu17Y13Ej5nv2rJcioEzhNltdMkx5v8p+0QhW/
         YLJJbHaW/2ck3rcWiDnxnQTF6dS4vt4+mCVSiKMVF4j1MzcoGgI/C2x7ry8kLpNCf3K7
         sxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aEWIja3pq4fTwElbbD7V2BQosGhagYHtST01YBX0INg=;
        b=Bx9ZWX0WPkpMApdu3UtTtRyGf2LzKxwHDVCvryVH4AfdK1Jry49mQ2UimhOs6VyGpm
         wc4DznEgRctD/Z8HgPn8x3+qNV63PccW6prkheFdtqT+vLHx3s3QjoEvVdkZyevhb/2V
         u6yPWqigBreHtWnv5cDmCy3bTry7tm1h2ohSJqPvurwFDQbaOx/siU4p07lvUCt8m5uT
         dIm7J7fLImq8oi9DrMDKafvB1YqOWT5Ef5XGs2FPvYB6KMI2MwP6e0v30fhAf3DCtoNN
         637PQwMDPCnxrD/QtEtgkS3j7PdVz98Bguw4kISy35ZdO/DItos01G2+7vebRSvNCBKO
         CP0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xYbk4Akr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z3-20020adff1c3000000b002c57de47797sor2197625wro.2.2023.02.22.03.13.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 03:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xYbk4Akr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aEWIja3pq4fTwElbbD7V2BQosGhagYHtST01YBX0INg=;
        b=xYbk4Akrx07EA8ayChEbdEumf6PTAcWtSBZxhuigzV5CWYqgpROadOX7BFq8Y3nM1b
         j9cEHDieQQrc6rGcJH1rN0iF9ki1NsAYU7UmTv9n2SZ6YN6QLlQ613wDGHS/Rzxbhmfe
         cvq6II4XUf0uLwPChtmItfu0x7g5gHSiE179/LIcX5H3zpolYWUwvieyFO3Tgpa/2Bo8
         eMb+VkrsK1VuPItJKffid026k6AhCMuYcnjHd32wFWyssKhsPmh2+As9bG0S+D4a2TXg
         1c/QZ+zDlbk29XWhx7YZ36ndVe04xkKB4htb0gBDCf7vM+Dcv260/qTj2SL6YOC3qb8J
         9lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aEWIja3pq4fTwElbbD7V2BQosGhagYHtST01YBX0INg=;
        b=aoYzA4Mv/EoH2F4j6Vvc2Z2Wi1tSN8IUswrhIlpp97NZoomPXR1lwysi/5nYS1lMTS
         pr0co27leAtToggpXdUFm1MeY3mA5Bjz9rNvmHVAK4MqGpvODRYJRmkQRLT5FjKFC8Oc
         K7iH3EC8Wk835kXJmJeU/dY5FrnuYvu235Nz+BJ9FyZfLSmwku9BH5A8kXPVGRHFR6pV
         yktDHRp3Hi5Semy41vXhYM7km/0HOjcvq1XOUQX1RX5uT3uFzsFmObdF/CrUoqidRa5o
         +InRbl5ocQklslR4xTxFMDEDUtctY/MqF4LtnjETSIa4VHZM/qZ6AtqlfmHOBuLqVdFX
         X/dQ==
X-Gm-Message-State: AO0yUKW9jLOyTk2hPsxrM2OhHHwal9gDiI63DdbNgggTxexOtuJU5X1F
	LhSlDL8U17F527a/NPyY41eMpn0xhFLx5ARjU+0=
X-Google-Smtp-Source: AK7set+eaOIs9+usm+ggkj6dTsd15ETJkIgvroqoatKdkJkOUsylPeS9k4eXu1ScweiBA39i+OUTkg==
X-Received: by 2002:a05:6000:1cd:b0:2c5:8575:c37 with SMTP id t13-20020a05600001cd00b002c585750c37mr6751913wrx.66.1677064433742;
        Wed, 22 Feb 2023 03:13:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id j16-20020a056000125000b002c5706f7c6dsm3908058wrx.94.2023.02.22.03.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 03:13:53 -0800 (PST)
Message-ID: <df642e1c-3c74-5cfc-b1bb-091dfe147fc2@linaro.org>
Date: Wed, 22 Feb 2023 12:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222110104.3996971-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: X4PXJ/LjmiHc

On 22/2/23 12:01, Alex Bennée wrote:
> This is a mandatory feature for Armv8.1 architectures but we don't
> state the feature clearly in our emulation list.

Split in 2 patches?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> While checking verify
> our cortex-a76 model matches up with the current TRM by breaking out
> the long form isar into a more modern readable FIELD_DP code.
 >
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/system/arm/emulation.rst |  1 +
>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>   target/arm/cpu_tcg.c          |  2 +-
>   3 files changed, 28 insertions(+), 4 deletions(-)
