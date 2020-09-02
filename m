Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp699503lfc;
        Wed, 2 Sep 2020 09:59:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU+iBSc5tZsN7GE4vXltBaQq3z7YTfJ4QB9DyiHIr9M0Ksr7TAmIVIvy77XDQd6IvfTzGC
X-Received: by 2002:a25:7455:: with SMTP id p82mr10703013ybc.287.1599065956563;
        Wed, 02 Sep 2020 09:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599065956; cv=none;
        d=google.com; s=arc-20160816;
        b=IKLOPrCAuGmZ+DcspxqhLbHr94b2GgvjLk9fYXfNW/3FrMyrlRyAEJGVZH9xIUJdiX
         Z/4nLi6QzlbGmwBlS3vU48Qjd9MAUBqMmKW6Jfb2SrUCNx4QoYeqxmx1rnD0Vfkq1DXU
         l6KBwGj+ZBA9gGQeTEwoJpXWdrnfi0XJaYWdwkXt16GIBfSDkjhecAS2qIW050JFO3cc
         PIJvFmASrcd3c/2mdo6EPFGkklZIFwawHV+eYnGWU/MVt4OKrYZX2Dn5DWYTftNLjOXH
         OL9IUvcrEcmGBlFiaQsrGOrkmUjl1pFU1JPdCEymWa6yIKp+d/p4j/5up1LsF2Ae3/mr
         +uCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=GuwnEfz3+aHD+oGsjoQKFlJwr0H33ODfNHTd1UmoxIQ=;
        b=QcDZ1RsmRu4jiG2QrZUZdgWrSYCiBSfpw/UVaYuCaTa5QaMW54kz2tl8mKwpgmni+t
         6xTlJJAmVxHlb52mT93kYfanotsrvmZHnhN9I2E3Ak5j6LlpyQ05hHePAuzk9cMYKvZp
         hSnOefsE5pKc7C5qc/eJ32AhkUk/3kojGTCwX18XLL1Pr1QqKtCXK6N+xHUc3al+Af3d
         gkqEApfAPdiQSw3U5jFiwFYn0DT0TWfZzwsE8D5YQilpMB9yjy4L+I57+6OvQuYfsoVz
         fe/8kXck5fde5c6nIc85Vuq+jUGRC31FduwJBoVOVf02PznHvqF0IG4u7zFgnjBoue1h
         tTCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EzTK3RfP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 193si165143ybv.295.2020.09.02.09.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 09:59:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EzTK3RfP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDW6N-0006jR-VW
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 12:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDW64-0006hR-Do
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 12:58:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29316
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDW62-0008Bg-JO
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 12:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599065933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GuwnEfz3+aHD+oGsjoQKFlJwr0H33ODfNHTd1UmoxIQ=;
 b=EzTK3RfPa0cEPkOeok0dabub1kdC0chWxRRODo6HVDANg+x87q2nxu2FKSAopxlTkLDnfT
 q/w/UgV/HVi9Bq6D3ZrsHpFheZWwQzrK4zdDCwmu+SgO8KKFTer0AndUgSqcsEusZhPfQn
 9V6F8un7XSOqg5ckw/VC0/KcOTFq0CM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101--CInyBDfNde0D3vu_crBNQ-1; Wed, 02 Sep 2020 12:58:29 -0400
X-MC-Unique: -CInyBDfNde0D3vu_crBNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D1EA18BFEC2;
 Wed,  2 Sep 2020 16:58:22 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C37307E315;
 Wed,  2 Sep 2020 16:57:49 +0000 (UTC)
Date: Wed, 2 Sep 2020 12:57:49 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 00/18] qom: Automated conversion of type checking
 boilerplate
Message-ID: <20200902165749.GF4940@habkost.net>
References: <20200831210740.126168-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831210740.126168-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alberto Garcia <berto@igalia.com>, Ben Warren <ben@skyportsystems.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Anthony Green <green@moxielogic.com>, Laurent Vivier <lvivier@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Zhang Chen <chen.zhang@intel.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Anup Patel <anup.patel@wdc.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Huacai Chen <chenhc@lemote.com>,
 Max Reitz <mreitz@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Amit Shah <amit@kernel.org>,
 Greg Kurz <groug@kaod.org>, Cameron Esfahani <dirty@apple.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Rob Herring <robh@kernel.org>, kvm@vger.kernel.org,
 Juan Quintela <quintela@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Leif Lindholm <leif@nuviainc.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sergio Lopez <slp@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, xen-devel@lists.xenproject.org,
 Keith Busch <kbusch@kernel.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Jiri Slaby <jslaby@suse.cz>,
 Peter Chubb <peter.chubb@nicta.com.au>, Marek Vasut <marex@denx.de>,
 Sven Schnelle <svens@stackframe.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Thomas Huth <huth@tuxfamily.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mMbE6+h1VWZj

On Mon, Aug 31, 2020 at 05:07:22PM -0400, Eduardo Habkost wrote:
> Latest version of this series can be found at the branch:
> https://github.com/ehabkost/qemu-hacks/tree/work/qom-macros-autoconvert
> 
> This is an extension of the series previously submitted by
> Daniel[1], including a script that will convert existing type
> checker macros automatically.
> 
> [1] https://lore.kernel.org/qemu-devel/20200723181410.3145233-1-berrange@redh=
> at.com/
> 
> Link to series v4:
> https://github.com/ehabkost/qemu-hacks/tree/work/qom-macros-autoconvert-v4

I'm queueing this on machine-next.

-- 
Eduardo

