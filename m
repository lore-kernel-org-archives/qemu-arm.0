Received: by 10.28.91.67 with SMTP id p64csp5053751wmb;
        Wed, 21 Mar 2018 06:15:42 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/03WohZ/Mk9O1IJmfsTh1IK7+4HGoJN0rzpPeodx4he/OdDB4ZHM9mORVY32bEs19Pdtp3
X-Received: by 10.55.49.8 with SMTP id x8mr481069qkx.66.1521638142424;
        Wed, 21 Mar 2018 06:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521638142; cv=none;
        d=google.com; s=arc-20160816;
        b=klr95pqWl3SSdZoCCLqJpSd2AxfkSsZNHXK9GSBzzv+f5bBckw3ev8OtqwYftHVc/5
         BpINJXrQT04Rth1RrhRMerCq0Sd6zAEkSXOiIGZWXxAC77CdGvjqWAXzY5lJq+sAsNa3
         cTCiJGN/fMgcoNZzl5IsK9P5mCzR4lpqNgmPPXe4+EVHVukSbRO9WQBePy6AV2QoqMm6
         xxXivbKMhFB0IReNO8buIS8mmS0KdFh8IiFDs9p4oFAgkDKm1Sioza8yNgYOIOBAOgYt
         T++oVV1BhcWl/2ipQF2CsqSJ1CsaGm1sL4bHwZHUrEeR21Dz3n88l6mT+dM69tQ5kWUt
         Sl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=MQ0X0qhsdeIIwyGuz55r+pPvEg9fNh2JVKcDiQkqB2g=;
        b=mkB9uREVsPvp4pIRo0Xb1wiLocsdk1CTiQUOeHioSm76rbH0fZV9N2f26I9XE/UOdQ
         evhaFpyhwpPPgFcHb+CWdLXGX5BHnk3zwMs0eegTDzMzHNURIyXGjqN89sm1CZ/X9ZR4
         RKyndB/P2MB6sAsKvAWuw3WmdyDjMPXFS1yXwmCQylANVgX5P6trnhkhCVWzREhKFiqg
         h+ynkUVp5vTGy7+GDYjyWgRDhG9pUtrqAnkvsISveD7yMcJAc0Zq+dfPnOB/JELa3R88
         2bVGDb0bGkPFNCD3ubFRBPQHKP+DfBsOZj4+rDPlmLi35z3aNraL5QBOZUfzfDhD9ieJ
         zq1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g12si912454qtg.444.2018.03.21.06.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 06:15:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eydaf-0003Rv-Uf
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 09:15:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1eydaT-0003OB-Qi
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 09:15:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1eydaP-0007mk-QI
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 09:15:29 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:43468
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1eydaP-0007lk-B0; Wed, 21 Mar 2018 09:15:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id B81C9DAB74B;
	Wed, 21 Mar 2018 14:15:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xgXFDEqWd3_B; Wed, 21 Mar 2018 14:15:22 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (pD9E011F5.dip0.t-ipconnect.de
	[217.224.17.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id A5064DA4CE2; 
	Wed, 21 Mar 2018 14:15:20 +0100 (CET)
To: "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320135548-mutt-send-email-mst@kernel.org>
	<459fa95d-8f0a-22fa-80fb-4af22ccf49b3@redhat.com>
	<20180321150543-mutt-send-email-mst@kernel.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <7890493f-cbda-f56a-54a1-448cde871a14@weilnetz.de>
Date: Wed, 21 Mar 2018 14:15:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321150543-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-arm] [Qemu-ppc] [PATCH] qemu: include generated files
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
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
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Jiri Pirko <jiri@resnulli.us>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Xie Changlong <xiechanglong.d@gmail.com>,
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
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0yCG4OnqoW6S

Am 21.03.2018 um 14:08 schrieb Michael S. Tsirkin:
> It still leaves us with a host of problems e.g. the problem of stale
> headers in the source directory.

There have already been suggestions in the past to forbid in-tree
builds. Would it help if configure would refuse to run from the root
source directory? At least .gitignore could be much smaller then.

Stefan

