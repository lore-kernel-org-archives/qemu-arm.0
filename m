Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2077041lfk;
        Mon, 31 Jan 2022 00:20:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyF+R9QDTMW0CoSGMa3KHHRFxfInC7bBnrpKZxG0oS1z4prDccN5ekWUtXipadquK/v9USG
X-Received: by 2002:ac8:4612:: with SMTP id p18mr13886704qtn.492.1643617201216;
        Mon, 31 Jan 2022 00:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643617201; cv=none;
        d=google.com; s=arc-20160816;
        b=TAs+YGboNJBiiRIxyjsaomOcar70/5jsFVhBR4qETG08FdsXprFU2CAGL5WCZE4tje
         YEl3ApY2Pt3EFml1JHZalHzziMpXOfXF+MHXwxwAoi5MfSI/1hyFGa9TTl22XVH2KOua
         14lhFsZtyA3gAHO2Rn52Oxq7Jz9c1iLoSDikuvgPOgOGT2774IVdEfCdSRY04BlYL4JZ
         8BVrCbDwGLKEsX7VOtcmGQMgQy2CGm3Oir3nfMPKRsDTxoOLRBb4jus8AvWIwpDUlp7w
         KRiOE3rZEg8epKm9CMviVhnPEKggYAzj8Jlo712jwx55oWTTAR7e6j5+v5DE4jaZcimQ
         wxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=11vXh06DaPqB1I/9NZYi7RmaGjHGevUylv7Gwci0JdM=;
        b=K/R/1YYwh7jjR6CTnQtT8WLK+DgBrqQPYWIJIHe7ZUXmiyu7rTJW2gYslhWpqw9DzZ
         JQS3X7PkXsiz0OEdXrcQJs/QVb6eEyx91KUWOHUq+3NHTdC2EypqbS/Ie8a0yzcqcO77
         kxAEp64RNgKTR+D3xkWXfU63T7UKUjXj3L57n2UH9dQ/RADcOEJYMHxbRzvmol5KImQw
         2Y9jKjGoNCa5YAfX16qXqWanWuTbIrdf8WR5HUuoXZ54g2T/e/b+jgB/CO197rxK6awA
         XTU8oI/wWDMrvhxnwTId58jFj7rRR2KOgELS4iwrIla5TvPqBuxkOTGReqaaequvsdqm
         t/NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZXmV26+e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si2944132qta.82.2022.01.31.00.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 00:20:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZXmV26+e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nERuq-00047d-KD
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 03:20:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERiQ-0004tV-V1
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 03:07:13 -0500
Received: from [2607:f8b0:4864:20::102f] (port=40609
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERiN-0003sa-QU
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 03:07:10 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so17568622pjt.5
 for <qemu-arm@nongnu.org>; Mon, 31 Jan 2022 00:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=11vXh06DaPqB1I/9NZYi7RmaGjHGevUylv7Gwci0JdM=;
 b=ZXmV26+ebPEMxPNu9XJcjJXormLaJBLNzzsjk7UnFe1vAi0Ex5Sfcq6VNbPHgTBY6j
 jIfpzp7BKM62zd24LLJPbKNJTiTUv4wggSL5zT8nwaXmb2Po/sPDVdRbyYE5hwm+LVL3
 EHnGP0dbwkWcgpZIzbQywYI1itb9T8v4FCoS7j4KieJj3HHdPwD5vsJyNM8u9GMCe6Ci
 B2zL1vyaBGWpRx3QoxDckfyXFpo0J4bKz938mX0MxB/zoAp92KCGgwngddJlumVpcpPg
 szo5nEa6QTxk1LulOyT46SKaYvcGZuOoTi5/s2Ok+aMiQAejaRnO6thJxntjs7uMVRq/
 5G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=11vXh06DaPqB1I/9NZYi7RmaGjHGevUylv7Gwci0JdM=;
 b=dbik+QrpLyNRtv+5BB/CNbidLky+04pPQ/PEUAq3U/V4qXHzEhIkCCq5OtnEy++jFt
 LbOolterbpMnSmGoPB2sqS/5V2f5qNvWlCsTqrsMeOOf2PK/1q16hLNm48AaHd+jizI5
 6oVgEs4jW1XrH3EQn97o8OVxlJzc6Z7juDuG1ebQimxr/DVWOztA7t4j3Jva/d/2J6bC
 HVF8RSvGH0c96WG8Y1bA354KvpC+huJDXG34vs1+x9U+uwhCPVFF6e6uXH0c5FyoDAjJ
 u+R9WpY6Zzj3iMOlRov6jMmAx3vUzCv6XnA67dq7sG7v5c0YyTW7/qsPKYbvqTIUYD/K
 bW2g==
X-Gm-Message-State: AOAM533Vwpnf3cNXisx5Cb+2oQhq0+9FwyP1AHn3Is4duChpV90SlcIE
 2DqeM9mOrvLRsVTmUX3AostNvw==
X-Received: by 2002:a17:902:ea86:: with SMTP id
 x6mr19780527plb.69.1643616425276; 
 Mon, 31 Jan 2022 00:07:05 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id m11sm27409779pgb.15.2022.01.31.00.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:07:04 -0800 (PST)
Message-ID: <68831239-736d-f8d9-6f29-c0de72b3a15e@linaro.org>
Date: Mon, 31 Jan 2022 19:06:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/16] hw/arm/boot: Don't write secondary boot stub if
 using PSCI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8TtSN4x2CJ8E

On 1/28/22 02:46, Peter Maydell wrote:
> If we're using PSCI emulation to start secondary CPUs, there is no
> point in writing the "secondary boot" stub code, because it will
> never be used -- secondary CPUs start powered-off, and when powered
> on are set to begin execution at the address specified by the guest's
> power-on PSCI call, not at the stub.
> 
> Move the call to the hook that writes the secondary boot stub code so
> that we can do it only if we're starting a Linux kernel and not using
> PSCI.
> 
> (None of the users of the hook care about the ordering of its call
> relative to anything else: they only use it to write a rom blob to
> guest memory.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/boot.h |  3 +++
>   hw/arm/boot.c         | 35 ++++++++++++++++++++++++-----------
>   2 files changed, 27 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
