Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3389690wre;
        Tue, 29 May 2018 03:14:40 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK0E7d343devLNGur72TMN/tKM7g2Fp7ekfV9k+l2v4WW5H4e9cUAKitGNLL2gj1pjtEOi4
X-Received: by 2002:ac8:2acc:: with SMTP id c12-v6mr15077418qta.389.1527588880766;
        Tue, 29 May 2018 03:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527588880; cv=none;
        d=google.com; s=arc-20160816;
        b=LKv1h75BWC33j6OPl1nGwcrasnVnStX6gAmkyGVF+FBhVkvzfEvuU4b0OqbtVVdSB5
         cjBwzCMaC5jE5eFWPQ0X45ti98idm1IAJe5HFRmCb8+9FRybrnO2AtDXU3oMDHp7Z6On
         u2DWR8WECvNDPVoCi1zKYeWzLTnQzuxenUcyu8SI9Yu4YaW9Eta/fFDz+b23jLIU6L/A
         jVtVMaCdCZbXWUh0kAB5dhnCZsWgh6VQJsCVxqvnUV+/tU9JNA5cJTb7VjbgkNkCIp5G
         LfsSiZNqtNM8cEp9WplirgwrVGhOvJCidAnVzAc0JQo/xo9w34uGhVGGg4ysJc/m8K74
         oddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=SmM029IJBhO4MabUF8ehmZE6h2l9br0vE4WVrjrYqVc=;
        b=qI5e5Ar4PPwy7yLwiddP6Mt3qPcSS1YqZRqVnoaOwNCpY4d/5dzpj44P7FDd6wjx5L
         ygsZ3kqVZcrCh6suleqNOl5M4s3YceTrQLVtxSXKEY+1jQBqRb4iqcP+/4x9if58PpdK
         wl9ak0dBgkC1SROeTvHCY904qp93mIHzX/jY2Pe/YT4RAuw9Z1Ahof91UlYii9x6q0l/
         IpVritH8u+fTUDB6yMiyY0VgO5/HbBd7ge2VypkbsuvljwiuJKFDeu7cy+Sd+qN83dC0
         PPRjZtYLc93IRRJunPNLKxufpOQSwEHT8/2caxrsmelfldZacp++1xclz3HgOA7K6f/q
         mf1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t126-v6si5714391qkc.131.2018.05.29.03.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 03:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNbeH-0000SF-PU
	for alex.bennee@linaro.org; Tue, 29 May 2018 06:14:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNbe7-0000QL-Gm
	for qemu-arm@nongnu.org; Tue, 29 May 2018 06:14:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNbe6-00044H-FD
	for qemu-arm@nongnu.org; Tue, 29 May 2018 06:14:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35686 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fNbe6-00043y-B9; Tue, 29 May 2018 06:14:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD705BD9E;
	Tue, 29 May 2018 10:14:25 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA9762026609;
	Tue, 29 May 2018 10:14:19 +0000 (UTC)
Date: Tue, 29 May 2018 12:14:17 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20180529121417.1e44484b.cohuck@redhat.com>
In-Reply-To: <20180528232719.4721-13-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-13-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 29 May 2018 10:14:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 29 May 2018 10:14:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 12/21] hw: Do not include
 "sysemu/block-backend.h" if it is not necessary
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"open list:virtio-blk" <qemu-block@nongnu.org>,
	qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"open list:virtio-ccw" <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Michael Walle <michael@walle.cc>, "open
	list:sPAPR" <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8lIuZa6/OSFK

On Mon, 28 May 2018 20:27:10 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Remove those unneeded includes to speed up the compilation
> process a little bit. (Continue 7eceff5b5a1fa cleanup)
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/collie.c                          | 1 -
>  hw/arm/gumstix.c                         | 1 -
>  hw/arm/mainstone.c                       | 1 -
>  hw/arm/nseries.c                         | 1 -
>  hw/arm/omap1.c                           | 1 -
>  hw/arm/omap2.c                           | 1 -
>  hw/arm/omap_sx1.c                        | 1 -
>  hw/arm/pxa2xx.c                          | 1 -
>  hw/arm/spitz.c                           | 1 -
>  hw/arm/versatilepb.c                     | 1 -
>  hw/arm/vexpress.c                        | 1 -
>  hw/arm/virt.c                            | 1 -
>  hw/arm/xilinx_zynq.c                     | 1 -
>  hw/arm/z2.c                              | 1 -
>  hw/block/dataplane/virtio-blk.c          | 1 -
>  hw/block/virtio-blk.c                    | 1 -
>  hw/core/qdev-properties.c                | 1 -
>  hw/cris/axis_dev88.c                     | 1 -
>  hw/display/tc6393xb.c                    | 1 -
>  hw/ide/pci.c                             | 1 -
>  hw/ide/via.c                             | 1 -
>  hw/isa/isa-superio.c                     | 1 -
>  hw/lm32/lm32_boards.c                    | 1 -
>  hw/lm32/milkymist.c                      | 1 -
>  hw/microblaze/petalogix_ml605_mmu.c      | 1 -
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 1 -
>  hw/mips/mips_r4k.c                       | 1 -
>  hw/ppc/spapr.c                           | 1 -
>  hw/ppc/virtex_ml507.c                    | 2 --
>  hw/s390x/virtio-ccw.c                    | 1 -
>  hw/scsi/mptsas.c                         | 1 -
>  hw/sd/pl181.c                            | 1 -
>  hw/sd/sdhci.c                            | 1 -
>  hw/sd/ssi-sd.c                           | 1 -
>  hw/sh4/r2d.c                             | 1 -
>  hw/virtio/virtio-pci.c                   | 1 -
>  hw/xen/xen_devconfig.c                   | 1 -
>  hw/xtensa/xtfpga.c                       | 1 -
>  38 files changed, 39 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>
