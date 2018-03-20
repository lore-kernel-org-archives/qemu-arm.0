Received: by 10.28.91.67 with SMTP id p64csp4041683wmb;
        Tue, 20 Mar 2018 09:34:10 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsDZMZr8bErqXJqD8qEBQzPsJ1weitlMJp+GKD62SuKAxQa2KLQ67LPG0z/beSj2n+UYV9V
X-Received: by 10.129.237.15 with SMTP id k15mr9885518ywm.137.1521563650321;
        Tue, 20 Mar 2018 09:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521563650; cv=none;
        d=google.com; s=arc-20160816;
        b=zSrzjqEVOHjZhiiU2d6BLMfkO7g/Df6y43Ed3GEFUT4NJOieel8teAx6Q5xqkVKM5J
         sNASc/jbI6Otnuz//VvRKOFUxPRdjbQfv8ARAMAqlXTQLCPs7UdkYTa3VL/eUXpKtdg0
         DrPKTBUfDz2Z++vZAGkopU3vceJnSmfjxfBWFZz2ZWnpaVmv9YJYJujfNL3GIOkmuVVV
         8YhCBSzy184JqPP6GbbKRP8b+htRAJGazmSBnMA2bfbHlH2stjZJDM/aoJcsPVkW2j61
         PbYWYcrM6H8bAjZT28RkJtQbvzkdVlNYKZk/S7TyyI6LtWnXcMcKgBD6NvIP0agJRxEZ
         rA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Rsrh1Mk5zLiLQeLuXwJ1XdsGVAThEio4puoGh7GFL6I=;
        b=0M167oqQFEPs036LtdyF3x5rJps6NNDieygEOtOJq86bqxQ6KY4NXzskfSk92PWr0k
         gzH7ljh/rq0MqYmANzZCNAVAry5v7THuBIdjC+/ef71uHRxv/whdOZfNFAm5rLr7cm45
         hr7tdNAImCbXzhxEJVN1u4cPye+y4dGhqGBqr2GgJK7WTDLbLacSMj5PzTCF0ENSed9V
         YK1Ig/bxlVjumeowh4M2vo8DhjX5ut6yd2ZRxfzxryWZ94ChGRVO1WHgY1e61584753u
         9fAoJE+Dd4tJxepKuX8sJfIyuu0mAVE6kTNn4DG9Euyf7h+we7xYA07I7kw/eWBmuG6e
         wDeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u189si417299ywb.362.2018.03.20.09.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 09:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyKDB-0001p6-Ol
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 12:34:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1eyKCy-0001mo-Rf
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 12:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1eyKCv-0001mm-Na
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 12:33:56 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:33814
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1eyKCv-0001m5-CQ; Tue, 20 Mar 2018 12:33:53 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 2CD53DAB6CA;
	Tue, 20 Mar 2018 17:33:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id IX3_U6A_xrB8; Tue, 20 Mar 2018 17:33:48 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (x52716316.dyn.telefonica.de
	[82.113.99.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 6F73EDAB6C4; 
	Tue, 20 Mar 2018 17:33:45 +0100 (CET)
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <b068cb91-b8ba-175c-40f5-a7c9c8163575@weilnetz.de>
Date: Tue, 20 Mar 2018 17:33:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521510562-529051-1-git-send-email-mst@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, Markus Armbruster <armbru@redhat.com>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Hannes Reinecke <hare@suse.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Jiri Pirko <jiri@resnulli.us>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org,
	John Snow <jsnow@redhat.com>, Fam Zheng <famz@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dlZPmU6Qb77e

Am 20.03.2018 um 02:54 schrieb Michael S. Tsirkin:
> QEMU coding style at the moment asks for all non-system
> include files to be used with #include "foo.h".
> However this rule actually does not make sense and
> creates issues for when the included file is generated.
>=20
> In C, include "file" means look in current directory,
> then on include search path. Current directory here
> means the source file directory.
> By comparison include <file> means look on include search path.


Hello Michael,

the compiler (or to be more precise the preprocessor) works as you
describe it, so technically all include files which are only found by
searching the include paths would be found faster with <> than with "":
the unsuccessful search relative to the source file directory would be
omitted. Practically this will not save much build time because of
caching effects. So the suggested change is not required to get faster
build speed.

Using <> for system include files and "" for local include files is a
convention, and as far as I know most projects adhere to that
convention. So does QEMU currently. Such conventions are not only
important for humans, but also for tools. There are more tools than the
C preprocessor which handle <> and "" differently. For example the GNU
compiler uses -MD or -MMD to automatically generate dependency rules for
make. While -MD generates dependencies to all include files, -MMD does
so only for user include files, but not for system include files. "user"
and "system" means the different forms how include statements are
written. QEMU still seems to use -MMD:

rules.mak:QEMU_DGFLAGS +=3D -MMD -MP -MT $@ -MF $(@D)/$(*F).d

Other tools like static code analysers could restrict their warning and
error messages to user include files and ignore problems in system
include files.

Very large projects often split in sub projects, maybe one of them
describing the API. Then that API headers are similar to system headers
and can be included using <>, although they still belong to the same
larger project. Do we have a stable QEMU API described in a (small)
number of include files which typically do not change? If yes, then
those include files could be included using <> because we don't need
them in dependency lists or in static code analysis reports.

For all other QEMU include files, I'd stick to using "".

Regards
Stefan
