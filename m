Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5307583njc;
        Fri, 22 Nov 2024 03:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyA0+t/2NGgcqJ8NMH8jD8XbMgQO9IGGNoauRtJuVkfrwdpdGnaQhHg8O4CxcdBmP0Lfed
X-Received: by 2002:a05:620a:4548:b0:7b1:ae79:be2b with SMTP id af79cd13be357-7b5144e475bmr351895785a.6.1732274230916;
        Fri, 22 Nov 2024 03:17:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732274230; cv=none;
        d=google.com; s=arc-20240605;
        b=kM6NdSJiCdCoY2efL6m8jX2zaxuz5C2kiQU4jVMdmlYZvhVUHocpzRc09xmoiO6vpD
         QlLH2FtB0jtTW8vw53JIzaZGBhDp6JZwlyxG/snItIlvg2C6wGYN6qB4XdazqBD49fM8
         R/1fsGMtsurCzW4K+8iyfKfQ4kHzbsfpPU194AuGuSm9v/LbDnbLorHbwUxD8zFaFP1p
         3LFytuqcQIakA1XoQUiL9bibGrbORlKoPcOVLwV3yXtRIXuV+7KZM9bvwdcmCPcqvC1I
         U5sFdIv1XTZbNtfVt0gio8V46Pq156iNulih2OLcmjHXUp2tn/yaLj/o/Yv3rmKEz/BC
         Lu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=QfXK/eRTNutRVyPxhTR54zIMRLNHR/gdc49ekKuHocs=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=P0QnYOAdshVpaoEpiuX796gqqV/8/Z8ip+dTR6xCuCzX3FA0BYuOE7HCHWb7diGhDA
         EupdNFnWMdJPAW8YiZFLxV3Vsl+r97Cwo5lRZoiNm7YrSeSQBTuWyWg0iDfHMLSBolXl
         WkYhLZy9R3t5CMJO9v/Hdkq3IchqXNhz2FeTmltUxRfGkAQga1dYpJjv8LkihzJqw3+5
         ZFiv/Kk7rZoygowk8HehYCXt1O6eyqNjg2GeANF56I9NSunJx/4+gpyo2TfKgxO4U6s7
         JHJN9E1Zd4P9+B7ACm9/U8d98INbwgTshc+WYZYw3TooCteRURHFEsAljufnc0IcdvkC
         t0dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GDxEa2vL;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b51415645csi209530685a.404.2024.11.22.03.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:17:10 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GDxEa2vL;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732274230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QfXK/eRTNutRVyPxhTR54zIMRLNHR/gdc49ekKuHocs=;
	b=GDxEa2vLys4sBN56n2IgwCnknkq/1/QSNHOu2JDxjdB47IrjPdJu0/F5OjmjRZPcNB0pHb
	dHngBI2u/BkvxhkMb/struqSQQB0SsxCk8uTgpBH8Cp6jCsGhcu532GHeK+LXVVOXV/zzD
	xDZL33uHKByY+5urqihvlVEVgBidKQA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-fSt_AhidNtOHYMMcSgnDUg-1; Fri, 22 Nov 2024 06:17:09 -0500
X-MC-Unique: fSt_AhidNtOHYMMcSgnDUg-1
X-Mimecast-MFC-AGG-ID: fSt_AhidNtOHYMMcSgnDUg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3823d2f712fso1009566f8f.2
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 03:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732274228; x=1732879028;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfXK/eRTNutRVyPxhTR54zIMRLNHR/gdc49ekKuHocs=;
        b=s1TTwaHNrpr/NXbyznORJvp351wrZjdnqqNjq/Lzy1ACYTIn6lyG194PpgIyXoSOiZ
         QZSPRIDjw+qjxBPRBfDToIK0gxCQ28tPc3xzetars0qJhjLyY4e7b23pMr7rb0e0zmzM
         4zEfNrxrdW/sgrcvc/fMBUETGs34DsIy+NRSAUbWlFVWSEzNiio9bZTo9pOVO9xsS1KS
         ZIvcHJOzE2lIp9mvwTIugy/bYeL21hRyiDuiU9KB3+/zKLNzJXlTVpfRb2dM4sfvKtKV
         21Rv/jfQbPAudhaV7ejdtwehhnxYScJ8kUubm5r9VXYMB18aIZsO8INwctjfUl3T0vxU
         788A==
X-Gm-Message-State: AOJu0Yxo1sExyrUDG1MEwE5HHiBR7gKVGnZAYNpVA2h3NjmBCVMWUnQy
	8VJy2iu2icw2zz8ZJAgcbLOQNAazgFewyrbjc4nUQl5fcGCh26kSxiEyFORECNaA/I05msHArxt
	R16ZxsNax0PD3CwUAE8R2KsdPrjFgURCqRLZa0nO93NxFq1DDvLN3eYAdt1YMwTzvsX/6S+jvYH
	fxoflShM2otP/LqkIKZXqPYZ/41OVu/e1gacgD
X-Gm-Gg: ASbGncuobdf8T1y3AcUf+4M1CFdvY3yZMzuOR2IlsCZttR/48ow8uvmDE5719v5u0mT
	COiEMaXd6nltlqeFMPAw/qLOkcOGru/rdlJmohgXhD8Kr9M528zGjw8+1PqJM6NOWWEL/ua3HE8
	ASLWSO2HBExFA70OeGGeeXv0CyrgM3N+5FUqv3bPVHvmxKhIZHqXEVdjqjtuvzVDx7AiRVtrDsY
	Q2FmiOHCsIElWCSsS812hjKC90xuaLrK10XAgqnki3+CWy4O9FX1h8c+Stp7rETi/uCBklkr4Y=
X-Received: by 2002:a05:6000:1a8e:b0:382:46ea:1125 with SMTP id ffacd0b85a97d-38260b86386mr2149767f8f.33.1732274228347;
        Fri, 22 Nov 2024 03:17:08 -0800 (PST)
X-Received: by 2002:a05:6000:1a8e:b0:382:46ea:1125 with SMTP id ffacd0b85a97d-38260b86386mr2149697f8f.33.1732274227788;
        Fri, 22 Nov 2024 03:17:07 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedad6sm2093564f8f.91.2024.11.22.03.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 03:17:07 -0800 (PST)
Message-ID: <a85a1fa2-9ab4-4a76-88f6-f64a2ccb74fd@redhat.com>
Date: Fri, 22 Nov 2024 12:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/39] tests/functional: update the i386 tuxrun tests
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
 <20241121165806.476008-23-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-23-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: POVX_fkSCPeT15jgMVMkJ12-tOHiif74bNndI31Eet4_1732274228
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: go+/0+bOG7FG

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_i386_tuxrun.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
