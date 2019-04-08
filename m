Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3597645wrx;
        Mon, 8 Apr 2019 07:46:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxe12WPfrkhcFL1lI/zQHoVO8XalCx8pMOaAhWMhc0zFKeQZEdQMw8MeGSlDMlo+x70F43q
X-Received: by 2002:adf:e510:: with SMTP id j16mr19673665wrm.259.1554734766385;
        Mon, 08 Apr 2019 07:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554734766; cv=none;
        d=google.com; s=arc-20160816;
        b=vgLIr3UUKuFEqV/9tj/O8kqQCKL8rqztrzQjAtzTdlPrP3WfUf2c8LZ3RnUntQeqQY
         bOmkWeF7fj104fFAG+uIR1iwbgNVZP+D5Uqp2MpDk1r/3b3ZS9Pl1ynV9nXXjNmKLMY/
         94tjzcu/Ctej797jLjk3m2Y1OFtFADSPylOLBW+adIFTYIjxHHqQfti/xM2jJw2zjSkN
         0oYEfsjCYkaZz1XiKq2impyaWUZcRU4TFeVgicic+TRINwIPfzDzT5OMq5k6OT9WMZdZ
         /1tPGzh1jmHeihajJMLE98EXpAhUjTSa/wT+E7pVGJazSVcQpURT0uGr0ontxqLN+vaM
         4Pxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=bh96NFGIHtIj7iKFXAy7RBDv1F6C9pty8ZfZUUno8vc=;
        b=zdKd1eJnC7T3WAQMiabJNCz05+w9N9fztPA68ZWU0WkmwM1xS6grM4orCgCzkd+hzq
         ZWMxN2xQY/rPMemyctuqC9g5ynE9S4+cjagz636M4uycqTbN8YV+wJoSY6+zRNuUKYch
         ZyuKFsePqjgsdAGZUk5XC36d73gYlszhS8DGqJMUj/Fw6T1rZJk2BrfMN7n5Ozq0IlvO
         0zpVjZUMUhMBlayBtaX5wMJbgHkgc+84915tHFnFQ5/pU+pnewtJOckEFaUfYM7NjdXI
         J3XmgRikMFjg68j+1HZkmrrNL5YuWbfbNnlFX6whfMcbVX6R+S5PmVPb/elYX6wKMsBZ
         /zAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si19531991wro.353.2019.04.08.07.46.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Apr 2019 07:46:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDVXB-0004Ez-D1
	for alex.bennee@linaro.org; Mon, 08 Apr 2019 10:46:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDVX1-0004Eo-RE
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 10:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDVX0-0005v6-OB
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 10:45:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53478)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hDVX0-0005uI-HM; Mon, 08 Apr 2019 10:45:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30F23C023D;
	Mon,  8 Apr 2019 14:45:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A92D163F76;
	Mon,  8 Apr 2019 14:45:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 256021138648; Mon,  8 Apr 2019 16:45:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
	<20190204231815.29661-2-philmd@redhat.com>
Date: Mon, 08 Apr 2019 16:45:45 +0200
In-Reply-To: <20190204231815.29661-2-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 5 Feb 2019 00:18:05
	+0100")
Message-ID: <87ftqso8rq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 08 Apr 2019 14:45:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 01/11] hw/arm/aspeed: Use
 TYPE_TMP105/TYPE_PCA9552 instead of hardcoded string
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Rob Herring <robh@kernel.org>, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hlIPra5DxW5N

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/aspeed.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

There's another one in hw/arm/nseries.c.  Not this patch's problem; it's
only about aspeed.
