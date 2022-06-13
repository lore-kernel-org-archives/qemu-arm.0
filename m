Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1484866lfb;
        Mon, 13 Jun 2022 09:07:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuneWPkLu6FM+vmzSzx6/8wuqLXb/LjRZ5NuLytkCPopRk0EBvj01WJpuHoMWwuonb0roq
X-Received: by 2002:a05:620a:370e:b0:6a7:2471:b3eb with SMTP id de14-20020a05620a370e00b006a72471b3ebmr490966qkb.631.1655136432333;
        Mon, 13 Jun 2022 09:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655136432; cv=none;
        d=google.com; s=arc-20160816;
        b=qTDHhaJgmFGNrmiBaPifa177GVF7Vy6VNgo+kDhQYPN5H5bAHSWV1Jsm0kJUoDdqv9
         1t8Ts18oYM5PCvPNwomhzmZhNvy3Oo1HekH3bUYjS+cwysd/g+CZ/tnVt1HLkhzxlQbx
         +sVVmpboUxxE2xQDYSxkfoQenB9wlZw/JiSYtiZIOGh8SfZ6X5HsP3nj3nBYQhjGjAh2
         ruLuzqcNSI3PIt1jmpZ+1DHHXze0gB/6IZ6y/Brbk9MTahj5QWcbUuK/8CnjlFtPmDyy
         mC3VoA0fY5WTrS3BbyDywf+XuV+1UDMlj8d1InN3cNuUFsUZxODtmmHqE1LXL22Wu36K
         20FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=7ZN1SruJXh6GSm3tIf4Etj3mJf1Qp5u8MmFUMs27FWo=;
        b=QRCHJDud9K2tcW/5WB4EZoGtUAJtNUr7x1j9hXB2YoDgMaD8oI6KGM0BCJR+AexuMT
         BWNJhc+8+Nt5whpBfVmEHKEX2isidPCvprbYbWp26RCtYEuhXpszM4U0JUVF0c3NhC7u
         CYQvHC96rlaAMcvQJtMJ1ToZaWARnel4RQ9FiyTNeel3m+oNMBKhROR0S1DNGKRhlSya
         45nQwedeBVPS2apYtKg2Ymv7GWg4Ak1QMygUbqEOmRmbd5JeruOCNxbngltdkyWzBtTV
         Z7yR8rF1SWqOzFTSWI56AffMbfn/Xi3uptc/PYdDZCA2TkmSLRdq3ggUXiu1kmI8UG1b
         Ej2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ivoRp95h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg1-20020a056214252100b0045b09ec71fesi5000851qvb.292.2022.06.13.09.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jun 2022 09:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ivoRp95h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o0mat-0005Gv-FQ
	for alex.bennee@linaro.org; Mon, 13 Jun 2022 12:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o0mWe-0001sK-EO
 for qemu-arm@nongnu.org; Mon, 13 Jun 2022 12:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o0mWb-0004XM-Gm
 for qemu-arm@nongnu.org; Mon, 13 Jun 2022 12:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655136164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ZN1SruJXh6GSm3tIf4Etj3mJf1Qp5u8MmFUMs27FWo=;
 b=ivoRp95h20Eo//rK78Pfs3YSZ3JIMHMg6ALiO9gkix4hBRgNdGuMus7brZIPFfeDW9bI8c
 hiSyK8V573XRFQtR5GuoCHb5YhPVgo5xuVN0R5Fw1Am+XBKtbkInI1DGiJxkqlTtU5Ef1s
 VGWV8tXB0hz0SuaW6cNZesThdVLfKSg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-NTZBAbvNO4OVmWE81gHcEA-1; Mon, 13 Jun 2022 12:02:41 -0400
X-MC-Unique: NTZBAbvNO4OVmWE81gHcEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4014B2919EA9;
 Mon, 13 Jun 2022 16:02:40 +0000 (UTC)
Received: from localhost (unknown [10.39.194.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9D442026D2D;
 Mon, 13 Jun 2022 16:02:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] arm: enable MTE for QEMU + kvm
In-Reply-To: <4bb7b5e4-ceb4-d2d8-e03a-f7059e5158d6@redhat.com>
Organization: Red Hat GmbH
References: <20220512131146.78457-1-cohuck@redhat.com>
 <4bb7b5e4-ceb4-d2d8-e03a-f7059e5158d6@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Mon, 13 Jun 2022 18:02:38 +0200
Message-ID: <87a6agsg9t.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: DTVobzwVyqO0

On Fri, Jun 10 2022, Eric Auger <eauger@redhat.com> wrote:

> Hi Connie,
>
> On 5/12/22 15:11, Cornelia Huck wrote:
>> This series enables MTE for kvm guests, if the kernel supports it.
>> Lightly tested while running under the simulator (the arm64/mte/
>> kselftests pass... if you wait patiently :)
>> 
>> A new cpu property "mte" (defaulting to on if possible) is introduced;
>> for tcg, you still need to enable mte at the machine as well.
> isn't the property set to off by default when kvm is enabled (because of
> the migration blocker).

Oh, I had changed that around several times, and it seems I ended up
being confused when I wrote this cover letter... I wonder what the best
state would be (assuming that I don't manage to implement it soonish,
but it seems we still would need kernel changes as by the discussion in
that other patch series.)

>
> Eric
>> 
>> I've hacked up some very basic qtests; not entirely sure if I'm going
>> about it the right way.
>> 
>> Some things to look out for:
>> - Migration is not (yet) supported. I added a migration blocker if we
>>   enable mte in the kvm case. AFAIK, there isn't any hardware available
>>   yet that allows mte + kvm to be used (I think the latest Gravitons
>>   implement mte, but no bare metal instances seem to be available), so
>>   that should not have any impact on real world usage.
>> - I'm not at all sure about the interaction between the virt machine 'mte'
>>   prop and the cpu 'mte' prop. To keep things working with tcg as before,
>>   a not-specified mte for the cpu should simply give us a guest without
>>   mte if it wasn't specified for the machine. However, mte on the cpu
>>   without mte on the machine should probably generate an error, but I'm not
>>   sure how to detect that without breaking the silent downgrade to preserve
>>   existing behaviour.
>> - As I'm still new to arm, please don't assume that I know what I'm doing :)
>> 
>> 
>> Cornelia Huck (2):
>>   arm/kvm: enable MTE if available
>>   qtests/arm: add some mte tests
>> 
>>  target/arm/cpu.c               | 18 +++-----
>>  target/arm/cpu.h               |  4 ++
>>  target/arm/cpu64.c             | 78 ++++++++++++++++++++++++++++++++++
>>  target/arm/kvm64.c             |  5 +++
>>  target/arm/kvm_arm.h           | 12 ++++++
>>  target/arm/monitor.c           |  1 +
>>  tests/qtest/arm-cpu-features.c | 31 ++++++++++++++
>>  7 files changed, 137 insertions(+), 12 deletions(-)
>> 

