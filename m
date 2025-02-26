Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp983615njg;
        Wed, 26 Feb 2025 07:32:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJhramd4ZiiJYqC/9YTZUwpfdstOPSskoed8IQHjCitw7x7uqOLJiSz8Xpa7B2mxyjHI4G
X-Received: by 2002:a05:620a:198e:b0:7c0:8978:d1e3 with SMTP id af79cd13be357-7c247fcc139mr510973985a.46.1740583968539;
        Wed, 26 Feb 2025 07:32:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740583968; cv=none;
        d=google.com; s=arc-20240605;
        b=cZ02OsXewOiNM86V5/bvedDh6OlbBY6RVp4pPf3BL4GegGKwS99q7A50k1tXGs1ngL
         p+sp0QnkacKGOYROkjM1aVuelugCwt6OBSV6bSQeHiqDrYpJIru6r6wPIFdvt7kPuco/
         gKqJajVIeDdLPjb9h3FPjvqtN0hqr4XZYdX+PRdZP6YmSpp9T6S93QMWR97B92UWkEwd
         IN18s7a3drgSXCbBwXaNQHWEnSUYTizGLqxBaehgl1C6b4TEJlNBg7HI2fQD/OhK2mNi
         p8MoLckLl0DbOp6oG7sCDfb1PD9d/6w3KI8RfLvymAu7AU/u0UoYyaTCsgmQ9gCkUhnO
         Z3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=iy51FRMmXdWB9ecHiyxXotEaAghHQLo7dDxjuuWhQgU=;
        fh=kMuyKEDVLpXx+n9GsiCpA1spgm27ONyskfB4MRxywKY=;
        b=M/e7rK+awIOhxLMoJHvDafLNivl/OxjEZ6QrwftMSwmWdQZ3b/K1hpi6hGePtUkIDV
         xNBKn/fbqxOhM1NeFdqlDwuLrr4bnBe7wid3Rhd9ixAJxindeZ+Ty0w2ykzjceQ2g1XV
         uwT66rJob+PWG1bZZ1//imDugvIf5NsJ9R5mpw7u+rUy53hvFT7DqbVwK3aeYsi3dsce
         KLJ374OHwhkobT4mSEUpLhrI2CEH2mkvpyCzaqbkRut7V//LMHHQgXJj4lZZ2wD9ObdG
         mxgQmyJJY37ayiPFxgbpDG0Izu7X0elEddGms8VnHI1RMzfvZmGWyZgpGvCnW2uiPM1e
         UoIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DlMcRFeH;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c23629fsi371881285a.46.2025.02.26.07.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 07:32:48 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DlMcRFeH;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740583968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iy51FRMmXdWB9ecHiyxXotEaAghHQLo7dDxjuuWhQgU=;
	b=DlMcRFeHbDHr6K07W+cQT6632xPR8qVRg+t1ja9rmWTApC7wZU8Sw1gl+n2+N7hAuwpEFH
	K2k5NUD3UBTIm0v62oIJuzK1KaJyLKjaKWqlxKcMH9WM9iGZwR7GYCu2mPg51y4YvDXUAy
	dCe4fHMQGns0mr2drVBD5GXe5WSwb+I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-VzaVnrOBPVGxhYfijXwEJA-1; Wed, 26 Feb 2025 10:32:46 -0500
X-MC-Unique: VzaVnrOBPVGxhYfijXwEJA-1
X-Mimecast-MFC-AGG-ID: VzaVnrOBPVGxhYfijXwEJA_1740583966
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f2cefb154so4970721f8f.0
        for <alex.bennee@linaro.org>; Wed, 26 Feb 2025 07:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583966; x=1741188766;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iy51FRMmXdWB9ecHiyxXotEaAghHQLo7dDxjuuWhQgU=;
        b=QX8zVLulGxpNQKyrCcFmXcxGIayvnrsdEoEsmsnzkIPTakkv0nr2EnH/mkcUNJ9dv+
         MNwqAqSP4qMwEn5sS02UygFPodG2odMs+BAu1IXSF3YZbEGqkDZ+uzpH4KP1ncDDr8IA
         Iz3OTBYHA9vcxxpTZ23ekYCSXt4Rly77QgMvuyrSS3/EleBaencjSVo1icMGpN36KFXN
         4iJWZxjKzu/gp1WEj0sqKCBQkK6o3HA8BEenM2+FdrYJ5/Q7Qy7U2Skkqr0I34k5wQl9
         980nVOjoqjhwWzIyrvpMZm7TGh8xp3mAr6+tSNy+dVCdmb+RQgm1HaSK/+VMdzGCsK2m
         9fgQ==
X-Gm-Message-State: AOJu0Yzi7sI+iW7a1DfM6simlOGaSy6EE50dtYvPTicbtVEifjkZaYGw
	v7aVNVu0t7OxThJ4U7abiE1F+PywgvurqIbEk2//Vq8RQxm7nCd1akxUT7iHF02k8rmNanaNL62
	ma50Qg6kG+XDFkTNuMLE3Q/E/NXY26fLyPhlhdf9vs51BT0nJHnW4CCCSaZh8mZR71gfyYuv6Wh
	pSb08UQsN8HSYqGBx0zyC6EFaZXMzaxrsEIw==
X-Gm-Gg: ASbGncu/S7584XAg+6OPUHZLlTDi+ovEKPYWXcyJI+clEba/3v5LA0RjucdhmfIcZsK
	LrdIgifTPnfS81sqO9C8goftssT6PVX7z8DHdDyecVGr2wrl286FI7pCoTZ2JFuOmiH7DW04e2A
	6mktdC8hRtuYRaFF9u9AveObWLdCGQSpMkxC0avUUb6/vdHBGUh4Flc8ks/pKaZhDv/5UNnwFsx
	cDh0++Cz4w0nJ9WldZsDX9xpICURVQeR9sonhGqMLGOsBxzowmX60djzVRiB23ENkYNeRrOXIUb
	DpJyyPugMNSl71LgDtiDLmFcSqPUAuZiswCF4XjO/7AwaEk=
X-Received: by 2002:a05:6000:144a:b0:38f:4e50:8b1a with SMTP id ffacd0b85a97d-390d4f43021mr3847263f8f.25.1740583965721;
        Wed, 26 Feb 2025 07:32:45 -0800 (PST)
X-Received: by 2002:a05:6000:144a:b0:38f:4e50:8b1a with SMTP id ffacd0b85a97d-390d4f43021mr3847210f8f.25.1740583965289;
        Wed, 26 Feb 2025 07:32:45 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-245.web.vodafone.de. [109.42.49.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86c9ccsm5960982f8f.21.2025.02.26.07.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 07:32:44 -0800 (PST)
Message-ID: <849db12d-868c-48e0-bb0a-5677a612abef@redhat.com>
Date: Wed, 26 Feb 2025 16:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/25] tests/functional: factor out common code in gpu
 test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250226140343.3907080-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qCNsU3Rrf3Yv90ehXyEp1rsqz3KzygVcNtVlUPnW0vc_1740583966
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JtRSq1E/8ffd

On 26/02/2025 15.03, Alex Bennée wrote:
> In preparation for handling more tests split out the common machine
> setup details from the test specific stuff.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20250219150009.1662688-3-alex.bennee@linaro.org>
> ---
>   tests/functional/test_aarch64_virt_gpu.py | 30 +++++++++++------------
>   1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
> index f21ae18392..06093c6b60 100755
> --- a/tests/functional/test_aarch64_virt_gpu.py
> +++ b/tests/functional/test_aarch64_virt_gpu.py
> @@ -39,12 +39,7 @@ def wait_for_console_pattern(self, success_message, vm=None):
>           'rootfs.ext4.zstd',
>           '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
>   
> -    @skipIfMissingCommands('zstd')
> -    def test_aarch64_virt_with_vulkan_gpu(self):
> -        # This tests boots with a buildroot test image that contains
> -        # vkmark and other GPU exercising tools. We run a headless
> -        # weston that nevertheless still exercises the virtio-gpu
> -        # backend.
> +    def _run_virt_gpu_test(self, gpu_device,  weston_cmd, weston_pattern):
>   
>           self.set_machine('virt')
>           self.require_accelerator("tcg")
> @@ -62,10 +57,10 @@ def test_aarch64_virt_with_vulkan_gpu(self):
>                            '-kernel', kernel_path,
>                            '-append', kernel_command_line)
>           self.vm.add_args("-smp", "2", "-m", "2048")
> -        self.vm.add_args("-device",
> -                         "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
> -        self.vm.add_args("-display", "egl-headless")
> -        self.vm.add_args("-display", "dbus,gl=on")
> +        self.vm.add_args("-device", gpu_device)
> +        for opt in ["egl-headless", "dbus,gl=on"]:
> +            self.vm.add_args("-display", opt)

What's the advantage of changing the two -display lines here? The code is 
hardly shorter and IMHO rather more difficult to read...?

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>
