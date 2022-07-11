Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp888212lfp;
        Mon, 11 Jul 2022 07:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sE7zmxJQ/Ifsn4EDNwbSw1CG8MzYv7hdc50zr++Dq5Awvcfv9z6VVdyKNE3ouxkGysNT8l
X-Received: by 2002:a17:902:9692:b0:16c:4f81:b7 with SMTP id n18-20020a170902969200b0016c4f8100b7mr3838483plp.92.1657551428262;
        Mon, 11 Jul 2022 07:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657551428; cv=none;
        d=google.com; s=arc-20160816;
        b=0Poqazz0b63XITcUMFUW9OSBu00DnQnnHeqG1db8SukTX5lxo5/vEWwDl6NTPXKtDq
         VcBDEUkbUTqg/L9KDZzfAEU+hQ3czlHHNttknCZ5Jfp4PDUGI0MRDw1eDLY766+nXsyj
         tB0/Un74HGL8YgAtNvjAX9wJbZXIANzjnDS2KH4zo9z3dF0B/VDu57xSd0AglIln45GD
         g4A4Vj8If1a12se0llABYSpa8e/oNw+5BYmpldPUDgbkuzH8ktHOConjzNboN/aYhz/D
         0OYjrczM7uOhso8AC3ung8eeYr6UsKjcN/MA4TQ9E8cqgthAWMXQgoDI2pxOP00tkC03
         J3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=RjKS13/NlMqaLdRkWRLl34SCYGjbP2YQ4ufi2FT/Xdk=;
        b=IDfkmC/qMxDNxKYAwgt/KGp02H4kafxmyTFDT4AN+F6wF9s8qi1dK8giTY517HXur7
         v1HedOCAUGy0vu8xmvrLVFLNoXKefRDK2LxAMNpIst0i1IhTXWhqQZyOHPKBaZMjbU/X
         /TFsseNpAvCnmUZOUPffFzH1T8N14QlXKfPx/rHh4jky+BwsvbIhcyHxKhD7/K/lijO4
         5Fc344JNLJBmL8EZCu129HTiy8/naXVDTTwosv5zPSC3haXPnRwGXePqYW3zGFguKuju
         F95DheDtsvqSv8AxUKnzZzbGcouTesVJSm3pe1IvvpxmSDAMv4RRHPgPw2xXbSziyO6E
         EO4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iRDOg0Vw;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id r5-20020a632b05000000b0041603075b9asi3870828pgr.309.2022.07.11.07.57.08;
        Mon, 11 Jul 2022 07:57:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iRDOg0Vw;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiGKO5H (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Mon, 11 Jul 2022 10:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbiGKO5E (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 11 Jul 2022 10:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6233F71BC1
        for <kvm@vger.kernel.org>; Mon, 11 Jul 2022 07:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657551422;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RjKS13/NlMqaLdRkWRLl34SCYGjbP2YQ4ufi2FT/Xdk=;
        b=iRDOg0Vw7xqFj+Bg6tWfovVjLyJEFM9q2xk3+fjAcWO1OPpqSllL6Ok/TP25v7igpVZHTQ
        hHzOMQRQf8FaXj191bZLCO/HI8fX4ysfHSmcef6HY9qjKHA65v6I3lLXLFzT59eNZB8X8y
        8bmPn62QyR8k1tnihbIdbjq7jjQMJbA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-szgrPC89OX-dLPadLwjCKQ-1; Mon, 11 Jul 2022 10:56:55 -0400
X-MC-Unique: szgrPC89OX-dLPadLwjCKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A818801590;
        Mon, 11 Jul 2022 14:56:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.23])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id BA84A40D296C;
        Mon, 11 Jul 2022 14:56:54 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>
Cc:     Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Eric Auger <eauger@redhat.com>,
        Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
In-Reply-To: <YswzM/Q75rkkj/+Y@work-vm>
Organization: Red Hat GmbH
References: <20220707161656.41664-1-cohuck@redhat.com>
 <YswkdVeESqf5sknQ@work-vm>
 <CAFEAcA-e4Jvb-wV8sKc7etKrHYPGuOh=naozrcy2MCoiYeANDQ@mail.gmail.com>
 <YswzM/Q75rkkj/+Y@work-vm>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date:   Mon, 11 Jul 2022 16:56:53 +0200
Message-ID: <87r12r66kq.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: yBfSBcSvrdfG

On Mon, Jul 11 2022, "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Mon, 11 Jul 2022 at 14:24, Dr. David Alan Gilbert
>> <dgilbert@redhat.com> wrote:
>> > But, ignoring postcopy for a minute, with KVM how do different types of
>> > backing memory work - e.g. if I back a region of guest memory with
>> > /dev/shm/something or a hugepage equivalent, where does the MTE memory
>> > come from, and how do you set it?
>> 
>> Generally in an MTE system anything that's "plain old RAM" is expected
>> to support tags. (The architecture manual calls this "conventional
>> memory". This isn't quite the same as "anything that looks RAM-like",
>> e.g. the graphics card framebuffer doesn't have to support tags!)
>
> I guess things like non-volatile disks mapped as DAX are fun edge cases.
>
>> One plausible implementation is that the firmware and memory controller
>> are in cahoots and arrange that the appropriate fraction of the DRAM is
>> reserved for holding tags (and inaccessible as normal RAM even by the OS);
>> but where the tags are stored is entirely impdef and an implementation
>> could choose to put the tags in their own entirely separate storage if
>> it liked. The only way to access the tag storage is via the instructions
>> for getting and setting tags.
>
> Hmm OK;   In postcopy, at the moment, the call qemu uses is a call that
> atomically places a page of data in memory and then tells the vCPUs to
> continue.  I guess a variant that took an extra blob of MTE data would
> do.

Yes, the current idea is to extend UFFDIO_COPY with a flag so that we
get the tag data along with the page.

> Note that other VMMs built on kvm work in different ways; the other
> common way is to write into the backing file (i.e. the /dev/shm
> whatever atomically somehow) and then do the userfault call to tell the
> vcpus to continue.  It looks like this is the way things will work in
> the split hugepage mechanism Google are currently adding.

Hmm... I had the impression that other VMMs had not cared about this
particular use case yet; if they need a slightly different mechanism,
it would complicate things a bit.
