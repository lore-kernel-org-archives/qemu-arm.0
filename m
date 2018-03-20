Received: by 10.28.91.67 with SMTP id p64csp3838238wmb;
        Tue, 20 Mar 2018 06:32:04 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtcwx6Zlw6G1tEpHH9rJ+byTR4xA36RtzXNp1dFAvBK3JnVo3RgSV7uq/xdNoQmWU2UBdIW
X-Received: by 10.200.12.136 with SMTP id n8mr23787333qti.167.1521552724744;
        Tue, 20 Mar 2018 06:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521552724; cv=none;
        d=google.com; s=arc-20160816;
        b=tRzYJPJTOCHEngpEiyY8QqEVi2pcZs4Jbs2zCl2q9ptyLFPQMWWjzJujTIAZkqB62r
         5VCohAFjaPW0k65jRBTg3UVLOHZyAbTJ7ggczckZQOsmFqCCmiL7+4xaK3JWca8I7A4Z
         yFZwe1uTq3zsWwuMsOKBNMyp445+JE3i+erAEqqQV1pzyOv6QDpnaHjRqturmLyaEItP
         e1wiRM0CX33F55133jJuTKg/G0lB6kKnSIVzQg5vLmT3EDKhXPiptSdNPlvS5Yq1NjMF
         RckZ+UuEaONSnR4lzA1T29dW+jkxUsOr6qQP3mQy57oojAKh1qas5hkR+MKierygrg15
         8j1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=XvTyDigQaM78Tsh07WXDfYGmOv4DeIQfSZCkXnamSD4=;
        b=m+TX/HCyvElOWXa75A8ZPqxccGorBGaZGg4Rm5VQPasfKeBeG4wfH7n960rwHSSuR0
         +DsHSleHdljUL4I+ixvClprMKGUrXmmJK8wJJcggQXqvL5z2Rk1Fr5e8ZKe5t6KQN+Sm
         s04K5nX8a8RdmHYkfgQYZ4szyddNELASoRXuYD3QcLspM4WtKYDN+Nx+Y5cL4F/FY8OC
         WkPpyVGtGw0r19QzEwczfpoMjY+jOj3VpcrwDXYQ2/+0uQEnMHrMpW1rZ2SHG8FaGyNJ
         PsI6BH7za3DZq7nWHd08afusC1/CEWseBdyNkoipwX+BE6yh56PFh+puVwUtWWqXwX8K
         uJmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZDxUk8bb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s22si525420qte.440.2018.03.20.06.32.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZDxUk8bb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHMy-0003Ns-59
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:32:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyE5S-0004bx-K6
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 06:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyE5R-0006Ke-Vg
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 06:01:46 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:40418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eyE5R-0006Jg-QP
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 06:01:45 -0400
Received: by mail-oi0-x244.google.com with SMTP id c12-v6so809797oic.7
	for <qemu-devel@nongnu.org>; Tue, 20 Mar 2018 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XvTyDigQaM78Tsh07WXDfYGmOv4DeIQfSZCkXnamSD4=;
	b=ZDxUk8bb8XElSFR/2tq0BRGDyD2D3RkbD5b5Y/JbjmeSMUY8kDD7K2TATqWSeRcRfy
	12yM3lnlnW9TMu3UgR5VuIweWzTeP0ytvad/6Mr+mwLwJNMwGlubAYrTbFZ20zyVX/vH
	V2yQCn3EZiMcEvP/lnyVVET+Lg2vfmaBfoihc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XvTyDigQaM78Tsh07WXDfYGmOv4DeIQfSZCkXnamSD4=;
	b=RoNcF7mTP291F8fKUEFzntZ1FJaws404Ndj6JxyyChYLD7xCez/prjlydIV+dgQjHi
	ixzfNZqOALWpTyeDOAZutEONNb+xvav78nlnU9LgFvVwYxjdqeIgQLIlyzG/pG9iV5CA
	8wTnJOdqJWzWSKv7T5DIlNM57+kaa6KoiabvSzxjzJl7RqKLQ86H8cHaL0XY/15D757E
	RwCYmFOXkkW/ZxAUZlWakLBC9uf7+00OQ6S/uKmKIbJJ7Jx7GUuJIh4OEjk7/4TVAQxJ
	6oPkn+ZmE6p2D6GppXu0T1Ymziqg9HuznAdU36NCdxtiNedeBQ/lW5oYHZyBE9RRIzzR
	5nkw==
X-Gm-Message-State: AElRT7GPkCUq8VRYj9qONoHA5b5MBwODWO1DVPiXePYPPvEXJ3/TA2A1
	2i2dSsUfXOavCVr9wzlnfSRQahLdI/BjHVfU1S4Ukg==
X-Received: by 10.202.178.195 with SMTP id b186mr8294663oif.337.1521540104568; 
	Tue, 20 Mar 2018 03:01:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 20 Mar 2018 03:01:24
	-0700 (PDT)
In-Reply-To: <20180320094406.GD4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Mar 2018 10:01:24 +0000
Message-ID: <CAFEAcA-eoyPokMLqUBcHvEgp=GQnODv3r3A_9LRkc=8do6ea1A@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:27:42 -0400
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	kvm-devel <kvm@vger.kernel.org>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Liu Yuan <namei.unix@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Stefan Weil <sw@weilnetz.de>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	Qemu-block <qemu-block@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x <qemu-s390x@nongnu.org>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GZ3Rhc7Me4+o

On 20 March 2018 at 09:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wr=
ote:
> We can follow what autoconf does, and add a check to configure to see if
> there are generated files left in the source dir, when configuring with
> builddir !=3D srcdir, and exit with error, telling user to clean their
> src dir first.

We already do this in our makefile...it just doesn't check every
single generated file.

thanks
-- PMM
