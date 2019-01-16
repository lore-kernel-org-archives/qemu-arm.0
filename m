Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp649020wrt;
        Wed, 16 Jan 2019 06:49:39 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6Ug6bKMXJULwO9RyrEC8kAa5aM5pI6AS2C0IFpfYVxLm50p29VmEjhcOItrwLhNEqBEaSg
X-Received: by 2002:a5d:454f:: with SMTP id p15mr8316904wrr.39.1547650179958;
        Wed, 16 Jan 2019 06:49:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547650179; cv=none;
        d=google.com; s=arc-20160816;
        b=DSfNBg1C5kwcu54z3+2xdKR8xYM0tHBV+Fim6o76VX9jj/7IXbiY2YWVaRxBOXgofo
         PtPtbg16XEKydMHel8OYyrSiHK2EHX+fx7zI2j0rMUmFiDtpzkmVeiVqHm3JaU5CO4Xr
         hkCUThOVpMvNPX7iDzjAwA3Vivc8CFSmXqNFGjk6vC+oG39BKLY4DJmkqBVpFDlvS5er
         dvZyXLHvIerukaNLU3TuXaaodc1s1vg9g+FZGh+eAwFPwvdgu0+EDXYVuHcq7W1beV0P
         jBpRuWIbzeqi5Y5shchqHTmwZ8QPskdf/smuVjKlnGS8yvotloCLTxAMMfbAqCtr1Ny6
         MGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=O+pweC59C7UId9vacJHHGMB8dzsJEro/9WS23PU5RJM=;
        b=dsstKEBG9XHysr9ilBYsm4sjlzcf/Fn317r6GZeztsOV4nBsoriz0AJ1UEwF0wy0F2
         zR5dJl4jsjEDt1PjZkhuB3L4PRlvoyaQ+cEzi8jWDIaewCgsDw4WowMVMGlx/0RNRiQb
         zu9ksr6tSxiQSGm7P67/DKfuMzJEur9754Cyh5yF/ryLoM/nwwXDAM89qoWRtLv44dZj
         obKTQB5GWD1M9ThFlKZFRQe+Z50UTOj41P4jDMRo1iJVE3Fea8nCDqmgvkHl/k2z6cry
         O9W9U/9jMrKkMITpvl2QH4ZFPoVQkcCMLWRnx5bVkiA4CYEalb0tiy2lFV1b/XW97rul
         GlTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si53255551wrm.42.2019.01.16.06.49.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Jan 2019 06:49:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gjmVf-00041Q-1V
	for alex.bennee@linaro.org; Wed, 16 Jan 2019 09:49:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gjmV7-0003nm-Lf
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 09:49:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gjmV5-0001z7-QI
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 09:49:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57350)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gjmV5-0001us-JU; Wed, 16 Jan 2019 09:49:03 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DCD54E937;
	Wed, 16 Jan 2019 14:49:02 +0000 (UTC)
Received: from redhat.com (ovpn-120-67.rdu2.redhat.com [10.10.120.67])
	by smtp.corp.redhat.com (Postfix) with SMTP id 36C12100194A;
	Wed, 16 Jan 2019 14:48:53 +0000 (UTC)
Date: Wed, 16 Jan 2019 09:48:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190116091801-mutt-send-email-mst@kernel.org>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-4-philmd@redhat.com>
	<875zuqjea7.fsf@dusky.pond.sub.org>
	<403ad2e4-3282-051c-1ff5-8a3a23899293@redhat.com>
	<be75e72a-9f54-c9b5-4a1f-e87e28df8ba5@redhat.com>
	<87sgxtatod.fsf@dusky.pond.sub.org>
	<4b24723e-5a27-f25f-76c1-f2f4e94757ba@redhat.com>
	<20190116113455.dyl6uctl4dpaqh6v@sirius.home.kraxel.org>
	<ad34caf3-5f1f-dffc-4aed-60bb90ba2e5f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad34caf3-5f1f-dffc-4aed-60bb90ba2e5f@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 16 Jan 2019 14:49:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/15] hw/ssi: Remove SSIBus
 from "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QOzwb6AWTDHO

On Wed, Jan 16, 2019 at 12:49:07PM +0100, Paolo Bonzini wrote:
> On 16/01/19 12:34, Gerd Hoffmann wrote:
> >   Hi,
> > 
> >> typedefs.h is useful to avoid rebuilding the world too often if a type
> >> is used many times as a pointer, but rarely as a struct and rarely has
> >> functions called on its instances.
> > 
> > Related:  Can also be used to keep struct content private.  struct
> > QemuConsole for example is private to ui/console.c, but pointers to
> > QemuConsole are passed around alot in ui/* and hw/display/* code.
> 
> True, though as we switch more and more from pointers to embedded
> structs that does not work that much anymore.  Another way to do that is
> to split the header in include/path/to/foo.h and path/to/foo_internal.h.
> 
> Paolo

Not sure this will help since no tool checks structure isn't
actually used even though it's in internal.

If you want to go overboard it's solvable of course, e.g.
something like this will work:


E.g. in virtio.h

#ifndef VIRTIO_PRIVATE
#define VIRTIO_PRIVATE(f) (VIRTIO_PIVATE_##f)
#endif

struct VirtioPrivate {
	int VIRTIO_PRIVATE(bar);
};

and in virtio.c:

#define VIRTIO_PRIVATE(f) (f)
#include <virtio.h>


-- 
MST
