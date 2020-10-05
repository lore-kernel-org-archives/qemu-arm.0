Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3738449lfq;
        Sun, 4 Oct 2020 23:33:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu2+kfRDMuOAWBjEXWGeqIHCQG8oJHRTBh71W8yzGo1BSl0I3JPnyv9MsaimVQQOpxbq3J
X-Received: by 2002:a25:854d:: with SMTP id f13mr16018539ybn.210.1601879639010;
        Sun, 04 Oct 2020 23:33:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601879639; cv=none;
        d=google.com; s=arc-20160816;
        b=xDjpSIwry2aZAb5VbSJKrHqdcVpPHJWj/jrzPVZC1xddWnboQbGce4oQrfTQumP64j
         r9/GoFqsDSoBBbnYrG7+4v+xgsESY8JhtYvbwCZ9mZi463CcE/Lu9JjfXvTigfNHeSkn
         jic7AATu30FSjOAFj2c+7bQVxY0/ybpeVqas3ebQSgk/LqwRwWlRJWUshlBsDV9kXQZI
         p14dX2hQeDTAZR3ztMz7W127c6v5oWvz+PJ0LrZWt1n23dMudlQpIHUmby7ony4lx6f+
         MqZgqoq4ovyrYRBw9nnj9+sULWSCOjVS1QJmofUytdSnXQM4i2PrEvuTgDnkhsT7B5fx
         ovsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tYhPG5upwMkpIHxG+0Upc1PqbqAzbVxFJ+rcnlZQ0A8=;
        b=LrAAEoYSqwyUYx5N3amfwwTPHNYI21qTLXmVlZb2lBQG6H97ME8/b1ni3/nkbO/Mk6
         0IJYcAF2crrPnHCXmLy8ke5PR7kZmLZVUAjgkyTOmSxNGd7Edl7/2wHw/7WFlicnBOaj
         Y6lTzuZb0cjULM2Fk8Qq+0QDgEuvaFgbSyAU/RoioPCv+zoBfdUrDK+kpCsS7zi/AuBk
         XTHbKITscFmInXYLiOmpODiN8l8ryT/LO/Lyhl8lDCHaRj0y5iG4fYB7EcfPaofhCrVv
         NJ8nAXPO4HOwbW+KWLGZkezJgSV6T4eFYXy5+t/2weyxhlPRZadYixUAf7/vqsDyXL7V
         1sow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jAbIey5f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v66si10381035ybv.476.2020.10.04.23.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Oct 2020 23:33:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jAbIey5f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kPK4M-00082W-Dn
	for alex.bennee@linaro.org; Mon, 05 Oct 2020 02:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kPK3e-000828-8n
 for qemu-arm@nongnu.org; Mon, 05 Oct 2020 02:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kPK3b-000255-Ps
 for qemu-arm@nongnu.org; Mon, 05 Oct 2020 02:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601879590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYhPG5upwMkpIHxG+0Upc1PqbqAzbVxFJ+rcnlZQ0A8=;
 b=jAbIey5f2oAYNtcGh79AP6C1Ns+RDav++PdgHI8SwZh92ucxtnjYFNRxvTnkIzUHD5xzfF
 u79AlbOeHAyB8bJ0gXbki/4bsDU5F14wVU0lpv8JwAUHTcf4mDSapuuSLr5KasPwsw8w03
 hbhcSxz1CyMrBNFhwicbbZG80EOVw8M=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-dY2alSt4PyGMWv0uaK1U7Q-1; Mon, 05 Oct 2020 02:33:08 -0400
X-MC-Unique: dY2alSt4PyGMWv0uaK1U7Q-1
Received: by mail-qk1-f199.google.com with SMTP id f126so1139218qke.17
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2020 23:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tYhPG5upwMkpIHxG+0Upc1PqbqAzbVxFJ+rcnlZQ0A8=;
 b=Vz0GZri5db1j7H29QZGSqabLdxCgmuW6kJgYdrvJzo3hony2B1xBx4zI/yyo4ze/48
 3ONoi5npMjxHs0B4nZnuUbcwikO9plmba0rBOknYE7+GbgiRSossprrnW2lWlgrnOiRe
 JXe+CtFvg9In3vIZQsDRuOHNOI3SOjm5P56Nq3Ze4/bnJZRi8kK664VSjiIc3sVvV8UP
 /Bb2Qw0xu7sZWDayLvF8sWYTr4phWbw5sH4fffaE5VMQwAlN21LxLZ/Bhszh9J1HXzAx
 K3xSUSyLNpNChFBLRoURNL3KQ3DrZDwKLfXJ7h9xKO/0OcEpBLICY/z1s6amVQjblrUM
 EQLA==
X-Gm-Message-State: AOAM533vRnaAcCT5BxcxbQAF/g/y7ZhiXR3uOyccsO3PW985jTNGv5H6
 LHeaQib4pHP9lCniClBAnuaZTN++06FfKk5y/npGlDimDaMIP7jlPy1pENnyNSwMPwuOIKNSBtY
 QDCNCxXnetFfC1u0wNBzg+1iHgMCr
X-Received: by 2002:a37:e214:: with SMTP id g20mr12131160qki.89.1601879588431; 
 Sun, 04 Oct 2020 23:33:08 -0700 (PDT)
X-Received: by 2002:a37:e214:: with SMTP id g20mr12131134qki.89.1601879588140; 
 Sun, 04 Oct 2020 23:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200903161446.29615-1-eperezma@redhat.com>
 <20200903161446.29615-6-eperezma@redhat.com>
 <d3e2098d-e150-7f99-a1ee-4a997daf4a5c@redhat.com>
 <CAJaqyWfwGP7_Ex=NhG_po+A1BkN3OCV=+3Vwi8uhLJ_e4UA5NQ@mail.gmail.com>
 <20200928174857.GC59869@xz-x1> <20201003082953-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201003082953-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 5 Oct 2020 08:32:31 +0200
Message-ID: <CAJaqyWc1rrGu_YYNcANquXqd+LCBvoOZYYHdtsG3XQJDDbWohg@mail.gmail.com>
Subject: Re: [PATCH 5/5] memory: Skip bad range assertion if notifier is
 DEVIOTLB_UNMAP type
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Udyg65M98vqa

On Sat, Oct 3, 2020 at 7:38 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Sep 28, 2020 at 01:48:57PM -0400, Peter Xu wrote:
> > On Mon, Sep 28, 2020 at 11:05:01AM +0200, Eugenio Perez Martin wrote:
> > > On Fri, Sep 4, 2020 at 6:34 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > >
> > > > On 2020/9/4 =E4=B8=8A=E5=8D=8812:14, Eugenio P=C3=A9rez wrote:
> > > > > Device IOTLB invalidations can unmap arbitrary ranges, eiter outs=
ide of
> > > > > the memory region or even [0, ~0ULL] for all the space. The asser=
tion
> > > > > could be hit by a guest, and rhel7 guest effectively hit it.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > > > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > > > > ---
> > > > >   softmmu/memory.c | 13 +++++++++++--
> > > > >   1 file changed, 11 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > > > index 8694fc7cf7..e723fcbaa1 100644
> > > > > --- a/softmmu/memory.c
> > > > > +++ b/softmmu/memory.c
> > > > > @@ -1895,6 +1895,7 @@ void memory_region_notify_iommu_one(IOMMUNo=
tifier *notifier,
> > > > >   {
> > > > >       IOMMUTLBEntry *entry =3D &event->entry;
> > > > >       hwaddr entry_end =3D entry->iova + entry->addr_mask;
> > > > > +    IOMMUTLBEntry tmp =3D *entry;
> > > > >
> > > > >       if (event->type =3D=3D IOMMU_NOTIFIER_UNMAP) {
> > > > >           assert(entry->perm =3D=3D IOMMU_NONE);
> > > > > @@ -1908,10 +1909,18 @@ void memory_region_notify_iommu_one(IOMMU=
Notifier *notifier,
> > > > >           return;
> > > > >       }
> > > > >
> > > > > -    assert(entry->iova >=3D notifier->start && entry_end <=3D no=
tifier->end);
> > > > > +    if (notifier->notifier_flags & IOMMU_NOTIFIER_DEVIOTLB_UNMAP=
) {
> > > > > +        /* Crop (iova, addr_mask) to range */
> > > > > +        tmp.iova =3D MAX(tmp.iova, notifier->start);
> > > > > +        tmp.addr_mask =3D MIN(entry_end, notifier->end) - tmp.io=
va;
> > > > > +        /* Confirm no underflow */
> > > > > +        assert(MIN(entry_end, notifier->end) >=3D tmp.iova);
> > > >
> > > >
> > > > It's still not clear to me why we need such assert. Consider
> > > > notifier->end is the possible IOVA range but not possible device IO=
TLB
> > > > invalidation range (e.g it allows [0, ULLONG_MAX]).
> > > >
> > > > Thanks
> > > >
> > >
> > > As far as I understood the device should admit that out of bounds
> > > notifications in that case,
> > > and the assert just makes sure that there was no underflow in
> > > tmp.addr_mask, i.e., that something
> > > very wrong that should never happen in production happened.
> > >
> > > Peter, would you mind to confirm/correct it?
> >
> > I think Jason is right - since we have checked at the entry that the tw=
o
> > regions cross over each other:
> >
> >     /*
> >      * Skip the notification if the notification does not overlap
> >      * with registered range.
> >      */
> >     if (notifier->start > entry_end || notifier->end < entry->iova) {
> >         return;
> >     }
> >
> > Then I don't see how this assertion can fail any more.
> >
> > But imho not a big problem either, and it shouldn't hurt to even keep t=
he
> > assertion of above isn't that straightforward.
> >
> > >
> > > Is there anything else needed to pull this patch?
> >
> > I didn't post a pull for this only because I shouldn't :) - the plan wa=
s that
> > all vt-d patches will still go via Michael's tree, iiuc.  Though at lea=
st to me
> > I think this series is acceptable for merging.
>
> Sure, that's ok.
>
> Eugenio, you sent patch 0 as a response to another series, which
> made me miss the series. Pls don't do that in the future.
>

Sorry, noted for the next time.

Thanks!

> Looks like Jason reviewed the series - Jason, is that right? -
> so I'd like his ack if possible.
>
>
> > Though it would always be good too if Jason would still like to review =
it.
> >
> > Jason, what's your opinion?
> >
> > Thanks,
> >
> > --
> > Peter Xu
>

