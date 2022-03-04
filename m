Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp78430lfo;
        Fri, 4 Mar 2022 14:28:20 -0800 (PST)
X-Received: by 2002:a65:63d6:0:b0:375:7cc6:2b63 with SMTP id n22-20020a6563d6000000b003757cc62b63mr436425pgv.598.1646432900417;
        Fri, 04 Mar 2022 14:28:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646432900; cv=none;
        d=google.com; s=arc-20160816;
        b=AuzqDSFCGjs/2FRJU+ccPSu20lhjZ5NAkkQTZvehJyjLhvt6p7daUrzRVR7NQO0Jr/
         59/gMYixKnzd7xFxITJ4ZniKZfyrC88H437fqwDK06t5MXlltrcA02ZXkX1WHRrEasR+
         2FeepRFn4Rk+iHdIpMN3bj1uBG89697RY201RIpF2iENmm2qoeHeLQkpz+CPN5zoF+Ga
         dry9m1rzvrxS43ZmCptfgaWSzv87WPAM95wSshNNK0qNZ6flSnLL7BUEQqfyUfOwN1VA
         pnVGknqaxrg/kTMoRNQeGU8AvJkOefRwb1evCEXIXotEeE9OwxgOaZDcJ/kXvRuWgMrr
         y73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2C6jQFvVTWzy9SpOtnw/k9j/etr9nmeSuovKK9z74Ek=;
        b=d1o2X2wogBfIfNQR093vfyWGIwN/TZDBpGoP3fj+/u2+b5FeUQ/8w2qNGDYI4YtfFn
         G4w0lRi8C1C6QqfAVJuFSbniUYKwkLTTzZDVzsFhyr7ISlTdSlbgH3OZzzm+gtTAdjuc
         ml3yE35ty35+6K/lJn9+xpyqN69PJeK3C7JZTbG7wAIOWmRUQArqJGQjCij5prm1pvvg
         hnrq7W5agTABBRy9ag95cGdPPZeGjOYg4lUmyY4KzcLro/EVVl6W7BiADRGmCBgLNkPa
         7nyCBx57oDMfBrwKZE4Vk7L39QjSHSoNLkXGeCNpRnpy+jTky6sIRkV+eBCAryQKSj3d
         E87w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K45DYilO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m17-20020a056a00165100b004c034b6eaefsor2006009pfc.3.2022.03.04.14.28.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Mar 2022 14:28:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K45DYilO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2C6jQFvVTWzy9SpOtnw/k9j/etr9nmeSuovKK9z74Ek=;
        b=K45DYilOM1EGXfNqVdY0Q87Vd8pn2C8vUnd4EPpriU/pH1RtpSQEE9GpUyeNJaESSW
         vqjdVn2tkW5F6GVQ/MFJdyTu+K9NtqV6+UzPRQZ2J/viFH+2alatOofRKLjCin5NewIf
         YXe3JME/OEOKj8SyIgoNkXNasraDOimQIK5eDDddeXxX3YucxetTXjahSknY3X/scbFY
         wcK7r69VAmVQVP0ULAEKI1+Ee5VJ5kMgjJnxp7XC8YiPxupCMPQrvTz12xQ2dYtKPYtY
         cV9UnK9U+L0n5PVQV6eyJU/DHfQ6r2vZkQrl+xCi1TCKIeD9u9214LMl00qteVBjEwCf
         LjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2C6jQFvVTWzy9SpOtnw/k9j/etr9nmeSuovKK9z74Ek=;
        b=nraKVXGz0+OFoKWmxoaRwi5lkO5Bn9U0N0yOBycDCYlW+f18o5cXVOnJo6YbO6WpMl
         QdkoRg8kBBpcVpjIF9ABaQsYE7lpAi5Y6UNxrRH0SKmV9UZo7DwrS4ZOuPGysXGkkBp8
         TMcWvDzZbCmqhjXD3FL+VjX4AaoNnY7E15z2y9ZdgHZ12Pjy+Wx6XqxQRKimjb5jPwZL
         lmJuNaLTL1cdjV/YAvuNJXf8En0b+qpijnt//U37K/eTsOYn4Wjzp5P7eqlLBA2qjhPw
         qntsz9NpNFMAB2pdSzSFapEzyasexDAHaGhZbpMLzp8W5lFT0dIA9jvtNsktSEkBPbgy
         0jrg==
X-Gm-Message-State: AOAM533FwfrAPVdAvWF7980h0X0VKX7mcvmMyeYB+nI/neWQ/V5HakIH
	DJKiXlnvOtYShQf1QkaPLFRs15lz
X-Google-Smtp-Source: ABdhPJxu9Lbfft8mH26zuQRKc6n0AUYTzKToOZYmxBeFXfKxZKQi1Q/zZlXmDKoy2RAY/J5EsCtjFw==
X-Received: by 2002:a05:6a00:244c:b0:4f6:67b8:a6b4 with SMTP id d12-20020a056a00244c00b004f667b8a6b4mr690992pfj.51.1646432899955;
        Fri, 04 Mar 2022 14:28:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304? (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com. [2603:800c:1201:c600:f24b:57b2:da7c:e304])
        by smtp.gmail.com with ESMTPSA id v65-20020a632f44000000b00375ed63b2fasm5365838pgv.86.2022.03.04.14.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 14:28:19 -0800 (PST)
Message-ID: <332b0e23-0e6b-3680-787d-b5086e2589ae@linaro.org>
Date: Fri, 4 Mar 2022 12:28:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
 <20220301215958.157011-19-richard.henderson@linaro.org>
 <CAFEAcA9zcf+A6h3R+x2uSEk1aUpV_iWfEZT72CCUeSs32OUJcA@mail.gmail.com>
 <df2c63db-54d9-ae40-f403-b1adfa6bdbdc@linaro.org>
 <CAFEAcA8J7e_KeiV4bqZd_UnTveN8-5-YRr7MRKXWSWHa+x2WvA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8J7e_KeiV4bqZd_UnTveN8-5-YRr7MRKXWSWHa+x2WvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: l6x98L4lFX+R

On 3/4/22 12:14, Peter Maydell wrote:
>> Yes, that works.  I'll send an update.
> 
> Do check it with KVM as well, to check the "CPU doesn't actually
> have that property" case...

Argh!  No, doesn't work.

Unexpected error in object_property_find_err() at ../src/qom/object.c:1299:
qemu-system-aarch64: can't apply global max-arm-cpu.lpa2=off: Property 'max-arm-cpu.lpa2' 
not found

I think staying with the v4 patch is best.  It matches quite a few other examples in 
hw/arm, and uses the existence of the property as part of the logic already.


r~
