Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1727132ejb;
        Tue, 23 May 2023 01:52:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KCcBDEB9WW6t9qEJvAIuMWHKDSHOzpyoykIs1INTfNYPxdpX2Erx3quZNYt+33Q6jRfsh
X-Received: by 2002:a05:622a:199b:b0:3f2:1036:78a6 with SMTP id u27-20020a05622a199b00b003f2103678a6mr23968741qtc.26.1684831970943;
        Tue, 23 May 2023 01:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684831970; cv=none;
        d=google.com; s=arc-20160816;
        b=boFjVviBNfqu3z4/7S2Dg5GVCPh/ql84Se2yiFe5V9ix/FpebA1ppz6mks8OIpXF5C
         9CN1YFVaWFnaobSrlQS30KrNaFWSpS2JLzxmvkNj4uo15emsSPos0DPd4U2I9JQp6EXc
         FSrOhNaNvCT6jmH5A68MBP5E8R+pyyDJHKtap1wsV+3VD19lPFszS06dlxnZHqg2MGk0
         HJ6yB4P1cdSeDxMVG7x8ZTmpX4DFv8pSR43UFlOrpJ8gMqV60OLjmf6YHuwt+DaeaY2l
         5pTw3SMzr2fLEPZGXcg6M8g/VuxdyvHQvRLNa+2Y4t6gegRMHEENFyT/W2ecV7ImCCZ3
         vj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rYJafVqFSXzIBZK3HQUrG2l2qkIP+m/o36QVuS12J2M=;
        b=jFojB+m9bgtPK+X+dcDdaqVD1K7IzLl5Ck85mSu1VC9wVvYjUU69/GOpgnhJPBn4+s
         1lphiT8y9qtAsdc3DtDRvOA/XkXBWj2RfMt3UlTpSvWbtBUNgy2kDHupUQzsg0e2Mv/8
         v1x40MO15R7VwH9ZozvJ8qNh/MEzAwQrvYZ6607XpLXd4p3cQ6ufSXM4iacxTU4hK+By
         BMHx5v8a3mEZyqVwAlyVXLr/owwUE7ntD+bAf907eTLoWl3lNDtrX18bVW5uQ8zo3NJ0
         LDceYDLoiFXWXqvuJhZ5fLFCh1Wz2hZPhCV6sjyEgSZh4u1ltuPbU4GPyN58VPV568lc
         JjVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Af6cEFUS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a0562140d6400b005ef46551916si4782079qvs.413.2023.05.23.01.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 01:52:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Af6cEFUS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1Nkx-0003Dj-Ui; Tue, 23 May 2023 04:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1Nkw-0003DO-OX
 for qemu-arm@nongnu.org; Tue, 23 May 2023 04:52:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1Nkv-0005G5-3d
 for qemu-arm@nongnu.org; Tue, 23 May 2023 04:52:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3078d1c8828so6807596f8f.3
 for <qemu-arm@nongnu.org>; Tue, 23 May 2023 01:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684831951; x=1687423951;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rYJafVqFSXzIBZK3HQUrG2l2qkIP+m/o36QVuS12J2M=;
 b=Af6cEFUS5Tg9hpUKM/MV416B4LyCWaK2rBhQuJYTLP0FdCGMzlaco70J7sul72MNT+
 KePB+6pf4tRG/HVDN4Rrj8MVjoZDFM+wVfx8J+6KqKLQ5yktEroHXrSEnScUvX9onRyx
 ncR6l98M/F0rIDcd2j4zq4i4ZNgJIgszXFiT6x/HDdGGx5fFitNr/CTVV9ec+pbHKP5m
 ekNuvPgKH2ytQMLVML6metr3lgqeG2Q8nR5VcgSohqCnl9KS/007AW+mkbCCl7TIqzb6
 bWeLpoQiJCQ62y0gE06yk1mdSPRQyNUnUht0yUNKYxbX5Dk5ZBUANnZuDzDDyaWMCd1P
 X8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684831951; x=1687423951;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rYJafVqFSXzIBZK3HQUrG2l2qkIP+m/o36QVuS12J2M=;
 b=mA5qvK5HjiwzpMxcV8cqKUm84Zv9++L4URUKdrcMnwPQeayIgXDHGCGENTiEXDwSDp
 et0Z3L6Ict5mGlVHDmASFsaGwl9o60cVkC3Honqv0iociNSqDQ82Ty7TeBQf7MpKjbpL
 jZH3F48q2EDFuhrTgpaQR8b4n4Y72wXdoFGWUdslyMNcnBAiAnE1LG6KliBETqzUguA+
 CKoM+Jekq+f21okiV3ys5+T8viyfrGhON5BMKl5LbqsziMqc3+hz+7Ma3y+Lgm/L8VHB
 /QGKGQX1XuNh4zSic9wRY3D7endO/pbwDx3LtuADgnSSKXkBu6J2+zIuEvPh1+bP4xoh
 W0Gw==
X-Gm-Message-State: AC+VfDwlOz5KCQb9qfGS6q2xUWy0Oj4+pnUaX3nPjGmG4Xe1TTx4ZIJk
 kSNZXBbkx4/HQmZxysiYGV9DPw==
X-Received: by 2002:adf:ff90:0:b0:309:ccad:b2fb with SMTP id
 j16-20020adfff90000000b00309ccadb2fbmr7575566wrr.5.1684831951373; 
 Tue, 23 May 2023 01:52:31 -0700 (PDT)
Received: from [192.168.69.115] (vil69-h02-176-184-48-94.dsl.sta.abo.bbox.fr.
 [176.184.48.94]) by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c4f5600b003f07ef4e3e0sm2803110wmq.0.2023.05.23.01.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 01:52:31 -0700 (PDT)
Message-ID: <df00a5c0-7b59-e21c-c758-b1085d0c50b7@linaro.org>
Date: Tue, 23 May 2023 10:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/1] Add vpd data for Rainier machine
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joe@jms.id.au
Cc: qemu-arm@nongnu.org
References: <20230522153659.3379729-1-ninad@linux.ibm.com>
 <20230522153659.3379729-2-ninad@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230522153659.3379729-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: mUchxcbXd61+

Hi Ninad,

On 22/5/23 17:36, Ninad Palsule wrote:
> The VPD data is added for system and BMC FRU. This data is fabricated.

Per 
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#write-a-meaningful-commit-message:

   QEMU follows the usual standard for git commit messages: the first
   line (which becomes the email subject line) is “subsystem: single
   line summary of change”.

In this patch the subsystem is "hw/arm", but you can also use
"hw/arm/aspeed" or even "hw/arm/aspeed_eeprom" for subject prefix.

> Tested:
>     - The system-vpd.service is active.
>     - VPD service related to bmc is active.

   ... more detailed description of the patch, another blank and your
   Signed-off-by: line.

Missing a blank line :)

> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   hw/arm/aspeed.c        |  6 ++++--
>   hw/arm/aspeed_eeprom.c | 45 +++++++++++++++++++++++++++++++++++++++++-
>   hw/arm/aspeed_eeprom.h |  5 +++++
>   3 files changed, 53 insertions(+), 3 deletions(-)
