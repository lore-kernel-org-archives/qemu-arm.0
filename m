Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1640581wrt;
        Thu, 10 Jan 2019 02:11:35 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7BUjCNGOsrqZtYcJYyi56u0+/bQ1pPtjfAc0lnWGfdDTcSrs+87JECMGqxw6/AKiO4QJ1H
X-Received: by 2002:adf:e34b:: with SMTP id n11mr8055311wrj.91.1547115095683;
        Thu, 10 Jan 2019 02:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547115095; cv=none;
        d=google.com; s=arc-20160816;
        b=N7TRLLZPHR+EpeMr00QmEioYZG1wsPB/76BKIZ1xOqK5JvCRRegzVUwA4HWum/pzcl
         OPOV8G3dmHO95XH9GnB/m+JV0MlyVVSk1FfxQ4OLFB+ULpCHlxwGgBSsSmYUh2eXGOek
         4g7OvWmIT3fm/q1Ik4i4aM/gnbIPYvymWAJb/oBEr5V8mF1vQYlDkEWmoFeZTTB04I2n
         MWy2vlA/0SH0MCjyeTHXg21SZiCIAjpGI49IKotxML6quQF1kP0dQOr+McZme9XF9DR9
         w+FxiL8B7GewjqWMpc1dwrNmXoeDyLZ6piknKOk+3bozXqkoNWuIZ2udPfs+bFbotbKw
         Uvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:dkim-signature;
        bh=DM/ZZwKxyqk1smT4wyYlOIvoeIyF8lxd9w3nO67yZ6Y=;
        b=Xm8iQX+Q4JQ1Ei4Hpm6WXwaW5HDZK9OFCxssQkHese3w2xTVEW+1VtYmoG6urqaQKx
         FIlDOIoaC4tTMw2rnnYBi0/TM0sKUXAXqrvD+SfFZjuoxZ6xGTN6fKm7bvtxHjrPxTR4
         9jga1LgAtFLvR4B9MEUnc04EY3hMFNcHSMkimy8GVt1+4A/dGA15x565P4x1/z6pUBqt
         jfn0AGGC5Agfm1NDdbPuI1+iZWhK8NGLYxJMlCsvulcnOhbenfoZDne8pum4rnvONAq8
         aTDsZ6xjOam4LCqmZfKcecbFIHdssVVhVWrSBoU9vqDrRcu1fO+ytJkASSdYmhzBm8cF
         pM3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=Y8GLv5a0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si40269185wrs.302.2019.01.10.02.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 02:11:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=Y8GLv5a0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghXJG-0003Gl-QK
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 05:11:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jusual@mail.ru>) id 1ghXJ9-0003GR-6M
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 05:11:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jusual@mail.ru>) id 1ghXIv-0002HB-HH
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 05:11:19 -0500
Received: from smtp16.mail.ru ([94.100.176.153]:54640)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jusual@mail.ru>)
	id 1ghXIt-0002F0-Au; Thu, 10 Jan 2019 05:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=DM/ZZwKxyqk1smT4wyYlOIvoeIyF8lxd9w3nO67yZ6Y=; 
	b=Y8GLv5a0LFA8N5bd2BluMXHBOGKH8sNfxnEB/qCPfMV+UJ2bmuREiw4h8+F0W/J0a8VD3Nqj0aQo5gI33+s49QHsgt75XciM1MkhsACPwYPt9I8fNp5dUhUjww2HMVDnSZ+iUfhmLsxJ4pfKKSqSXxiwFXYgTQAfuilkGPCBrps=;
Received: by smtp16.mail.ru with esmtpa (envelope-from <jusual@mail.ru>)
	id 1ghXIp-0004zh-5o; Thu, 10 Jan 2019 13:11:07 +0300
To: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
References: <20190110094020.18354-1-stefanha@redhat.com>
	<20190110094020.18354-3-stefanha@redhat.com>
	<cd32de08-afd0-4b8b-a10a-99e1d88d1755@redhat.com>
Message-ID: <5cc00012-1929-22a0-cbf8-14573b083ae7@mail.ru>
Date: Thu, 10 Jan 2019 13:11:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cd32de08-afd0-4b8b-a10a-99e1d88d1755@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp16.mail.ru; auth=pass smtp.auth=jusual@mail.ru
	smtp.mailfrom=jusual@mail.ru
X-77F55803: 3FFC80838138E3AB5A78504BD2AC29419E620A54DAF35E3B45E9DC363823D634CD9B123D1561B2E0F8EB75264EBBD67B
X-7FA49CB5: 0D63561A33F958A5E60386356D91E7649728155DBA0F2F4DDBC10B01E092AC218941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249D52CD31C43BF465F3AA81AA40904B5D9CF19DD082D7633A0E7DDDDC251EA7DABD81D268191BDAD3D78DA827A17800CE7F0DFBB38B116E9C7CD04E86FAF290E2D40A5AABA2AD3711975ECD9A6C639B01B78DA827A17800CE78551BB54DDA62695B306B6A77FF21E0575ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC8519DC0BE04022C72727F269C8F02392CD5571747095F342E88FB05168BE4CE3AF
X-Mailru-Sender: 3BB5BBD942886723BD903D2329646980DA835869AE4827E3659640B2081FB704CD254E74BFB65C42F47EA7097ACE9B7FFB559BB5D741EB963BB91581D3AD5D250F2DC73CC0BFB1A30DA7A0AF5A3A8387
X-Mras: OK
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 94.100.176.153
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
From: Julia Suvorova via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Julia Suvorova <jusual@mail.ru>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	contrib@steffen-goertz.de, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FW+4ENHUkkQo



On 10.01.2019 12:48, Thomas Huth wrote:
> On 2019-01-10 10:40, Stefan Hajnoczi wrote:
>> This test verifies that we read back the expected I2C WHO_AM_I register
>> values for the accelerometer/magnetometer.
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   tests/microbit-test.c | 44 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/tests/microbit-test.c b/tests/microbit-test.c
>> index 0c125535f6..dcdc0cd41a 100644
>> --- a/tests/microbit-test.c
>> +++ b/tests/microbit-test.c
>> @@ -21,6 +21,49 @@
>>   #include "hw/arm/nrf51.h"
>>   #include "hw/gpio/nrf51_gpio.h"
>>   #include "hw/timer/nrf51_timer.h"
>> +#include "hw/i2c/microbit_i2c.h"
>> +
>> +/* Read a byte from I2C device at @addr from register @reg */
>> +static uint32_t i2c_read_byte(uint32_t addr, uint32_t reg)
>> +{
>> +    uint32_t val;
>> +
>> +    writel(NRF51_TWI_BASE + NRF51_TWI_REG_ADDRESS, addr);
>> +    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STARTTX, 1);
>> +    writel(NRF51_TWI_BASE + NRF51_TWI_REG_TXD, reg);
>> +    val = readl(NRF51_TWI_BASE + NRF51_TWI_EVENT_TXDSENT);
>> +    g_assert_cmpuint(val, ==, 1);
>> +    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STOP, 1);
>> +
>> +    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STARTRX, 1);
>> +    val = readl(NRF51_TWI_BASE + NRF51_TWI_EVENT_RXDREADY);
>> +    g_assert_cmpuint(val, ==, 1);
>> +    val = readl(NRF51_TWI_BASE + NRF51_TWI_REG_RXD);
>> +    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STOP, 1);
> 
> Any chance that you could use qemu_writel() right from the start here?
> That will make it easier to finally get rid of global_qtest one day...

I'll send a patch soon to fix it.
But this test can be merged without corrections.

Best regards, Julia Suvorova.
