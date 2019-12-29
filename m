Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp13852119lff;
        Sat, 28 Dec 2019 18:55:18 -0800 (PST)
X-Received: by 2002:a65:530d:: with SMTP id m13mr64030123pgq.351.1577588118711;
        Sat, 28 Dec 2019 18:55:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577588118; cv=none;
        d=google.com; s=arc-20160816;
        b=jnv7goHa/zermueP6ZJtJOXCiis6MD8WSe7xpXV5zIMg8y9YcwBKiGFXAcAJPz5WGa
         lqzfbIBfm/VRN9PC4HBbWgN2C8MMY1ARzyurLQu9OBB7TBsfx3cAEnpuOqnLqbxIOEPa
         DamKhsqAhKpcjDoRz3aOyYXIXcINdMjnMKq8TJXnpT1qA1eFJp92R+R1sXCY9Lbx6eIk
         fIQ7msIF/XwU4/5EiwxBWAjtrkcG0Y5HkFhKncTw50/KXSJg3LfytQ7L330kjsYRbbqX
         O1Po53qQUu4qULfei3GXC7SDycDW+ww9m9SDBI8hMGhMIxKvWPtsu2IED+f4NYPauXLJ
         HZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=AQ5wuWBkttqWMjzeFk3QomgPdhj10I/gl23e6kMq94s=;
        b=oihEEmiDwNWsVOREqjQislHPibmUgkbN/BZZHlkGm0LF8+IZhUZIN1IAmtBWKJGuR8
         883wjxJKD8ZU4W2UJxYaS0CCdTaFzaQpTiD8lCTY9VTi6Htk8PLwHhBMaxSEXLf/uYuc
         OLM1KW+Xq4ghTYN+KeOJHBa/WwD4uk1fOTm9X2r8uDo/HRiBr/bts/uV7wRZDExtumnE
         sJ1gPY7JjSB9cDGwCFBNuah2v3rCM21JkanRXT7r2gsu1qie9J0H+qnmSBqmKymcC/qb
         oA6TXdt+pzizHtlMMerUMfeZaqjy+2k1G7hHQz+m3seQ6kGFx3QNNVVvrvElEORUwdCU
         2/0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xhdSf+ie;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z18sor40108805plo.50.2019.12.28.18.55.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Dec 2019 18:55:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xhdSf+ie;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AQ5wuWBkttqWMjzeFk3QomgPdhj10I/gl23e6kMq94s=;
        b=xhdSf+iecpNeeGVwG0otkJI9H72zCUX16A5CwbcMsMmwt00kPYe8nQ1UPyGSP/XiMX
         3x87StfF9KsNkdbB+Rbovzm87n1iRHQpfT1P13AfqDaL9NavmGuyrOc0FwwwI9o+Jdht
         iNEmERIOgPD13LEU0Asc1/o7VomWkzyAZzSy2RTVrZNWxTW+cjfWiTE+E7CpQVipzaDU
         XtlLfCC5DXYAp4K/iSyPA/XAPjMb/Sz1ZzcuGOFbbN5Tqbx3wT3fg2gVHyVDkKLueaQv
         IFgiQGnr98ZGlKOWOfXwqz8J8wE/pXTesxMQCjYZiXYyMCBf2rgCB/XbTUr6HDPSvwiS
         YR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AQ5wuWBkttqWMjzeFk3QomgPdhj10I/gl23e6kMq94s=;
        b=axn9g4Ghg3rEAEbOv+iV62hI3hz9ddKkctfmAHsX1iBcrDyatc+fRaw0FbkZNrfIvu
         L63SFDuqDZPCIpGDp1Yo3adjlQM6XGiUd99bE8nhous/VrLOFY6UvbxsO1NDG6kJBzxC
         NDRLkQlJoqZ3bEiURmZgbl2yoJCTCRol6qhsX6029bF43XJy3TYeClaKtjy1Xqnvob8v
         HEylNN5FWyQo549HHK/LhQSwkB6tRhuk6qfCEKxpbS6rA4SL7WKpupm5wrkfm1p0Qs9F
         CdWdxUqY5N85b/qvoTqC+pee8W1qvkQR8s6t5BjoDUT4DAApvQcvI/PVUu4IbMVZ0whA
         HCxw==
X-Gm-Message-State: APjAAAWIIwUE6OLcItifD6aIq+HNzsPj3GAUEe6rcCrFG7eiD8Mscp8h
	maAp+q1YW/SiMYgeZ79dsc8BXAmuYM90Suql
X-Google-Smtp-Source: APXvYqxdRsTr+OzhYPD7oVlv3tn76et79APt93h8boIWh41u+Sg3UNPIQ6vqzsHuPJTijZ08SeyhBQ==
X-Received: by 2002:a17:902:9302:: with SMTP id bc2mr44060166plb.328.1577588118263;
        Sat, 28 Dec 2019 18:55:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.118] (194-223-58-9.tpgi.com.au. [194.223.58.9])
        by smtp.gmail.com with ESMTPSA id t187sm45508694pfd.21.2019.12.28.18.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2019 18:55:17 -0800 (PST)
Subject: Re: [PATCH v2 5/5] tests/tcg: add user version of dumb-as-bricks
 semiconsole test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, keithp@keithp.com,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191220132246.6759-1-alex.bennee@linaro.org>
 <20191220132246.6759-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <09322c6e-74d9-08d0-1138-f2d5581a7244@linaro.org>
Date: Sun, 29 Dec 2019 13:55:12 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191220132246.6759-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: POID3US1AHuD

On 12/21/19 12:22 AM, Alex Bennée wrote:
> +#if defined(__arm__)
> +    register uintptr_t t asm("r0") = type;
> +    register uintptr_t a0 asm("r1") = arg0;
> +    asm("svc 0xab"
> +        : "=r" (t)
> +        : "r" (t), "r" (a0));

This is the #ifdef __thumb__ svc code.  Are you enforcing that with
command-line arguments?

Might as well fix this, then test both arm and thumb.


r~
