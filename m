Received: by 10.28.71.27 with SMTP id u27csp2376971wma;
        Thu, 8 Feb 2018 10:10:42 -0800 (PST)
X-Google-Smtp-Source: AH8x227HkGxHP/TPj4yMjUsnxe+80I3L9gJ9i9eFJyIuB4O6nyzxX8YGqIO5vzcZATK5AFg7zHz/
X-Received: by 10.37.165.100 with SMTP id h91mr61060ybi.506.1518113442076;
        Thu, 08 Feb 2018 10:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518113442; cv=none;
        d=google.com; s=arc-20160816;
        b=0TK/G1cxN9Zz0bZfgNUebQLHfFjq4ELSCi/WH8d2NC6Ek6dvWYDSqzwpMCtycXuaoE
         FnNQLDUYY31zM8yerP39PKsLbvxE/Nk7FGrxFCsC/j2ocLjfiPwmyLfLWALJqk6X+1YY
         2/09bFxg7rjfBSpzqUv4jAf/jG66UVdyWJO7Ah1RWvHmmT6cgUphWAp/hv7iruU+ULZN
         aS5zD6ENk36mLcviIg+KmlW59mhdEcVMYpj+xsiMtA52KDKatDlrCJ187v3lp2jSivhN
         qppbhCTcvQu8j8SeReiSJruwrXSXtPwA2k0TJiT5NhTmU2ckUJ/OmwhdHQs0Uvhhemoe
         xHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=M/aSiEI/gMYc4OKoubHNeE5cteAw7S22mOaC74PP+JY=;
        b=QSwsxnPU9Vd9suxEvdOKCvbXuMzeoSyyXuEnJdwcCrwY0DsGOL2WBEfnI8UmxG/MTo
         N4OKGO3z8mVHE1DAkHiN4nYUBV0O1tg46UI/3VpuoMRa7uMRAAUWe6AJe1xbUCB+8wg2
         pqs0Ppq2JwLVWc3dgqETgGi2K72J0aXstoc1Is0UgkHh2sGCHy3zLY+gbOiNCKo8lFL7
         YMqEvgV1XplTH2hRSALpbN0Zh4iVAswgI9U/wExjZ5EB4T5KRHcwMddGjhzSKlQ7JJPz
         90bZjSkSqUbv5f7kDWiSk3DTK1wfT11IVBukhCuAYjpPMD2dw5setq/HVb+cAMUdQO1/
         AZQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GfWPA/P0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s125si86993yba.299.2018.02.08.10.10.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 10:10:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GfWPA/P0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejqef-0004T9-A3
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 13:10:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejqBJ-0002gz-5D
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:40:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejqBF-0000IA-UX
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 12:40:21 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33700)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejqBF-0000Hs-PT; Thu, 08 Feb 2018 12:40:17 -0500
Received: by mail-qt0-x242.google.com with SMTP id d8so7223524qtm.0;
	Thu, 08 Feb 2018 09:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=M/aSiEI/gMYc4OKoubHNeE5cteAw7S22mOaC74PP+JY=;
	b=GfWPA/P0Qtr2R1BzmAgSSRQGt7YmfXnAo+J++6hp1g8prlAkUiMvoZ0LNQeiDfAiJN
	0mpe4WpVuHzKWjftRe8RthAicXB0D4uixmHY4xZ8y0X2/6l1390uJVF8o4EOOqBFJOxw
	9/dlq8+yBuxEfL9cYxk9f2cSG5vFgnE6Bo+WodDV5OhgTFZOVxyEsWuc8XJGf1wWpK6t
	ZC85IRE5MJcz4VcqCldkAkKOgFCAoU8c0TyqFTmCtNjgXuMM5zw+5+/+QQCXIIPJCZHL
	9aZsnagJ8nhddr3S9c+7HqNOiZD7TF9I4yY5hb0DTOIg69l/ARcL4Ukwtfo5ntVO+KxR
	tmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=M/aSiEI/gMYc4OKoubHNeE5cteAw7S22mOaC74PP+JY=;
	b=rKjxo/TOWUyA6T9qtxhW7JEnOYxJScrGpdBlcrrR845yk/n5bCvfl9V8zTt7fLb1HA
	MTY+AukupgGPjhBO7Yt+c+8oiE4loBvegvmOyRXqaGaBrRFpJiw97HHrHPzmfYWhCdF+
	g0ZXsmkEtwd8yMI88nNvxYvVBGBA/qB15KTAMWHLiyFfPKL/EOTmtr4yVs2QQgiSdxi2
	X7dcIo23Lu+rEYPDCfEmq96BSQRLWb+K3oMqpPGwbJ5pduikyVMNTV4I8OKPY0Xt0XEt
	Jrk7A02rjDo+ROipKitborF25DKpMV34xv1qGMDySIS6DflUtiA8RkA7aAmNKDaXMFe6
	SrOA==
X-Gm-Message-State: APf1xPAtHqBt0PFtjj0A5ROfr1R+5GNPF+3J77+2J5oHbqwl6oEupuBB
	x22nUE7mo9yLeVILQ1Fmgkt085y8
X-Received: by 10.200.37.83 with SMTP id 19mr2362176qtn.270.1518111617007;
	Thu, 08 Feb 2018 09:40:17 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id o35sm367304qtj.24.2018.02.08.09.40.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 09:40:16 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180208172202.9984-1-f4bug@amsat.org>
	<20180208172202.9984-2-f4bug@amsat.org>
	<CAFEAcA_0rt7cCJs43BjW3OcQh=oeby+4j2dtFPSzgCn9tqW1qQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5562bd02-5399-b1af-f183-d9a16b0a1c62@amsat.org>
Date: Thu, 8 Feb 2018 14:40:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_0rt7cCJs43BjW3OcQh=oeby+4j2dtFPSzgCn9tqW1qQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/aspeed: directly map the serial
 device to the system address space
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M/wZgORgSUH1

On 02/08/2018 02:30 PM, Peter Maydell wrote:
> On 8 February 2018 at 17:22, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/arm/aspeed_soc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index c83b7e207b..a786750e14 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -257,7 +257,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>>      /* UART - attach an 8250 to the IO space as our UART5 */
>>      if (serial_hds[0]) {
>>          qemu_irq uart5 = qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4]);
>> -        serial_mm_init(&s->iomem, ASPEED_SOC_UART_5_BASE, 2,
>> +        serial_mm_init(get_system_memory(), ASPEED_SOC_UART_5_BASE, 2,
>>                         uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDIAN);
>>      }
> 
> Is this a bug fix? It certainly changes behaviour, which
> suggests that a fuller commit message would be useful.

This patch is buggy indeed, using system_memory the serial address
should be ASPEED_SOC_IOMEM_BASE + ASPEED_SOC_UART_5_BASE.

Thanks!

Phil.
