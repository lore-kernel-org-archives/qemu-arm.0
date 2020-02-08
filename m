Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1769501lfp;
        Sat, 8 Feb 2020 05:42:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8RH/OHTxoptGETMK51kB/qzQyFoxTguwX/Ox9vxReRrUgwkNmac8nVnWx9HyMhIc2E9Ib
X-Received: by 2002:ae9:f711:: with SMTP id s17mr3382604qkg.238.1581169332384;
        Sat, 08 Feb 2020 05:42:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581169332; cv=none;
        d=google.com; s=arc-20160816;
        b=Dd6OYST5XDkQaZwFZuE5xNXrRwlFhtyW+9aJ4rk16KAkBr5S5fx92djjGstCMimJ6o
         HQ1fE+cfk2fxS8SLBOPSSRbxbWVHWabjA2hLZdCHfGoCj11Cdg9lghF7kpVfECC2Ps5c
         sSWbayDO8xm0JjqTTW7g3iP4VRb+vADaiD3+wee0tp+JJfYh67fgltInJ8SFoXmekp4q
         HpJDOGi76wamfXXcmAaJ+Zw3ryKaf/wh/qH3LRCMMuX3LKDlLXybQIB6UqoLDPVo+Z+S
         e3kRJNI7af7Ca+Mh0uKHEYIZz7JnU5uQA98vD8NhpKWUpri9t60YmV5ybxlgUMtNch0/
         Btzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=7hTkU97E43YATmx6OfAiwt/jQnFE0FV/B1tScVLFLWw=;
        b=AUv+2IqUkAwdrS+7l5ovIKoTbunK9PCIi/3ZRZDkSkyPxb8Um5LMis8mt3/QGJJnsU
         EdxPjwwoRzOY7d1FdzW/HquwwD51JEbXhchufrNoYRwbZGqIWW1rMQ3nR+o44F7W1Qtc
         NTgl0AK4x79eOlu2764QrIjRhITC3BGA3KX2kvlLyire7ajnfzn3mblJY+jCG10PFaoB
         HKq2GDPIWpOKOnlcaIym6mKxRhQuKGJiGBzWwxsO7qgsEzyyGHtSopE/M2LmbBQwgMTP
         lLnWfLUNbyj2XgYOdTwXxVo+10QWrVje2j9jtR52Fe0AHJRVGktqjvUEhsqcp7RHKI2l
         lcvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JZnwOYwx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x127si1311814qkb.267.2020.02.08.05.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 05:42:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JZnwOYwx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0QN9-000835-BS
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 08:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47245)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j0QN0-000825-Rf
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 08:42:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j0QMz-0006J1-MT
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 08:42:02 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58935
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j0QMz-0006E9-Iz
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 08:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581169320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hTkU97E43YATmx6OfAiwt/jQnFE0FV/B1tScVLFLWw=;
 b=JZnwOYwxITDGjMx75T4Fe3UuoBivwBS9fd+dylJg8z1ctZu1KWgeMC5OkrKcqePRcktwVu
 eXJheub084t//t5WtrduwydhkfAmU3cYb+RySRvNfp2F19/06hdahwO4PxcsQYtwXLwaSm
 jBINBuTppdF76e4d6oYpZQ/BsDqnz1E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-JJsNdhEeP7-UCMfPisd2WA-1; Sat, 08 Feb 2020 08:41:58 -0500
Received: by mail-qk1-f200.google.com with SMTP id a132so1402603qkg.5
 for <qemu-arm@nongnu.org>; Sat, 08 Feb 2020 05:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YKFimlBCt0tode6uI7G4ZnKvAwhYl19BYX1ehrjhP44=;
 b=PG8ipUOuDYGFWNqfMme0FwNsLTuEdQT+mZeEw5PenGi6KZ55WoW4oUhG91FaZlNL3f
 32LnMTykxPB44NVXtRZRhinm0juZgRmLiIHEbuAgk4WLywIAcBfFDy4SvWiIbBo70DxF
 J51Me4bLEmiiToAp0Axai12M86TRtRaHbqzFyzp4HDt2X/LDBGFhF/vPvZCxy9EuHd9N
 W3FhkRhR+DosgzN1wQiPmqF9d+ibt4hhh8AGUCAP3Jfbw6rWYUWGhgr8awTL7WowBtVH
 EUfapS1peOoDmTow6lc/oAdW5OMAlbjhkMATv9Wz9gosD46o73uBgQAXYWBNxTqXRWem
 VYfA==
X-Gm-Message-State: APjAAAVy8+JKzk+tqxLKmiYU61glsnWl/QOLMoTz4zuD9XCBDJsRjuRB
 n2tju8ztLBJQ5D7XCAXvouwXA2ClkVc0U5aX7t3L3UnfZYbgJPMAb37fkd67SX2acaQmJpdvU04
 0T7wz5jLCtnKW
X-Received: by 2002:a0c:f193:: with SMTP id m19mr2749202qvl.154.1581169318167; 
 Sat, 08 Feb 2020 05:41:58 -0800 (PST)
X-Received: by 2002:a0c:f193:: with SMTP id m19mr2749191qvl.154.1581169317955; 
 Sat, 08 Feb 2020 05:41:57 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
 by smtp.gmail.com with ESMTPSA id r37sm3054538qtj.44.2020.02.08.05.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 05:41:57 -0800 (PST)
Date: Sat, 8 Feb 2020 08:41:54 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v15 3/9] virtio-iommu: Implement attach/detach command
Message-ID: <20200208134154.GD823968@xz-x1>
References: <20200208120022.1920-1-eric.auger@redhat.com>
 <20200208120022.1920-4-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200208120022.1920-4-eric.auger@redhat.com>
X-MC-Unique: JJsNdhEeP7-UCMfPisd2WA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-TUID: 8yxCxBkcyal3

On Sat, Feb 08, 2020 at 01:00:16PM +0100, Eric Auger wrote:
> This patch implements the endpoint attach/detach to/from
> a domain.
>=20
> Domain and endpoint internal datatypes are introduced.
> Both are stored in RB trees. The domain owns a list of
> endpoints attached to it. Also helpers to get/put
> end points and domains are introduced.
>=20
> As for the IOMMU memory regions, a callback is called on
> PCI bus enumeration that initializes for a given device
> on the bus hierarchy an IOMMU memory region. The PCI bus
> hierarchy is stored locally in IOMMUPciBus and IOMMUDevice
> objects.
>=20
> At the time of the enumeration, the bus number may not be
> computed yet.
>=20
> So operations that will need to retrieve the IOMMUdevice
> and its IOMMU memory region from the bus number and devfn,
> once the bus number is garanteed to be frozen, use an array
> of IOMMUPciBus, lazily populated.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

(Hope this is the last one missing r-b besides patch 8, I'll leave
 patch 8 for the others or Michael when merging)

Thanks,

--=20
Peter Xu

