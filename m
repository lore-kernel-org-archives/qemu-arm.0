Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3844570eje;
        Fri, 14 Jul 2023 00:00:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a1e:b0:668:82fe:16f1 with SMTP id fj30-20020a056a003a1e00b0066882fe16f1mr4724599pfb.1.1689318036964;
        Fri, 14 Jul 2023 00:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689318036; cv=none;
        d=google.com; s=arc-20160816;
        b=m++A9QkgOcTNvlxwcUApi6N1tgS8hNtQGlQZoPdPVOQnHZxdA8aXYrt4miCUnIO5dQ
         xRo05ToEaoPzZQJiwhJotbiKpKpW/Abhmo1j83f63+2ZTADIH75mJTKDMKL3YkjPMqbC
         MO9oacIxDcJoYXMOT6gCtj2OfIrH7HImuHbk8oFTzIK+MhBlAg0ksbGBq6CLfIQ3uaOx
         YTXwE7id9ySTMJ7H8yhTlqvLJtikDyD3KOwJVJjO8UI4Q/kvZBzzLfMaqqESyOb1iNET
         6JvwwOdafYEw6DmGkm+nlzERp1Oh3Bxtj94lLC55OdqP76h5cYbvTnRtvEH7Zt8Z+KeM
         TOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pAKA0QabmqHkU+d+oceFox8otAHUlSc6ZWZkW9K5Zfg=;
        fh=7xRdbyAJIZ4GsNLuMi8tzUCGyvR1ri+VlSyqfzUHa6k=;
        b=aVCTz/q2sfbGA86qpJIhHGe7gqzDyFahpMfyADZNOPtegAuID4akwff1fpR+s7YBQM
         3nbYJ2s7GVG0TA7YlpYAvhAmQ+NgcTK+uS+9ZYpbKv7x0nFP6/uZzufOnuje/dOsZtya
         0RNtdKtFIzPCR7CZvRcN33SrKJaJiD+6JuaChnoPJoYa0hcsv4+snlWdeJLugqH9FSO0
         GntH10RZaesY3fQi2DLov+qOLJIXzlnQ4L2t0N7F3k2YHO5i4rOPXKzJH/lxWr7zvD0u
         vKEHfKqY+l71YUACga4X5c/BgN+O5PdHKPBe9Qpo0qsKWwGtUfRz2kcNcbWy26sN8hkQ
         0C4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WW3n0iEv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s28-20020aa78bdc000000b006823dbdd558sor4820385pfd.11.2023.07.14.00.00.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Jul 2023 00:00:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WW3n0iEv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689318036; x=1691910036;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAKA0QabmqHkU+d+oceFox8otAHUlSc6ZWZkW9K5Zfg=;
        b=WW3n0iEvuSOGnQ5lH/HYNfqceuAu/lIkd5VHp6H1IRWo5oM8jIEutn5q17POJkcQVK
         rqTAvwMd4jWzlhYhHOwcDDbFOfyj4xUbZJUnUkI1ftNwWZf9WmBX3hLB0gkcKntqrZPi
         dPB2MgLMG2PPDTat479AsA81uqXh7+Z8eh/e7RoApx/BkEMeAE95ls7KEMLl1eIGkohT
         EuYBT/f//OpYSZcb4JGoCs0EjlK4bMjlHy2nBLr4+6XfByZJgrktqTqSNdWGe6THhYRN
         gdUR+W52EHJJ50e4SHxvLjtAjxdk2QuZQ1WZ76knFeB35BR/HtzJ4wUMJEF3mDtBRKWN
         l5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689318036; x=1691910036;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAKA0QabmqHkU+d+oceFox8otAHUlSc6ZWZkW9K5Zfg=;
        b=aifBg55XiH9va90GhEEHJB09YdfPWa3iCR2TgopypqHXRg4kWg9LZ4dP+hobl7UWDE
         OOiG4FzRI2PUxU4BPHnkraOX/KEkPkaeSeXbxEX/1YguboeranraBe/QnCQSVilslZ8R
         eUR2ORLiX9T5M/VCuhJYiw0tlaH4FgbQZnCKKxJF8yM9jvKrI1GK1oU72lA+gBcpCgv5
         F3nlJyz57IlX2ztRC4q9y8xEk6utZOxEO4Vnsv8Y8ra/ybR6kzn9yG2LYycdMC2ykpi9
         x5DcM7KMGBENFA5uFqAnpWbvqYcFgGh8GX1fST8Ri3jJehLpQIikRN/m/3R4RLTVg/te
         VVfA==
X-Gm-Message-State: ABy/qLZmfM2pigj4ToLHvE9LWc8bw1OvSVeE2vEIO05YikWzOgam8XZW
	6ABJCETZP6h5V7qfnJ9qY1rRUjAn
X-Google-Smtp-Source: APBJJlHhVTO76nDSTJ6/pC5QBycGSiMnMLbB4W2T4HMZ8gsmUbEkyOvyH8cOs8x15HT/j3LkueQhBA==
X-Received: by 2002:a05:6a00:2d19:b0:676:76ea:e992 with SMTP id fa25-20020a056a002d1900b0067676eae992mr4897124pfb.5.1689318036450;
        Fri, 14 Jul 2023 00:00:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id v10-20020a62a50a000000b0065dd1e7c3c2sm6410290pfm.184.2023.07.14.00.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 00:00:35 -0700 (PDT)
Message-ID: <82bd3dc8-ff75-65e1-82dd-651bf73b8960@linaro.org>
Date: Fri, 14 Jul 2023 08:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/11] hw/char/pl011: Extract pl011_read_rxdata() from
 pl011_read()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: d8NNIrUesvqP

On 7/10/23 18:50, Philippe Mathieu-Daudé wrote:
> +    if (s->read_count == s->read_trigger - 1)
> +        s->int_level &= ~ INT_RX;

Fix the braces.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
