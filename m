Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4346553ejb;
        Tue, 13 Dec 2022 08:00:48 -0800 (PST)
X-Received: by 2002:a05:6830:2aa6:b0:670:9e78:4b64 with SMTP id s38-20020a0568302aa600b006709e784b64mr3618073otu.5.1670947248424;
        Tue, 13 Dec 2022 08:00:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670947248; cv=none;
        d=google.com; s=arc-20160816;
        b=DQMym4INEUgcPuYQB1ZiKZXYSZRkKaAuR4hfPmiei+iset6PfKgflxNWWaH0onyssH
         +lkE3wBN4ZGZ7+c7Zs6w7AyY6zfVK/+dFoRKVIHWqFvT0BGFZ6oB5EvItNJ2QrmrawZW
         Cm6VA/gEuaKloq+rbq/g4oFcbY7g2ZLEPZnabU+fEAgDXmiq8AqA4ezcbsxx7UERIZRH
         gQ7ICrJiexFF6dT3fwA+9UYAqAfBGGcLInmwxCDk6ue1BYK/UQoqLHwMlnnDEurFWd8D
         mG2XdW3V/Jq2vQGrsYhP0xZSDxED/JVjwet9JBFDJq2mQL+VT6uq41NdjKbMiq48tGue
         iT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7IOsuMhzoCHld82UpaeRyQHLz3UTagxJq6tw21H1iDg=;
        b=IviXk7oPRWLiMhFiI/xbWdXXHIKXwDcMABeBSAEkCSIu2IX29QosVwfiIJca+NHu4n
         ynbukqKE7KU2nEuTcrcUIjmopaL2ng5P9ssBa5rf20kujykaDQbBDqhokP/MLCcd6Fku
         6vTchElgrwuVCj7fgYqmuWXtWWEdhzWAbVbwt2k3uAUQPK/Pd1B4K00zsKDlPxphb+Sd
         mDfwEGoDFWyyg4JDV91HPT35KD6S/UKRuuTZS7Aw6Gb5TV7oYzQzq6s3jmmuYC0U38sD
         fi219SaOFfDGI6IPllHar7f6fJ9Cv8bjFYwY2yJnbtry0YE5WAOckAI4QBo/jVAbNVH0
         Te6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c5CPrq0V;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o13-20020a9d6d0d000000b0066c64ea7cfbsor541196otp.115.2022.12.13.08.00.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 08:00:48 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c5CPrq0V;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IOsuMhzoCHld82UpaeRyQHLz3UTagxJq6tw21H1iDg=;
        b=c5CPrq0VefkMEHAgwwFXimhe7g148saM0ufiMW7+gVlGAFLhbQKVHFYrRGqAeEuzME
         N7gDwMAJUXMM0t4n3vUOtmPz50B6Tw77bZ4gcffDnMMASNNwWhEOeHNqtJQY96uSZao1
         b7xMPQEySRr7272mcUWQq4dRMxr4VG/IeZ+dkM0hMAJMqUlpDzlM9A9DuKaawXqtJNS8
         9m5LDDcXJFWAnGCwvWWVcfSEMu3EGKmfpzNqKsxvTjJBViz5q5zSpXYvM3sXaSxxXAML
         pAd8aSdKVuqkg8TzY3U/n7BN1kmDtJZKk9FYIRwz2+QP/4V1+rWQDV+YfUvqNzXA7fnL
         tJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IOsuMhzoCHld82UpaeRyQHLz3UTagxJq6tw21H1iDg=;
        b=Eks/4c0pzvfPEQWfW9sTJOWc/GJW1r+G85Ur3dELIrKN2TywJ7IW67UGtd6aVTv9Pw
         655znBVNiqcn09ZkGUGWjeVu4EGpuW2oioH5S7FhnXkVS1vUU6SywzR5kdRzOytCt6zf
         21mqmzQnPaEOd7LO06Gq/5xMjYdZa7Rh1JBFPf2hl0ISjFeNS72n4NBOxfdzthyF/PN/
         jvje6wk/CgpVCfZI2BcgK0HXG0UQuwb/dgTT5BcHty18lEoxOXB1JtOlzFZcfpwIAMvg
         /vEShQe+4YghzWVx3Cx5mQPm/GZDZUsKNggHKzOqHiefcMGp+bU8xqToEtdAMv7QIBJb
         D4Xg==
X-Gm-Message-State: ANoB5pnqn2gimxjSRNmd4uds0ffjQNu7t+2c4VaoiUX3x51vH6Cftk/r
	k4C3zleeey10coSpCisqbsXYtVQP
X-Google-Smtp-Source: AA0mqf7W4lo/eOQ9HEif1IQ5r7hqHR1tmlqz2PO2eE0ssQ+irHomhXiwe/0jZVSo6ALKBZzU8JmcOA==
X-Received: by 2002:a9d:730c:0:b0:670:9684:404c with SMTP id e12-20020a9d730c000000b006709684404cmr4243556otk.28.1670947247647;
        Tue, 13 Dec 2022 08:00:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2806:102e:18:2efc:c63:85ed:4256:8ad0? ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
        by smtp.gmail.com with ESMTPSA id c25-20020a9d6c99000000b006704589eb54sm1292173otr.74.2022.12.13.08.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 08:00:47 -0800 (PST)
Message-ID: <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
Date: Tue, 13 Dec 2022 10:00:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221213125218.39868-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JwRqK4/zn56y

On 12/13/22 06:52, Philippe Mathieu-Daudé wrote:
> Assuming the developers of commits 2c50e26efd ("powerpc: Add
> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
> aCube Sam460ex board") were testing on a little-endian setup,
> they meant to use const_le32() instead of tswap32() here,
> since tswap32() depends on the host endianness.

tswap depends on target endianness.


> @@ -255,7 +256,7 @@ static void main_cpu_reset(void *opaque)
>   
>           /* Create a mapping for the kernel.  */
>           mmubooke_create_initial_mapping(env, 0, 0);
> -        env->gpr[6] = tswap32(EPAPR_MAGIC);
> +        env->gpr[6] = const_le32(EPAPR_MAGIC);

I think this is probably wrong.


r~
