Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1669336lfy;
        Thu, 6 Aug 2020 07:08:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjvnrOqfVFZc24E3YBH9GtEeHanHmxTffPg4J+/wrfSgoX4X7YXBGG/5Ew0OgJwT6wppa7
X-Received: by 2002:a67:30c5:: with SMTP id w188mr6196276vsw.115.1596722913497;
        Thu, 06 Aug 2020 07:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596722913; cv=none;
        d=google.com; s=arc-20160816;
        b=o00lq7IcmSPhKpBWAhtamo60n8874lSMgeo4r8vfzWZoTS32WyWb1BARXtOQEaeSYp
         V2FnuoUIYXMby7Y/MRYuwWV9sj0X+SiGKD1Sy6ryu+yE66rwrCMvsRiNMyEB0taN5zha
         SYqa4PEiNE+n857e5FQpZU86P0wVHUp612fWo7D2vOXn1N7BYms8qFuXyQZgn0T7ttUR
         HsnQUqIxMqHVVE6hjLcLxMOD2Wi35YWAhJM0zRvCWZloeLhgxN/6fE6k7Uyvyd8L68Dt
         3fQ+kkEAP7/S6YIZGAlLP6NkjCq29gj4dt565la2DivpbfL0QwD79cUsL1n7/FuctuDX
         BTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+Bxyvr6S+vXVoNkU/baDMBPB8j3EiNZGJgp+D9j8ok4=;
        b=eu6+OxmYvzy5BrG3Rdu9W91a63RjgOeNCGYw8ha/8MkcqahQk9MNF+fcxArMsr96fj
         hH8lH5bgjebIREJAFhet72Yc8KDxmg3mnlnO1+O0V018PcyUBw4CQfIjWL+Wpxzu3DKo
         88UThgEe2SgjU8TDb9hj3SS3imx7u1FC24ZGzrxSkH9xj8G0GQ9UNodcFzcw6N7Ueaqp
         SIZjfwCoYAYYY9JeogZ0f4jtXs/qxB/qtpz9PH9CGRgc7QyQxdGMVdF8bMFsmuxQG+ad
         /HokWK1uNDix0uToocBs/OaG+rYFxebOrtLjAjHelrZ+Hcc7JGbk8y68swZEWPrf0pvG
         HfRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kgU0pgaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si161192uao.195.2020.08.06.07.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 07:08:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kgU0pgaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3gZM-0001Up-OQ
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 10:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3gZE-0001Th-Df; Thu, 06 Aug 2020 10:08:24 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3gZC-0006jd-Qc; Thu, 06 Aug 2020 10:08:24 -0400
Received: by mail-wr1-x442.google.com with SMTP id y3so44145320wrl.4;
 Thu, 06 Aug 2020 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Bxyvr6S+vXVoNkU/baDMBPB8j3EiNZGJgp+D9j8ok4=;
 b=kgU0pgaXmVsUh4rJnKWysR3DxpaRoQzRPgwerXF0Uhnm0smkmCJ2TKoviLLZ1cMcis
 O1ozB7/GK3wNoUubxJhfrk8hXfa63w0qgRztc/UZA4qzO73IdAFThr2HhF2yj6BLLdg9
 JKXWw8S9MX68CHa9hjTqyG77VQhFLSUKz1hP7qKT3nAInHTbW4d0VglhG71f05iDXcj2
 TbuYh1qRCzS+EbXO4JfovPmNROS5zB3k6xsB4hic5dXYXNiVnXK6fxJb4uZJqV7TvSyP
 yLp83i+m/Lew/LVBMtbMXxP1XhNVhoGjvngj3X8eTAA9VYLMPBxJDzFyN1M3dLB4pHGA
 Xg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Bxyvr6S+vXVoNkU/baDMBPB8j3EiNZGJgp+D9j8ok4=;
 b=nxXHf/Fsl+qMnTX1CwB+Fz0e87XyQUo43aDsodH8sW675RIJUE0GeM3xmxhX6UeH7f
 58irdkYMFAJTXiY1b2egb/lHpikW0xwfQmTG0tqRnJuk/KRmH1IK2rku1gK3X3+YRSpr
 7ZKEHlfXXs7VDG1Pn8+NgYt3NTrnKKy3tLZTCDy8dXmzD+r1NxNJWuS+9c1vcAzAVexg
 QISfaeEcWClFWOk1X8ro0XLPaDZb8mX8rKwX0TzUpwLkHksfL7EehfDypsUiYwjJrWKK
 3GQiCkeyIw3YRtgT16EION+tL4VMPwKTGruXFlQQgZmV4n3KYbORfBVwdzPQisoZv5SH
 tdMw==
X-Gm-Message-State: AOAM533cv9kUj7TBEug7hvNyLmgs8Tk5LCcYKWdYXIu93Yy6ctnv6lUZ
 nAzlALH4FgJkzJ8XXqwsrWE=
X-Received: by 2002:adf:f590:: with SMTP id f16mr7073204wro.98.1596722900523; 
 Thu, 06 Aug 2020 07:08:20 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 124sm6470608wmd.31.2020.08.06.07.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 07:08:19 -0700 (PDT)
Subject: Re: [PATCH for-5.2 04/19] aspeed/scu: Fix valid access size on AST2400
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-5-clg@kaod.org>
 <4a41f234-ab81-d078-0fcd-c1b20fceb1e9@amsat.org>
 <bd58f180-1c18-c998-5fa7-da41177deb02@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f8f6782a-b05a-d039-33ef-2ac551cb1c54@amsat.org>
Date: Thu, 6 Aug 2020 16:08:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bd58f180-1c18-c998-5fa7-da41177deb02@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, erik-smit <erik.lucas.smit@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9kejZHJYP2oa

On 8/6/20 3:49 PM, Cédric Le Goater wrote:
> On 8/6/20 3:32 PM, Philippe Mathieu-Daudé wrote:
>> On 8/6/20 3:20 PM, Cédric Le Goater wrote:
>>> The read access size of the SCU registers can be 1/2/4 bytes and write
>>> is 4 bytes. Set the min access size to 1 byte to cover both read and
>>> write operations on the AST2400 but keep the min access size of the
>>> other SoCs to 4 bytes as this is an unusual access size.
>>
>> From your description it seems you need to implement .valid.accepts().
> 
> Ah yes. 
> 
> Can this come as a follow up ? because this patch is enabling
> support for the Supermicro X11 BMC machine.

This is certainly not a blocker, so up to you :)

> 
> Thanks,
> 
> C. 
> 
> 
>>
>>>
>>> This fixes support for some old firmware doing 2 bytes reads on the
>>> AST2400 SoC.
>>>
>>> Reported-by: erik-smit <erik.lucas.smit@gmail.com>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/misc/aspeed_scu.c | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>>> index ec4fef900e27..764222404bef 100644
>>> --- a/hw/misc/aspeed_scu.c
>>> +++ b/hw/misc/aspeed_scu.c
>>> @@ -328,9 +328,10 @@ static const MemoryRegionOps aspeed_ast2400_scu_ops = {
>>>      .read = aspeed_scu_read,
>>>      .write = aspeed_ast2400_scu_write,
>>>      .endianness = DEVICE_LITTLE_ENDIAN,
>>> -    .valid.min_access_size = 4,
>>> -    .valid.max_access_size = 4,
>>> -    .valid.unaligned = false,
>>> +    .valid = {
>>> +        .min_access_size = 1,
>>> +        .max_access_size = 4,
>>> +    },
>>>  };
>>>  
>>>  static const MemoryRegionOps aspeed_ast2500_scu_ops = {
>>>
>>
> 
> 
