Received: by 10.28.91.67 with SMTP id p64csp4109974wmb;
        Tue, 20 Mar 2018 10:35:16 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu6QylrurB7DiRHYX9xCop0Wa6xaZ406gX6j9FJV9NTigudO6Y2kcxXZN4qxcRPYv9smq5Y
X-Received: by 10.200.46.83 with SMTP id s19mr25035123qta.153.1521567316180;
        Tue, 20 Mar 2018 10:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521567316; cv=none;
        d=google.com; s=arc-20160816;
        b=Rac/q1CNJkrDCRD+OhDJeyL5UEqlWva2J8IMXpn5DRuld+m2ku1HLekmqt1rw938il
         taxscBoeA6gjUMNcy3CzEhnpueRcQZOliHOW0/ysEAohIVx31RxVCJHhNRntPQRxWIq8
         +tivEsGBNOH7Vgvr7gM7U3Xk0b9/ZOXLvAbqAys4Jb8UHaclYHI3iJxaMkLRK1G/nFGu
         CBY53e4eUE+IHgAa6J4HfYd2kWpJeVCz/ALSzWwOTooG2cbhXnjBD4QYWbEGw/82yILS
         FdH+8WUSDcCJeb+1qQo+nrKZD89ehOWiyxnV2RqkTA+7NIdRj4kSqvzYDNKTsyKZCw/L
         iHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=2B6xeKVBl4z/S+poOTdyLAplkTIfOpaljZI6M1tAi9M=;
        b=fFPy5cCY9KRIzOdLa+PywaqWgSTaGuF0KO3AtzskFqP5qcrBSBMiWLnic1HEIVZXx1
         a7H+x8H+GK0yPzzlGv/Dbgp0tE+YKGTRXkBhIiKqgd37p1Y0xmHxDqddQHCvc7vgM4De
         zviRpaqJgdQ5ivSWelsu//4lAEaI63JsehMza2MDN8hpJhF02jUClwA8sRu9xyt79slE
         lBHGJkPr+q+S/SX9WnaquiwOeS05q3qV6duT/oc+gdd3fAzj8u+huxziJvpD8IDZQLbc
         mdLnNgfPcaM9z1Eypl9T2D06/rLLA31EJMJ7MINA4S202RCKAK7UbY8xFy4fF/7laMCX
         TBfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l49si2441864qtk.12.2018.03.20.10.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 10:35:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyLAJ-000755-LA
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 13:35:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyLA3-0006wE-7N
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 13:35:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyLA0-0007qZ-3m
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 13:34:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49548 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eyL9z-0007qH-UJ; Tue, 20 Mar 2018 13:34:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1ADB2406805D;
	Tue, 20 Mar 2018 17:34:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 608BB10B0F4D;
	Tue, 20 Mar 2018 17:34:04 +0000 (UTC)
Date: Tue, 20 Mar 2018 17:34:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180320173401.GG4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<b068cb91-b8ba-175c-40f5-a7c9c8163575@weilnetz.de>
	<20180320185130-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180320185130-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 17:34:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 20 Mar 2018 17:34:44 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] qemu: include generated files
 with <> and not ""
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
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Hannes Reinecke <hare@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Jiri Pirko <jiri@resnulli.us>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Lieven <pl@kamp.de>, Josh Durgin <jdurgin@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Liu Yuan <namei.unix@gmail.com>, xen-devel@lists.xenproject.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ll3d+h2dzpkZ

On Tue, Mar 20, 2018 at 07:10:42PM +0200, Michael S. Tsirkin wrote:
> On Tue, Mar 20, 2018 at 05:33:42PM +0100, Stefan Weil wrote:
> > Using <> for system include files and "" for local include files is a
> > convention, and as far as I know most projects adhere to that
> > convention. So does QEMU currently. Such conventions are not only
> > important for humans, but also for tools. There are more tools than the
> > C preprocessor which handle <> and "" differently. For example the GNU
> > compiler uses -MD or -MMD to automatically generate dependency rules for
> > make. While -MD generates dependencies to all include files, -MMD does
> > so only for user include files, but not for system include files. "user"
> > and "system" means the different forms how include statements are
> > written. QEMU still seems to use -MMD:
> > 
> > rules.mak:QEMU_DGFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
> 
> To my knowledge, and according to my limited testing,
> system headers in this context means
> the default ones not supplied with -I.

GCC's definition of system header is here:

  https://gcc.gnu.org/onlinedocs/cpp/System-Headers.html


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
