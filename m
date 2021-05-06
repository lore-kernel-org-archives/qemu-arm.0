Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp836489lfg;
        Wed, 5 May 2021 19:26:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj9Rk2kn8Bz3uk3L0wOAk0hskvgbJWirj5Jv3/zYO5aWlmQwfwTOSeHgwh5KXAoZlCe6bK
X-Received: by 2002:a05:6638:1650:: with SMTP id a16mr1568488jat.23.1620268015360;
        Wed, 05 May 2021 19:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620268015; cv=none;
        d=google.com; s=arc-20160816;
        b=TCUG5OmsvVJkokSK2hGMlV1nVNVNel0dNEQj71uJlIFkXCTZGxpw2fl66tHC/tIHWl
         d8lfQBztxCHdnKRxCwMqsgHkTWqc8isqBsbStV4IlGOZM2GiklIR8ApTKKKFgxF3rYjv
         ichF/WgdlMYbSpP52/uXVRaGlijjugjccVKj8EnnFdwaxeT+epYaiXFsiFt7F8tkXQoE
         /fW2BCVFBGKuQ2YiAuaD5BpEMN0mvroq9gcD+N85tDMUla8eOKPQFbazDPSt/bmz6elw
         H2BTSGCfoBm74wWkcn1gacT9X/cQpweB4rXh6nMFYCJGrZzbkKi0kfNf99BwZM3b3t9v
         MCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to:dkim-signature;
        bh=ZnY2dkL8b81cfCirToq00pKKe1qP9eFw7vBW4dzRYyE=;
        b=N+NDCLP3c02z7Q4TicWrvtzvaUFk2IUQ/sf8R8E7W9oSml0Ql7medoANHX2RKqamuD
         fxgZOaF9px0CEGBsNwLKawhDnjBWaHoJtwcBILmqsXmFQ69pjhNoyQHIlRUKL0V2Pl7A
         ZcFzQewleM4Xi8eEWvmmlMyE2V/WK3TUjOzjzKPPNhUwHSWBtVzR/gEx2t0TSRrVKcJC
         hW/2HrD9e0ytXtQyeHvMmY8NCpaRfvw1MvZxCMtWNxJ0uco+SsLYPDCQHAcBpLSl/AqZ
         yinTpoRoRzhwWBRSfaDJK3c8Nalug72KH0T8mCWak3FavMcaBr/yRlYQtIEftMIU034J
         epsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fU6kxbRE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si1256936iov.75.2021.05.05.19.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 May 2021 19:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fU6kxbRE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1leTj4-00006H-O9
	for alex.bennee@linaro.org; Wed, 05 May 2021 22:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1leTiq-0008Uc-Kd; Wed, 05 May 2021 22:26:40 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1leTil-0000lV-4H; Wed, 05 May 2021 22:26:40 -0400
Received: by mail-oi1-x22c.google.com with SMTP id u16so4147105oiu.7;
 Wed, 05 May 2021 19:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZnY2dkL8b81cfCirToq00pKKe1qP9eFw7vBW4dzRYyE=;
 b=fU6kxbRElqdFeyOAa9HkXpUC0B7XdNrSCQEsmN4LmJBjFpqqpkf0/aPsbwFMxO4Itw
 UobLZMRpBwjt+3Mapj8dEAHqM38ZaP5YMzqjXHQpgqCEsO8f3eOZtnM8kkcxe0snKErs
 KMDhmDRfS9lw1ESJjh5MjcidNoZQ8fPrB45Y7jixodMTbEwYcSiMiziHA3p6LkJ0L/N1
 zpELx+wXYtDFSBsi29aYT/AkNcDSXQeww0mXBfGG4NU28CBIZewmAvryjGRlF+d81vk6
 X6EZPyzb241E/Rl9EWuwiUYnVffHmnQotZEIX32MclTB5YJ72Z+OHJfbcilubVOVhOH9
 b77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZnY2dkL8b81cfCirToq00pKKe1qP9eFw7vBW4dzRYyE=;
 b=uPdim0C0KpQZnC5Sfi4qhIXtHySn59hJXx0wPos2X+EPeMTssvHjxa072CM/s/Poqg
 v1do874A78qYfJlr8B8mpWASZSG+oGjpzJDZtI9/H46trF57j9sUdtFHWy4gz91N0Mxn
 ijam3IlqLBAKGJ5/lRKvemzEtdRX7qij+JyRXJ8FJqzQsA8kNYizB9A7xYtETM7dBoSp
 rxetsVI4YSfhP1I6gMb1JLT2N6N2pxVHmi4AM1Dwien3ZeT5+brBkOZoy30kcapf6gGN
 +43JIid7+0egvGSzDzEdgZgXEp+WFu7D5hiXeKuaQhLVsp6XVBMADNBCeFmzP6Z+he8s
 1OeA==
X-Gm-Message-State: AOAM531E56bzu8U7Eugs/oBPVnPInqnKSfYbibOTmiGCW7h27XOjLqhY
 qeNgBqsNaVKQnI5Tu/ax0qM/8sJhuVE=
X-Received: by 2002:a05:6808:10d0:: with SMTP id
 s16mr1382838ois.10.1620267992591; 
 Wed, 05 May 2021 19:26:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v19sm295224otq.35.2021.05.05.19.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 19:26:32 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210504124140.1100346-1-linux@roeck-us.net>
 <CAEUhbmVPqHyfZXSR0TS0_E1x-BbfHN869fjZWjWxQx4ASLVGnA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9
Message-ID: <df7e51cd-9c16-fccf-b811-f35144888df3@roeck-us.net>
Date: Wed, 5 May 2021 19:26:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVPqHyfZXSR0TS0_E1x-BbfHN869fjZWjWxQx4ASLVGnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KiHwaiTkssHA

On 5/5/21 6:58 PM, Bin Meng wrote:
> Hi Guenter,
> 
> On Tue, May 4, 2021 at 8:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Commit dfc388797cc4 ("hw/arm: xlnx: Set all boards' GEM 'phy-addr'
>> property value to 23") configured the PHY address for xilinx-zynq-a9
>> to 23. When trying to boot xilinx-zynq-a9 with zynq-zc702.dtb or
>> zynq-zc706.dtb, this results in the following error message when
>> trying to use the Ethernet interface.
>>
>> macb e000b000.ethernet eth0: Could not attach PHY (-19)
>>
>> The devicetree files for ZC702 and ZC706 configure PHY address 7. The
>> documentation for the ZC702 and ZC706 evaluation boards suggest that the
>> PHY address is 7, not 23. Other boards use PHY address 0, 1, 3, or 7.
>> I was unable to find a documentation or a devicetree file suggesting
>> or using PHY address 23.
> 
> I can't find one neither :(
> 
>> The Ethernet interface starts working with
>> zynq-zc702.dtb and zynq-zc706.dtb when setting the PHY address to 7,
>> so let's use it.
>>
>> Cc: Bin Meng <bin.meng@windriver.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  hw/arm/xilinx_zynq.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>> index 8db6cfd47f..5ac0294f9e 100644
>> --- a/hw/arm/xilinx_zynq.c
>> +++ b/hw/arm/xilinx_zynq.c
>> @@ -119,7 +119,7 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
>>          qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
>>          qdev_set_nic_properties(dev, nd);
>>      }
>> -    object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
>> +    object_property_set_int(OBJECT(dev), "phy-addr", 7, &error_abort);
>>      s = SYS_BUS_DEVICE(dev);
>>      sysbus_realize_and_unref(s, &error_fatal);
>>      sysbus_mmio_map(s, 0, base);
>> --
> 
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> 
> While we are here, could you please create a doc for the target you
> are testing with Linux/U-Boot/etc?
> 
> I was having a hard time booting upstream U-Boot/Linux on QEMU zynqmp before.
> 

Everything I have is in my repository at
    https://github.com/groeck/linux-build-test
My clone of qemu is at
    https://github.com/groeck/qemu

The v6.0.0-local branch in the qemu repository is probably the most relevant.
There are two caveats when trying to boot zynqmp images:
- You may need commit 9bfbe02879 from that branch to boot Linux directly,
  ie without u-boot. That patch was rejected a long time ago (the argument,
  if I recall correctly, was that u-boot should set the clock rates as
  needed).
- Booting zynqmp based images on arm64 with linux 5.6 and later doesn't work
  anymore. This is due to Linux commit 9c8a47b484ed ("arm64: dts: xilinx:
  Add the clock nodes for zynqmp"). Unfortunately, those clocks are tied
  to zynqmq firmware which is not emulated by qemu, so all the drivers
  needed to do anything useful in Linux won't load.

Hope this helps,
Guenter
