Received: by 10.28.91.67 with SMTP id p64csp5173358wmb;
        Wed, 21 Mar 2018 08:05:28 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvPfVsQ2fjn89XVb8YkpiliNNRf0bEku9VMdQibd77SERGbDc+gbzUGKo71JA8nJEfGW/MW
X-Received: by 10.55.71.210 with SMTP id u201mr13720611qka.255.1521644728356;
        Wed, 21 Mar 2018 08:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521644728; cv=none;
        d=google.com; s=arc-20160816;
        b=Dezr6NqMKoOcA6ArdbuuiAHmPJV/YraubxClTwh6m3WZJP8TO7CKwXakvsYFoAtjyM
         nCvIxoMbX9BRFmfp3bF3eZZZfFiZDrbL91EkMEl1m0yTDXAICJoEw1cElU2dmh3pScz4
         w399qBnV9woPkkLc2JiQ41XsX/sK8q3LIXXRSvDLvkBHpMWj5qRdahNV2JNulwUGVq6y
         Zctz+NkV6QvgF6Rk0EbvNt2zoIV9PwHzsSfVpuUWs1lqwghKUmoKsifC5SBhgNkT3CYt
         vjNzOPgBiIqu64DmMAy18mc7RX3Xd/jSpd+00sSDAJP3Vig13Qvuzq303XDdnOKE9NWQ
         xGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=wzO+VUMvqnp78ZrSxyfajIZ/VnBjo+PHCJ517vwkCDs=;
        b=VDXGN/IgTQWvUN6CeOZ5HgNUpKIf7RE18c+esQ4j5sUAm6qn4sTZ78pxbpQ1TsLDd0
         bWZJ81txhJ2GTk+U0g6sfoXSy7X+bkFRZeA0mhokTJQIraslWUBSjk0+Soo+oi9HkjQ2
         fDfJI3YZThPw0klfkpdRTplqeEiUhhfSXpWfuW45r3JRgZzICWg3a+T5EcuMJvqU0E2G
         8N/4P987O9EV6HXmZgNqKNllUcpXoGCekCh1+sC/Co9q6GqPUKMowyAMX9CZYvBS7Qj5
         D50WtLkTARfA8SRTWEDUkgDU+3kUqy3xPYOkMQ2EumOUu1QBJ06db4iId8vQeVbU8aB2
         9lrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x27si186981qth.297.2018.03.21.08.05.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 08:05:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyfIt-0007H5-Ru
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 11:05:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eyfIh-0007Fx-Sz
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:05:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eyfIc-000337-VU
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 11:05:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47470 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eyfIc-00031Q-Qm; Wed, 21 Mar 2018 11:05:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64D2740704BE;
	Wed, 21 Mar 2018 15:05:09 +0000 (UTC)
Received: from [10.36.117.65] (ovpn-117-65.ams2.redhat.com [10.36.117.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 736DB7C3E;
	Wed, 21 Mar 2018 15:04:30 +0000 (UTC)
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <1521642402-197739-1-git-send-email-mst@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3a819d04-b1d2-550e-7458-4ea7509db36d@redhat.com>
Date: Wed, 21 Mar 2018 16:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521642402-197739-1-git-send-email-mst@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 21 Mar 2018 15:05:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 21 Mar 2018 15:05:09 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
	Stefan Hajnoczi <stefanha@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Hannes Reinecke <hare@suse.com>,
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
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tRlyEVJtkT05

On 21/03/2018 15:46, Michael S. Tsirkin wrote:
> +if (m@^\s*#include\s+"qemu/@o) {
> +    s@^(\s*#include\s+)"qemu/([^"]+)"(.*)$@$1<qemu/common/$2>$3@o) {
> +} else {
> +    s@^(\s*#include\s+)"([^"]+)"(.*)$@$1<qemu/$2>$3@o) {
> +}

Can you explain the changes in the source tree layout?

Also, s{}{} and m{} are a bit more readable.

Paolo
