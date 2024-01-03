Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp631159ejh;
        Wed, 3 Jan 2024 09:43:57 -0800 (PST)
X-Received: by 2002:a05:600c:4503:b0:40d:83a3:4757 with SMTP id t3-20020a05600c450300b0040d83a34757mr1768352wmo.219.1704303837463;
        Wed, 03 Jan 2024 09:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704303837; cv=none;
        d=google.com; s=arc-20160816;
        b=ZOPhu8TSZTyxRPYD5g9J36nmxhf8wI3Bj990uS804jk3CXqUV3ryfHWEmGsjjCKiGV
         nO1/XyTHNI54UB9KQJQ4EmB8G4V3AC+QklszYYoVfazK3oFdKGNV7AaD6C8M7R/HV4rT
         aisLYIpLQIPa42+e57dwaeIS9c+OnZg1F88KMFKYyNN7c24OlHb5j2pi4yTwDhScgLOE
         CNqft5QgFY/ld7kC6SUNZ5gYHGW24BgDDKg1eXxrNgx2+Gtk8MpXw8LUopG8Ez2ZmEl+
         Xw2rByI3y2lRC46EoKBJmKEES6+eQI+MpV9fdE/xqFH26ZBDXbBBYyu5D7yT6Ynk3ZeI
         8Msg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=V8US0ACJb4Hw/yRgDiojK+LPOeoUlnaAFyhJhDgbvbA=;
        fh=Gh1S9b66JIsdzWzeVFItagA0XdxQJ3n9u6epL1S7MOg=;
        b=i90sCh51QvTMiI5sfJtBzoSp0soyeKwGt0C1Tls+IxWMUuEt60wHAPzWcFJZvBex0p
         /ex5BleKcszqyfzrMgp3LpwyaImUb96tM0vUhLzO2xZKjDksmSN2rhv0oTeNeDrp1djX
         J8wNMMO9+7X8rjSQ7Vyaqb3n37hIZH638JUcV8OJ7TePvQUsH2pvXvb67feR9JLExdkr
         y1BPAlFxKcIFBZ7/d6qIFHBEGzvcnfTf+F8JDMJwtQia/56MpER0vn4dfidvajyvAf9y
         /M5SLqA7WsW+knFlLr1QOX2ePwBzC980qy7LO1ShFhduZVL5GuiWxIxRIEZJHzw2yhlf
         Lq1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=klhxFMfS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l4-20020a05600c1d0400b0040d91fac53esor526971wms.0.2024.01.03.09.43.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jan 2024 09:43:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=klhxFMfS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704303837; x=1704908637; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8US0ACJb4Hw/yRgDiojK+LPOeoUlnaAFyhJhDgbvbA=;
        b=klhxFMfSsdrQdggeLj88EP31SFKvBaZZDLmufguYb/4M4bxqmrVP64eRkd5ghmiauZ
         PXyKWz7ssXDLujOinMXq8USj1Nl/Jg3RddkfjEGZCAewQ2uKZm1oIXzx+D+N2DvLTATU
         mIlldUGkKgLGCsK/jzFEQEvUiHqaJHzG56tgFL/c7W3wpsXRc4KEHdBqbWT163T8xjVt
         jwp+NlMR170w0paacU60evJfWKrQ5ETSuiBEd5abHKuValALKyvrQUg26UZWdmdwnTj/
         fwqSKonbiXTG2BU4uHXsbhm/402sMVahMVC4y8B9BcFDUtq62DAhpdiLktTZQUGf98gP
         9OiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704303837; x=1704908637;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8US0ACJb4Hw/yRgDiojK+LPOeoUlnaAFyhJhDgbvbA=;
        b=CIrit7YmE1nNnpcauxlI5rFMFFLNMwcNJY9zgRqBP8mr7CfYRqlUdVBgUmcJtqsAbJ
         YU3NKn6/1njwxqs5vZBEsALl9PIMi05H6bMohJ59vJlRx1mAke17qoy7IEFsYCqZEsiO
         UnrhmRfNcmjMSklQ3LY5RCYbl5tPdR6khHtrUQAB/lnjCDkOFReVIs/D30nwtjTHwUDB
         dsvBzEQh8/UoPzwpkAOvBsfug7m8IUbfv8yBJCvGjugwiepdi/sSddUVM0rLylsN2CYN
         6wy10o8taLLGgYKvkb07ss5K3wOJPFk03rEIgEKVFP/dFveR/8yAPk0Re1UlPQqdXgUb
         ATeQ==
X-Gm-Message-State: AOJu0YwF/v6QVOF+UHTKZdjJBAr80cZpwdc6RLTjgPVWqeQXlW0eyErC
	WAV6G5qDFgQRqcGa//CfiSpxANy/3SDzR+6XkYSyYYOIMHUL+A==
X-Google-Smtp-Source: AGHT+IG5G9mQ4BJ4FXQ/6LVXB48S3IsiORpTQTFyaxnxAOVk8KcHF9cASuMfoLN6MOOl0hYkw6H46w==
X-Received: by 2002:a05:600c:3501:b0:40d:5a99:3bb6 with SMTP id h1-20020a05600c350100b0040d5a993bb6mr3579336wmq.41.1704303836866;
        Wed, 03 Jan 2024 09:43:56 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (tre93-h02-176-184-7-144.dsl.sta.abo.bbox.fr. [176.184.7.144])
        by smtp.gmail.com with ESMTPSA id p7-20020adfe607000000b00336843ae919sm30885254wrm.49.2024.01.03.09.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 09:43:56 -0800 (PST)
Message-ID: <6826da51-3b97-4ecf-8517-9e5b5243e91f@linaro.org>
Date: Wed, 3 Jan 2024 18:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/43] qtest: bump pxe-test timeout to 10 minutes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
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
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103173349.398526-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VkdhwdHKkeop

Hi Daniel,

On 3/1/24 18:33, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> The pxe-test uses the boot_sector_test() function, and that already
> uses a timeout of 600 seconds. So adjust the timeout on the meson
> side accordingly.

IIRC few years ago you said tests running on CI ('Tier-1') should
respect a time limit. IMO 10min seems too much for CI, should this
test be skipped there?

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> [thuth: Bump timeout to 600s and adjust commit description]
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20231215070357.10888-7-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/meson.build | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 7a4160df046..ec93d5a384f 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -4,6 +4,7 @@ slow_qtests = {
>     'npcm7xx_pwm-test': 300,
>     'qom-test' : 900,
>     'test-hmp' : 240,
> +  'pxe-test': 600,
>   }
>   
>   qtests_generic = [
