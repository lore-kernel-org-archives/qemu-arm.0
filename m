Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3322765wrt;
        Mon, 14 Jan 2019 10:23:45 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4trWa3pt/e3tjjiDYsZbDJID14BpHbaszv4hJNJ6jFtTEwTyMz2hgPrTrKKbu3x5g+FDB+
X-Received: by 2002:adf:c108:: with SMTP id r8mr26408352wre.233.1547490225493;
        Mon, 14 Jan 2019 10:23:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547490225; cv=none;
        d=google.com; s=arc-20160816;
        b=ib7Kv5mUdaj+smRKYxrW+VOF9p2KtoCqz21WmKhF/DfQ+Lk6wQHWlCI/U8Httkq0qj
         nDRRS8bSwVLcUYKbzHDj3C3Cx1n0kRnKQy1IKRqzy3HPf5wWK+cYnMjnGYK3afTdvwhC
         i7I26h04Sz8PTInp9EY2iuadPDTpuX0kx5OkalQsOAc4njZqSVqxsq1B0TOYAljxQW5q
         lC74ZdOBu0iNRYC0aw49T9cBiMC/yLjTKj3cGioPeLnUu/w6PRzFtEMw6TiNiV8LQY4x
         dWYSy5ffcyglB7dqdy4S0oLQYSe2KpZiTYS4/dEq2mKLkpH50VEH24FkF1j4DS2BFzhb
         vElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=d8AyoiRS825kyOqkBXv/+RWa+c6Wtv4aS8OBkhspSUo=;
        b=YXjIU51/E2RyMYPjfGfWcpxSLtporPTeVH67fBxCS7KnExdW17lBAHpEF7dQPIiq8d
         JfUHnKzAoFbajQGn7WVAQufyo7/7CYQlCPzAftFyr8HvXTPB5OxWg2QBqLIajqIW09JB
         g9d9P9r3WjD7ik6VkzHaP1BLA4dlJEFrFOSG2pwkDMDQHK57EiCvVbtbujCiLhfVSFHz
         DuMa9E+BFS6fF3DIq/w4WVFx35VtXbf9VOypXxjMbTav1NloJ5pnWCNjy2vgVrccPaL1
         GC2DTi8rGDienIho86izl7IghZYMF+WlRusvRGDNPofOWDfAtCVxMSVOjGzRoNrBGjME
         eQPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si57600770wrc.361.2019.01.14.10.23.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 10:23:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj6tk-0001zm-If
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 13:23:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gj6q4-0007HT-5m
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 13:19:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gj6dV-0007q0-Gp
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 13:06:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gj6dT-0007oa-CZ; Mon, 14 Jan 2019 13:06:55 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 825ABA8F4;
	Mon, 14 Jan 2019 18:06:54 +0000 (UTC)
Received: from redhat.com (ovpn-124-229.rdu2.redhat.com [10.10.124.229])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4ED1C5C1B4;
	Mon, 14 Jan 2019 18:06:47 +0000 (UTC)
Date: Mon, 14 Jan 2019 13:06:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190114130617-mutt-send-email-mst@kernel.org>
References: <20190114130829.21790-1-philmd@redhat.com>
	<20190114130829.21790-2-philmd@redhat.com>
	<20190114104559-mutt-send-email-mst@kernel.org>
	<c7323df9-a2c0-80f9-d9ba-065279ff6126@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c7323df9-a2c0-80f9-d9ba-065279ff6126@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 14 Jan 2019 18:06:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/3] hw/nvram/fw_cfg: Remove various
 typedefs from "qemu/typedefs.h"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Ben Warren <ben@skyportsystems.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
	"open list:Virt" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OGIpM35uRf+b

On Mon, Jan 14, 2019 at 06:52:21PM +0100, Paolo Bonzini wrote:
> On 14/01/19 16:49, Michael S. Tsirkin wrote:
> > On Mon, Jan 14, 2019 at 02:08:27PM +0100, Philippe Mathieu-Daud=E9 wr=
ote:
> >> There are only three include files requiring these typedefs, let the=
m
> >> include "hw/nvram/fw_cfg.h" directly to simplify "qemu/typedefs.h".
> >>
> >> To clean "qemu/typedefs.h", move the declarations to "hw/nvram/fw_cf=
g.h".
> >> Reorder two function declarations to avoid forward typedef declarati=
ons.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> >> ---
> >>  include/hw/acpi/vmgenid.h |  1 +
> >>  include/hw/arm/virt.h     |  1 +
> >>  include/hw/mem/nvdimm.h   |  1 +
> >>  include/hw/nvram/fw_cfg.h | 22 ++++++++++++----------
> >>  include/qemu/typedefs.h   |  4 ----
> >>  5 files changed, 15 insertions(+), 14 deletions(-)
> >=20
> > I am sorry I don't understand what this patchset is about.
> > Supposed to be a cleanup but instead it pulls
> > fw cfg into any user of unrelated headers.
> >=20
> > More lines of code slower builds what's to like?
> >=20
> > Shared typedefs is what typedefs.h is about.
> > These are clearly shared so let's keep it simple.
>=20
> I can see why this patch can be a bit controversial.  Personally I thin=
k
> it's okay either way (which generally tends to favor the status quo).
>=20
> Paolo

True - not something to lose sleep over.

--=20
MST
