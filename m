Received: by 10.28.91.67 with SMTP id p64csp4058539wmb;
        Tue, 20 Mar 2018 09:51:36 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvk0iGndnBLNBk3AKzJMe1XA7ddNZZKFoK7teiQsTUyDE1hXAL8aMq8gtdumEF0NEX05c8c
X-Received: by 10.55.119.1 with SMTP id s1mr24614787qkc.3.1521564696491;
        Tue, 20 Mar 2018 09:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521564696; cv=none;
        d=google.com; s=arc-20160816;
        b=fzyXc9TEcKrHYbronPW1gtd2l/6rKSOwxe/k14qV76p0+g/JZmQaCnbSaZwdPV4e2R
         60mWcMJ+c/x4aiskkv3Y0M7GwBiFrB0Zf5Bsvfkct2+6ZByUm5bxHyDwF7jBFwQjeiy2
         tL2GAdBl4PeQhAufPLuFpPcQRIOPc+iwyZfr4utqtSaN+l8mFkSmpSK6VK8+ojblKX59
         Wl5hIIx6skkQPdHlaJNbfcY6Mq+xL7C+l3KwjV0Fxk+8VdohToDoGflG/3ZckcVDB9i6
         1A2NKoJZqig+xpuQTAdOwGNj/eYgqmG249+bZOTMsIPK3jSDq9RugII7zXXT2IjVhXp4
         ZdrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=KP5Y3nqwwXkagTz6L3NXC72L+9WPaSuwV7kHfrmdoPo=;
        b=GpeAolccD+egdJokXT+PHoyi+WMPsJNmz54bpGtRp11XXyGZjlGWZo95ug71ALTuo/
         xBTRpKkpOPd0U7GB/TQs3wYTkAN1E2GWBMq4a7a6+8cU6WYRvw1Wh349eWT4Av/W2xdp
         1uGRo6s3yhyeO2GcLWs/C24Y6hcvt/k4AyTBn6ecMdIdhkIqh1Mscx5x2l4LtyT3wlZ4
         QTgtXLrArBRrLPN6dz03nispqqiIVlhz01pQ+Q1o60404oLmpM7kRJTMPu9OdsgGpDQQ
         guywskieP3zpCr79rEMUDRlCaR15aWStcc8VWSVrw9vblBV1L3MiZDVdHn9W+eo1CeMA
         0l2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k35si2336907qte.141.2018.03.20.09.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 09:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyKU4-0003rM-1Y
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 12:51:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyKTv-0003qa-QN
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 12:51:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyKTq-000734-Vl
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 12:51:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35576 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyKTq-00071q-QO; Tue, 20 Mar 2018 12:51:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9D88A1BD0;
	Tue, 20 Mar 2018 16:51:10 +0000 (UTC)
Received: from redhat.com (ovpn-125-54.rdu2.redhat.com [10.10.125.54])
	by smtp.corp.redhat.com (Postfix) with SMTP id 9946D218CC13;
	Tue, 20 Mar 2018 16:51:02 +0000 (UTC)
Date: Tue, 20 Mar 2018 18:51:02 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20180320185013-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<da3457a0-7f24-4759-7d98-9b2fdc87e87c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da3457a0-7f24-4759-7d98-9b2fdc87e87c@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 20 Mar 2018 16:51:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 20 Mar 2018 16:51:11 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH] qemu: include generated files with <> and
 not ""
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
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Gerd Hoffmann <kraxel@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Liu Yuan <namei.unix@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Stefan Weil <sw@weilnetz.de>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IN9s6KmNkXVe

On Tue, Mar 20, 2018 at 11:12:00AM -0500, Eric Blake wrote:
> 
> Why can't we fix Makefile to include BOTH the build and the source
> directories (to pick up generated files first, and then version-controlled
> files), and possibly include logic to simplify to a single -I instead of two
> when doing in-tree builds?

That's the issue.  Whatever you do, #include "" pulls in the current
directory first.

-- 
MST
