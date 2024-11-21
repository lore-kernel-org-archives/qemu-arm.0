Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp4349910dll;
        Thu, 21 Nov 2024 11:08:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsDRxfHDYhNRNM5c2OEjy1pb1oAJlxctqgmAxmN9i9A7Etj7TtlMJ+izylhe6CKb6KeF/g
X-Received: by 2002:a05:622a:198f:b0:461:6f0a:3826 with SMTP id d75a77b69052e-4653d651cd8mr1294171cf.55.1732216098923;
        Thu, 21 Nov 2024 11:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732216098; cv=none;
        d=google.com; s=arc-20240605;
        b=ASslI7g20Av0fh1qyUj4cUmkYe6TvCM87cOtwYoURQFsu09j1jWO+drkza/org5Y3a
         zNb6THDlSyL5Ra4V7R0sQsLNIIvfOzWxHXCtXIMxyFH8TdJ0EMEpBPi9EetcGuvIVa/d
         b+LlIbh/N5Fu8rr8huaW4OnegUwoJVJs1acL8LBAsM6dNnHSqe0AWlDczhz0OBZUaS3r
         szgLYutUjHn/4Av2lTl533jMlU4wWsbVHpQe+RxrIDZZELUt0d5Lhm74OmpWlzfi/4AN
         4YHDkLUqe6wC747pp5WLaJ2UsaG14pNOoM+hN5eB84vbYCblIOa/bqTXgFpEbVqInRmg
         MBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=TX53w6ZUuuS8FjfCf+6wknGkSPdV0PrLlHIEUwLF4Bg=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=Df5S8EI7jHnXwzTyNW90SEm7Buy33rcFpqtdQHTwfAah/XH6FmgfiA+OilVlfc/j1y
         iCg6ySEvbfauYNsrESHPW+1o6/h+K6QvhFNDH7Z6EYgNsUGzUJsZ8OkRBIU11RibEsWM
         zF1xXDMpsXrX1RyGbaXCAJqduEge+uh0LcN42MUu6i1wT/IO8pGt5UWsCEnrcFMv1/JH
         CcNFe2LkHY+I343R5bEpQqBCNGGY6kuaerfcudAFr6AvgjPMpBvZrhMRWUc3Gvagoyix
         nMFNN7hs02SdVaA2jScDpgZBEGWU+3M0cUJsPSPcc0JHcSF7IpX9dyD2k3aF19H8kryu
         +/Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EkX4s4N+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c47589fsi3686981cf.266.2024.11.21.11.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 11:08:18 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EkX4s4N+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732216098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TX53w6ZUuuS8FjfCf+6wknGkSPdV0PrLlHIEUwLF4Bg=;
	b=EkX4s4N+thYaWkm3lophtBCH8ODHRlB9JDvvUr9J1SVQhS/Z/v3ELqzU1JF8ANqDblQXqO
	ZBdZqyZw4X4+OKdaE5fV1aY3MFwYdVMX1UBfs4+D2qU5M0jwquzp+Bt2QvVm81FVDnY6sL
	YuKEMsHse/fLp10hTyHx19khMX5vxTI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-6rWxF1zRNMmPNmD_t-ZAbg-1; Thu, 21 Nov 2024 14:08:17 -0500
X-MC-Unique: 6rWxF1zRNMmPNmD_t-ZAbg-1
X-Mimecast-MFC-AGG-ID: 6rWxF1zRNMmPNmD_t-ZAbg
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9ad6d781acso89562966b.2
        for <alex.bennee@linaro.org>; Thu, 21 Nov 2024 11:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732216095; x=1732820895;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TX53w6ZUuuS8FjfCf+6wknGkSPdV0PrLlHIEUwLF4Bg=;
        b=mQEWDpr+vMRigtoJ6+NzqkJRS7hjfqTViFDKvtKCptcOVsnrRUtu5eyd6o5abNjuY/
         at8pz3JcKKP/F7VC11wuzFnElpbxBXkRaHDZ1blUbILvtfs0jKaax6fluG+z5y4eaNgZ
         dKzJHP+IZPMA6LjpfhcO9MQrDqySM5whWd59LV++1rXCutNxptM4jNgX9bO7mZmITryG
         EG4GuJrWDv/q3JFRPQYMWf1/DsMu5omgtRUq+ZjO22g+FwHHgUEG5lnyCfTl/8RVQRS8
         GdD8iwzwSxhO2wJtjTftI0tNNbmjtyccLy+PvmBTkcxwjxLAoqGSjRSZGbG7ua129Bdh
         6dgw==
X-Gm-Message-State: AOJu0Ywsjsb7OPR8H7qUA9OvwV2aHfPjd4YZU7y74O9le6gR0QYJOBud
	PpTuNGmn8mTTWTCVK7buQh/V5onLgBFD/iGym9w2pxIah3tZbTsC5fpSaQ999aKRvn9ftijnbr4
	HgaLvRebKIjnVwh4i6pbwEGUHzh6yj5u9MOjvwzcW/zjlU7p1VgkEndMCLXkG5ewkq86ILlQvqU
	SfYVnRqWpyErj1qb4IRafmt5sreRy9L4n10A==
X-Gm-Gg: ASbGnctbF1jqCAVvLxvnv/n5vNhJI1re/KC5NoQog7JMogUC4WJoOSJxyIkWwMA8nVc
	2JjVL1DuP9u4XAEe8jICVu9ssM3rjBBzf9AtjRBASypmz70OXKcAzX2Gawjqi/Fr6twnsHms68o
	tlFWZrPVqlAQp1RoZJkOkz8W/XZIQ0c/GR7VGR2ESAhzQ7bwJEuQxiL4h9hBdydFLLsXTS0pwBx
	MbcQKc64qWlixn2E9zVlPmA4seeuCz+3g3Eymhj+VF9CaIpVZA1c1FmmBmXLOTezW1eJHIwS8BO
	Coo=
X-Received: by 2002:a17:907:75e7:b0:a99:f56e:ce40 with SMTP id a640c23a62f3a-aa509bc1416mr23036266b.47.1732216094897;
        Thu, 21 Nov 2024 11:08:14 -0800 (PST)
X-Received: by 2002:a17:907:75e7:b0:a99:f56e:ce40 with SMTP id a640c23a62f3a-aa509bc1416mr23030666b.47.1732216094369;
        Thu, 21 Nov 2024 11:08:14 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b5b8224sm4175966b.180.2024.11.21.11.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 11:08:13 -0800 (PST)
Message-ID: <78c0ea0c-e73f-4614-8dd3-1b6088b042d9@redhat.com>
Date: Thu, 21 Nov 2024 20:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/39] tests/functional: update the aarch64 tuxrun tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-22-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-22-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: waSLIQOelUjui8Jl8AViiOudq4iKn7bfOeRt64P5VBs_1732216095
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5aXKOVsT05Ff

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> With the new rootfs the blk I/O errors also go away on arm64be.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_aarch64_tuxrun.py | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
