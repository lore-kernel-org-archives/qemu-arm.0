Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6705374ejb;
        Mon, 2 Jan 2023 05:32:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvUC/H4IQaNflTYjCRwyU9WUtshcI8H6STGDNZ/uv0rv1isUtYsT9pEmYefJSmElYkAUOmL
X-Received: by 2002:a67:dd8c:0:b0:3cd:1a40:6a10 with SMTP id i12-20020a67dd8c000000b003cd1a406a10mr5004351vsk.19.1672666370630;
        Mon, 02 Jan 2023 05:32:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672666370; cv=none;
        d=google.com; s=arc-20160816;
        b=rCUAA5TwL6vIxNAoHeQuYyRKBpGg4tgt/MUY0KqdUvb8ekLToQswlOPw4OBisABR4g
         ID5NW4szqQ5fa47up/yf/ZBHrAAgp0+6Mi0AihhPl1eq0DRuTp2/OSo4yFvs0x3RCpG5
         XTEPPoBPWp64j5t6T36OBERdSxRfccOCLaxlbCOBXag/QeMYGZ+SKKmDZQHed7voKZ3l
         w8N8lLrXxrfGBi5IvL7zlmWB6cxJqfyOvw7mU+VZNkJG2c/qwtWwDSDGUYh9+yFbFg+X
         zy6sHCvXOxuGgrnvZ7XhWBc7duWsjJWeW/9bq17+xnVUgAXnEmzlVfqJqHXLsMzZ9FUg
         gWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=EGDDIrxE9N8fdyHWXlu8xqb9xeCtmsG80bWxmPb5eFU=;
        b=ajD6mVdBRA8aYUHne1TXtlZg2Qg6Y2jM9M+Ew8JLMl5XDnFzY9LAEZGSOM8BYcZBQY
         H0Ayl1UxOuc8w53O1S9X1niGrNvx+BDXVq34vlPsW2Bw4UbDfnCk7hJ2AVfolGHstEce
         PsSxfzGHcMVkqdIQfmNdaP1jB/+YPyjDAs3uPLo3xM3bWAi92ZP3VI2UAk9GBJ6LGEgQ
         2CDpO0TBLES3aqmK2KSSH1cENtGMjn9/LIz7LG5trnkBDnexMw0mPDoqa4EdSifNWCwF
         7dWF/i78dvNX9sbRc88Fw7cW9/Lb8QrOB/O3FAf3SFV/Ahw85o3N103ojhJy+5rdxKfN
         LIlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a37e106000000b006ec566d8772si13763996qkm.376.2023.01.02.05.32.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 05:32:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pCKvX-0005uG-0f; Mon, 02 Jan 2023 08:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCKuk-0005rn-Ei
 for qemu-arm@nongnu.org; Mon, 02 Jan 2023 08:31:57 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCKuh-0004qR-90
 for qemu-arm@nongnu.org; Mon, 02 Jan 2023 08:31:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AAEB72CD60;
 Mon,  2 Jan 2023 13:31:33 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:31:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00547d1667a-e801-4821-ac8f-7cd8c19d85d3,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <19cb9a03-c98e-cdff-1474-2db0c55ae971@kaod.org>
Date: Mon, 2 Jan 2023 14:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to
 cover more registers
Content-Language: en-US
To: "Dong, Eddie" <eddie.dong@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Cleber Rosa
 <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-3-philmd@linaro.org>
 <BL0PR11MB30427F00C5A2058197E9B6488AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <BL0PR11MB30427F00C5A2058197E9B6488AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e30b8e58-1269-4890-b3cc-b7624044cc9a
X-Ovh-Tracer-Id: 15903617659435453255
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepvgguughivgdrughonhhgsehinhhtvghlrdgtohhmpdhpuggvlhesmhgvthgrrdgtohhmpdhpuggvlhesfhgsrdgtohhmpdhjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpphgvthgvrhesphhjugdruggvvhdptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtghhrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgrnh
 gurhgvfiesrghjrdhiugdrrghupdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhjohgvlhesjhhmshdrihgurdgruhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdptghrohhsrgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: imOAdrG1GYvw

On 12/31/22 23:52, Dong, Eddie wrote:
>> When booting the Zephyr demo in [1] we get:
>>
>>    aspeed.io: unimplemented device write (size 4, offset 0x185128, value
>> 0x030f1ff1) <--
>>    aspeed.io: unimplemented device write (size 4, offset 0x18512c, value
>> 0x03fffff1)
>>
>> This corresponds to this Zephyr code [2]:
>>
>>    static int aspeed_wdt_init(const struct device *dev)
>>    {
>>      const struct aspeed_wdt_config *config = dev->config;
>>      struct aspeed_wdt_data *const data = dev->data;
>>      uint32_t reg_val;
>>
>>      /* disable WDT by default */
>>      reg_val = sys_read32(config->ctrl_base + WDT_CTRL_REG);
>>      reg_val &= ~WDT_CTRL_ENABLE;
>>      sys_write32(reg_val, config->ctrl_base + WDT_CTRL_REG);
>>
>>      sys_write32(data->rst_mask1,
>>                  config->ctrl_base + WDT_SW_RESET_MASK1_REG);   <------
>>      sys_write32(data->rst_mask2,
>>                  config->ctrl_base + WDT_SW_RESET_MASK2_REG);
>>
>>      return 0;
>>    }
>>
>> The register definitions are [3]:
>>
>>    #define WDT_RELOAD_VAL_REG          0x0004
>>    #define WDT_RESTART_REG             0x0008
>>    #define WDT_CTRL_REG                0x000C
>>    #define WDT_TIMEOUT_STATUS_REG      0x0010
>>    #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
>>    #define WDT_RESET_MASK1_REG         0x001C
>>    #define WDT_RESET_MASK2_REG         0x0020
>>    #define WDT_SW_RESET_MASK1_REG      0x0028   <------
>>    #define WDT_SW_RESET_MASK2_REG      0x002C
>>    #define WDT_SW_RESET_CTRL_REG       0x0024
>>
>> Currently QEMU only cover a MMIO region of size 0x20:
>>
>>    #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
>>
>> Change to map the whole 'iosize' which might be bigger, covering the other
> 
> The root cause is that ASPEED_WDT_REGS_MAX is too small, right?
> Probably the Qemu is emulating an old version of the hardware.
> 
> Given the meaning of ASPEED_WDT_REGS_MAX, it should be larger than iosize, not?
> Probably ASPEED_WDT_REGS_MAX should be per device type (aspeed_2400/2500),

yes. We would need a new class attribute for it. Please use these values, they
should be correct.

            #regs    iosize

AST2400   0x18/4      0x20
AST2500   0x20/4      0x20
AST2600   0x30/4      0x40
AST1030   0x4C/4      0x80


AFAICT, the WDT logic was changed in a compatible way with the previous generation.

Thanks

C.

> while iosize is for all devices, and its initial value comes from the per device type REGS_MAX.
> 
>> registers. The MemoryRegionOps read/write handlers will report the accesses
>> as out-of-bounds guest-errors, but the next commit will report them as
>> unimplemented.
>>
>> [1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
>> [2] https://github.com/AspeedTech-BMC/zephyr/commit/2e99f10ac27b
>> [3] https://github.com/AspeedTech-
>> BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31
>>
>> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/watchdog/wdt_aspeed.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c index
>> 958725a1b5..eefca31ae4 100644
>> --- a/hw/watchdog/wdt_aspeed.c
>> +++ b/hw/watchdog/wdt_aspeed.c
>> @@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev,
>> Error **errp)  {
>>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>       AspeedWDTState *s = ASPEED_WDT(dev);
>> +    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
>>
>>       assert(s->scu);
>>
>> @@ -271,7 +272,7 @@ static void aspeed_wdt_realize(DeviceState *dev,
>> Error **errp)
>>       s->pclk_freq = PCLK_HZ;
>>
>>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
>> -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
>> +                          TYPE_ASPEED_WDT, awc->iosize);
>>       sysbus_init_mmio(sbd, &s->iomem);
>>   }
>>
>> --
>> 2.38.1
>>
> 

