Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp3447637lfc;
        Fri, 12 Feb 2021 10:35:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxidMgprA2pEN9rNCoRvL0x0OCHJaP7b7l9ZZO4y20T3bi2lIKR1qHK9wVTgtZWfhucfUV2
X-Received: by 2002:a05:6902:1025:: with SMTP id x5mr5736314ybt.493.1613154918830;
        Fri, 12 Feb 2021 10:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613154918; cv=none;
        d=google.com; s=arc-20160816;
        b=kT+e5AfQPuxonpMETawXr2rl939+VIIVoFqyK9N1Cg/gwiuFnPGXG484OxkCmLXS1d
         xHbKiWvZu6Fx6xjz1kGB7J+rIUM1oUq0SuvCLv/cXb9iydLhMxPsW3TpIt0phZ5gt7PM
         Q9WO6naGsniCECaTGcRy+Vg8rdQwkrcoyMkxcYTKbPTmNfmb0494lH3CYM9J7NOvw3mq
         wnBZoeodJnHKv0EaCdnhiZJtxVW3NpohCAV9FS/vj1/oBbtxWaZqQbRiTCF/7vnDKGrm
         bhNoe1IR/2RuEiyKfSiO9nw82k1OBW4xsRmT8qRUctKMYQcdfmULA4iHDisCV7uZvM2p
         7/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=db5Py4qLpbqp5HULO/4QJu5Xlh1H+C0hPtkHc9OrI7Q=;
        b=sofN0A8BjewdXvhv0gdhVhVyqWHZMbyicrKfZJ6vW0nfrdUJVWAofA7+xC03K5p96m
         7NNSinm1Lj8QLmdqoMbjF2ViFPzgihTQwkjZtGKZR7rCSA1/yBNezBj0iyzXCHFtzKId
         zYdQr7opTpQirmJeoh87s9phk35G17b7PhGZYuROl4T5x2XWPYP1Vk02a4KQ/6i8oJd4
         6NrZb4sdUme96Mwj6gJd58wE9CcvYNMeBkceHi/USJ2d+5s030gLkiE6/0PU+GtRAV4P
         +r1cYkJf3vsTTXqj44e6dS5C80KnCnPoPkqBhkeN/E0r77Zsos7D9ruZfXwqrujA27ma
         mZ9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kDpiGjl0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si9972865ybt.392.2021.02.12.10.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Feb 2021 10:35:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kDpiGjl0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAdHg-0003lh-8Q
	for alex.bennee@linaro.org; Fri, 12 Feb 2021 13:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdDL-0002Ng-64; Fri, 12 Feb 2021 13:30:47 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdDJ-0008WR-Mn; Fri, 12 Feb 2021 13:30:46 -0500
Received: by mail-wr1-x436.google.com with SMTP id t15so266371wrx.13;
 Fri, 12 Feb 2021 10:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=db5Py4qLpbqp5HULO/4QJu5Xlh1H+C0hPtkHc9OrI7Q=;
 b=kDpiGjl0b4fCr24CRg/YAmsXKTqFbtkvL79//o0Mu5cWJnNTHh3xMF0MmtHJfnbjfU
 uFW1IKqplVdSbGMFzVTBEqirsVkE4xDsJFcRuGwLqLzrL8x05o8nzkx1PQr5Vk005N8G
 vQiIN/vmCZHkTSrQxYEv5+/mHLqKzVvyxnZHheNqbW0wybJuikWNoeuZ6mmpzuqKZ6/3
 wgzKZNt/OACdK6ZGazGgGwhPJW6PnUFVJJl/oallRKbmPhr3miNJtqWyILPXOnrNeXlj
 YBr2eh7nQGdTnWKwHA8Fn/lsAb7PhavPbVte86o0cgT1eOODGb1Oy/MKdRCCT3iZj8z+
 pTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=db5Py4qLpbqp5HULO/4QJu5Xlh1H+C0hPtkHc9OrI7Q=;
 b=c6VN360iSJcmN3e8OwItwsbAcS2cqEyQEc1CBtYwrfy6FiQ90oF87kyRGzHDjSwmTX
 hyItKjEPxV3//U51ZG5NJN2m3j16PQrNSzlTB9gM5a1LtwlhhdfV3q6693xY57314ZQK
 9mfBnWWs5aFKNnN8Mr8J9e61vpNX7pN80pzuFni9vQe/BNCJKRIEbJsAohGvtPQBSozs
 weQPZFXzYlMeoOXTHw8Rg0721QCK2vVEGyZRMAOuuYViHe4/fFVjoOCs2cz7kJ5ZMAEa
 vzcYedyreivziIsaGoNYJ28Xq3r7ksWubrxpe+Af68akMpcAWR/n+VboxOQaJvESGIp1
 XC9A==
X-Gm-Message-State: AOAM5337gO67E/razG75c1GZyvs/mqser/nq6QBLz8J1P21XzHbAIWSp
 YyA26jslI9asUZpQLZUiX2C5bag8OCc=
X-Received: by 2002:adf:ab18:: with SMTP id q24mr4991974wrc.80.1613154641625; 
 Fri, 12 Feb 2021 10:30:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w3sm350059wrr.62.2021.02.12.10.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:30:40 -0800 (PST)
Subject: Re: [PATCH 19/24] hw/arm/mps2-tz: Get armv7m_load_kernel() size
 argument from RAMInfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-20-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <313f72f7-3e70-3e0c-e5b5-72a30479a172@amsat.org>
Date: Fri, 12 Feb 2021 19:30:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NSgMFkvutfZG

On 2/5/21 6:00 PM, Peter Maydell wrote:
> The armv7m_load_kernel() function takes a mem_size argument which it
> expects to be the size of the memory region at guest address 0.  (It
> uses this argument only as a limit on how large a raw image file it
> can load at address zero).
> 
> Instead of hardcoding this value, find the RAMInfo corresponding to
> the 0 address and extract its size.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
