Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1699420ejs;
        Thu, 11 Jan 2024 05:31:01 -0800 (PST)
X-Received: by 2002:a17:906:4691:b0:a28:9c6a:2b43 with SMTP id a17-20020a170906469100b00a289c6a2b43mr520982ejr.85.1704979861412;
        Thu, 11 Jan 2024 05:31:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704979861; cv=none;
        d=google.com; s=arc-20160816;
        b=DmfxeBKDlw4JJ/XA7MP5UVjCmaaQyewUlJpiZie6uedyY2YKFNGqBFEEP36WPwvU/T
         pWQGVL/JajD94UDSpFBL4A38LoCtbm2XJ+Nn0o2rMGqfJd7z9JkHsldnwXY2fJWybJzE
         z7qbHwMzUyw0zfX0bfSjF43hWGy4TTp2KIVHIu8V0xmqfx8A8ziN+rMi2CLE+xxlFU6k
         iS3+kdr9a5x1FpPPwqR/cc+Iq1EF8xC34G1QvBG4mstP+826LRcm8fjBjHOd86QEjK9T
         P6Yzr1fjYG/jgF+rxFpll7hOO+n9nBe1W7kWzD3HFy7hVRuAUsaoPvcWsneY4bhpPWIt
         TG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ApFCZe++K6mdEosZ5Zb18U8fI6FgBHYQCdfmSUN0e0A=;
        fh=JleVenhY0GMfmNwouuIH4nFj7DrXP4BS+eKknaf/j0c=;
        b=eo30104hDha3nt2SSIki5uNqTHScMzjQGmgILk112enaA7gxeNEVN+aH1G12PbX22c
         elDMibl3zcxUwXfrUCn+Jyk4ZNQPfDAgqpWpuM2o1l4tdbKlJz69MJbWIKgXImg3KfKI
         Z5//O+HD7wDApY8Dg7o+v5rXyEi0i/YyxiIcdhODS6ZAtDX4CczdLuNLHsbDol+uRXas
         I2o9RJAC6jGVSL+NZkW2bbHtc3UtMIWvcyEoPYe1Vcz18/0AxanvQVaDCDpqXXt3ERDI
         VhL6H5gUxorh3Uhr5wCSGFdJ+80Qd5el9WYCp8jOegx4Yzjg60SCMxQJTA7PF6w7G0fm
         7Y+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bpObYgXD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lf1-20020a170907174100b00a2a4de63341sor307020ejc.9.2024.01.11.05.31.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jan 2024 05:31:01 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bpObYgXD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704979861; x=1705584661; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApFCZe++K6mdEosZ5Zb18U8fI6FgBHYQCdfmSUN0e0A=;
        b=bpObYgXDWjgO6lLStxlWtfD+IYInhFNZc25ubXKZmMsQRmVnENqDEWEQpOxPMYqxXG
         aGMG+9tPtxi0QloWAYq93Y7CISuQzTu0frN0IxZZ4IVcHeZe08pK1wk/XjBBVz4HRp59
         HNkSFybxaSpIrfqXEdimyGYqBrq9ofI7JyLUSyNDKY2/LAeOl0tW9w3gDaAvV4owJQxl
         TGmn0dS9X/sy+riaGu1uuK3EkknpcjKVxfoDCR8SFkzQ0DlZOsEVZ9TZaVzzOBdo0Ye7
         L7A5+W9LtQ9ear3/LmcTLIYaxElNQuleh7UV+bEfY3j+oY7ccJTPiGSM2kx+4D2RRm67
         9chQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704979861; x=1705584661;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApFCZe++K6mdEosZ5Zb18U8fI6FgBHYQCdfmSUN0e0A=;
        b=aNN/JSpF/ndgBCqdWoukAi1DsD/WgI4pcxFocHafCxl3iWUzb2piWzTivrGRO5At0Z
         cBFAi8psXp8VfnG43zcYecbFKPEbU+YKMDn7wNMLxs3qyKj2Z6ohLXnBoGND2J5EUTEH
         bgiUZ3TWuRG8T02ZPhpt47Dcgm+SWKrwCzo2+2gzFIJdOHZ2B4GSbkpMDxbsWeo7Bh5S
         muZIYkqeE1gd0Ug9QCqXDkFz8Nm2x6/lzjKTGw/82MCmhHUspoYaPQVKgUq3yLq0Ifrp
         APFZk4ntVy4V0rX8G4VoK6DxCaX3OFpNQxS4fwl69yChxfZR0u85boLieDVob5dVtitO
         9lCA==
X-Gm-Message-State: AOJu0YzlxNw4SjvPijR8SVM3zWfZjXC2k7SMbJDYsEQYcBrkY4Tu6uf/
	Eym3Gecsj0PgYXJDbO1POza//jr5BxLmwMqIITPienqKGoNEQC55
X-Google-Smtp-Source: AGHT+IGYBUsAOKsLaP5iAzdHj6bGoHc74gul6QIY/5Uc9BDjtowkPwGrU9YvGcitLnOVH9KFRdeKqw==
X-Received: by 2002:a17:907:8022:b0:a2c:7293:d724 with SMTP id ft34-20020a170907802200b00a2c7293d724mr275807ejc.44.1704979860745;
        Thu, 11 Jan 2024 05:31:00 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709061c4a00b00a2b9bbd6d73sm572899ejg.214.2024.01.11.05.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 05:31:00 -0800 (PST)
Message-ID: <f8cd806a-4e87-4e19-b898-acd675f9daa6@linaro.org>
Date: Thu, 11 Jan 2024 14:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/43] tests/avocado: use snapshot=on in kvm_xen_guest
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103173349.398526-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yIAunHNvrwtV

On 3/1/24 18:33, Alex Bennée wrote:
> This ensures the rootfs is never permanently changed as we don't need
> persistence between tests anyway.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/kvm_xen_guest.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
