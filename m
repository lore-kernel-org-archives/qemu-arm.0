Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4426737njd;
        Fri, 25 Apr 2025 07:53:35 -0700 (PDT)
X-Received: by 2002:a05:6000:1f0f:b0:39e:e4ec:bf78 with SMTP id ffacd0b85a97d-3a074e1e7demr1762876f8f.22.1745592815671;
        Fri, 25 Apr 2025 07:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745592815; cv=none;
        d=google.com; s=arc-20240605;
        b=kReuJr7ikXvk//XPW8uwDVcBp7BbWvry4YUDQlwohms4B8R9fX6eHw/GvVqoKeKTRl
         D2IPsj08JxrdYpWlG7Eq2idy+E4SqJK40p/iPO4kxWpa+6l+1InK/X1am6uT5CcZ9swX
         Fwot0nAxsBbXzDQ6DsC8DnkY02ohFk6c3l2cmLx06B1jlPxxztEp+ZqC5kW3rhkq4DBe
         f7ee8HCk1xJUV3OEBOlQ5bZQeSoKwlpT19DQvVsGEAXtRezjHlnlre4N4tey119S32zW
         2sPUqlAxl80/I13xhKNyE6G5yk2Mm3NGUT5V2RTXs1nevYKxTx9GkpLLcK7xl1Cran9X
         2QEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wf9Oi6RXI8od/ky+2U6tBOV5Z9gdYLa8whtijbKV9xA=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=ilPOojBL2DHREPV6gx5bw82fUTZlQt2zALYIhW7w8aHE+DPluIRykE+IjIhovMbeXB
         g01hPRN0INb+VpSmG9T4RlubMm8yWd9BYNKYDUHjFbm1lHKsNsKjEYvK6oWXfGBq3C8V
         VgRobnt/3VlPEf0uRKj7WiT6Py+Lg4zn5rK3aPxva4gyevg+SuYHYogCEfz3xdtei+GZ
         ut9fwcakjx7GKFuwP1JJcin4pEmkUsVLPhrBMOQJUDVSd6+QlnoupLbe1z0qgu9DqPdH
         kX+sFCjd4TLeJwx9lFrU+lmHauUiynuwcAwtag7NAzjVHHVwlBRleop981d+GF3FDr+F
         8Qug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aP/AKe5s";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a06d538419sor1185040f8f.9.2025.04.25.07.53.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Apr 2025 07:53:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aP/AKe5s";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745592815; x=1746197615; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wf9Oi6RXI8od/ky+2U6tBOV5Z9gdYLa8whtijbKV9xA=;
        b=aP/AKe5sv1aMhybsADNW9OXaff9qgrygCJgv99NgBXw7UlUfEp5UaiGVTRAmUt1T8A
         PAWOw1qp40K79Bisw6M6sPqHhYH59faxfTKhtw3K2GHMeHiVpN6HFWZ/X1bfkOnVgpb6
         pPOg+OVHSTjnQYaYD/9ms1VaFlOCAoxRiUaML1kW/O+edgF0TL/rugHiJYkjmlyefZJh
         WRmbViCKHk9iryWUwHRtK8RDhEQ00W5VnTI5ZkR9keCJU3jZDOw02AMzzwNyeFuvtB71
         fbzNN4ABfqvorxPiv4SOEoHt9T7zDjA1IBfZajrVXD7KAJwM971qeZ0we206gjElkjKM
         Mg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745592815; x=1746197615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wf9Oi6RXI8od/ky+2U6tBOV5Z9gdYLa8whtijbKV9xA=;
        b=SWw6lzctglncr7NSRcETlrulM9SRZKGej85oj1hbBUNCPDS1cL0KCM0zZKYOVwIipo
         6+baWTGy/EyNIZkfShiXJNf5amkOWLOOUaFZY2BPnbhkDsOED9Q9kw+Tob3xqpICrseh
         C6PAEzonnzjVXSpOCNZoaLB5hn0HLJmKtO0DcUiXypHYfvuRd7kB20SJuc/9G/ktHJV0
         229Mx/OrtsJ4SxF9yYIHMxAnoEexb6Hiyb/XQkTlx1ex4nGnwq2ToWVUONW38uD3J+io
         4LgQIPGVQU7GVgCbm0Pz56v9QOnhI7Cqel/yXgipccsSEV+VHX3QUMOMXpP//sW3vtZB
         hJHA==
X-Gm-Message-State: AOJu0YwR56D+6Dry6jcgax4m1RzORJR3oHAVo73tPp5OqhKrCPlrdThP
	w/+RgWWsXnfnNuvUF+largbzEyEsLGmjJmZFQEGxCvnnhD06On+QJeTRLVEefSDXLw==
X-Gm-Gg: ASbGncvkpfSLU/0tznbL3jtZAS/xATZtW9ZKZ2njmQ3VcF2+xtKSa5sYPivaMbJbS5x
	Lf4CDn7QLiB7zkI6p5uj2OokV6GwSgK0jdoAIrb60DSuYZ3UifLXkBI624N70nqaRRGFXUsscp3
	2GMF+qV/tg1CZSXVWxf3HGMAU/Ltwuf49HLm+MvUo8creSg6EfkxKR92db6F5oqay9NKvdQNnH/
	MghgM/6UlWXiOLfOLWXuroTS0Tod3M9tIYB+7hLc1eLroo0Jk8yUOZItGG8z+hjtB6uarNKW/6b
	CaGak6c/l0KhJfcuPpA8jt5l8xrcYSUcqrXIbtFiwrC939mZksJ+qq5xzvTkOSST5Ngn7OyZJgy
	pd4odAH8X
X-Google-Smtp-Source: AGHT+IHU6OdKhIhGldbUGA9NCxoGCkDJIm8moWgxc0hzHo+BeqQdWwtHxgbEmEbz6YCbQ41bwhW77A==
X-Received: by 2002:a05:6000:4028:b0:39e:cbf3:2660 with SMTP id ffacd0b85a97d-3a074e0dea0mr1974523f8f.3.1745592815067;
        Fri, 25 Apr 2025 07:53:35 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca72sm2543614f8f.4.2025.04.25.07.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 07:53:34 -0700 (PDT)
Message-ID: <554241c9-1bc7-4b05-8c1c-a80cd44d2ae9@linaro.org>
Date: Fri, 25 Apr 2025 16:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/20] qom/object.c: Fix type conflict of GLib function
 pointers
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
 <8ca13f4e2b9eba9d1f6030b0afb442a24330e463.1745295397.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8ca13f4e2b9eba9d1f6030b0afb442a24330e463.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dCFYnQHQsY0o

On 22/4/25 07:27, Kohei Tokunaga wrote:
> On Emscripten, function pointer casts can result in runtime failures due to
> strict function signature checks. This affects the use of g_list_sort and
> g_slist_sort, which internally perform function pointer casts that are not
> supported by Emscripten. To avoid these issues, g_list_sort_with_data and
> g_slist_sort_with_data should be used instead, as they do not rely on
> function pointer casting.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   qom/object.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
