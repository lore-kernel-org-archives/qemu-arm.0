Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1013677njb;
        Mon, 9 Sep 2024 10:57:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWO2kwEhAuAN/ZyZ1EyRu3lRW43Dty0P17lLNN+DtgcZY1hnfTL6x0bdQUDaGCYaYhsx7Ltfn71v/VPRA==@linaro.org
X-Google-Smtp-Source: AGHT+IFn/AoMFtNqlRMeuHmTYgritJc8EWlQefDtVbVqt4sDj5Iu0ygXeGLKusI06p2Bs8sCbudU
X-Received: by 2002:a05:622a:107:b0:453:5f05:2ba3 with SMTP id d75a77b69052e-4580c670aa8mr194174061cf.8.1725904656442;
        Mon, 09 Sep 2024 10:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725904656; cv=none;
        d=google.com; s=arc-20240605;
        b=XpdEAutfRtThy/3P5ConYtTRMwD7pVlHhoWtzdXDGY3ux633H/a/lrpU6xwInZL0Dd
         gpoBXlb3MaJFZ6yV8eJnufO409BfzKSNCwLNy+nSzw5499s2YD6AVFFs2fCnNKqmQavf
         ghThjos6/vlbwA4MecdR5O+QwbVYOLj5bS2UmYloQPCtP7+XFJ1Pj0eypF9oXFTK2eTd
         V89XtQx5AYKeFWfXYT3TxUiATuMuDS7wahJW0zOfqI9Fy45+/TUv78x0V0RlMuzUKuWW
         6cernvZAdJRM8m5xWUa6/yJH/F2yzPzyq1JIdvKINl2uLrDrWAcktAQ4EVyFAiJkOQOj
         xSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/ASf6OKEwmziId2z0p4KONvCUimuiov06dqN0ChpJkI=;
        fh=mnGndQ2NRQM7wZi/1ztuRO3+8/xj+tuJ6kFzYf7/dF4=;
        b=d8C82TCu30eVdC2WJAxt6ga2fxbcyc3TNSyrkEUZa6uxgMzl+sLeAlWoyfB/tTd6j9
         gU26OBJub2kBAcpvjFEGO0jzHlsmh9XWoCj7wghcFFWTvqlv4EhfVQKWVBHx60bkmcJX
         k0a9pkcxJW7VwUWRz34xuCBbBvMVRjrg0iFFucpGhHxoDxEZgSh3Rf2LSN/kkkOlu+GS
         eYw3ZURiOhz3+o8cXhqKBM5SCdAh9YLhF7Zgc227d1SyD5xAhFD9bNzSHGrXzj45Xe3h
         ZQNBguRKszg1CEId/z/DwgAA6/hopb/pnb3iVtVoAF3G18yHanFA/eqEkpofAL4NPcsQ
         u+Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=stOXcRTp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e6223esi59730961cf.18.2024.09.09.10.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 10:57:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=stOXcRTp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snidX-0006Jw-B5; Mon, 09 Sep 2024 13:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snidN-0005XE-Lm
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:57:06 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snidL-0000br-BL
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:57:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so5606502a12.3
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725904622; x=1726509422; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/ASf6OKEwmziId2z0p4KONvCUimuiov06dqN0ChpJkI=;
 b=stOXcRTpBF8prAZqAzGf+nWTFgTXUctqQL1UhwwqAZM/1WhTZBILJ7N6Wvd8R+Cz+X
 lRwcBJmpc1WFRXSauIZAgyVGFRKZtxJ/04S3l+LMFMG4Z8UfQfCnboegmkyOiAgNtOKU
 epu8ICfpedYq2NGGm0xPwJBYRbcdez7ZhS1QeJzftfl7ai39PqYrabwHtyC69aVw0Nb2
 fyTmvjkwL5YtOrsfUxati8paxh3CHwxjhvdEN/Jgi6uHkqZ6Oii8+rs/oYdtu2OkH/Wn
 LinBOL4Z6JFyDH9NBcwb9RnsUveouD7mEBRprwQ6ad2kk0pGPDug++dvQEIj3x9p6vNx
 C12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725904622; x=1726509422;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ASf6OKEwmziId2z0p4KONvCUimuiov06dqN0ChpJkI=;
 b=ibPUjkLygw72Pj9SyDEqdppzIEPo8n37jj5uOr8dtnKZ51mxEMW0klKAl07yS6fcpm
 w3tBJ4ubdSbRb3dW7EBtNrTLwfdIi3bfM+JIF+SShYkwQF+TV9XpuiKdUUzeVtsXYvbo
 nLI2pcD97fwx9GhelvXndvCI5duXmgqOSmppJhNG6tlGjB2sI4h10harxnqMDduhOyWW
 HAcn0heJhyVqadRa8xaXgiq1jhWUbPiPMkbDF+U9TBMkF5vRUU0Tijak7Q25VvNmZBh9
 GVutNcrLmtnB3VS8U4/PVJB5gIGyp7L/87dNHU3jNVN8dehUP4M+SUgDmhomKnF//Q9U
 NTQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt6PdGa7tHFl3bd1ojn0lcdNXClP+YqmJhUkuDZkGZ51r+2SKIK14MInlgJbZbYvUN5cp1+/41XA==@nongnu.org
X-Gm-Message-State: AOJu0YxlnPDEQoAdhi6uUXqzrDd4zgK+isvuDAN5xi5GXjisHAV35CxA
 OfQXzkiqRwHoJN2COB3Qb1FAiC53Ej/47/dOvO31lrLmikJJ/oiCTJCARUHNQnhORlAMaUSTBeS
 B
X-Received: by 2002:a17:907:3188:b0:a86:6d39:cbfd with SMTP id
 a640c23a62f3a-a8a88858b3cmr853965366b.57.1725904621575; 
 Mon, 09 Sep 2024 10:57:01 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d64880sm365718966b.219.2024.09.09.10.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:57:00 -0700 (PDT)
Message-ID: <e39f8b71-f8b0-4679-b970-0eb1ff7c62d2@linaro.org>
Date: Mon, 9 Sep 2024 19:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 50/53] hw/misc: Remove omap_l4 device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-51-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-51-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: F/vgnJL/kNRs

On 3/9/24 18:07, Peter Maydell wrote:
> The omap_l4 device is OMAP2 only, so we can remove it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h |  42 -----------
>   hw/misc/omap_l4.c     | 162 ------------------------------------------
>   hw/misc/meson.build   |   1 -
>   3 files changed, 205 deletions(-)
>   delete mode 100644 hw/misc/omap_l4.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
