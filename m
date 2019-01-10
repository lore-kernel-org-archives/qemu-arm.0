Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1621474wrt;
        Thu, 10 Jan 2019 01:49:05 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6F/45pFw900FTY1TwJdLVqtj9Ts89v/vqy1ckAilZLKQgCABPhZmB3TiyabDMsUgGpESNl
X-Received: by 2002:a1c:c90b:: with SMTP id f11mr9084719wmb.33.1547113745037;
        Thu, 10 Jan 2019 01:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547113745; cv=none;
        d=google.com; s=arc-20160816;
        b=rsCmqUijLcJ7kMf27lRWbBn3teWsqYSQIaOsiFHRIVm8AfDpn4lG7V2iHk3JuHB2jM
         4W/ICumJQrQSkWpJWUFKTpvCYSvpRaOWmXymEbZoG3CftEzc0lidtLHzXouTYDcyhE3+
         oQQKh0zyQ4giQp6s/OQ8P3dp0OZzU8fbFDc574BLVIqs1+fnCCWYZdleDgh5LZeWvIej
         3ktSeobKD6ADO5RAFYUwno7UjbzZqAdznzJUJaABDXTQX3dimUEH6u5FUpU3wwR022S9
         eOKFLBq8OsO0usFjK/0NOusEkGOISXtVMpzYa4EWnU868OXWbUQVMHdDoDVWinA8599T
         7fFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=oaAZjOjmv9s02FqstR41nCugTSqIn2dH4DhcuUaRFVE=;
        b=G8qCVApEn6sTJZDeM83txV/116F8wE0K3q2xQj4E0IsR4ATijvYphxQFGDjM3jbqqb
         edvD01fhcAqd/hEOI381CN1ANP4UjF/3sRTAxUwiTfj4bvZn/xuEDHlSPNuTGbY61Tsm
         xfVfB/g6Uzo1fipcuxisDtGwFDKOqpghwMKar3T4MMilBnOnKxh/KV09u5zj8YlKkcWj
         i60yoSKwObrijjjlxrKoc30rrc1eLiCECYdcq3/ibPaYpCJ4jSP+nn/NBf/XrsX8FMQo
         Vsx3OvM/J6RMrGesGPiumicVW40chdceRZJkXFoUD1akKcQ1XJrHpcfTMnCkIvPJrJmZ
         OfkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g192si10725200wmg.71.2019.01.10.01.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 01:49:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghWxU-0004pG-4F
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 04:49:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ghWxD-0004p6-S0
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 04:48:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ghWxD-0006BS-0C
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 04:48:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ghWxC-0006AU-OB; Thu, 10 Jan 2019 04:48:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7805F5A1F7;
	Thu, 10 Jan 2019 09:48:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-101.ams2.redhat.com [10.36.116.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A3B75D6AA;
	Thu, 10 Jan 2019 09:48:36 +0000 (UTC)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20190110094020.18354-1-stefanha@redhat.com>
	<20190110094020.18354-3-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <cd32de08-afd0-4b8b-a10a-99e1d88d1755@redhat.com>
Date: Thu, 10 Jan 2019 10:48:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190110094020.18354-3-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 10 Jan 2019 09:48:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 2/2] tests/microbit-test: add TWI stub
 device test
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	contrib@steffen-goertz.de, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3GyNtNOArpnV

On 2019-01-10 10:40, Stefan Hajnoczi wrote:
> This test verifies that we read back the expected I2C WHO_AM_I register
> values for the accelerometer/magnetometer.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/microbit-test.c | 44 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/tests/microbit-test.c b/tests/microbit-test.c
> index 0c125535f6..dcdc0cd41a 100644
> --- a/tests/microbit-test.c
> +++ b/tests/microbit-test.c
> @@ -21,6 +21,49 @@
>  #include "hw/arm/nrf51.h"
>  #include "hw/gpio/nrf51_gpio.h"
>  #include "hw/timer/nrf51_timer.h"
> +#include "hw/i2c/microbit_i2c.h"
> +
> +/* Read a byte from I2C device at @addr from register @reg */
> +static uint32_t i2c_read_byte(uint32_t addr, uint32_t reg)
> +{
> +    uint32_t val;
> +
> +    writel(NRF51_TWI_BASE + NRF51_TWI_REG_ADDRESS, addr);
> +    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STARTTX, 1);
> +    writel(NRF51_TWI_BASE + NRF51_TWI_REG_TXD, reg);
> +    val = readl(NRF51_TWI_BASE + NRF51_TWI_EVENT_TXDSENT);
> +    g_assert_cmpuint(val, ==, 1);
> +    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STOP, 1);
> +
> +    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STARTRX, 1);
> +    val = readl(NRF51_TWI_BASE + NRF51_TWI_EVENT_RXDREADY);
> +    g_assert_cmpuint(val, ==, 1);
> +    val = readl(NRF51_TWI_BASE + NRF51_TWI_REG_RXD);
> +    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STOP, 1);

Any chance that you could use qemu_writel() right from the start here?
That will make it easier to finally get rid of global_qtest one day...

 Thomas
