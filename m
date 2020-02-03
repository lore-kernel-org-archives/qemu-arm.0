Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3978597lfp;
        Mon, 3 Feb 2020 05:55:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0eAsXBK0Sm4EEWazX9x2KGCeVuE8UqvA4xAkQcrn6j7GRdf+HQB/cFBSWiW9iphU2Jat+
X-Received: by 2002:ad4:4204:: with SMTP id k4mr23148603qvp.203.1580738121009;
        Mon, 03 Feb 2020 05:55:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580738121; cv=none;
        d=google.com; s=arc-20160816;
        b=MJ7CVFtGfEDn+lcodDJzwkd8VVBuIeLx6dddBi3zD7mSViyZZ62itMhSMsmHrXMtR2
         hoGnDtvWv/vnVRgr+/uIQ7AJTU3L5pzSHIebVNQAEqVL7/BkhGrQGWYMD0njQDjYAHHd
         5Qni8fRmWPptt0k/9nRCn9iWzdMFmP8f79jpL7GZukd/ficC7ImrTFAgFJ/5n+Mc9puN
         K8yBHoTrGbQzyZTCwRq/Nfi82AY2MYCrFPHtqKT4+xJEv/zoIn3yCD5AHS1Kbt8Akeki
         qDMaUCh9WjXjPCr6MOqjHZlFNxIZGgD6QKHj3/wbUj1LjVUbZr+Pbms5LexYgX+Elgvm
         j3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=qg93xFhEGkdmIT3K3LTNem1fl2cYCQhQan2pX+lCxMw=;
        b=tGJU+o+eTA6CuQw0Hn6z7DaNz4kQwZu1DHEK02WU4bQ14EPXbcNT000uisQ2gg08GP
         EjO6Wj9cV3qePZmMv+FE5q5m7NeGnuw5Krn5MAloBhGs65MA1nCbMnD1OkSvbXWScL+w
         szbPQh8mDsOs55/mLozG1JhRKCcK1nxedxr/PA3kl6fRPpe4ARiqM13/lzMLudOSdSDa
         20BVJ8bepal9kUEvoX5zFmA+rv0dzePmpb0pc3UE5TqRckkssOmNYbes4gzq/Baed2rV
         epfWJ/ormw/gAoAUO4lg4Nm/vyHOBhthHx4ceve57Xaa7816fZT/zD2o2nIcYasVJn1V
         h6hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UBwL8pi5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si11874070qtp.218.2020.02.03.05.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 05:55:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UBwL8pi5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iycC8-0006p9-ES
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 08:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55558)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iycBz-0006ln-Mr
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:55:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iycBy-00084W-KF
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:55:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27400
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iycBy-00084N-GM
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580738110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qg93xFhEGkdmIT3K3LTNem1fl2cYCQhQan2pX+lCxMw=;
 b=UBwL8pi5c5OVh0LtWMmJN2WLrWIBnnSZRb5a8gG6pn4KW8IV3g1Ja5KV0DTL8abQK8DSss
 zWH2PTpA1OG6SwVn78ttC/Ui0G4FtaDQpF5YLpIljaWkzgw1Ed6BgLxTh9w6iuZlR7V0pu
 tdtf9w0e1oPS94LZAF4VxYlalN8xKlM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-V1ZeBwASNsyF74Ttep1tYg-1; Mon, 03 Feb 2020 08:55:07 -0500
Received: by mail-qk1-f197.google.com with SMTP id v2so9497312qkf.4
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 05:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OX9/undf1GE3j16kXlHknGzXZFn72TP46ty60q477W0=;
 b=L4HmCed3tmg/S5T61sbA0pUukan0hDF6/mSjAhAs+bveq+GIb4SA4tCqBeTVYgoZ9l
 aoYnUBrBpsnkKVfGg9KyiqDLi2N6z645i1zUBhy4PlEaJHeqSgK4imPFY1btL6OhFncX
 RScSBr5kX4ZWrrlxYfZK44CgpE08atQvEimNpb4L533sAQUVFjYDaoPverMml0uD3sS7
 exM8eB2osqOFTZBbdHhuOc6d2XtJUjRv1c6C3jIN4pfKNkS6osCPMsHnn6QBJOHqZ+qs
 DA09UPSRzIKUFxVLi00MSoFAX3nhTHo8FfGBjlq6SUDQpSlLvBYywTmMeb3ANSFL/YJv
 bWMQ==
X-Gm-Message-State: APjAAAWxSeYGV3MB6FOabtXqFAIrTYVRl1ENaMzUHVzjzcOsLJJqqAsT
 zjcTVclk+HSnr54ve/lEfENqe8iGQdVX9lYh6O/Jb87i7TnsKhX79k4nFFvP7irRB9NIcgRdJBx
 0dWI0D8n4tSxG
X-Received: by 2002:ae9:e109:: with SMTP id g9mr23410947qkm.141.1580738106627; 
 Mon, 03 Feb 2020 05:55:06 -0800 (PST)
X-Received: by 2002:ae9:e109:: with SMTP id g9mr23410919qkm.141.1580738106410; 
 Mon, 03 Feb 2020 05:55:06 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
 by smtp.gmail.com with ESMTPSA id w60sm9760352qte.39.2020.02.03.05.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 05:55:05 -0800 (PST)
Date: Mon, 3 Feb 2020 08:55:03 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v13 06/10] virtio-iommu: Implement fault reporting
Message-ID: <20200203135503.GC155875@xz-x1>
References: <20200125171955.12825-1-eric.auger@redhat.com>
 <20200125171955.12825-7-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200125171955.12825-7-eric.auger@redhat.com>
X-MC-Unique: V1ZeBwASNsyF74Ttep1tYg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nm4vgiBUN3jA

On Sat, Jan 25, 2020 at 06:19:51PM +0100, Eric Auger wrote:

[...]

> +static void virtio_iommu_report_fault(VirtIOIOMMU *viommu, uint8_t reaso=
n,
> +                                      int flags, uint32_t endpoint,
> +                                      uint64_t address)
> +{
> +    VirtIODevice *vdev =3D &viommu->parent_obj;
> +    VirtQueue *vq =3D viommu->event_vq;
> +    struct virtio_iommu_fault fault;
> +    VirtQueueElement *elem;
> +    size_t sz;
> +
> +    memset(&fault, 0, sizeof(fault));
> +    fault.reason =3D reason;
> +    fault.flags =3D cpu_to_le32(flags);
> +    fault.endpoint =3D cpu_to_le32(endpoint);
> +    fault.address =3D cpu_to_le64(address);
> +
> +    for (;;) {
> +        elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement));
> +
> +        if (!elem) {
> +            error_report_once(
> +                "no buffer available in event queue to report event");
> +            return;
> +        }
> +
> +        if (iov_size(elem->in_sg, elem->in_num) < sizeof(fault)) {
> +            virtio_error(vdev, "error buffer of wrong size");
> +            virtqueue_detach_element(vq, elem, 0);
> +            g_free(elem);
> +            return;
> +        }
> +        break;

This for loop is not needed any more?  Other than that:

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu

