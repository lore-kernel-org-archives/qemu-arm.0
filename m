Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C50C87FD1
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 22:57:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj47P-0004l0-Op; Mon, 04 Aug 2025 18:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj46q-00046y-CE
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:56:49 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uj46n-0000Fl-BL
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:56:47 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-76b8d289f73so3418543b3a.1
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 15:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754348204; x=1754953004; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KXmJcDFY/K6kmvJKvRb9yzIOFxWc0d1jqukisbQaPXI=;
 b=Vz/GVFc1HG0nsvV/2H6jyUL2khw3RRSftt6MPuGObWLYO9dwY2S6JCoqhBEIUaOZN0
 oo2LZxHalOjk2G7hq4D7lNMOss94rjztfA1Z1TJuaUrgtNgc6+yH2N6FX7USC0rq9iaY
 B4FOhibQ/XBxnYNy/eKYZE+IqsMwMCPPCqDNdKnTqCZo1cged1YXjPAMSXdwhZQe9v60
 VbpjyDAiIZQyjgqPDzrmbYfWfVxmUtbly8Qlaw4e3D2rhzgoOrr5ADpEdmfCfGr++4XV
 18QqcBhUG/8quVcZTsdC9G493vSnobwPF1NjxUsf82vgmG7EIV5Pybo+GvbOxRCri/O/
 GHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754348204; x=1754953004;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KXmJcDFY/K6kmvJKvRb9yzIOFxWc0d1jqukisbQaPXI=;
 b=GPGj52g1Sxjxw/06biijCra4HK3D8OsFXXIeWhBPzBtScEj5FTB9kt3KvTdmjNfm0z
 BR6GkuP7h2pYTM3n1XU9LQcWaZiJ6kGRterwgQwwIEwIwpbnMyOOAl3IR3spuHCpEftv
 id3pWFpg8OyhodivOXTNHKNm1i323h4l1XDbU8A+k28RQcRhffUYIhIk+/iMqRgD/bXb
 QvtBYcS6aF5xcjj7rqplF/dEV7xkWWX9P0+oomJhKJ9SLhCnBu3L6kfRLj72OaFKLqPc
 M6RtGSTe1DMEPpx2SR5Kc/Z3lFAwQ2Tur/a5d9YesyMMQkFE2dn+quycW6X9n5vjE6mS
 1grg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBJTcK59gGJ44qUnYSeQazwA4GHfDVdfU0Ykyn/nZj1QdyGEwQ3t0xsmxMojGqFmcIG2tk/N7m8Q==@nongnu.org
X-Gm-Message-State: AOJu0Yxhz7ks8feh2UDET89MDSe9l17K0IGzpf1XOfHyQnM9NOGgo1f/
 gmoXlk6lG6kwdpBbBYzZ7sknpw/8SZKIe+QMFiscRQZRzNOzCdcymTfq2VQ+laJQLSMYp+3kxOK
 y38oQ
X-Gm-Gg: ASbGnctoP8D79ejXygNscgV52qAuo0fu0EV5usC6xE5bizT/fR+mdVp+wq8fJ1hH/K0
 vCd1js8rpv2Wdca2TAKZd8acdbZ5Rf6yhrQ9I/fF4F7i+niPmfLOakvN6NMXK0I38uEKThGwNk1
 DVFb3YRK2D5OvF2U7IbS7xDllRiD4sXy3AtTWNroQcBxbvDUN0HXjbS7eAdwl5NvomU+8D5sMNH
 N+n9YeTosVf/xeKoHYEWnSeQIdZRbcNO7eNI0Cz6NNP0DPBEk/epNoOn6A+36c95lUQGiP0SJ3l
 TdD0MTAmOUc0UGCM/GQ1xuS1B+dqUDFTgtjPE/PYAOqOcSjWHWxfV2LnJpxJrw3SldxRtrzfgIg
 F31MbQ7hiIkj32BGH2ox/HK+4Wp2f26SZD8XKZ0Re
X-Google-Smtp-Source: AGHT+IEYwQLXqyJ2ojex8oje4ka/V25DO3QQcq0DaGDHRYahPslLoNdskn7nBHOzVauqw6sC9swNYQ==
X-Received: by 2002:a05:6a20:3d11:b0:23d:58e9:347a with SMTP id
 adf61e73a8af0-23df906a3c7mr13762018637.26.1754348203792; 
 Mon, 04 Aug 2025 15:56:43 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd6aacad9sm10411500b3a.124.2025.08.04.15.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:56:43 -0700 (PDT)
Message-ID: <b7c6b929-ec99-4eb2-9f9b-c91632dd8ac3@linaro.org>
Date: Tue, 5 Aug 2025 08:56:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 03/11] hw/sd/sdbus: Provide buffer size to
 sdbus_do_command()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20250804133406.17456-1-philmd@linaro.org>
 <20250804133406.17456-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250804133406.17456-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 8/4/25 23:33, Philippe Mathieu-Daudé wrote:
> We provide to sdbus_do_command() a pointer to a buffer to be
> filled with a varying number of bytes. By not providing the
> buffer size, the callee can not check the buffer is big enough.
> Pass the buffer size as argument to follow good practices.
> 
> sdbus_do_command() doesn't return any error, only the size filled
> in the buffer. Convert the returned type to unsigned and remove
> the few unreachable lines in callers.
> 
> This allow to check for possible overflow in sd_do_command().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/sd/sd.h       | 23 +++++++++++++++++++++--
>   hw/sd/allwinner-sdhost.c |  7 ++-----
>   hw/sd/bcm2835_sdhost.c   |  7 ++-----
>   hw/sd/core.c             |  5 +++--
>   hw/sd/omap_mmc.c         |  5 +++--
>   hw/sd/pl181.c            |  6 ++----
>   hw/sd/sd.c               |  6 ++++--
>   hw/sd/sdhci.c            |  6 +++---
>   hw/sd/ssi-sd.c           | 12 +++++++-----
>   9 files changed, 47 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

