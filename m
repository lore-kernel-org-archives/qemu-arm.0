Received: by 10.223.172.38 with SMTP id v35csp739570wrc;
        Wed, 13 Sep 2017 00:51:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAL9cDAGHRs3Gtn6S6Y23TXqA5Y7GAOq2ki1viCv6b2GA78uwDvNRI6xXOi+1iA6KDCstAx
X-Received: by 10.200.53.168 with SMTP id k37mr23639571qtb.237.1505289074500;
        Wed, 13 Sep 2017 00:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505289074; cv=none;
        d=google.com; s=arc-20160816;
        b=cnjYlttdDqRhSbzUyLqnQkdlvhJAtBvRcGa5wxTw+gkeZoHlfb1W5QstLKLo20tvwS
         ifF5FhLdDb7rT2s4BwHLEOpSDoW69NgJ8Gw666Zd2w5hk0Py52H/N/c8Z84S1rHVJyTk
         xHA3Yfs1+DA/4PJELQPa/wJRp1l28nSpjQtL4x8yzC2a5BDV6NVZoaWjd6NJIlPW42sS
         UQIWDdKcGfKRhrdzfQEZUZtXSbCHI99m1HGyVTtOoUvs61c2F8zQFSoOtVYT/F3PDIoY
         YZZUOIM4umm6NnkGkYU2W2Ss9c0AG7D1dF4w9GNjxnhPr8pLFraqUPQsx75RN2d1+dB4
         FmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=4+95ihrzqIyKkRRF7o68SdEi8PswLDoT+XB9yOwetHQ=;
        b=KC29Uoc01VDu3ZhS9cpyMFCEuwCVcuzTMK41UH2WnY+nhbMlyQsrVW5+0lQLQdEI8S
         OwtlMSQEoxyU3EJEKQcwVsmRiSf+GexJKUoC2WHd2yVH4fO+oSc8Lwwn3FW7zle0iHF2
         t8Db5JSplGK1f+AP7gqjOrxNmGXpyI76DCZeypKsMtCdRUXXroYkBuR2yhClUG5IbbfB
         aYCenHSnl6S2uJ8wHGbzkr2t0qvMy2sx77KN/j2O7Yxbod7yMuaDpj38bZu/RZuwF3vf
         mOWVXh/VH2VENF2q621enTGehl/Om3g+bfZNnsaNwMVHCjYBWRtlAJ02ajDUNSQvcuGq
         4jYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q46si1601960qtq.235.2017.09.13.00.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 00:51:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds2S0-0004D6-8z
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 03:51:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ds2Q5-0002qk-Gg
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 03:49:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ds2Q4-0005hC-MU
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 03:49:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46420)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1ds2Pz-0005Yy-Ji; Wed, 13 Sep 2017 03:49:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91B7580F7A;
	Wed, 13 Sep 2017 07:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 91B7580F7A
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 350B517591;
	Wed, 13 Sep 2017 07:49:01 +0000 (UTC)
Date: Wed, 13 Sep 2017 09:48:59 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20170913094859.55905d00.cohuck@redhat.com>
In-Reply-To: <20170911110623.24981-51-marcandre.lureau@redhat.com>
References: <20170911110623.24981-1-marcandre.lureau@redhat.com>
	<20170911110623.24981-51-marcandre.lureau@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 13 Sep 2017 07:49:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 50/50] qapi: make query-cpu-definitions
 depend on specific targets
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	armbru@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alexander Graf <agraf@suse.de>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kywQ+r7GM9N9

On Mon, 11 Sep 2017 13:06:23 +0200
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> It depends on TARGET_PPC || TARGET_ARM || TARGET_I386 || TARGET_S390X.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi-schema.json            | 11 -----------
>  qapi/target.json            | 12 ++++++++++++
>  include/sysemu/arch_init.h  |  1 -
>  monitor.c                   | 22 ----------------------
>  qmp.c                       |  5 -----
>  stubs/arch-query-cpu-def.c  | 10 ----------
>  target/arm/helper.c         |  3 ++-
>  target/i386/cpu.c           |  2 +-
>  target/ppc/translate_init.c |  3 ++-
>  target/s390x/cpu_models.c   |  2 +-
>  stubs/Makefile.objs         |  1 -
>  11 files changed, 18 insertions(+), 54 deletions(-)
>  delete mode 100644 stubs/arch-query-cpu-def.c

Acked-by: Cornelia Huck <cohuck@redhat.com>
