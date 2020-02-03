Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3975194lfp;
        Mon, 3 Feb 2020 05:51:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzlfbG5D3vrhG5CgK4owD701fchq13S8GvXwDaYBCGnZPgWi0UWEbfxGBGQ03PeCnT63v4G
X-Received: by 2002:ac8:4351:: with SMTP id a17mr24395035qtn.133.1580737891443;
        Mon, 03 Feb 2020 05:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580737891; cv=none;
        d=google.com; s=arc-20160816;
        b=wP9/BqDZJoX2DvVGWLldlOZ/ktTNlLLYnAVq2TzCIDn9n+a9D84q+6L9pTIe2qQxB9
         FmfYXfrA4tOyMJRaPCBUjK4KUvhYCusYmb259xSaaodb5deDkM/nWM9r+U0HTiEyKf2u
         T7L2vw/jRgMOm1CKFS0H3HY8cK4nvQ7z6NSn1SzCUC/QczfuM5Se24vtaM4WVYmuNIXR
         2pXMN+AOdZsNMXpcYrDH7RSsL0ggNtrcupo4nExkJXuKj0YMKZ2fMiLArShuVQ6FX8Fx
         CsCxHtGqZ1lcV18kuzAJlUNunU0nmpsfFm4JZjCGVmN4Ze/2wp6ScTIBBGavbtApSEfO
         FZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=R5bej1dqTcSGdNSv5mPvhWgL8a6QJVf0VJSXDDzfAYI=;
        b=n5eTzSNN/1vg5SW5zcC8UMZyLcyr0k+OtlbOq3r4PM4D6G5+dfAkJsQkJp7+3BCMti
         eztWnhGyCNfpt/fbiNskW/Dmrp8qq1gd1h949cd5uHXr9+ZdRejfDOvDEAvNdhB8LqD6
         dB5aB4yLttV8YcCDaa8Cl+PSoneMKnZnNhExv5Rj2DJX7rls2KuUD07EPYdyipqefcBZ
         sOxGWGmZhIRenBhLqdc4DU0C8jajl+0yWaI7gw6I1WbxSEOavIIsVx7aLfKU/mF+KBxp
         Jj7piUYviOlCzR4WGpxVUc7uxLQ8cQH24GANaFe9RK5kEoZ8cww532wKJjZER8/rBib0
         dmsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hA9VHKfL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si11838855qkk.360.2020.02.03.05.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 05:51:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hA9VHKfL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyc8Q-0003U4-TZ
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 08:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iyc6z-0002Y3-L7
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:50:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iyc6y-0000Tl-Mh
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:50:01 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26244
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iyc6y-0000Re-J1
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580737800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5bej1dqTcSGdNSv5mPvhWgL8a6QJVf0VJSXDDzfAYI=;
 b=hA9VHKfLA38NYfsOtPJKfdCxReCgZJLa8L8g3jCOAjXBsx0o6FcY8IiecbpRBkyKhh3gjN
 eK5v2FEQH6gER7rBwPLANxifx1MO57g474uHDuhMcHjhXUDC+PD4GKVESwMdgIuRZ6f8Nj
 2wuywpUTUxyXmwt+a+wPNjh81XKktWc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-4i7NvL6jN-qEJHkLP-IK5g-1; Mon, 03 Feb 2020 08:49:58 -0500
Received: by mail-qk1-f197.google.com with SMTP id 12so9454042qkf.20
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 05:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Eh/p4QpstTUghO0v7ZgPvxjz9rPnRujzFzMauXepGiA=;
 b=hjh1inRPjF6y56uqruIDCG1lB/fCknzlFdLElhFyAFRi4+NGWtL63Q+lL2a0J+VjGT
 dKOIxaF7WWN18g9enxQqNJGPhqwz9BgUkCwXuatz74lnMsuKpQcg8bkZc85wUAXhFaw+
 7+4K0tMBIgNEDw693tWxk7x0AT8AkZxLPXz5cDE0MwkCzb6TgHWW2Oh0LR2l4sPGIya1
 Kt90cBbe9MvSH96TxldtEKE5jK7v60jxsqh25+6qVgyK8IJJN76KKQ4DpJbb78yRfoDO
 cYNgxU0x6XqZyoPxDeVGmb/sHeyxxp/Zl4vwwFOC5/+FilOS+/4O7h7w22m4f1NXEJB9
 UeuA==
X-Gm-Message-State: APjAAAXosm3Bs70SIit1szb+T3revl6pytCGr2fx1eNgDcAjWh2Pw3Wz
 QXAKsyeJfX1wDEyFpRRKEq4scrzj0/yymra5CuUngrYiQjJ8hdbu4UR193tk6wAIB/bhbF+kxxF
 kEJiDFTvd2CAacDU=
X-Received: by 2002:a05:620a:12ab:: with SMTP id
 x11mr23740570qki.149.1580737798047; 
 Mon, 03 Feb 2020 05:49:58 -0800 (PST)
X-Received: by 2002:a05:620a:12ab:: with SMTP id
 x11mr23740540qki.149.1580737797802; 
 Mon, 03 Feb 2020 05:49:57 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
 by smtp.gmail.com with ESMTPSA id u22sm407324qkj.97.2020.02.03.05.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 05:49:57 -0800 (PST)
Date: Mon, 3 Feb 2020 08:49:54 -0500
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v13 00/10] VIRTIO-IOMMU device
Message-ID: <20200203134954.GB155875@xz-x1>
References: <20200125171955.12825-1-eric.auger@redhat.com>
 <158548eb-8337-aea0-25da-bb7729bf925e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <158548eb-8337-aea0-25da-bb7729bf925e@redhat.com>
X-MC-Unique: 4i7NvL6jN-qEJHkLP-IK5g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7gqcNt++Szok

On Mon, Feb 03, 2020 at 01:58:04PM +0100, Auger Eric wrote:
> Hi,
>=20
> On 1/25/20 6:19 PM, Eric Auger wrote:
> > This series implements the QEMU virtio-iommu device.
> >=20
> > This matches the v0.12 spec (voted) and the corresponding
> > virtio-iommu driver upstreamed in 5.3. All kernel dependencies
> > are resolved for DT integration. The virtio-iommu can be
> > instantiated in ARM virt using "-device virtio-iommu-pci".
> >=20
> > Non DT mode is not yet supported as it has non resolved kernel
> > dependencies [1].
> >=20
> > This feature targets 5.0.
> If possible I would like to make this feature upstream in 5.0. Do you
> guys have other comments/objections?

Hi, Eric, Sorry that I forgot to read the series after a long PTO.

I'll do it today.

--=20
Peter Xu

