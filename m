Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5245308lfb;
        Wed, 9 Dec 2020 11:43:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5ryGcMSRWHiLH8mVE6kf5dlPHKGLR/xc+aVrZFrXfwcoYe8x6OKsh/W6ZsO7tmRYRIL+Z
X-Received: by 2002:a25:2d5f:: with SMTP id s31mr5942950ybe.90.1607543014138;
        Wed, 09 Dec 2020 11:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607543014; cv=none;
        d=google.com; s=arc-20160816;
        b=LMqgi9SOxeQ4pb2QXIjg3rmKvKinjhic0ZHqtQnKLWJ07j/I0U+kTmqhv1mx+7fv+l
         4NXvea2ng1jBve5JzlbmOtcOKjHSLjlAb8SvV46mCpBTA2Mh9MQx32s78aN3vlU5j88S
         mqdmBF4Mk9Ohzzv6Vbo34sP+xZWY9exKqNCymyMjaM6TqGW7qCDuGF6FKdt3EDQ1AVNE
         MMTBSFwBic0XhscRSGUEeTbHdRO6RVvlxU9aOtXmVUtsda/Q6z4e8yGaZHYksX54XVWY
         THqlhTZ6UHH9Ggi/JH6bZAkTYmh+ZrCgvzzN3hsjQ5WgeMBrCSUKxwY3M6uUav1rW/9h
         a9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=g+1Q8auRqEosiI+y9hZxOmmaj+CXcQnPb06PCi+j7WA=;
        b=TytRbx07dRMHQWfO2YT/fFEvaxCczSnYLSPHePCgF2IuIEg0Ek+F1NvZxntSvhPsfj
         9YbQI2ioxMKALAfhPWNDs6UrD45dj9uoa9IZdGxcabNXvyNdW9RJWxZ1bDD4pBCsAotq
         ILmaAtx1pm6M4s7nxQ85jQAHmsxTOxHmJjXIM+mSIxnohbiQlPP6udEHTtMBy7G8vs9e
         nr6DNpNEkGBeUsAOXhemWMQ0doegDl2+wAbWCHNdAQ01RdMNPGOcU5NiymqYD3blTow5
         +T/Grmh/0YtGEfZFk2f+/qNZsmKrK9ZkbvDNp/6c6UkfrzMNNqSsbu8MZ/EKhZ+d2Hq4
         MHjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y5e2c6NE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e134si2534558ybb.5.2020.12.09.11.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 11:43:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y5e2c6NE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kn5N7-0002Vb-IG
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 14:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kn4Ib-0000z2-Sz
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 13:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kn4IX-00083L-RM
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 13:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607538885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+1Q8auRqEosiI+y9hZxOmmaj+CXcQnPb06PCi+j7WA=;
 b=Y5e2c6NE66ffwS4RFLiyKetoQuq6mpokXJmGBseGTJqyxSiZed+h+ewFDC9YetbtwwWIx5
 m2NScXYuw6O2Rj22o+TCqFgjVJmXKomV06NByQRz6OnyDLHhqy9E9DfJ7esk/MacsCnHMa
 Mmyt/MQi8CAC33Xj8Tf/SjiKkvNbJqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-DrwJQ9wOM1mqPAUf4T49gQ-1; Wed, 09 Dec 2020 13:34:41 -0500
X-MC-Unique: DrwJQ9wOM1mqPAUf4T49gQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 750E71005504;
 Wed,  9 Dec 2020 18:34:39 +0000 (UTC)
Received: from omen.home (ovpn-112-10.phx2.redhat.com [10.3.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 658B310016F5;
 Wed,  9 Dec 2020 18:34:32 +0000 (UTC)
Date: Wed, 9 Dec 2020 11:34:31 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH v2 1/3] vfio: Move the saving of the config space to
 the right place in VFIO migration
Message-ID: <20201209113431.5b252e93@omen.home>
In-Reply-To: <20201209132947.3177f130.cohuck@redhat.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-2-lushenming@huawei.com>
 <20201209132947.3177f130.cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Shenming Lu <lushenming@huawei.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mn4weAGReSsD

On Wed, 9 Dec 2020 13:29:47 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 9 Dec 2020 16:09:17 +0800
> Shenming Lu <lushenming@huawei.com> wrote:
> 
> > On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
> > setup, if the restoring of the VFIO PCI device config space is
> > before the VGIC, an error might occur in the kernel.
> > 
> > So we move the saving of the config space to the non-iterable
> > process, so that it will be called after the VGIC according to
> > their priorities.
> > 
> > As for the possible dependence of the device specific migration
> > data on it's config space, we can let the vendor driver to
> > include any config info it needs in its own data stream.
> > (Should we note this in the header file linux-headers/linux/vfio.h?)  
> 
> Given that the header is our primary source about how this interface
> should act, we need to properly document expectations about what will
> be saved/restored when there (well, in the source file in the kernel.)
> That goes in both directions: what a userspace must implement, and what
> a vendor driver can rely on.
> 
> [Related, but not a todo for you: I think we're still missing proper
> documentation of the whole migration feature.]

Yes, we never saw anything past v1 of the documentation patch.  Thanks,

Alex


> > Signed-off-by: Shenming Lu <lushenming@huawei.com>
> > ---
> >  hw/vfio/migration.c | 25 +++++++++++++++----------
> >  1 file changed, 15 insertions(+), 10 deletions(-)  

