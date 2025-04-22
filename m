Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2164260njd;
        Mon, 21 Apr 2025 23:53:37 -0700 (PDT)
X-Received: by 2002:a05:600c:3583:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-4406abb2407mr116380685e9.17.1745304817068;
        Mon, 21 Apr 2025 23:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745304817; cv=none;
        d=google.com; s=arc-20240605;
        b=O1AtamrCcqNLpx7wff+ohDpa1rNXEzMAFnPOyVLCg+Qa/w2tutncIS+LhGa8iydM6C
         nwFyXf/dvOk74APfLmU8Ql4FgVG0qNH7aR+0HGpNeSgwsUvr1q2oyJifiedZthBO/DrL
         0X925R/s287kwJ+Iv+RQv9HcnzFuWknA0umoqNZWDGpiZE3KQnrCHK08f2X5XlbO5GAU
         g+5OfZ3jeQVLpULI6IQJH1f+oGVJBKzXSh3ocmRj00hrdTCoNNG5J9dVvOPX2RjJtzjE
         xnjhVOzBSK5DA2ffooiaKO6pUumRDRDKVFbmP0kGDrqMQ+hXewXIHnSZMjR13oNLzXoO
         y9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=p8/DFEQVigL7bEPSBBfEB+aegBcmSUE0EBD6KX0VzE0=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=No0PpHWIxsDdgw0aCANz9SZ0rG2Mi1eKBW9sHFzyYKOddthtbo1K3hOXJqz0IBJRun
         3um1BrdfJXo9+zU+makkppqO0lOCoSB7ysGUzUo54Ghm7wKMAXK99DKMBpSMj5IYwbyD
         YjMW0QcqPQJGXngjDRKhTFDdc0iGsYeaiAX/8Kg+9CXPlhx7VFXSvI+G4JfcMSC2QMXM
         sE2fdSJwAHj7h8HWpqk0yxNlAy3JsUgGt/AgeJ9+Tk/WzDmuInL+MpF6xdROx4sjemJe
         W5eKvp6f7XlfKhjGXz1ZVcIJWd6H0Bm2OYvNRW+c/sf2AAVNbTbZaSLJAFP0p8Sf65Nx
         GpeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PnAYp11q;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-44069a00192sor34112605e9.10.2025.04.21.23.53.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Apr 2025 23:53:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PnAYp11q;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304816; x=1745909616; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p8/DFEQVigL7bEPSBBfEB+aegBcmSUE0EBD6KX0VzE0=;
        b=PnAYp11qnxUMRInBQG4WpPW3w0cEbuDayYG1NgQoHCwp3ZkmYg7d/aGaHg55oCqYMx
         hNkVIp4nWpJFfrTIKJdbh9N4p5ICI9FDI6geY8qaVyzHzPsiU7UUmxlKZZaVvfi/t68p
         GF5hZqhsyTmM2ZXFuO+9eHH1lpEN/T+S5g6Mc8P050VHw5SKhknCXd82dYEN6uUSNJd1
         ONyCfdBH9mKm+Sd2Z6R03yV8eLGKyru6TFIFylSqFjVWKlueyiH16O/NQT2GLmX7u7Jp
         gJFTZlK3nAhwtm7m6mChix4l1S/mK/P9uFkwBNL5vn1Rk+fBJeVtXe0CuHoBHmy9rDHT
         8Iow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304816; x=1745909616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8/DFEQVigL7bEPSBBfEB+aegBcmSUE0EBD6KX0VzE0=;
        b=jweuI4smoFepXbW6r0IYHdAA7izr1mUIrCh24zbEwmuRMoajMQ8wZWWv7f91uz7F/r
         hsb61oGmvQ9QaJC49LbJ/9ciyvXJCjVB8tZU0rrNdINh444wxCYTD7QfJKMzZx11W0xM
         uhi4626uK+BO4BrWNuHBfZp/gS9FOO/RRlgzcxSYbQW4RAy2PhdJ1tdvK1k4ZJjFfyCb
         0Y+scKBxvsj79A23VwzV6p3KCZ5v4T/jGH+pQSM5tCAt/TS2ypvgy4DmQa02vZC394bN
         rgBSeyFi+BBr2L/Yl6lFOSczgSjyR4ec2aXBtEdGcez1XhPpO1hU5h/bo2RIrPYLif/T
         g9Dg==
X-Gm-Message-State: AOJu0YxOkHV+qOA0cq7LM/88PD7ds/4YtrKlpIAqsLfcOJc5jogrJhv+
	QsCEaPkLdP2DD2cloL0djln2EkgZ82RLnWKkEjXazIc0SuQQa7LaBqyU5/aY5zrUIw==
X-Gm-Gg: ASbGncs2/Wy8oIGgbhSVzQQ9sSnFTv8UuMVOW7rshUo9D7QmZHsfrDruwNqYZUctMZv
	RPf4JF/iB1rPg+0FyRXxtIxHdG43TwGpWXA0/hEIixUZuOQ+L4dHl6vKrAx+psSrPupmQ02Rftp
	sV4OxwyFQ5X7cag1Qms9+x2sectkzqcJ0Yb1GYPDbCikDOVbnY9IdmJfIc5/ku+JC8zs06Sd3ef
	8xGk7arQGRsHzavQ0vhDGlYcSDD79qUmj28wN5OVb43Gcf9uwdUEnmL01gc7bYm0P7zc7oT6vNM
	c2ToNnGKaSVenQMAdafrTYKcQZVElVA9mQvzaEFK0Myl2nxfGNH3015JDq5Lx/3YAuk3n8rLGBF
	WncuzmVLt
X-Google-Smtp-Source: AGHT+IFHm4z4XLQFoFlL3LAnRZ+9+Qxccq+e4FR3FlQ0PcvclWNi0JaweXe1qi87hHe1hfJchphRBg==
X-Received: by 2002:a05:6000:188e:b0:39c:1258:7e1a with SMTP id ffacd0b85a97d-39efbb0c199mr10113743f8f.59.1745304816534;
        Mon, 21 Apr 2025 23:53:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acca9sm161588715e9.12.2025.04.21.23.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:53:35 -0700 (PDT)
Message-ID: <13e4270b-0028-486f-a0c6-c053f0ffd197@linaro.org>
Date: Tue, 22 Apr 2025 08:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/20] Disable options unsupported on Emscripten
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <047b22618137ad1fa0abbfa061726ba08605c4d9.1745295397.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <047b22618137ad1fa0abbfa061726ba08605c4d9.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TBraUkmvTkzv

On 22/4/25 07:27, Kohei Tokunaga wrote:
> Daemonizing and run-with aren't supported on Emscripten so disable these
> flags.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   qemu-options.hx | 4 ++--
>   system/vl.c     | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
