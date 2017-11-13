Received: by 10.223.150.237 with SMTP id u100csp2209817wrb;
        Mon, 13 Nov 2017 00:27:23 -0800 (PST)
X-Google-Smtp-Source: AGs4zMba+4lTGpsqIYRdtaHJNCbY8L3w2cERN11bNvilQuQjmlmagieeHDs+3GOfAd5UEUOpAJVm
X-Received: by 10.99.45.67 with SMTP id t64mr7832485pgt.108.1510561642996;
        Mon, 13 Nov 2017 00:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510561642; cv=none;
        d=google.com; s=arc-20160816;
        b=hTDDNYIF9uFuDRNdzL69hWbC3BflNnjozR+ohJx7QZxokV8WYKfqF4ABGdGvjnIrhj
         LTVZshZLyEEk98DO0kzSKTPNnbZwSTDNv2Ef2AXqPCNNNNLrX8seyGWwVCT1Nv4uUw+0
         yA5ZLwqnwtH6BLcsiuQl6rZq45h9tEwJqJN4vxrKTKnu7QSMPZeat3E460wuPEYGtDlD
         33TkEJ158vAO8GIIOO1ZYcVo4+iAoleEsQ7OkghstrGamKQ3y1w9StnWZxoOKRiOGr6P
         USU00k7xVFogKlDKXPgWX2iTV7kjl36MxFlRa+sxfTIoDx6XeMDHA32LyTncjgxGeUFE
         FZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature
         :arc-authentication-results;
        bh=e/CxOyUaCpNpBup7CZ2wN5560qEHzNsu58bb5btbjRQ=;
        b=zt+q7Dcy+q5hwkwEvY56N1x0/UbQWK1ZIbgbM9sH2G93LUKZTIKhDEMw8ziw+DzIg1
         JC6jhyX4xKkyhCMXGOVHTqX6lbndiUfHYevYm36guGokkjxudSwzhUoj/2kBj/+I+ouu
         kvuEJPJq4ryqPJfeb3XnkATIeQJmejC8LD8tPdfizZgbsoqFqXfSXNP5PA2kMhfX+Cch
         sZMYfgsrpPRMjkDT6XKT/HDEjkP1pH4LJZv3hFtlHuiAexbtOBoHfYsaeFQW5Z9kQQb3
         tuYVBIGKQ5tp2wg7XYg/nJIX9LcY3/rssNM1b4DRkNX0QuNNQVC5NT9f7AjoyouFjc8A
         FYBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lqY76Lvp;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a23si13273525pgd.261.2017.11.13.00.27.22;
        Mon, 13 Nov 2017 00:27:22 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lqY76Lvp;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751987AbdKMI1V (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Mon, 13 Nov 2017 03:27:21 -0500
Received: from mail-wm0-f66.google.com ([74.125.82.66]:51488 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751718AbdKMI1U (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 Nov 2017 03:27:20 -0500
Received: by mail-wm0-f66.google.com with SMTP id b189so6474105wmd.0
        for <kvm@vger.kernel.org>; Mon, 13 Nov 2017 00:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e/CxOyUaCpNpBup7CZ2wN5560qEHzNsu58bb5btbjRQ=;
        b=lqY76LvpCjcFH6X/S7yLdeoqazXZQ5pET2hrZ4zuGuFFPPChFWuQoFGH8eiVveVBlV
         buVee6ovujxIyXVsyHSYwF4KHtQS5j4LOHCvtFO6YdangNERe+SB7iUeL4+XO22vZyDv
         xTcYHxUOtptrzui95jgadfbqonDxhDfKc/bvyyk5lgzRPAMpFSWzueNB2H2FMxlMdJof
         wWHEJ6EGWdM4a+AuhABXtHax/vRGNqza84WPUUOIsNJ/lTaj2lpt+Y1tgfqIsO/OJ3nZ
         ln9GH+NpJE2rsPiAzvx7tA8jjfQTYbpf63ToUVmfuBn8LNDhgK3UC4EcAMFzf4dxTd91
         F2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e/CxOyUaCpNpBup7CZ2wN5560qEHzNsu58bb5btbjRQ=;
        b=DX9T5gxY8MFIyHLFYzWOzc978m0Jc1/ea4qgM2iIoyYa427OZJJVJi3Gji/gA4apri
         p5K9YcBjLoGAelmueIrQY/3xcJ7hUrNk6NIu0iOj2C6Kn7Gjz1EZPJx0blOWrVgl52/W
         FxzXHBzt3b9OAVJ8hisOpz77XP5OXk4Qp5RV1o4Y4JPzQTV62T+O/qQxYqQnlAXhI598
         eX8c0Le9/l0kDqCuRYzrJ2WnYL2cxR1zYHdTjpJrpOYCsIXht1oRV9C9sUzOFk5WFux1
         Gt1WzXw1+puOGHk+z5cZY3cxDL9w2IHvToVC1ZDilmD6g2DXtXLzN9bBH4nCgocfKcsk
         Vruw==
X-Gm-Message-State: AJaThX7AXH1uFNgRef2YvC3zNB/h3/jgFqz43PiLq8NaVcTRi6OCrY8H
        631OYG6O2Ps3l0T3gXBFkjk=
X-Received: by 10.80.176.38 with SMTP id i35mr11627459edd.156.1510561638900;
        Mon, 13 Nov 2017 00:27:18 -0800 (PST)
Received: from [192.168.44.240] ([31.157.238.250])
        by smtp.googlemail.com with ESMTPSA id w10sm12949610edj.11.2017.11.13.00.27.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2017 00:27:17 -0800 (PST)
Subject: Re: [PATCH v12 09/12] Move related hwpoison page function to
 accel/kvm/ folder
To:     gengdongjiu <gengdongjiu@huawei.com>, mst@redhat.com,
        imammedo@redhat.com, zhaoshenglong@huawei.com,
        peter.maydell@linaro.org, mtosatti@redhat.com, james.morse@arm.com,
        lersek@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org, rth@twiddle.net, ehabkost@redhat.com,
        kvm@vger.kernel.org, guohanjun@huawei.com, lijinyue@huawei.com,
        huangshaoyu@huawei.com, wuquanming@huawei.com,
        zhengqiang10@huawei.com, linuxarm@huawei.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
 <1510341591-22817-10-git-send-email-gengdongjiu@huawei.com>
 <3017b1b9-24d7-565b-1180-a0eb93c6d57a@redhat.com>
 <572b8361-ee14-35ed-6c85-a5e5d8ae5b1a@huawei.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b948cb25-dad9-ec7e-8406-b829d21cac26@redhat.com>
Date:   Mon, 13 Nov 2017 09:27:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <572b8361-ee14-35ed-6c85-a5e5d8ae5b1a@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: iV13LasEIESW

On 13/11/2017 02:45, gengdongjiu wrote:
> On 2017/11/10 19:32, Paolo Bonzini wrote:
>> On 10/11/2017 20:19, Dongjiu Geng wrote:
>>> +typedef struct HWPoisonPage {
>>> +    ram_addr_t ram_addr;
>>> +    QLIST_ENTRY(HWPoisonPage) list;
>>> +} HWPoisonPage;
>>> +
>>
>> Is this actually needed outside accel/kvm/kvm-all.c?
> Paolo,
>    Thanks for the comments, this structure is added in the accel/kvm/kvm-all.c is also OK.
> My previous thought is that this is structure definition, so I move it to a header file.
> If you think this structure should be added in accel/kvm/kvm-all.c, I will move it.

It can be done later; but if you have to send a v13 series, I would be
grateful if you included this change as well.

Paolo

> thanks!
> 
>>
>> Thanks,
>>
>> Paolo
>>
>> .
>>
> 
