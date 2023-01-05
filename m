Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp456215ejb;
        Thu, 5 Jan 2023 09:02:04 -0800 (PST)
X-Received: by 2002:a5d:6091:0:b0:2b8:bcd8:181b with SMTP id w17-20020a5d6091000000b002b8bcd8181bmr192225wrt.34.1672938124491;
        Thu, 05 Jan 2023 09:02:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672938124; cv=none;
        d=google.com; s=arc-20160816;
        b=wwERwwU42gyNgwO/tvHpjsyX8Zid7ceKsXA6u6BfE45HMIG+wgZYXgu3fIhndcK/BN
         jLxz2YN5XR8vPTEjQL8jBjE4FlMCqBWKoOrDyv5oi+0KLQaFpSG6KzFUQ7cr/YUngExb
         /HUKbBypoK7qDRHoR3B0q/szO9UYduKW4USBZpTFiSPzAl4vY16JlP/aTdlaQqgy9hdi
         wDvQfgehKT/gKwuDuYeoEiQoKLW2veDYvXSfA65WK4bmBW7luyPqT9fgUdAqDNIy6C94
         E8QxzGKmpB0ccuenaDTtPOS5wqQuU46q/JsqdydOFgO9VUZ0zMGXmihwcTTuCgQw24Kl
         gfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0GYhmgdRruksUinNg+3lSzOFg5akOTHADIBNQCPungA=;
        b=bzasMxS9LYfF7yr264/SbhR06r/2Nj1GltxAz6TAXoMaNNzhZ7QaYfeG4uSw8xzXD6
         G6f/m1F5Wz0KyrT2Fu9HPLtM3SA6J3uARK+wHULIDAv6YIC489J5HLy3X3YYQM53x1Bs
         8V8aSb2q7TyxvmqruPDj8zNuzAAoKjqrlVtsYwKz/GPBrkoTLJfrF6Wla2vDcMgq1PAt
         /su8Z7Y/Og9JH8sZJAoS3+IfUEh7iLw8BEp8OpPBjK0SXqYeJZ6K/gD1EaDVCyj2DaTt
         9plHx0zcEsJ/Z1gyO6Vx9pzFaakEcVTzswsVi4bv0xs9R69GatMAk8zwemWcdGCC9cLT
         gjlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Jd0/GvHZ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u19-20020adfc653000000b0027612a7ab2esor12960563wrg.80.2023.01.05.09.02.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jan 2023 09:02:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Jd0/GvHZ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GYhmgdRruksUinNg+3lSzOFg5akOTHADIBNQCPungA=;
        b=Jd0/GvHZQptN5WltMd9h0lxTOUiCssddUQ4fDrdFH+b3EXCpVsPso3elUPWIxyTor9
         W6UN1GLRRCVfU6IXTvxktVItawfnOrArY9J8Ml07H8g5WKCIOgpJUs19vDtmO5ZBs0MW
         KrX5zMOiJyhp8u+fRYjWurjUDFLgg630zGOVg7HS1rnQGi10valfWdCIqjDK0+z4n+x8
         qo3a23a8OFwSoEVK2ibYfEaXnExGRvH0fl0mU0IdbC+JkHBfkan1iZyAHUFwexbW1Axa
         fy5J8pEjbVExCmIEndfFUqdN9wfDI+QSY8kywzOtPqXQqv4HmGLpE/hld2qtyWJbS7xh
         tywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GYhmgdRruksUinNg+3lSzOFg5akOTHADIBNQCPungA=;
        b=qi79on0klIXXa61UEOIrhNg6RXKU8NoQF3qd90bhUryT7b2nZdPtsrJ2dKhiqmQdpL
         /BlbnhO6h/XUj9ZIpopw3pBS3GyMO9Mdo7+p2jkyjctskrMMjVlATdeIFhnBlVjGYgcr
         qPv297JtaliJs7cTR8qb6lGBWVBtWi8gXK23NBCWxiPxf+0ODRuQUfXqmbZy6XRjNaPj
         V/WzBYqVmCQSC/fpg4wATl5gVyGvJIr+w1HWMdYwbhX/nz2DeM7JJiAxz4qwn9oOTEEr
         tDZi49oJo9uAue+mNQESqRwMhb0jWSG20PdTc96M85++hbIMUk1EonCHMGoW63yxij6L
         /R4g==
X-Gm-Message-State: AFqh2kp7Z0ISw1qh6UEXanagmBsrv/DlrIGPLK3z8Pt6JISyMnaOlnLA
	s5uvaN/yBPnRX5Zga+4rdjVie6xYW11uncBJF94=
X-Google-Smtp-Source: AMrXdXvt25x4deo5wqJl8w3m7diY3MrHsOmt56qfKXfvGUcICWj3Ifn7KCpAyzMrDmqWJi9IyJ36sQ==
X-Received: by 2002:a5d:6a43:0:b0:242:13bf:29de with SMTP id t3-20020a5d6a43000000b0024213bf29demr31623073wrw.52.1672938123918;
        Thu, 05 Jan 2023 09:02:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id e27-20020adf9bdb000000b00272c0767b4asm37074669wrc.109.2023.01.05.09.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:02:03 -0800 (PST)
Message-ID: <4db2557b-4c5b-6ef0-e40f-10bf1f8b02ce@linaro.org>
Date: Thu, 5 Jan 2023 18:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/21] gdbstub/internals.h: clean up include guard
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bin Meng <bin.meng@windriver.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JjMgLR5aTAHS

On 5/1/23 17:43, Alex Bennée wrote:
> Use something more specific to avoid name clashes.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
