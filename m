Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1722975lfm;
        Wed, 19 May 2021 10:59:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4gVlNJGOt2yD/8i3jHhqo/COuxA/UUcoFrGZeSWGf0Ccg/r4MReR1p+FVHWouqG51Fy2o
X-Received: by 2002:a05:6e02:130e:: with SMTP id g14mr271353ilr.74.1621447149480;
        Wed, 19 May 2021 10:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621447149; cv=none;
        d=google.com; s=arc-20160816;
        b=kNjmSiZ+uZx+0Xn51ropaPFl1PqWyqOqfgWH/GAgO17f8MM12o3fdOLR08vsQRbJ05
         LY99QSCO7FAEJbMedOWSFZa3lmOqNAtQyEVu5fl9BqPC6mNtuwn/xs2tUmlJkiY5ScBP
         g2XSoSQ1cCcIJx/72ML3wcF5uTvjXHSyT2l36guqR88hp3CFVW3m93x50niVzM9tOpVj
         funPse80aUBWreJc2/OpBsV7NuWKcZVaa4Osl5SAXn9eiiIymsJXf/9CR/Hw6s2/1ZPz
         ZTAFOgqgW2gGsRUggtK9tOCHkWUMok+uL0BMFz2HLmS9b+LTpFqfuyrYfzb6PgSCntIc
         iARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/2sPs+ru2T4x3kpaPoLZ4bxZnL9mzLFOYVpuWjbVtWM=;
        b=kls8ZBNUtO1R2z8b5HwrPb5EJa4cuHko5B5Pw9fnn7dG5bmyVr3cYNq7S6hV5CZemS
         bMA+k824nycmYq9zBUXKThZ+Hq+J7c8WjQsPq3EqVq1w6gJNKfikQ+nCQYZm9mbg7big
         PRKxeJTStx1JXo7xzjXG1qMcTfAFvaIx/TdRHAwfHDaAJTlGNb1Bo+ZQX6glRKjE2Zie
         4Rijfdmf8/prTsVDVffQOCzxs3c9TPiooBzgU+DmFFXoUundtkD9YjO5Y+G3oU3nml34
         UF1Unc34kI+vDj8NpH+qwSl97S/PsF6SxLtB4OXMr+E2F4Uz+WrvPtRQsGfpPKEXSJY1
         gWxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=InPNeW9D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c31si26310019jaa.53.2021.05.19.10.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 10:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=InPNeW9D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljQTM-0005m3-QJ
	for alex.bennee@linaro.org; Wed, 19 May 2021 13:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQRu-0003cO-W1; Wed, 19 May 2021 13:57:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQRt-0004dJ-Ie; Wed, 19 May 2021 13:57:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p7so11203104wru.10;
 Wed, 19 May 2021 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/2sPs+ru2T4x3kpaPoLZ4bxZnL9mzLFOYVpuWjbVtWM=;
 b=InPNeW9DTJOzXF2r7VXxqLHGdYyHRM4r4quC5VwRGUfFw9vTAmHJX6aCPirULXiLXN
 cefPUf6T2wpAjZy+5plcMxpvn07zDWS3oXpylalpHkz3+uAaLGp12QaPOVMecU31+Ljo
 2BAu4UbNFhVTonfvrAGuwFXSVss+GOl3J+AqDHoFlABGyVVHqDaK6HUecsMWsYoDwxdW
 Dk/cZWuFUnX44zeAtXPYJE9U+yU48feYq6bDdoLDYOBCQNlQ2J4jofh33JXw//ylFaxE
 3Z9Fnhvi9JX9uAbJ6GE7G+/Q89gJPZsJXCvIZLzULLmokcaK9EouqJX6a50Iahkky9m0
 Umfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/2sPs+ru2T4x3kpaPoLZ4bxZnL9mzLFOYVpuWjbVtWM=;
 b=aJYq4lqKFmWObMtUiQ7x82RWwDIYcurYUctU0kRwKmNGQXDKlELkGvolkW6vtTLePv
 MVDG0YJg5/NH1KYXZpWRvsPt1uAn0VYLK6o2NmGJswtxyD+A9a0L/Fig6PlXhjA70Ytm
 owP55Bp3oJTuQjouByNZsDzDVyA967eEzFF9mebrenCJNTxqHwArqQGF3iugezBJCqyy
 xqoNSeID6hNmvVe1bxS7lQRTc+qsAlSJK9l3aQIyWEMxk8xuEFlHXSAXIz4D4sYNsMmA
 eY9kaUgwMThq152+T2nTfV0Gi6jLFkNIjjVqlHd8hCvV8Dt9oXyMYe1WT9Hxbx57BbFw
 2BvQ==
X-Gm-Message-State: AOAM5322yQo8c71omNdGRa0mjt6wid0ZwdCMRJKVMd+RZ3+0xCBXBfRF
 Zx5hkhhFF8SBAxy3H8EaRngaVoKMRL2wxw==
X-Received: by 2002:adf:e484:: with SMTP id i4mr132614wrm.117.1621447055195;
 Wed, 19 May 2021 10:57:35 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q186sm163538wme.20.2021.05.19.10.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 10:57:34 -0700 (PDT)
Subject: Re: [PATCH 1/3] adc: Move the zynq-xadc file to the adc directories
To: minyard@acm.org, qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>
References: <20210519000331.3690536-1-minyard@acm.org>
 <20210519000331.3690536-2-minyard@acm.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b08ac221-e8fa-fbc0-5dbc-158841c79405@amsat.org>
Date: Wed, 19 May 2021 19:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519000331.3690536-2-minyard@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Corey Minyard <cminyard@mvista.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9hIIS1MzGHyg

On 5/19/21 2:03 AM, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> It's an ADC, put it where it belongs.
> 
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  MAINTAINERS                          | 6 ++++--
>  hw/adc/meson.build                   | 1 +
>  hw/{misc => adc}/zynq-xadc.c         | 2 +-
>  hw/arm/xilinx_zynq.c                 | 2 +-
>  hw/misc/meson.build                  | 2 +-
>  include/hw/{misc => adc}/zynq-xadc.h | 0
>  6 files changed, 8 insertions(+), 5 deletions(-)
>  rename hw/{misc => adc}/zynq-xadc.c (99%)
>  rename include/hw/{misc => adc}/zynq-xadc.h (100%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


