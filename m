Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2378020ejc;
        Mon, 9 Jan 2023 08:06:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt3ruahfS0QUbwuTbpClHSldxVplzd8fGGL5/tyytK8VGMVmvLUHe3iOGHcGXJgIx1yZF+K
X-Received: by 2002:ac8:5383:0:b0:3a6:6eb7:3347 with SMTP id x3-20020ac85383000000b003a66eb73347mr88015642qtp.19.1673280371474;
        Mon, 09 Jan 2023 08:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673280371; cv=none;
        d=google.com; s=arc-20160816;
        b=NmzTSh9UajvJdDfrn9w49BHuAdUpjUpM5640MOuW92fMCVUsSngV3hifXVx1oWP9Bu
         ZNKjT1qX0DSOvaelRrLsw2lrR5CScYbNEBVOf9Co/aDGFopS7+k4BGQbcP/pRYR9MQ5P
         G/npBD/tfHT/ibKrgE1hpr2eFF1j4OhTKKX56+6r6kq3ebgEQQaAuO9O4hHGMyNkYGXx
         vIctek/KCjooaa8zkT3TqiY0xuZhxgJ9CAoJ4UJ2GfMsL+HhbhmyYf08Sb8xzYUawUgF
         aF2G1afry2W2VDT4/r734Eq1IBzzavbMZOy/FBgKy3ETDvXCzVxhiXJDXhGWfwpg0yLf
         DJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=K8GhjQFjPnNzSCtaTubPnA/pMiRXT2J3GTIJ4LQAXIY=;
        b=VyRROnmhEib5W7S1VHhOD+8ZRZeaNOIu8osSTGxg0gt9FiCb0a48fHaTn9g9bZHi1R
         ckDDFlh8KyJuP4Gzhkh03lXgF+6hobkHXCzBPowH1yoabpGNa9e/uMMOwPdHSObBWPjq
         EXlOPc4BRD8rX1j4hTk6r1a9c1aBdM+p71xY+R7cRPKGmTqdzbSpzRASg9toc5Llj4i5
         7YhQcIKqgrGS7C2XSzYm70mJmKEhlg9wiyxU/f1dPweCLcGPfKiUfQp4v2AyJQZj4iR9
         LpxX/4GqfcpmVt9VqxR/9PvfI49RxRxDht87D09chBSkF7q0VSjxKv5JoFiCCIbk7eZy
         NvWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GNMshD/U";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q33-20020a05620a2a6100b00705b2f4294csi2338705qkp.115.2023.01.09.08.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 08:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GNMshD/U";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEuec-0007ss-HY; Mon, 09 Jan 2023 11:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEudy-0007gO-9N
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:05:21 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEudv-0007aa-FW
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:05:00 -0500
Received: by mail-pj1-x1034.google.com with SMTP id dw9so7786770pjb.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 08:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K8GhjQFjPnNzSCtaTubPnA/pMiRXT2J3GTIJ4LQAXIY=;
 b=GNMshD/U/RuLJMjgNGn5yl1hNABy194MBvDAUm1fuOq/zyCiAjNGCn+ps/N9npkr9A
 GmOP2IeQAdXJZaKqfXTkbGJ7Tdws/yaWdLSveCF3twQiJdZipu2CwyiSC+icnyOd80Ma
 ua/tjOw+5hr0YlHIldHf65P3a6G9S5C8gEW5GRC42pKYqMM/1LYQJeTyKTXSMXCyTlBp
 GV4edIl1eZvdncJhYKWg5Zs7nbZoqHgcHYz6HeouFkR79RHCcBEM3J+FWvMBadaaWkrZ
 RMpku5oOIOb9eHDomA49sZ6jjVqvwRlO7UnEyu/b+LaJa47nWc0U6qoR0UX+DfosOH/8
 5dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K8GhjQFjPnNzSCtaTubPnA/pMiRXT2J3GTIJ4LQAXIY=;
 b=G3EyvHL+EJJDu+x3dAs4SanDaPR3AgGgdXR1Y6GWhu8tXa94eJaiSCVu92bM04amDn
 pZYNo87QoMt6vZDmLr3x9RjjvRVhYF0VtDkPZWiLR9NShVrb64GslRdPWXu9voBT4KRX
 441a1rSFZM3hzr7IEkwLbh8pB1eQwIZ02/f50hqGeEDPcDJ4HG+FMBqW3inJB6RMkxuj
 kPK2qWH4hzW3M3XdBRHS2q87HlP4cTwIUHoFH+qcSMmn2FH3BofXLVRjjl3QyXZentJD
 eJFpOO7kaBnCKM9dMeiDov1rFRD9EpZLxWWhvN8cZ0Hdhp52jKz4TO3K6IEsQA/QEQxO
 vglA==
X-Gm-Message-State: AFqh2krZFrsoBjOWlnbYpPggG+Wyf5Tj1qJ3b8PJLz6l5YjR5JThIoHv
 xftqtNl82yl3zpDpbYoKh4x7+A==
X-Received: by 2002:a17:90b:428e:b0:226:d023:26e3 with SMTP id
 ik14-20020a17090b428e00b00226d02326e3mr14692250pjb.16.1673280297890; 
 Mon, 09 Jan 2023 08:04:57 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a632048000000b0045ff216a0casm5302751pgm.3.2023.01.09.08.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:04:57 -0800 (PST)
Message-ID: <a446d67b-ebf1-a95f-0c09-221fede05e80@linaro.org>
Date: Mon, 9 Jan 2023 08:04:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5xuHGYb0VrB+

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Define TYPE_GPIO_I2C in the public "hw/i2c/bitbang_i2c.h"
> header and use it in hw/arm/musicpal.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/musicpal.c            | 3 ++-
>   hw/i2c/bitbang_i2c.c         | 1 -
>   include/hw/i2c/bitbang_i2c.h | 2 ++
>   3 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
