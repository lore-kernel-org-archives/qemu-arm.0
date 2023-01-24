Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3605577ejc;
        Tue, 24 Jan 2023 03:56:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/5QmzRf6eby/bvgAsVbUcI+jgFgBbzeFW6oYBQF/kZRHj5dJ/6nbLvh+Z02X8TLsD+vmW+
X-Received: by 2002:a05:6214:303:b0:537:6e3f:dbd2 with SMTP id i3-20020a056214030300b005376e3fdbd2mr711577qvu.36.1674561406911;
        Tue, 24 Jan 2023 03:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674561406; cv=none;
        d=google.com; s=arc-20160816;
        b=w4nxfhyjGt/9fTw8NBylQKH5FwfT6JVbzw5c/NaLtHpqfiUAHwJX2FFyLFD/lnRaw7
         j+p1cpSvCy2fJZmmUQCZsP/3lcZZChWoheSNxyAki8wxXlZUBd5AcwInjmdJIQu868u4
         0w6As3Vme6PCaUxldedgHuxMhLZVbq+69IQ6f4gvPyoH/LhXrur/5zxxylv2NuxtIbYk
         jYRFYPTv7OvS6PK4p7q4MHO4VthEVkRhLz17SCHwM2Gr+OU/rm37s+Gn3iAYyDTNiKoj
         LMoydnNE+ZDpel0XePlUtpFUj1W0QKIHiRJ7IoSyg23mWuNIuQ+nYF+XQD1erLGkdm7j
         v/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=K9nGfY0WRUUQdPwnTNpoeQlNagLmQVYGJa9Dvnp2Q8M=;
        b=borSqPTRg7TWGznR1Uw8ZkRCYZvMK2XNe4rlIaUXe+Vh8Uy7gpFpVxWQ5PzNKZT74w
         MEZUR8pvN8THS1ldLmHbaWXW99vQHYJE33PjLGdXbcDIr55UYuYXGtAULkQgm3eKeNsE
         IXhrDRJYhrADU1DvMGvJj//Te3OHFDT3CDZoONjoldVgMECDjNcXrOzGysdHykNNu0BP
         AIoZ6MkCXI3g1diC6kThDziQoD8kixE4zljHl1rrRQQy9+RhENXMvRCDkNcxlh8q1iCb
         LbdTvv1Lon5TN735oso1Le8SleyAabiecRfmehiTh1PtO8sFEDVyGDryX1tSKLxeLMAc
         mhUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zJ6pokNd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t62-20020a375f41000000b0070673f9c62dsi1747766qkb.104.2023.01.24.03.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jan 2023 03:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zJ6pokNd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKHu7-0004Vn-6K; Tue, 24 Jan 2023 06:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKHu4-0004VS-LM
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 06:55:53 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKHu3-00016G-5A
 for qemu-arm@nongnu.org; Tue, 24 Jan 2023 06:55:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso11155248wmn.5
 for <qemu-arm@nongnu.org>; Tue, 24 Jan 2023 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K9nGfY0WRUUQdPwnTNpoeQlNagLmQVYGJa9Dvnp2Q8M=;
 b=zJ6pokNdAQwVq6Eyr3NCDjqbg5VOf8YvQJ0XLsMg9BzKn7JyrrfK7Z2vDBiKq3ehJ9
 hraby34AgQGsoOHDuOeeV+3fcCdpIKOxarQpIKROIH0ySpun1I6KW0Wlbr0gTw79yw+4
 31YKW9k2IUQvmqXH1KiSHMbSsQuzUrkUpFYcT93RGmqM85sxtkAk+i+KNFCeRG6ArdoS
 YVJE0ExhCR4gelzcaxt7DWVzO8XOHC8jLJsnubNYSl8QUbsFtiSvrZVej+UzsRjopv0o
 qHD3KSwsfUPu0P3uo2d7/W1K6T3ptvkAT1ZI8ZjoXW51dPgMklP3p/+yD0x59cvyps7U
 W11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K9nGfY0WRUUQdPwnTNpoeQlNagLmQVYGJa9Dvnp2Q8M=;
 b=HDqTk+ll1jjkv1Bo2Uql0kvYv1gd8ugQUK8D9butPumB/EgYg3Ffno6O4COJCQeGak
 fbVgjTZgmhqNUS3iFHKtjAECnRRxnCCrFswumGj/i3RxRqSReivJK4t1Y8bGg7mjggmi
 gt+PAy2xJHILaEyHLZZlkQ+FvmPGmFLUoaoZPS4gM532lNqiaoVCL/fbgYDQ/+XSBfM/
 F9MvKL3xqvya9XElqPydO6CVDjUoPXClTt+uxa7mpNnJsI6ctp33OSWcYPGHB+6w8bpI
 Hx1NTU/i5ZOTfEkEKxm3Zbw7fAWNFeEanwY05ss42KkcYnMc07mPgQSJ+CJdYwE2DfvC
 DpyA==
X-Gm-Message-State: AO0yUKUwbVHA8lQybST9Zdc8KU0n0mUg+VfPJj1ztLIUXkJ6q2dDtua5
 h+H0DoL9VIqincOUjRETi3tTCw==
X-Received: by 2002:a05:600c:198d:b0:3dc:1031:14c4 with SMTP id
 t13-20020a05600c198d00b003dc103114c4mr2259371wmq.14.1674561349558; 
 Tue, 24 Jan 2023 03:55:49 -0800 (PST)
Received: from [192.168.37.175] (173.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.173]) by smtp.gmail.com with ESMTPSA id
 x1-20020a05600c188100b003b3307fb98fsm1728848wmp.24.2023.01.24.03.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 03:55:49 -0800 (PST)
Message-ID: <b8836ee2-5d01-84ef-0dd3-1e7e1c7f80e5@linaro.org>
Date: Tue, 24 Jan 2023 12:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] aspeed/sdmc: Drop unnecessary scu include
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230124062022.298230-1-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124062022.298230-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-TUID: rbaEfAjykD+c

On 24/1/23 07:20, Joel Stanley wrote:
> The model includes aspeed_scu.h but doesn't appear to require it.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   hw/misc/aspeed_sdmc.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


