Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1884615lfb;
        Tue, 14 Jun 2022 00:17:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJuGJVaqascAEZCZ3pz6yCgfmiGzgcAszmP3coPeeD1DAypcHBFqWZ77/jb9qUjQYvDc/j
X-Received: by 2002:a05:622a:3cf:b0:305:2ea7:238 with SMTP id k15-20020a05622a03cf00b003052ea70238mr2996304qtx.334.1655191052503;
        Tue, 14 Jun 2022 00:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655191052; cv=none;
        d=google.com; s=arc-20160816;
        b=UMnJWMUO34utGlTib7+AKNq3/aDpsBE+UBxHDjc/2E4FJkA+vsyzC+Dd66EMv5k6bc
         GKN/oTQF5LNOrQaFUwA4C6WLXUkFiGWdbdgMKXyR7EdfMGurt+MXOLqySEQWdO9Os5DJ
         TiIPABUXqoYZ91Yh88m4fy9+RQQPZTT4ub3sBEbCxTXByUr7pn+O2mFObfa92aTM0xXz
         o5NIK3Tb1vjrSGstqzwokz1Ch3LIp2r3w1n3KrajNoka2YPAi0GZy5cxI+6nlacVnDjq
         XCdnUyan0PGdUl3hfCvHXl4hN2j/Vhbe40zhMybdunnqNGgbckPOU/6qnzxTHhCdspqh
         YBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=bB8iOi6eUu1+HsSDLek25BI2TBw1owVuB7kHzjvSn9c=;
        b=dhJtrVvbl0EcNT8jYVQWP8AptusGMoWLU8zQM2zICRbBxZEhpjeVBt2m0aWyLLK5sM
         fhFvNuL3ORdG8F8/Cb6cXvlxEVb0F6CaPM1GspweY8qX/mv0cP2thp4C6f9Qlkg9RloO
         JMM5c0AcJpeL+ByAv2WGXMFXkc/oJmcGFQEKJZXV39UWN5Hm7HdJMD66ZqiqTSArLCHy
         Un57TY00+e2ZM3l7SDQhuSwIuOyRVdqPtBzjn7Aws8Y3JD1/bTXmDogCHt41Jk3bfvce
         7Rnk2xKDhAlHKq2WC4PWt2FVzcjZITCKKXTgaJSePtMDbNjqM/ZmanTrJqx62R8peMIk
         tTHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020a05620a455100b006a68e1198d1si6545193qkp.403.2022.06.14.00.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jun 2022 00:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o10nr-00025d-8U
	for alex.bennee@linaro.org; Tue, 14 Jun 2022 03:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o10kD-0007s5-0N
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 03:13:45 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:51185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o10k8-0001Im-M1
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 03:13:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E8F18239CD;
 Tue, 14 Jun 2022 07:13:27 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 14 Jun
 2022 09:13:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b55bee1e-ccf3-4fd9-918a-07b486922b43,
 521BD0C7D9B1F43011BF9161B4E1AE1788365C94) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <673b4b6c-b107-ab03-fe51-752ec45e6a04@kaod.org>
Date: Tue, 14 Jun 2022 09:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Content-Language: en-US
To: Dan Zhang <dz4list@gmail.com>, Peter Delevoryas <pdel@fb.com>
CC: Iris Chen <irischenlj@fb.com>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, "patrick@stwcx.xyz"
 <patrick@stwcx.xyz>, Alistair Francis <alistair@alistair23.me>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "hreitz@redhat.com"
 <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "thuth@redhat.com"
 <thuth@redhat.com>, "lvivier@redhat.com" <lvivier@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, Iris Chen <irischenlj@gmail.com>, Francisco Iglesias
 <frasse.iglesias@gmail.com>
References: <20220609031320.2212468-1-irischenlj@fb.com>
 <20220609192201.GC10629@fralle-msi>
 <810A50A3-E9C2-4A62-ADF9-89DCC9BBD9BB@fb.com>
 <YqggfkLuTz4ryuL8@zhdaniel-fedora-MJ0FVN0B>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YqggfkLuTz4ryuL8@zhdaniel-fedora-MJ0FVN0B>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 40721ce8-5cfc-404d-9d3b-6d424c592819
X-Ovh-Tracer-Id: 3825526410624142282
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddukedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrhgrshhsvgdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1JTk0ko3wujn

Hello Dan

On 6/14/22 07:45, Dan Zhang wrote:
> Just find out how to use mutt to reply all in the thread.
> repeat the previous comments. Add STATE_HIZ to handle decode_new_command
> aborting gracefully.
> 
> On Thu, Jun 09, 2022 at 08:06:00PM +0000, Peter Delevoryas wrote:
>>
>>
>>> On Jun 9, 2022, at 12:22 PM, Francisco Iglesias <frasse.iglesias@gmail.com> wrote:
>>>
>>> Hi Iris,
>>>
>>> Looks good some, a couple of comments below.
>>>
>>> On [2022 Jun 08] Wed 20:13:19, Iris Chen wrote:
>>>> From: Iris Chen <irischenlj@gmail.com>
>>>>
>>>> Signed-off-by: Iris Chen <irischenlj@gmail.com>
>>>> ---
>>>> Addressed all comments from V1. The biggest change: removed object_class_property_add.
>>>>
>>>> hw/block/m25p80.c             | 37 +++++++++++++++++++++++++++++++++++
>>>> tests/qtest/aspeed_smc-test.c |  2 ++
>>>> 2 files changed, 39 insertions(+)
>>>>
>>>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>>>> index 81ba3da4df..1a20bd55d4 100644
>>>> --- a/hw/block/m25p80.c
>>>> +++ b/hw/block/m25p80.c
>>>> @@ -27,12 +27,14 @@
>>>> #include "hw/qdev-properties.h"
>>>> #include "hw/qdev-properties-system.h"
>>>> #include "hw/ssi/ssi.h"
>>>> +#include "hw/irq.h"
>>>> #include "migration/vmstate.h"
>>>> #include "qemu/bitops.h"
>>>> #include "qemu/log.h"
>>>> #include "qemu/module.h"
>>>> #include "qemu/error-report.h"
>>>> #include "qapi/error.h"
>>>> +#include "qapi/visitor.h"
>>>> #include "trace.h"
>>>> #include "qom/object.h"
>>>>
>>>> @@ -472,11 +474,13 @@ struct Flash {
>>>>      uint8_t spansion_cr2v;
>>>>      uint8_t spansion_cr3v;
>>>>      uint8_t spansion_cr4v;
>>>> +    bool wp_level;
>>>>      bool write_enable;
>>>>      bool four_bytes_address_mode;
>>>>      bool reset_enable;
>>>>      bool quad_enable;
>>>>      bool aai_enable;
>>>> +    bool status_register_write_disabled;
>>>>      uint8_t ear;
>>>>
>>>>      int64_t dirty_page;
>>>> @@ -723,6 +727,21 @@ static void complete_collecting_data(Flash *s)
>>>>          flash_erase(s, s->cur_addr, s->cmd_in_progress);
>>>>          break;
>>>>      case WRSR:
>>>> +        /*
>>>> +         * If WP# is low and status_register_write_disabled is high,
>>>> +         * status register writes are disabled.
>>>> +         * This is also called "hardware protected mode" (HPM). All other
>>>> +         * combinations of the two states are called "software protected mode"
>>>> +         * (SPM), and status register writes are permitted.
>>>> +         */
>>>> +        if ((s->wp_level == 0 && s->status_register_write_disabled)
>>>> +            || !s->write_enable) {
>>>
>>> 'write_enable' needs to be true in 'decode_new_cmd' when issueing the WRSR
>>> command, otherwise the state machinery will not advance to this function
>>> (meaning that above check for !s->write_enable will never hit as far as I can
>>> tell). A suggestion is to move the check for wp_level and
>>> status_reg_wr_disabled into 'decode_new_cmd' to for keeping it consistent.
>>
>> Oh good catch! Yes actually, in our fork, we also removed the write_enable
>> guard in decode_new_cmd. We either need both checks in decode_new_cmd,
>> or both checks in complete_collecting_data.
>>
>> I think we had some difficulty deciding whether to block command decoding,
>> or to decode and ignore the command if restrictions are enabled.
>>
>> The reason being that, in the qtest, the WRSR command code gets ignored, and
>> then the subsequent write data gets interpreted as some random command code.
>> We had elected to decode and ignore the command, but I think the
>> datasheet actually describes that the command won’t be decoded successfully,
>> so you’re probably right, we should put this logic in decode_new_cmd.
>>
>> Most likely, the qtest will also need to be modified to reset the transfer
>> state machine after a blocked write command. I can’t remember if
>> exiting and re-entering user mode is sufficient for that, but something
>> like that is probably possible.
>>
>> Thanks for catching this!
>> Peter
>>
> 
> I am proposing add a CMDState: STATE_HIZ to handle command decode fail
> situation. When decode_new_command need abort the decoding and ignore
> following
> on input bytes of this transaction, set the state to STATE_HIZ.
> And m25p80_transfer8() will ignore all the following on byte when in
> this state.
> 
> This is to simulating the real device operation behavior
> i.e. Macronix MX66L1G45G data sheet section 8 DEVICE OPERATION described
> ```
> 2. When an incorrect command is written to this device, it enters
> standby mode and stays in standby mode until the next CS# falling edge.
> In standby mode, This device's SO pin should be High-Z.
> ```

Could you please send a patch ?

Thanks,

C.

> BRs
> Dan Zhang
>>>
>>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>>> +                          "M25P80: Status register write is disabled!\n");
>>>> +            break;
>>>> +        }
>>>> +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
>>>> +
>>>>          switch (get_man(s)) {
>>>>          case MAN_SPANSION:
>>>>              s->quad_enable = !!(s->data[1] & 0x02);
>>>> @@ -1195,6 +1214,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>>>>
>>>>      case RDSR:
>>>>          s->data[0] = (!!s->write_enable) << 1;
>>>> +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
>>>> +
>>>>          if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>>>>              s->data[0] |= (!!s->quad_enable) << 6;
>>>>          }
>>>> @@ -1484,6 +1505,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
>>>>      return r;
>>>> }
>>>>
>>>> +static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
>>>> +{
>>>> +    Flash *s = M25P80(opaque);
>>>> +    /* WP# is just a single pin. */
>>>> +    assert(n == 0);
>>>> +    s->wp_level = !!level;
>>>> +}
>>>> +
>>>> static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>>>> {
>>>>      Flash *s = M25P80(ss);
>>>> @@ -1515,12 +1544,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>>>>          s->storage = blk_blockalign(NULL, s->size);
>>>>          memset(s->storage, 0xFF, s->size);
>>>>      }
>>>> +
>>>> +    qdev_init_gpio_in_named(DEVICE(s),
>>>> +                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
>>>> }
>>>>
>>>> static void m25p80_reset(DeviceState *d)
>>>> {
>>>>      Flash *s = M25P80(d);
>>>>
>>>> +    s->wp_level = true;
>>>> +    s->status_register_write_disabled = false;
>>>> +
>>>>      reset_memory(s);
>>>> }
>>>>
>>>> @@ -1601,6 +1636,8 @@ static const VMStateDescription vmstate_m25p80 = {
>>>>          VMSTATE_UINT8(needed_bytes, Flash),
>>>>          VMSTATE_UINT8(cmd_in_progress, Flash),
>>>>          VMSTATE_UINT32(cur_addr, Flash),
>>>> +        VMSTATE_BOOL(wp_level, Flash),
>>>> +        VMSTATE_BOOL(status_register_write_disabled, Flash),
>>>
>>> Above needs to be added through a subsection, you can see commit 465ef47abe3
>>> for an example an also read about this in docs/devel/migration.rst.
>>>
>>> Thank you,
>>> Best regads,
>>> Francisco Iglesias
>>>
>>>
>>>>          VMSTATE_BOOL(write_enable, Flash),
>>>>          VMSTATE_BOOL(reset_enable, Flash),
>>>>          VMSTATE_UINT8(ear, Flash),
>>>> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
>>>> index ec233315e6..c5d97d4410 100644
>>>> --- a/tests/qtest/aspeed_smc-test.c
>>>> +++ b/tests/qtest/aspeed_smc-test.c
>>>> @@ -56,7 +56,9 @@ enum {
>>>>      BULK_ERASE = 0xc7,
>>>>      READ = 0x03,
>>>>      PP = 0x02,
>>>> +    WRSR = 0x1,
>>>>      WREN = 0x6,
>>>> +    SRWD = 0x80,
>>>>      RESET_ENABLE = 0x66,
>>>>      RESET_MEMORY = 0x99,
>>>>      EN_4BYTE_ADDR = 0xB7,
>>>> -- 
>>>> 2.30.2
>>>>
>>>>
>>

