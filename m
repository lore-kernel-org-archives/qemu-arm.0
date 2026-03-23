Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B71EC01C8
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Mar 2026 11:02:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w4d2Y-0008Rv-Ab; Mon, 23 Mar 2026 07:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w4d1k-00088L-0t
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:01:03 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w4d1g-00083i-To
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:00:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-486fd5360d4so41481235e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2026 04:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774263651; x=1774868451; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=biDZgCa4iXv46d+XIxztphvTEQ1cGEYkj7pRIQ+AaGY=;
 b=hJrRhEdvdimVoVFY4yIn4Wn20aavO9axgAT9JGFpy9SVyR8tzpTmCkVbO5yqh4zGso
 xqpd4LZ/Whvvjv9bF3fPd7yWx7j2EqGc7tYMDA8f+glFbKAdUPvCp//SqWYGhiGsUQL1
 pvQ2FvSmsIuZNMBucix9O18dViSNdK8DJth3BeVxxDH3Xf+nmWogxH2xHi2Pc4Mwi32M
 QuPmVbu3ktIYffp44Yz8ydigdCfjFNEJRWkB7xY6MBacY913Iw+wLYt2O75ah1WaTmkh
 GL0N1xJgGB0wvZON3ikMzal8aFGKxdYpuHApHCwo1r7b+4Am9RWHeUyI7zp8+UrVvgeQ
 U3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774263651; x=1774868451;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=biDZgCa4iXv46d+XIxztphvTEQ1cGEYkj7pRIQ+AaGY=;
 b=I537GTXaEqHtFcoGwhJs+k6srB268M+HVVpWe1mfxWUvlbOPe306bPVgPtH7blWjGS
 OG0t138jkk3b7Wi1caSnq7g/EBqR4zptcJe80zukrd/6PzHTvvoQBo1PrLbHkzH3w5Of
 92RI/DmxJpXaGRXNN9XGC48xRBOGOrbrZb/b098nuBcMBYsBTuhf9UC4zMSPnAFxc2Cf
 Xk8rit6zk8qJiWWxs1loJtvF+8e061cDkPfZTndSbOIbLVv7h9/Y8un/z4xCEP3FzS1c
 ElBtDhbkoWouJSd93uuOfJbG9CLVSt2B1RC7fKMspUiw8xaYWao7nGct6q/H/Wldgfhm
 51FQ==
X-Gm-Message-State: AOJu0YwpWvT3nSe8E4bjO5AlTFmVaFYoxNrwQ4fgvuVBXHOw3fOqR+IY
 4KWCvDBCFE18DYwTHjyN9Zsak97yrcA5YhrgE5dXY52bUCoKFyRXFERYkhuVEq+F08w=
X-Gm-Gg: ATEYQzwFme9GRBNyWlhmHEJEqK1g78KpbUlVfYcOPOO4zUcD5cMK/9gvDR/kq9sIm8o
 0Lzv6OrHSOuY/gjZr3nc3b9c+IFlly8+APXnEq7CiK5Pyhnw450+18HtZ8ZOX3Z17tdcQRqJrvQ
 hYiqHT7Gq2zRHYUUeTMlbS9eE6BkaE4GAWO5BThexGbLEPC86s2cajYXJDn9yTWt1gu8lvCykvR
 KOTkwvZQy3qcOCFjt62Jaz1FaG24Xmke+RYFdXvug9mah9jiU3oDIo6WpnMnxf5MfcUlYtB7/wm
 m6qiQ2/pt4o2lRrm8buluSb+jfzhT7VWLuNgpaSwzOsSarJPQ5q6hOVG5t8hPnqR7ggHM6dDW/s
 OQh3Ftu6hAenvI0RgTLRwvABb6wsn4S5Au7kEGiHw0g4mDJjDcoc/u49XbFCzPdikDP3g41ZyVr
 ygq7NHI0qLk8jKqrSiOxVhfB5WJIC+blvDHbl4KXo3uCavY14fZgigKEM0Xm8zQOgVAA==
X-Received: by 2002:a05:600c:45c4:b0:486:f308:94ec with SMTP id
 5b1f17b1804b1-486fee227f8mr153806355e9.24.1774263651350; 
 Mon, 23 Mar 2026 04:00:51 -0700 (PDT)
Received: from [192.168.69.206] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487003ec0d5sm103620725e9.1.2026.03.23.04.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 04:00:49 -0700 (PDT)
Message-ID: <4b8105d5-bd4a-4e62-8740-d402479ff986@linaro.org>
Date: Mon, 23 Mar 2026 12:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ftgmac100: Improve DMA error handling
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>
References: <20260322215732.387383-1-clg@redhat.com>
 <20260322215732.387383-3-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260322215732.387383-3-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 22/3/26 22:57, Cédric Le Goater wrote:
> Currently, DMA memory operation errors in the ftgmac100 model are not
> all tested and this can lead to a guest-triggerable denial of service
> as described in https://gitlab.com/qemu-project/qemu/-/work_items/3335.
> 
> To fix this, check the return value of ftgmac100_write_bd() in the TX
> path and exit the TX loop on error to prevent further processing. In
> the event of a DMA error, also set FTGMAC100_INT_AHB_ERR interrupt
> flag as appropriate.
> 
> The FTGMAC100_INT_AHB_ERR interrupt status bit only applies to the
> AST2400 SoC; on newer Aspeed SoCs, it is a reserved bit.
> Nevertheless, since it is supported by the Linux driver and it should
> be safe to use in the QEMU implementation across all SoCs.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3335
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/net/ftgmac100.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

