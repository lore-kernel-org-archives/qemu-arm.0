Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp650336lfy;
        Wed, 19 Aug 2020 10:48:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm7LbvK7M9EE95syezd7manhK80fOP4shXPG4RRG22o/6e/u0pcz6DQGxXpkc5HB43Pf9N
X-Received: by 2002:a25:d30e:: with SMTP id e14mr33940673ybf.240.1597859338194;
        Wed, 19 Aug 2020 10:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597859338; cv=none;
        d=google.com; s=arc-20160816;
        b=CErwI/HvmSh8LthRcEKv53f4XWoFa1BUXTe7vIAdYFBowUHZAujPLZ+yrUBkN1XtiM
         pKX8Cay3z/fumt19FnGh6m4bXfNFpwhoJ3ZorGmPL1kfJdhmyWcHECLxNYGPfs0n/D1K
         obhDL0RFgWgcRfsErdJnszKwhvKKdPtpTi4JqHAkp3HNiakzb+5/jd7/NhnE/ULPuskQ
         L6nBLv3PCy2uiHwIgGHKi22vPq4dx3+Ru+xRls0nBf+iZ3OXQPubOnrX/0rGWrYA81S0
         w+pURLbnqRNl/9TkJKtHKBGnIf9b4SAIwuxmErrtc53IvmYuXsUQLEfSx0Ms4FMkNCP0
         y1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1OZXFOiDjw+JHaqVX6N/6LELh9CVQakEMh8KFZTxEKw=;
        b=vUsU5AWu6TPzggW7Lz9uVHO7+4/14mi2v2EPoPILV0cJNK9upTQGR7Cgo39N2PSl/M
         jSOdHrYpX3I6N0Aoj1Q5JkkJJxfcKBg5wZWWP0HuCAYhEcL9sKJtDL02O8qL1kB0kM4K
         0+1bD9iRRslmg8zQrKAxCE02DwpGCU3N9JdUoiHrJMfquILEtqp1ZClnjv1NLISQpE4V
         S58veObQ/giLwomAAw/gkHJ6KviNKQVRkeLktXlJfT5u1oVfr2417XPMxlVHmlQGLD33
         cVCsGzhd+rSe+BCR4J8jwixMtdgwoZQD8nC8hHynxGaeJchfDn75DUD3IsSrOj+ndvvd
         gOuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZyChHuUb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e23si25697146ybh.324.2020.08.19.10.48.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 10:48:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZyChHuUb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8SCn-0003ik-Jk
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 13:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1k8SC7-0003Ht-5k
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 13:48:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46435
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1k8SC4-0004sT-Vp
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 13:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597859291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1OZXFOiDjw+JHaqVX6N/6LELh9CVQakEMh8KFZTxEKw=;
 b=ZyChHuUbVZLr/Pq6t6Wz039ZoWnxHje+RWGbnAjEeBlk/JhDbH3QrpogOQB98B3Hum3DEQ
 vmd01hcLqNBYE6COE0bLR8/CrzSvcUuFN1lU425vs0GuIU2Unpv0dVRAZHfC12MXm2G4xH
 xUnT8trNfxJj2VidSTiXZRHQNG+yZAQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-0YykRc7EMQaySh3VgnBGow-1; Wed, 19 Aug 2020 13:48:09 -0400
X-MC-Unique: 0YykRc7EMQaySh3VgnBGow-1
Received: by mail-qt1-f198.google.com with SMTP id e11so7698078qth.21
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 10:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1OZXFOiDjw+JHaqVX6N/6LELh9CVQakEMh8KFZTxEKw=;
 b=LZvE0FTAFE2YDl4vfaE7lSqFHqpwHxAqM5HKJMbZIAey/fB0xRJMjlAUJ0XMzBVRrM
 ftLDPP9B87Sz8AuhARwI/ds08p4F0yY+P8Ukw6ozQBVTBcoaRojDIv2P8riGRRETbvlD
 +4ie45xZEI7h/0B0QMEPEICty7NsR/D2GQQkwXVvYutuCtqQpdCs9qpdpQHxnvPjRJj+
 i46lDHcGbu1S0E/bjhb6M96C2bpEJ///E9gvCXbP1c/Z48WhZ0KQ8h0OxXseaWd6O5nm
 XV7s3VS/KfCd9hb+3JJ6aOTJZ+Og5JinDiKFCQV4CYU/AJ7jjBwRopH6r8qKjq1US+HP
 4Ugw==
X-Gm-Message-State: AOAM533ILDAh/hihP74ek3bia1SsgLemcQ7pgUGt6U27UZ4/L/xsCj4m
 2bSk0VL3C15reU0YyeIVrcXSn8mcJAeZoNK4aAugyiDCRQt2IiYX0iCUPyN83JbZfIsV9HPbRZ5
 WJwv5UJOaUwl6CxoXMatkWUsBCqlJP4M=
X-Received: by 2002:ac8:6952:: with SMTP id n18mr23127263qtr.27.1597859289108; 
 Wed, 19 Aug 2020 10:48:09 -0700 (PDT)
X-Received: by 2002:ac8:6952:: with SMTP id n18mr23127238qtr.27.1597859288848; 
 Wed, 19 Aug 2020 10:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200818130151.31678-1-eperezma@redhat.com>
 <20200818130151.31678-3-eperezma@redhat.com>
 <20200819164002.GB305409@xz-x1>
In-Reply-To: <20200819164002.GB305409@xz-x1>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 19 Aug 2020 19:47:32 +0200
Message-ID: <CAJaqyWfazchLdyeRrr6yn9SMyY7tkYoEwadQ=u2DUq39tjv07w@mail.gmail.com>
Subject: Re: [RFC v4 2/2] memory: Skip bad range assertion if notifier is
 DEVIOTLB type
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 23:05:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V49zaf6aWUR+

On Wed, Aug 19, 2020 at 6:40 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Aug 18, 2020 at 03:01:51PM +0200, Eugenio P=C3=A9rez wrote:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> The changes on the callers of memory_region_notify_one_iommu() seems to b=
e
> still missing (and, to embed the type into the notification process)..
>

Hi Peter.

I thought that these were left for a future patch series (the main
motivation was to avoid for guest code to hit the assertion).

Do you want me to put them in this series?

Thanks!

> --
> Peter Xu
>

