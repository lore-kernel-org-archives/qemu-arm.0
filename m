Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5297581njc;
        Fri, 22 Nov 2024 03:00:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd9nH+ZhwEBiMADFQ49McL4PAwH7HQDkufZPD36muoUUDGH2DLLrC1t7jiaJVg6dq/Z8rm
X-Received: by 2002:a05:620a:4548:b0:7b1:5187:afb7 with SMTP id af79cd13be357-7b51447797dmr316307485a.4.1732273252520;
        Fri, 22 Nov 2024 03:00:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732273252; cv=none;
        d=google.com; s=arc-20240605;
        b=OW5QvdyBiIg62Hgr1oYaUCSrVqWb56LQO8RsAvR4BW19lPkj5F5ncXOVGqGS+4u1VL
         9gTMGlceQKJHAUf1EN8TepTkd9p/XdTYeu+qaR3E7GV9Pcw+oC6zJ3o4SMH+NA9Pv/HW
         5oVXsLl7JrRKsh5JxknDbeWS/mA+8+tr1UYEU2WXbem0uEGpMGgXZ/TFVue5OSw0LK77
         hQFsjcezRgOUNkYzKUzbpXZl3Yd3mHLyK3tTq8fEt7jVcPlj5gaSFTZP7fsFJeRbWVtO
         Fv44WfWQz9jGnHoCOSJzVUHUQf6iRVf5pUx71+JMZ7RsfXfm39PwlGGe37jlc0RQYusP
         eT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=YdtMMAEJMcUeMiC8TKs6u+jHiKbczzI3VLInTDSFovk=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=ZA1/kpHus333c1uydoU8Sd/iEot5dGG1r9u5F/9NZdCxDcAHDmiKgWNgYETqJKuzVf
         u5aBemvRQ7CN1nL5UsHdUn8lNLsYy5vqinExKZWm2q84NOA9NJGSShO6xqVxjHHE5FMS
         7ENb31B2gCS9WOgNsb660ewXAdhWnuX8u9Ulvp17Hu4d43cINAGxD8wYJRWjhrIhN8n2
         j7a9F8VBIe+KVEGfvdeVDWNyOcxUtapMVBlyzGA6KD7P0Qi4JgoIn1FXtgohxfkVoHUt
         p8YtxTVOXXzdiS3CqiXsBb2RnF+pCCTAyIn8cMDIpVp92gQUrSro/TjT5zavr4eGbSg7
         jIUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VJ4/fnMS";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b514041f90si186939485a.346.2024.11.22.03.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:00:52 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VJ4/fnMS";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732273252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YdtMMAEJMcUeMiC8TKs6u+jHiKbczzI3VLInTDSFovk=;
	b=VJ4/fnMSTHpZwJnw/JEzulqFKrW/ycivzR7f7tOoI+cSPRJllammVzIvzAUttIDchuDH1U
	i/LavcZbCiZKsWJXvsWvQvhI4GA/ICcuhvrcTR9d6vJsHzo2Mwk7UcO2BKmYnAI3XLlsZD
	gGlvEDZG9afelBEL7ZXMdMgzny2kGro=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-yoegPIIBPP6_uNogBn-uug-1; Fri, 22 Nov 2024 06:00:51 -0500
X-MC-Unique: yoegPIIBPP6_uNogBn-uug-1
X-Mimecast-MFC-AGG-ID: yoegPIIBPP6_uNogBn-uug
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38231e6b4cbso1399353f8f.3
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 03:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273250; x=1732878050;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdtMMAEJMcUeMiC8TKs6u+jHiKbczzI3VLInTDSFovk=;
        b=grIOJ3yEvZd8zS0mWQ0HIqqELeGNEtfn2RIvijQMNTGKBf1UHTiHc2ZqaiN0zqBMNZ
         yGRazHuzU3d2ZEPrnAl1L4m23O26N2gAHlVhFZH6FVJZKw9H1qzPYddpRCR3cWtrhsj9
         qSav4dN/29Gj2yJevWA5CFz5M+PAUleV1Oy6ZiQx7bE2wJvOLn1dswo46x1e2Pz1Bnud
         JqXpioVFWZ+mhiMoazeVRqmMDZqVK8xasRu8KU5W8raYIk/5T0Oujg6ghFMLenXI/k/d
         6chkWTzOuEIJ4vOVqQohdPcJs2OvSAwDtdCkTkYORvAtSjtR1TWEOxo0XtGzzmT4y1eh
         cwdA==
X-Gm-Message-State: AOJu0YwvQ4WicdUZ71vVjTL0EcMP9u2Zob4oOoXIrTJ6MLRL3x7IfiL4
	8AovzyPvhzCcIKaefQJrxDsWPLuoW8HbxEfQmiBGHRN1rdiYfuB0pRO5gNP9A8Ddzn+UBKTYFR8
	DJpH9KxLn7SHQMPcTRVKUAPY1AWPwQ3WqCKgXo2yM5xp9U/0QAb8Jmg8q86hYaDr9Xg5wWyIz/E
	V20j0E6zvmvwwt6KhxiwE0JKGDgxibXIARrq9S
X-Gm-Gg: ASbGnctZqfs2XVLDEIN+rp+2HjgIcPCvOEueycrooHe2Wm4wQ+PfBBV4/uYGQ/tra26
	0hyEAItqggdfQcDNJ0nwGsCS4vfqHDjVFctts+x411neMZoC+BGe/WoZKwYUaxQBhCJbO9Nlngs
	MK38rTrplw9y6YwTuzooT3C2H9C7xGabtqlzKhXXcUpeW6g945cFQVPNVm9f83Wb1aGOpAoowzy
	QQks41f8em581Hc7ryOHuozVh9I9nPjk554EAGoikBrKyoG4B6wzGf4gyVRjVOvpNog4QBt6a8=
X-Received: by 2002:a5d:6c6d:0:b0:382:372a:573a with SMTP id ffacd0b85a97d-38260bda283mr1974418f8f.50.1732273247201;
        Fri, 22 Nov 2024 03:00:47 -0800 (PST)
X-Received: by 2002:a5d:6c6d:0:b0:382:372a:573a with SMTP id ffacd0b85a97d-38260bda283mr1974348f8f.50.1732273246626;
        Fri, 22 Nov 2024 03:00:46 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde16c9fsm23618135e9.21.2024.11.22.03.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 03:00:46 -0800 (PST)
Message-ID: <6075bd53-c764-4307-8937-77d922a5c415@redhat.com>
Date: Fri, 22 Nov 2024 11:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/39] tests/functional: update the riscv32 tuxrun tests
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
 <20241121165806.476008-31-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-31-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W3adgiAMNsSJtfkfQZeokWEdFYz4sagsBaXmZeXms-g_1732273250
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jxPnZx+U3j48

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_riscv32_tuxrun.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
