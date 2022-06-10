Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp948210lfb;
        Fri, 10 Jun 2022 00:13:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUalQjEmIDqsim2TABbNAGkS4u4kbnJYpjRRhH6WhVVha+lWh2wj2FAnEhxQQ7Z6KgLaF4
X-Received: by 2002:ac8:7c52:0:b0:305:a14:6f77 with SMTP id o18-20020ac87c52000000b003050a146f77mr7690195qtv.441.1654845204581;
        Fri, 10 Jun 2022 00:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654845204; cv=none;
        d=google.com; s=arc-20160816;
        b=mOQVqPCeWDbKON104tRsPlyQLj9XLcHGf3yhQFmPlPeYNhpjeqtbrDFjmaLSvyzFAV
         ss26V3nJ7FeEdZkkuWk6nrkGHYFdV7Xgc7u80NLlm/tA6lRmCQnWfVKNRwzlK8dweiZt
         zLPqJlvnSmkG9SUmflZDmxYc3SrGddShJQHV7nZfbZl8kMyYbSQHB7hHp6o8/RmRyTjc
         f1E0ra4ThQKScdyUfybA4farB00flzRG3jinlUqF6ypeSJzSw9l7cAjWF67h2RCF6Cee
         xHpr4qsmit1rHtp82Kj1qsnxCMTykqZKKUmmcKTkQ4nI/OgWohb2WLDfKHU71+6nwg9r
         w7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MQoWSBPAazgi/zRnUDA1emvX6jvwepJIH6mNvnoVeZ8=;
        b=uI+iA1RrsausOWeS+Yl8fOhpj9duLYpNFsDfDi3T/48n/td1XIiCwx6RiSnc5+4KkU
         w8n2Jps8C5+MActbcmMLQoFWY3rIXctwPWtYFyf5SatfMsKwTyHsZMztr1tT1weNw1RM
         BOhsxACT67w4lN3TnPbAj5AWU6esgTGcuykVNOlpdkjLa3/cO1zGP5m2XJujAs4XMFjb
         p+cIh7tOHfuH1sxw2k43hxVMVqj4oc7PBAFvUWnni+0iqWnr9rNN0mCLgZDU1D4+JBRc
         kLaNFzLVy9io1kv6DJM9vHS03O2ZAmARfy72NfFnrLmE8GJILmw17py59xiejEYgppN6
         kWvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=C5DycRtj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26-20020a0cb21a000000b0046bb9ae6aa0si4516904qvd.126.2022.06.10.00.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jun 2022 00:13:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=C5DycRtj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzYpe-0007qr-7i
	for alex.bennee@linaro.org; Fri, 10 Jun 2022 03:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYmD-0005fY-6j; Fri, 10 Jun 2022 03:09:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYmB-0007UW-O7; Fri, 10 Jun 2022 03:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MQoWSBPAazgi/zRnUDA1emvX6jvwepJIH6mNvnoVeZ8=; b=C5DycRtjGEs4HNOxn1JTF/MyPl
 XSc9HUYNqw7uyLikZxbSjkA+ZHd8ezidi4C0lfsFC8O3wGbzQQ1t5ISdbhEiL1hU7hICAIU2ZN5qW
 z8mMzP8mltdcrikelWFTU1gRirfywqOdvEO3bmIWQkPImsdsTxuCYL2bEeWf56L0NwS6kUQScyhBv
 GVbiB7luW8htTOczYyAdxfd/LOkZk5Aguvim5BFx+chL6PdimoA4P7ibssapTpmWRKBzNDHP2aELH
 9ACNl6LymmSY0bf/tHerqA5bxLVBI5Md4gxY610Kvj5gBrju4tA9p9kiqkzx8HF6DCsLFXvB7ZB9o
 GlB6OEV1FfnkfpCJ3LDJkawP0R1r+zjvx/PXaMcH6oNciBTfdFNFj7LaTdL8baDv+PfHkGIl2633n
 SIEs3IsjUmiWsCqR1CN7elYoQ9sAhU1XWxJM3C9+M5hVUHQZlLKQp2NheHlC01QHfAewZxozoAdDK
 2Q/ZojIKfxcuqae4JsYQNfLlkpykH9V416gDaHS1btAg3z/3xteJV1uV3kdLAfFUksgKeTeDzm6Hv
 hz44fskuG7JQMSi8WoAW1E27ngPTNnLR37y+M5830I9WNLy6iND2broJJrOfBI8CFn0JRrSvYCVsC
 0POtY47AzjGIVAJiLcmmj1KD8rzoudgtHgU4thnvQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nzYku-0001Oe-Ns; Fri, 10 Jun 2022 08:08:32 +0100
Message-ID: <641ed689-aeae-f2a5-cf0b-929da12a81bf@ilande.co.uk>
Date: Fri, 10 Jun 2022 08:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-35-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8dW9dAez-jtjiTiDN27DiqfbkOL5epp9PG_ibvsaQhwg@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA8dW9dAez-jtjiTiDN27DiqfbkOL5epp9PG_ibvsaQhwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 34/50] ps2: add gpio for output IRQ and optionally use it
 in ps2_raise_irq() and ps2_lower_irq()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g0rqYDYfdTS9

On 09/06/2022 12:05, Peter Maydell wrote:

> On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> Define the gpio for the PS2 output IRQ in ps2_init() and add logic to optionally
>> use it in ps2_raise_irq() and ps2_lower_irq() if the gpio is connected. If the
>> gpio is not connected then call the legacy update_irq() function as before.
>>
>> This allows the incremental conversion of devices from the legacy update_irq()
>> function to use gpios instead.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/input/ps2.c         | 21 +++++++++++++++++++--
>>   include/hw/input/ps2.h |  4 ++++
>>   2 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
>> index 214dda60bf..891eb7181c 100644
>> --- a/hw/input/ps2.c
>> +++ b/hw/input/ps2.c
>> @@ -24,6 +24,7 @@
>>
>>   #include "qemu/osdep.h"
>>   #include "qemu/log.h"
>> +#include "hw/irq.h"
>>   #include "hw/sysbus.h"
>>   #include "hw/input/ps2.h"
>>   #include "migration/vmstate.h"
>> @@ -174,12 +175,20 @@ void ps2_queue_noirq(PS2State *s, int b)
>>
>>   static void ps2_raise_irq(PS2State *s)
>>   {
>> -    s->update_irq(s->update_arg, 1);
>> +    if (s->irq) {
> 
> I know this code is going to go away in patch 50, but cleaner to write
>   if (qemu_irq_is_connected(s->irq))
> rather than directly testing for NULL.

Thanks, I wasn't aware of that function. I'll update it for v2.

>> +        qemu_set_irq(s->irq, 1);
>> +    } else {
>> +        s->update_irq(s->update_arg, 1);
>> +    }
>>   }
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM


ATB,

Mark.
