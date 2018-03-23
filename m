Received: by 10.28.71.155 with SMTP id m27csp285149wmi;
        Fri, 23 Mar 2018 03:23:36 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+FZHLO/4MNGnyL3LCvcHMwLm6SPG1e8behwq+GmHpHpobrIN0p3bm1zV39X1M5znIrhS1n
X-Received: by 10.200.12.65 with SMTP id l1mr2326794qti.218.1521800616151;
        Fri, 23 Mar 2018 03:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521800616; cv=none;
        d=google.com; s=arc-20160816;
        b=miC1qUIYaJoOZq9qkHkI7vK5dJGTkgH3HyaIiF/kgnChO9y019787rQq4xPThm5kDH
         QwgjUtxImu2LQYi7d1/QWf2PMmsSR4UKFBYh/KhWBiuzbuxbqsrD6yRXJ3Vo0tJKTOuz
         A7F/d7dZpHsgVjfk6qqMJFnz9ZKJnnBZpE+VGj/qBlkMi2AO753aeMtyNYhJG4qDMzbU
         M7/08OcwVZJVTkMN0Rz116u0m12AFAQ9NfprtDJCPk3PPSK6U3gm9caaOb6cCBgMLPf3
         Pki4C00ghhqxIYY861BgmipqiKzp6EQaLROUcfAnpb8Psck++fNv7tWQ1AH/MTe+x9+W
         mZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=11RaNeiG8Xng2fab3WOsL/kWn+pp+sulWxt9d1wfF6k=;
        b=VAtaof4eGcWb6MKFeaGQDOIIqkj73W8lk1gV3QqQdKaEP/W8+txCQQkgzU4Z9Ct83Q
         aAm9VDbV+IvSXz6ovK/8jJBWe91IFvUnZf5TtTJO4Q52JdfrtplOackwyKoqX8cEUHKA
         SRGWOpPbB0gkQs5706Tbp5RTxgHEDsqeYCbNYNAHAGwi4bDSz+O6FrgkFIORKiXoFzxg
         34FN0D00JVtsWLDIzZ5ArRjF/+JVqX00nSIkp6fogbSJ7E73Y/TZzxXRpanuaxfEmEjI
         UpbJ4hEyOX9nOJ0dLDkRKN5gmUK3WzdUnY4gqes+x+VRnLwHbdwL4/LrgXEOr0a9cDh/
         sbMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d187si562029qkg.304.2018.03.23.03.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 03:23:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezJrC-0006tQ-NY
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 06:23:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ezJr4-0006t2-9v
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:23:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ezJr1-00022M-5t
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:23:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56586 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1ezJr1-000224-04; Fri, 23 Mar 2018 06:23:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8421B722DA;
	Fri, 23 Mar 2018 10:23:11 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B1A510B2B21;
	Fri, 23 Mar 2018 10:22:30 +0000 (UTC)
Date: Fri, 23 Mar 2018 10:22:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180323102227.GF16270@redhat.com>
References: <1521746188-496856-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1521746188-496856-1-git-send-email-mst@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 23 Mar 2018 10:23:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 23 Mar 2018 10:23:11 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
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
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
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
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mx3K0BeYmJ/n

On Thu, Mar 22, 2018 at 09:27:55PM +0200, Michael S. Tsirkin wrote:
> Make sure all generated files go into qemu-build subdirectory.
> We can then include them like this:
>  #include "qemu-build/trace.h"
> 
> This serves two purposes:
> - make it easy to detect which files are in the source
>   directory (a bit more work for writers, easier for readers)
> - reduce chances of conflicts with possible stale files in source
>   directory (which could be left over from e.g. old patches, etc)

If people care about this, then they can just be doing a build
with  srcdir != builddir config.  If people are using srcdir == builddir
then they likely *want* all the generated files in their srcdir.

IMHO it would be valid for us to consider if we could just mandate
srcdir != builddir, but if people object to such a proposal, then I
don't think we should arbitrarily move all generated source files
in this way, as that's effectively the same thing forced onto devs.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
