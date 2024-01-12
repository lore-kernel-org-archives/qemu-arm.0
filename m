Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2429947ejs;
        Fri, 12 Jan 2024 07:13:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4rtsQlL0vkXK1raErEGopf/vxYB/8TiMajbn9rhzHkNjMX2qBLRgK0bJinOsbnW6LbSnt
X-Received: by 2002:a05:620a:51d1:b0:783:380e:112b with SMTP id cx17-20020a05620a51d100b00783380e112bmr1524819qkb.9.1705072427328;
        Fri, 12 Jan 2024 07:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705072427; cv=none;
        d=google.com; s=arc-20160816;
        b=aWcvjWyiJK/PW4S2upsqaaPT5bN1KtNN23LFECPn1dahqJMCHfGin0wi4zJWlpijVP
         7aEVHchrPbt3xNuXIaBRpMW3qZnm+cQ+a/OqTyLdZXukEsSsx9t2XlTv8muNX1/lSRm5
         7K7tBKf3+zuvkCUskXkf/W4bGg20jgKMWXb25qCtgFjueZyLC3FuV+AhVu2zl+1IuvY6
         T0OgegdTUzZRJFCEzm5wFIunE/IE9nRqCwJyty2qy+p3zQQVCcs8//kI2sgo3fXemYIP
         ouECCCfSB1vQAHcaMbIWudXxOL6P1+LpkmwfDNm4mEAc9Heofid8HRzbPtkkkH+SlILH
         cVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=2j+1DJOi80S5Dwh2AsQCC7FC4cfcYsUaI9wtFMGmrvQ=;
        fh=5zA9YXf89M5o2pdy8kiUUj2Sy589itwrqydhYmqL+EI=;
        b=hCSD6O32B33N36b9UJw1HmGM2gFMMZ7SxHjrfQm5MFnmen3DS50UQ7WOLTd/hFa7RT
         /FvkIiHZvy95w6kUuOb0u9MyNo3/pLlrJkjIxZTBGEB4erOHEqFjBXs1umH8a2dxUoR9
         DeSSEILXdGZ4vuTiCTCZv+liPpSi6spN4WmW/nDuwgFWD6sGpiWVvZhh392ZlIR5XPhy
         CVz8VPdQL3Kg+MtkRfwksbRjlY1U97wW801NUTLftylITcEAtuV2WG3DN/iajugCAWuk
         e1tJcjjbHLHnnLfrCZUAYgMKtkAiV/pgwKonQ4wkUAnPuiu2wCGAfRGY+1y8SrTqLj7r
         s9Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LiALyiws;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y5-20020a05620a0e0500b0078153cbf56fsi2977938qkm.607.2024.01.12.07.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 07:13:47 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LiALyiws;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705072426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2j+1DJOi80S5Dwh2AsQCC7FC4cfcYsUaI9wtFMGmrvQ=;
	b=LiALyiws3kojFfOdg/WsbtFjnwUp19OZBdYq2B3ulz0/swa05wqmBQk19IR7/HVY2d5wKd
	ew+O6g8zo6I4j1P3mI2KK/kajfcTa5y2LJCvywZuT5GrP/SMkWcWNM98UVgbslE1XEWqOn
	CT8bQVyMg/WJjSrLdx+1XuEQgpTqvYk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-rvOqSjyqOPewsupdP9Ozsw-1; Fri, 12 Jan 2024 10:13:45 -0500
X-MC-Unique: rvOqSjyqOPewsupdP9Ozsw-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6d9bd4fa279so4757705b3a.0
        for <alex.bennee@linaro.org>; Fri, 12 Jan 2024 07:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705072425; x=1705677225;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2j+1DJOi80S5Dwh2AsQCC7FC4cfcYsUaI9wtFMGmrvQ=;
        b=gJWmmACllmWgRmmbbrkxWoyji94Wm1ObkA/cHU/epyrCz7HafCoATavC0JO+i9/a/r
         yMp3XS8JBguoqgO0PoOc0+5ffzS/TRGikZsVnxplppdp4g16QR8WWoboX8wWv64hxg7i
         EnXT31z6Im+JS3efA0hz2cTbObl7/wOqkLYInzH3Zokzn9mT1yX7YxIxn/+WGHePHOMZ
         W89Xk45J/liZ2lTYnju0rHKF7YNeVUt4IlFF0lz7W/AcnNZhGcV7Upk2fehjNN883102
         fjFoT2vuYmjsfFU0djO8ow8+pO7k8TVRGTqLBLRwSkYCnu1GHlad5tlYaBziy3yQT5sF
         eYAw==
X-Gm-Message-State: AOJu0YwMfMlPV2z+pqGXEV/QheTlqIJfKdYdmAgVcf/x9bshJvdlW0Be
	H7TE8mQL9fuRsANSVtrIiSW5Ho9ckCZAskjm7U6CDf7pOpN6lUKQlPsz4AOFYvhHq+RmnQWcD5j
	VQtuBovFCL96I2X5kWzkPiDjpD/HUCrZvALSRnYxIeHhngV7KJy8SY/jzrhbHdLgYVH9nleSf+F
	Twvh+T
X-Received: by 2002:a05:6a20:8f05:b0:199:a75a:6f8 with SMTP id b5-20020a056a208f0500b00199a75a06f8mr911710pzk.43.1705072424878;
        Fri, 12 Jan 2024 07:13:44 -0800 (PST)
X-Received: by 2002:a05:6a20:8f05:b0:199:a75a:6f8 with SMTP id b5-20020a056a208f0500b00199a75a06f8mr911654pzk.43.1705072424320;
        Fri, 12 Jan 2024 07:13:44 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-176-232.web.vodafone.de. [109.43.176.232])
        by smtp.gmail.com with ESMTPSA id sd12-20020a17090b514c00b0028cef021d45sm4268415pjb.17.2024.01.12.07.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 07:13:43 -0800 (PST)
Message-ID: <cf617223-0a0b-4d42-84a3-cd323ea4c421@redhat.com>
Date: Fri, 12 Jan 2024 16:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/43] qtest: bump boot-serial-test timeout to 3
 minutes
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240103173349.398526-13-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GfnoOjikU8e7

On 03/01/2024 18.33, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> The boot-serial-test takes about 1 + 1/2 minutes in a --enable-debug
> build. Bumping to 3 minutes will give more headroom.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-ID: <20230717182859.707658-9-berrange@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20231215070357.10888-9-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/meson.build | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c7944e8dbe9..dc1e6da5c7b 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -6,6 +6,7 @@ slow_qtests = {
>     'test-hmp' : 240,
>     'pxe-test': 600,
>     'prom-env-test': 360,
> +  'boot-serial-test': 180,
>   }
>   
>   qtests_generic = [

3 minutes was obviously not enough:

  https://gitlab.com/qemu-project/qemu/-/jobs/5918818492#L4984

And in older runs, we can see that the boot-serial-test might take longer 
than 180s when run with TCI :

  https://gitlab.com/qemu-project/qemu/-/jobs/5890481086#L4772

So I think we should bump the timeout to 240s here. Alex, are you going to 
respin your pull request? If so, could you modify your patch? Otherwise I 
can also send a new version of this patch here, just let me know.

  Thomas

