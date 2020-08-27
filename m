Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp317252lfc;
        Wed, 26 Aug 2020 23:54:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBr+c7yZilCYGEJBTZzR7VBWcatXcN+H3pGqK0PVP0GbOpEFP3mJJ0/YIKe3mPQS/1grHq
X-Received: by 2002:a05:6902:4af:: with SMTP id r15mr25704845ybs.32.1598511254758;
        Wed, 26 Aug 2020 23:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598511254; cv=none;
        d=google.com; s=arc-20160816;
        b=Oder7b1JiwC24FF+mtNoxokByQJi3qy1YinGVsp8UoUK0yHbeWO7iMP3/F4ahvcyqX
         N4ruTbU9mWeOXqNfSU7W0gSa+SvshO3jkDNLNKGA4dPye1XUDWLgq+N2jfsRClfbbpFd
         NFZk75EA8nXuRakd2cMnkLI9LRWxi4ZlqM4s72lpDdCoQTF8nKeug/X5Zx6eL3W/BysB
         xUF/GNG3mtApn/sIHSsLQtuH8cmSETvzkYU1KE4+QIuuaCJgWF0vbDn2McrPcaspv5BA
         JBB5BfVXU1yW9aIYJVtogeENDF8dhYcVdxyUKXAihdWuyYIzhEwN7VhIW8PP3nL86HIF
         MY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m6pExH/Wx7HDxG5TZe8WndVEbse8trnYUp0l8jdP0II=;
        b=woOpZ+bRqmkTJoBL2t4WBji2UbS/cQ1vMr3gOSkBTgo9uU3KWu5dh2smTXGP0R+2P2
         5SpuZunTA5R9V+z5/TKTvuUnYPJM47J+uNDk7NEV+ZSbxNktPhcsQkvFvQ131ZDppCg9
         YG8qwaG7Ry0S1IastjkHadquF+3iDQ6YZcAqo0Nh8VuG7cVfxrtXlWoYY6YpwbKbQ+ih
         ouc7TGZpzn9JtDSoxsisrce9NkASVFkQlnM9udJlQCe0zPSvK/TdlJZdV+vk9Pt9K2ar
         PQOIwMQp+oG0z8cFFul0JEgNIyq/Mb2UwmbYyBlHwBF13IGHLwEnzgw4KfRFmIraRdhN
         +wGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PET5LWbR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c186si1440658ybb.397.2020.08.26.23.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 23:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PET5LWbR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBBna-0000Pu-4i
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 02:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kBBnS-0000PL-Ag
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 02:54:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kBBnP-0001qn-DU
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 02:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598511242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m6pExH/Wx7HDxG5TZe8WndVEbse8trnYUp0l8jdP0II=;
 b=PET5LWbR4bsCfoZ4lzXdAT3RGbq+u1/CssrcNLL3x0/IZmZgyfB7rspomojsK3FmGq03zY
 Vkb91NpYq8UCa7prqDx1ZW/EJJ3Rq0xOHhdcFwLEWXBvlPGsP8z2+vv6XMWpFBhlGonP7B
 lfWFhXbr951ORgDXF9GuSA5T0YieP2I=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-UhEiJphBNGOEMpHd-HKZJw-1; Thu, 27 Aug 2020 02:54:00 -0400
X-MC-Unique: UhEiJphBNGOEMpHd-HKZJw-1
Received: by mail-qk1-f197.google.com with SMTP id x20so3909779qki.20
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 23:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6pExH/Wx7HDxG5TZe8WndVEbse8trnYUp0l8jdP0II=;
 b=ojauwV9tSVjBneLoYy7lNQz+FYwHTAecfXvJkvjnwY2HlISSpt5ht0ZtCyeZ0Q5CEH
 Pvh8YphFC1tpehg2SCKkaYQS1FmXlZja+ZPBKJCr+lF6uwQgRKg02f6bIES7e9D96tsV
 1qIGXB0kaU0X7xVPGjKGlU0VKD/NIsauBodogZz3vu6oVA9K/Repwp+bgMU9Ig3ww0/8
 QEFqzfLMfKw1oJLM452+3aWmVoKO+7t5f3vmsy4/Oq9HWU7rIwz1qLQxs0plx0q2yEmQ
 0iLgmFUwJ9g0AcKM/64x7nwurC51f+GbLuxNx6MA8AJm4Ld0AqkOEezy6MctB0voz3gQ
 OOkw==
X-Gm-Message-State: AOAM530zFj3hh92Ra5yzI7M29vwV8A90mzjU9N4RagmP00aSp9qiKy3Q
 x6G5UwCwaxDDyloblDsamEbxORKfnvoIGKSto3c1Tb1KtHGZp7FSroXWeBmCpJ5x5gJc5CYuf48
 xqQ+gX8QFeltt26oMHntVHiZQG9Ov
X-Received: by 2002:a05:620a:ed3:: with SMTP id
 x19mr15955300qkm.89.1598511239875; 
 Wed, 26 Aug 2020 23:53:59 -0700 (PDT)
X-Received: by 2002:a05:620a:ed3:: with SMTP id
 x19mr15955280qkm.89.1598511239638; 
 Wed, 26 Aug 2020 23:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
 <CAJaqyWf5vgSNvix99aWzrm2kDZ5xHQ_binRkpTe7WifDrLCjyw@mail.gmail.com>
 <20200826155409.GG8235@xz-x1>
In-Reply-To: <20200826155409.GG8235@xz-x1>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 27 Aug 2020 08:53:23 +0200
Message-ID: <CAJaqyWcVRrX=3TzSpiRUrVBZ8m=c0Rvt1OtN4ZQZS1EoVkCtZg@mail.gmail.com>
Subject: Re: [RFC v6 00/13] memory: Delete assertion in
 memory_region_unregister_iommu_notifier
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:54:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a788WdwwD5Qm

On Wed, Aug 26, 2020 at 5:54 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Aug 26, 2020 at 05:00:30PM +0200, Eugenio Perez Martin wrote:
> > Hi!
> >
> > Sending v6 to see if that is on the same page as what you meant.
> > Making each setting of "type" explicitly IOMMU_IOTLB_NONE if not used
> > in notifications. This is done in different commits in case this helps
> > review of different architectures.
>
> I've also proposed IOMMUTLBEvent in the other reply, that might help too.
>

I think IOMMUTLBEvent would be way clearer, yes :).

> Since at it, there's also another trick to use - we don't need to touch those
> "type" as long as the default type is "zero", so as long as we make sure the
> default type (IOMMU_NOTIFIER_NONE) is zero, then we don't need to set it
> everywhere either.
>

Right, I was just making it explicit.

> >
> > I think that this way we have too much freedom between entry flags
> > (currently only access type, RW) and notification type. Since not all
> > of them are valid nor used in the same context, I think this adds
> > complexity. I'm wondering if:
> >
> > Option a) We could make it private to memory.c, and make it a flag of
> > memory_region_notify_iommu (like "bool deviotlb_type)". IOW, instead
> > of making it a member of IOMMUTLBEntry, wrap the "entry" parameter of
> > memory_region_notify_iommu in a new private structure defined in
> > memory.c that adds that flag.
>
> No strong preference from me.  But since you posted the series before you
> provide the options... Maybe continue with what we have can be easier. :)
>

I just wanted to be sure I understood your proposal before comparing :)

> >
> > Option b) We could keep the IOMMUTLBNotificationType enum (open to
> > suggestions for a better name :)), but not embed it in the struct,
> > like:
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 477c3af24c..d9150e7b7e 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -72,7 +72,8 @@ typedef enum {
> >      IOMMU_RO   = 1,
> >      IOMMU_WO   = 2,
> >      IOMMU_RW   = 3,
> > -} IOMMUAccessFlags;
> > +    IOMMU_DEVIOTLB = 4,
> > +} IOMMUEntryFlags;
>
> Just in case you didn't notice - IOMMUAccessFlags is actaully a bitmap. :)
>

I know I know, that is why I compared with IOMMU_RW in proposed
iommu_tlb_entry_type.

Thanks!

> IMHO we can keep the IOMMUAccessFlags scemantics, since it's still correct for
> a general translated IOMMUTLBEntry object.
>
> Thanks,
>
> --
> Peter Xu
>

