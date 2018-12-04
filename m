Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8142665wrt;
        Tue, 4 Dec 2018 06:36:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WSIih9Hutoyhf3k2/mW2/N6LMIyRZAKaVHCzDRBuROmCShYqiWEGb7mJN1AmZrN+fadxgV
X-Received: by 2002:a0c:d4f9:: with SMTP id y54mr19741341qvh.98.1543934201907;
        Tue, 04 Dec 2018 06:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543934201; cv=none;
        d=google.com; s=arc-20160816;
        b=gWOX7KfrfO1yWk8H0RQXbKmNLQR1tNpmYc4onCcH4HIF4d4tY3tBBUlgpuFe9Po0OJ
         0NWb76axne8D0MWW1b2nBPEjtWo73R3OI/JBWzNu05I9w00+0+JzQ+YAtfuLv0qaeBjN
         qMjaCRoAWYSu2As4hM0hUm0PT1N/jLAvsMAUzX4APCKASpnVv87iVHFDdT/ulyzwYtot
         UXTugeLVN9vM2QMsyTz3IIUaBoYTr3hTjLLJb68Ue/1piAYkLRzTl7T8gkpefccYRrwH
         xBeDlBRXyRrZ5o3bG0hWVeEIMCrrTIkQywxKpnaG7zb0NBJRESV3k2PSkR6Rd9X8Arqc
         GbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=EehoqjAE6Gh3s73QL/UvdbzURzN0AvIAMAyQScag0RY=;
        b=W0nQ/14+JTSmaWl5N7xYVZPIDpjCfshS7tEQO0lSgY7Z+uB/B92X6di2+qW4ruZe+8
         50IvapBhNH/ozUAWsNDeyogebngGvVO/ANK+vJ/O3g2ufv4YLuHa5EvHpoOtPz8HY1BS
         r/PUq3eMazdNho+wdQBBLXRtyDeyVUOCqdkrxPK+TmFxVKtIIaoQA6rz4tGT8sYOq+97
         jrH5axvttYb6MVOBT4/qNvspnJDZ4rWEBqUv6B9O+pD4GdfFLcaGCCJwMi090frX1jhS
         UVswchHxWx0xmNoKFTzX7/8IyBGUQRllJUvV3/7jfKRRJGJUpd3uhFup9ZQKIhPVYx6t
         BadA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b5si3102414qtg.383.2018.12.04.06.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:36:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBoX-0004FK-7z
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:36:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gUBf1-0002Gj-W2
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:26:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gUBex-0002PJ-AW
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:26:51 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38894)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gUBex-0002Ol-3p
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:26:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id v13so16149989wrw.5
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 06:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EehoqjAE6Gh3s73QL/UvdbzURzN0AvIAMAyQScag0RY=;
	b=p/r+mFt0MhC3GZ5VNbs6SeOvIDwI6tmfVI1FZrj7VTH1Js217YV0AzGLPgBQI+hMjd
	er3198AvsnttGTfpBwLScYA6hVXjnj/aAXJn6xFXFFlmMhii6bEKLHTAb1WRhUfgarSh
	FIa67Zp3CoGfguPwSm6Na48SMTy21W7jVM9i831onIsP/ngpzMvFiDbaF4N6QwgWW1DK
	3rcPRII53f+5VNZJ2wknEIpljaUFNGobzyqgIu+c8z+6s+y3HO1ZWR8qVZb02nbHJ9DE
	ahfporXeZ7qMdXH3uuoU4kWseFZ4oG5fjtaTEa63jvCaggtZyTXyHjNhe8klpdPgpsm/
	NIIw==
X-Gm-Message-State: AA+aEWZfo9Egn0pLYpyvOpUWEmKfQIStNNZkAg1N+QuDriK4+ADDZDYI
	NDxNvEHdozecJ/Iynp3YMdjPbQ==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr19065860wru.177.1543933605945;
	Tue, 04 Dec 2018 06:26:45 -0800 (PST)
Received: from [10.0.0.124] ([185.102.219.36])
	by smtp.gmail.com with ESMTPSA id
	h62sm8294572wmf.11.2018.12.04.06.26.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 06:26:45 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181204132952.2601-1-peter.maydell@linaro.org>
	<20181204132952.2601-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2ca111ab-6374-2a53-5290-e48d535939ae@redhat.com>
Date: Tue, 4 Dec 2018 15:26:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204132952.2601-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/5] hw/arm/mps2-tz.c: Free
 mscname string in make_dma()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6oOPswQwRXCt

On 4/12/18 14:29, Peter Maydell wrote:
> The clang leak sanitizer spots a (one-off, trivial) memory
> leak in make_dma() due to a missing free.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/mps2-tz.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 6dd02ae47e8..82b1d020a58 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -322,6 +322,7 @@ static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
>      sysbus_connect_irq(s, 2, qdev_get_gpio_in_named(iotkitdev,
>                                                      "EXP_IRQ", 57 + i * 3));
>  
> +    g_free(mscname);
>      return sysbus_mmio_get_region(s, 0);
>  }
>  
> 
