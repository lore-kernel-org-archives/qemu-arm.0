Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp4346379dll;
        Thu, 21 Nov 2024 11:04:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzHzdectN9UbvGksag/lh4WihzDc9zSyv+d6KteLSZ/feOjD57gH6Z2xW6fkHYf5dpbAuI
X-Received: by 2002:a05:620a:4727:b0:7b1:45ac:86b4 with SMTP id af79cd13be357-7b5144c87d6mr30595585a.21.1732215855125;
        Thu, 21 Nov 2024 11:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732215855; cv=none;
        d=google.com; s=arc-20240605;
        b=gmrFWMTxa24CWRz1P08bEULjUvX7Z/g1RIAfiidxLoGxs1ZweFfUytF7mea+A1ned1
         Xpz976iDAiD6WGvuBc4/+3+p6CouSWr/ATxzz8kEn7a7Xn3uTaDCHZAqlGfG3kenkSoA
         zIAjyy19GT52zVnREhQL3u1krHr56m5EcNqdVL8yhyCcfwy4mHwgKR1dbUAUmhRBbTPv
         +eM3kEH24/F+GTbT13ssVQ7Jg9bGDJka5XCiLt8bM9dvouzp/citXssjBGAn8HFGFzgm
         BU2oWaaVZgVmo2OhllOfFVD1ebCspWKDQq9ujCCbz66bRlwgcN2i3LuBs2+GVgZQlevc
         0AMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=bWYOm1YuZRGlW9g1Erx0N0dY58W3vi0hbMW4ZfJBLHM=;
        fh=wVPQWqTxHsMhgDFUYzS4WRCfPsDqkM1sZVnXLJCyo1A=;
        b=aqej6OB33WI0SrDyxR8iE0+KeJnBdBN1Gnuo0Eg6iyedovASmAJb+6Cfya046JNzKs
         w7sBhu/hr858aF98KZZpX2+1U6e0n+FBSnnK7aqYdXK2zyrUJHmwDH9rDNdF6VWjqrnW
         UFAz/9a6w9scisGDqeAU3GPkWF0gT2j0YvwEoahyjKsRw2L9DaHSWbZdVMELbZff3gNC
         TNRgFoh1DK+os20NMsU2qkh17+qHiA4srKUaMfTwi7T4QEv7om2zDnkj1PizlmA6AHRF
         bp7n077u4+tcu0Z3E7Yx/zZe3fsFbTfEWkzw81YG3oUVl9xGOEwAco8cGajR9eivmaQh
         avqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MTu4L+o1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b513fa75c5si23533885a.162.2024.11.21.11.04.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 11:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MTu4L+o1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732215854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bWYOm1YuZRGlW9g1Erx0N0dY58W3vi0hbMW4ZfJBLHM=;
	b=MTu4L+o1qObeZMKWs2fSUKDS6HSgdQpiOn6/x7JIebfSojjlxCRH9LZXshdVf62gsuZrS9
	dK38n/lfx1fK7hHKhcaEl7597LPq5r29ZUyqmqMVxNbYDf/GVWV0aZftVnl/b+2qYJzO1V
	/Ph1aTGr/fWsPnCkbGevz4rAfvH1ShQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-pWVTsCPfPLeqsF6a9Bu7Ug-1; Thu, 21 Nov 2024 14:04:11 -0500
X-MC-Unique: pWVTsCPfPLeqsF6a9Bu7Ug-1
X-Mimecast-MFC-AGG-ID: pWVTsCPfPLeqsF6a9Bu7Ug
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a2ccb77ceso74227266b.2
        for <alex.bennee@linaro.org>; Thu, 21 Nov 2024 11:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732215850; x=1732820650;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWYOm1YuZRGlW9g1Erx0N0dY58W3vi0hbMW4ZfJBLHM=;
        b=sq5DFgHXwkVpfUGlP6xMq/gvzelT7aUirigfu4CR+Iuwg2WGwD7A+wnazbSdqxmgsO
         9BwNZXglIv3aUE+9qC7GXu17gW1azE58OUaRoa0vCzcoY8wPMs77KXdlO28WcSjoL1Vd
         XCZMDRJtryvQM+1LogIcOaRsbkYGip0OUM/l+9dk1kZxstDfker3HPqVz25dHtr4WCrd
         Wn7Mi4t1crCjjIgHc0UYpXNH1/54ghAXg3c7euUvjXIY0wTwO1rEQhM+yAROOoHW7U5L
         ZbWk+9r2f5NFdrsPOQDos2wk8ApXxdxr5Z/FkxyQ/UyqBNqLcwxzOiDhhlPkSlU8kmO8
         75zw==
X-Gm-Message-State: AOJu0YxCuv+/ld0G1eCaKlmgB+smgh+ZmUm2/SGV9ktBX6e1+s7FEfTn
	sX7BpPHMap5d1+9jxoaYAx5UnniYqBoya1bi4uJ2W3mUl5itogFc35l8I2aXU3ywmQvHOcyEskb
	83Nxx/XmQLns1mfPX4mTa6KmwLlpBN0UOYQp1RHygrqpIDf/AMrTec1LJwKS+18OcCWmMoV9khu
	wdbT273tRrbaTDXzYngJYlvLMA940EPLH4GQ==
X-Gm-Gg: ASbGnctwCZ55ThOfAjaweeNbwvt5yOdv/uKhSMY3d0ipN6SYgaotpLbFI9jtVhz2W0w
	KTKr0HO3a2CPkko1Gr/mzBytBQBN87KF+clcMZ8DQ8LnmnlpmfkN33lM0+kUwo7PONiEZBUdr/r
	ilRlPCs2O0Xl06fmtPF6XTl/6XQAKLX8iFFx2zN6+I+QqNwRpVM8Z98Qo+xDTnO8Ml1zrWhng+k
	n4/BqrMXZChqYBX9XdZLMqSYl/5/bKawLSsoyWG9Lvf/Rc4gX3+NiPN77V5cyI+87GVWvYEOzP3
	E4Q=
X-Received: by 2002:a17:907:aa5:b0:a99:f167:47c7 with SMTP id a640c23a62f3a-aa509bca75fmr22740666b.55.1732215850142;
        Thu, 21 Nov 2024 11:04:10 -0800 (PST)
X-Received: by 2002:a17:907:aa5:b0:a99:f167:47c7 with SMTP id a640c23a62f3a-aa509bca75fmr22733966b.55.1732215849736;
        Thu, 21 Nov 2024 11:04:09 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57beb4sm3909966b.151.2024.11.21.11.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 11:04:09 -0800 (PST)
Message-ID: <155840b0-d461-4699-aaa6-4b85e542281e@redhat.com>
Date: Thu, 21 Nov 2024 20:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/39] tests/functional: don't try to wait for the empty
 string
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
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-14-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-14-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LULPZ5npzOKvTy-IPHnwb6z_c5xupP_j4Tc6GOrQYgI_1732215850
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: p3xh/6sxRMBV

On 21/11/2024 17.57, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Telling exec_command_wand_wait_for_pattern to wait for the empty
> string does not make any conceptual sense, as a check for empty
> string will always succeed. It makes even less sense when followed
> by a call to wait_for_console_pattern() with a real match.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20241121154218.1423005-14-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/test_virtio_gpu.py | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
