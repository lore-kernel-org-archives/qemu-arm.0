Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp674368lfy;
        Wed, 19 Aug 2020 11:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCq5xN/R82nJAOhKrn3gxzoiOBAbtwfspTiZG0Sbq7R3r0wUVTSaBKAbTYjF1SC0Wam04J
X-Received: by 2002:a25:14c4:: with SMTP id 187mr37953380ybu.449.1597861532670;
        Wed, 19 Aug 2020 11:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597861532; cv=none;
        d=google.com; s=arc-20160816;
        b=J+7QXtGJqtYopzpIFfyfPag01hPT5Urvqlvy2iqkZkkR58fdlycv+/Dd3GfNOFZh8N
         NVT/TAgqrLVwFnY2/G2wIf1SPp7LGs4aRXasA6bXw7YeYiskEm0XQnA8lxd64ZSDEN0F
         iLLsqotDmFUNzkepiM/WCRggeJ1KUIiMZXCw7sDiw5S5/8dgBE7PN5PhVEZHRo8P6bUL
         M51EOdhLcUdLS8Mg+FccP5GS61hLN1gdQh9vc9oGg5qOFOwjzCvYjdkAs+cibXvWe4aZ
         gUaKCz27+/kcZWUvDy0xITNq1eDwMxgv3H8KV0ZaX8HtLk6nmLesmXbNDm0+1sx2N/Ws
         YHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=EZ/NSxXuc4gQW24jpW8g+EYTk+8ei1XVvr+N+eiAlEw=;
        b=sZZBz2aSqergHxdIwVi+X3DJ5NTPqTTQwaE98xOsKVp2YRQMjc2RlquRGIhiSN6+IV
         hb1wQkEcE4P7lrECWESmetulx8QdR3C1acyY2kfaJzQW2kyOYpvgltJ6e8ts9jHQdoiP
         dYeYC1hSI0MYx/mdftGVihjmNqIk9fuQ/XKXXWUbnncfdcOg1zULgZ/cmGJLts2moXiX
         B/ltcRJVVTyF5XAt4JIUpYCtagh5QV28Yosn2pVxSMsdHVqvwPlmzctq/ZeQQmkCcDtQ
         hg+JFXMgF0L0uYP7DseEx49wHKfv0jjASi9T4V+UGx17Ka7pQXp+eSL/9+T+SYvPz1tB
         q+zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c9Krctqy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si25177092ybq.419.2020.08.19.11.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 11:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c9Krctqy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8SmC-0001K4-1t
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 14:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1k8Sm4-0001J5-CT
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 14:25:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51124
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1k8Sm0-0001OW-2r
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 14:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597861519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZ/NSxXuc4gQW24jpW8g+EYTk+8ei1XVvr+N+eiAlEw=;
 b=c9KrctqyVoPcIkNaEfW8IxsazD7rCnBx45g2ptObcbQ1DwRAhpOsu5/8rqyNsY4SSgrqSb
 fUV01JUf5AQi0NKjZ6dI2CD2EHUNmHQznv2ebqB6axpNt9g1jWs6suRk7W+NS4sF08D7x7
 nqNM81ZY7TKzOt47Gk0kTq/tD1pDRH4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-XE-Jz5klNOGNMfCm1QJkWA-1; Wed, 19 Aug 2020 14:25:17 -0400
X-MC-Unique: XE-Jz5klNOGNMfCm1QJkWA-1
Received: by mail-qv1-f69.google.com with SMTP id c4so16216266qvq.15
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2020 11:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EZ/NSxXuc4gQW24jpW8g+EYTk+8ei1XVvr+N+eiAlEw=;
 b=t/N2UJd3Crhb8Gp5YeTrdN9CkWM9vDVBuaF1VPoApkbi5YTIlNx9PUh/U92RQEyt5i
 pJR38QwNYkT7eNmoO/m1t+PCEj471FKVkfkPkBQmb2dhmTpuDTf1nbsFQZyFKcNEHzBF
 Nx6c5q+3v7Ri6C82tzUXlZBCdxHmvSbHRQV1LS+ZlAeF1jIEmkrgQhdRvgCboSXZFP7D
 xdcn4XsRmz33RXdBppEg1s4UoaMbFiER7iRPENgph/LmZg4s0L4RARmF/smborCvxDUM
 75V8g9Ffx9otmnY1K5BJ49t05YEvN+H8bsMMeVnCy4b9t7R00yjHZW5B3BL8A+g3oib+
 PZ9g==
X-Gm-Message-State: AOAM530soy7OXzMsziqKhjfTJ+CCKBdz1QkPomtU7jmwIQGaOgsFY7ce
 2qbkw1dsg7nJI2N3ghaYoO0UrIo2WW8uzLpGVt4LtRQINIhEWoftaVMG45JfZDC4Q4I9rbWA1kh
 e2doLgnPq4zOp
X-Received: by 2002:a37:6351:: with SMTP id x78mr22766050qkb.394.1597861517063; 
 Wed, 19 Aug 2020 11:25:17 -0700 (PDT)
X-Received: by 2002:a37:6351:: with SMTP id x78mr22766018qkb.394.1597861516769; 
 Wed, 19 Aug 2020 11:25:16 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id o15sm24870610qkk.95.2020.08.19.11.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:25:15 -0700 (PDT)
Date: Wed, 19 Aug 2020 14:25:13 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC v4 2/2] memory: Skip bad range assertion if notifier is
 DEVIOTLB type
Message-ID: <20200819182513.GD305409@xz-x1>
References: <20200818130151.31678-1-eperezma@redhat.com>
 <20200818130151.31678-3-eperezma@redhat.com>
 <20200819164002.GB305409@xz-x1>
 <CAJaqyWfazchLdyeRrr6yn9SMyY7tkYoEwadQ=u2DUq39tjv07w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfazchLdyeRrr6yn9SMyY7tkYoEwadQ=u2DUq39tjv07w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 04:57:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: nYjuwnWk0xpr

On Wed, Aug 19, 2020 at 07:47:32PM +0200, Eugenio Perez Martin wrote:
> On Wed, Aug 19, 2020 at 6:40 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Tue, Aug 18, 2020 at 03:01:51PM +0200, Eugenio Pérez wrote:
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> >
> > The changes on the callers of memory_region_notify_one_iommu() seems to be
> > still missing (and, to embed the type into the notification process)..
> >
> 
> Hi Peter.
> 
> I thought that these were left for a future patch series (the main
> motivation was to avoid for guest code to hit the assertion).
> 
> Do you want me to put them in this series?

Imho it would be good to do that altogether.

For example, you have defined:

   /* Notify changes on device IOTLB entries */
   IOMMU_NOTIFIER_DEVIOTLB = 0x04,

The comment says we'll only notify on device iotlbs, however with the code
change we'll still notify even with normal iotlb invalidations (but always with
the type IOMMU_NOTIFIER_DEVIOTLB ).  IOW vhost with ats=on will still receive
two invalidations for the same range just like before.

-- 
Peter Xu

