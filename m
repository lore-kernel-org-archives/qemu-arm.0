Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp291714ejf;
        Mon, 15 Jan 2024 06:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEg2KthqioQz/YYgMgF93lq44YmE8ZVf/B9NfXzfeszXYnmSO4V6TwKzPuCPKJ2Z82VD3IC
X-Received: by 2002:ac8:5b95:0:b0:429:fe77:281 with SMTP id a21-20020ac85b95000000b00429fe770281mr308063qta.56.1705330542767;
        Mon, 15 Jan 2024 06:55:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705330542; cv=none;
        d=google.com; s=arc-20160816;
        b=rUV09wLkTs0Tn1K0kTsD9ja9QzwnRgrC0oBO2YEa4vRC4HOnxUc8Hj5rnRGWiK/Zta
         UBcc7PNa/7KxC85mJZgEK598AKoAc6hboNhW9xoyRD6OYi5qBgDgi3QohTuqflKgAt/I
         /u6IqppiKX+SONH4y6bR58JTiyI7k5YMIDRnjnLpRFlLelimnwqLpppIRcN+ZC29Iylp
         f5y+ZO8169B/lCnoF4do8K8M4lE8evtqDDJplgEg5yrFISJGnVT4SVXTQrIH036yrl9r
         Q36JOqexIVWnpaxV2T60bfVNiQP+7IJUW+RO5PgCJuyIFJEgGUartQvQwzGKZUI06QP8
         EflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=H90HepXVuN50YA2VsD9tKOdxJr+tq6sKCejavwIReAg=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=PLkq4nDrkdLq25sn1c+Ssfe0f1g1vuTF5wKBfw7L2KvTYR10Td4MxnGeqEUjkLCxfL
         OjITG+E7Yt2IqJJmlCRG0gJr/Q9Ekpt36R+kkXw+i6HBfDCibzo/+3CV3U3yhW66EQfQ
         /82zHX/w1gszpP+yfmVzaiu1IFz91IiImiLvdQf70n1Jj9uagfZHyipkL61kOA/alV2D
         ZWovMwOZnJ8e0jl9gh5jhP+mE99USCBW+9jOGvlMlx2lFaHIL8HmdKhCPFdk+1LaPAYX
         FXXA7vI69un9naWtaj6riYoxVor3hJO4fwzqiSnImz0jgj5oj+TiK96ww1wEgf2ffvuM
         jMVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GrjW7B4h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a05622a010b00b00429fcd90a7fsi490825qtw.321.2024.01.15.06.55.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 06:55:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GrjW7B4h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPOMx-0003K9-Ew; Mon, 15 Jan 2024 09:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOMw-0003JB-B5
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:55:18 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOMu-00078y-LW
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:55:18 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5592d72ede0so1301292a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 06:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705330515; x=1705935315; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H90HepXVuN50YA2VsD9tKOdxJr+tq6sKCejavwIReAg=;
 b=GrjW7B4hgc9VolOeCeQduApzj+0KPFXqylzAgbmEZW0rPFZevIqaxLGrOuI+5yoDxe
 0NR51IdkpnetGi7uSErWnJiHeEVUIGm0XdT3dXoBM1BJ8rjQjVwLqoHzPPIGP25WfdpM
 /Bain8t6hi6J4qmmWnUz+mt3Kd/jJjq2/P9ObUzD+Kig2MRZyJuNhjtBdqTbKbpXjsIJ
 uxn59UhQD1sejsa5u4nlxvo04VxWUxAeDScu2epdQg9TID15nTcc/zHFS49smqbD9gJ6
 7zPml9pzfBMQQMCmBhyxojxm20W4gI/QIQrY5OGKXC+T5VlpfQAQ9r/xTdw7tjQPNwLH
 ZeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705330515; x=1705935315;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H90HepXVuN50YA2VsD9tKOdxJr+tq6sKCejavwIReAg=;
 b=vEpYj/t0bcyR8mQDKQ0Ez49pkX6+wQaD4Va2HVMPJyQ1xsp6Qc/eFOpHBltkrO4lKF
 CCPxSoDZnFYMmhFEz9hGR5GS1UDRRBD5NpXXlcCATnXi7ntm4SISoEK+ascLW5L4wG4t
 ZRFpyBsPvl47h3LRI3uWkHEo1+quTp54HQH2rCrUsJT1ehouKHQ3vArIeE6S+xeEPZWV
 POJWeb3uLwDZ1lf2yAa58FEFYih2HGY0+Su9QQUL605bQWaIa5JsJAMnROJ8QwfyTzQo
 SWBycZk5EaRZkqagS93KZjjGGeRobP7KDBnuW+7B+d+JoaSjr8cM7ioy9JQlQ75yiC3L
 Iz6g==
X-Gm-Message-State: AOJu0YyeGW5Lx/aTb//aVjSnaKyVLjFsmTd3VUrHZdJh56QqlQDg0DYH
 26ADzPpKsKH93aNDFNQFHOINjN/41NWDCkyio/IlrPVZwNh1/Q==
X-Received: by 2002:a05:6402:1c9a:b0:559:2d1b:9be9 with SMTP id
 cy26-20020a0564021c9a00b005592d1b9be9mr1008719edb.50.1705330514939; Mon, 15
 Jan 2024 06:55:14 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-37-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-37-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 14:55:04 +0000
Message-ID: <CAFEAcA85ix4CoTs5VxhXm+KARdkeQtSq7SncyGwGOKp1zLCFkA@mail.gmail.com>
Subject: Re: [PATCH v4 36/45] Add mailbox test constants
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: DWDV7QxudgsK

On Fri, 8 Dec 2023 at 02:36, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mailbox.h | 139 ++++++++++++++++++++++++++++++++++
>  1 file changed, 139 insertions(+)
>
> diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
> index 1d02ca9c2c..8acc4bd2ff 100644
> --- a/tests/qtest/bcm2838-mailbox.h
> +++ b/tests/qtest/bcm2838-mailbox.h
> @@ -7,6 +7,145 @@
>   * See the COPYING file in the top-level directory.
>   */
>
> +#define MBOX0_BASE 0xFE00B880
> +#define MBOX1_BASE 0xFE00B8A0
> +
> +#define MBOX_REG_READ   0x00
> +#define MBOX_REG_WRITE  0x00
> +#define MBOX_REG_PEEK   0x10
> +#define MBOX_REG_SENDER 0x14
> +#define MBOX_REG_STATUS 0x18
> +#define MBOX_REG_CONFIG 0x1C
> +
> +#define MBOX_READ_EMPTY 0x40000000
> +
> +#define MBOX_CHANNEL_ID_PROPERTY 8
> +
> +#define MBOX_PROCESS_REQUEST      0x00000000
> +#define MBOX_SUCCESS              0x80000000
> +#define MBOX_ERROR_PARSING_BUFFER 0x80000001
> +
> +#define TAG_END                    0x00000000
> +#define TAG_GET_FIRMWARE_REVISION  0x00000001
> +#define TAG_GET_FIRMWARE_VARIANT   0x00000002
> +#define TAG_GET_BOARD_REVISION     0x00010002
> +#define TAG_GET_ARM_MEMORY         0x00010005
> +#define TAG_GET_VC_MEMORY          0x00010006
> +#define TAG_SET_DEVICE_POWER_STATE 0x00028001
> +#define TAG_GET_CLOCK_STATE        0x00030001
> +#define TAG_GET_CLOCK_RATE         0x00030002
> +#define TAG_GET_MAX_CLOCK_RATE     0x00030004
> +#define TAG_GET_MIN_CLOCK_RATE     0x00030007
> +#define TAG_GET_CLOCKS             0x00010007
> +#define TAG_GET_TEMPERATURE        0x00030006
> +#define TAG_GET_MAX_TEMPERATURE    0x0003000a
> +#define TAG_ALLOCATE_BUFFER        0x00040001
> +#define TAG_RELEASE_FRAMEBUFFER    0x00048001
> +#define TAG_BLANK_FRAMEBUFFER      0x00040002
> +#define TAG_GET_FB_PHYS_WIDTH      0x00040003
> +#define TAG_TEST_FB_PHYS_WIDTH     0x00044003
> +#define TAG_SET_FB_PHYS_WIDTH      0x00048003
> +#define TAG_GET_FB_VIRT_WIDTH      0x00040004
> +#define TAG_TEST_FB_VIRT_WIDTH     0x00044004
> +#define TAG_SET_FB_VIRT_WIDTH      0x00048004
> +#define TAG_GET_FB_DEPTH           0x00040005
> +#define TAG_TEST_FB_DEPTH          0x00044005
> +#define TAG_SET_FB_DEPTH           0x00048005
> +#define TAG_GET_PIXEL_ORDER        0x00040006
> +#define TAG_TEST_PIXEL_ORDER       0x00044006
> +#define TAG_SET_PIXEL_ORDER        0x00048006
> +#define TAG_GET_FB_ALPHA_MODE      0x00040007
> +#define TAG_TEST_FB_ALPHA_MODE     0x00044007
> +#define TAG_SET_FB_ALPHA_MODE      0x00048007
> +#define TAG_GET_PITCH              0x00040008
> +#define TAG_SET_PITCH              0x00048008
> +#define TAG_GET_VIRTUAL_OFFSET     0x00040009
> +#define TAG_TEST_VIRTUAL_OFFSET    0x00044009
> +#define TAG_SET_VIRTUAL_OFFSET     0x00048009
> +#define TAG_GET_OVERSCAN           0x0004000a
> +#define TAG_TEST_OVERSCAN          0x0004400a
> +#define TAG_SET_OVERSCAN           0x0004800a
> +#define TAG_SET_PALETTE            0x0004800b
> +#define TAG_GET_COMMANDLINE        0x00050001
> +#define TAG_GET_DMA_CHANNELS       0x00060001
> +#define TAG_GET_THROTTLED          0x00030046
> +#define TAG_GET_NUM_DISPLAYS       0x00040013
> +#define TAG_GET_DISPLAY_SETTINGS   0x00040014
> +#define TAG_GET_GPIO_CONFIG        0x00030043
> +#define TAG_SET_GPIO_CONFIG        0x00038043
> +#define TAG_GET_GPIO_STATE         0x00030041
> +#define TAG_SET_GPIO_STATE         0x00038041
> +#define TAG_INITIALIZE_VCHIQ       0x00048010

We already have definitions for the tags in
include/hw/arm/raspberrypi-fw-defs.h so we can
use those instead of defining them over again.

thanks
-- PMM
