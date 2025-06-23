Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2397892dyb;
        Mon, 23 Jun 2025 01:11:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOuuyB8C9L+9SO+siX5XJZOx7Z0bKEElF7y3Hr2Hxfp9YuJ7hZ6/2cdNHZsWZnLtlL2jaxJgUHvU9Frw==@linaro.org
X-Google-Smtp-Source: AGHT+IGZOnAchePj2/tVLaiRR2PzM+jwmWKshHIQeIYMYoZnpTTkt3mO+XUps9U7XL1hiSbvH2rf
X-Received: by 2002:a05:620a:6188:b0:7d3:914b:abe5 with SMTP id af79cd13be357-7d3f9932a8fmr1625568885a.37.1750666293849;
        Mon, 23 Jun 2025 01:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750666293; cv=none;
        d=google.com; s=arc-20240605;
        b=Eb4iA0qgg7kjVNXM9d9pZq8SyC6cplklkV25hxvCZR2qB97z+6L6+xvvIFCu56gneT
         zYMzSHrTSWtyBzF+fWuyoAcp7PmBXH57G58n7Y6rRyvFxYBr/xTukOKzmKmBRGE82t7y
         Bm8NwICdTQN9mdkbw7+9rKlOhHgj2lmty2eiZs6C7vh8CwjJ03Wd5aSam3ZFy7m2HhOM
         aJkFEJjKPmLjCc7LFsDlc3kMLZkKMviirLs0Tcpu1mrhT4PLmSRW1ALCVS5ADQdlLwIy
         bhOiuXZxozyJPp1Sk/SBFlCjfM2kaKuWybhaz5lc3Azz0KL9xXMSKBpAyh03ganwGIIM
         McwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=+4kwDZoN4WuZV3NRgPforPSd1oPFe1fZw2u/4KSFCas=;
        fh=L11Ck3xZ8qvdjRPiJErCb0ZCHaLX/gNtqhZOKY7hrrU=;
        b=gdJ5j3kIQ6DskNeZyqDRWcb3I1rswSXh5vCFiMz5zD7/DmiO6ypyn4LLVTpfXa7Gai
         JE/hPlVRpIy8trK1ogqQhM7S1o8+cdG+UFuPLH9K4SFSTYosbqFRP9Y4D5KJsqikfGzR
         fW5XW6cOZg07pQkh0AIMvaSXmpJa4jFSPMUMtUQluR1+jqNbNf495+tM3BogPWJRB6Ks
         HZRgB6bqG9kr8RniByc+d4WC4yz5xk5H0D/EnIfMmP5OHbLz8+p1qkBdkZo6jzeUnO4L
         XgI0dq5SUN8lUTMJ/M0M1VLAGJVIjhuYUyYcllEDsXNhcI4pCqGZC556s4JwP1BhstPV
         aXig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gLAnU5vO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a1be8csi712800685a.531.2025.06.23.01.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gLAnU5vO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750666293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+4kwDZoN4WuZV3NRgPforPSd1oPFe1fZw2u/4KSFCas=;
	b=gLAnU5vOUDfz8K+y8QB7zVpuP8qoNdJyXqaLQgCna+mQ0XhFmGvRKefBw4KUH5g90PcnCa
	zmS0oRC/FHPzQGtrKCjWQ449XjnYHMMBZYV1b+0g6kJ2NmmbP58bAKOOV3uj7HerVO1Gqf
	eB87w94GDrZOzTtPUtlRnVmstoxpgkQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-8NrtxHAbNaWzns4l1yX-FA-1; Mon, 23 Jun 2025 04:11:31 -0400
X-MC-Unique: 8NrtxHAbNaWzns4l1yX-FA-1
X-Mimecast-MFC-AGG-ID: 8NrtxHAbNaWzns4l1yX-FA_1750666290
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530c186394so17200575e9.0
        for <alex.bennee@linaro.org>; Mon, 23 Jun 2025 01:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666290; x=1751271090;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4kwDZoN4WuZV3NRgPforPSd1oPFe1fZw2u/4KSFCas=;
        b=URf7Pqf5CGrm1JJZRp2+3PWDMJg7FnZe4z39MVXvQ5F3wBEjlVEthKPFgYR/QYUggq
         eV6mY7ET/Uo06GIOpipa3JmiAGCq1rF20HTeLBVxqKuRXDO4YMjc7p7IxckGVr/HpZPV
         DveNwOkhCXoBsl06egNRQmZmt7RrWzeMJvhlgnpD6rk0rhqgsWxlhlg0D5yX6VGWHIWK
         Cq3a4td/LHL+vfw8yLPYGyOzr5jT3ICiVmkyxUOgwixG1LAsJA1YntXA+4Tzr3jptsKk
         dL3Li63Eyss8AyGgHPIAKvZQbfbsHLzVTYwsaDAFyg6Txs0v1+FVyy3GZAOXHQY5Oh74
         qW4g==
X-Forwarded-Encrypted: i=1; AJvYcCWVi8hbCOdWDI7iljO7lNGQYRo6w92Grdm6n+XZB2O0a9BE5EW8Vy5F7/CGW4W6XhcftwEt3FQBlJHUWw==@linaro.org
X-Gm-Message-State: AOJu0Yw+ehw3gj0MJO2AoZq7RuJDLoz6A168Y061EeAqGsNH3Ynun+CJ
	RA3k7pyUfuG2oZ6iOA932QI8Tzr6CYqsMiR3eZWJDH6hbTPdYAXODNwZbEpLbG/+DNC/2RmRMZk
	rtYXHrwqaGO/4oKaJv4LtSbWZVlj5a2m10TGr7XsaC7c8pPc2HNjhqeN7Q1HwtersQA==
X-Gm-Gg: ASbGncva4oRYlRG0im5ggqEQo6M/joeTCq3A2CShK2z6kLO25rpogrqFNF4sxRIhLjo
	WIhQni3VfnRTX93a2RJEyg455/YjueeKcneCi2mAoicUh8OQR6+F0Eie2ormZD068t+T5LhxBv1
	xjwYP0DFrkkIV0qCdgEHQBeUDCL38eQ0pPldE9MsD0Rmrh/Yhe0KGWgPDLunD4cap0EqxXy0z/V
	61hcibBscxJz7fJ7E3j4bh69R7ExbRxCAs2OkdONlfJKYY1NAtuZf5Jtd+tompbC4dwcR42jbmN
	QeWoo3Qxw963GoE/ivUgXTM2KlW9smldpYdOjKrMLI4Ly/k6rcxWTL8FY+7DmWY=
X-Received: by 2002:a05:600c:8b16:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-453659ec1abmr113476305e9.17.1750666290159;
        Mon, 23 Jun 2025 01:11:30 -0700 (PDT)
X-Received: by 2002:a05:600c:8b16:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-453659ec1abmr113475855e9.17.1750666289717;
        Mon, 23 Jun 2025 01:11:29 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ltea-047-064-114-166.pools.arcor-ip.net. [47.64.114.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364708658sm103184065e9.39.2025.06.23.01.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:11:29 -0700 (PDT)
Message-ID: <497fc7b1-dfd2-49ad-938c-47fca1153590@redhat.com>
Date: Mon, 23 Jun 2025 10:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/26] tests/functional: Restrict nexted Aarch64 Xen
 test to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Bernhard Beschow <shentey@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, John Snow <jsnow@redhat.com>
References: <20250620130709.31073-1-philmd@linaro.org>
 <20250620130709.31073-24-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250620130709.31073-24-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i-68QbslTaq6KcuK99so046pBcuCQMqRGlqEIqrCd38_1750666290
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vcE2VGbMcxHq

On 20/06/2025 15.07, Philippe Mathieu-Daudé wrote:
> On macOS this test fails:
> 
>    qemu-system-aarch64: mach-virt: HVF does not support providing Virtualization extensions to the guest CPU
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/functional/test_aarch64_xen.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/functional/test_aarch64_xen.py b/tests/functional/test_aarch64_xen.py
> index 339904221b0..261d796540d 100755
> --- a/tests/functional/test_aarch64_xen.py
> +++ b/tests/functional/test_aarch64_xen.py
> @@ -33,6 +33,7 @@ def launch_xen(self, xen_path):
>           """
>           Launch Xen with a dom0 guest kernel
>           """
> +        self.require_accelerator("tcg") # virtualization=on

What about kvm (or xen) as accelerator? Would that work?

  Thomas
