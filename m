Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp620137ejx;
        Wed, 9 Nov 2022 14:37:43 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5FmNaAgFgI2bpSrZkLfLI9KLsJYM8bXI6xCSBhmdFcfC1m/jdB5dnIuupPZwoK6miaTBAP
X-Received: by 2002:a37:2c83:0:b0:6fa:2042:41d4 with SMTP id s125-20020a372c83000000b006fa204241d4mr41219766qkh.388.1668033462945;
        Wed, 09 Nov 2022 14:37:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668033462; cv=none;
        d=google.com; s=arc-20160816;
        b=HZY7lEKFseoKLexpue7pT8IN6kZ7vlT4/QR0CNZb3GTd+PWraDTVDXt1ZfV6V9PTGt
         OfxMeKv0JqleVVPRnh3cnJrUNrxAhrMUCPAfz6/nJtc3KwJwfwkTM9WwQKpV2mG5tR3A
         c1rxCOhL3bosoux3AllRPqQ+oA8h54YNymfB6L9GarTMhjaD4ziOLZK7rftLZbdN5DHW
         G/Yt2FR1NCIYV1QSBhi7kL72gaYBvLmjJnftK0LUX3i71JWh4Iw7vyzOD6hXpW2z+XYp
         pGRetHgTAe+4XDSNbWlfmijqQciT0OqFfLQGR4qotBXufdAsOYCSNxvvfClF6VAjUtKY
         /P7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=vUrhvf2rK47GJcF2f7MbsPccVzAFUfRUyBtBWgkWKJk=;
        b=PS+bfVp5XQ+GqiBK9nmDuZkD8k8b/cz9++TfA4IJQtFTAW6ac9cWThlJIwYLcbG0XX
         y4KJ2EXVQElBxC57BCJI+sNsbFkt9Dco7oODjkhVe7+dPP6kRK2JGkvLhfryuXy0F9gK
         5MyTqKiJ/oFP0tXPFnef7Tbtv0KfA70y890MsJ7UsuSSNRJZoHX9tnDRNz3R1AJrrY7+
         uYu9hL2GyZD5hpLcFGJhPPesmqxu6NKNNrjBqe6C6jyvq+HOYfw6/3wFjSTVEgyIFFqg
         2Yu+NfrKUsvvIgaDw/HooBECf9nS7FWa2s1m9F8af/MWHdQQBZakfOi+DvSG2NTEkmdM
         RKig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L3Iso8Yn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fe11-20020a05622a4d4b00b003a4ef5cc694si9676885qtb.601.2022.11.09.14.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 14:37:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L3Iso8Yn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osthK-00046O-7p; Wed, 09 Nov 2022 17:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osthH-00045y-UD
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:37:27 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osthD-000052-P6
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:37:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso2222322wme.5
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 14:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vUrhvf2rK47GJcF2f7MbsPccVzAFUfRUyBtBWgkWKJk=;
 b=L3Iso8YnBd6TVjw2MUowztdUo0s1KZwleQRTq0u/KK1W9uK9mIllBoK3J5zi+VEv2S
 SfwhCJlZrqgZ+861xvroEqjkoS4KBT7JY6QBLcW9szJTHFc4taT2ieVvKa31nfKD8lii
 bhTsr0pft/nUigsMaKzajgqBsKE8UNFM6uSPfUN8rfpKqbtmDA7Sf9c3pU9hn74m/+UC
 dqxv4KZ5vITnNkQPB1RzAhh3WfZa4daXyFaHzDq8XIdRVH9Uu/EMq97P5QaKwRWhXZUG
 TJGWLrt5U7r45wyj85YZwa6s+cq8C4ecHkWFyD9fS8zK9Ul6Db1NdvTsmX5RDEpNl5aj
 kpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vUrhvf2rK47GJcF2f7MbsPccVzAFUfRUyBtBWgkWKJk=;
 b=4+x9y5J6X40W1ZQyjv8P2vQ46p/3UlIhn7fcbbfXOvkYvoDVMtL5/groXFz0VVlf4O
 V5/dmyNfpdizmnsGE4VzQXtxKbN3fQQ4R+4Ant5+ojzW/UIvgEpTG1AF5dqcvHzD1tLx
 3z693TDsABeHjKAcNul+choaB9RNkuOWbEYuHD93e/rJAzNh54C9u6Hkgc6jlKvlA19f
 ngyU03lD8/I+SGjkgwj+CindgqDmim8qvviO6bIjCoJ/CWQ7YhBlAb/ApN/Ly8l/wUDP
 XAAtgi8wTP0EuuAv4FESvWnlx76CBaRiWBFvFIW9h2OxnxZXKlrUofNeOcYGjsjGGOyX
 VfRQ==
X-Gm-Message-State: ACrzQf2P1Q9NjHiCjdxtmhCz0k2ToSMcCsNEl5twb9A0TfIqF2QmStcs
 w8lBfH3ivc7d2Rji9WkUOI8Fbw==
X-Received: by 2002:a05:600c:654f:b0:3c3:b5b7:43a9 with SMTP id
 dn15-20020a05600c654f00b003c3b5b743a9mr52667988wmb.201.1668033438442; 
 Wed, 09 Nov 2022 14:37:18 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a5d5259000000b0022cc3e67fc5sm14485346wrc.65.2022.11.09.14.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 14:37:18 -0800 (PST)
Message-ID: <14f6e37b-2656-ce5d-52ba-dd17ff90342a@linaro.org>
Date: Wed, 9 Nov 2022 23:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 3/9] hw/intc: Convert TYPE_ARM_GIC_COMMON to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ZRmRRmncCAjX

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_GIC_COMMON device to 3-phase reset.  This is a
> simple no-behaviour-change conversion.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gic_common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

