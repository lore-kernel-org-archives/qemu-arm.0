Received: by 10.28.91.67 with SMTP id p64csp4741253wmb;
        Wed, 21 Mar 2018 00:17:20 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsFOFHyQrTVhfNSBkUW12WXqYG+0Y15tswcQLJuWIpA8kBFDH1Ektmmiz4B451lV683tlk8
X-Received: by 10.55.87.134 with SMTP id l128mr26592356qkb.162.1521616640400;
        Wed, 21 Mar 2018 00:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521616640; cv=none;
        d=google.com; s=arc-20160816;
        b=KcOYUwySLQA/8//E4rnhPV+fg5KL9WummRChsdd30e+Fi01cli3l+VtHCSrrzyHKLN
         BHKKXuGeBhpPkubS8nrwtsILC8/WAje7sTRvmoFVve/Yna1dYawEQb4+WeWhX8slqhlO
         4r4t8XLoF/24AR2Ea9AhvzJu3P+3wlPRC6lRvT2h2kSbA/WWiXaLOh9jXyzNuaTwJaSJ
         4sX7o1mZtiS0ERrztrO3uLWiXLj6k/LSXRQNzh2gRh9lFNMFA9z0VMiczyIeKlcccVg6
         drpm4UOHhY9odLRj0rzHBIXKSrUCp40KCrbZmQSWU1YJuWhQPE8ntulPGhxLsb1sVKYS
         ugXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=pFJxu0eIzNa7M0Sv0NDuscMB3+nFi8n4dBqk5ksSSWg=;
        b=XVmQL/Gu9vLsf6dM0kKmu5QAwyeyL17hPn0jmS8Drikh/cVb/WaKL8dqaoJDdPoD+7
         3Ky8lAG2CWXumwuJeDyltRBunjz3zVAzchhB8NbEpYQGGMgE431NZOlsAcz3oowAzU5r
         y1s5Amf9rSDkB9tY+/DksZFerfV50bW0YlAKqQdx/TeV2W2QwyeRTuMSLHAx4IdyWRE2
         KSaqzm+HUM8n4maiqoMkTBUjuv4dRCaxnkckWF/or4EJfq6Ns6hSa3WRrBEeI6I/zEu0
         VukoqaLqzH7QXqFk/jfmaZXu4PgxPlcOf+cvV323imRv6VEyX3OfkvzE0BOFVAiLJTMa
         B2BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x5si2116274qkl.148.2018.03.21.00.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 00:17:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyXzr-000653-R3
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 03:17:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eyXzW-00064c-W4
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 03:17:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eyXzU-0005yq-B9
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 03:16:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49910 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eyXzU-0005yb-5b; Wed, 21 Mar 2018 03:16:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C7118182D16;
	Wed, 21 Mar 2018 07:16:50 +0000 (UTC)
Received: from [10.36.116.188] (ovpn-116-188.ams2.redhat.com [10.36.116.188])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FDEC10FFE6A;
	Wed, 21 Mar 2018 07:16:02 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320135548-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <459fa95d-8f0a-22fa-80fb-4af22ccf49b3@redhat.com>
Date: Wed, 21 Mar 2018 08:16:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180320135548-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 21 Mar 2018 07:16:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 21 Mar 2018 07:16:50 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
	"=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
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
X-TUID: 9sHyXd7E0O22

On 20.03.2018 13:05, Michael S. Tsirkin wrote:
> On Tue, Mar 20, 2018 at 09:58:23AM +0100, Laurent Vivier wrote:
>> Le 20/03/2018 =C3=A0 02:54, Michael S. Tsirkin a =C3=A9crit=C2=A0:
>>> QEMU coding style at the moment asks for all non-system
>>> include files to be used with #include "foo.h".
>>> However this rule actually does not make sense and
>>> creates issues for when the included file is generated.
>>
>> If you change that, we can have issue when a system include has the sa=
me
>> name as our local include. With "<FILE>", system header are taken firs=
t.
>=20
> Are you sure? I just tested and that is not the case with
> either gcc or clang.
>=20
>>> In C, include "file" means look in current directory,
>>> then on include search path. Current directory here
>>> means the source file directory.
>>> By comparison include <file> means look on include search path.
>>
>> Not exactly, there is the notion of "system header" too.
>>
>> https://gcc.gnu.org/onlinedocs/cpp/Include-Syntax.html
>>
>> #include <file>
>> This variant is used for system header files. It searches for a file
>> named file in a standard list of system directories. You can prepend
>> directories to this list with the -I option (see Invocation).
>=20
> This is exactly what we do.
>=20
>> #include "file"
>> This variant is used for header files of your own program. It searches
>> for a file named file first in the directory containing the current
>> file, then in the quote directories and then the same directories used
>> for <file>. You can prepend directories to the list of quote directori=
es
>> with the -iquote option.
>=20
> Since we do not use -iquote, "" just adds the current directory.

So why don't we simply switch to use -iquote instead of -I for adding
search paths for our own headers? We then would get a clean separation
of QEMU headers from system headers.

 Thomas
