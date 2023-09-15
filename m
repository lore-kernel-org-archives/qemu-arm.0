Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1211727ejb;
        Fri, 15 Sep 2023 06:01:39 -0700 (PDT)
X-Received: by 2002:a5d:4dc4:0:b0:31f:a717:f1b6 with SMTP id f4-20020a5d4dc4000000b0031fa717f1b6mr1378213wru.11.1694782899147;
        Fri, 15 Sep 2023 06:01:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694782899; cv=none;
        d=google.com; s=arc-20160816;
        b=geHH4/MOHDnZwPOUDVtf1O0pqgetMQ2q96/6TPvh9M+QDAliNiouscMRrIP4NzP83Q
         vlJ89yNzRS4dOCle9fPX36BftCZNX9yYAwUI9rEzdfWfpFQWN2nvgmhwQjqqNn7Wzysp
         tw7b8L9T+DZKxVb7bfgnzKoQZJEuDUdneN0JmTvZruZBGcRa5KL1EQRCuMzK9NUc/fOU
         DUR8JjrtoB9A7EDij8OhxVne+6LJTgMRVZcs9bYKAVV264YXY+6YdlrojFP9+ceoskoy
         3Nt7iOiVLe72mVgk7cC+OTNL06K2m7yCGKDdtjhrIpqZ2UFOricBKILTU1ztk3fIlF/G
         Lr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=C+iDFxDOqL6zcmkWpZ+5KTpBdccZrbqp0qmkhNcdHig=;
        fh=ae0hwhFE5UTFHLKJOdTbDtWN+SCT4E75Iy741PHSuvI=;
        b=u660NgszPq+Qi/u6Mm7F4DuIcNxl+oeepfA0Hy9eon4yCmxDFuRRfy6EpftLMUnGgx
         zHci0znAVDkO13Ik/uQgRABCIQhIa/t1MSou9FQlw4aaGrerybVyOsKrHufaXWjql1UR
         9DP0l1RvpzjyPIh3viOSYMpGANKWOaT7EXDyIb8IS+6WRkfP7uZH7+aVnn0HsNhNv8pn
         /ObQFgvioJx9bNn/Hc7rijy88L1XL9vsNxpu+cbra2kcCx0eMD2xn4Oi7IUM+/nUVfZc
         Ro3YPx5I4GOmYDac6nHIGCCPSZyAXqN7I18NGZE+4IzVXkDO263tdlssf2K839XN1V8o
         aivw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjAEN8VA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d7-20020adf9b87000000b003175f00c81dsor959424wrc.1.2023.09.15.06.01.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Sep 2023 06:01:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjAEN8VA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782899; x=1695387699; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+iDFxDOqL6zcmkWpZ+5KTpBdccZrbqp0qmkhNcdHig=;
        b=hjAEN8VAJZ2lWguekMKeMGQO14SfGg/BJ10MgbWQ3skzO7RUJ+W7FBKPKZMncUak55
         vAtk4TqIE+F1n/mMrrShKv3SU9NzEE6ZoTsje/BPPXkVX3th12mIHgeiu+eoXXNx7eyO
         s7rLNwTLC5ngaqXtQuWRrc4c0ZDOkovYbL6El9rgS0q/FOj5kAx8gjqeJaRjoETUGLNz
         e/bzxR3egAF93/cN/D6UGoyZcHTmoy2mgN30ImGHhCZ+Ek7Plc2lfXqFHYyBV7esH+Tc
         c8x51Gm7nx44gz/rvxIuS1wAaGPhwjRgGGB1K3QlNOiQZJyRvd6KWI+MsV6yyTW9fuE+
         qeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782899; x=1695387699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+iDFxDOqL6zcmkWpZ+5KTpBdccZrbqp0qmkhNcdHig=;
        b=w5ds5zWQdknnXc+x/RH+CdogBJOq1Pvi+KFVVvDTrde88+E4sV/fkMdYjjLQfWgfh1
         s8fbKRZVr7ChkE/qP5qZc76ZM9YVS4UNzR/2fbPF+kYCSIMXrRbwKVR8MLEa0pI4ZBrg
         Rwra36Dtur5pZdH3K7l3ygihpJXPq1Ii9zq3Hh0gVeHATFW7o91LMGeiclS8HACcurUD
         gMmEvFlKAp88N2X4ZyKk+hcJiEDUOU6wMvStLbNg9TMcCZf3xIjskfx1OiRZ0mEIH/Pr
         Hn4iiQdjOF5pPmmR+b+wSofTlS0QHF6EMzROpfdV8wMlffv3fZnVmkBHTRviy2SP3TQX
         cfkA==
X-Gm-Message-State: AOJu0YwWZOHStbSgTCfmbEy7LYjD4DRltfqXD7wwfRuFPtH1j1N6zfhU
	V3eDBy0AR53KrhIY6AFQbaybaVO4
X-Google-Smtp-Source: AGHT+IGHOYEw6pcL6w6ni6umg1ujbQUA98/L8YQ5GcJov0ZEx1fg9VHRx2h4GyT6DsJBn/Qpq752hQ==
X-Received: by 2002:adf:e28f:0:b0:317:558c:c15e with SMTP id v15-20020adfe28f000000b00317558cc15emr3267651wri.27.1694782898439;
        Fri, 15 Sep 2023 06:01:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (6lp61-h01-176-171-209-234.dsl.sta.abo.bbox.fr. [176.171.209.234])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c231a00b003fe1a96845bsm7511078wmo.2.2023.09.15.06.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 06:01:37 -0700 (PDT)
Message-ID: <738f9a7c-4364-3d2b-4a8b-448dcb5b038e@linaro.org>
Date: Fri, 15 Sep 2023 15:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/1] tests/avocado: update firmware to enable
 sbsa-ref/neoverse-v1
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230915113519.269290-1-marcin.juszkiewicz@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230915113519.269290-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Pwq5022/V4yI

On 15/9/23 13:35, Marcin Juszkiewicz wrote:
> Update prebuilt firmware images to have TF-A with Neoverse V1 support enabled.
> This allowed us to enable test for this cpu in sbsa-ref machine.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 25 ++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
