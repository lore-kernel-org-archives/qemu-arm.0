Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp955102lfg;
        Wed, 17 Mar 2021 19:34:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymE8Kegd+4hDv4NrQA0I1KYgVnxqB5Yyob/CT2fWl+i2Acw0WoN++wsxdwrX5TpBG5luuU
X-Received: by 2002:a05:6638:371f:: with SMTP id k31mr5317877jav.143.1616034881932;
        Wed, 17 Mar 2021 19:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616034881; cv=none;
        d=google.com; s=arc-20160816;
        b=cGryUMY+24LSK5vi9sdqgUzbUfZXUfxO3VWm1jj8f9HM1FdyVQuXXFOIiI6jbq/dvu
         i2OtPTt/YgACfoh/p4eGdNMujLuafE0tQypBSzqgbR2jC3omthK1FUEENt+uMRyk9tw6
         6SyL/hPkmb9OvwDyf/UIng2YHmU8ZGhGSWb2AiKiHSGp/mbPEIhsIO78aX+A5wglPjkD
         flwQb7JcbVT4L116V2exzSPhdFluNXx10MQoJkMf1RQuoQUzwuPYjsi46KGkFK8OBvDA
         oWUXZqyetf2o9Sguu56fwFpNuJOX4fZslxoDHnGnDQtj/d/dQJfoXE52HTj/kRHjLBVF
         9UlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=acEEQ21TZPtYlWxUJ/CW39iyhDKUasjVlDjH7z1bEEE=;
        b=i/jFtVBQYgWh8GYw0k6IEdPpt/XfcRliFSFHmF0a9SlVEQ6rdPXGDgaLnOOsvg54xV
         toBCY/cD7/9El2Y7yFp56AGlhTrxluqRGre0eO7+8AxAIh51k+04b+vwf4V60I65DA2G
         2O98C1OqRcIAlkTdMO1HLoaBBkNWOit+9uxlM9/D6MNK/9jQwij91JaMvjLGcigOgQn5
         DGg0LDWdBUX3ZVmc5GS0pb/T/3sR9Rrn5hS53PmplSQG0VJOt96kfTF74eG+pDDkZwsk
         gbnJNYc/PCo7/zSIjWm+IMRrrnrboVwrmt8My1S8BDD4cE9pavWG0AZe55ixwiNNw5/g
         cIJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cpuybEqZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h28si531227jav.61.2021.03.17.19.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 19:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cpuybEqZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMiUj-0006Oa-0F
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 22:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMiUZ-0006My-Tp
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 22:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMiUW-0000mE-6K
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 22:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616034867;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acEEQ21TZPtYlWxUJ/CW39iyhDKUasjVlDjH7z1bEEE=;
 b=cpuybEqZEGc1sJMiQBYcnlLXqda8sRyS+zpBDDWgeb2W50ci40gdtjhQ7nQTQGeFgGJAeF
 931Sy7X5u1NKk38fpkrxgnQFKOlq3eA99aAAXtDUKwcAArFd0Sda2TF1PYnzapjaNa/B9x
 YiJfs/+/aCqqHarOUWb9emsE2+Cqd1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-FuqVHVrOPB-zj-aTGy6PPA-1; Wed, 17 Mar 2021 22:34:25 -0400
X-MC-Unique: FuqVHVrOPB-zj-aTGy6PPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 087EE107B02F;
 Thu, 18 Mar 2021 02:34:24 +0000 (UTC)
Received: from [10.64.54.49] (vpn2-54-49.bne.redhat.com [10.64.54.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCF641F05D;
 Thu, 18 Mar 2021 02:34:17 +0000 (UTC)
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
 <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
 <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
 <3e7ba090-c45e-8fa4-1a59-16856241cbdc@redhat.com>
 <CAFEAcA_zYaOXw5yaXWEjgBy6YeTpB5FRBCO96To-bv9xpQzbMQ@mail.gmail.com>
 <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <4f5155b3-829f-fdc3-6e72-57617a44b335@redhat.com>
Date: Thu, 18 Mar 2021 13:34:15 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PgvKyjcUnd5L

Hi Drew,

On 3/17/21 11:54 PM, Andrew Jones wrote:
> On Wed, Mar 17, 2021 at 11:14:56AM +0000, Peter Maydell wrote:
>> On Wed, 17 Mar 2021 at 10:59, Gavin Shan <gshan@redhat.com> wrote:
>>> On 3/17/21 9:40 PM, Peter Maydell wrote:
>>>> On Wed, 17 Mar 2021 at 10:37, Gavin Shan <gshan@redhat.com> wrote:
>>>>> On 3/17/21 8:09 PM, Peter Maydell wrote:
>>>>>> On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
>>>>>>>
>>>>>>>     static const VMStateDescription vmstate_pl011 = {
>>>>>>>         .name = "pl011",
>>>>>>>         .version_id = 2,
>>>>>>>         .minimum_version_id = 2,
>>>>>>> +    .post_load = pl011_post_load,
>>>>>>>         .fields = (VMStateField[]) {
>>>>>>>             VMSTATE_UINT32(readbuff, PL011State),
>>>>>>>             VMSTATE_UINT32(flags, PL011State),
>>>>>>> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
>>>>>>>             VMSTATE_INT32(read_trigger, PL011State),
>>>>>>>             VMSTATE_END_OF_LIST()
>>>>>>>         },
>>>>>>> -    .subsections = (const VMStateDescription * []) {
>>>>>>> -        &vmstate_pl011_clock,
>>>>>>> -        NULL
>>>>>>> -    }
>>>>>>>     };
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

Agree and thanks for the pointer. I will post another patch to have
something in hw_compat_5_1 to address this particular issue.

> I'm also curious what the state of mach-virt's machine types are for
> migration. It'd be nice to exhaustively test both forward migration of
> all machine types and ping-pong migrations of all machine types. We can
> then consider each issue we find (the pessimist in me suggests we'll find
> more than this pl011 issue) and how/if we want to resolve them.
> 

Yeah, I will think about it and do the testing to see if there are more
issues. Also, it'd better to be integrated to existing testing framework
as you suggested.

Thanks,
Gavin

