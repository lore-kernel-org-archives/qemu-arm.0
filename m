Received: by 10.223.172.38 with SMTP id v35csp2101351wrc;
        Sun, 24 Sep 2017 22:37:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAzQfN/gIKg9SAeQ+RUY6JKmGl9C0hSfPORfT0OL0M77ePqMEggPDsqWc7zGYAtOoNR1Ch+
X-Received: by 10.55.36.3 with SMTP id w3mr8849296qkg.284.1506317834213;
        Sun, 24 Sep 2017 22:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506317834; cv=none;
        d=google.com; s=arc-20160816;
        b=tytIhX+Ed6WWMe9tCjXOVPjmrg92e8GLhisPPtiXNoqspdx6pE9Ex5Z0LmkDfDpXio
         Y+mq9vAG1BNM3mJlm1WEbDcWShCBgNB7X63dVdAau1c4ucO5EfV++tGs7ZL+/xxM14Hj
         LAY33MUZI5EY/b2eMK85Fq5v7y5t8nZ+txY0F4sfT6jR4/8OSkBmVqb0raqECHrkDNkq
         qEJqBzHb1wd/feNGwD01pH01gBU9sBtFNnFkFlEbR8nQLDlJwZZLj2GnAGNdtZtMdK5X
         4TdULM3RO/tjh0IiJ1W5oMinT2gLz0aAfDln8z6Vq/wvfMkHvr8MSX/rvpD4mEL3qjCW
         /qwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=xhpOxtgThe+jw+GEZYouYsgKpENO7oqC1FnL0HX3S9o=;
        b=QFeKnWxGN/CmTjs5Vbzr6QghUn2n06UcfoCL/hIkL137YBPXSH6aa/Ua3L7G95wcU6
         qu4AlmoElRa9uG5QwF1tG1QbUBc+HD0czaDD46XX1ywql03YErjtJHAi+c6UhunmAmeH
         0/wZettklchaCDpygjVchn95myTXLXm0pbapEujIIcLkXBwHM+3y0LisedkJSHqHiA76
         CZl368iUEfOshP67qlBjpqjXKq61PLLvWEGUNbYFXcpeKpVEdPKeY5jJWRruXfNvTKEx
         56QZCZQYpdHEIeglOpYUvb0B4dLVUWHnJlBZHRnJLUCeNAVh7V/jL8e1kWYjoBKn5nvt
         3Apw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s73si5078634qkl.84.2017.09.24.22.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Sep 2017 22:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwM4t-0006sz-Sp
	for alex.bennee@linaro.org; Mon, 25 Sep 2017 01:37:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwM4i-0006si-0e
	for qemu-arm@nongnu.org; Mon, 25 Sep 2017 01:37:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwM4d-0005Gu-5U
	for qemu-arm@nongnu.org; Mon, 25 Sep 2017 01:37:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dwM4d-0005Ej-0F; Mon, 25 Sep 2017 01:36:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 080045F7AC;
	Mon, 25 Sep 2017 05:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 080045F7AC
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.76] (ovpn-116-76.ams2.redhat.com [10.36.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D7495C545;
	Mon, 25 Sep 2017 05:36:47 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Yongbok Kim <yongbok.kim@imgtec.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Jason Wang <jasowang@redhat.com>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922160111.31885-9-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <caa7c8e1-586d-9d78-a69e-7e32ed2ab9fb@redhat.com>
Date: Mon, 25 Sep 2017 07:36:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922160111.31885-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 25 Sep 2017 05:36:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 31/34] hw/net/rtl8139: use TYPE_PCI_RTL8139
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TCAaMI0UOV2P

On 22.09.2017 18:01, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/net/pci.h    | 1 +
>  hw/arm/realview.c       | 3 ++-
>  hw/arm/versatilepb.c    | 3 ++-
>  hw/mips/mips_fulong2e.c | 3 ++-
>  hw/net/rtl8139.c        | 7 +++----
>  hw/sh4/r2d.c            | 5 +++--
>  6 files changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


