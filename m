Received: by 10.223.172.38 with SMTP id v35csp2202803wrc;
        Mon, 25 Sep 2017 01:12:57 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAPnlP/nn/FXHD7+/hhp5uAco7XfASDZdLcKVnt0mkPO4gmdqpWlwhJdAC2dD1Bdhbsa7Dc
X-Received: by 10.200.9.115 with SMTP id z48mr9983774qth.141.1506327177876;
        Mon, 25 Sep 2017 01:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506327177; cv=none;
        d=google.com; s=arc-20160816;
        b=YjZILw/W4JSl6uhtlwjduP8wL7TlYxzeJm3pwNXPx8+BiSZDbSodEWsTI2ef5kOYUC
         WdED22vub8qCWbx39Cu9LUza4pOqpIsxaBaITO4T5Z00BVuD+9jILUgFvaXnxoEBn49k
         K8yRYyDQ+bdCx6Np2WuGGSTRdwfWXqD59plPJB+IxrilVbsXjMFuIj+CGoRB4GqoHXQD
         dBZaxJcM/yqNFbNGMy17JFnTYo7ZM1C7quwtwhN1Ovqq6ibSBgtg+hJgJhdewjQEJ8oG
         jdDHz3Nb8Ns8IdQL9QAI+W/o/S4t1FE/FVxqwXpGzIONbdwevVWrrWnltYfG9kC34nk7
         iFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=OA46inyMgghlxDU7FjBqo0pWAzeTIGyz8w0mNhkLbaw=;
        b=qXkGMEe9YjEikqz0XgkxVGiwGwCJ3NFqeggipfZkYBnAk6ocq6IxQhdk1IPB0mpXA2
         XAGIendQhXt/+SFZSdHOZflr0CxmUCupTAJ58/C77GWBbdQu+KKDb0nVRR+9PSk7gn77
         rSgvyCZcaewQ7NsaOHCH0+lqLRhHYlt9ZseNeN/uhnDFnAjdTkpEfpkPOHmAmsDT1n8N
         xQql84b15sNm+1Q52l3k3e38BqHW1ALlsAP6VEqSPcO2y6xb6FzOP8/jlSycJLVzb3Un
         ELEqSo4B948CCeGFoqcsmfbTNKg5Lw8PjAtRZ3N+Sfr3CpuM3lBuyYvbeDH1XTUhtAXn
         HW0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p91si5619512qtd.330.2017.09.25.01.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Sep 2017 01:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwOVb-00016e-J0
	for alex.bennee@linaro.org; Mon, 25 Sep 2017 04:12:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dwOVQ-00015B-QA
	for qemu-arm@nongnu.org; Mon, 25 Sep 2017 04:12:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dwOVP-0000r1-UD
	for qemu-arm@nongnu.org; Mon, 25 Sep 2017 04:12:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47428)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1dwOVP-0000qX-Oe; Mon, 25 Sep 2017 04:12:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C54A680F9C;
	Mon, 25 Sep 2017 08:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C54A680F9C
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 164746C1E0;
	Mon, 25 Sep 2017 08:12:34 +0000 (UTC)
Date: Mon, 25 Sep 2017 10:12:32 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20170925101232.4d5dd45c.cohuck@redhat.com>
In-Reply-To: <20170922154014.29350-6-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-6-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 25 Sep 2017 08:12:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 05/34] misc: remove duplicated includes
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
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Marcel Apfelbaum <marcel@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: guvHzbmknb4A

On Fri, 22 Sep 2017 12:39:45 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> exec: housekeeping (funny since 02d0e095031)
>=20
> applied using ./scripts/clean-includes
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  accel/tcg/translate-all.c          | 1 -
>  exec.c                             | 3 ---
>  hw/arm/spitz.c                     | 1 -
>  hw/char/xen_console.c              | 1 -
>  hw/core/machine.c                  | 1 -
>  hw/s390x/css.c                     | 1 -
>  target/openrisc/exception_helper.c | 1 -
>  tests/vhost-user-test.c            | 1 -
>  util/qemu-sockets.c                | 1 -
>  vl.c                               | 1 -
>  10 files changed, 12 deletions(-)

> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index 75d4f301fb..3938fa5909 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -13,7 +13,6 @@
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
>  #include "hw/qdev.h"
> -#include "qemu/error-report.h"
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"

Acked-by: Cornelia Huck <cohuck@redhat.com>
