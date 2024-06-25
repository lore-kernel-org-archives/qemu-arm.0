Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp591718njc;
        Mon, 24 Jun 2024 23:04:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqzF3BTD/8QnwS0FLf8dgy2ixcRuNQb+uCFeegauwuIntV7JG0v1/aS9HcySjKFLUsJ8L0J9drOpoINYvJPkvPf1+88Elr
X-Google-Smtp-Source: AGHT+IEcM2CKkNhbckZDaPAGABrDvPfs7rAm92uB3EeSA6+HeFD/L1MIVnT+nKsarIPuYM5UQQKD
X-Received: by 2002:a81:f208:0:b0:646:7ee5:f7f4 with SMTP id 00721157ae682-6467ee5f80cmr13800617b3.47.1719295478911;
        Mon, 24 Jun 2024 23:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719295478; cv=none;
        d=google.com; s=arc-20160816;
        b=vPcSF6yZ/DzCLEdt3mfwQkZ4beBBzlC9drrjqksUTCUFfG4HzKwLudKg5zX9cb6guM
         vebLdpr1tT8yk20rN68MPh5GJ7yQTR5oOBdypCr9aD1kO5Yc0ni7TNLKjxjjAlv9GCm5
         9F1ifzrhtcEAUCaZqRS1K5ha9ed4p9hOBcy9t4pD68wRpzAjshh//VIQcpdD1eESSUds
         egibhhxoOFssIP6pyiO9sPow3UO9gMvHpMh8IVDVAzzIHP482Y01HnpuGXVMgojtWQdX
         7twi7iry7REdn4korsHwkhHWHAwfX3fAMsbRCLemckbmE5tgH74a0pb8gpkjG+kK9Elv
         u1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=l+db07MSpzOI4I+k2kU72GF024+WvNDgQf4/BTLlkMg=;
        fh=q60siFTcyEe1G9u2wY+TZPizLr8UMh7Ku39kC7pu5gw=;
        b=ebFo65/0wSX/lcVRa7YFGQ6Eta6Lc3cNuk2OyavK5dXPqQE6TIhpnr7o+a32FPDjKT
         QN1D2bDH6bp4aquw3jHAQmHNkntMseO0oJAk9ziRoPLIRJhWu4avLvlo9Mz8GRPGiZbs
         xnVMEhytrayUAnYVeu2k2CPGBonGFv4eBkxLQCMYC7fxchRqjsL1RBFNf10daWULZi90
         84/m3NOCu4On/KhJNPP+IVpcQxMpc8gwgjdQRd8mMqYYvTLgzM13FSEaC9WZaYdZPg5F
         5AdcVJEk9UcqRa/BiwOE+GMBwDtMZEF/9JHmBRTDtzjy1Y8+gG/EZrKgbQjVf6D0dYRz
         dzkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ef16cd2si98265606d6.428.2024.06.24.23.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 23:04:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLzHw-0003V2-F7; Tue, 25 Jun 2024 02:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=+2S4=N3=kaod.org=clg@ozlabs.org>)
 id 1sLzHv-0003Up-Im; Tue, 25 Jun 2024 02:04:19 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=+2S4=N3=kaod.org=clg@ozlabs.org>)
 id 1sLzHt-0004Bx-Ec; Tue, 25 Jun 2024 02:04:19 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W7Z5t4z8Rz4wcS;
 Tue, 25 Jun 2024 16:04:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W7Z5p49twz4w2J;
 Tue, 25 Jun 2024 16:03:58 +1000 (AEST)
Message-ID: <69656db3-24a7-447d-b2b2-49a938744be4@kaod.org>
Date: Tue, 25 Jun 2024 08:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] aspeed/soc: Fix possible divide by zero
To: cmd <clement.mathieudrif.etu@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20240625015028.1382059-1-jamin_lin@aspeedtech.com>
 <20240625015028.1382059-2-jamin_lin@aspeedtech.com>
 <24dbb79e-cdcc-4415-befa-e6351c8f29b4@gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <24dbb79e-cdcc-4415-befa-e6351c8f29b4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=+2S4=N3=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: JFafSi5r0u+m

On 6/25/24 8:00 AM, cmd wrote:
> Hi
> 
> On 25/06/2024 03:50, Jamin Lin via wrote:
>> Coverity reports a possible DIVIDE_BY_ZERO issue regarding the
>> "ram_size" object property. This can not happen because RAM has
>> predefined valid sizes per SoC. Nevertheless, add a test to
>> close the issue.
>>
>> Fixes: Coverity CID 1547113
>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>> [ clg: Rewrote commit log ]
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/arm/aspeed_ast27x0.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
>> index b6876b4862..d14a46df6f 100644
>> --- a/hw/arm/aspeed_ast27x0.c
>> +++ b/hw/arm/aspeed_ast27x0.c
>> @@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
>>       ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
>>                                           &error_abort);
>> +    if (!ram_size) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: ram_size is zero",  __func__);
>> +        return;
>> +    }
>> +
> If we are sure that the error cannot happen, shouldn't we assert instead?

Yes. That is what Peter suggested. This needs to be changed.


Thanks,

C.



>>       /*
>>        * Emulate ddr capacity hardware behavior.
>>        * If writes the data to the address which is beyond the ram size,

