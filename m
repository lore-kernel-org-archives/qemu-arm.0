Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8137232wrt;
        Tue, 4 Dec 2018 06:32:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XyukWImYyxTh0AuUDvKKGHrpTyJlVaojPwofcnsmw2wtIZ4/HGeBHc0NTVq8yK/4/GmGb1
X-Received: by 2002:a37:9e8e:: with SMTP id h136mr19690453qke.324.1543933929890;
        Tue, 04 Dec 2018 06:32:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543933929; cv=none;
        d=google.com; s=arc-20160816;
        b=bHQWxNqdMmQ+9HTj22sZ3xQGkZNG7uO7doI+JQ7XA+QiS3k+v2ADK0LXkH5vKd8rbB
         GMxJgjSd55TjNfmf2TSuEBnmmZwlZl2lD6vl8ZwBG+DK+Y9AQsZhzsG+tMlQaWfEcoSa
         vp79gQpGEZ6Z+CVIQWJq6CneI6gf7fmyTwqVbjyilXidVJDfJLkDy8CQbb9Ewco3TK7A
         QblRXHUV4uCOmnhkcSven6w13/s0/Bdu+qAQwaPzYRcK8AeQywbd6in1i5Xx1/onN+G5
         wUxDCsi8Ok9wt9+P6iHu47UDSWtNADB5tbrf8D2N6ArbZlKud19gWfz03HwPf44pB+dI
         MzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=x3/8g98WZk1x9YxsbXjzZct/g8RjqQeMFu0LyQrHNzE=;
        b=Q64F82ak13R6NUI3zB7wausjgs1Se2Elm7QsxWyLdKcZCecS+dosNm6E+G96dyActh
         wGBR4MLg8xi/pTyVZZPkO6UpauWwksoXmai0uHuCxLTnHXYbbTDWqM6J/hJ4l5mJn0Wz
         eM9K5GjvU5S5ZFAqsOlT/T2ZaPgnxf0rKlmaj5EqV8RSnI6Sk47AZle5oaD4oLBXchyM
         iwYidfr80bd8aGj4mjdG1l+ibK1i22coZCKYhrju1M/vSLq3z9v/e+066io/Njq944pF
         bsZNaYNqG+UqfhI5cZVbV88YXhYWPZzVEhbOircNqjt9VXa31Ss/E0HLQYJuSxqXok7E
         YGIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j16si2645189qvp.114.2018.12.04.06.32.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:32:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBk9-0007HJ-1E
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:32:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gUBiY-0006vF-L7
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 09:30:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gUBiS-0002DQ-CF
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 09:30:30 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gUBiS-0001zH-65
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 09:30:24 -0500
Received: by mail-wm1-f66.google.com with SMTP id r24so9552386wmh.0
	for <qemu-devel@nongnu.org>; Tue, 04 Dec 2018 06:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=x3/8g98WZk1x9YxsbXjzZct/g8RjqQeMFu0LyQrHNzE=;
	b=jUTLauYB7q1biJJ1UCF4RyDdlGK4Xcw8TGd2mBinEgaG2eSBW0BS45L/wZDV+W4SMR
	vgKdiOES1bhvlCtUiIPBttig8ueHgGGD08GnRuW98U3H8tNlFlvTBUOsE5thc6OdF4CJ
	uxzZMGuDiFxAK6VCrXrrslWNnEW2F2NhrZ1V4t86MM7OM2JeV1L8ioZamBHIHpg8vEbu
	ghXE7Iqjlx5aQWJKkJDvwXM/muZYuLfCgAyCbyPK1z1NrYpfVHEodkv3nZYbtsE8Ht3l
	xKK9VrTbeKY5iNPDDokJKpEIgNMySnCUktvWkpomYwHnbI7kmMk8E358hwG2+ytxqCOu
	skGA==
X-Gm-Message-State: AA+aEWbJVjFo8WZrPptr/LWV1HVZ1l45sEDbCD7mTafbVRtxrx0afzvT
	EYJ/lKuRry7kCL8Y2maT52CnMg==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr12416861wmk.149.1543933821525;
	Tue, 04 Dec 2018 06:30:21 -0800 (PST)
Received: from [10.0.0.124] ([185.102.219.36])
	by smtp.gmail.com with ESMTPSA id
	s202sm10649040wme.40.2018.12.04.06.30.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 06:30:20 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181204132952.2601-1-peter.maydell@linaro.org>
	<20181204132952.2601-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <99578b97-5903-52cb-ebc8-939a966665df@redhat.com>
Date: Tue, 4 Dec 2018 15:29:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204132952.2601-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH 3/5] hw/sd/sdhci: Don't leak memory region
 in sdhci_sysbus_realize()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jVHVSVTxqadt

On 4/12/18 14:29, Peter Maydell wrote:
> In sdhci_sysbus_realize() we override the initialization of
> s->iomem that sdhci_common_realize() performs. However we
> don't destroy the old memory region before reinitializing
> it, which means that the memory allocated for mr->name in
> memory_region_do_init() is leaked.

Oops

> 
> Since sdhci_initfn() already initializes s->io_ops to
> &sdhci_mmio_ops, always use that in sdhci_common_realize()
> and remove the now-unnecessary reinitialization of the
> MMIO region from sdhci_sysbus_realize().

Thanks for the cleanup!

> 
> Spotted by clang's leak sanitizer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/sd/sdhci.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 81bbf032794..83f1574ffdc 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1371,7 +1371,7 @@ static void sdhci_common_realize(SDHCIState *s, Error **errp)
>      s->buf_maxsz = sdhci_get_fifolen(s);
>      s->fifo_buffer = g_malloc0(s->buf_maxsz);
>  
> -    memory_region_init_io(&s->iomem, OBJECT(s), &sdhci_mmio_ops, s, "sdhci",
> +    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
>                            SDHC_REGISTERS_MAP_SIZE);
>  }
>  
> @@ -1565,9 +1565,6 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
>  
>      sysbus_init_irq(sbd, &s->irq);
>  
> -    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
> -            SDHC_REGISTERS_MAP_SIZE);
> -
>      sysbus_init_mmio(sbd, &s->iomem);
>  }
>  
> 
