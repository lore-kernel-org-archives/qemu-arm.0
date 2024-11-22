Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5298993njc;
        Fri, 22 Nov 2024 03:02:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjy/EdlkB2Oc0+prSCQRnlD9PgqvQPIZl6Z1wkL6nFkgnDe2uitj3/+q3OTzNUXjtIQcn2
X-Received: by 2002:a05:6830:631b:b0:717:f666:9559 with SMTP id 46e09a7af769-71c04b8ad74mr2509690a34.9.1732273364195;
        Fri, 22 Nov 2024 03:02:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732273364; cv=none;
        d=google.com; s=arc-20240605;
        b=T26IzAUNKPFsFmPdmm9wTNIUY8qB0ZoM6inKIhzvN+ohyVzW5MNrEfA0O+0toIJZGw
         9ZSxXMr9tVPfB1iuX4yenaRKyosEuc+GM9Z57zEW8NW1vAwyMnUcR8DPa89gJsMrA0lz
         qCaUZJ9obaFeD9DuwLxHsd1+eHdWKm6CyIUBkvXJLmpPNqMQOAgx2SdmFH7pQ0v9UwGv
         BHsK7bGeOoPrORIx8MIDBIbiP2yNVlPyuFvOlck8CEp7ExDpzjlFoHp3SW7ivwpzWPxH
         2XXIGUECP7ZUqFtN2/UvgSZnW2O0LjH5RbQQeGK3Dt0/F+ppYo+6LwovRNZY5+isrPgt
         7rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=tRU3Pl1CnWZWTXmMyR9NrQkdjty4F9mnR2dBNNg/6ls=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=lPZJzcQU79ZTotLnetNEHOAaylbwHWWpAVJkNVMxb/2qbH5jEKchbyd863g45QCcUJ
         4FLcnbm6TH/Ol3qLtUFrdS/wbTZCurBtcbXLBXRC2se4Lwg4ZpB6O2yJz3tCHftIDf0c
         XGJCv1hgct5pGjFJ3ghkLfxPsjy5enFXR9TT1p//nCRgu0kFyr1AQTIzbrolICGlcQxw
         T5meC7mg8sIqBFi0JnzAjyEF4PEufexynl+Eajt15seqJyJnid8RT/zh4Z+qPyorfybQ
         zXWgWYuqoUYFCtJm40KW86BoXQtiXgBRUbfcfnkWtS4vqwh6zzBOQTZPlA47tI7gmGk2
         R9ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aG1OMWCg;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4adda798097si527154137.728.2024.11.22.03.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:02:44 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aG1OMWCg;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732273363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tRU3Pl1CnWZWTXmMyR9NrQkdjty4F9mnR2dBNNg/6ls=;
	b=aG1OMWCgijM8ntMpLPZBtx6ngJ/6N3H/gI81j1O8SKFI03g8xgzNhFzR2cXr2YUCWgGe8t
	VU6I1HLee55bGmth8KNqtg6GOuP0j5xMrNR5X7hbPcV8eXZkz6zx0B0Dmon5tRXeLUOdf+
	dyY0/kpOXfkFSQBghlY1JzT95BVxF9s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-x8Lvr-J0OtynhEdH50O7EQ-1; Fri, 22 Nov 2024 06:02:42 -0500
X-MC-Unique: x8Lvr-J0OtynhEdH50O7EQ-1
X-Mimecast-MFC-AGG-ID: x8Lvr-J0OtynhEdH50O7EQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3824395a677so896393f8f.0
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 03:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273361; x=1732878161;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRU3Pl1CnWZWTXmMyR9NrQkdjty4F9mnR2dBNNg/6ls=;
        b=lGDQH8vDJLm9n5IrYdwjQhDTXld7TP4eo/f7VdmAEl8trp5JzMxfTXv/GOZACXw53m
         Tba3qvxycJEPqxomDRPitIW7GbaxMLS0umk27VFeCOXALHXgN72eSPp5u7HiY4izI+HP
         PBc1kDUWm8H86cQS+MqpYxWMkMUeYsH7hu2D1pT3p7Ls3h6MU1+PcxRmXH7DI+XHPZ+r
         lnFr1owvtalFpEZJMzqimzFrdBUZHPZC9aVxJ4rHqO4kb7PmL3JeSJsQ63VM/c+t0CD0
         b5KjbIfFsBeka8dltqVsOcu7pmxgaDZhAumMEhi1ffzgCXbIRGUW9co0U5eJA1aViCMq
         siOA==
X-Gm-Message-State: AOJu0YxI9y6ZRJ2bSuE8O4OwC6xH5ntvUbgpBUxQS8qbRluGqJev6xGt
	WWMHcdz6vwMkIVZSpruRWEZyvUVPUWEHSOZ4DEtP09pSeoh6ZsjijyLsRLkUcDzSjg/JT6qgw0R
	WLs+vbeykTlhp9T56nHIVYYLpjdAhAz+yKQFb3DsuIZUumEfxqQSYlXvIusL9DcJJEw+9wXjKYU
	0ujl8OaCZfBeoIECDBSG+sTKO6tsRBluEtf/Ed
X-Gm-Gg: ASbGncvdfYQwVOo88R6Kzu5ela6zx8kERHjLhT8J3XmxyQ3/d/8Gy8+fOEm/GEjKvSH
	WfHELjX3qgrUMaeahFVWGU/ISHeC/kpMuXPp0BsC6SLclIDISiovGcP/X44vQ55OaYEcj+Iy63J
	fP43lyNjIrE0MmO6jPEIeQKbbltcKimrHDH3h/cJyvvtWxOOvB72L+nD1mB44dUxmlcWDuREW2E
	VJgMrk6RrWzQjSKjaCz4Ev19LeFmP9G3rmL1oDMvdiJDg+CJsO4WqN+IEGZlZ/EvX0x2fELGWk=
X-Received: by 2002:a05:6000:1867:b0:37d:53dd:4dec with SMTP id ffacd0b85a97d-38260b59cc8mr2307020f8f.15.1732273361153;
        Fri, 22 Nov 2024 03:02:41 -0800 (PST)
X-Received: by 2002:a05:6000:1867:b0:37d:53dd:4dec with SMTP id ffacd0b85a97d-38260b59cc8mr2306939f8f.15.1732273360636;
        Fri, 22 Nov 2024 03:02:40 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbe91a6sm2107129f8f.86.2024.11.22.03.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 03:02:40 -0800 (PST)
Message-ID: <fc3c8b76-5fed-4045-8f64-0521463949d9@redhat.com>
Date: Fri, 22 Nov 2024 12:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/39] tests/functional: update the sparc64 tuxrun tests
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
 <20241121165806.476008-34-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-34-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 94-el5_KfKNPizJeCfAroWr72YXBaCeWzrd9GeGqEz0_1732273361
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4Kjl8zIS7ope

On 21/11/2024 17.58, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_sparc64_tuxrun.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
