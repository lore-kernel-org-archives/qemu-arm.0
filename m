Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2187109lfy;
        Sun, 16 Aug 2020 09:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz04dYyjMUOBR0pTmP4mT58dTU26Te9LjAVwbyibsTr/U/2StCaUu91/BUpLnR3N9mCqnb6
X-Received: by 2002:a25:16d7:: with SMTP id 206mr16024898ybw.402.1597595504952;
        Sun, 16 Aug 2020 09:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597595504; cv=none;
        d=google.com; s=arc-20160816;
        b=lIQcVDo3nYxCH6+rJ/Cm++NWIHyFHV5zIcqnZJTmYEkqGrXVxD22JqZqsffa3dn2EA
         52DNDmwXrGpRk3dASZ5RRLgN5/BtM32vwo36vb9DBkzQIEE2/WgN/d0vge87Mem5n3Ss
         ghiopFCFb1L0iGTqryZiHvNhMt7KPgwZTsT6UOIZr52g+qSPLrB0xMEYBoeHj1jqwC6H
         qWiaQyxT5NNXx2T22yrMdLfhJ12rp73ltnbyaZxvDgaMDs1gEPJEPanv756LpM/HOK+n
         SQ5K+uov0shKp+Stan6pVeZwZO/xNLWZUIOo59XgcEhS5V/SIkMdtNYxfIF0FJtdm6eH
         pfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=P+YF+pu8frl+VmvrUhoikCYvioSqDUo2f9h3KfJ+e7o=;
        b=fWxo5gbBUAH8GGQnRWLwb5jOFhw5jz/T9QKWcLB6X33xixDyFU9MgmKC1RnT1QwxxK
         DnKqFnVYuWKuta3/QeZ3NbiEXk5e0WgmBem+uQO+xPxVgeMpaQso87s3Af9HBb5mvwW4
         lOYiH3ZiB9A0ScSCQJYN/aoMG9dycvyWhhLvM8z7a9xmdGtg+jmXw/gsjUOhOBsbrBW3
         BVmULYXVu42X/tyHGrMEulBruwfUyixH7PK1NTz1i6CpwDN60Dihh+s7gCy6h94oyXed
         V5uhauftpc5jJ6mb9RSSFktnkyLpsh7fw35kFrBjVllakv6pE/s8cW06RKNw7KOkJqxQ
         2J/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kc0MBooV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 185si2314814ybv.47.2020.08.16.09.31.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Aug 2020 09:31:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kc0MBooV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7LZQ-0005oQ-A2
	for alex.bennee@linaro.org; Sun, 16 Aug 2020 12:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k7LZG-0005o8-Dg; Sun, 16 Aug 2020 12:31:34 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k7LZE-0002OB-Bl; Sun, 16 Aug 2020 12:31:34 -0400
Received: by mail-wm1-x344.google.com with SMTP id p14so11420787wmg.1;
 Sun, 16 Aug 2020 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P+YF+pu8frl+VmvrUhoikCYvioSqDUo2f9h3KfJ+e7o=;
 b=Kc0MBooVrCC5K/jfE4Ow5Bkaz9v441aqmmufvGbo/pVu/Rf1Q3muewlwzhrWm+/Kmv
 jmFDIJmMvD0k2Z963f8s8zeFMWO40VmrnafyAWsoeNAl4aE05cEnqEonrguM9iq1ui5r
 h0J+j+COYDsl4+LBlTyWc7r3lHHcAtbZuaTbmB6f5jt3wdapGc8eSTzv0LjsmtKcl4k5
 MmEMaZQs3u/y7/c2VcAggwzcbnE/nSmsXbMac8jkcjc8skaLVgMX7yZjuJhAA/53vIWy
 B0ambjP5FjWZfz6s7B0uDU21SaXsYoacLAR+44Ns4Vps36wa7m7m2auseEfnU3ec3Z9S
 heVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P+YF+pu8frl+VmvrUhoikCYvioSqDUo2f9h3KfJ+e7o=;
 b=mjfOob9RLHkWU7vPoiqukHS2bFTrtq6e5dyStHCfkxaxIdptK3GV78RC1hZcvs4Lxq
 X2gNPmGc0PkgiG9tCroxv+fSpuWswVfwdgq3l2fg/IfyxCrm+Ow/NOvEvk1mU0ImBxy6
 ZKD7QeoYZ6krdrB3j++tPPEMv8hBQLKs9t2xy8RteUgYjB9MdAycpmRYfxPm9HPqrVAI
 Z8MytR5zVErSyz9Jmy5ZwX22W8ArHHMS6CQn52VA8HKCHgXzTOlF27GAYhpLyoRaeNQ+
 WYTAOi/zwtiEDY/1MVVlomG5VDGv7W1iXp1ZqleVZzG7SYiylkAkPa8MHhHSw3LuZh7f
 1GZw==
X-Gm-Message-State: AOAM533M8NJ5AQg36N5nKjgpZFvLF88mACKHhOqS9DtZ+us6VaCB+aX9
 BNahXXnqo/VTubghjSW7Dww=
X-Received: by 2002:a1c:c1:: with SMTP id 184mr12031290wma.105.1597595490161; 
 Sun, 16 Aug 2020 09:31:30 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id p15sm26553172wrj.61.2020.08.16.09.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2020 09:31:29 -0700 (PDT)
Subject: Re: [PATCH 14/18] hw/net: cadence_gem: Add a new 'phy-addr' property
To: Bin Meng <bmeng.cn@gmail.com>, Nathan Rossi <nathan@nathanrossi.com>
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
 <1597423256-14847-15-git-send-email-bmeng.cn@gmail.com>
 <e97e1bc4-277d-9fdd-1372-f69d22b4a7e4@amsat.org>
 <CAEUhbmX6O7gGc2+sZFXSve=rBJLZQ5ts2sfWM=OU6k+4j-uryg@mail.gmail.com>
 <CA+aJhH1YooxPkaT2xc4o6CjDYLm++6psSc3ZZW-EiAPFCz=PjA@mail.gmail.com>
 <CAEUhbmXQ6yxRMcP_LqaUTQra33iLsbU=vVs0MCaQkMU_ryUAUA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e17abf75-a8db-712d-504a-2177ebca32cf@amsat.org>
Date: Sun, 16 Aug 2020 18:31:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXQ6yxRMcP_LqaUTQra33iLsbU=vVs0MCaQkMU_ryUAUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, John Linn <john.linn@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YRyMWzRlrGWe

On 8/16/20 3:42 PM, Bin Meng wrote:
> On Sun, Aug 16, 2020 at 8:08 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
>>
>> On Sun, 16 Aug 2020 at 18:29, Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> On Sat, Aug 15, 2020 at 5:06 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> On 8/14/20 6:40 PM, Bin Meng wrote:
>>>>> From: Bin Meng <bin.meng@windriver.com>
>>>>>
>>>>> At present the PHY address of the PHY connected to GEM is hard-coded
>>>>> to either 23 (BOARD_PHY_ADDRESS) or 0. This might not be the case for
>>>>> all boards. Add a new 'phy-addr' property so that board can specify
>>>>> the PHY address for each GEM instance.
>>>>>
>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>>> ---
>>>>>
>>>>>  hw/net/cadence_gem.c         | 7 +++++--
>>>>>  include/hw/net/cadence_gem.h | 2 ++
>>>>>  2 files changed, 7 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>>>>> index a93b5c0..9fa03de 100644
>>>>> --- a/hw/net/cadence_gem.c
>>>>> +++ b/hw/net/cadence_gem.c
>>>>> @@ -1446,7 +1446,8 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
>>>>>              uint32_t phy_addr, reg_num;
>>>>>
>>>>>              phy_addr = (retval & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_ADDR_SHFT;
>>>>> -            if (phy_addr == BOARD_PHY_ADDRESS || phy_addr == 0) {
>>>>> +            if (phy_addr == BOARD_PHY_ADDRESS || phy_addr == 0 ||
>>>>> +                phy_addr == s->phy_addr) {
>>>>>                  reg_num = (retval & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC_REG_SHIFT;
>>>>>                  retval &= 0xFFFF0000;
>>>>>                  retval |= gem_phy_read(s, reg_num);
>>>>> @@ -1569,7 +1570,8 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>>>>>              uint32_t phy_addr, reg_num;
>>>>>
>>>>>              phy_addr = (val & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_ADDR_SHFT;
>>>>> -            if (phy_addr == BOARD_PHY_ADDRESS || phy_addr == 0) {
>>>>> +            if (phy_addr == BOARD_PHY_ADDRESS || phy_addr == 0 ||
>>>>> +                phy_addr == s->phy_addr) {
>>>>>                  reg_num = (val & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC_REG_SHIFT;
>>>>>                  gem_phy_write(s, reg_num, val);
>>>>>              }
>>>>> @@ -1682,6 +1684,7 @@ static Property gem_properties[] = {
>>>>>      DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
>>>>>      DEFINE_PROP_UINT32("revision", CadenceGEMState, revision,
>>>>>                         GEM_MODID_VALUE),
>>>>> +    DEFINE_PROP_UINT8("phy-addr", CadenceGEMState, phy_addr, 0),
>>>>
>>>> This patch would be complete by moving the BOARD_PHY_ADDRESS definition
>>>> to each board using this NIC, and setting the "phy-addr" property to
>>>> this value.
>>>
>>> I actually have no idea which board in QEMU is using this special PHY
>>> address instead of default 0.
>>
>> Given Xilinx's QEMU fork has not used this value for quite some time,
>> I suspect it was only used to match an early chip emulation
>> platform/board.
>>
>> https://github.com/Xilinx/qemu/blame/master/hw/net/cadence_gem.c#L248
>>
>>>
>>> It looks BOARD_PHY_ADDRESS has been there since the initial version of
>>> the cadence_gem model.
>>>
>>> commit e9f186e514a70557d695cadd2c2287ef97737023
>>> Author: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
>>> Date:   Mon Mar 5 14:39:12 2012 +1000
>>>
>>>     cadence_gem: initial version of device model
>>>
>>>     Device model for cadence gem ethernet controller.
>>>
>>>     Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
>>>     Signed-off-by: John Linn <john.linn@xilinx.com>
>>>     Acked-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>>     Signed-off-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>>
>>> Later PHY address 0 was added via the following commit:
>>>
>>> commit 553893736885e4f2dda424bff3e2200e1b6482a5
>>> Author: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>> Date:   Thu Apr 3 23:55:19 2014 -0700
>>>
>>>     net: cadence_gem: Make phy respond to broadcast
>>>
>>>     Phys must respond to address 0 by specification. Implement.
>>>
>>>     Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
>>>     Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>>     Message-id:
>>> 6f4d53b04ddbfb19895bfb61a595e69f1c08859a.1396594056.git.peter.crosthwaite@xilinx.com
>>>     Reviewed-by: Beniamino Galvani <b.galvani@gmail.com>
>>>     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>
>>> I doubt the commit message said that PHYs must respond to address 0. I
>>> am not aware of such specs. The issue was probably that whatever board
>>> 2nd commit was tested against did not have a PHY at address
>>> BOARD_PHY_ADDRESS.
>>
>> It is common for phy devices to support it as a broadcast address. It
>> is also commonly written in Xilinx documentation that it is treated as
>> a broadcast address. e.g. the axi ethernet core
>> (https://www.xilinx.com/support/documentation/ip_documentation/axi_ethernet/v7_0/pg138-axi-ethernet.pdf
>> page 45). But 802.3 does not require it, instead address 0 is only
>> reserved.
>>
>> With this commit the "must" refers to the device specification, in
>> that QEMU is emulating a real phy (though more specifically the phy(s)
>> that were being emulated for Zynq boards) that does respond to address
>> 0 as a broadcast. This change was a trade off in order to make QEMU
>> behave as it would on hardware, such that software using address 0 as
>> broadcast would work correctly.
>>
> 
> Thanks Nathan. So is it safe to just remove BOARD_PHY_ADDRESS and set
> "phy-addr" property default value to 0?

I'd do as following:

First patch, introduce "phy-addr" property (default to
BOARD_PHY_ADDRESS) and remove BOARD_PHY_ADDRESS in code:

    DEFINE_PROP_UINT8("phy-addr", CadenceGEMState,
                      phy_addr, BOARD_PHY_ADDRESS),

Second patch set "phy-addr" to BOARD_PHY_ADDRESS in all
current boards using this PHY and set the default to 0.

Thanks,

Phil.

> 
> Regards,
> Bin
> 
