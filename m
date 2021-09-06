Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3858817lfb;
        Mon, 6 Sep 2021 07:46:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJUyH4n+o5mTsWn4KD3pfUYBtyvc46/+I11xZ/KhZHcWODiiTI0RBn4y+lpBW5Gncq6QGf
X-Received: by 2002:ab0:1e45:: with SMTP id n5mr5830635uak.133.1630939582831;
        Mon, 06 Sep 2021 07:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630939582; cv=none;
        d=google.com; s=arc-20160816;
        b=a4hxPeLqEk8yKg/rWvi+MguRa4ktfUGnb5A8zD8kEuxkS+eolo9heaOeXWmuO4Hgzk
         V4Z5mMWz0YpWUDZMuacM+MoR677Fx1w42pjTrzR+YqREajzDk/3SoBnNGO6mc85brVNj
         hj6N1QnwlTGmLH3gZpQyENXmoB905+AosbYOu4JMEegFlOXiMsxrP4ock3ZIPJyhxGs1
         pXD9NL40qBpqRclq/JunaY8Jbwv2zpUR9SKxR3wDqsdgVhMM/tQIUdDkUHFbqCOONGoS
         Q4D0Mb9ZUBceMHbInt8gpY3pKpPP4qCNx+smOEEJdVBWzCT/GLwJnevGOAsqqzvQOB+x
         8gBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=mePZOaYTWzlh9+Cfqj8hXBgWrB7QYB/bNZfqwtP/04c=;
        b=M8yWcMkuCHQ6wN4UmkgJPC7AAjcmNsW2tdyCSiR6+wjTUlx4SlZ6FBp/4VxKT3NN6l
         AvxhfvCkDIEWzZnThahuGig/DqeiJUUvr0DQbJpsVW07hFNIux1Kd78fYcj6m/O4CD1T
         JOBMPN+pWw9H9uHus1Qbsu8tHNBgUTZbmFfyYFfi1/Scpd3Y49iLPC2yo3u8o0uEQzbM
         dKh/Yg39n7inePTlAuw624wLx7+rjSs/MuOYY+C96OdIOoYko5gj6WubrYEVEvPbuXQE
         uin+yQeAd/pV1fJWfAbbhni5krMoxjZpgyqnTB+5snQ7LWBgCXTeo7bMZ0zVSYZaP43o
         a1NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wbzyfw83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si2056481uam.94.2021.09.06.07.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 07:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wbzyfw83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNFt8-0000Km-4Q
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 10:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNFsi-0000Jz-BL
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 10:45:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNFsg-0004RO-D4
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 10:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630939553;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mePZOaYTWzlh9+Cfqj8hXBgWrB7QYB/bNZfqwtP/04c=;
 b=Wbzyfw8340oTmMqC4A9uodoDoTtZLInGxNZ6o8cWcQSIGANugnqCOfTUvRngnQlPcOd4KC
 TrSJPdcLicdJsEMeknuE7RFf7lrm5PpHn4u/7j53/SHFiCNbtlDB80roHdmjz08WtHUrDQ
 V2/KKdPn6KZ0roQ4Q3ZTbJreEhTI12E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-44bcGhoLNJuvWDMqbew6Kw-1; Mon, 06 Sep 2021 10:45:40 -0400
X-MC-Unique: 44bcGhoLNJuvWDMqbew6Kw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10316195D561;
 Mon,  6 Sep 2021 14:45:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 246B55C23A;
 Mon,  6 Sep 2021 14:45:30 +0000 (UTC)
Date: Mon, 6 Sep 2021 15:45:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 8/8] docs: Add '-device virtio-iommu' entry
Message-ID: <YTYpiPYaRJHmCmsK@redhat.com>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-9-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-9-jean-philippe@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MFrXKJvxvynl

On Fri, Sep 03, 2021 at 04:32:09PM +0200, Jean-Philippe Brucker wrote:
> Document the virtio-iommu device for qemu-system-x86_64. In particular
> note the lack of interrupt remapping, which may be an important
> limitation on x86.
> 
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  qemu-options.hx | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 83aa59a920..9a1906a748 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -976,6 +976,9 @@ SRST
>      Please also refer to the wiki page for general scenarios of VT-d
>      emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
>  
> +``-device virtio-iommu``
> +    Enable a paravirtual IOMMU, that manages DMA isolation and remapping
> +    for all PCI devices, but does not support interrupt remapping.

It would be desirable to document why this is better/worse/equiv to
the intel-iommu device documented just before, so that people have a
better idea of which they should be trying to use.

I'm going to assume intel-iommu is more likely to "just work" out of
the box since it models real hardware that OS are likely to already
support ?  Is that right though ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

