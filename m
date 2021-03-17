Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp395048lfg;
        Wed, 17 Mar 2021 06:10:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLOB5yyJ0RVbSZjKf7d/vUkeY8Vrnwag0UDkR9OYMGgmlMLtgePvyxA4xMMo0KKyXdn9X7
X-Received: by 2002:a05:6e02:216d:: with SMTP id s13mr7665971ilv.208.1615986641831;
        Wed, 17 Mar 2021 06:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615986641; cv=none;
        d=google.com; s=arc-20160816;
        b=tAU1Epjdv6AY6KJyYd2r2anaJkukN0RvUsTmc57c0auldjEDjRg2p8lFzKucXw4MVl
         WsRV3gqM6/adO4fxFHz5VOXIqPtl9XzTusHX2+kJ7+GCpWfxp/t0DIx0EKn7DsRIRai8
         eMgEcw5ggrZ7nKUcZcjXruc2/sJskuQXgFPUW7WJ4yE4FSwpf2Wt5iDKCiupeZ67Gpwv
         Yl4CJH6sdGBBZqEGKt0kUsHqtX9Ilqd7AHnFJKvQEEVUdrLN/VwnGZEduv7vfecnACqI
         SW5cpOCq9u8mSEjo63rL4GK5OHKnkOy9z8Axp9qZOG+tV5wimYJ/lzvn9r4BiMhxEjeN
         GL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0ZP9hWOCMObFvrBuDSNyfH5w21qCWfRoNuFS3Nz6Efo=;
        b=tX/YHBmYH1XdErR0U1znbPRJ4Lu8TUIADqVeucmT6UEtlfldSSNrJ/HVusagG2X0JL
         s3HrDbpMfVRAt5Zsw+yBYFCqZFi1z85vjPK1AHRKGcOcQpknIitS6NwxT3hCKpVg9que
         EZTpXYwpno1sXj70+DFq8MtU4Wq9Yn/PjRYrfSC+U7fr2NfTpx+E3fKkGkFbAZwxWu7/
         nGg5h/wG31zrU2Z3A2NjbzxX48r9R1CpWtNk+X+F79WseHk7uaGUnj3f2Wqcx6lXyKR2
         tijLcO7Jk6iIEF7cicCYj89bM6LUJAzlag9bD73QW83WV+3SC5xTqxo+Zi3lQESvk9gV
         ly/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cAQqe61W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si15211077ilp.90.2021.03.17.06.10.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 06:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cAQqe61W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMVwf-0006fQ-3E
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 09:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMVvO-0005bz-5p
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 09:09:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMVvH-0004Gy-Qc
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 09:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615986554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZP9hWOCMObFvrBuDSNyfH5w21qCWfRoNuFS3Nz6Efo=;
 b=cAQqe61W7OQBAQjFpoOMEOUbVBEhzZn9xtjSbZ+cNJgKIuGsQcSqF5bKgvkBxIzgo01G6w
 3eW68Whxns8Qc6BtSyADP2NHcESzS6/5QZG3LGnXYFQU28uH70L4w1XA1I41Yd89yepNfu
 DkoMAuJlhqWg76QuJoBOJ30fnmgaCps=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-hf-wPBxnOQ6m02Fq7x5CnA-1; Wed, 17 Mar 2021 09:09:13 -0400
X-MC-Unique: hf-wPBxnOQ6m02Fq7x5CnA-1
Received: by mail-wr1-f72.google.com with SMTP id r12so18419864wro.15
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 06:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ZP9hWOCMObFvrBuDSNyfH5w21qCWfRoNuFS3Nz6Efo=;
 b=kutAn/ZDqUIv/hrptFhmYTWwxEu7Alxj0ai5zy6tt8W7FKXvRpwD/MD3RZ8LbYCl+t
 Rd439CLCFFCeOp5qXJQSbS5sksU6zN63ZSCJLcvTYpVfg2UtAYXYTOGv//qk+cfMXESo
 0I05f4dUsF0JbgD8Yx30S5YH5M0mG+bsPiIdjyWD1wbt/iHaZyJKH07SgrFIRsIsV+nN
 PSzCgmdqSVgB5h/3roJFWi7CW8lr+RlPPQAH6YIvbhkg0tOiKfBqYohsb/LfOkeyRrCZ
 mx+J9dA+ONAk+GH2P2FzcZQtLbNZeArpgujoDiqxpdDqnYMuThMOdcoDca9jo4PfbKs3
 Xlcw==
X-Gm-Message-State: AOAM532fnJkk91PvmrSfQoEf3M7TwuFPaxivBxmcINdjlYYvEdDBD1pX
 QLezX1wrCcCgUQtPl5Z3BGShvJPeu7U2zcUfeH509VbPTOYUStt/jdaEXkqYFwljJq6u+FI6Cov
 QmEUDwa4JtZDF
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr4364147wrs.241.1615986552034; 
 Wed, 17 Mar 2021 06:09:12 -0700 (PDT)
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr4364127wrs.241.1615986551842; 
 Wed, 17 Mar 2021 06:09:11 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 1sm2448357wmj.2.2021.03.17.06.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 06:09:11 -0700 (PDT)
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
 <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
 <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
 <3e7ba090-c45e-8fa4-1a59-16856241cbdc@redhat.com>
 <CAFEAcA_zYaOXw5yaXWEjgBy6YeTpB5FRBCO96To-bv9xpQzbMQ@mail.gmail.com>
 <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4fbceae2-7a0f-49cc-3a91-e4fa6be8c6af@redhat.com>
Date: Wed, 17 Mar 2021 14:09:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Gavin Shan <gshan@redhat.com>, Luc Michel <luc@lmichel.fr>,
 Beraldo Leal <bleal@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, avocado-devel <avocado-devel@redhat.com>,
 Shan Gavin <shan.gavin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p3htJb6c+0K+

+Beraldo

On 3/17/21 1:54 PM, Andrew Jones wrote:
> On Wed, Mar 17, 2021 at 11:14:56AM +0000, Peter Maydell wrote:
>> On Wed, 17 Mar 2021 at 10:59, Gavin Shan <gshan@redhat.com> wrote:
>>>
>>> Hi Peter,
>>>
>>> On 3/17/21 9:40 PM, Peter Maydell wrote:
>>>> On Wed, 17 Mar 2021 at 10:37, Gavin Shan <gshan@redhat.com> wrote:
>>>>> On 3/17/21 8:09 PM, Peter Maydell wrote:
>>>>>> On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
>>>>>>>
>>>>>>>    static const VMStateDescription vmstate_pl011 = {
>>>>>>>        .name = "pl011",
>>>>>>>        .version_id = 2,
>>>>>>>        .minimum_version_id = 2,
>>>>>>> +    .post_load = pl011_post_load,
>>>>>>>        .fields = (VMStateField[]) {
>>>>>>>            VMSTATE_UINT32(readbuff, PL011State),
>>>>>>>            VMSTATE_UINT32(flags, PL011State),
>>>>>>> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
>>>>>>>            VMSTATE_INT32(read_trigger, PL011State),
>>>>>>>            VMSTATE_END_OF_LIST()
>>>>>>>        },
>>>>>>> -    .subsections = (const VMStateDescription * []) {
>>>>>>> -        &vmstate_pl011_clock,
>>>>>>> -        NULL
>>>>>>> -    }
>>>>>>>    };
>>>>>>
>>>>>> Doesn't dropping the subsection break migration compat ?
>>>>>>
>>>>>
>>>>> It's why this patch needs to be backported to stable branches.
>>>>> In that way, we won't have migration compatible issue.
>>>>
>>>> No, migration has to work from the existing already
>>>> shipped 5.1, 5.2, etc releases to 6.0 (assuming you use
>>>> the correct "virt-5.2" &c versioned machine type.)
>>>>
>>>
>>> Commit aac63e0e6ea3 ("hw/char/pl011: add a clock input") is merged
>>> to v5.2.0. The migration failure happens during migration from v6.0
>>> to v5.1 with machine type as "virt-5.1", instead of migrating from
>>> v5.1 to v6.0. One question is if we need support backwards migration?
>>
>> Upstream doesn't care about backwards migration. AIUI
>> RedHat as a downstream care about the backwards-migration
>> case in some specific situations, but I don't know if that
>> would include this one.
> 
> Right, we do prefer to be able to support "ping-pong" migrations. For
> example, if we start a virt-5.1 machine on a 5.1 build of QEMU, and then
> migrate it to a 5.2 build of QEMU, we'd like to also be able to go back
> to the 5.1 build.
> 
> I agree this patch is not the right approach. I think the right approach
> is to introduce a compat property and make the "new" section dependent
> on it. And then update the hw_compat_* arrays. Gavin, please take a look
> at "Connecting subsections to properties" of docs/devel/migration.rst.
> 
> I'm also curious what the state of mach-virt's machine types are for
> migration. It'd be nice to exhaustively test both forward migration of
> all machine types and ping-pong migrations of all machine types.

FYI this test has been suggested to the Avocado team few times.
They might already have a ticket to track any progress.

> We can
> then consider each issue we find (the pessimist in me suggests we'll find
> more than this pl011 issue) and how/if we want to resolve them.

