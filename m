Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1233112lfi;
        Fri, 2 Jul 2021 03:56:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPGjGxIVkpXaeRgOrAr+YMKrG8dbiYv0jA3mBEOHdqbv5xmZgfVNsTI/RQ6RFI0ztxAUgz
X-Received: by 2002:ac8:100c:: with SMTP id z12mr4190995qti.307.1625223366622;
        Fri, 02 Jul 2021 03:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625223366; cv=none;
        d=google.com; s=arc-20160816;
        b=brHZ7Q8tc+eUN9df/Eu05ao/L76iklyU1eRFRAVgkrNcBgzPxegGRPo+1X9XU8Syy0
         5JWMKeTbnZ/kGYqiqnKI9nzHH8DrkTw1JvcrUmtWKvLd3HErppHq+J8XJbZ4T8A0dXLi
         Pr1a4H3vrncZJjPmRLLE7Y/Eyxaup79PL2WWsDByYovFOTOyMn0dHS14muDAcBNHuEAP
         Wk6sNyV6dl7+QtE4bPk+aIZWSKTNuROm0DcwfCBKOvminYeQgbLdvk7RzSoCfKBLHfY1
         jGnwKBsWuYG/QfGVzsbN8PuoydYEKEfFEflIpsYgh3gfAAFE3sTYlIfjr5yxRZYNsrTI
         iWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/c+jRma3FgFmmJgityu7teZCDoVgJXDdPugvthcVjyY=;
        b=RWWt6UeAP8m3GdOaRrAxq5rZXPw96Avse3N4sn+lIg2beSQtI4/EGVJYuyOb4Eb4Qq
         7VJfNP7ZZHbhZBmfAGmWaWi4ZCummYUNjDehMA8R59AXdgnPlKbhgjAFTXSIfiVAV5SM
         25f/hQ9Yl+BR5vOxG2ffojFtUWzN/bGGBtLWAf70wGVcwCVN6NFeJMc+/5uDiRbqpEDz
         9320mb99B8+VNynEFpeohKIymflvTAPcuRnC8YoS4U7BITACzFLsTniTzvU1GaITYzDi
         Tpg8QdjIIK1E/2nAR4N5QhQrppbqKmu4hatXvYq90T6K44LhqvT9nWFA0OpZn38TxUKs
         Z9ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fCOqJN+S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si2890653qtm.374.2021.07.02.03.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:56:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fCOqJN+S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGq5-0006lq-UF
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGpC-0005QU-KC; Fri, 02 Jul 2021 06:55:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGpB-0000pN-2U; Fri, 02 Jul 2021 06:55:10 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l8so11894134wry.13;
 Fri, 02 Jul 2021 03:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/c+jRma3FgFmmJgityu7teZCDoVgJXDdPugvthcVjyY=;
 b=fCOqJN+SodxMQdfIQZD4QFnbssgkCHCaZFypa0M37ccK3zQV3DoChZWaQYyEah/o2F
 oZOuVF+fPjT33hIKfXSTGd88YE/aPNuK1waAC97t+ux0B1WUP2TvuSvp6CNrsneEgtZ5
 kn+C4bDTASOqpf5A16TbL3Hp34a7HSBbNGcMndJ70YYsOKlxiF17wQWIsdX3gW6b9JUt
 jem+qs23JEiP9GGKxifv4/2P+dGyBcXEm5iMYArhkCt5F363Q0Tm1KBCUBz3jhjA+e64
 5u/VoYmD8QFA1wRIj7yn/Cb9bGQGhxagtBTNJX0hOYMqQ9m967/y3UkoGEwTuptrK1T2
 qPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/c+jRma3FgFmmJgityu7teZCDoVgJXDdPugvthcVjyY=;
 b=XFZ2mY1IZiXagqZKQC1miArWe2nvi2dJ7j/s5+nVLXUbMzuyNBSiRu+Vc+aNiX1fp/
 gLvy7vpFSPCJ2TjDmM4Jth6T5mF8NsiBmFWlNYpuwSOPrG6wqsZkVdbRq/GhxwIWQbfi
 i0k+B17Kke55DuU6eHYVKblrR/uZ2ncuUlrdLa04RW/FgBT2yhJhz+hxsvC0WBBCCJjN
 0bfy63ISBfwutsvCfDQvBgMa0fAsh21tn7Bh3KAPMRcObqpuFa3wu8Mbv9aNQvKQlE7h
 TjKivh/YuAWgqvem/EnCqqODFUgENq1OgXW7v1RfBcW8TaWAU7GFde1JuVZccWxiLV14
 xlyg==
X-Gm-Message-State: AOAM533c/z4dN0u3r6CHLiQuA00uTEHXaDgMaBZ2LJVh7XevhTSyIss/
 eGiClvtaEReMoc258R7avwM=
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr5164072wrx.122.1625223307192; 
 Fri, 02 Jul 2021 03:55:07 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id n7sm11436599wmq.37.2021.07.02.03.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 03:55:06 -0700 (PDT)
Subject: Re: [PATCH 04/11] hw/gpio/pl061: Add tracepoints for register read
 and write
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <29ab6a12-df76-f76e-a7d2-e0abdaa6186b@amsat.org>
Date: Fri, 2 Jul 2021 12:55:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E9s2Zvlm16tX

On 7/2/21 12:40 PM, Peter Maydell wrote:
> Add tracepoints for reads and writes to the PL061 registers. This requires
> restructuring pl061_read() to only return after the tracepoint, rather
> than having lots of early-returns.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/gpio/pl061.c      | 70 ++++++++++++++++++++++++++++++--------------
>  hw/gpio/trace-events |  2 ++
>  2 files changed, 50 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
