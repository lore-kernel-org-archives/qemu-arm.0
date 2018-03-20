Received: by 10.28.91.67 with SMTP id p64csp4084860wmb;
        Tue, 20 Mar 2018 10:13:43 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtT195437vhfiuL8Q+Suwznhk6+gTEP/Ndzd4JdE7q/vkzcXEeKwxevaMgz1Gdktl6+8r19
X-Received: by 10.55.187.199 with SMTP id l190mr25136760qkf.336.1521566023026;
        Tue, 20 Mar 2018 10:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521566023; cv=none;
        d=google.com; s=arc-20160816;
        b=SPjZax6nu3b1oXXTrvhGl+1DiSbdn0ChbuFxp/efirrz4V2V2UHzNokxpBbohLrQiZ
         0s5viLC+rsQ7IbSWLhLefM8LcrMoHTZ6dFvJZsfvwVzOAESEORNj0e4f03tgF1EFDsqO
         na36E+EshoMXWtPoLAmYalSED/had97gzrgIA6EDlg+lf7Hi5LH7apQeeA6456liZymp
         S6OYgn+ImYVdhBfotTul6T73Jxgko0IAaxeUn4g7GBEh/8S7LsTEDk6QqXlOr2jhb9qj
         IvThHaUAsOtRjNpee55qcEYvlrYvP/08ik3WUVP85yO+rQdPa1S7DCHsVdLnSrZy0z5e
         W8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=nTRnuxW5H6H//L9FzjJcqWd/iR22lRXohW1abHjyCuI=;
        b=zaT1IH6O2TANoGFEugr4iIgat31pLHN8qNKzY6fdQyG4R/0WozTCzErakBBTUpKQGf
         vck3Ckgg7arPLTiKPHci+y5FRRnb/zDlBAI7TdU8cyFVS15Ck4kZ9fXPwCf0Zk/BB2tt
         6vwOR9E0xyAB5frgjChbR9MgGH6iihKpmQWKmri0XoEojLhYKuuydlThNuM/a/pFqCRO
         0gFZGNPQsy/DzsLAFseVKsqKdIxE71hflK4whOH4rKcU0YQDYeXawOueghZOYFN/4EjK
         oUkuCp2hfaeinbSy+eng5iboiroyq+v4VUOY5b7ZSk1V5+BiFD5SmyfUsYzu0AsVQMCi
         6AKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f130si2500256qke.23.2018.03.20.10.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 10:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyKpS-0008U4-Hi
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 13:13:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyKpH-0008L1-HA
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 13:13:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyKpD-0007oa-59
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 13:13:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54200 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyKpC-0007o5-W7; Tue, 20 Mar 2018 13:13:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F4908182D11;
	Tue, 20 Mar 2018 17:13:26 +0000 (UTC)
Received: from redhat.com (ovpn-125-54.rdu2.redhat.com [10.10.125.54])
	by smtp.corp.redhat.com (Postfix) with SMTP id 9D9B111701C8;
	Tue, 20 Mar 2018 17:12:59 +0000 (UTC)
Date: Tue, 20 Mar 2018 19:12:59 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20180320191156-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
	<20180320141107-mutt-send-email-mst@kernel.org>
	<20180320121841.GN4530@redhat.com>
	<20180320142756-mutt-send-email-mst@kernel.org>
	<20180320123900.GO4530@redhat.com>
	<20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
	<20180320134117.GS4530@redhat.com>
	<8e14f681-6572-062b-c503-c5ad091793d7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e14f681-6572-062b-c503-c5ad091793d7@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 20 Mar 2018 17:13:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 20 Mar 2018 17:13:26 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
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
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Liu Yuan <namei.unix@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
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
	xen-devel@lists.xenproject.org, BALATON Zoltan <balaton@eik.bme.hu>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uv3OyjMWSMoI

On Tue, Mar 20, 2018 at 02:54:37PM +0100, Max Reitz wrote:
> But I guess the main advantage with using this rule I see is that it's
> better for people reading the code.  It's just nice to know whether a
> file belongs to qemu or not by just looking at the #include statement.
> (Note that this implies that it is indeed more difficult to determine
> whether a header belongs to qemu than whether it sits in the same
> directory as the C file, though!)  So I think the old (current) rule is
> better for reading code, Michael's rule would be better for writing
> code.  I think reading code is what should be easier.

How about prefixing all internal headers with qemu/ ?

That's a way to avoid namespace collisions that is actually standard.

-- 
MST 
