Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp435836lft;
        Mon, 20 Jun 2022 06:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzHgvNQzosoZWqtZldwrJZOAwzZCkQHAron9ro50zOs5wNM6h7FjuAqEa9k2BmY5bSGnDw
X-Received: by 2002:a0c:aa86:0:b0:46b:b0eb:7de3 with SMTP id f6-20020a0caa86000000b0046bb0eb7de3mr18732059qvb.75.1655731412704;
        Mon, 20 Jun 2022 06:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655731412; cv=none;
        d=google.com; s=arc-20160816;
        b=e9y5IdWOeV1Mzun2RnV0oN58QKTGke6rlnjkyjUIJUewhmlAqF2wucrLzULq6/aCjo
         8yHz7o8yHqA+lKjlTOWiJuBwXjuyGywpzHOh7e9uacXdUmVrmCPhSVQ8f03mCv8rf41U
         4qIIqVlm9wEY9AA+9Bb68L4RSo+TCGTZbrNQJP2nZYV/vMu+R/24jrFCTrJwb1If8vYP
         NKRIiSXxIhy8X79K0AvKnbg3+f57O4+KcfRcs1Fr7hGKhS6eDasPRLpv0PDD7QsolA1d
         OQ+jpRrpO2tHvEhcMiRXSUDx/w1+T664p+ZZwfXF7EbRqTmfviWvKb0VdvfuYNYqInMy
         FMhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MqLeeeRys0DVwxgb/0X7DuaU+hbNe6+/PQp46M6bPrE=;
        b=nASkhg1O8JzH1/j8EuMiFZQzzK3oToqQBqwPKadw/ysMDPZ0jiNY2MBopWRtZ9AZBL
         MAhfa+/lTuOl2GBhkmyRat6MrGmf349VH5SQv/ujXPjFqW/BdVASocYTjRS+uvsoYxca
         0t1G5LKuVO/u5PGtL5hXykUFob1OAMfBmyck2gQ1421xndkjL2VWeeSdsf3iYLJMwT13
         2ZSbvL0R7sOScq/v2rI6aKNwECOiEk9EvNZ46UBcuAi5JyulX/nST/ewQCpHjIIFP3SJ
         J2wzVmccX7XNBo412Yt9OOvomO4QkKgxknzdOZofr4wMXZ2sL73V4DTumvihNKVScLQb
         D8Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=GJTbCiKD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020a05622a049000b00304e37a41f8si8719331qtx.250.2022.06.20.06.23.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 06:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=GJTbCiKD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3HNM-0003NQ-73
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 09:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3HMi-0003MH-KT; Mon, 20 Jun 2022 09:22:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3HMg-0006hW-Av; Mon, 20 Jun 2022 09:22:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MqLeeeRys0DVwxgb/0X7DuaU+hbNe6+/PQp46M6bPrE=; b=GJTbCiKDwnKFcRQhM3Hgs3Qy5/
 Hvlv+waDAzgdftMo5dOFQZqpP2Yuh7BhdsQVlQdlnjDLkrKD8RhbHmLblsL1YtbKF67kmH9OkN/l7
 WWNPQr+2wDvh07+5G0c0quNOdXyRvDBa45riFQVFGFEWW7Fax6E6YOG5EFHl6h2i8l/fobZrFv8hl
 W40XcOdkFDWi8JNq2zcSNI9T+RTDa2pKxRyvnRjvIClXrXCfXKkiWfeSw+ENMp7GHtNaoKTIhlS4m
 ugg50y6l7FJ/agEEwbrFWMoClEvEmv5pz5TkIOT5ZOKtqZ4zwDjI8jgSQPnWU3FiQGhh8Hnwm79vF
 ky/qsIZjG1lLvCQaEspH5HhwG6f2cZ/vh8GCHYPNPjmdNVeNqAfFDAOfyO1md1y0pcsM/+9K0w5Yw
 zFcUFoobWZlIhSaDHeqrjx6HC4HSb0cpfDSdwNxtv9MFIftDpuWwOVZBb+IsdxFqMfGZRGOTeYTdR
 X/OoeQM/wIyPIUAfqQ6bUahCeKeExvhqwn7lCQQtEryeXoEnQzPrOWl+d8o/+/upy82h1QS8aCCPz
 WFRL9Uq7S5kE1TaPJoYNZeCMny9d+121g2B41N/s7d+UhcgPO6yyzDxYtbDm7NXce4EgyZnbr9ajl
 EY2StAu3KmWWrqpAxqT6OnzBVNc3sRtxbJByZQfqQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3HLJ-000A3F-4H; Mon, 20 Jun 2022 14:21:29 +0100
Message-ID: <ee98844e-93e6-1c43-ae1c-57af166d9beb@ilande.co.uk>
Date: Mon, 20 Jun 2022 14:22:32 +0100
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
 <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9CxLKNZzfvaoUFSRtykEymu23er+zj=7GA1V2nRtcU9A@mail.gmail.com>
 <939ffd58-3a89-ea5b-157d-d4a9bd4dffa4@ilande.co.uk>
 <a425db75-5636-8b29-26d2-9bef52c8eb25@ilande.co.uk>
 <CAFEAcA-F_v_S3TMbtQvboBCzg9OsXM3YZ-Bs6yVabTpE9_yJ5Q@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA-F_v_S3TMbtQvboBCzg9OsXM3YZ-Bs6yVabTpE9_yJ5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 45/50] lasips2: use qdev gpio for output IRQ
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
X-TUID: 8/esz7M679Vz

On 20/06/2022 11:17, Peter Maydell wrote:

> On Sat, 11 Jun 2022 at 16:44, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> On 10/06/2022 08:17, Mark Cave-Ayland wrote:
>>
>>> On 09/06/2022 12:18, Peter Maydell wrote:
>>>> If you find yourself #defining names for IRQ lines then this is
>>>> probably a sign you should be using named GPIO lines :-)
>>>
>>> Yeah that's something I've done a few times here, mainly to have just one "set IRQ"
>>> function rather a separate one for both keyboard and mouse. It takes a bit more work,
>>> but I can certainly separate them out.
>>
>> Looking at this again, the gpio being defined here actually is the (only) lasips2
>> output IRQ, and so should be left unnamed.
>>
>> The reason for adding LASIPS2_IRQ was so that the gpio connection process looked like:
>>
>>       qdev_connect_gpio_out(dev, LASIPS2_IRQ, irq);
>>
>> instead of:
>>
>>       qdev_connect_gpio_out(dev, 0, irq);
>>
>> Would you still prefer for me to simply hardcode 0 here and drop the LASIPS2_IRQ
>> define in this case since there is only one output IRQ?
> 
> Well, I think that "unnamed GPIO out" lines should be for
> actual GPIO lines, ie on a GPIO controller or similar.
> If you want an outbound IRQ line and don't want to name it,
> that's what sysbus IRQ lines do. Otherwise, name the GPIO line.

That's interesting - I've always been under the impression that this was the other 
way around, i.e. for a TYPE_DEVICE then unnamed gpios are equivalent to IRQs, and 
that gpio lines for any other non-IRQ purpose should be named :/

So... I'm not really sure what to do in the context of this patchset. Would using 
qdev gpios with suitable "QEMU interface" comments be good enough, or do you really 
feel strongly that these should be converted to SysBus IRQs?

Following on from this we should also consider starting a new thread re: the future 
of SysBusDevice and how we would like to model SysBus IRQs and mmio regions going 
forward.


ATB,

Mark.
