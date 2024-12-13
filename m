Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp380546njb;
        Fri, 13 Dec 2024 04:01:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUgzRMZGniBzKvrFf0Fp0zjmx8mzPyds6P8nvW5m4Ewe6Z1qz7efXGH3leno4XYlk1CUQG9ma2uwfipLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE4AaLBKXqWOQ+yImvlCkt731Du1F4H7ItsJqvOIFPSkMjra2wM6x/pnfJG/Or+OtcOCee6
X-Received: by 2002:a05:6122:1787:b0:517:4fca:86e2 with SMTP id 71dfb90a1353d-518ca479a04mr1684788e0c.10.1734091273688;
        Fri, 13 Dec 2024 04:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734091273; cv=none;
        d=google.com; s=arc-20240605;
        b=W5nDzaH9NV3h075fY/UEm8duPjJZDDQ1mM9/2SYrvNPDRLFoOtf7VdeQwWdviUcGZQ
         RVrByhLcl2Onfj2ad6XeSUaNZDeR+aewi6O4L8k7ie5JcZB8URYQ8BvtbAfC3n41Ep3b
         6JhFk6f4GqTucRll9myjGlHHX54pzGa2M/yUPxqN6NO9U0ibuA7QGxhZvMD4VEypxmeJ
         GCrT8igwU8lp64iQclgCOcdcEx0UPcHi+x43bH+yUKV4wf6J5o4pfzDlK/lEemQtgvN1
         Jo3ZENu59jePkWVSChbCZrGkccJ9JHIzcmhXQrODDY1h6WQIt5/iJfyqqWy5pvYjnDlG
         1EbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ziaOfOgJQn2EytbTbRQsRELo4r8ux1TxshcSdzES3h0=;
        fh=Zb2kcfsRNwOyZCFsdnJ9ji6Ko91sfAa5DXFIGHnC+qw=;
        b=YRhYauLhs74J8KvnptbRGou3LxpsuaXiF/n5AEc8UDou+DV6OSsed8v/XopdhrPfhm
         m0SgvuQ1lWwNGfAuojfNOioszuk6fZc1MNMhsF6vXlI7FfHs4NNUuz3vJZ1i+6jREFaL
         sb7w5OfgQzqoyfmQ7ReN8VA7cbBMVxV1WWb0bx4enEuCBOQnzE9DSfJ3LT9R56kgpdvR
         eUwudBp18HXNjuRqpua2FPXMpZkOJkHMU85oGdF1TUI1AL0eKmpA6BPcfFU49EnHAbqz
         gi6Y9ry+U4Fa3JF8tRoOD6fYMQ3QqCSqiwBtbuMrvhFqk98NF8tANI6f4rD8iFzWJxvY
         lU+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FivvTsrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5189018f9desi2278281e0c.196.2024.12.13.04.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 04:01:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FivvTsrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM4M1-0006ad-6u; Fri, 13 Dec 2024 07:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tM4Lz-0006aO-8D
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 07:01:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tM4Ls-0007rJ-3I
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 07:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734091259;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ziaOfOgJQn2EytbTbRQsRELo4r8ux1TxshcSdzES3h0=;
 b=FivvTsrUlfQjT2nyJG2sFV8OUh8eCkCIBKmi5TLFGSnZ8o2EcbRlUZ4RBY/KHqYV0md2qg
 NMulRB8zFc0n9AR+kSf7zqBed/ilcwvCPHZ2LiDz3FfNLlYLdPo2ieYQ+dDj7A2JujyFSe
 Mkk2/pBdv4gMvjy5/w/jcjC3NBhW2Gc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-322-UwYNHJMPMjy88mwEuJlx9w-1; Fri,
 13 Dec 2024 07:00:55 -0500
X-MC-Unique: UwYNHJMPMjy88mwEuJlx9w-1
X-Mimecast-MFC-AGG-ID: UwYNHJMPMjy88mwEuJlx9w
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1C0EC19560B3; Fri, 13 Dec 2024 12:00:53 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5BC6C30044C1; Fri, 13 Dec 2024 12:00:47 +0000 (UTC)
Date: Fri, 13 Dec 2024 12:00:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <Z1wh69_gZ9izr1iU@redhat.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tUUIMKB0rn1x

On Fri, Nov 08, 2024 at 12:52:37PM +0000, Shameer Kolothum via wrote:
> Hi,
> 
> This series adds initial support for a user-creatable "arm-smmuv3-nested"
> device to Qemu. At present the Qemu ARM SMMUv3 emulation is per machine
> and cannot support multiple SMMUv3s.
> 
> In order to support vfio-pci dev assignment with vSMMUv3, the physical
> SMMUv3 has to be configured in nested mode. Having a pluggable
> "arm-smmuv3-nested" device enables us to have multiple vSMMUv3 for Guests
> running on a host with multiple physical SMMUv3s. A few benefits of doing
> this are,

I'm not very familiar with arm, but from this description I'm not
really seeing how "nesting" is involved here. You're only talking
about the host and 1 L1 guest, no L2 guest.

Also what is the relation between the physical SMMUv3 and the guest
SMMUv3 that's referenced ? Is this in fact some form of host device
passthrough rather than nesting ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

