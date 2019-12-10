Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6247150lff;
        Tue, 10 Dec 2019 11:18:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyf0gRkwTui2CEn3BH0W7IdpHxAhagIR+sSTjlCVZ2ixypv1c0dgIp+rhgYB+IKEvwRPpcN
X-Received: by 2002:ae9:c003:: with SMTP id u3mr10229150qkk.133.1576005516226;
        Tue, 10 Dec 2019 11:18:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576005516; cv=none;
        d=google.com; s=arc-20160816;
        b=DOwMKtwRmSedP/8uBvIf54N+7HPgnelVXWH65RRpgjLaUwTfT6f0u8VOjJFfq0qWZz
         JjQaJNusGZ8M19wnu1T4lRcQm5+KOHYhomCbjvszumCULpmMtSa8VSO/lAI32DzSCk6H
         x+TWtR0noOuJY92fSCvsTUHODCWG0NT8RaG6n/WnTwxJdNLhSsntIOX8sMybRfijfO/v
         SDFSTdI4+maANODPNjd/WBk+gjpehLYeJN2Azpgm7CramViNatBXF5/B5I/qisN85wJ/
         F3Pbmp4WOjDZ/c4mjBgYfcBOt2D5WeTeSaTkQYlIU4SCFtiafnx0Uo19MQ0TJOpga5mw
         NJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=c3++B6jGigoLFuo/3hQZOpMhqfas1y5qS8ZZuYwehX0=;
        b=x+/SIBUjH2PEPwsL/M81qcRhZBXDyCyITp64GUvdXp1hCwtaqqKM+anzyt806bqgrQ
         zUQ3ul1vhlLwhYFS2Mjjn6mZpfSZHsgHe6lOCo4gSdVGSvXRyf+DUYwZEFEgxvCJXsXG
         iaDJb/neJilvic5Ls4OVQjjDXJ+AHoQW+pnCRb6Pvd84qBo1jNH2QVrFhWaepX/++FBA
         1lEAQ/ZViScu50htAxGnAB9WsLK/9AdgkVoLn4D88/IWf8O63b8UkAbUOuCzr5qzQv3r
         lN7enwfm96r2pmmXFBI1dITU9EalEQqbxAWhu+3s2lOsKN1nCR5WGpmJeahlbBjqYpv4
         d77Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aMMXiQv2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si2231882qkd.130.2019.12.10.11.18.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 11:18:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aMMXiQv2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iel1m-0006qV-Do
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 14:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52745)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iel1Y-0006on-Ma
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:18:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iel1X-0001KF-Lj
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:18:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44667
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iel1X-0001Jw-IU
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576005499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3++B6jGigoLFuo/3hQZOpMhqfas1y5qS8ZZuYwehX0=;
 b=aMMXiQv2M5zit0TLB6GOuOQgrxzGIJ/InfCvvcDt8Z21VuM8rYbU9rUX1AOau1/9FrXHFa
 uWcZJ4Hlk0Z1K3iYHUpLBVFEHqUKx1F6x/z7pX6q4D1+yVB9CKqAAl+6VP40PvU22qf/tE
 ad7uKvQVZ2IYf0vO5/Y+TA7zhVOEb1o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-76wcU4EQMTuUUwec4qMP5w-1; Tue, 10 Dec 2019 14:18:17 -0500
Received: by mail-qt1-f200.google.com with SMTP id h14so2640281qtq.11
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 11:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=71U6KlP9jDk1ZWVrATst8QhUNwH9m6eIUrRigEc9LaE=;
 b=sCeAwQQnLGpVqirtTE23t+GoEKda+6Ntmb3x9hzbaismw1wpSmP5hhHw4X3vn4gyU7
 N7Ut1tIDpvIyjNhTW2YKcRvoi8RJ+AOEYRtrfZ2v8GwfZa1CiCpW23U9f3gdFSxc7A5i
 hVrMJr/SVg1tZmsNijmere4kpIIdNhKVnlR+0gaxBrnkmLYJWB3PJd9g7qv6x7RYGAdt
 Q1lKjkm3oL0RCpLqKluqCuyQ+M2kCo888bBi6/a36O8x+ZKoE9pttXPAUvr63pic6Bt/
 Pc0qLvy2e2C+yRtbel/72NICRYOQ9XYWEzxW6DL8SXeK1K04EdoJY7aOgJ5skVZ3Qjh/
 Bieg==
X-Gm-Message-State: APjAAAWHsg0VGb55UpSVjabTVRq3x+VfW1eHGo2rcWvEG/c+KBo7IKmw
 L08MWSwagC7rCMQdhkoHProJYRyqE7vDJ+6wPhFgYuE4WtynmPUdPdd6K/ylO5n5KiMHYyZYwdi
 RSW8zjlf/9qjv
X-Received: by 2002:aed:3ac6:: with SMTP id o64mr32220049qte.219.1576005497138; 
 Tue, 10 Dec 2019 11:18:17 -0800 (PST)
X-Received: by 2002:aed:3ac6:: with SMTP id o64mr32220030qte.219.1576005496972; 
 Tue, 10 Dec 2019 11:18:16 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id q30sm1387181qtd.5.2019.12.10.11.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 11:18:16 -0800 (PST)
Date: Tue, 10 Dec 2019 14:18:14 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 04/20] virtio-iommu: Add the iommu regions
Message-ID: <20191210191814.GI3352@xz-x1>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-5-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191122182943.4656-5-eric.auger@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-MC-Unique: 76wcU4EQMTuUUwec4qMP5w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b0kC3zDl8MxI

On Fri, Nov 22, 2019 at 07:29:27PM +0100, Eric Auger wrote:
> This patch initializes the iommu memory regions so that
> PCIe end point transactions get translated. The translation
> function is not yet implemented though.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Either with/without Jean's comment addressed:

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu

