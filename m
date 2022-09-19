Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1436939ejy;
        Mon, 19 Sep 2022 16:11:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Q6ZGJXeAwvCz45mkdMyt2q7NrZZD2g1J5ysdkjcBt++p0Scyz12fziZaOumd58UdZJtvy
X-Received: by 2002:a05:6214:4001:b0:474:1516:5372 with SMTP id kd1-20020a056214400100b0047415165372mr17341161qvb.96.1663629085063;
        Mon, 19 Sep 2022 16:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663629085; cv=none;
        d=google.com; s=arc-20160816;
        b=C86fSHZjpRuQfeZG7UgKaBzIaYYPW3/qpGDfRA/iNMhfMcPABGZ/3C9DEZAMyLbizB
         /nbKcJejvF6j5U8E03UXLf+zTwpUYEMiCCBZKhwS28rGFCWYymu/kKCEwGydnNYAJeqg
         LECN24NRIUSJ4YmOdgiAtLR3bKGE63CnEKxM7P2j3mdqLzNHBHxELWhYgePjtX5Ap7aN
         JSIuJ+rUerr9C+tPMdgBgQzkbKd5POLtBZMJI4wRte8s/C2A9R8BHLEo7YHF5dcERga8
         DcR4cFX6Sp8qjWw93ZoSWzXZQwfMx3qJczHLjYlZxgzL7xtwwqdBaNS4hZ6voPGm2Owg
         J1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cBMi/U2b4masA5UJMQwqhxVr7A1n9NvuWkGIzWwt2SI=;
        b=V3g3fsEI9otSz7e0/YvpThcdMwWbOjbcK+0mxClV9wJ3sjZuy+mIqQueKoEOp8y5cd
         7nI/cEXaTNg6fO7X/RuA9/rj5rwEMK/gkAGF6DWJY4GzIyrE0Cfx4h2y4qrNGlj5ImvV
         Yw9j1VCw/P3Q0zQT2cdywyGTdiyWZSkWu9qjokw7Y05UyPIHw2R1hmtkUVvnHSh/B6W0
         QF7uvRZb7zDM8fVbyCnBNCqGTiloldK0DecTf52Zn4YMZpOgn/j3K/ZNbslKBWl78lMC
         q3CF35fQF+DsCuj/IxfshFfa+hVM7cynBiyFkDFNAykkE0ENoiM/Dy/NU7Co0m4yXFfc
         YhDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=VG1u0o4p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16-20020a05620a25d000b006b9b103d125si8697764qko.118.2022.09.19.16.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Sep 2022 16:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=VG1u0o4p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaPvA-00048y-KF
	for alex.bennee@linaro.org; Mon, 19 Sep 2022 19:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaPtn-0003Bg-5z; Mon, 19 Sep 2022 19:09:59 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaPtl-0000PD-9z; Mon, 19 Sep 2022 19:09:58 -0400
Received: by mail-pg1-x530.google.com with SMTP id q9so752981pgq.8;
 Mon, 19 Sep 2022 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=cBMi/U2b4masA5UJMQwqhxVr7A1n9NvuWkGIzWwt2SI=;
 b=VG1u0o4pNcCXMPdX1c0m/IP56JgmCjWKzfsGlOxthr/L1ZRxyqhLEsKHUgSdd4M49Y
 FfVYeL/QmEL4d+Lrc3KssJFyGjj/pLhUfv3LWz5qS2z/IHxD3wrkDoWa02Zlj7jKn86K
 g07Y63WllckoCZ9kiTUrwe4GgQ/OgWp3GG9HiMsPooDlX+relPfJ5ll4jtQhuq8u/Qop
 MWyCnyHBk1fBNEep8Sa3tvkNCxeTf2V3ZJTtNmPbznh/QjXk1FcY3akpvsAlidgPvgdg
 UIMwgT3YE56RKkNRfgrkWETro20WvBZnIjqDAtcFzns8T/Ltapg9rQDeh8zf2h8IcVic
 zYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=cBMi/U2b4masA5UJMQwqhxVr7A1n9NvuWkGIzWwt2SI=;
 b=T3Hq3N4dKEpxTVPlwBD/Qi4oGuaM/OKOTwVTuI/rlnRpNug5IiHMCiZmPF06BA7b+t
 vYvLOmc2tihtzid029M+38eAT9FOJHJBX2ToApVgRRs8n++RqkpFZUzXEuk2TH9wILPD
 XZMjjS1SwIP1xEKd077HINpj6YEWNX8yco4jsISDJgcO4XXhjgUD2afJhxgjpjXFyvwR
 qClhKgv6e+DJ8/k0gpz+Y1nksVKfNi40EIiRZtkKI+U69P+XnrZW1xTkHOjA8GX6fVjD
 M6NfeeHs+7NJ6QCldCOSJFnqnaHa7hzTZZMCGu0O+shezVpjwX0L8ig/E5jz0L5wU/Sf
 e+1Q==
X-Gm-Message-State: ACrzQf3rnawZkGxdoPUQ9mwqQMUtNbL6t2mXMpW/4NnhqQimnhEB0Gtj
 O2260dU0dMZW5VveTWFKhBk=
X-Received: by 2002:a05:6a00:b8d:b0:545:e7de:78e5 with SMTP id
 g13-20020a056a000b8d00b00545e7de78e5mr20571088pfj.72.1663628994404; 
 Mon, 19 Sep 2022 16:09:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w28-20020a637b1c000000b004393cb720afsm13117313pgc.38.2022.09.19.16.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 16:09:53 -0700 (PDT)
Message-ID: <8aa93a4f-beef-a0a6-8bac-3b69ba25de7e@amsat.org>
Date: Tue, 20 Sep 2022 01:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 0/3] Add a host power device
Content-Language: en-US
To: Jian Zhang <zhangjian.3032@bytedance.com>, peter.maydell@linaro.org,
 clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com
References: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
In-Reply-To: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.952,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: HuzAi7IdERRY

Hi Jian,

On 19/9/22 19:21, Jian Zhang wrote:
> This patchset adds a host power device and added it into the g220a
> mahcine. The BMC have a important is to control the power of the host,
> usually it is nessary in a hardware platform.
> 
> The BMC(soc) usually had a output pin to control the power of the host,
> and a input pin to get the power status of the host.
> 
> The host power device is a generic device to simulate the host power,
> accept the power control command from the BMC and report the power
> status.
> 
> Test on the g220a machine, the host power control command can be simply
> work.
> 
> Jian Zhang (3):
>    hw/gpio/aspeed_gpio: Add gpios in/out init
>    hw/misc/host_power: Add a simple host power device
>    hw/arm/aspeed: g220a: Add host-power device

"power-good" is just a TYPE_LED object, but it doesn't seem you are
really interested in using it.

My understanding of your "power-button" is a latching switch.

This could be indeed useful. I'd name this model TYPE_LATCHING_SWITCH
and put it in hw/misc/latching-switch.c (since it is external to a
SoC). It has one input and one output. Naming them is not particularly
useful IMHO. The triggering edge should be a property (it might have
a default, positive/negative), and the switch state must to be in
vmstate for the object to be migratable.

("power-good"/"power-button" is what this particular board choose to
use the latch switch input/output for).

Do you mind renaming your series accordingly ("latching switch"),
and adding the vmstate?

Also I'd reorder your series as 2,1,3:
- introduce the new device
- prepare aspeed_gpio
- wire aspeed_g220a

Regards,

Phil.
