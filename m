Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1392464lfo;
        Mon, 7 Mar 2022 02:54:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTniA8POgjbhZ47HbiYuXqLtulZ+C3GrYBh1CjNFqymo5rakgN9gphsHIGYY3+24AcooWr
X-Received: by 2002:a05:622a:203:b0:2de:64f:6231 with SMTP id b3-20020a05622a020300b002de064f6231mr8631643qtx.291.1646650447067;
        Mon, 07 Mar 2022 02:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646650447; cv=none;
        d=google.com; s=arc-20160816;
        b=rYOtYmbb2RF9OdVMwvkCreOwxiTlDg9U8y1u3PUMFsMrPKN6ElM9bElGOmJ72nGpie
         trRQh62bWs3Dxe4xIczZk4xC5aoQ+et40KwAAnFgY8XQWJDre/LTu4ICitLOtrQ+cywN
         4nX/VUhIYQI2oPlorYf1DKRYSHrtbp/WHETi9qYefaaqCV88ahZIuDh6EObcUol0w7T7
         xx2kDPGCnFAa+KCvMP9jH9nzu0qHqDzmV2e9tW6oxdtPbnuRxruGkaRyg2jkCQRJdIL3
         OZW9BrzRTPuMFU8+R/yrcZjy7hoS1XtDeoEWdiOwrtllQumnQHyOrILCw8Pz00zKOVcM
         GaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ugN4OVB69Pzb7ae2Ovj1PuLnR10o/eCKGQfhZZtVqzI=;
        b=HCVr3VzyIJTyMW8Qxt5w7pedks17SM5ywp+z4qIURdOM0ISXwuT3Tf2XJH9hSsuhEw
         eOAgQAtXaW2ZIs1cz2xSP5oO26rvZzd4JfKLVCLekq9gzKrUGsFuzRPLsdNVdnpuIB/g
         R4i5DVTNohnk99p81LwoVscVn20kvg1Ri7/nyaJFYXHex7AB4krCx83p/UA8Ez0IYbli
         NaGXKQeU/C95tU6AuLLpJFW89QrsyJyhkIHq7w8eT7iYGtwivZOuq0N/whZBdukSz2pK
         GVW75ct17zhLGRY28Ci0DCA8W/K2OhJEASlw9VgQTvjEGGyk5geRNUdKWkzvKwpykUl4
         ceZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PgAN4uxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t26-20020ac8761a000000b002e05fe3f58asi2206892qtq.473.2022.03.07.02.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 02:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PgAN4uxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRB0A-0002Wf-JU
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 05:54:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRASr-0006p0-O5; Mon, 07 Mar 2022 05:19:42 -0500
Received: from [2a00:1450:4864:20::42b] (port=35592
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRASq-0005KP-46; Mon, 07 Mar 2022 05:19:41 -0500
Received: by mail-wr1-x42b.google.com with SMTP id b5so22427829wrr.2;
 Mon, 07 Mar 2022 02:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ugN4OVB69Pzb7ae2Ovj1PuLnR10o/eCKGQfhZZtVqzI=;
 b=PgAN4uxoLl65tGsjLZER1fJYHFRN/fpouS8T00rHVoou/7sMuBdwMU/8KguIFJh93T
 0uocjLSlrA829pBQ/1uDHIqxN+Tu1URHSaPmDIajYmazmbHXad6lbeyQ9QUW08igWS3h
 IqVGZOpvRIxqrd4Q0qrMpR944ELeEDF3YrlSchH/joOxutKB/+zOTUoP84FPhgziCLBK
 lTe58SF/jfVqXl/C2ynexdrElIqS+O3wo2baQ71G0UPjxlifseripSqQ9OLXIi5U8C5h
 xPptnvcTa9OjbUE1/dmiL33ju+XAQuVOCyKaZzCV27qy97UufGtdxz32/T79I66PSt2d
 YlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ugN4OVB69Pzb7ae2Ovj1PuLnR10o/eCKGQfhZZtVqzI=;
 b=4XyyoXJGm5ih3gkddTHrh/KbeO6Hnuvbrb83kCYXzEctXGKx33PxO+KpS3FpJAu0SK
 3Qb5T/fw5bEUZ2ebiD2c1ldels8J6RpTPPn9nuC9OMmnldcohSeeAlIzZnrZGFyLTGTF
 GHdIb14vcxDbrvWyECDtFF0YFHLkrVrgEND+W+Qgy+6ZAxA+CI0mgRKAfM+ym0kBD2+F
 MsK7zmtztQB6L/M1emUYsBS4b7ORSu1HzVLkLy9stbmYXeytO5SNuu1oNJXZ2O7yjeq7
 FV2//Szu+tFcxWpIOqccIOZ2pd6nmV1PNchm6C9KTbNYb2wvIZW0d3shmA4Ppzq9usiC
 CFPg==
X-Gm-Message-State: AOAM530+FAQ4W81Ak2F94OvOaZjAETdlGwgqRR+NgP75g2Jw+1RdCbzy
 1NS6cqXH4fnkAwL1RiUU5tk=
X-Received: by 2002:a05:6000:1448:b0:1f0:6620:968f with SMTP id
 v8-20020a056000144800b001f06620968fmr7863312wrx.714.1646648378299; 
 Mon, 07 Mar 2022 02:19:38 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c228700b00389865c646dsm16003865wmf.14.2022.03.07.02.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:19:37 -0800 (PST)
Message-ID: <8e649dbd-f410-6b76-e0bf-64415e427186@gmail.com>
Date: Mon, 7 Mar 2022 11:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 1/6] aspeed/smc: Use max number of CE instead of 'num_cs'
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-2-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307071856.1410731-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zdf6A8rgVDD0

On 7/3/22 08:18, Cédric Le Goater wrote:
> The Aspeed SMC model uses the 'num_cs' field to allocate resources
> fitting the number of devices of the machine. This is a small
> optimization without real need in the controller. Simplify modelling
> and use the max_peripherals field instead.

"(which by the way is not very descriptive, but we are going to
rename it to 'cs_num_max' in a pair of commits)."

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/ssi/aspeed_smc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
