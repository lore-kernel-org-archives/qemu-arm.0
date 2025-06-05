Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp90947njc;
        Thu, 5 Jun 2025 01:35:29 -0700 (PDT)
X-Received: by 2002:a17:902:dad0:b0:234:e655:a618 with SMTP id d9443c01a7336-235e11cb8f1mr83121265ad.25.1749112529114;
        Thu, 05 Jun 2025 01:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749112529; cv=none;
        d=google.com; s=arc-20240605;
        b=RpPNZKeHIZiCNrspTCAJOnUfiY2/E6O9kIHrDsukMi1V/HFGQqNJnrFs2L/avMcpEf
         IDF6Lpjt+D6P4EkacmgOaHOnz9M0zKf3Qp5HsY6dNmUpGze7SNrM3ESTygtofSWAwTJ9
         kJsYVrMIEPv3FFpbCzllIW11BN3EPZ5VIPzQ9HmRZ6qpXE3XAtq0xXFUSogHzGyNSrGK
         KxyRDxZnYaqMbPaSCzms3rlwIN4hAmJKwsTuntRSmq9waDoEx/9suBtyc5eWCJjL6G2L
         zVEQMqIESFyhsay5Eyp5z5kNww8sNb6ht0Ji9H8/SW7eOjRdqUpYL81lbR//EhX4e6QG
         wUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0u3uA5JSpAEXaIO1NqCEQjYLy9eO7xSUc0BO/e3CoiU=;
        fh=0zSasVjjJnj/Tf1YsNX5nWMUOlPhbxkd5Tnm4FFCxoQ=;
        b=eok6pLxPCDfdQxlyY1F1tjAtxzxj5tsIxLEvAgx3C/hPbH0WSZaxXLN32Avf4NviH8
         DIVTGEO/7DgbwTJ2yUOljbqW8ROWCTTdt5GaCwoqPGe9UWE2VooCisIRmEb48bMpecwJ
         RihNS6CWbpv+1ngr3zlwZDt+ja2tSh85d0AE+k8ORM4NkQW+SAr90kNbSttzfshkDTh4
         jQrG8YQamXcwbkP5tkBQUZCEZZAkOxramUJwNCe4gbULEUqKCVHUpqcN1LMzr1PSj/SP
         qFzfTIWSLJDUQBCMmT305P8Ejz16YUnD1u8mXb6sqs8BbUaNsIDycEIWx7+f12td0eeQ
         iXLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=mHgdnqOO;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-235c93c4640sor41644685ad.12.2025.06.05.01.35.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jun 2025 01:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=mHgdnqOO;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1749112528; x=1749717328; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0u3uA5JSpAEXaIO1NqCEQjYLy9eO7xSUc0BO/e3CoiU=;
        b=mHgdnqOONZ4WIqt7IQ6EE5ktVrAues5yKX1r1TUdE6y5DzgglqPCTRv5IdRhZD6+nV
         bZoX3fSvDLm7IxBodIyvk597txQsARz2eB7/Zytx0ikBnAuuJnEnxNRn1o7mbAi1DbIt
         ByTBBKgSBo3WtzHdFJ7QgkQCV/0+4JcZRGVgn3uJ023+zAGlTNj3idPl9aaOvVGSIY7F
         AbWlHCbv0X7+/qKnGS9quW6Es2lkVue+owBgOCS4KjWP5NYo5V6cJeyFobnven1ZcuvP
         h1ynJX7Sk8ABWNWsODCHuwWYue0ROKO/4Aa8v5rtG3T+y8Dp5zUbKucavJ9m+6Qd8x+J
         rrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749112528; x=1749717328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0u3uA5JSpAEXaIO1NqCEQjYLy9eO7xSUc0BO/e3CoiU=;
        b=a05lME56vpVUO130F9tErdX7gxf4olMlaBw8Wh/Ms67vq6d+t4mTVBOYjOENQ7bcLI
         W628L4nDH5NB6NmzjA0ExWd0RogtbcjwFDXWr5dIScxKBQOpNiNbqP2a+Yox1meghRi4
         U7blRpJqBLsq/j9DwdFxD8pDIA1CKqio8tPHe6GXscRFLbnPY7vgZAZn7Zw+v5Brnv2m
         74uWKlt/yyq4nOcWJYKsdyhwKv2fycnfiJ0e5nXJP2tGbMig4IIytV9Uq6s8LtJcf3PX
         cNDYY72au0E4X45P2kkXqRd08CzmOCnDyCvpb7IFTyBcNCFzJ4QstejbUWXB4FRzJbu7
         XwgQ==
X-Gm-Message-State: AOJu0Yy32ORNYMBckK2xZf5gHz6iRE31VOo1uurlyShbuCnU/ebiMsiI
	ywJUpanEJvgAEoVojjfF5e+sxk/GzTpCxhlM9pbYwT/3d5Zcn53RrWw0YMu8iIxVOzEYxEvh2qn
	6dsGb
X-Gm-Gg: ASbGnctCV9pGpeAPUw/oy5X2Zu21rBx9X4W8J60Jc76Yws3b2vikKaU4/JjvtlVxu6+
	84K6vX298Dtat+orZMNU8rCfSFKbcHo1c/5EFoFsr8JlIBDe7KABOy59LveEbX6lvfFGgCTFAo5
	YC2dZTvQ8z8BfUKgzPcFmqH0cLeNom4Z72TtwRHBbBTYXdb4GfB37g5DToZrLV/aM4GqubrWTFp
	tRwdbXII0r5BIrApdDULuADtR6e5kpNdsLojVVtoLPHhGV4HTnDemSzL7TTPv5bU1FCzseMtFRL
	1opAOwnCRcYIhQDVZB7ZaVrdYpcSzyZRi6VGCHmBkeLWn3uAArW8I3qoodL6ptH0
X-Google-Smtp-Source: AGHT+IGjp6Pm19QxT9iOLUpHQ8WVqM7TqpwHB8wLa/3Zj4KSKc2MQp/mN1JvyfH6aMJJyPjNJivX7g==
X-Received: by 2002:a17:902:d488:b0:234:f182:a735 with SMTP id d9443c01a7336-235e11e5ef3mr88171765ad.34.1749112528438;
        Thu, 05 Jun 2025 01:35:28 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.223] ([157.82.203.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3438sm114946755ad.136.2025.06.05.01.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 01:35:28 -0700 (PDT)
Message-ID: <e8b93b0b-461b-4029-9ed2-939ae51e3f81@daynix.com>
Date: Thu, 5 Jun 2025 17:35:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/17] MAINTAINERS: add Akihiko and Dmitry as reviewers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu
 <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20250603110204.838117-1-alex.bennee@linaro.org>
 <20250603110204.838117-9-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250603110204.838117-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: n2WuWaaJzJQB

On 2025/06/03 20:01, Alex Bennée wrote:
> Thanks for volunteering to help.
> 
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7718199979..79b1d5c0b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2669,6 +2669,8 @@ F: include/hw/display/ramfb.h
>   
>   virtio-gpu
>   M: Alex Bennée <alex.bennee@linaro.org>
> +R: Akihiko Odaki <akihiko.odaki@daynix.com>

Please update my email address according to:
https://lore.kernel.org/qemu-devel/20250531-rsg-v1-1-e0bae1e1d90e@rsg.ci.i.u-tokyo.ac.jp/

> +R: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>   S: Odd Fixes
>   F: hw/display/virtio-gpu*
>   F: hw/display/virtio-vga.*
