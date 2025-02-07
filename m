Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp295855njb;
        Fri, 7 Feb 2025 08:04:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6weFCrlmR6ThtkRC/YJwuUrCU15iK3w1U9sz5B3d/Al/R/tQdvbht4Z2YUrerNP2ZBx0a
X-Received: by 2002:a05:6214:1bcc:b0:6da:da7b:c196 with SMTP id 6a1803df08f44-6e4455ee47dmr61856036d6.16.1738944299004;
        Fri, 07 Feb 2025 08:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738944298; cv=none;
        d=google.com; s=arc-20240605;
        b=LdXHb/2bupHyGbijV19I5HPLgOuq0+hL9jEnvatf8OURUsmYvrq7jxE0Pvd3blqW+J
         wMz417F0pKADdXFOGkgdeutrtPGUPGBa5KUNXwBdYud+GyAh0xC4hK6O+41/vlQp1STV
         23kiSOHzJzk6jhM7I1G/lhMzeSgo5dRk+H5Ucps1Gk4/V81yNFo/Kvc7/jNlCNX5Qc/W
         xlKcXSZ8mmPF751zGfxn5OH/E7vE7g+4wrdQFdtlsZnwXTGnsrrZFfwoR5dFyTo0T1ZR
         R9gSD66qd5TyhfdVuZJ8OgfVtDYvt7Ev72WVP4VpkFa15X1GkdVxQliRGD5uO4lH9sRN
         5wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=xz0hJOJEOEWUqaSdSnNyXz9h0M8g/hqw16cg12waP0g=;
        fh=NSbtFz3wp1NkPqVhY0i446fgy/7r0dP459Tas04ioZU=;
        b=ZhoE4dnv8KhW+UXV2pL8WcNH9H1BlVpuuhfd4UrSjTGYOsmFL3mnkSn6QJKqI9iSFQ
         DtpRea4hnkji90NShlmiirkf60y0SW1bfnFl/ud6k/g6VjM2AAl0MorDauvym6T/ltui
         dowqbDc3OVI83gCCflzd8paiXwih5qtcqPKNyMsezjZZSGsxW6CVfkqxOV9t18h4IB5m
         uTob6jS55Wh0+zz1SwKFr3o5Vh5C/00c57jUe+Vu47GlXbgQxb77Ye5iCrLV2WR/rfM7
         fspgvArUPc7wy+qXFUatrEe5eEcPT6vEMJfs8I13k1iFrJpRnJ5MfMBVT+oxhezphJD0
         /VAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hdLuyQhk;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e4447a49a2si21004516d6.254.2025.02.07.08.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hdLuyQhk;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738944298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xz0hJOJEOEWUqaSdSnNyXz9h0M8g/hqw16cg12waP0g=;
	b=hdLuyQhkXSNFoejLuutzMAzGNxYtak0L6h0O7i8S+iaE8GPllN1kp4/8+wihg2/CKP6vHo
	sJQbuBihgrRlONfV7CsrL0kudOwY2Cx45jU5jb4kWQsc28Fxodey11ZYdE7wDWsWGcTxiU
	IEjW3xzCEUStrmSFqzu82Hc7ugrWDUg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-0ik0lOTqMoOwEyXgOhY0Eg-1; Fri, 07 Feb 2025 11:04:57 -0500
X-MC-Unique: 0ik0lOTqMoOwEyXgOhY0Eg-1
X-Mimecast-MFC-AGG-ID: 0ik0lOTqMoOwEyXgOhY0Eg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so19165245e9.2
        for <alex.bennee@linaro.org>; Fri, 07 Feb 2025 08:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944296; x=1739549096;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xz0hJOJEOEWUqaSdSnNyXz9h0M8g/hqw16cg12waP0g=;
        b=bWfYbGjJtCIYjUj6kAMevql5fuQzucMtTHrWCILS9zyk7LbeS7/Po53Femw1WPMNIW
         7AIWJQ0fZgbtao6/CU91ZwM01LelMkvxwDAH2bc9DHDNEMKdpmn3Ho+KrrNKnCQDvBKI
         KORxBfYTJtC9htilANqymv8pR2SdymufkrdfUQm3Sg1hxpxO4GyTcdmBKbgsXROFSazl
         dSN7hEB0TUJNIYeofxDmjPaMZ/F6LdKaKxrkjmiU2Qw9KHrZ37VSq/SaYT346ovT7Lml
         yb6+6Uduc/FaAjLhBbx60FvtOkiljvgCnAcTsYUA2TsfAXScBdqlu5JoXOivWh4YTsMa
         jFVA==
X-Gm-Message-State: AOJu0YwTy33KbNGW+oPoJfJqrb2Aw+n8mJdj3kj4Ff7T0HiC9/34G0W6
	YmwBZNfCazN51t043PpBOUWZu/CY8W1IK6uMfYgc6vw75KWfJpBhT3g9f0lYAsweC1w4BrjcJuh
	r8OHePS3yjm4gpg4z+8VZpGu9By9wwFhW43pwG54nOR1kwdx6O31zr7cwutJX3rC8/J8q7Pf2o6
	1QChqqDeCAei2GcGqdysf7BkYwX4Y17Om7IA==
X-Gm-Gg: ASbGnctzzbqCeEG0ZNa0aCr7NxcNsk8OPXbfZgRLKWpTcJVwCnSurd5ykAq+bjNnVIc
	2kCxFRn87uG5hfRZbyE5wmBC6Ohb/4FH3zb3QjKsrUUclVzeH4OTRN8Jc4PrqlEHKxlPXj6Q5SN
	PLzQLe19QUUKJAnZHC/qBChYLujk0jp1/USUgjbE8qoZjh1sSfzB07kvEaOWpCUVctezeYcb91e
	hSRJlFyQwU3jko3ut7Tyd6nVEdHRJ9qFOClziPixj3GAiaAFHMCltn/4jjttxJI8M6G2qLy0ReT
	Xv31Prwf1iLKOy5QKvL7jrNnLAL7/PAwaqHb
X-Received: by 2002:a05:600c:4754:b0:438:a1f5:3e41 with SMTP id 5b1f17b1804b1-4392498b6b7mr41958735e9.12.1738944296131;
        Fri, 07 Feb 2025 08:04:56 -0800 (PST)
X-Received: by 2002:a05:600c:4754:b0:438:a1f5:3e41 with SMTP id 5b1f17b1804b1-4392498b6b7mr41957485e9.12.1738944295545;
        Fri, 07 Feb 2025 08:04:55 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de. [109.42.48.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8a4asm59953685e9.32.2025.02.07.08.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:04:54 -0800 (PST)
Message-ID: <f9877082-0238-47ec-972b-c750aef356ea@redhat.com>
Date: Fri, 7 Feb 2025 17:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/17] tests/qtest: rename qtest_send_prefix and
 roll-up into qtest_send
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Kyle Evans <kevans@freebsd.org>, Alistair Francis
 <alistair.francis@wdc.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Riku Voipio <riku.voipio@iki.fi>, Harsh Prateek Bora
 <harshpb@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Alexandre Iooss <erdnaxe@crans.org>, Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Warner Losh
 <imp@bsdimp.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
 <20250207153112.3939799-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250207153112.3939799-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U62fwHNuxVb6AplxtupT0jz2TKAKvnT5QElPjPWsx9I_1738944296
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZN67vI4adMaP

On 07/02/2025 16.31, Alex Bennée wrote:
> qtest_send_prefix never actually sent something over the chardev, all
> it does is print the timestamp to the QTEST_LOG when enabled. So
> rename the function, make it static, remove the unused CharDev and
> simplify all the call sites by handling that directly with
> qtest_send (and qtest_log_send).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/system/qtest.h |  1 -
>   hw/ppc/spapr_rtas.c    |  1 -
>   hw/riscv/riscv_hart.c  |  1 -
>   system/qtest.c         | 26 +++-----------------------
>   4 files changed, 3 insertions(+), 26 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
