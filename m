Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2195149ejb;
        Mon, 13 May 2024 06:41:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0C3K8w2Z4uqIE/bfl/+1QCorU2Huj4gigp8HORwpLOXTIvYNQIaP1cwjwOSJbrEnk4TsiuZ+qz10u2fNYobvVn6e4H957
X-Google-Smtp-Source: AGHT+IH5ok4mRrLuijhVpwCB7XW5ihem862tOeyZcRot67UxgwK2QEx5sIgMThIG22dJRVHXsIu0
X-Received: by 2002:ae9:c304:0:b0:792:ba91:3d44 with SMTP id af79cd13be357-792c6ec6b34mr1521851885a.33.1715607713428;
        Mon, 13 May 2024 06:41:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715607713; cv=none;
        d=google.com; s=arc-20160816;
        b=fVBiL79cmDeEO9beBGNLYkVEfH/sH1I4s99zA45H8K8V8et9QRg2qqa5hDsmugI2+Z
         vSnX2dKCreMW3Jvun36odMM8SwPtug3GPxFdG/8XgKl14qgzlYhavS3PMdPcYfY37AYd
         0d8FHJML+wh98fIyFIN0hV/hQu59Wvzz1a+jzJVj740NZUGb+6iwIXj/EG3lgEzmJJ5J
         jHb1k1e8dP+fDE4BCr3AcTudiHWJMQF1SHVOI7KwA6zickQT+NtvHnli7T0Z1+w29DN8
         awext/uKobvqoeLtzJchb4mtJqPcM+RnuuHhTAiwb8GErvU3ZIcxLJ3gQ59I/1s02bbn
         W5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LTcvkcGoJa9SjRoiZfIOFpHNX+KWpDkP1lMhvhEzBno=;
        fh=/Zh2aMIHM1w1IbiaYd7oB83UJZ7QBsJsyoerfExGvU8=;
        b=d8MdwXIca8HPqfpWRWky+JM5aXFrC9U0MTtllk9xN9xgNuU4d/ZuO335tlrtL0dKbV
         /Ji/cRU0J7Hw3iID0/mD/94/Z2hns1ka3PRA/kL6oz8Nj308zl4euXymWHb7ShfaONvt
         GGfSb9x7itpL/Qwdp+fDu0XVvLUS8aynNkDyn0WkMj7TdXkkbzWOCVNfFMhZ5V0u/OVf
         B03LtHJKdXdpAbdtbWgh4HGGwgz6rsQpru5y2tJjrjkKa0NOTh/SET5dr9/as6Yp6gnQ
         AvNOtpVcEiA/YZLxHiSzl++7nyZny7rIwCoV+TDPiYSrjf1p8SQTVT9YSPKa7NqVM7sO
         JTIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EwyQ/Xde";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf36260bsi1069050185a.567.2024.05.13.06.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2024 06:41:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EwyQ/Xde";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6Vvp-0008Fd-6x; Mon, 13 May 2024 09:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6Vvo-0008FO-A7
 for qemu-arm@nongnu.org; Mon, 13 May 2024 09:41:32 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6Vvl-0000Hg-Mb
 for qemu-arm@nongnu.org; Mon, 13 May 2024 09:41:31 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42011507a4eso11778195e9.0
 for <qemu-arm@nongnu.org>; Mon, 13 May 2024 06:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715607687; x=1716212487; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LTcvkcGoJa9SjRoiZfIOFpHNX+KWpDkP1lMhvhEzBno=;
 b=EwyQ/Xdef1OPyyLZ+cLMbP8ihD+G9GO0QDppWrnIOi5S7FI+ZcBK2OoysyewBSIAK9
 l0bRekT02wleY8v1WehHQwBcO1EkZjDmAU8JbSq1fUBh8Tp9JR5g+4qBS3HIrYNxkiHC
 YkyZEXcgEzLrIOZK6cPeJ/+eG1oVtJrnNFU2DxQrAEljwCkGxhDQKqyUW80ugKtuw3Ic
 lP0gvLECoeeGzx/RRscRDVj3gTLjeXsnzaSZ9RyXdYUvLcTPiM1B3zoT9yznmQrv3lir
 mjkfKzQU2T9jMUCDo9xlNx5wa309Ju1uyCKwuzHvDXr7TIkih4bnh2iqbfEYwlsuRIVR
 i5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715607687; x=1716212487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LTcvkcGoJa9SjRoiZfIOFpHNX+KWpDkP1lMhvhEzBno=;
 b=QEgmPZAQkDpRCFnKeqgivKDUxsp24eLpASdthAHspoT/YTUy6i51PeFT11qDY86eJg
 d0kK2+pCf37+r0itouUvJhGrDvuyewuQr+lvWy7vuAgBzz+MjInHiEYVnEeBIt0Cp4NN
 TIJWoIC4TqPL8fdaH6PQb6Afdjrg2HYuit00ni2d8Bg2a50l/NlnpkR1kCO/N0AbhbEh
 c3ANnGDVFAKqbBuIuWlwGnFGIZrs69lnHJWdlh9N3eVSWuhXguzRUdOsaoX27saQNS/H
 IlbwMYoYFPAQb1+1GuMK8gsZl9wNKONXbyrJfeVM/L+zGVoi2yPggjunXnLWEquwjj88
 nIKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVjQ/BVQ7Ns3JiCGdZ8rJtoZ9TZzOtDlhcALoi119F/xbNQpwUcZSVOddvq3zTVBZg+3Y196g07AOk9rZJF2ekv6s/
X-Gm-Message-State: AOJu0Ywer8IV3kb2dJkcKFlYm5wC9aL5EXfiZl+9nGZjbdsuNjIcRpJs
 KtYeOxdiqM7XjaCGgpgdpRLLLc7b9c0pNq1oBuGoYIYxkZDmwlpChuIJTDGOhe8=
X-Received: by 2002:a05:600c:4f04:b0:420:139e:9eda with SMTP id
 5b1f17b1804b1-420139ea0c7mr31495905e9.12.1715607686728; 
 Mon, 13 May 2024 06:41:26 -0700 (PDT)
Received: from [10.1.2.72] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccbe9080sm159947225e9.5.2024.05.13.06.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 06:41:26 -0700 (PDT)
Message-ID: <dfd1df94-0d6b-4e44-a392-e1e5fc382955@linaro.org>
Date: Mon, 13 May 2024 15:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/arm: Connect OTP device to BCM2835
To: Rayhan Faizel <rayhan.faizel@gmail.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20240510141010.656561-1-rayhan.faizel@gmail.com>
 <20240510141010.656561-3-rayhan.faizel@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240510141010.656561-3-rayhan.faizel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: QJqS0t2OEV2+

Hi Rayhan,

On 10/5/24 16:10, Rayhan Faizel wrote:
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
> ---
>   hw/arm/bcm2835_peripherals.c         | 13 ++++++++++++-
>   include/hw/arm/bcm2835_peripherals.h |  3 ++-
>   2 files changed, 14 insertions(+), 2 deletions(-)


> @@ -500,7 +512,6 @@ void bcm_soc_peripherals_common_realize(DeviceState *dev, Error **errp)
>       create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
>       create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
>       create_unimp(s, &s->bscsl, "bcm2835-spis", BSC_SL_OFFSET, 0x100);
> -    create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);

Maybe worth noting in the description, before we were covering a range
of 0x80 and now 0x28, so a range of 0x58 I/O ends in RAM. Maybe better
keep a region of 0x80 in the previous patch?

Flatview diff:

(qemu) info mtree -f
FlatView #0
  AS "memory", root: system
  Root memory region: system
   0000000000000000-000000003f002fff (prio 0, ram): ram
   ...
- 000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
- 000000003f20f080-000000003f211fff (prio 0, ram): ram @000000003f20f080
+ 000000003f20f000-000000003f20f027 (prio 0, i/o): bcm2835-otp
+ 000000003f20f028-000000003f211fff (prio 0, ram): ram @000000003f20f028

FlatView #3
  Root memory region: bcm2835-gpu
   0000000000000000-000000003fffffff (prio 0, ram): ram
   0000000040000000-000000007e002fff (prio 0, ram): ram
   ...
- 000000007e20f000-000000007e20f07f (prio -1000, i/o): bcm2835-otp
- 000000007e20f080-000000007e211fff (prio 0, ram): ram @000000003e20f080
+ 000000007e20f000-000000007e20f027 (prio 0, i/o): bcm2835-otp
+ 000000007e20f028-000000007e211fff (prio 0, ram): ram @000000003e20f028

>       create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
>       create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
>       create_unimp(s, &s->v3d, "bcm2835-v3d", V3D_OFFSET, 0x1000);
