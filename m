Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7030989lff;
        Wed, 15 Jan 2020 07:05:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzY5hDNV4TtxzqcWM7mEfGIPDaX1kIWbZ4iP4fuxxaJJwbHPYepi+tqyIO59/+cjoOmVR9l
X-Received: by 2002:a17:906:15d8:: with SMTP id l24mr28495607ejd.170.1579100703336;
        Wed, 15 Jan 2020 07:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579100703; cv=none;
        d=google.com; s=arc-20160816;
        b=cSdOVJ81DJc3F8WR2imUdHFcI9c8hMQLsqLz27xoYXV2qS+BFWySNTReqVmFGFEp+4
         fU/SX07BzP2MaJ4Cbw1y3YpgmslGg49D3GBqN/dxh0cjQ7HboXF/g4fuQPz2EUJZp5o2
         2ticqxAaFtv6xFiMdkoGXLjW9/hz1n6AJ0hCUiLdgM0GFNuH9rdIQlgnTi/6FtAFcdVm
         rO+s2UOyJDjFf1G8cNIzfO5ufGNTWTBNqkoQdTcsV+yijo7RbLEB3hycJztRcnv5mJmR
         6Lp4PDDcLV4Sg8qeUptvfCRo2f4n63a6V6q0gGVdy0n3xmsZ4pq/aIhnWt3iDocEN9mp
         7yQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=hCuftxJNdF3kxBj8oa4PT2qaVcewZ4vHhyNd9oC/xTc=;
        b=JtQoc72s6nJa7loFkYNR0Y1bv1lbEZtBfAY+jUXB6l3cxE4N9WOQfHHJxpxHeRJxVv
         xbvfCIP+8dAbNb9rW1Y4TLC5G0ZfJb2PiXhLsP5R3ui5zdxMEGxppTRUy2L3ymtBz0gC
         64WxHJzAWud2flr45bsef0bi+Z75T6IpJqLSlvVyeDOU8M8PviAJulaV2bbeZKfgz7/6
         KKjRFlmdhYgiuG5OcNyVz2aLManF2M0RlEOh8ArTWtL6LlKDFZxGQVdBDwy8hjCg//Hd
         Gz/HtF8+32wY+ik+ld64wF//9beejtW8VWmxKVQ318Iybrf+hKoScT32+cSO9g8/7V03
         oTjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z2Q9VOUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i24si12947511ejv.303.2020.01.15.07.05.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:05:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z2Q9VOUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkEA-0004ML-4w
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1irkDy-0004LI-4c
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:04:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1irkDx-0005XD-32
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:04:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51599
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1irkDw-0005Wx-Vk
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 10:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579100688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCuftxJNdF3kxBj8oa4PT2qaVcewZ4vHhyNd9oC/xTc=;
 b=Z2Q9VOUzyelmW3IgbidI1vZQ0iQUdyxbUv53dSxLCFsvEula3L6rjdbxROIVQMXaZozP5/
 oJA9wFAIxi7w19oSIV/2BSS0KHz+TXRdLJCq1eqy/ZkRLpertRDz63NVRPfjgPKhI4sxZ0
 +Sif1qqaVRwTE/ilH+Krm+CsBRsMlPk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-VBUDeX9AOvuagsj10geDsw-1; Wed, 15 Jan 2020 10:04:45 -0500
Received: by mail-qv1-f72.google.com with SMTP id e26so11177282qvb.4
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2020 07:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sd42UO1Bkkp1gbRccpWIkuLUdR8NJv7X4bTm/t0zc8w=;
 b=GBBUtFOU9CZY8FNsxqWuIxOiEGyW3BWBPfihugWVMv4fTfx8kXHRZ5VsBDrqJ3BEBA
 KfQS0gn8fA5nWzbPuzVEXPQcddz1UnvcSHQebEd1QI06VQe9n1dOp3I5x1ZfneLgEBJY
 A9r+MBNmtejAbhYL8GJwxnv2ZlWCo1EQgMMEpjVvKsWL1pT/ertiMAzf2Qck7bQnJIWA
 biGnNJ+KCQ47r8dMjUe52ZGBkaUVv1t9ey1xLthyZF7Dual2u9/QgsgXdKDJ3eaZoTPk
 QT87/lsXkGslv3hDBT4mKWw/w2FdGz7n7YWeecNoppMPjjsw6hTKHl/fVuKwyMZf0/SY
 M7dg==
X-Gm-Message-State: APjAAAUHWRsVDycac3HTtDwM/UL8R0vYdP3mqJGAUZQL132IEJV987qa
 rXupFRL6xWya5hc08mF8+M+bOw9OYb+zqeitPC6xvfgfQfpFZlGxrTKi719KVTFkQr9gC0p2+ta
 PIbiEzp5aVtrw
X-Received: by 2002:ac8:4257:: with SMTP id r23mr3959511qtm.126.1579100685150; 
 Wed, 15 Jan 2020 07:04:45 -0800 (PST)
X-Received: by 2002:ac8:4257:: with SMTP id r23mr3959488qtm.126.1579100684962; 
 Wed, 15 Jan 2020 07:04:44 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id l35sm9703518qtl.12.2020.01.15.07.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:04:44 -0800 (PST)
Date: Wed, 15 Jan 2020 10:04:42 -0500
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v12 09/13] virtio-iommu: Implement fault reporting
Message-ID: <20200115150442.GD233443@xz-x1>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-10-eric.auger@redhat.com>
 <20200114190433.GE225163@xz-x1>
 <2a060fcf-f9d6-c6bf-d444-018df532e475@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2a060fcf-f9d6-c6bf-d444-018df532e475@redhat.com>
X-MC-Unique: VBUDeX9AOvuagsj10geDsw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: 1/wKatlp0Z69

On Wed, Jan 15, 2020 at 02:12:20PM +0100, Auger Eric wrote:
> >> +static void virtio_iommu_report_fault(VirtIOIOMMU *viommu, uint8_t re=
ason,
> >> +                                      int flags, uint32_t endpoint,
> >> +                                      uint64_t address)
> >> +{

[...]

> >> +        if (iov_size(elem->in_sg, elem->in_num) < sizeof(fault)) {
> >> +            virtio_error(vdev, "error buffer of wrong size");
> >> +            virtqueue_detach_element(vq, elem, 0);
> >> +            g_free(elem);
> >> +            continue;
> >=20
> > If virtio_error(), should we stop rather than continue?
> My understanding is the buffer just popped had a wrong size so it is not
> usable. We skip it we try to use another one if any. Does it make sense?

I'm not very familiar to virtio, but I see that virtio_error marks
vdev->broken to true.  If with that iiuc the next virtqueue_pop() will
fail directly (see the first call to virtio_device_disabled in
virtqueue_pop).  Then I don't see why retry any more...

Thanks,

--=20
Peter Xu

