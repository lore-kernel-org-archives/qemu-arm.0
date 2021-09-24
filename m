Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp996877lfp;
        Fri, 24 Sep 2021 01:43:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyADpsQNhM+P+yYY4UNCsJRAYr7Dqw8Mecn0zJ+lLTS7SaDVuAgK2HdONsmjrYkasSFC+XC
X-Received: by 2002:a05:6e02:16c8:: with SMTP id 8mr7247834ilx.49.1632473004618;
        Fri, 24 Sep 2021 01:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632473004; cv=none;
        d=google.com; s=arc-20160816;
        b=bk02UIfgvgQQmA/fF8OJwbuo2QE1s8xiBxY4SL+R9z1CszVFlQnBvsEipOe2+St/Eu
         WyZJIT08Nxf4rEJSkFXydbjs/zYXJB2E7njxjmQjWEsjwqdhyw+bOTNDAWEq2COUi1Q6
         A3dxY+fpaj/AUd15A3ZY2W983mMqkHoxMyilTEl4wGlBADZA2BNSZ8dVzMuabnzw8PSN
         2ZJu9g6jY46F51v9pt3C6BWmUIglZ+sBN5Tczh67R60FVpo82QrWcAbmHB2lpoYypoht
         NH2dE/hdZbxGm7I47rBGnM1517n/c8CBlVMWHALD6dv3JvswGoirItgdYkx8kiPc2j+A
         ppkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=hNgvGtgIqdvbtXHfdCwXn0B9qOlKwBs1ikr7OYI7/j8=;
        b=DlRDrRYi4KnZaTzkiOu3vTDYO6VUdtTM5cGSKalAxNsai9J+stfUaqLbb4+ReUwc/K
         xnc6VrhjKjuN8WnU9G/UD5/WejKHKDdg+bXKshoQR3aQDJOvIiyZ5P1VW5hiOOzrInmL
         rp4jzX5krBL6gRBL0X/clq7XRMvXpdRtZAT2v8h2LwPlMT5D1yGviK3IE6xrtSZBIJNE
         cUxZBE68I3vVmYW7ZHG83P53eCxRJDknBcHmGU63cfAu1LzKUEbjgGQyuBbI5jZgGHEm
         aYwoYiv6LALXrmd2BzaA1tihNdwwF26ATU0mhiZs09zxUfAxAwL2/QrVl9qFT3XeP1Qx
         yJ5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=U4DeSyXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si11601304jat.122.2021.09.24.01.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Sep 2021 01:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=U4DeSyXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTgnk-0000FI-0U
	for alex.bennee@linaro.org; Fri, 24 Sep 2021 04:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTgnN-0000F5-Ks; Fri, 24 Sep 2021 04:43:02 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTgnI-000057-Ug; Fri, 24 Sep 2021 04:43:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id i23so25086876wrb.2;
 Fri, 24 Sep 2021 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hNgvGtgIqdvbtXHfdCwXn0B9qOlKwBs1ikr7OYI7/j8=;
 b=U4DeSyXsfU0zsMkVquf2RDS8mpOSJJPuasEZEABKEAogesh3c+9f9UvxWMZw4X6mYy
 zz4VY4bpqot2V8wyKnt0cbpirvnmWcpGMfQLIOnNv7fZAR+0v7Tf8SWPjOyh3Nvfx3XM
 mCVt7y7xZubavdj1G3D8ZBLQXRgKADxObqQnVJMua+h4bJNBH6T67MzCXG1okSROtVHf
 DaG4w2WTXufNvjShUcxfg/kddLOHJogZ4dGOEBM/DRSCsOKVf0inKSiMqPVZhji3Kt6j
 8NXjzKODEdqQiveo+YaMGI6dYeZ8q1VBM/x6XOGkyoBka3EnClpyUfxMSplUIqJqd+b3
 80PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hNgvGtgIqdvbtXHfdCwXn0B9qOlKwBs1ikr7OYI7/j8=;
 b=FxPHG1wWHRTZss7ojJzze2WfRd6uGKddWauAlU5kOVxlwPr4FNFfZ/pSCHpfEq6Iyr
 B6nfjTF0AtI7L7DlHQMfFpPu+2FUTa0ILNGMWL0+x2alNqNrjf104reHEFo6H/0Vydfn
 /y3AU3OsC/1WwTR+OAj/0Wlx/Q7gKOsCRtNNNHOj4x9TpIBmbtdQu1WX87Ea5pqifI1N
 4fre2aEyvzZKfm/+snZkVjgE8gaRzMJmoK8ESm+bD2gD7ALwNMgadWNcC4kIqncvfUwg
 lOqARx5XW9/qomQ7jDOKQhW1r3WR33wSteGXQ5J4mlCvuJyLWKh8R4IdkLuOgkVFM7CS
 1NvQ==
X-Gm-Message-State: AOAM531BA6JL6OD28k6aF8SOFV2BkaittBhf5s60tYdYEhdnGjqVaAw+
 nzA0vPq6UzqPFB5Sa2MfciM=
X-Received: by 2002:adf:f683:: with SMTP id v3mr10211105wrp.423.1632472974963; 
 Fri, 24 Sep 2021 01:42:54 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id b204sm11130922wmb.3.2021.09.24.01.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 01:42:54 -0700 (PDT)
Message-ID: <1a0d6240-6654-0cf7-01ce-ef3ebf497a5c@amsat.org>
Date: Fri, 24 Sep 2021 10:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/misc: Add an iBT device model
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, clg@kaod.org,
 "andrew@aj.id.au" <andrew@aj.id.au>
References: <CAMvPwGr-FuQWHTQYxppAyT9uPhzCUDcezgz+jV=GwHGoQF4N6A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAMvPwGr-FuQWHTQYxppAyT9uPhzCUDcezgz+jV=GwHGoQF4N6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>, Corey Minyard <minyard@acm.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JtGK6Fcn5RnY

On 9/24/21 01:48, Titus Rwantare wrote:
> Hello all,
> 
> I'd like some clarification on how the following code transfers irqs
> back and forth:
> 
>> b/hw/arm/aspeed_soc.c
>> +    /* iBT */
>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
>> +        return;
>> +    }
>> +    memory_region_add_subregion(&s->lpc.iomem,
>> +                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LPC],
>> +                   &s->ibt.iomem);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_ibt,

Code smell indeed, likely:

         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ibt), 1 + aspeed_lpc_ibt,

>> +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_ibt));
>> }
> 
> and
> 
>> hw/misc/aspeed_ibt.c
>> +static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
>> +{
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> +    AspeedIBTState *ibt = ASPEED_IBT(dev);
> ...
>> +
>> +    sysbus_init_irq(sbd, &ibt->irq);
> 
> I ask because the code in aspeed_soc.c seems to connect to the
> lpc->subdevice_irqs[aspeed_lpc_ibt], initialised on
> hw/misc/aspeed_lpc.c:408.
> I noticed that bmc firmware running in qemu was checking the BT_CTRL
> register less frequently than I'd like while editing this patch to use
> the IPMIInterface.
> 
> Thanks,
> Titus
> 

