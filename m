Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp285643lfg;
        Wed, 17 Mar 2021 03:59:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXKqank0dZBAeV+WqN+vkUW2ZCVBgdU5L6efyv0kaN/OBnhSpZH8s8u5ss/qtfBliP4+cr
X-Received: by 2002:a25:ef07:: with SMTP id g7mr2549466ybd.133.1615978785093;
        Wed, 17 Mar 2021 03:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615978785; cv=none;
        d=google.com; s=arc-20160816;
        b=WcppzLY5sPzNHJ3KXkj0LCqs+UBdHSWQabUbX03Ur8nVbduiWsQUum8C7/W7rkw3+E
         LQGET1eVp9ImKvyQpfHZr+nFo2i2YICxEjUuaWqHZqwWGNilWi8YfKwMYi/o1zcQPNmh
         QNkyP1kOg2YY0zUYZ9+HOVqatC+dp3CxmuNmrz7pbR1fv8NCCrqoPz9f0lHubi+Y6lle
         vP9uboQhYMNRC1CTUQyRZpaCX/iXJhmqnDs9P3JCaHEPrxgzVhiCEk6KTYGHobLkxFta
         nNjvaA3WkWE3sL1iNBgFynsl/3EOcdhQ0woptW7SLt9az55YvCkNfbwPP19vm05pUVtc
         8fXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=LKl/gz5OOFjHTKr3GsfcXouo3MUl5Qi7jz6OLT8dII0=;
        b=c1ZwElC6vHYzpKBQmy97JaIF78LQ9ZxE1six+p1cB+tOyy6bSIVsxlTq5bZmyxfZks
         DTjBnBGUaqFUPG1Ql7fCws9MvlHoiMO8HzIKGDxESR0lIBlVDiQj1Eudq1W5fCskJdE1
         sMf2M2GOSAzKBI9WjNILiGqSeqTay16DByELKWsh8+1Ham4QlfutYQfOf3z3SG3CSD10
         ndm9q5K5+A5MuTGrOv+E8x3jgnMuvsTwn/Yyw0mNvomc6D5PHFTDn5sscm60qXX6w26C
         A8fjkd4e8K7QqNdFqc9mehpDvQUhK0xDt0GB2zrpv7v9NHYA1y7x7n+ZZnqznNiTtw81
         VasA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Y/cVj+8B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z83si515221ybb.366.2021.03.17.03.59.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 03:59:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Y/cVj+8B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMTtw-0004DW-DV
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 06:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMTto-0004DF-4q
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 06:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMTtk-0004RL-Qx
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 06:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615978769;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKl/gz5OOFjHTKr3GsfcXouo3MUl5Qi7jz6OLT8dII0=;
 b=Y/cVj+8BuQln4QCa6lXxv+tcKDUnA365+vOOlU35xuQPEcvNO1PKYrz3vg2z68pjD0056T
 VVYTQTlarzT/cwqqZsMJ3SBkDQvaZ9C6b0a93wR/5ntVsoJnWmKQrE6rB6M+mdOISjuIS3
 QjYOiqwhslZVMqI2vWr6Gw7219SEqzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-2wCZovHUNd-S9awpp42OkA-1; Wed, 17 Mar 2021 06:59:28 -0400
X-MC-Unique: 2wCZovHUNd-S9awpp42OkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E57059CC00;
 Wed, 17 Mar 2021 10:59:26 +0000 (UTC)
Received: from [10.64.54.49] (vpn2-54-49.bne.redhat.com [10.64.54.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26DAA5D9C0;
 Wed, 17 Mar 2021 10:59:20 +0000 (UTC)
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
 <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
 <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <3e7ba090-c45e-8fa4-1a59-16856241cbdc@redhat.com>
Date: Wed, 17 Mar 2021 21:59:17 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oILBUyRxLo/q

Hi Peter,

On 3/17/21 9:40 PM, Peter Maydell wrote:
> On Wed, 17 Mar 2021 at 10:37, Gavin Shan <gshan@redhat.com> wrote:
>> On 3/17/21 8:09 PM, Peter Maydell wrote:
>>> On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
>>>>
>>>>    static const VMStateDescription vmstate_pl011 = {
>>>>        .name = "pl011",
>>>>        .version_id = 2,
>>>>        .minimum_version_id = 2,
>>>> +    .post_load = pl011_post_load,
>>>>        .fields = (VMStateField[]) {
>>>>            VMSTATE_UINT32(readbuff, PL011State),
>>>>            VMSTATE_UINT32(flags, PL011State),
>>>> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
>>>>            VMSTATE_INT32(read_trigger, PL011State),
>>>>            VMSTATE_END_OF_LIST()
>>>>        },
>>>> -    .subsections = (const VMStateDescription * []) {
>>>> -        &vmstate_pl011_clock,
>>>> -        NULL
>>>> -    }
>>>>    };
>>>
>>> Doesn't dropping the subsection break migration compat ?
>>>
>>
>> It's why this patch needs to be backported to stable branches.
>> In that way, we won't have migration compatible issue.
> 
> No, migration has to work from the existing already
> shipped 5.1, 5.2, etc releases to 6.0 (assuming you use
> the correct "virt-5.2" &c versioned machine type.)
> 

Commit aac63e0e6ea3 ("hw/char/pl011: add a clock input") is merged
to v5.2.0. The migration failure happens during migration from v6.0
to v5.1 with machine type as "virt-5.1", instead of migrating from
v5.1 to v6.0. One question is if we need support backwards migration?

If we do support backwards migration, I think there are two options:
(1) merge this patch and backport it to v5.2+; (2) Backport commit
aac63e0e6ea3 to v5.2-. I guess (1) would be right way to go because
it's less effort than (2). Besides, the clock needn't to be migrated
if I'm correct.

Thanks,
Gavin

