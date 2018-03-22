Received: by 10.28.71.155 with SMTP id m27csp775707wmi;
        Thu, 22 Mar 2018 13:04:48 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvSd//67oDjaWIW7zkxzjI0OxO1JbjcM2k3JirvDfIrjyKSUTXkw13qI8T6fpUqJBo/OksS
X-Received: by 10.129.106.138 with SMTP id f132mr9646682ywc.404.1521749088310;
        Thu, 22 Mar 2018 13:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521749088; cv=none;
        d=google.com; s=arc-20160816;
        b=gmR3XvAn8CitQY0VNOlfTYoZPhSqis/m/h3WMmal8ip2RS4u8HQk1yxnqh/sUmH8QX
         uKrxpr1j8OpSASF8UvXt/dFr5LelC/qBQEEkaqFOiMIDT62MAn6Umjk05TQJZIdx7raC
         ja7sn14rdKGDrZTgfc2AQJ09YvzJhECncfm/Av6tONptvyarRot5umW5z/IfBi6u7Z5t
         w1B85pVIBYQ/YyoDCWpEzJY8OQfi8Q/LXp7YsbA+YRKjusg038mhjzA0rAgujXtdwt2/
         FN/7DGekxaXcC0+EseAlxHXb+zzlvVK8etkTy1itR1hlURets359eigvloBRrW+9f/bq
         oTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=sZgvsO9IRe9oLAftkY5xLB13fY5KS3C7pNUuL+hn4vw=;
        b=X+H6BBPBNcv1siwokyaevMcZlFwW43LORWzP/4W1E865C3YnLa6Y02w6gwUJif9tzg
         ficsqxrOUyfVCo2Qp9koMhHFry86Po5sWHxB6G7ggMBfsesytvt0z3q38O44ARtxOh8F
         MH+S/vV7FxIae/qIaeqAkuJyVq/Hymvw0/OmCUelj0UEGmPTSeoV+U89BDIDjDMLhRhv
         ZImRRbO48DbO4r1G7q7vF/AWm7KQI1EhKP2BZFJd7a7K/Y6WRXfwbUCwYlXI0AVpHXM7
         ooSJ9aCNVSmubMXkpdBzMfvO1VeYBG2esWvy8k6wz6AdoJM3+Org8GGRKkbkpHmzTxKT
         h+Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u67si1392858ywd.187.2018.03.22.13.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 13:04:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez6S7-0008Ve-Pc
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 16:04:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ez6S0-0008VQ-Tu
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 16:04:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ez6Rw-0007hM-7V
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 16:04:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51716 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1ez6Rw-0007h9-1v; Thu, 22 Mar 2018 16:04:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA80A40201A7;
	Thu, 22 Mar 2018 20:04:34 +0000 (UTC)
Received: from redhat.com (ovpn-121-132.rdu2.redhat.com [10.10.121.132])
	by smtp.corp.redhat.com (Postfix) with SMTP id D278C2166BAE;
	Thu, 22 Mar 2018 20:04:26 +0000 (UTC)
Date: Thu, 22 Mar 2018 22:04:26 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20180322215555-mutt-send-email-mst@kernel.org>
References: <1521746188-496856-1-git-send-email-mst@redhat.com>
	<e149388d-eb17-ffd3-b54c-cbdf6a309882@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e149388d-eb17-ffd3-b54c-cbdf6a309882@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 22 Mar 2018 20:04:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 22 Mar 2018 20:04:35 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 1/2] make: move generated headers to
 qemu-build/
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
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, Jiri Pirko <jiri@resnulli.us>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org,
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m43vKjachTpU

On Thu, Mar 22, 2018 at 02:42:55PM -0500, Eric Blake wrote:
> On 03/22/2018 02:27 PM, Michael S. Tsirkin wrote:
> > Make sure all generated files go into qemu-build subdirectory.
> > We can then include them like this:
> >   #include "qemu-build/trace.h"
> > 
> > This serves two purposes:
> > - make it easy to detect which files are in the source
> >    directory (a bit more work for writers, easier for readers)
> > - reduce chances of conflicts with possible stale files in source
> >    directory (which could be left over from e.g. old patches, etc)
> > 
> > This patch needs to be merged with patch 2  of series updating all
> > files: sending it separately to avoid spamming the list.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> 
> > +++ b/Makefile
> > @@ -89,102 +89,102 @@ endif
> >   include $(SRC_PATH)/rules.mak
> > -GENERATED_FILES = qemu-version.h config-host.h qemu-options.def
> > -GENERATED_FILES += qapi/qapi-builtin-types.h qapi/qapi-builtin-types.c
> 
> Uggh - I really need to follow up on my threat to make smarter use of make
> variables and string manipulation to cut down on the boilerplate involved
> here.  Sadly, I'm not convinced that doing so is a 2.12 bugfix priority, so
> it isn't at the top of my work queue.
> 
> Overall, the patch is an interesting idea.  I'm still not 100% sold on it
> (as you say, it's now slightly more work for writers), but I'm not coming up
> with any solid reasons why it should not be applied (at least, for 2.13 -
> doing it during freeze for 2.12 is a bit harder to justify).

It's up to Peter really: it helps reduce conflicts if we apply patches
like this during freeze.  But with enough effort on Pater's part it's
not a huge deal.

> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
