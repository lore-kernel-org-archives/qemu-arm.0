Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3727988njc;
        Sun, 25 May 2025 08:20:39 -0700 (PDT)
X-Received: by 2002:a05:600c:6285:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-44c91dd127bmr54336615e9.18.1748186439304;
        Sun, 25 May 2025 08:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748186439; cv=none;
        d=google.com; s=arc-20240605;
        b=jJ/DNAUeywJwarh1TFA67rqNqRVZFj5CNCATyi7KAgnHPrVT7a391b81VOtKT9IOG1
         Z9j25hT+Bmhj2aw3gae65j9tb7iIe7UIrKJHvdT9fnJVnKPQ2PdTGE1uzo4RlHlh2z60
         +pA5SUUnKQIcc/ykF6+zWnyZuLFKTK/Yd9jXf0qotR352cxB84f+LSIqrWUwnWzjABDy
         w00fNDpUjUpZJlojrirMZJalZJuJ1r7tJMvtdyx2bSZWKLrU5nX2s7RroLmo/OlwVOkL
         c7dzyvkvqfy3fncWfJIlPz2DciNZ2i+b3Wmsp4waAz3Abr4SrpNX8/imJsoZnepTPm5T
         18Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oNEB9gZX/6wELzfei30Cpb8j4aVTnTQZ1fn639Eezfs=;
        fh=Z84gGed82Fjjw6HsLhLn1R1lgjhWPHasSMI3KCUuewU=;
        b=BvICynfUeAV/iEhs4ZQ3vMAfonafyHAewTe+lGIUyIg4/mvJiAYneaO8Vw4ru17bvv
         Yq9pJ3Q+bpMejVPklAjtppMNea29FS6FMtPa5tD4mvcdOs6NJxr3zPrexivvMJu3oQlj
         KyjtybHyOlflo8tFB6arhwuvJO6fy9kTHIM5WRObRW9cUmr0Utq+tMLIrL+NQ1M4Hrty
         UguBLITibirqLpak4ZwlTZqoZFspbkJfSZ6jr7U59UER6Jut7xfeyN7bx1Bce66lTO7U
         Fl6aoIfRLxt33t/xD2HkwCy8GFxPwPAbGcMpQn6UJ5MqL62SMQq8JmSoHRUofkSffuVM
         kzpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJ1DDI7o;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a35ca5ab20sor8609796f8f.3.2025.05.25.08.20.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 08:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJ1DDI7o;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748186438; x=1748791238; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNEB9gZX/6wELzfei30Cpb8j4aVTnTQZ1fn639Eezfs=;
        b=nJ1DDI7os4ixp41I/ayyB8bYJhr94XYASY+iQxuW8vviSAY0DWIKZI+ZQPmtdcI/fq
         +H6N5HNA92SH0s7hPRQXpMsHJ5/q/F4ldvfMXe7DtuhvuSpqab6iBnox10W9GjCjyVpT
         2/va8Stl4WSakI8jf2Or0LUejy6cPRrWWILT3klpI91QMqfE713hHYnfsfuapWb6s8I9
         mt5eUfVSvwJ8B1x1PDJVUH4y6FbVgSOgXLf0M6UmgWfmRIHVhSq33SBY1+cCDV7pwfxS
         OYBRWMhO8xLHH1jt8+g24MgJCO9EX3hakTUzsWBRetixm/kszhMdchMmQDModYZKxWuM
         sJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748186438; x=1748791238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNEB9gZX/6wELzfei30Cpb8j4aVTnTQZ1fn639Eezfs=;
        b=LkbW/3xvoIMDJdBvLjUstScJktHgtZebZ6+Gdg1sBNRWDR/KdybE0sYy4ZN3EEpJDU
         VfpmCXenoRs0aJJXaerzKpBIMpo5OSEppkmyR8ce7xVfgpvzJ9yWj6DSu5e2zUtCR75c
         2HqbvBkw3w3k2+xh3DvdNtiXnsTRopZ7Swd7newU9UmqXToprg95HJGUz62EPB2x8MCa
         HOt2+AB3bcQAQtqxu9xRBu7LdSH4HuRw9ci0VV7/PhkoXRca3NX5KBO+EtYjEBPCPqMv
         u2eR+QzSeQHBn8O53LhJA4tA+Ko7SkirBd+44T/jeQR9py76jNV2oprEUAz789ZQW4bG
         pRuw==
X-Gm-Message-State: AOJu0Yw4qEk5Ra9AlXS7iqtdIqCbSlsma1zZyo7kcBNuLReSCSP8cAiW
	0IuXpe1DQ/JLeJrrGN5IsEAPBG+qlP4uHeFHklb2cqfNk1Xd4pAgoX4IQiRMEle3oBmCqHgAqMX
	TQf9ibwI=
X-Gm-Gg: ASbGncuQuYYfD3fsFFGAnbosiFnVoJiah38ncftn9c6G65a8IAsBzRkFw3bP07x26PQ
	vzEjc5O5F5A14MLcjV2SaGOmxK9Jy4M6gF3/W1zhvBNeO26tHGPzGz43ftGouqqF4iTn+/ag1Vf
	lIToAjFmcxP27ze2I9t9Knv9n/ELZ6p5Mcs8EP4GrbCA16RpZzK/YjNoM2IwDGWakZ4tYJv313t
	1JEgBE5jBhGswj3OsraCxbLdrMbgZLxCBCAMsbjxBPuH7F6NGKnpzhrRX/sfYIErHSQxC8bjh6d
	lJjYgBbd24WjpzSEmrJMj1cAaZ7m1RMnCyHjhfk0b/PKB+ogEnihISOnQPPJHPvNAS7ZMyhlPJ9
	Keq/V/p2JelRdKthpauDCvT8UQuS44R7onrATyA==
X-Google-Smtp-Source: AGHT+IG4Wjf4B+T8GA7G5iTswRP4iu+XbUeXyjXrs5Vx7OW0g0gQAJM9tRUCQI0JPtVya3qcxHo1pA==
X-Received: by 2002:a05:6000:4203:b0:3a4:79e8:d1d8 with SMTP id ffacd0b85a97d-3a4cb0eaf18mr4734066f8f.0.1748186438452;
        Sun, 25 May 2025 08:20:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.132.0.213] (17.red-95-127-33.staticip.rima-tde.net. [95.127.33.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cfa20c03sm3986417f8f.7.2025.05.25.08.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 08:20:37 -0700 (PDT)
Message-ID: <45b2ad25-2307-4fa9-97cc-057666627f1b@linaro.org>
Date: Sun, 25 May 2025 17:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/20] MAINTAINERS: add Akihiko and Dmitry as reviewers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-11-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250521164250.135776-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: j7as2u9W4bK3

On 21/5/25 17:42, Alex Bennée wrote:
> Thanks for volunteering to help.
> 
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
