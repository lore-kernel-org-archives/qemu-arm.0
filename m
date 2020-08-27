Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp295803lfc;
        Wed, 26 Aug 2020 23:12:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2eqY/V3HCQKS5LYNLhxfXf2cSKVmrUjl0vY7nV5Blv5CNa9/05Q4VenAIN9ODjq6Kmshd
X-Received: by 2002:a25:9cc7:: with SMTP id z7mr2368245ybo.387.1598508761224;
        Wed, 26 Aug 2020 23:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598508761; cv=none;
        d=google.com; s=arc-20160816;
        b=HNv0wwwZH1wyEYTSIQhV8N10Oucpzc0vBYDLeNEJCAP51gWsXfryok8SCMU20cUQ3K
         T55ohz4/hYqTKuKi6LAshds/SpI14z5o1MErmCdYrZYGto+URJsUCqIHNNzoVoXmqsNC
         3xdYYIahXOffrnCrFLTqqq0hyQp8wYC4MjcgpCvC6xYb9WFedpd6AYdRfvKl95An4dg0
         TvJiAK4wx3d0AW7yE16y5SfuL0+K5EaUjRq60eQoEaaw1wGoA65513mY2FBa7FIRN/RA
         sXn3bBb+SDSzj5Q3TTKc+B1bE+vzPyVS+cdDTx7Ld4s5Q/GDgjBchQVsQEWjps83uFdl
         LTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3/rlhBOVazI3yJbEIvNcqi9aYG1HHyOm095VFtPDuwk=;
        b=FhnShakqM2egVJODFZ8O07hg5bqJji5+H14rpny6yGEjY+bk9Wn52JLHTFG6eSt5ZT
         ZNbsrSN6pfcATRUtbefGEB6/m77LvnzkzPPubfZQyk51WMOTL7G6jiMtNguNxeeKTF4U
         CCnbPdLgVWeV6ihj+ac+SzS1/WDDVQ9WaEmoCs6u6/mQGDz63bQ1F+vnVpdx1NUWfBke
         HUlFeh49JtemVedlomp2GrOVR06jKBKj/dsgrTob22mq5vaYCsNvpxiaFT0gFlk/rMYx
         F84Yd0LvS0xyDr6vloc5RxPy0vMGcuA6aT+8fENkD+nTQdYkPrmcAG8TeCmpyI0qR75W
         hY4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M7eZSDLi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si1850547ybt.3.2020.08.26.23.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 23:12:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M7eZSDLi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBB9M-0005zQ-21
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 02:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kBB9A-0005zJ-6t
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 02:12:28 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47171
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kBB98-0005M7-KE
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 02:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598508745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/rlhBOVazI3yJbEIvNcqi9aYG1HHyOm095VFtPDuwk=;
 b=M7eZSDLilwQO4FnzWnsQUyZXXhvB3g5XUARMZCH287HN2Hu6GIZSbQvGyiU2PMHSd6hZQs
 UAZJgXXgjvp6KrtimTSV3oQLaAFbOYwUjvqKdq+yzZ4vb4tvbyl3WWKeVzH9Pzs4UHNqRn
 yl6UoIuXfLMZUPMG6+m3VeT5tponm70=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549--htiM1rJPAykbuPXWYVBPA-1; Thu, 27 Aug 2020 02:12:23 -0400
X-MC-Unique: -htiM1rJPAykbuPXWYVBPA-1
Received: by mail-qv1-f72.google.com with SMTP id z10so3569616qvm.0
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 23:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3/rlhBOVazI3yJbEIvNcqi9aYG1HHyOm095VFtPDuwk=;
 b=gUa4HkNbjn+HO3pvWjlFi7DfA8y1hEvwTrRibRu9UJox0Gqtm1iyPDW4/D1qu7mlvi
 EF8IBk0M/ENwfTFHYW2ccpqxySyR2ZbLbWXshAtlhf/zaaujuxxyvmZZtWshd11XBUc1
 JGpVHhvqbb4eL+F3lUxtlkKamPbvaSFawhXP131/O5WqhlsasKIfzPv+a0ezjwUQIWWu
 dkPjal80xuxoBOzfjUTO9oJVG0KkC5TGtgf77qbnDgjk8VcyxDFpwkG/J2Z4kZlzd3Qf
 b+2oFAYidT2iH0bZYdZIpa3/iL5Dc3Tg4MBXLNVIYpXhwwkT4TK9kGSub/NeIVrp94nB
 yf+g==
X-Gm-Message-State: AOAM5306VqbDbk5uXq93uiJjz+pCEu49Ym9yU1CLdNnBDfcCjLsXiaqc
 EH0fZXslr9Uss92tPueao0q9tJyqadXzm/W3zvfw4XHAQBAAY24oKxewd+YPXQ8Njnhuqv/zetO
 UGC8FNlgVGpIXNdumgcYRTNsCuqh5
X-Received: by 2002:a37:3d4:: with SMTP id 203mr6952861qkd.497.1598508743249; 
 Wed, 26 Aug 2020 23:12:23 -0700 (PDT)
X-Received: by 2002:a37:3d4:: with SMTP id 203mr6952843qkd.497.1598508742982; 
 Wed, 26 Aug 2020 23:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
 <20200826143651.7915-3-eperezma@redhat.com> <20200826154215.GE8235@xz-x1>
In-Reply-To: <20200826154215.GE8235@xz-x1>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 27 Aug 2020 08:11:47 +0200
Message-ID: <CAJaqyWeRzV9k_PS0=1uuK5--5RZB6XcVf6ZmxG-R5cF+ydXgaw@mail.gmail.com>
Subject: Re: [RFC v6 02/13] memory: Add IOMMUTLBNotificationType to
 IOMMUTLBEntry
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:53:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZupET4teMBM+

On Wed, Aug 26, 2020 at 5:42 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Aug 26, 2020 at 04:36:40PM +0200, Eugenio P=C3=A9rez wrote:
> > This way we can tell between MAPs and UNMAP, and potentially avoid to
> > send them to a notifier that does not require them.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/exec/memory.h | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 22c5f564d1..f6d91c54aa 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -59,6 +59,12 @@ struct ReservedRegion {
> >
> >  typedef struct IOMMUTLBEntry IOMMUTLBEntry;
> >
> > +typedef enum {
> > +    IOMMU_IOTLB_NONE  =3D 0,
> > +    IOMMU_IOTLB_UNMAP =3D 1,
> > +    IOMMU_IOTLB_MAP   =3D 2,
> > +} IOMMUTLBNotificationType;
>
> Can we directly use IOMMUNotifierFlag as the type rather than introducing=
 a
> similar enumeration?  Thanks,
>

Right, I think it's simpler your way.

Thanks!

> --
> Peter Xu
>

