Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5297655njc;
        Fri, 22 Nov 2024 03:00:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUv9ip+H+TU1MJiUFb6LpzhADSV9MhHSNyxrJ5ty0Udy8zqp0GZQXHaI6uELxQkC7div51
X-Received: by 2002:a05:6102:418e:b0:4ae:ef2d:e9d4 with SMTP id ada2fe7eead31-4aeef2dec13mr1500211137.12.1732273252497;
        Fri, 22 Nov 2024 03:00:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732273252; cv=none;
        d=google.com; s=arc-20240605;
        b=YcoTIlvhnrS/oGl7aHDyrcNffljZ9VEkCLkNtqMCJELJZfFtxkvw9iBJk1gDkv1VtF
         OBXRw9ORoXqStNhjPex1ZnTOg0y5g34655+ecKJZSO4LTf2MaQz96i6k/69aYjdl9FGK
         yHY+5qTcud3iaS2dPpCXiG7rXPemWgEFw8m84tWpTuIcLJWeY/otpqrH269z+P7jBiKr
         eWCCTuNziNw7aJJ68KhVf4b1AElw7Q9nX75YzT8u6nHjSiv8uBWSHhVVF6zGOkaAw3a9
         GR1914VPTozDOAwqAcGtDxTQl2QwlGnd4r2KSh/VkDKizJ398oxiJNhHO6v61wGl8jOz
         JU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=OMew4vPdK6sqjeDpUnlk4kde4xOGSQ7JsTumV/9mmUM=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=iZbWeiH+fU4TcptSwxk3mznPzjXNsbpVtrkQoe9XM2MpSMTRfhjoqm0kVwflra6hG0
         a0bG7siLlm514sw4ylt0mnCZvisC1DZf86Ss8dUS61e8gJ0ydlNLnfRxrM5hkd5HzuBM
         gQSWO5vN+fHabjmHOVQnPVEV6nPzh46pzqH+JS7GTSeMlWAia6OCN+g1U0BmI82aBXCJ
         Z1ri2pRHoalR+m+8K3GvZLkYbs0shtkaM6YixqanGhqDdpAhFFFq5hVZoU8ndFU5ZA5R
         Q+iKLaTlFbFEC8Q4iHhG4R0HolYLBcQSWYrBWauOKIrxztT6spACI/jjJwOAdFothoBA
         4d1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ANOza3Gs;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4adda4e92e9si545733137.121.2024.11.22.03.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:00:52 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ANOza3Gs;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732273252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OMew4vPdK6sqjeDpUnlk4kde4xOGSQ7JsTumV/9mmUM=;
	b=ANOza3GsP4Yf0A/gNwbkp1k/v8Ng/BIxW6MXByjMXVKRlO/dPHnSuEF6RSMS/UbQV7Ejzl
	6Rq8AmGDpdCacqHJfwaTbX9EOK1pqpNSHaouFXeO+bpCUBwto8oN13trCsxqDlYoFa7EnN
	SNUKWsvGmpHxn+6xAKskg5L/rXabCSM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-5GzAsnwcMp2Pkt7G782QZw-1; Fri, 22 Nov 2024 06:00:50 -0500
X-MC-Unique: 5GzAsnwcMp2Pkt7G782QZw-1
X-Mimecast-MFC-AGG-ID: 5GzAsnwcMp2Pkt7G782QZw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4314f1e0f2bso14902045e9.1
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 03:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273249; x=1732878049;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMew4vPdK6sqjeDpUnlk4kde4xOGSQ7JsTumV/9mmUM=;
        b=gvSAPyA4w6MUm1xl2yaunXYg/bf+gBfuTAf7T2GbREiAnZZSbMOltA5hqKcAwWC44+
         7j1dgOPL4jUyYRF28paJtnegXKNC9d1hgnmS1ZelWeNP71SySPe+b3SKGaJ0gFnNztfj
         5299sCnTgwOmQcvGXMulDalx1nZ4xlRhwmqnVdIdDULugYfAcK6mJ48ZRTv7kRsNkUSu
         62+/nT4SM/t0iVAt+4HDZ6D23A9V3fH3MYd/pnsX1xnMO4XbCM7+wvLevlJvR5+MAkG5
         XpZvexxXxwFBkEglWLgNl6OIb4q9he1NO9OoAc6sJBX3A5ntMtOfFhWnjYbeeL6lQw5O
         LVFg==
X-Gm-Message-State: AOJu0Yxs3SFZq1ze6BeAlseVDl/aUAk7jVa91We08mlYIQMJm9Zwrx6d
	VHQ6EeT/9rsXKB+UHTBABebKrnrs+r2jkTaQQ2igxzbk5N4D4I4h//X8celB+I4fne2lqFJhnno
	8+2fY2/4pW9sCR0qd+oEG/jC0Te/Gupr4Vkr1wUjH3q82ViMzTlTkWOdlsp/n50ztoQc+kK1ZYP
	OcUzq1MMqK1mzoB9IMTMdtGhAbzVeSX7CdJ56Z
X-Gm-Gg: ASbGncsAh2E3nD0foghkXDgRjIioY3b0RGfozw5vJkRZ0fUehB1WIj/1FVndkD67z3F
	vqq0E2YhVZcjV6IAShKrrZ9XahFpRQ0NJZe/wh5ctOdA/GF89rxUWg8zVJgZIQ6DSSfjAaqnfUp
	YUH7Ihdi1KFTChGXAGsC99OyjZmfYgA3WGQ7bu5dyQfxQrKzhUYKcmkJBPabi2OotWEYq+nQILG
	MWmWAVKnqnXegHxB/ET3gop4XkcljXauFM/uwPag/YT2XCP1x5AWzL8RJtCjYgVF9ODz6DsnJw=
X-Received: by 2002:a05:600c:314d:b0:42f:8fcd:486c with SMTP id 5b1f17b1804b1-433ce4f2319mr16365175e9.33.1732273249593;
        Fri, 22 Nov 2024 03:00:49 -0800 (PST)
X-Received: by 2002:a05:600c:314d:b0:42f:8fcd:486c with SMTP id 5b1f17b1804b1-433ce4f2319mr16363825e9.33.1732273248285;
        Fri, 22 Nov 2024 03:00:48 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde16c9fsm23618135e9.21.2024.11.22.03.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 03:00:47 -0800 (PST)
Message-ID: <e8f62175-1603-4b68-a532-103c91c35aad@redhat.com>
Date: Fri, 22 Nov 2024 12:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/39] tests/functional: update the s390x tuxrun tests
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
 <20241121165806.476008-33-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-33-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _wwVIzgyqK-bLX3lAilc12M1I3tw06fNEl1-Q25KOW4_1732273249
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: l6yfBjzs6Tw8

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_s390x_tuxrun.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
