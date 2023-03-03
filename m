Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1274999ejc;
        Fri, 3 Mar 2023 08:31:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/o/AddmYx3Ok0d2LWlngRClu23rmrfSKJIUuQvvuvjoIyoHSxN8EyX/IDBoEhrtgilXhIN
X-Received: by 2002:a05:6214:19ca:b0:56b:f1e3:320 with SMTP id j10-20020a05621419ca00b0056bf1e30320mr4133680qvc.0.1677861085062;
        Fri, 03 Mar 2023 08:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677861085; cv=none;
        d=google.com; s=arc-20160816;
        b=IaM240U7v6TFvNijffQeLLEgRlYVnIX4goZ331H3+Ii4EgLuvP2RfRqMPhH3u7WTd7
         oAqXH2MV6JjdPKjyMLGVcWRvrVxYyXBQrWSpUgh9Qv8Ldt4EE+cwQ7Lr48+IJ20h19c0
         H4BooTqmZ8d9jRatLl/+P5YPQ7uhmmPGdJp3g49LqfVpM2fhVxQKv2eizoSrjGBBIHaW
         S/aYs2/PvuagcSn3MI0nUPaavfBDBxMCgzwqM3FvnwN9cRhlbWbvVbIs6yvd3djWlPtC
         S2fkWhgdIq7dLbtCMLRisrGrKQoqanOBAryNwqCitZHS3KelXZLS+WohgxicfaHI+esR
         DhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=cbXxVdKVI0MvStnUdkmS7+GsdOiKehJxOLzVcQzqHrM=;
        b=XwMB3CDEfvMoDziqBMYoaohMWtDqlVfoyRj+ZS+eUN9UUq4SFAXWskIUsh0MCkTnYn
         JMWma4UHAhBc8bISEK4/jj/cTxRKVHK33uKOaCGIvy899wAXiRUDd/NcoPOnNbNjIZS5
         3YNdI9gI61Ru7icsVUGt5RQh9MOR2dkKOgoyPP10Bm8ZuWBbKZrjIXnu/oJZQ3NFspi/
         ekuktIx2sRvHHIoLs/NNHlc+llDKzS4KWaUaZe0h64VOKSoejlDV++r13V8wyKruQHPQ
         IP6mDj31t/Bx8b7KY6aUUE+hFU5chbSBp6KXLFkKOR2g9Z3iX9pU6Jv+27PctVNoakLq
         4yfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GLgT5gG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2-20020a0cf542000000b005355cd478d5si1868538qvm.445.2023.03.03.08.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 08:31:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GLgT5gG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY8JK-0007DZ-A0; Fri, 03 Mar 2023 11:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pY8JI-000707-5B
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pY8JG-0004lC-KE
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677861062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cbXxVdKVI0MvStnUdkmS7+GsdOiKehJxOLzVcQzqHrM=;
 b=GLgT5gG9doc1D4DwW/bRwkrD5JZ6aov6hTSCBSd3zGMRP/x0DCo/UqIwr+EUcgxWH2OsKc
 20iINkarXKuq9GguNHOjMsUNWjYpJmtq7wWlBWsJO/xHanJbV+qtx596BgpWKKiUkcBeu7
 5bhKkVGc3eDIG52TNYakOUdvA63G4y0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-Z6DqMzh-OuCQwFxsmp0oYA-1; Fri, 03 Mar 2023 11:30:59 -0500
X-MC-Unique: Z6DqMzh-OuCQwFxsmp0oYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5C851802D42;
 Fri,  3 Mar 2023 16:30:58 +0000 (UTC)
Received: from localhost (unknown [10.39.194.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A26A11121318;
 Fri,  3 Mar 2023 16:30:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrea Bolognani <abologna@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Auger
 <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
In-Reply-To: <CAFEAcA-Q6hzgW-B52X5XEtZsvBX64qSr9wSKizLVYu58mPdXKw@mail.gmail.com>
Organization: Red Hat GmbH
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
 <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
 <87sfeoblsa.fsf@redhat.com>
 <CAFEAcA8z9mS55oBySDYA6PHB=qcRQRH1Aa4WJidG8B=n+6CyEQ@mail.gmail.com>
 <87cz5rmdlg.fsf@redhat.com>
 <CAFEAcA-Q6hzgW-B52X5XEtZsvBX64qSr9wSKizLVYu58mPdXKw@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 03 Mar 2023 17:30:57 +0100
Message-ID: <87zg8tztj2.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ekTFgi9053lB

On Thu, Mar 02 2023, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 2 Mar 2023 at 14:29, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> On Thu, Mar 02 2023, Peter Maydell <peter.maydell@linaro.org> wrote:
>> > I think having MTE in the specific case of KVM behave differently
>> > to how we've done all these existing properties and how we've
>> > done MTE for TCG would be confusing. The simplest thing is to just
>> > follow the existing UI for TCG MTE.
>> >
>> > The underlying reason for this is that MTE in general is not a feature
>> > only of the CPU, but also of the whole system design. It happens
>> > that KVM gives us tagged RAM "for free" but that's an oddity
>> > of the KVM implementation -- in real hardware there needs to
>> > be system level support for tagging.
>>
>> Hm... the Linux kernel actually seems to consider MTE to be a cpu
>> feature (at least, it lists it in the cpu features).
>>
>> So, is your suggestion to use the 'mte' prop of the virt machine to mean
>> "enable all prereqs for MTE, i.e. allocate tag memory for TCG and enable
>> MTE in the kernel for KVM"? For TCG, we'll get MTE for the max cpu
>> model; for KVM, we'd get MTE for host (== max), but I'm wondering what
>> should happen if we get named cpu models and the user specifies one
>> where we won't have MTE (i.e. some pre-8.5 one)?
>
> I think we can probably cross that bridge when we get to it,
> but I imagine the semantics would be "cortex-foo plus MTE"
> (in the same way that -cpu cortex-foo,+x,-y can add and
> subtract features from a baseline).

I'm wondering how we should try to model this, given that
cpu_model_advertised_features is a bit of a weird mix of architecture
flags and implementation-specific knobs.

Given that there are some KVM patchsets floating around to allow
userspace to limit some features for migration compat handling, I don't
think it will be too long before we'll try to figure out how to do cpu
models for KVM in QEMU as well...

