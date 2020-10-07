Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp794391lfq;
        Wed, 7 Oct 2020 15:27:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLCIE1ikos+u7db+WJr3kfHJwR8t9tfSOTG45C9k9YU98335KDoXvEXibqr11bkh7tla5h
X-Received: by 2002:a25:7314:: with SMTP id o20mr6567865ybc.211.1602109653675;
        Wed, 07 Oct 2020 15:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602109653; cv=none;
        d=google.com; s=arc-20160816;
        b=ICpI6m0J6JA1znCPtFB7HjAMVweGBlh5DnKdySJxM4YeoAcQjVbzx1MWlSrADMjb+B
         9ae67xw2UkSSeThSKRPmLh1wDjiiXr85AVOEwQuDfV9G6Igxv5CYgrvOInSIpjn2UMvm
         c/ZjIYelGwMuBH0RUWZWtAXmDfHDiT5QODnE7eSoEtkhTm/dqMf6SF3QCzftn/YyPQmP
         vmgqF6/Gp4uQLAsR/WphMwBHvX1TlbNIK76HJdkR79ixCAwxzmGjbLqVOIAj3RZl8PIB
         joQu83TMeNjkeWhepMk2Kz4cCjoJsoxOJzTK5i+8IevsgldwK9xnlKO9h/5vRUPpwTzJ
         k++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=zlAk6viXZB+2JmcBonrJJIWkGxbb541ezreuxfFHjCI=;
        b=I+nFDIg2U1edv/KNyoePDuzrco9cUuYF7AnQzJKsk4d4bVvXSjfZNWgNCSfFlzifK/
         G5XtFeklvccG3lvRqZVt0fpXPX6OOoec0Mispsop76/PLnNi16UuGiFsRR8X/5oEShNz
         H/v02CmjtORMfsYZsSTBoe8MHsCHkTHGMO/+7lNnojdbdsVA+LnY6jIQZFc7dpnyC8W9
         onxiiKJQZ4ewjFR122jUpcN+aEwAUjTe7x4ZyNPlzUshB+8LxmhFv9kXVYPFoB60Adt4
         HDaJ7Mpr3fsSmgz5S/grliUTm9XmCavM74ao/vqlnNX50VLfnRkJelD9VWXq48g79JHR
         oQ8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cbinlxcI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si2919774ybj.264.2020.10.07.15.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 15:27:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cbinlxcI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQHuG-0002T7-Us
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 18:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQHu3-0002SN-J9
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 18:27:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kQHu0-0007wl-Nm
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 18:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602109634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zlAk6viXZB+2JmcBonrJJIWkGxbb541ezreuxfFHjCI=;
 b=cbinlxcIg7v3YTZOcdWAYzExoZTyw+rTWAGdNGXRPJBkqRWlXOHNWxjWybI2f3pk26F40f
 ej9deeLgGhqtpneYG2zohgBP6tDsKUL5L8J5N2hMrcQGLcf5urSFzFWuVebAS1Y1VINxor
 LJz3qbevH9vYHpJRwfxwGTK6TvWWZEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-LXbSRMSkPuWCzQqZXhCE6w-1; Wed, 07 Oct 2020 18:27:12 -0400
X-MC-Unique: LXbSRMSkPuWCzQqZXhCE6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 360B285C706;
 Wed,  7 Oct 2020 22:27:10 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BD687BE42;
 Wed,  7 Oct 2020 22:26:58 +0000 (UTC)
Date: Wed, 7 Oct 2020 18:26:57 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/24] qom: Convert some properties to class properties
Message-ID: <20201007222657.GA7303@habkost.net>
References: <20200921221045.699690-1-ehabkost@redhat.com>
 <20200922210029.GB2044576@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20200922210029.GB2044576@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Alistair Francis <alistair23@gmail.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kTdQkohRZYSX

On Tue, Sep 22, 2020 at 05:00:40PM -0400, Eduardo Habkost wrote:
> On Mon, Sep 21, 2020 at 06:10:21PM -0400, Eduardo Habkost wrote:
> > Class properties make QOM introspection simpler and easier, as it
> > doesn't require an object to be instantiated.  This series
> > converts a few existing object_property_add*() calls to register
> > class properties instead.
> > 
> > Eduardo Habkost (24):
> >   cryptodev-vhost-user: Register "chardev" as class property
> >   cryptodev-backend: Register "chardev" as class property
> >   rng-egd: Register "chardev" as class property
> >   rng-random: register "filename" as class property
> >   vhost-user: Register "chardev" as class property
> >   vexpress: Register "secure" as class property
> >   rng: Register "opened" as class property
> >   vexpress-a15: Register "virtualization" as class property
> >   input-linux: Register properties as class properties
> >   input-barrier: Register properties as class properties
> >   tmp421: Register properties as class properties
> >   s390x: Register all CPU properties as class properties
> >   i386: Register most CPU properties as class properties
> >   i386: Register feature bit properties as class properties
> >   arm/virt: Register most properties as class properties
> >   virt: Register "its" as class property
> >   cpu/core: Register core-id and nr-threads as class properties
> >   arm/cpu64: Register "aarch64" as class property
> >   xlnx-zcu102: Register properties as class properties
> >   machine: Register "memory-backend" as class property
> >   vga-pci: Register "big-endian-framebuffer" as class property
> >   i440fx: Register i440FX-pcihost properties as class properties
> >   sifive_e: Register "revb" as class property
> >   sifive_u: Register "start-in-flash" as class property
> 
> I'm queueing the following:
> 
> [PATCH 01/24] cryptodev-vhost-user: Register "chardev" as class property
> [PATCH 02/24] cryptodev-backend: Register "chardev" as class property
> [PATCH 12/24] s390x: Register all CPU properties as class properties
> [PATCH 17/24] cpu/core: Register core-id and nr-threads as class properties
> [PATCH 19/24] xlnx-zcu102: Register properties as class properties
> [PATCH 20/24] machine: Register "memory-backend" as class property
> [PATCH 22/24] i440fx: Register i440FX-pcihost properties as class properties
> [PATCH 23/24] sifive_e: Register "revb" as class property
> [PATCH 24/24] sifive_u: Register "start-in-flash" as class property
> 
> The remaining patches still need reviews.

Queueing:

[PATCH 03/24] rng-egd: Register "chardev" as class property
[PATCH 04/24] rng-random: register "filename" as class property
[PATCH 07/24] rng: Register "opened" as class property
[PATCH 09/24] input-linux: Register properties as class properties
[PATCH 10/24] input-barrier: Register properties as class properties
[PATCH 13/24] i386: Register most CPU properties as class properties
[PATCH 14/24] i386: Register feature bit properties as class properties

Waiting for reviews on:

[PATCH 05/24] vhost-user: Register "chardev" as class property
[PATCH 06/24] vexpress: Register "secure" as class property
[PATCH 08/24] vexpress-a15: Register "virtualization" as class property
[PATCH 11/24] tmp421: Register properties as class properties
[PATCH 15/24] arm/virt: Register most properties as class properties
[PATCH 16/24] virt: Register "its" as class property
[PATCH 18/24] arm/cpu64: Register "aarch64" as class property
[PATCH 21/24] vga-pci: Register "big-endian-framebuffer" as class property

-- 
Eduardo

