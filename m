Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1261615ejc;
        Fri, 3 Mar 2023 08:19:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+zGN0A6keIYi8HzOd0upE5rjur2Hwy1edj4F1yGyp9oik7aEUT/pAyFvtYnlx1zSPpVkuT
X-Received: by 2002:a05:622a:50d:b0:3bf:c436:33b2 with SMTP id l13-20020a05622a050d00b003bfc43633b2mr4204452qtx.19.1677860369722;
        Fri, 03 Mar 2023 08:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677860369; cv=none;
        d=google.com; s=arc-20160816;
        b=cB5FRfk1y21iEN/DEyXZnWLpmhMToONH+Lb4Ys2UMu4vnnFer8U5Avx1eQdo23uBPi
         0MNz5T8LhJ0zf878bsmRP81Q8985CtfC78NPG5gKG5brDMRif01oKZ03rwvnUN02P2/6
         fC0kPalhk4gTOmTWDW91zI0a81Sh/TIERHSeoOUvgNiCyReLxQkuTwaG8XaPpaqbffnz
         M/8ii2BIqT3HocKkRRL3Wbww/MGQUKzb9QjDWuavtl+MpGedyEUmM8f72hXSvZWxcQ5d
         8yAqN2cxgatFqONj2vv9Whf2BUQvGDrihues60QhrBGgD2IiJoG4pabcLlnWxgJXuCTO
         /JBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=6Fwoq1E78a1auonZ+XuQFDrP0VdueZsbOuzC248blQ8=;
        b=mX4+ZUDUt32Jx3O0CoG1jfURZwYv1doi/BD5vxcJwILMETnre0J71tFXkyemG2ibIP
         5JF9bj4yKR/V3J8ZeyXknYrdT8s7VJBgS/IIRJ+9nCQkQwMzG63wGe5wC3kNcj7grvEo
         4oeMQxc83Bxc0nc+kz8h9d/laurJW/S113ydEMcaKJNIdSZASIhZytClkQmn6HmkEsv9
         V1GdmCBwmmtYiGNNiPWvPbW+Fn3iIxB4G0xuP7PaYZ93Vr00/8YCywcl4LNevew9X3v7
         VgtIsp5mUqpIxrINTxY0XRFs9TXxr8E8u95db6x8YECFrmLAkvFJm7i2grniDJg9eQ+S
         NlCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UpWybdQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21-20020ac84e55000000b003b86c80c129si2074622qtw.685.2023.03.03.08.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 08:19:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UpWybdQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY87l-00086a-Mi; Fri, 03 Mar 2023 11:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pY87e-0007dw-Vq
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:19:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pY87d-0000V6-Bf
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677860341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Fwoq1E78a1auonZ+XuQFDrP0VdueZsbOuzC248blQ8=;
 b=UpWybdQiD1X4+w+KDX+vdXp8935QaRqun6I/tfArNVpI03WknhwDxS8pTZwGxGLYNJfPOR
 YA2BaP3fyyodkqBzb/W+uHQje1OQGD2m2uxMoixb5WazwAt1dnxvdFuIa33G9nTx3EcY2y
 PYz8y9SWGZRe9SYgkLZ/QYrWgu6LrWA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-w5uRvyjTMj6C-00NFqmYVQ-1; Fri, 03 Mar 2023 11:19:00 -0500
X-MC-Unique: w5uRvyjTMj6C-00NFqmYVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C20CF101A52E;
 Fri,  3 Mar 2023 16:18:59 +0000 (UTC)
Received: from localhost (unknown [10.39.194.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80F652166B26;
 Fri,  3 Mar 2023 16:18:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric
 Auger <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
In-Reply-To: <CAFEAcA8FD75dXcPEyZOfF7cxbgynWTdDOJV7K7fYfAbRsPDdmg@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CAFEAcA8FD75dXcPEyZOfF7cxbgynWTdDOJV7K7fYfAbRsPDdmg@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 03 Mar 2023 17:18:58 +0100
Message-ID: <87356l24gd.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: kBg1xjkVeufS

On Fri, Mar 03 2023, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 28 Feb 2023 at 15:02, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> Introduce a new cpu feature flag to control MTE support. To preserve
>> backwards compatibility for tcg, MTE will continue to be enabled as
>> long as tag memory has been provided.
>>
>> If MTE has been enabled, we need to disable migration, as we do not
>> yet have a way to migrate the tags as well. Therefore, MTE will stay
>> off with KVM unless requested explicitly.
>>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  docs/system/arm/cpu-features.rst |  21 ++++++
>>  hw/arm/virt.c                    |   2 +-
>>  target/arm/cpu.c                 |  18 ++---
>>  target/arm/cpu.h                 |   1 +
>>  target/arm/cpu64.c               | 110 +++++++++++++++++++++++++++++++
>>  target/arm/internals.h           |   1 +
>>  target/arm/kvm.c                 |  29 ++++++++
>>  target/arm/kvm64.c               |   5 ++
>>  target/arm/kvm_arm.h             |  19 ++++++
>>  target/arm/monitor.c             |   1 +
>>  10 files changed, 194 insertions(+), 13 deletions(-)
>
>
>
>> +static inline bool arm_machine_has_tag_memory(void)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    Object *obj = object_dynamic_cast(qdev_get_machine(), TYPE_VIRT_MACHINE);
>> +
>> +    /* so far, only the virt machine has support for tag memory */
>> +    if (obj) {
>> +        VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +        return vms->mte;
>> +    }
>
> Code inside target/arm shouldn't be fishing around inside
> the details of the board model like this. For TCG I think that
> at this point (i.e. at realize) you should be able to tell if
> the board has set up tag memory, because it will have set
> cpu->tag_memory to non-NULL.

I agree that we shouldn't need to poke into the machine innards here,
but I found that it was actually too early to check for cpu->tag_memory --
details have unfortunately been flushed out of my cache already, can try
to repopulate.

