Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3FDCA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:12:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNQo-0008G3-2V; Sat, 30 Aug 2025 11:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1us1sz-0004jP-Au
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 12:23:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1us1sw-00034W-Dt
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 12:23:33 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b84367affso1356015e9.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756484608; x=1757089408; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=14xM34WgZ5OVhiHty2VliE68LfnqhHTViqNX91fodbk=;
 b=daUoVIFGmNBH85i5qQUb6QfZbhroniLw1NUAhqaEUqZQJZAM6/J63Z/7z5PyjJNqYZ
 zfqGFrDUkksseoqDsgYO2dX2aw246cV/i1kJsU1ilaf7oXBnuQLPy/94Mv/0Y8CWFG7U
 HdTWoV1dII66q9CrsJx+WB1RPpXhnKEW10E7pxw5Y+Nv6m4xaxqDede+LP5k0lo6RzQu
 w8dTWj6Fi69yqV/4JGV0NdA6SPSOckr+XQ+ivRehPaZS2qdUPal4Yt+wu3oGTKp0g8Fs
 kibfhck+KQd04ddunHGWDhIF1xbBH8vqHrP7ssC3jJTX9diFxS1mpcCgluEH63TwH+8P
 WMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756484608; x=1757089408;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=14xM34WgZ5OVhiHty2VliE68LfnqhHTViqNX91fodbk=;
 b=ctJzOwGNcrne5NbDneaqI0zsK9TkWy20lTOTtaUXLUUplt7+k1wLRSNQWKhXC+hVpC
 rqy2JxDoiZ2wi/MuWxlEEgOyZXoM2CqnLqOgrr07Ag3d8dN3ZLZiGqGst8QlUIH+ufGe
 MAeiQAneFUDGMLA5uVyc125kyYyNLdfb73YOCDALWG2MNBUoEt4YCeumN7g0LH5iS+YV
 S3wg+cN1kN19t9cc+aYzdpxnZQy1BleY0oqBv2k4uK60wGJglkmGPW19EizD9iA9NPse
 JeZsXZJjAi5cf+a00+hG2WJxjljykadze8r/RdRpy2jmcfBJ2TW67p979mJSPb4AruNE
 m1qw==
X-Gm-Message-State: AOJu0YzaA2kGomiOjyYLpHgyntz7MoizKXdvjKHuW5WHxrawzr7DwvBb
 WVFManpI/6ciV2RuFyWEmUhKoGF8nJXvIRYbUAY5A436rOUD/lLyt0qArOvpLYa12ss=
X-Gm-Gg: ASbGncvi4BueWXcRgaK5ySgDnZMMOowIAIgTV3a1bqLZS0hr6z5HEVXZCCShKkgH4k5
 w1U8P0mY7U1JRkv3afIdslozlj/sS+A+4GoaO3K2S8L1O19jyJhyZlypJiLFP6UaBr5FlrVCTlf
 2nOsPQxyBfE4+C9hZWEjIMjiSDT3h4Gj5tY2FnsrG8n/WFqiQzuhjz5DcOnsRcZUPI0doE9DoLN
 G6n0MrSVd19/xAym5quhE+M2kkRfbEvq2RzX63kSXaEVvZTde9bQpppO9JHOPjk8PImHrw2ZEYn
 pimtvxw8ILEFEAMpx9Dhlz1cQ7W7z9j/BUgDvI6MSfCMoABqq2APGktGpZlJfzxpOi23JKY40Io
 /sUiAZt3xdVihmWRG+T2Z0xQAqq9QwdBlQ8v+IEYCnJqKUwKuRneQ8CuzkbxgdMs78VDpYJxSxz
 j1
X-Google-Smtp-Source: AGHT+IFfaWFlJtcZID9seekoVR7Cts1zfcFL78mYT9f73QFOfYqsZnnS8YyvLpbs+qb6AR6Q7T36Qg==
X-Received: by 2002:a05:600c:1381:b0:45b:6b57:5308 with SMTP id
 5b1f17b1804b1-45b6b575361mr101850265e9.7.1756484607588; 
 Fri, 29 Aug 2025 09:23:27 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e92a42asm42863175e9.20.2025.08.29.09.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 09:23:27 -0700 (PDT)
Message-ID: <484d2580-77fc-4fdf-8f02-ef25df08bb7c@linaro.org>
Date: Fri, 29 Aug 2025 18:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/sensor: add stub for ADM1266 blackbox
To: Ben Hillier <bhillier@google.com>, wuhaotsh@google.com, kfting@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Titus Rwantare <titusr@google.com>
References: <20250828184939.3140841-1-bhillier@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250828184939.3140841-1-bhillier@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Titus,

On 28/8/25 20:49, Ben Hillier wrote:
> From: Titus Rwantare <titusr@google.com>
> 
> This patch fixes a bug that causes a kernel panic when calling ADM1266_BLACKBOX_INFORMATION.

But you also implement BLACKBOX_CONFIG / READ_BLACKBOX...

> Log Message:
> 
> adm1266 5-0042: Could not read blackbox!
> Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: adm1266_nvmem_read+0x168/0x170
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/sensor/adm1266.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/hw/sensor/adm1266.c b/hw/sensor/adm1266.c
> index 9017ce6116..cd11526c2b 100644
> --- a/hw/sensor/adm1266.c
> +++ b/hw/sensor/adm1266.c
> @@ -75,6 +75,7 @@ typedef struct ADM1266State {
>   static const uint8_t adm1266_ic_device_id[] = {0x03, 0x41, 0x12, 0x66};
>   static const uint8_t adm1266_ic_device_rev[] = {0x08, 0x01, 0x08, 0x07, 0x0,
>                                                   0x0, 0x07, 0x41, 0x30};
> +static const uint8_t adm1266_blackbox_info[] = {0x04, 0x00, 0x00, 0x00, 0x00};
   {
     0x04,       /* length */
     0x00, 0x00, /* latest ID */
     0x00,       /* latest record logic index */
     0x00        /* latest record count */
   };

>   
>   static void adm1266_exit_reset(Object *obj, ResetType type)
>   {
> @@ -125,6 +126,17 @@ static uint8_t adm1266_read_byte(PMBusDevice *pmdev)
>           pmbus_send(pmdev, adm1266_ic_device_rev, sizeof(adm1266_ic_device_rev));
>           break;
>   
> +    case ADM1266_BLACKBOX_CONFIG:
> +        return 0;

I'd was expecting pmbus_send(pmdev, "\0\0", 2) for CYCLIC_RECORD_DISABLED.

> +
> +    case ADM1266_READ_BLACKBOX:

Here I'm confused, as len+data is 65bytes. Is the guest
reading a stream of 0xff?

> +        return 0;
> +
> +    case ADM1266_BLACKBOX_INFORMATION:
> +        pmbus_send(pmdev, adm1266_blackbox_info,
> +                   sizeof(adm1266_blackbox_info));
> +        break;

OK.

>       default:
>           qemu_log_mask(LOG_UNIMP,
>                         "%s: reading from unimplemented register: 0x%02x\n",
> @@ -154,6 +166,9 @@ static int adm1266_write_data(PMBusDevice *pmdev, const uint8_t *buf,
>           pmbus_receive_block(pmdev, (uint8_t *)s->mfr_rev, sizeof(s->mfr_rev));
>           break;
>   
> +    case ADM1266_BLACKBOX_CONFIG:
Do we want to check, if lduw_p(buf) != 0 -> log(UNIMP)?

> +    case ADM1266_READ_BLACKBOX:

Do we want to check, if (buf[0] != 1) -> log(GUEST_ERROR),
and log(UNIMP) regardless?

> +    case ADM1266_BLACKBOX_INFORMATION:

            log(GUEST_ERROR);

>       case ADM1266_SET_RTC:   /* do nothing */
>           break;
>   
Regards,

Phil.

