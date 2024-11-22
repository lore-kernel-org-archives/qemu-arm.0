Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5278045njc;
        Fri, 22 Nov 2024 02:14:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOqE9zpNa9oqmXSJQl+KmgU6qg0ykTzMgGaMLBKkhKWumu7ZlBvYRsGrnQZtF5mgn8voG8
X-Received: by 2002:ac8:7fcf:0:b0:45d:6320:3c4a with SMTP id d75a77b69052e-4653d6262f0mr25682431cf.42.1732270494571;
        Fri, 22 Nov 2024 02:14:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732270494; cv=none;
        d=google.com; s=arc-20240605;
        b=TC7ZwTXy473DqMVUTr0ek3NTDnLIrtbus/hq4hQoYFM9ntlo9pYl9zYaezXBoVGUhy
         8XnAH9fgdjemcbYGzAx7ahTOOc8J4f40OEZfnw/i0w4EJ6gHdVtF2U8x40H6u1ibfoR+
         L2JBE1mjoyhsLsztKadMXWGCnZOeP+sUhOf1bHM4q8RRj/El2OWEF60S4WJOMd7qZWyI
         jP2P4RT+sVKJcBbBr6PFG1khFxyt868O3uOkTnAgRdlj5dZZR5utDOtGy8K6XO1apus2
         Y7ULzB+Ot6OJLtTWpyYj6o4dRuSy6xgieIc3+EHllfRnAu2Yw03Knj6e/XH8X017/odm
         eB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=qO+AymXgSKktZpoggjauQqDlD8qJx/iHp0VYp2yFcDs=;
        fh=wVPQWqTxHsMhgDFUYzS4WRCfPsDqkM1sZVnXLJCyo1A=;
        b=b7ylrchCUr9+47YFMjTpDR3qGlK4bLmRgqX0qX4WX+tcKBFyGHCu5wRJ6wDtc3Eyrv
         IEPMIAQEuBTKPaqmn67Oee8qPpALmOFJfIjliJspaGGQz0/YEvUR8XzgKtOzV2XeYP+C
         HSwCnlvy4BIofEsBy5e3yDsJeJuvo7w2V3hUz8muxUDNXWKXqcPGLtydNUPND/YvbHBe
         f/MzutqRHJjC0CrYZt8lgrMXtKxk+bv2wf706ABuVypp3bPThx1rVUWdbOilG1G4R1Xt
         5E6uMp8sudIubd77LPddtsu3TIuwmrDkx+7XIcSq7+S77hEeAHMekyL4cLB9KPLRS2tj
         wYXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VsZWHlsa;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c3d611dsi17772481cf.50.2024.11.22.02.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:14:54 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VsZWHlsa;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732270494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qO+AymXgSKktZpoggjauQqDlD8qJx/iHp0VYp2yFcDs=;
	b=VsZWHlsazUYyYKUvDb3jM6ZqV2iL61A6bUONm/7LKAUcFfWbT2KZw30kDprUEqCYdf8O5b
	4XUSPDYI4RQD2MeNv59ZbUajJZL5iWPUGj4UHpi5tM1M+qn+bN3hBulRJr+VyY//W+98OO
	Cztp8lhsqjiOaU/gi0omLuMu3Bdt5gc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-rtWUsyGNMGmOEnFTJxwwUw-1; Fri, 22 Nov 2024 05:14:53 -0500
X-MC-Unique: rtWUsyGNMGmOEnFTJxwwUw-1
X-Mimecast-MFC-AGG-ID: rtWUsyGNMGmOEnFTJxwwUw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4315cefda02so13412935e9.0
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270492; x=1732875292;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qO+AymXgSKktZpoggjauQqDlD8qJx/iHp0VYp2yFcDs=;
        b=wHGCnfK8ErpQ3vg5K2WwKAJYXN2t7ttf1QeHuLUUBpmeIy76lKn9ob9JJ/SmL+ju2T
         fW5wCmcN/hbefH9LHtjLbNoZ2yOE9NGd1Z2COEZ7/jOPyX9bJt8StxrmDztqInwqtdlT
         ANtPbldnnDUQh0sr94gPwuxtFvL2BYl3EOqmJi2Yf/PvoxvDXjzmL6gjUMs9uk1nC8P0
         Zcj5esGamSOot7N0ttdHGHwXR9cZGMwi+nkdXT7TGV+SeyN9pWvQED+EOGMFcNICyE+u
         p0uyldAZKt+KGwCY2j52x29NggCDQU87+BJSeWAUXcWkrJuO2sbW755kp7PPX7MWNKu4
         3LOw==
X-Gm-Message-State: AOJu0YxvQpik0qsyy22PGYiF3cotryPT6JGSZTla+PAmsVvhnNcZRnF1
	uu+X5CHReu8ykyVv/sqDORrhpRFk6lcw95i/Hih2d7mNCxKQzWkUmMID8cU1pzkdP/pPmImhOLD
	xLrQ/YO7otbl0tu5ky8gU6yBClDx2Kmr7vlKegjUrZW+JZOOETPR6nR8GIP4hHJO8fqdo1GOm1k
	otxtrMJEAk1lNl+Nv/mpDLAN4+C/LYE7zj+w==
X-Gm-Gg: ASbGncu+XQo4yL9QQVheh2cAtUd8gLYNY/o6wyy1/ZpGfVztZ9kBB1iy8R6N0UZnOOg
	E2XgXTnROjvWAil6yRzIb1X8fLB23OREmvLMrzgrv391BwymnmW6iDyqSvFYmIsEN7fb/R/sNrK
	3QbUQOTmEH5Y7wE2L6weSC25K4t6p1v6CYVAvMQBHXnhGFlmPTUUfeA3g/igha9jBKrwml4mB8I
	iKv7BJdrqiaGWfvlLmw5E9zq5diOxOrvi/yiogdWmAYk4X8BaMfxsEp7urRBR5NH5WRt4Q8ohU=
X-Received: by 2002:a05:600c:1d99:b0:432:c774:2e24 with SMTP id 5b1f17b1804b1-433ce420e50mr19162015e9.9.1732270491913;
        Fri, 22 Nov 2024 02:14:51 -0800 (PST)
X-Received: by 2002:a05:600c:1d99:b0:432:c774:2e24 with SMTP id 5b1f17b1804b1-433ce420e50mr19161505e9.9.1732270491557;
        Fri, 22 Nov 2024 02:14:51 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b4643100sm88946135e9.39.2024.11.22.02.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:14:51 -0800 (PST)
Message-ID: <9576a13f-0408-42dc-8e1e-6781cff359e6@redhat.com>
Date: Fri, 22 Nov 2024 11:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VmHiccV_4xZzJ8lW0z8LnLXD1kTGpcc3O8V2uBSXCL4_1732270492
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bh9j4esY9Mj0

On 21/11/2024 17.57, Alex Bennée wrote:
> This is a mostly testing focused set of patches but a few bug fixes as
> well. I plan to send the PR in on Monday. I can drop any patches that
> are objected to but I think its pretty safe.
> 
> Contains:
> 
>    - Daniel's clean-up of functional tests
>    - Another avocado->function conversion from Thomas
>    - Update the tuxrun baseline images
>    - Minor fix to the rust pl011 device
>    - Documentation clarification on identity
> 
> The following could do with some review:
> 
>    tests/functional: update the x86_64 tuxrun tests
>    tests/functional: update the sparc64 tuxrun tests
>    tests/functional: update the s390x tuxrun tests
>    tests/functional: update the riscv64 tuxrun tests
>    tests/functional: update the riscv32 tuxrun tests
>    tests/functional: update the ppc64 tuxrun tests
>    tests/functional: update the ppc32 tuxrun tests
>    tests/functional: update the mips64el tuxrun tests
>    tests/functional: update the mips64 tuxrun tests
>    tests/functional: update the mips32el tuxrun tests
>    tests/functional: update the mips32 tuxrun tests
>    tests/functional: add a m68k tuxrun tests
>    tests/functional: update the i386 tuxrun tests
>    tests/functional: update the aarch64 tuxrun tests
>    tests/functional: update the arm tuxrun tests

If you've got some spare time: Maybe also update the sh4 tuxrun test to see 
whether we could drop the FLAKY marker there now?

  Thomas
