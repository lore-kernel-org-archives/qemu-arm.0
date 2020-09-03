Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp709129lfc;
        Thu, 3 Sep 2020 10:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg/FRQbdEk6Ndg1PRoffJ2nPjge3SkfjxG55wdwQm0yzNPgWJcFsNSHoQsnE7cOrBAc43z
X-Received: by 2002:a05:6902:1022:: with SMTP id x2mr3966577ybt.391.1599152771075;
        Thu, 03 Sep 2020 10:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599152771; cv=none;
        d=google.com; s=arc-20160816;
        b=WeWCbpdteFPU3L05eHu/NU6aA6o1NJKgE6F2CCK06kO7coQZaTHTNnsqPmFF6XxDb3
         tZ+4B/gXj6HdH3Lqb40b4KYqVqqm1PixJ6ckGYOeETZCPxWLs0VT5h4+zPjxNAwqcESp
         uc9NilCfriqpavYBt64asLcZSUq6uV2L4O35bzZmGX6vMBaabVTc2R1HLobGpaCg+Ccj
         GJcEBxhGoOHDsnSaavpSQmCvKimdHPAXZY0jlr9aMXZtptqRFrngstEXwfAgQ441HS/o
         B2Kzv6MNZyBa9Vx9mlqPmkV81xvbSWE+DOmL31m0IwYysvVlKA+jMLQ1mAUoZU5+nYPB
         Uc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=l/xjPfj/tH338pdJxM7gVbr8ZOJ5LeUsNYtGEq4fxco=;
        b=G93ES9tK+HmtkFRP3RTnVNudfTpi5jLetqecJoRe8wqWYc9T42LywRcqmy4t7nh7fa
         46u1mVYJZZmZXd/t6CuiZ4yfo+SR6a8rjSrCcfn0040C/M4XB8x1zKrro3rLBZ7h45qo
         g0XL/tzROl2rh1egIOOb5c6MQw79yi8SdfNa7xjCsj+BkCrnIyS1HUWZ7t6xkZ4g/Yvq
         wDfNV6pTtYo1gn3x711gSktepMQ+tWsxq2c3M59wCOIBfoneuAmxj2h0FMjokP7HTwVq
         HxKeFUyowTNPIvrBSmafm/pi1+Y2xUhZEf3qnZZ68/c65y4UecPJwqxcfPBjR+m+wvOB
         gPpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="M1vk1M/s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v28si3603773ybd.98.2020.09.03.10.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 10:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="M1vk1M/s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDsgc-0004Y2-F7
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 13:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDsgT-0004XA-JX
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 13:06:01 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29995
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kDsgS-00086o-1s
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 13:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599152758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/xjPfj/tH338pdJxM7gVbr8ZOJ5LeUsNYtGEq4fxco=;
 b=M1vk1M/sJsQqeYGgq4bO0q3U0mRngjOCMeLGdIx/rIOgalo7vQThrQpxOn0+4IEaTDzxTX
 P8pFvmayoMgj0jEtX6JDxzAceVmGAR/BjPcCEtlMz87u5KO3r3cwmO5tw+agEIJ+b2HaHf
 N817NKXSJJ/zCZDneU+Jqf4lCcudNvs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-1ZGp4Q1_PZSm5PePw7KKsA-1; Thu, 03 Sep 2020 13:05:49 -0400
X-MC-Unique: 1ZGp4Q1_PZSm5PePw7KKsA-1
Received: by mail-qk1-f200.google.com with SMTP id s141so1951703qka.13
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 10:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l/xjPfj/tH338pdJxM7gVbr8ZOJ5LeUsNYtGEq4fxco=;
 b=pDgLyat/3RdmTktCqboyONtFbbU/T3ONyz7oY1PMi03SgTVZPUohEEicG6k/pGicNs
 7TO6W53vIclBOWIxgtLMwjcZYVuvgKVQLCGD9pwqZONRn1vmLv1oTsD6fhScYf+0YRyB
 eXi8Xz5iwr6KUZxWwdpl4cs/aoQhSZWIaWTcslnoif7nNJZa+GzAU17cGEFjWTCVALcs
 dc2OQK8AxTG5vDwywrGWLuQw3qHAy2mmyvqC00yTd8xeN2F8ZHlR0Kgi4HleOZZhXPHt
 MCoeusmWY7lTmvxhHsLC7g6GMhZpLhaAv4LCKzuXlwoghxQZpwNO2aMO291oxZiHtlUj
 rHzA==
X-Gm-Message-State: AOAM531+3iar6+cuMlTZelTBP2iFEpzcubaErHPsu0ZgcPqW4gIPbEOC
 0TtXOy+u8Lf1FH8NA8RjDhIsAO3pHK2duz1UHMpmW49FQQCUmJFiKex7XAsIUqR3JkrMRmkqGSa
 5m3vv9FdejXQuMFtiRWdDFxO4Vawn
X-Received: by 2002:ac8:4f4b:: with SMTP id i11mr4333168qtw.379.1599152748879; 
 Thu, 03 Sep 2020 10:05:48 -0700 (PDT)
X-Received: by 2002:ac8:4f4b:: with SMTP id i11mr4333140qtw.379.1599152748650; 
 Thu, 03 Sep 2020 10:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-6-eperezma@redhat.com>
 <44d9e8a5-79fa-11c8-9ec1-4c3d76929408@redhat.com>
 <20200902235737.GF1897@yekko.fritz.box>
In-Reply-To: <20200902235737.GF1897@yekko.fritz.box>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 3 Sep 2020 19:05:11 +0200
Message-ID: <CAJaqyWcto4iNFRDoAu5KsYvUiYt3GXhGHjXRm0nezRGjioMbyQ@mail.gmail.com>
Subject: Re: [RFC v8 5/5] memory: Skip bad range assertion if notifier is
 DEVIOTLB type
To: David Gibson <david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TtxD4MV40aW5

On Thu, Sep 3, 2020 at 2:05 AM David Gibson <david@gibson.dropbear.id.au> w=
rote:
>
> On Wed, Sep 02, 2020 at 04:24:50PM +0200, Auger Eric wrote:
> > Hi Eugenio,
> >
> > On 9/1/20 4:26 PM, Eugenio P=C3=A9rez wrote:
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Please could you explain in the commit message why you need to remove
> > the assert()? I know you described the assert() in the cover letter but
> > the commit msg is the one that remains.
>
> Right... neither in the cover letter nor the individual patches,
> AFAICT, does anything actually explain why that assert() could be
> hit.  Nor does it connect the dots from an assert() hitting to adding
> infrastructure for a new event type.
>

Hi!

You are right. I think I've made it clearer in the new patch sent (now
as patch instead of RFC).

Please let me know if you think further explanations are needed.

Thanks!


> > > ---
> > >  softmmu/memory.c | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > index 09b3443eac..3ee99b4dc0 100644
> > > --- a/softmmu/memory.c
> > > +++ b/softmmu/memory.c
> > > @@ -1895,6 +1895,7 @@ void memory_region_notify_iommu_one(IOMMUNotifi=
er *notifier,
> > >  {
> > >      IOMMUTLBEntry *entry =3D &event->entry;
> > >      hwaddr entry_end =3D entry->iova + entry->addr_mask;
> > > +    IOMMUTLBEntry tmp =3D *entry;
> > >
> > >      /*
> > >       * Skip the notification if the notification does not overlap
> > > @@ -1904,10 +1905,18 @@ void memory_region_notify_iommu_one(IOMMUNoti=
fier *notifier,
> > >          return;
> > >      }
> > >
> > > -    assert(entry->iova >=3D notifier->start && entry_end <=3D notifi=
er->end);
> > > +    if (notifier->notifier_flags & IOMMU_NOTIFIER_DEVIOTLB) {
> > > +        /* Crop (iova, addr_mask) to range */
> > > +        tmp.iova =3D MAX(tmp.iova, notifier->start);
> > > +        tmp.addr_mask =3D MIN(entry_end, notifier->end) - tmp.iova;
> > > +        /* Confirm no underflow */
> > > +        assert(MIN(entry_end, notifier->end) >=3D tmp.iova);
> > > +    } else {
> > > +        assert(entry->iova >=3D notifier->start && entry_end <=3D no=
tifier->end);
> > > +    }
> > >
> > >      if (event->type & notifier->notifier_flags) {
> > > -        notifier->notify(notifier, entry);
> > > +        notifier->notify(notifier, &tmp);
> > >      }
> > >  }
> > >
> > >
> > Thanks
> >
> > Eric
> >
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _othe=
r_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson

