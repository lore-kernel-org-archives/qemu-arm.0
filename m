Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp653316lfy;
        Wed, 19 Aug 2020 10:54:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIzIlbfWhfHQAfeEsywkFMFjc5H3XP2DDSzaoqd6/U4602AKzBQ+mqtx1+rsft6CVbOmFd
X-Received: by 2002:a25:5c3:: with SMTP id 186mr39564082ybf.271.1597859655138;
        Wed, 19 Aug 2020 10:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597859655; cv=none;
        d=google.com; s=arc-20160816;
        b=Kuy3vZrZVTEYn5cryHgL9qRGaA0gbKthwWk+cwzGI6+EoiZgWLfZmxmUJSPsGmtVC6
         O6r7KW5jcyMzUjRR54c8jMbRwIKVNNbH/MTHXRLRcCmvW5FRIGJaLg5bpKVO6eLmtNYM
         PuEiLDzfSaiU2YgwvVkbDZxDzHD3INDazaIqItu9gojPPUsMWGeeKgQ3A2ad6i+SW2G6
         NTQXDCwIDnk6CcALWSv9z7lYn5CrMEQRL48jcKqd0SeRLml8OC1W0fPdLVUG7E39USR4
         LungpRoh8I5GLrtSHxw3NKTIEcEdY2LS8Fh4dv+oP+Y2RMrluVBWf7edvb3JdLMxoI5j
         5qrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3IN7qKQY0CuWK/Sl2ONNUWcdZTo9bruxn5iAEAKvGCs=;
        b=r7iWw2E3yixwGvlnwtxWyz1sog8hV2Fh90RXjicHPUol4DLgc2vQUR4Mrs8EZyVvoe
         q/l5LWRVXQM4KXPtNOK7lhDYdjga7sQOGfcUzlKUoO1Qds8i+jtkktUjLIx7P8vrv5Mk
         js9fZ3T+iB3FKWhZ9EUgr629n6vzz871v+BSAoXGUZ0xFgeiuAQgNr7ZKa4ekcx7zdp+
         uEd0yBLXfSFsfGSfplN9+foHG0ccDmDVqelJcxhdZKC1OctP6a6FWqFAdnZlXc6olaF4
         d8AAYfsyyk5uL75NUxgcA9bnoIF9f3NMMIdqOmQdoRm3hz1no5sFoSAMh8fISOQDvfNu
         LcWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZO443VOy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l76si26157000ybl.283.2020.08.19.10.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 10:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZO443VOy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8SHu-0006m2-Bg
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 13:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1k8SHj-0006im-Bn
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 13:54:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35868
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1k8SHe-0005ac-2y
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 13:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597859637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IN7qKQY0CuWK/Sl2ONNUWcdZTo9bruxn5iAEAKvGCs=;
 b=ZO443VOyRQ+SrUVx9g78a3/zqnJwkWhdi3DVb4ZGr+KRKopWLRK+X/tpdrShpkyA8fuLMn
 3Znr0vyDBKoB8KpRSaffogZqcRZzHFkaDaZdzqW2ejLp/ZqGvZeW+FpMB+kkmjIubn7OwL
 Eyq6VpU0pXndS3S3gf8wa7dwCp+qNA8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-mMp-Q-mjOCqDOLJD5xZgWw-1; Wed, 19 Aug 2020 13:53:53 -0400
X-MC-Unique: mMp-Q-mjOCqDOLJD5xZgWw-1
Received: by mail-qv1-f70.google.com with SMTP id l18so16102096qvq.16
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2020 10:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3IN7qKQY0CuWK/Sl2ONNUWcdZTo9bruxn5iAEAKvGCs=;
 b=j17My4VqyLfv0qXZhM/6qbX1i+H1SCw4sgTwZX5SLJNZNJQhagAGX7mN/zyoX+gPos
 3bJQfEB9qSf4hFOwiXhK3e3kAK7ZHX0KQ05pkX1hqkz8+tP1hkOG63e+DpaidOY79nI+
 AMtkz8IqcWHAKi3cGcp8t5HGvBCmCJVLlxn18SWytMOfWJ6Ti6W2Xwqj1L1UkS2puNER
 232bWOn2pHUSnF0CxPJCrk/Xm8zpWJjXX2rZmGSWAI0Mttux0ajWUeXoTm1ebDz80XyG
 gSg/EPTe/Y0X+2Kplt6lXhnhwjRT9Uo2aOOFsTpzqFwOEntzhp7MC1s90moLsnR1az1D
 Nnsg==
X-Gm-Message-State: AOAM533Ahx+aNfzs69IUQewZVW8CNkagtsk/eqCzIoOOMpq9kdqfY3pM
 xfkaMzVZlWgZXoPHpOlwMmEa1I0dRX4oOleknBJcdK1E2Rat2LZ8qiPsAkalT3rStJDYwlPeL+0
 TxEV+Oj2A5otjvgB9Zsyr1LpNzpYA
X-Received: by 2002:ac8:4f4b:: with SMTP id i11mr22884995qtw.379.1597859633237; 
 Wed, 19 Aug 2020 10:53:53 -0700 (PDT)
X-Received: by 2002:ac8:4f4b:: with SMTP id i11mr22884978qtw.379.1597859633038; 
 Wed, 19 Aug 2020 10:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200818130151.31678-1-eperezma@redhat.com>
 <20200818130151.31678-3-eperezma@redhat.com>
 <20200819164002.GB305409@xz-x1>
 <CAJaqyWfazchLdyeRrr6yn9SMyY7tkYoEwadQ=u2DUq39tjv07w@mail.gmail.com>
In-Reply-To: <CAJaqyWfazchLdyeRrr6yn9SMyY7tkYoEwadQ=u2DUq39tjv07w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 19 Aug 2020 19:53:16 +0200
Message-ID: <CAJaqyWcaCT2=kRbog-b620s-kTvnRWFgeynGdC+HVmRBjekzqg@mail.gmail.com>
Subject: Re: [RFC v4 2/2] memory: Skip bad range assertion if notifier is
 DEVIOTLB type
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 04:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tKsBZRHK+YhQ

On Wed, Aug 19, 2020 at 7:47 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Aug 19, 2020 at 6:40 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Tue, Aug 18, 2020 at 03:01:51PM +0200, Eugenio P=C3=A9rez wrote:
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >
> > The changes on the callers of memory_region_notify_one_iommu() seems to=
 be
> > still missing (and, to embed the type into the notification process)..
> >
>
> Hi Peter.
>
> I thought that these were left for a future patch series (the main

s/that these were left/that we were going to left them/

> motivation was to avoid for guest code to hit the assertion).
>
> Do you want me to put them in this series?
>
> Thanks!
>
> > --
> > Peter Xu
> >

