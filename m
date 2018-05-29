Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3462502wre;
        Tue, 29 May 2018 04:41:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIosERl6BYsaDZ849wlLMRVfqyQCtWbYTqdskyfWCMFsyb2Y/na/uCPvM2+S5WeSawhElPT
X-Received: by 2002:a0c:f9ca:: with SMTP id j10-v6mr15447654qvo.36.1527594072473;
        Tue, 29 May 2018 04:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527594072; cv=none;
        d=google.com; s=arc-20160816;
        b=W/+5TqBzMw1HixuPqhMUhPj4/jGISUTPS3tdxcTFIlTnEsi7VB2twTRT/PyLddb8xx
         NTBNw+9WPYiwDKzgPG+xWRmHrVcWbEORfHGhAYDS7rtMh40Eh15Kf/KwDZ7xhCuLRARd
         j7+rDpk8q6oTGCzAtSi2fBpTddI5HYMA9axoR6B83FAfum48+y/fL0o59HWZQEv2+him
         0okzL5m7Fqqyp1k4fHZYPAWGhGGygBDeQ7In51TMsj7AWi6rGsiKNMpdvUxWesdc1Rne
         i1oi/T5DsgGaqlf0anfYe6VmTTfATxUuDIU/XWcz+S4LPZ/2sS2HxT2S2wB3up6GCqZV
         CWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=klTCe/rph17QYtfDWjMY7ZbVpNzi64oRPrdTbJ/sqNM=;
        b=q/qSTmHhP9lxor+STfOXBT/S7O7amgwNtmycAiPnfKZaAwqyje72o78NjfmlQ8btwm
         mS01jyxAL7TD9ajg8EnaQxuVK4it/JQK0ppDyTrrlhaKcBn3i6Uvvmnl2myGv1czkccH
         tavXoOyDC2nB8vO3JL94/dmOzI9VAK8xjMjxHyKIu7sY7eWRc51jg3cYuqXS0Ji6X3GB
         6AshIZMwuSH0ge9XicmhQSdnNXpR51RAjq8vQ4YFqU7uTF+0wx8OQYQCcBnvFostP4Rf
         nu6K2iBU7nbthqOm1DPZCOsIYcYndmyINyA+qxwRuOdlHyaHMUAcrfQh1sKc3xIgUrRm
         MY6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p69-v6si4167049qkp.98.2018.05.29.04.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 04:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNd03-0007S3-V4
	for alex.bennee@linaro.org; Tue, 29 May 2018 07:41:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNczv-0007Rt-Le
	for qemu-arm@nongnu.org; Tue, 29 May 2018 07:41:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNczs-00042p-AM
	for qemu-arm@nongnu.org; Tue, 29 May 2018 07:41:03 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34294 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fNczs-00042e-2W; Tue, 29 May 2018 07:41:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12562401EF09;
	Tue, 29 May 2018 11:40:59 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C636200A4B6;
	Tue, 29 May 2018 11:40:55 +0000 (UTC)
Date: Tue, 29 May 2018 13:40:53 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20180529134053.1ea9f46d.cohuck@redhat.com>
In-Reply-To: <20180528232719.4721-10-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 11:40:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 11:40:59 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 09/21] target: Do not include
 "exec/exec-all.h" if it is not necessary
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, "open
	list:S390" <qemu-s390x@nongnu.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Laurent Vivier <laurent@vivier.eu>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ASq+PUu7pLvY

On Mon, 28 May 2018 20:27:07 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Code change produced with:
>     $ git grep '#include "exec/exec-all.h"' | \
>       cut -d: -f-1 | \
>       xargs egrep -L "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GETPC|si=
nglestep|TranslationBlock)" | \

Hm, does this expression catch all files that need to include
exec-all.h? The resulting patch seems fine, though.

>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
