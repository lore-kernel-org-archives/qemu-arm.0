Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3120212lfc;
        Wed, 13 Oct 2021 09:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH0/TyhCTRyv03qLZpILrlWcQRiWoBwB4fSkFjFsmPfGsy09bfiAwtGwaGTZEhdsQOL9Z1
X-Received: by 2002:a05:6214:136b:: with SMTP id c11mr37516997qvw.42.1634143165657;
        Wed, 13 Oct 2021 09:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634143165; cv=none;
        d=google.com; s=arc-20160816;
        b=HWIz//Yl6FlTllHTFFsky/Y4dCYZEImPoDj9e98Q+C9urTlCrtqVmZ1h+dU2D6uMBB
         MUZCMmxv7Ly1Vy9J/6cvdpeUQ9pxNo2qsvCegXShuASH49g6XfsQWMlcRgtl31iLbp4L
         jRYISGQODo6B3ot8PR4LygNTDNlVPqX8kzkuYVk41zMwoYZjbhZngR7kzZnNnArU9Bvj
         2wrKvlhcg0p3F1E5x4eECsnHvkS7jxbpXM3SDQDHGRnbrpdutAPMTnoawxN7wLrVcZSj
         6s4kkn0BE7Yntc8SzNlG17ia+QYgOfkxbLqtzqpxcmnjHwGPnyyCN67HRvjI+lp34Vn8
         MGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:to:from
         :dkim-signature;
        bh=VcHrSfr5LRENFfKGteVE+j/a+km/h1LvDFEOtMfmCIk=;
        b=rFAcKStoNEp/zHNbfWzXGzTtljzQB0Jpt63ef2XtlEAPJd4BVt3sxTLNU6qj7FmG1A
         9UMLnp66LBIuAOXDCDmh2qOMT+oRxX3AdDiHdaU6lAynDyj1drlX5K1k9ZlCFyfFpoRt
         Xi7dLVXGx/ZicVGSBI7EbEC2chhHZNu3P6MReC9GR+NCgJkytVO7b85EiOQMDksMyyHz
         A5fYoKW4PheIoIKT3Eb3KRnN8aHsXEJUQ/7N+Pu6SmUpBbGx4JA23pQIetUyzklGJFHR
         fVQey42ybZ0O3xBjYq5Gpi/IUffkrml+DpNoToRtczfsYRLIt1/qj2puPIvb0VK8yepy
         WcLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Al4si0lS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20si86641qtj.302.2021.10.13.09.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 09:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Al4si0lS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mahHn-00044L-Jk
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 12:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mahHc-00043w-T2
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 12:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mahHb-0006Rg-EI
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 12:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634143150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VcHrSfr5LRENFfKGteVE+j/a+km/h1LvDFEOtMfmCIk=;
 b=Al4si0lSubJhKpREPj0+26WT5H0wEZf1RPwSatS4IGd/jqYV2GlJN5v4r+5CuviHrQsjo4
 3d8ZjIf3LE/Ss0Z+qnVy+XT4X1v9A1Jia8SeWsWTqqh9nWIt+Sd1Tw5CCQPdnjSsXqU6yr
 b9wFY0wEcAUchv8K02cjhqeWkTOx9iU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-7gw_2JNqMiWUj0pvYTwaFw-1; Wed, 13 Oct 2021 12:39:09 -0400
X-MC-Unique: 7gw_2JNqMiWUj0pvYTwaFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 558881926DA0;
 Wed, 13 Oct 2021 16:39:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE57F57CAA;
 Wed, 13 Oct 2021 16:39:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 mst@redhat.com, peter.maydell@linaro.org
Subject: Re: [PATCH v2 1/2] virtio-iommu: Remove the non transitional name
In-Reply-To: <20211013152827.764566-2-eric.auger@redhat.com>
Organization: Red Hat GmbH
References: <20211013152827.764566-1-eric.auger@redhat.com>
 <20211013152827.764566-2-eric.auger@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 13 Oct 2021 18:39:06 +0200
Message-ID: <87wnmgvpzp.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BWMPaNyxHAEW

On Wed, Oct 13 2021, Eric Auger <eric.auger@redhat.com> wrote:

> Remove the non transitional name for virtio iommu. Like other
> devices introduced after 1.0 spec, the virtio-iommu does
> not need it.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Andrea Bolognani <abologna@redhat.com>
> ---
>  hw/virtio/virtio-iommu-pci.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

