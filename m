Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2039481lfq;
        Mon, 11 Apr 2022 18:54:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbHHm1gFrVJGRbRvto37OgiJHzkz66C23Mq3eKQ6twkfwRW2k2/86Frm+UJdtLW5TgkAqL
X-Received: by 2002:a25:488:0:b0:641:1c71:b0ff with SMTP id 130-20020a250488000000b006411c71b0ffmr9871663ybe.39.1649728495375;
        Mon, 11 Apr 2022 18:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649728495; cv=none;
        d=google.com; s=arc-20160816;
        b=x1U2KiPyoeZjD8LqE4qvVJOnKprJ6nW39zIBtjzlqd0dZzTsgOvIBgPtnSiddZxLqz
         lO59BO0zFXET/c5edC+PTbpCDc7H1Ad37BpkRXjs4GCNcVGI3trYfGxXJW6FrPBN4t56
         5H7+I+QD9t2TXFvH2IfeEgrC9Q49ezQgAtNftAUTaOOgSDsETohGy0Cda2gxEmWxmvRK
         qSWEbMg/owDN8o4JIoDmLI55rqgAnpb+vivDFSwYQs0XrkIFE/j4JFI75dOySzQLWJBy
         aEnlqAfk9NSAYszJ0shyNbq+ahzy5Ry8FlnKaXzLWNOYbbQJG821w3xWKqcjWQmDUI66
         vVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=REg2/B5mqUoR24rPKIvxE8tHstyPrvUb4X8be3JB5eo=;
        b=OctzHZEi2kr+4/09Ja8f8Oxg8RMihkKMiCGalygAgcLUH0e2xvScgVtSDPkM77skJ2
         BnyYqW1nl+5h/np68DIkZZn1LcF3lJXcGIE+vgiypFToAEZH00naPgs2Kp/8DPoYP8RA
         jJ42vNjkhC4xHN3u8oojCtOrorklYfNH9s3EFw+Dp/CoLVsvcYu+aC3FY1VIt28uGB6P
         5zlLgUplqNgivFU8y6uCi3RJeemKSEf1Vvdkhskt0r06HSEPS1HRJmG0G/VYvLcCT1p8
         LC+P/IVpg2bKDnfn8jHjVsRHXMH6VBKGOCJEH4Tiw7vfMm5feD8z2RDL9sf+Yu/4WYUM
         hZzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Bjcr1+LG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w63-20020a254942000000b00633994044e3si5345228yba.333.2022.04.11.18.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 18:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Bjcr1+LG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne5k6-00054O-OG
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 21:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ne5jw-00050z-Tw
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 21:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ne5jt-0006ei-G4
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 21:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649728480;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REg2/B5mqUoR24rPKIvxE8tHstyPrvUb4X8be3JB5eo=;
 b=Bjcr1+LGHU+sc7WjCZU/zmhLAttVoj6Bi55NFCDTwtIq+ccUHt6wxFyTqr0vdVQ3XmGzvN
 PykWou49A4+f+QKS0g8s8uJOB45fLzvMCtp/109SfU7AkTc9ozJxIwPJGRI/bvVsatYLcO
 9RZaCToYlD4u8ZyYC9MvNAk6/brPH38=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-nGCxv_AMMneUvw8YlD5LZw-1; Mon, 11 Apr 2022 21:54:37 -0400
X-MC-Unique: nGCxv_AMMneUvw8YlD5LZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2E6C811E76;
 Tue, 12 Apr 2022 01:54:36 +0000 (UTC)
Received: from [10.72.12.73] (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF018111E41D;
 Tue, 12 Apr 2022 01:54:22 +0000 (UTC)
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220411065842.63880-1-gshan@redhat.com>
 <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
 <a84ed377-2428-11ca-ee17-0dc8debebcf1@redhat.com>
 <CAFEAcA9=eSt+R5OmJUn0KwUrWpnZT6C=O1mq4xUefZJXqyXrUA@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <dd1890cd-8fa3-ec07-1b56-e49cc9039e73@redhat.com>
Date: Tue, 12 Apr 2022 09:54:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=eSt+R5OmJUn0KwUrWpnZT6C=O1mq4xUefZJXqyXrUA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: drjones@redhat.com, agraf@csgraf.de, Oliver Upton <oupton@google.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FqGEDlCdB+N5

Hi Peter,

On 4/11/22 6:05 PM, Peter Maydell wrote:
> On Mon, 11 Apr 2022 at 10:50, Gavin Shan <gshan@redhat.com> wrote:
>> On 4/11/22 5:22 PM, Peter Maydell wrote:
>>> So, can you give an example of coprocessor registers which are
>>> not 8 bytes in size? How are they accessed by the guest?
>>> If we need to support them then we need to support them, but this
>>> cover letter/series doesn't seem to me to provide enough detail
>>> to make the case that they really are necessary.
>>>
>>> Also, we support SVE today, and we don't have variable size
>>> coprocessor registers. Is there a bug here that we would be
>>> fixing ?
>>>
>>
>> [Cc Oliver Upon]
>>
>> Apart from SVE registers, I don't think we have any more large registers
>> whose sizes exceed 8 bytes for now, until SDEI virtualization needs more
>> large registers for migration.
>>
>> I'm working the KVM series to support SDEI virtualization and last revision
>> is v6. One of the requirement is to migrate the SDEI events and states.
>> In v5, the migration is done by the dedicated ioctl commands and it was
>> suggested by Oliver to use {GET, SET}_ONE_REG. Note that the series isn't
>> merged yet. So I had the prototype to support SDEI's migration through
>> {GET, SET}_ONE_REG. Note that those newly added registers are inaccessible
>> from guest.
>>
>> https://github.com/gwshan/linux/commit/c2e5de5e210de6b003d1e1330eeb0958cf7007f5
>> (branch: kvm/arm64_sdei)
>>
>> https://lore.kernel.org/lkml/20220403153911.12332-13-gshan@redhat.com/T/   (last revision: v6)
>> https://lore.kernel.org/kvmarm/YjtYuk+Jx1dFPQQ9@google.com/                (v5)
> 
> Could you please describe what you're trying to do here rather
> than asking me to wade through a big kernel patchset that's
> adding support for a firmware interface I don't know?
> 

I'm working on two serieses to support SDEI virtualization and asynchronous
page fault (Async PF) on arm64. When currently running thread is experiencing
stage-2 page fault, Async PF picks another thread for execution. After the
stage-2 page fault is resolved, that thread resumes. Async PF is driven by
notifications sent from host to guest. One of the notifications is delivered
by SDEI event. The SDEI event is something like NMI to some extent. When
the SDEI event is raised by host, it will be delivered to guest and the
previously registered (associated) event handler is invoked in guest.

One of the concerns for SDEI virtualization is how those SDEI events
and states can be migrated. Previously, I had dedicated ioctl commands
to read/write the SDEI events and states. Later, Oliver suggested to
use {GET,SET}_ONE_REG to do migration. I think it's much better than
the dedicated ioctl commands in terms of maintenance cost. In this case,
several 'firmware pseudo registers', like what PSCI is doing, will be
added and some of their sizes will exceed 8 bytes. On the other hand,
the SDEI events and states can be naturally treated as CPU's properties.
It's another reason why pseudo-registers fits the need to migrate
those SDEI events and states.

More information about SDEI can be found from its spec:

https://developer.arm.com/documentation/den0054/latest

>> There are large coprocessor register sizes, like U2048, exposed by KVM.
>> However, it seems we never support those large coprocessor registers.
>> I'm not sure if we have any challenges to support those large registers,
>> or we don't have the needs yet?
> 
> The general idea of the coprocessor register accessors for aarch64 KVM
> is that we're giving the VMM access to the same registers that the guest
> accesses via the msr/mrs instructions. Those instructions by definition
> access 64 bit quantities. In a few places we've borrowed this mechanism
> to define KVM-specific pseudo-registers, but that wasn't the primary
> design intent. So maybe it makes sense to extend it to do what you're
> trying to, or maybe that would be the tail wagging the dog. It's hard
> to tell without more detail on what exactly you're trying to expose
> to the VMM here.
> 
> (The ONE_REG API is used by more than just aarch64 and more than just
> for coprocessor registers, which is why it supports lots of different
> sizes.)
> 

Yes, we're considering 'KVM specific pseudo-registers' for migrating
SDEI events and states. Those pseudo-registers shouldn't be accessed
from guest, meaning they're only accessed by VMM (QEMU). I think
pseudo-registers fits the need very well, to migrate SDEI events
and states.

Thanks,
Gavin

