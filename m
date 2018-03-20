Received: by 10.28.91.67 with SMTP id p64csp4121700wmb;
        Tue, 20 Mar 2018 10:46:37 -0700 (PDT)
X-Google-Smtp-Source: AG47ELslVqC2T/pkdrn/8c50VcAYjVP/9cHdqzN4Wc6LKvGZiHuKTOme66bVR6ySVwRvM7X8gEVJ
X-Received: by 10.55.5.8 with SMTP id 8mr24956215qkf.84.1521567997189;
        Tue, 20 Mar 2018 10:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521567997; cv=none;
        d=google.com; s=arc-20160816;
        b=fbmffzRP+WwPpo2IBS3OM8og5CXszdMOm6eerO+lfenN9lHgHkvvHNrRvrVAtfplXK
         2elR/I/fa3IlFj0LwaQxHZRIWsx4a44zpErTYNi9XpQJP+XWM+VeNPaOtzIYVAnQwlKJ
         V9BtqkMHTnyiO28ZpWmNHTsXXJzegoKrRa9AD4LEEAHV4EHEYp0xq0ULrcvgHCa4j/1t
         nfHwx1lX29lIekpDROG08ctmzRRpu4Mmz/ry51Af+idnscg3IsBzaOF+mjR5dzrVG31V
         QZhohJwZviRsSMIvpMJwW07mz/pJpCj+EkkIRPmYJCyCW0TCkJpJUNvc3TRDbERctK43
         KlPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=5XCOEummyz1a76R1MIJ+lgdLPOrbe4+1YIt3gL+htDY=;
        b=ttlHuhtd4WqhBWNX66pdO6/x4+ptyE5c8uY630QycGXmkQbET+u6Q5rB/l1aLixh2c
         p1FJrNN9oIeog346dPG6q5luLLa+m9d3ZAxhPJ0RWPPjummqZ5yeWRffam1ZeEvjfsoV
         vSdzaFkQfKASprqqDxUTvlxN1Af05zgwBpMOQ1b2YLuUDqrHB/2h9cP9tDocR6VJ1hwJ
         SLgEeRfLzmGKpnvo0Z23WZBKxObjqx+BNyP//Oone9usaS5gpChnj6lD9X4x0k4k6CN7
         YrJ23M0M7prLVH9sPHUcDrg1AdJepsJtfr/HP5hFZYwj6dmYu3+/b/rq0Bd3otMkVDxX
         8X8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j22si390261qkk.211.2018.03.20.10.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 10:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyLLI-0000y7-Mn
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 13:46:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyLCN-0000mG-Oo
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 13:37:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyLCM-0000go-La
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 13:37:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55288 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eyLCC-0000dY-Mb; Tue, 20 Mar 2018 13:37:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BB95F8FD0;
	Tue, 20 Mar 2018 17:37:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA2F2202322F;
	Tue, 20 Mar 2018 17:36:55 +0000 (UTC)
Date: Tue, 20 Mar 2018 17:36:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20180320173653.GH4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<b068cb91-b8ba-175c-40f5-a7c9c8163575@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b068cb91-b8ba-175c-40f5-a7c9c8163575@weilnetz.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 17:37:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 17:37:12 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH] qemu: include generated files with <> and
 not ""
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Hannes Reinecke <hare@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
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
	Xie Changlong <xiechanglong.d@gmail.com>,
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
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tz6hy4nfcLsa

On Tue, Mar 20, 2018 at 05:33:42PM +0100, Stefan Weil wrote:
> 
> Very large projects often split in sub projects, maybe one of them
> describing the API. Then that API headers are similar to system headers
> and can be included using <>, although they still belong to the same
> larger project. Do we have a stable QEMU API described in a (small)
> number of include files which typically do not change? If yes, then
> those include files could be included using <> because we don't need
> them in dependency lists or in static code analysis reports.

QEMU doesn't have anything we'd call a stable API at the source level,
anything is subject to change at any time, and often does.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
