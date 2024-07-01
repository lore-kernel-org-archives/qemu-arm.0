Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1294953njm;
        Mon, 1 Jul 2024 04:19:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhNI7ypt2hv7CjMTio8+Am2hy0JX3zzzWkaXq8+I9uPe2Umz4n+4Ok6Szq2llJMIw4X+ExuZ0NkRMF8FaRPyQs2vxFyjpY
X-Google-Smtp-Source: AGHT+IH6lNXV1TO3J8vRib8A5fRE25hcHKhFlr/+n2YNqa/V4uQIurObxadk9zOUrSmdQ4xnFtld
X-Received: by 2002:ae9:f445:0:b0:79d:6684:a399 with SMTP id af79cd13be357-79d7baaf6dbmr622319785a.65.1719832742751;
        Mon, 01 Jul 2024 04:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719832742; cv=none;
        d=google.com; s=arc-20160816;
        b=kdMUqGg2R/CVc4iUpZpQtb4mpH4hoXmwgYTT2zDLC19bqFQuYLWcCSK8fq0DihC4/O
         xP10JiVdKBEZ+SMlKxBcuBYbwpiceP8qJBHNWGZsh3EdyB4cmKE1QYtZaMrfyOuYDMaB
         OU6jGEpjVZ/FwE0yz99WP3iiJ8StF5UE2On1Euj4WiUFTXQ5H5vfifdH9Qi30M4gL9Qj
         6keWlNIktO1h4RIfSsAChcDhHIgPbB36mGcy4nygX2KZTIIDuMWAFWTgIKeHQeJVFVl/
         bicQzgFevpYpdEbYRBkP3DqVwOywLyhEpGAPF2fOW7VYji4YNZ2pq3wzNq0D/x5AGKzV
         l4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tfYzTVRd5G+y0Fh03CzuWJKfiglB2mLXODH1pEM2Rts=;
        fh=/fLP6bOfvK5tNa6zdOzoNlpMn8khsOEbmh8uB4IiKjI=;
        b=b424C+WuUUVpKyWkp7u1ahxCYu1j/MkgfI0XNdf+oxzKi3P9fppDWNkNNCPSeMQ0g8
         m4e3x8k80v8Kpj4A+C0LpIIs5wEJX1Y932lyByLmtBznBVB23w0PnyB+CaL5cY3EXFQm
         wSSbinLFzr8sFhL4YzUO7oxW1re5lVVZmHMZuQaI2SNx4qy76woJzc6EYLXhCr9WQ1cY
         NNiL3Zr4vhbN9gaNfHW9sCQ4b+9aSCrW1j7cSLoS/3+MH+rQRtsHAbBNwScsxOQNlrrp
         qVNSRzkXW6GrbBLqEmeKGaF74/J8Krg4lGyuwClKC7vxA9OfPBu/eiq+AB/eGDebwRYw
         wJVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TihGMUxz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69308da4si762247085a.468.2024.07.01.04.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 04:19:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TihGMUxz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOF3Q-0003Pq-F0; Mon, 01 Jul 2024 07:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOF3N-0003PR-PO
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 07:18:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOF3K-00046M-Jb
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 07:18:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42138eadf64so21072705e9.3
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 04:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719832711; x=1720437511; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tfYzTVRd5G+y0Fh03CzuWJKfiglB2mLXODH1pEM2Rts=;
 b=TihGMUxzsChgX6VlBwESDnDxGOY0x3NVODr9hYhjutlnv0CseBlHDLI9CCVmpMR6jI
 9NQxj9q7rRpjniglLzIwICPaJU3lXLLYm//yAWthhbkf6/mT+1eH8qQI2ESCahGC9kk0
 TiTMZrMvwCWuKnB/Mv8VVHAtk4J32otHGGzkL0+T2+u9v7EsA7NI7UJXymrJPhHhWipB
 uPcx6YrGn/fTfmw9bptMAPrSOyxz/VkKfMfFQKUCv8FrJM+SZkiDpksYszlLtJ6CXHI1
 SGxFX9j2tvMlsMIB8Xo3wlFwV2IxtuNVXa6XMPCqMAlh29J47rkTESu2wp51bXTE4MFy
 2uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719832711; x=1720437511;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tfYzTVRd5G+y0Fh03CzuWJKfiglB2mLXODH1pEM2Rts=;
 b=ateBrCvT9S5cgo5wSrlemyrZRyxshcdwNZ4C6Pssyb5Qo16kDOjZdMIXULbFLk9P9p
 IUTE6B681pPOQliKiz01NR4iN2lZe1zkH1JxnCljsiTF1H4xD5Cc1WDoPAtmRJMsiEoV
 flod5zpnqo7XkRAXCh3b5jjBGCcqf+NUrjaC4Y/RUsV2zij/w8KXcrMQ5EUKDjcZcDTJ
 jeCxHt3gTq0lua4rDiHjEp+eEAa1qsGYLuy8UPC5dhGFLwenmNbyje5Ef3CkNoCW1arb
 DvHoQz7uYLiIu/HxBRG+9HlIeXJx9ZqTJssGQItM6OC/gZZRENCCc7KyvCZhd23WjHhV
 JZog==
X-Gm-Message-State: AOJu0Yze9dCJw0OoJ6W7sHoRfwDe9iFZFVrcFidzmgoc1ly01lYri1sQ
 wPs93865rkb6X09XBr7R9ADOyeXGe1Js3NEdNhkwNjTocJ0AHgIFE2YVtCXRikZFj1YrFjD2SW/
 J
X-Received: by 2002:a05:600c:1989:b0:425:69b7:3361 with SMTP id
 5b1f17b1804b1-4257a03a497mr34127425e9.18.1719832711512; 
 Mon, 01 Jul 2024 04:18:31 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.159])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42577a0dda2sm61350605e9.0.2024.07.01.04.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 04:18:30 -0700 (PDT)
Message-ID: <edf25494-1fd0-4a8c-959b-c4547da0ab23@linaro.org>
Date: Mon, 1 Jul 2024 13:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/bcm2835_thermal: Handle invalid address accesses
 gracefully
To: Zheyu Ma <zheyuma97@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Xingtao Yao (Fujitsu)" <yaoxt.fnst@fujitsu.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20240630151414.2969772-1-zheyuma97@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240630151414.2969772-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bLscGfBMOF3z

Hi Zheyu,

On 30/6/24 17:14, Zheyu Ma wrote:
> This commit handles invalid address accesses gracefully in both read and write
> functions. Instead of asserting and aborting, it logs an error message and returns
> a neutral value for read operations and does nothing for write operations.
> 
> Error log:
> ERROR:hw/misc/bcm2835_thermal.c:55:bcm2835_thermal_read: code should not be reached
> Bail out! ERROR:hw/misc/bcm2835_thermal.c:55:bcm2835_thermal_read: code should not be reached
> Aborted
> 
> Reproducer:
> cat << EOF | qemu-system-aarch64 -display \
> none -machine accel=qtest, -m 512M -machine raspi3b -m 1G -qtest stdio
> readw 0x3f212003

Thanks for this very interesting bug report (and reproducer).

> EOF
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>   hw/misc/bcm2835_thermal.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/misc/bcm2835_thermal.c b/hw/misc/bcm2835_thermal.c
> index ee7816b8a5..5c2a429d58 100644
> --- a/hw/misc/bcm2835_thermal.c
> +++ b/hw/misc/bcm2835_thermal.c
> @@ -51,8 +51,10 @@ static uint64_t bcm2835_thermal_read(void *opaque, hwaddr addr, unsigned size)
>           val = FIELD_DP32(bcm2835_thermal_temp2adc(25), STAT, VALID, true);
>           break;
>       default:
> -        /* MemoryRegionOps are aligned, so this can not happen. */
> -        g_assert_not_reached();

Like Xingtao Yao mentioned, I believe the current code is correct
and shouldn't be reached.

Why is it reached? You might have uncovered a core memory bug.

Likely around access_with_adjusted_size() in system/memory.c.

I'll keep investigating, but so far it reminds me a previous
patch from Andrew, but it isn't the fix:
https://patchwork.ozlabs.org/project/qemu-devel/patch/20170630030058.28943-1-andrew@aj.id.au/

> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "bcm2835_thermal_read: invalid address 0x%"
> +                      HWADDR_PRIx "\n", addr);
> +        val = 0;
>       }
>       return val;
>   }

