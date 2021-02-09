Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp746816lfc;
        Tue, 9 Feb 2021 14:23:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMkrpo/1tRTyNZ/Fp/Q8G+KEiki3oSm3nvg9iK4LlakE9j/NI4ruxXw0maq24qSdZTkAyI
X-Received: by 2002:a25:73c5:: with SMTP id o188mr42120ybc.261.1612909417325;
        Tue, 09 Feb 2021 14:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612909417; cv=none;
        d=google.com; s=arc-20160816;
        b=0tZy/xqKoJk3thHxqYtkh6bieD3Fnv+sN1qlofi3MkNihFWB+NFGQHtU6znYWgjGCf
         IAJe53FXHpd6DTsGIfQj2gojy7YhyA4Y+4EgatJYPGnTA92aZTCb+uBLLq9gn6RTq88u
         4ZI+fhmSrdz68poHqOQZ9LrBEZeGaNGHewd1bSrhIeiN9O04nzYdeT7B8cibjjtT6fwy
         Hmhs7ROHYQGkpUQJIMNQq6iJ0KlDN8s49RohARnID0nncFqc/S26oUKDWQMKM8OVnCpR
         qi8ghxBKQdSi3KLevxvdgunpBMgM4rvkoBlVj1hk7oQri739apAK9QJHrNPplaYzytiw
         wzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Mc3esFUFQuQWiikTAkL1BBNbvE8z/qpXn/484dqVg3s=;
        b=TVEyNVPYjDzvfTdsl033xuGhAD/b6woooksM9KL+Q13DWP+ZXRJrR3lDQWvIciAW0L
         T9s7lotOXoy/8D36r9VZd8oMoWDe9QOhtrhzJkUOBoUesza/QjDbYTiVnSUuWd0bOAJr
         BnXHLorglUqPMDk0+FMAHKm0pGt/a0dPuNt8CxeYSjAVXBYabgPZnp6VPlTwPeyjyK4U
         vRNZQfaex19fbv1ifzKJF6DrEKsKGSoZvJFTuv4y7h3NdAYBNbguuIhpI9tDFkiEdtnx
         aA0GpkwUtSU1k+Bb/Negs55Dp78Z7ZhKVrfN1DfSBaoGidSYm51WkqcGwnUlc7BZDjej
         uHAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hySkYGTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y126si76764ybe.486.2021.02.09.14.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Feb 2021 14:23:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hySkYGTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9bQ0-0006OC-OX
	for alex.bennee@linaro.org; Tue, 09 Feb 2021 17:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9bPs-0006Nq-7Q
 for qemu-arm@nongnu.org; Tue, 09 Feb 2021 17:23:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9bPp-0007cm-HN
 for qemu-arm@nongnu.org; Tue, 09 Feb 2021 17:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612909403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mc3esFUFQuQWiikTAkL1BBNbvE8z/qpXn/484dqVg3s=;
 b=hySkYGTaIXAzViAQcgA5jzI30u7d9W6lhmO5+5ofnBcMJWAXBb2RIpOM7weEJVULD7yOE+
 6W0DLodC9yWhjpSV5D4m0qyRBvLsGQXAG7wFkE4bGBjF7WrJdQmQeNeqRVshAU5kGKUrvO
 pSOH6j0QxlRPoFg59riCTNphcatcnIM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-Da6Rru3MOQmh8al2H1SSLw-1; Tue, 09 Feb 2021 17:23:22 -0500
X-MC-Unique: Da6Rru3MOQmh8al2H1SSLw-1
Received: by mail-qv1-f69.google.com with SMTP id p30so32916qva.13
 for <qemu-arm@nongnu.org>; Tue, 09 Feb 2021 14:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mc3esFUFQuQWiikTAkL1BBNbvE8z/qpXn/484dqVg3s=;
 b=Uavkv0Lwubcdm9kV7m2poL5OKq6gHvZ5U1x2TXU4Je8jx/4U4i3MGcWCkEB3o+TA4H
 QKVNkex4AOhr2XLK6+dJwFv02nBqKT4kF/efsQM44UcOPlU3lfy4IMzYNhUS3IJXQWsm
 nK6Ox2ZwYd0yWfDTHUqQ35hh8xmN31qelwCxTgysht/1Knt70NDI97wtKRQV3165iRPo
 /4raO2vdpfA+gaVFCUh51TL+u+c90zMro5EUy2ZNg4AFzSUhFRZF+PvV7Ip2HVbO1CJL
 lqNgstW13TJOZ4uHTDyAUjGP57oTJa3UvsFHMc6muwJtNpZscreMXwfOhO84BZMcXtH6
 FFpQ==
X-Gm-Message-State: AOAM531h8g9VKh5o1ZBjqEaXKH+SQD2Hx2x+M36uyTBCz+sfXdRnu1nG
 wT3+OoGihbSqxEfN/SbwFrR3XzVlYIr1EU5NBIlKawEV6y+vQltJ8902/rfMcSYH1DSpEkdEP3z
 YEiFyNbJSf8LV
X-Received: by 2002:ac8:1009:: with SMTP id z9mr179498qti.347.1612909401756;
 Tue, 09 Feb 2021 14:23:21 -0800 (PST)
X-Received: by 2002:ac8:1009:: with SMTP id z9mr179485qti.347.1612909401527;
 Tue, 09 Feb 2021 14:23:21 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id r17sm123708qta.78.2021.02.09.14.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 14:23:21 -0800 (PST)
Date: Tue, 9 Feb 2021 17:23:19 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/2] Additional vIOMMU fixes related to UNMAP notifiers
Message-ID: <20210209222319.GE103365@xz-x1>
References: <20210209213233.40985-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209213233.40985-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, groug@kaod.org, eperezma@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yt96sTodtI8s

On Tue, Feb 09, 2021 at 10:32:31PM +0100, Eric Auger wrote:
> 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb
> support") fixed part of the UNMAP related regressions introduced by
> b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> IOMMUTLBNotificationType").
> 
> However the case of the spapr_iommu was not addressed. It should be
> identical to the others. Also 958ec334bca3 introduced a regresion
> on the VIRTIO-IOMMU/VFIO integration.
> 
> spapr_iommu is not tested.

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks!

-- 
Peter Xu

