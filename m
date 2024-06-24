Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp437604njc;
        Mon, 24 Jun 2024 06:59:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVF9j6NK94poeK+9+NGam5Pdy8HIsvFOPykjBiD7WzqHTSo3jYYN4nHSJXZaNC1UnbmQzkbP4WqBpZlUwouYj6l2mUT5Wsq
X-Google-Smtp-Source: AGHT+IEofVsr0ZixIzHVZlJpLGkGHlYugSZpuAuDr1RkjZJByYq8CTBXLOxP3NKIJUth/jgFQkMB
X-Received: by 2002:a05:6122:1806:b0:4ef:594a:a706 with SMTP id 71dfb90a1353d-4ef6d8bc435mr3268617e0c.14.1719237560994;
        Mon, 24 Jun 2024 06:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719237560; cv=none;
        d=google.com; s=arc-20160816;
        b=0YoxAegMb6JjsRMxWJHVD/+W1itGM5SpJJarZIjZikV0DBZbXu/NZhJSeIyPaCbIWU
         jvzw8LqaOrgr6m40IwyjL+nTzoh2WULH6csJlE4M2PjOl8POADRzUsraPn7Weg/BXckC
         17gaIoaPJnOeOav71GI2tO0odPP6/KuiNtZtKBeDWiMGh4vp24cHsurBy2EYSE7KAEbN
         eSuUXQ0/KWmqyPIMH62/BpOgiPdOqpFCW96h1OrK98CtIHBQlgjOT+a/sS98cHdTLe+Z
         PXjftMeBt0eJzaxvawTTNMrIDvHxxZ6d6dH1gPTm2B8HjRxvo7wEZ7e1sqC7ePdW0QRF
         rdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=eGleIaACdsnWRq/qhoOovm9gWgsBhwCCRzjR/ucgYWg=;
        fh=KPZW2V58Em/xkdgh8qlHacunl7uUUTE6B83B/DHu8Zo=;
        b=mA98WVlP9p3ymuB+ds51GQJ2DQgrs34oyByMXRzLkkCjI5UQosK4dXY5EcRlsNs2Lg
         cDfoQTiEcpKN2NE0rVCl7+QcnLWfsKlOXg1aPuwPMSAPbY5Iw5fb/pJJeD0I+GcJJ64m
         4Ms3sn2pxF6ct39Nvox7GHl+/hAT900Hr5x/n5rtPxy8R9dm2Z6sqVvJ6zDwQ4qEbwTl
         640mGlESI8SmgRO/wIJ829R4/NP+bvk+tNinG/xhTawtyV6Jlx9hUDGSF6lKJDgL9Q8B
         Ow7ocqXA2OZwOZEtRU9AQc2k2ZcZxGLwMqAJDcAjjgk+eSmHSkEnxWTzXHJ+PPXL2QK9
         31uA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b529006122si68639736d6.345.2024.06.24.06.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 06:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLkDh-00077N-P1; Mon, 24 Jun 2024 09:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=voaC=N2=kaod.org=clg@ozlabs.org>)
 id 1sLkDg-00075b-1C; Mon, 24 Jun 2024 09:58:56 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=voaC=N2=kaod.org=clg@ozlabs.org>)
 id 1sLkDY-0006eM-VU; Mon, 24 Jun 2024 09:58:55 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W78h03CvQz4wbh;
 Mon, 24 Jun 2024 23:58:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W78gX2hzkz4wb2;
 Mon, 24 Jun 2024 23:58:16 +1000 (AEST)
Message-ID: <b013bd79-c206-446e-b482-91eeb926c70a@kaod.org>
Date: Mon, 24 Jun 2024 15:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] aspeed/soc: fix coverity issue
To: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
 <20240619093508.2528537-2-jamin_lin@aspeedtech.com>
 <CAFEAcA8tTHusKOR7JhyU+wwA3JJWq1o5wVaNXugw2S9SjAsESw@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8tTHusKOR7JhyU+wwA3JJWq1o5wVaNXugw2S9SjAsESw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=voaC=N2=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mgGzX5yANDAh

On 6/24/24 2:18 PM, Peter Maydell wrote:
> On Wed, 19 Jun 2024 at 10:35, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>>
>> Fix coverity defect: DIVIDE_BY_ZERO.
>>
>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>> ---
>>   hw/arm/aspeed_ast27x0.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
>> index b6876b4862..d14a46df6f 100644
>> --- a/hw/arm/aspeed_ast27x0.c
>> +++ b/hw/arm/aspeed_ast27x0.c
>> @@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
>>       ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
>>                                           &error_abort);
>>
>> +    if (!ram_size) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: ram_size is zero",  __func__);
>> +        return;
>> +    }
>> +
> 
> Isn't this a QEMU bug rather than a guest error? The
> RAM size presumably should never be zero unless the board
> set the ram-size property on the SDMC incorrectly. So the
> SDMC device should check (and return an error from its realize
> method) that the ram-size property is valid, 

That's the case in aspeed_sdmc_set_ram_size() which is called from
the aspeed machine init routine when the ram size is set.

Setting the machine ram size to zero on the command line doesn't
report an error though and the size is the default.

> and then here we can just assert(ram_size != 0).

Yes.

Jamin, could you please send a v2 with the commit logs update
I proposed ? See the patches on my aspeed-9.1 branch.

Thanks,

C.
