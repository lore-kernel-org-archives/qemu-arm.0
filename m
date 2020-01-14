Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5890343lff;
        Tue, 14 Jan 2020 10:55:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzJkFCk0z81sS7uBTWp/yYV/39M/9pm5G/SkIcxpDU3AAATUdR3cxxS8p5CN1lTmnit/Ke
X-Received: by 2002:a17:906:2892:: with SMTP id o18mr24333476ejd.312.1579028151711;
        Tue, 14 Jan 2020 10:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579028151; cv=none;
        d=google.com; s=arc-20160816;
        b=rAQ5fpe8FwIYCfGkMzD3y08AYcZZGI1dC8JZoAaxSb0aBVp7TYKoKD6+wvyfzfqI6z
         eesDYoQdgOs4sG/PJ8CZEQIXDZDKw1Tz9m/XPBRsm6Cu7h4msoo9CDA5MLWgr4YJvwYs
         arV6XRUwGH7VhQHYerePpfg2PYYq9yKtCn9hg9NY0cMDfCG92zupXDdEBlu4g1hgEP2n
         Fh/s7FpIq0K/ZRlU1/cUlP1zEP5S/hYRuz90S15+P0A9p1iHJrQZSzHa2B6pu8DgOhZH
         tPT/t1L4roUDPj++opgHqW1o9ATsXGHFzNoeuK3tgyYZNu+WSI6ewfa9fZ7IJMxH9x+9
         v3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Ttx8wCKDBH1eCxadZzRZloFU6gGuskBxM/MoipQ6vW4=;
        b=EuIpyjWT3FY71shxPGDNPq8OhSaoJwoH+7mF55V8WoXj5ZWjpnDU6vTIJEdZirhvwy
         yAKMH1BLud0B0rTGLvvAKNjn9qBCxXJDDbTIHB+dyfetIj7Y3ARA3wizMwRTkKmPvxEK
         nHZF/6VZvBTOnwlqO5FVE1GfTUOW3J7vnJatvaB1mQdjmthwyduMhp9u0OSjYpUKq6dL
         zvk+W3PFCqW981dHNar+64lH/9KEJiQ7eV0oVsOxjMKDQ2HrwsE9rASobF1spxC2u35V
         C7rxfSZtyFX+nfjCwKLn4UGzdPI70oXTQYbpj8CFvuXcNH7n0LD/GSe0NbwXaU315JKC
         TA8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JZ0prp0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id um25si11115294ejb.409.2020.01.14.10.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 10:55:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JZ0prp0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irRLy-0004xv-O5
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 13:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1irRLh-0004xN-7n
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 13:55:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1irRLc-0007JK-Um
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 13:55:33 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40872
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1irRLc-0007J8-PU
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 13:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579028127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ttx8wCKDBH1eCxadZzRZloFU6gGuskBxM/MoipQ6vW4=;
 b=JZ0prp0f7+fGgGl0Ulv7l8pOjSeT15+IKVh6XYb3U+HmrLmU490dQLpyAk+akCgkwXa46i
 1eGdqgwKAHhtLFiH1D3KNPXjKyNIsXke3TKWRCIpfjjbjo2P535yGRtT8ObLK9rjkuR1SD
 ejLaABoG5YcvmDIxDnno7aP/QhhOxMg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-6xCrUXILPZSKEyC4LIEjkA-1; Tue, 14 Jan 2020 13:55:26 -0500
Received: by mail-qv1-f69.google.com with SMTP id f16so9381081qvr.7
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 10:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Y99xzUgXTtHmmArnFdjZ5QIC8gpsaKjcndyu1C8r0s=;
 b=h0NJsZjY/OY5HFNO4FwfWCIaInoET6bExZjr2UAkCsnIlAHt3HFeqjGAY1Nxquo+5q
 XJBR3hcnl+pzveoxDrw8vn8pvgcdxMriHpN0IDLgbuDBKBF5fj93CVRfWaHfSqwXCvrE
 cb0b+HM2+OOpByqaoGS4nU0WstNl7E/NjEpXaoXyyxYws30YHm42fuvkxuGgXX0VmLww
 xP4JW+stfQnwR/UINE62kQx2QxBjXvsvECpV7xVS0O1AA/4VpZV+q0W24KdW69+9Q0kt
 TcN/b7Fwhn5PhmNkhTjCBHfKSgcanbbviOlpmgs52r9hfJ6HZnabyXUXGMq+PKb0jSie
 JX3g==
X-Gm-Message-State: APjAAAXlfaE9LcTFNjFX+cT68U/B9uIuRKhNwHfw0TxS1H3K6zBqt73l
 aYas4d8d6hgdhhm/6DNmcp0x3tRWwHIYxXl+OBfp6IVyJiV21vbm+VPjzqhLkZwF1YIgB/CtHEN
 KwMr5Id4fhDL2
X-Received: by 2002:ac8:33a5:: with SMTP id c34mr5108099qtb.359.1579028126123; 
 Tue, 14 Jan 2020 10:55:26 -0800 (PST)
X-Received: by 2002:ac8:33a5:: with SMTP id c34mr5108084qtb.359.1579028125994; 
 Tue, 14 Jan 2020 10:55:25 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id n55sm1125960qta.91.2020.01.14.10.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 10:55:25 -0800 (PST)
Date: Tue, 14 Jan 2020 13:55:24 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 07/13] virtio-iommu: Implement map/unmap
Message-ID: <20200114185524.GD225163@xz-x1>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-8-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200109144319.15912-8-eric.auger@redhat.com>
X-MC-Unique: 6xCrUXILPZSKEyC4LIEjkA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-TUID: Zfo4tYPtdvga

On Thu, Jan 09, 2020 at 03:43:13PM +0100, Eric Auger wrote:
> This patch implements virtio_iommu_map/unmap.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu

