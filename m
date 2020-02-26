Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3638837lfg;
        Wed, 26 Feb 2020 14:49:48 -0800 (PST)
X-Received: by 2002:a17:902:104:: with SMTP id 4mr1563946plb.24.1582757388061;
        Wed, 26 Feb 2020 14:49:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582757388; cv=none;
        d=google.com; s=arc-20160816;
        b=yoxzohQtfkfaADtqolkikyY5QgJrOhWOffyUlwPv0AXxHEy6JzHZOLK29Z0qSYPiIy
         8hbydGvPLPh4X152YhiOTbQ5pRHTCZFemZApA+zjevJtu4Qdo8K3mDIsm4rmzkI8TU9d
         Z3I/8NH+CV1x0cYaoNaoQ75iO3NbNVsAu1vI+DNJP5+MFaCnmDsvGG5CGtIzZ1T0CVSv
         b2sO6lV3KO4j5U90KfC3Mp3yxGfHSOo6d60MdCRdLR6TIumG1e87eISyzQW8fJ8M+34j
         Q8FnX3M/RfDhXf8aLtGk21JUJ5+ig8cdZ4iZGNBvSuUcGkUhGAv2qbGZfMfzwr5I70OD
         S8Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=VP3gll11f86CTRcwmjPBh1Eol8K/ihxbxiVaCfc3vK8=;
        b=dtv/SwjV1wmPT6KDaT5SDuIen8LkR/IcVq6ata8U85wVVqEi7aLookCMPsgFGfdsaq
         6SAN/inTmZz6f4hBhO+tWmLSXQXNY67g23xsrl/IMEuM7Ea1TNAQNluFlyApkR5pkHp+
         vlz6u+XipurBq3p270xZHphfgWKEHFCK5ilRE4KjDDPKCHUXcuYsAP4n0yu6naRDrTBt
         eMQWBuuzJFxT1o6axjvO+vds/byjXR1yW2GcNjdJHTKRuRWMVunourvG2mygyXQv2Tyq
         xHy4dX0ZtCOkwgNP2NDNoFVGjVldNfFhJVd089ZZEF7WR9XFPX4Ff56uepmOoKq4KJBy
         CYRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQZsQ63l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s13sor1132623pgv.57.2020.02.26.14.49.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2020 14:49:48 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQZsQ63l;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VP3gll11f86CTRcwmjPBh1Eol8K/ihxbxiVaCfc3vK8=;
        b=KQZsQ63lscHJzGF1diWK/qnwSvzLUFCR//508ekf16J3aGwoKuMLt3hVQZQX03I2mq
         hKDsaVRd21k0NHG4w7W5hTG87ti3Crr2/9OxZ20dODznzzEwXeo1o2qve3SsXSQtB2cH
         AGDoeGQterz4PzEQ84iicEHhro0Xcbbgs1VRjzpcyPuavJlYxDTCU85+ObeMdx32gGbv
         YiM2tLsKleKte6nf/RGskfAR/khDwwSWwMRUyQrnaKedBtbZRC8wnhtCvdJxDhuycSaM
         VyxmZqdS6sAQC8AnvMIKURnV4nmjvWDnZ/B0OET7skojMLMo5pHVqwDMY3ukUnEBrttF
         MNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VP3gll11f86CTRcwmjPBh1Eol8K/ihxbxiVaCfc3vK8=;
        b=BlyS/8xXUpBJAw23X9eLweQCN+Ib6mXNpQ+FGQwP4+hyzbl6pF6b0ftvacZlnrcUXW
         W0sAyz1J0yKGoa1Ey4rbvJ3793atfq5JE6GNxw99Raco1BLynji2lKWutB7lmvo3RGd6
         PxyInZ2taR7bvDQqlJ7DMHQqM1HvtEQey/2xw/VkFqqw8/f/ziRPx1rLETDA8gnqCXBF
         5XrAZ3pQsaSBs/ZS5PQrVbPnxOxeHmmnzR1bUMmkNJnRYzhQxfAsGYEtqXyK9LZmH4yD
         RreuBFaPQZZBC670KMvpU4HHwiW+06XnBh5cyXkhO00vwbI7Md13Py8fHbreL1PWXkpk
         yscw==
X-Gm-Message-State: APjAAAW94NJluqyf9kJqShVlYp0NAyiKZOMNiyNQhtoAUk3ab3wp1F5u
	N/4xG2cJrhvy8GHh78f6XsYhYYmA+vsCxg==
X-Google-Smtp-Source: APXvYqzUSvO424up8z1hcD6T1XhcCaUtqzLh5aIhCYn3tiWQQOuyquXKARHzSh7Wz4YYEbeQmfKUBg==
X-Received: by 2002:a63:8148:: with SMTP id t69mr1028220pgd.187.1582757387613;
        Wed, 26 Feb 2020 14:49:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id r62sm4248542pfc.89.2020.02.26.14.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 14:49:46 -0800 (PST)
Subject: Re: [PATCH v1 2/4] accel/tcg: remove link between guest ram and TCG
 cache size
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86556987-dc1f-fa81-5f9f-fe4b438168c0@linaro.org>
Date: Wed, 26 Feb 2020 14:49:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226181020.19592-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JAUxZTfZpNpY

On 2/26/20 10:10 AM, Alex Bennée wrote:
> Basing the TB cache size on the ram_size was always a little heuristic
> and was broken by a1b18df9a4 which caused ram_size not to be fully
> realised at the time we initialise the TCG translation cache.
> 
> The current DEFAULT_CODE_GEN_BUFFER_SIZE may still be a little small
> but follow-up patches will address that.
> 
> Fixes: a1b18df9a4
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> ---
>  accel/tcg/translate-all.c | 8 --------
>  1 file changed, 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
