Received: by 10.223.172.38 with SMTP id v35csp3458286wrc;
        Sat, 9 Sep 2017 16:22:49 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDqipzssugjus54xyucZryoOIq5x8vSHOYc12042tfiEPmJTqz7eqVI3c8ApxBD2zyiteAT
X-Received: by 10.200.39.104 with SMTP id h37mr10575482qth.165.1504999369824;
        Sat, 09 Sep 2017 16:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504999369; cv=none;
        d=google.com; s=arc-20160816;
        b=aW9gCJCNH8iyP+ffhZdosvc4eOe3c3IFy755hPqkWIOTcQbmPz8xq7uxz+l8C3YZf8
         U5jnflR7ImLbeK1KinWKH7Fvf/xROwpsGU4B2KJirMemCcxH1x9u/HHgNQREAvuUcZoR
         U7UZzsKTRhwzTBvw/vGFBnN9juoWHsizlGbFkGYE8teFazFV4I34g/qXUQrxHR7I7GY3
         mad9fwClbBrcxZfOJu1Zj4qfWjJC5lBLWfso4ZgVoSOhxVVLk++F+2QQJV0YN1Sf1MkV
         e/mXsiM1O72TMp0ABJQrvi4sKszHkz3vrPZZlKNSGtNGd2625p25soFLdu14CruzAO9o
         WJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=Ijnys2HwR3e89xYAEXdd0/L/CNA1UXrIRb9Ox/tWhAo=;
        b=lLZa1gaJbAe44copCJ+6Ko1D/AGVErjlqwcqqltmQFhKLvFGee7NO1j4ZpF7Ut/paR
         hDWoQCt5bhexU/WwrAZL1phqnIM4pY5nJzmZoJPbpS1GZYb9YeTlrZkiLLmVBE3mQApZ
         owERwf1tgTAzyAUcfVEy7KjJYncdwMhQMgFMbut31zQPZ4XfF6VSytILa0YERPFfTTvk
         oH7GjZ5ln3OFNlJ25VR7FyeWpMZ7GeotOyzBh08QX11pr3ifth7EefwAPcixx1dw9pYz
         Y7mvd0ZYduqjiMOltnKnj/pDG4V3YtPZDZTjoW3Z5o2Sr94HNsEvEdbG+IpbjtbYQ+Xe
         mM5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e40si5820825qta.498.2017.09.09.16.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Sep 2017 16:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dqp5L-0000Oq-KI
	for alex.bennee@linaro.org; Sat, 09 Sep 2017 19:22:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dqp5G-0000Og-03
	for qemu-arm@nongnu.org; Sat, 09 Sep 2017 19:22:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dqp5B-0008CI-Vo
	for qemu-arm@nongnu.org; Sat, 09 Sep 2017 19:22:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42694)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dqp5B-0008Bp-Op; Sat, 09 Sep 2017 19:22:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30A1883F3D;
	Sat,  9 Sep 2017 23:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 30A1883F3D
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-45.gru2.redhat.com [10.97.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 995F35D9C0;
	Sat,  9 Sep 2017 23:22:34 +0000 (UTC)
Date: Sat, 9 Sep 2017 20:22:33 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170909232232.GM7570@localhost.localdomain>
References: <1504533662-198084-1-git-send-email-imammedo@redhat.com>
	<1504533662-198084-7-git-send-email-imammedo@redhat.com>
	<20170905213152.GG17184@localhost.localdomain>
	<CAKmqyKPWDmVYJceYao7NkD5svWqN_fYbDoUJ4uLNFdAhv+kFwg@mail.gmail.com>
	<20170905221226.GZ7570@localhost.localdomain>
	<CAKmqyKO4yRz3R0BJ+gz=UfLc0d_AoNtEAHn-SNFMzg3xo12D=Q@mail.gmail.com>
	<20170909203014.GG7570@localhost.localdomain>
	<CAFEAcA9iTepyGg17xPB_4XOnoOK6iAPsvOdJg_XLEbdk+dggGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9iTepyGg17xPB_4XOnoOK6iAPsvOdJg_XLEbdk+dggGg@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sat, 09 Sep 2017 23:22:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/6] arm: drop intermadiate
 cpu_model -> cpu type parsing and use cpu type directly
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
Cc: Rob Herring <robh@kernel.org>, Andrew Jones <drjones@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y9Oc9QT+wOpb

On Sat, Sep 09, 2017 at 11:41:55PM +0100, Peter Maydell wrote:
> On 9 September 2017 at 21:30, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > However, I have a suggestion for Igor: making a separate patch
> > that renames the existing property to "x-cpu-model", and using
> > "x-cpu-type" in this series.  This way we will explicitly
> > document the fact that the property is not a stable
> > user/management interface.
> 
> We have lots and lots of properties on non-user-instantiated
> devices that aren't intended as user level configurable
> things...

Well, we need to deal with them somehow, otherwise we have no
simple way to know if removing/renaming a property is really safe
or not.

-- 
Eduardo
