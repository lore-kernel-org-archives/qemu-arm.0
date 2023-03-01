Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6771280ejc;
        Wed, 1 Mar 2023 02:17:57 -0800 (PST)
X-Google-Smtp-Source: AK7set9aTOt7dPRmUENG4hKxLPLR6UIRlgx3UUBtOcn+HaEJBKGm2zspL1ox7tHHf3VaNVddXvHC
X-Received: by 2002:a05:6214:519e:b0:571:6ac:ec8e with SMTP id kl30-20020a056214519e00b0057106acec8emr10285300qvb.13.1677665877357;
        Wed, 01 Mar 2023 02:17:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677665877; cv=none;
        d=google.com; s=arc-20160816;
        b=lRdCDr4lMKKc4/Ti3a4nNC+QKq8FZwvAYvebCoPqsGZxgeM6gkWcIv1ze0M1tZ6GyG
         s6EGXgq1DRIbXIiMLyB9u+VoqrYK/n5dOq4HA3zSuD6wXCq7SnWdW2JxroJmgW7RqlzR
         itZ7/ps00Cp9/BPa7pI0ijmBJyx+320gmPDri56Es3R4ocR9iCy9QqUXBPGZ5yUWaV3R
         mqHs3SlVtD/SjpF538O855Wn/Zz1cnXX2sMmZHdCD5fahg4pgFndD7meJ1ZNSvF18JnH
         O4qJEtvH0A0hvc0kR8MJMjA5Xvispc9MJyQxVKYTpAb/6tH4WBnXAp2lWf2vdIMJo3eU
         /kDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=8r3Y4Afs6nDzR97mneU0Nx74HX2j2HXQLqk/fLNz+hc=;
        b=ScqcsKeMYLa2x5XxQACZxWF/dKVBAcXrTqr2WbGDr7E9t5fzUxfe9Oedtv4bbD/3eQ
         WbA5/FUbcbrfyIMLHfrAuySiDz0MzSmsxWfqP2chWpWjQLIjb98e5uUwzmvS1zY2bZzF
         p5h319yxU/fwjpMRgiioMDUOqo46xdHmIzJ1KsmhS7nCmpC3nLblxbMFiS5WTxZtGeWh
         DWxsjo5MiN+JKeQx0UH66/o7oN+QyPatxlJik9BUwoOnzJH9WIB3f5DiDIu3Y4ObApSi
         yzr3jUwZqvlxeA+3EDjHdYhuAiZcYqD5Ggr9DbuLj7GKbg9MJXynJAmJahHq0Oh1Cr8s
         wodA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AswguJfZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fi15-20020a0562141a4f00b0057109661a1csi11732495qvb.378.2023.03.01.02.17.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 02:17:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AswguJfZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXJWx-0003kL-NB; Wed, 01 Mar 2023 05:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pXJWv-0003k1-Ty
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 05:17:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pXJWt-00082s-QV
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 05:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677665863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8r3Y4Afs6nDzR97mneU0Nx74HX2j2HXQLqk/fLNz+hc=;
 b=AswguJfZi+RbEUbRn0pQnd9dVJ4ud7HTxWgW0oDyCY81x6JMyiOFKFgTAG0DeJpnnVzWqk
 TBUd6dKMHSL1O+qiu9kcR+oRUcN7mRkmvfP3Zw35+1sRW/cGToIUowpabq043qgljuSh3u
 afnSKAoqyVOpezRyblvivBpaBrjYgYo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-6mHCLBv4PmGmk4Ky9GErJA-1; Wed, 01 Mar 2023 05:17:42 -0500
X-MC-Unique: 6mHCLBv4PmGmk4Ky9GErJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5C7D3C0F195;
 Wed,  1 Mar 2023 10:17:41 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88AB42026D4B;
 Wed,  1 Mar 2023 10:17:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric
 Auger <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
In-Reply-To: <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 01 Mar 2023 11:17:40 +0100
Message-ID: <874jr4dbcr.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
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
X-TUID: jCwvi4mXvxgZ

On Tue, Feb 28 2023, Andrea Bolognani <abologna@redhat.com> wrote:

> On Tue, Feb 28, 2023 at 04:02:15PM +0100, Cornelia Huck wrote:
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
> I've given a quick look with libvirt integration in mind, and
> everything seem fine.
>
> Specifically, MTE is advertised in the output of qom-list-properties
> both for max-arm-cpu and the latest virt-X.Y-machine, which means
> that libvirt can easily and reliably figure out whether MTE support
> is available.

Great, thanks for having a look!

>
>> +MTE CPU Property
>> +================
>> +
>> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
>> +presence of tag memory (which can be turned on for the ``virt`` machine via
>> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
>> +proper migration support is implemented, enabling MTE will install a migration
>> +blocker.
>
> Is it okay to use -machine virt,mte=on unconditionally for both KVM
> and TCG guests when MTE support is requested, or will that not work
> for the former?

QEMU will error out if you try this with KVM (basically, same behaviour
as before.) Is that a problem for libvirt, or merely a bit inconvinient?

>
>> +If not specified explicitly via ``on`` or ``off``, MTE will be available
>> +according to the following rules:
>> +
>> +* When TCG is used, MTE will be available if and only if tag memory is available;
>> +  i.e. it preserves the behaviour prior to the introduction of the feature.
>> +
>> +* When KVM is used, MTE will default to off, so that migration will not
>> +  unintentionally be blocked. This might change in a future QEMU version.
>
> If and when this changes, we should ensure that the new default
> behavior doesn't affect existing machine types, otherwise we will
> break guest ABI for existing VMs.

Nod, such a change would need proper compat handling. It's not quite
clear yet if we'll ever flip it, though.

