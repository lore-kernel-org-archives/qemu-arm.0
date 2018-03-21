Received: by 10.28.91.67 with SMTP id p64csp5183626wmb;
        Wed, 21 Mar 2018 08:14:04 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvM0eE8bpk+8KZEaenNXcB0j6U9nvSj2Cz22rK9u9SDRQeC1TX07VAXT/viApFNRKkU2znY
X-Received: by 2002:a25:94d:: with SMTP id u13-v6mr12541799ybm.175.1521645243953;
        Wed, 21 Mar 2018 08:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521645243; cv=none;
        d=google.com; s=arc-20160816;
        b=mfNOHxzuhOC139cW/0YSM/New9p2PNSumatsyQeMbl+fNGmEBsUsl8X8oXS+yERz04
         RhKszLpoLuhq2cq3gmjyh9q7xRrx98A3k8UMCmD07Zv3riVI1032fDmvv3PrTamoo9fu
         wvAQYWDm73tHNtzyh17gOpxqaBlqnn/5KcJWq2LlzD3Ynq1x4KRiRRFXBxfFcy7etNZ8
         kufsq3ywjPo1OGaamZo26mN/Nlpb97Ldzhb0YjkNr+iMan8BQt5yv5kh9U22boD1ppMU
         H5ySWAyRPy+/zBTRt6cywlaOto/t0Qh9MO+5nm1eCbv/pxfvm0JaZhALm/hcYO1epLZB
         j5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=dd5GQyURB+iWlX0xk9MwCqyALR+3u3rOGd2IkD0aEcY=;
        b=JlUHy45F9GSXbq55t0ZmdKbipDIvu18T0OIZnKsR775glVmirLI2k2mht0hPagDhrw
         VCyygosBOeuQDPU8sfmosH46H9P/MWPzaTQPkVIVSVA6vXTA1a0idClBXnh2JsQ7Z8UL
         DZXWYmYnzu0ZSDqQ16ptOjADRgNsbuYWWsxCtFm8rs9NCAnstxD8tNBj3eXqEQ7ygf2k
         zBLh+aH7avdmljBKs8ZLC62fEZV1QIYE/eI+L9Yh6HkUvfoPujM4DKGsvyFi4FupWtZg
         Di1/X9bLklxgOOMz5R46Ks8W1BKJM9xHY4UHjyKvILRWji2gKNiu2DDGmB9Yept+qhaf
         V7sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b63si79543ywf.159.2018.03.21.08.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 08:14:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyfRD-0004V5-DY
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 11:14:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyfR0-0004Ru-Gc
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyfQw-0006IV-Gs
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:13:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52085)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyfQw-0006IG-8M; Wed, 21 Mar 2018 11:13:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E16597F359;
	Wed, 21 Mar 2018 15:13:42 +0000 (UTC)
Received: from redhat.com (ovpn-124-179.rdu2.redhat.com [10.10.124.179])
	by smtp.corp.redhat.com (Postfix) with SMTP id C039099C98;
	Wed, 21 Mar 2018 15:11:17 +0000 (UTC)
Date: Wed, 21 Mar 2018 17:11:12 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180321170823-mutt-send-email-mst@kernel.org>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
	<3a819d04-b1d2-550e-7458-4ea7509db36d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a819d04-b1d2-550e-7458-4ea7509db36d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 21 Mar 2018 15:13:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2] qemu: replace "" with <> in headers
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
	Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
	Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
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
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ebq+zAH0ntB0

On Wed, Mar 21, 2018 at 04:04:29PM +0100, Paolo Bonzini wrote:
> On 21/03/2018 15:46, Michael S. Tsirkin wrote:
> > +if (m@^\s*#include\s+"qemu/@o) {
> > +    s@^(\s*#include\s+)"qemu/([^"]+)"(.*)$@$1<qemu/common/$2>$3@o) {
> > +} else {
> > +    s@^(\s*#include\s+)"([^"]+)"(.*)$@$1<qemu/$2>$3@o) {
> > +}
> 
> Can you explain the changes in the source tree layout?

include/qemu -> include/qemu/common
include/* -> include/qemu/*

Thus one uses any qemu headers with

#include <qemu/....>

we can do the conversion gradually and avoid a flag day
with some use of softlinks.

> Also, s{}{} and m{} are a bit more readable.
> 
> Paolo

Thanks, will use.


-- 
MST
