Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp616373njb;
        Thu, 22 Aug 2024 05:41:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfecDNFRY4MEzCr1mNy4JGe1fDrfawpSsG38VQCPjtF2yaa1wz8DnyTAxGa4eiCQ197VWD
X-Received: by 2002:a05:6214:5d0f:b0:6bd:83cb:1b8f with SMTP id 6a1803df08f44-6c1568443cbmr53754706d6.36.1724330486550;
        Thu, 22 Aug 2024 05:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724330486; cv=none;
        d=google.com; s=arc-20160816;
        b=eX0UwoSaOyz0G8bL4XqE7v3NZGS0OCP0zTA6PbzT1NYQnqgp2GfRMQRZ94ieqcEfhE
         7Sc4TFPvz4jdEbjT+GSQf/jjW58Uc/t8dfCj1Xrwb0oc6ERJUnPf96mJZM3IB/CnFF1f
         zY0tJ6zL2vSDd7Gaby4QEGvRa/CKruKMBegmVfnIoVXUL/r7jq9dwd27Wup5sgM1YwpR
         PbLl8TuciUywsy7Iyp3ugcK5HQ/2x664BF88niCRUghQybpuVr8nt+orajkpMxrRNRyF
         4UFBFvlBmlneBkwbkGqkn0yXce8hPhM7gKmD+q6LgK/8XO5dgbD1HGt1HHKMLATMxeLD
         L3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=SQd8bcW6Xj53g0tkc08NUr+GZ0pADukDfDeSEsCT5+M=;
        fh=nkUgMAPNoHZyFlMobMABQCHYtsYvF08sBmC3TeDDwy4=;
        b=swCgImYUXFPyVHJWyLimJQumLru/Er4y7Rn1VQ0arhiuEp9GKas4gr2YsBBirj/xSx
         ilML9XsG5MB7yJjNupVSG+ZWPWJmK2byeD6yfJyVSXQE6bTnCyiB6cZorlDfIizVS+Wc
         wAaCNrU1wWDZbWMu4Q3vZg3/2sc+n/0I7gKiTXggIrCCfq9bCi4dTQJn9znjagcPHh8T
         jbGUnPzP6yHkPrsK7K6nGVdsfit32FHjJTgRpsc7W+jRy/01TPnLFj6HoE5y+D10r7RP
         vWy7CiX7phhbwDiua+b5U+B5xuVWcuqTt7rEFAvRlRRop9cXbm3B1Z/hQfrTDuXid7GQ
         uRhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bJi4ikL2;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162e550f8si16610686d6.595.2024.08.22.05.41.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 05:41:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bJi4ikL2;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724330486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SQd8bcW6Xj53g0tkc08NUr+GZ0pADukDfDeSEsCT5+M=;
	b=bJi4ikL2wk0XE1tcrcwr2aInyVp0Vipi3pTphpqrTjd0C0bzwPUAXJLGIsn9+/jLVA7dYK
	C6DIKjgVFxvbwj+FYGmikIufpE+a8/g9waPKtqmCQTl6ObpqXas51id1IbRwHkt9jK3AQb
	mTnvk932F8I3l9YH5XHLw9lH6lBnasU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-6co4_jGPPim9WQ4T2dNF_A-1; Thu, 22 Aug 2024 08:41:25 -0400
X-MC-Unique: 6co4_jGPPim9WQ4T2dNF_A-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-709436cfb9dso766418a34.0
        for <alex.bennee@linaro.org>; Thu, 22 Aug 2024 05:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724330484; x=1724935284;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQd8bcW6Xj53g0tkc08NUr+GZ0pADukDfDeSEsCT5+M=;
        b=wvsHvmVBfIHiFHWaFXOdii9wCCuMK8kfaEi6waNYk2PcXay69i9mgp5lL9AjH/PQfX
         Cra1zgMjEUlJnadW5GuwRSCeJL+tQIZaOdlsr/CLi8W+UbEmf/nt9/IVvHA50YCyOcEE
         vRjQr2Y+LhJOFYhaN52y7NRRvu+2rg8YmDL1rt3kua2Vn2j3zEc2LaygcrfMchyECM9/
         AUV/FiRy2EqdXl8BtcLbR7P93wBTYgeaKUwdCVd8xfIqtl+SAe6PU/z+eTYG/VrKNKGY
         W4J1G3Iwfu3qekSm0H6EW35g57sCK+N4OB4odANJDr1GcSxfNXs8Gn70IP8rJx/pOH1j
         BsuA==
X-Gm-Message-State: AOJu0YygiG94O3QVidJdE+48evklHE3d/rX1qcAH8CSdeE6qo8Qt6GoS
	7pCWgR0BGif4l7iUOSZrq4S8zMjhGk9kk37jYHhRy+09Ppizf4xh/cd02OzniCQ8r2C/HvDPr8Y
	IBLrz91v2+8eqBjg3smALV2kyB33T+9TpeluXycQ0on0Fq2op2xkbYaLeHb4Eww==
X-Received: by 2002:a05:6808:2f12:b0:3da:b335:538e with SMTP id 5614622812f47-3de19c75c90mr6730699b6e.8.1724330484441;
        Thu, 22 Aug 2024 05:41:24 -0700 (PDT)
X-Received: by 2002:a05:6808:2f12:b0:3da:b335:538e with SMTP id 5614622812f47-3de19c75c90mr6730680b6e.8.1724330484141;
        Thu, 22 Aug 2024 05:41:24 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-177-41.web.vodafone.de. [109.43.177.41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454fe0d91b1sm6297361cf.21.2024.08.22.05.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 05:41:23 -0700 (PDT)
Message-ID: <23566834-d8e5-4a54-8f3e-cc68e6b7d951@redhat.com>
Date: Thu, 22 Aug 2024 14:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: Convert Aarch64 Virt machine avocado
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240822120750.89065-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240822120750.89065-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: M7bz5Txkpbrm

On 22/08/2024 14.07, Philippe Mathieu-Daudé wrote:
> Straight forward conversion. Update the SHA1 hash to
> SHA256 since SHA1 should not be used anymore nowadays.
> Use has_cmd() and run_cmd() methods from qemu_test.
> 
>    $ make check-functional-aarch64 V=1
>    ...
>    ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv2                 OK
>    ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_aarch64_virt_gicv3                 OK
>    ▶ 1/4 test_aarch64_virt.Aarch64VirtMachine.test_alpine_virt_tcg_gic_max            OK
>    1/4 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_virt  OK   30.44s  3 subtests passed
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20240822114146.86838-1-philmd@linaro.org>
> ---
...
> @@ -100,12 +98,11 @@ def common_aarch64_virt(self, machine):
>           image_path = os.path.join(self.workdir, 'scratch.qcow2')
>           qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
>           if not os.path.exists(qemu_img):
> -            qemu_img = find_command('qemu-img', False)
> +            qemu_img = has_cmd('qemu-img')

As far as I can see, has_cmd() returns either True or False ...

>           if qemu_img is False:
>               self.cancel('Could not find "qemu-img", which is required to '
>                           'create the temporary qcow2 image')
> -        cmd = '%s create -f qcow2 %s 8M' % (qemu_img, image_path)
> -        process.run(cmd)
> +        run_cmd([qemu_img, 'create', '-f', 'qcow2', image_path, '8M'])

... so this seems wrong to me?

tests/avocado/avocado_qemu/__init__.py used to have a get_qemu_img() 
function, maybe you could port that one over?

  Thomas
