Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp351936wrd;
        Fri, 31 Aug 2018 01:50:02 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYyGaHbTxfLmahkaScXY3QV+HEXoS4Aq24RFwI6AKG4e2rPXi3SUFYq9oRn+ZN8zE8P4JKe
X-Received: by 2002:a37:a357:: with SMTP id m84-v6mr14603450qke.121.1535705402193;
        Fri, 31 Aug 2018 01:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535705402; cv=none;
        d=google.com; s=arc-20160816;
        b=CvTymtt/1sTfpurfnLJYvO27pXg4mRUxp4RE35Hhn5UqpNEPS+B3Za0QVxQujHBmti
         Dzorwpu0fvOL/aoGNrv13gnBvUd30tgtoyGCqeLCSPkjNucVeVwY+/g8scj6UlIwZo3/
         Ky7BGBjbfZNlJLDGVyqvdGctebVg8JbKgAmyh/owOP7OhdcMWmMTSoXutw0/O2XjVtUV
         k/mRwipCotScWRIwlJj8/YT6zHc/PZzomL1LVN4kOUwi+xC6TqJ+rogc7/At/rCCGB0+
         +u4+SB+LFrllZDt4wTxr5BKGoZw2boenAsJaFakaJx4UepwxINybQCacfM0KYLJxWFVO
         2qjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to:arc-authentication-results;
        bh=pSQ4KA6dVIniy8mDiEIt3Q7wCS/I5/L+2KhJdqUcg5Y=;
        b=keBs/ZKy3+UgTzzQgULf8Fj2TwtknsDRTrsW7DO+s0aY5UR72+O38H7eUCpT1FVje/
         9dI4PL+0RlnCCAouQF/8Lc23Hr6eM3PdqcZ417jY9yd2+bEcIvGB0suKkkqkoI/mxumQ
         ydb7dB0AXohXLD1XC/SY2NcwgGSilvuulibQ7Zh1tJRMm8JEhaOc2vS+KFEwIEJsuC2A
         ih9Goyt6AD8DDaLmagf1scb+noaNS1iupb0JvF5Uu54kRCy9mkI5L/yCwHh4PejwLnIp
         n3o9hr4CVektNQZC/k9aGbKjMeCrDpOM3AciOtPV2C4GhB1rzVe50dmA14jkexyOFN+p
         LBPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q82-v6si6573qkl.312.2018.08.31.01.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 01:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvf7x-0005Qr-L4
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 04:50:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fvf3s-0000r7-LO
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 04:45:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fvesb-0005rO-0j
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 04:34:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38114 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fvesX-0005iH-FZ; Fri, 31 Aug 2018 04:34:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6B2740241CF;
	Fri, 31 Aug 2018 08:34:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-29.ams2.redhat.com [10.36.116.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 824CA2027069;
	Fri, 31 Aug 2018 08:34:02 +0000 (UTC)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180622075700.5923-1-clg@kaod.org>
	<20180622075700.5923-4-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <fb6480f3-2c25-bcd1-9586-3ce45b82d6e1@redhat.com>
Date: Fri, 31 Aug 2018 10:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180622075700.5923-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 31 Aug 2018 08:34:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 31 Aug 2018 08:34:04 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v2 3/3] aspeed/timer: use the APB frequency
 from the SCU
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IUsuqV9j+jga

On 2018-06-22 09:57, C=C3=A9dric Le Goater wrote:
> The timer controller can be driven by either an external 1MHz clock or
> by the APB clock. Today, the model makes the assumption that the APB
> frequency is always set to 24MHz but this is incorrect.
>=20
> The AST2400 SoC on the palmetto machines uses a 48MHz input clock
> source and the APB can be set to 48MHz. The consequence is a general
> system slowdown. The QEMU machines using the AST2500 SoC do not seem
> impacted today because the APB frequency is still set to 24MHz.
>=20
> We fix the timer frequency for all SoCs by linking the Timer model to
> the SCU model. The APB frequency driving the timers is now the one
> configured for the SoC.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  include/hw/timer/aspeed_timer.h |  4 ++++
>  hw/arm/aspeed_soc.c             |  2 ++
>  hw/timer/aspeed_timer.c         | 19 +++++++++++++++----
>  3 files changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_=
timer.h
> index bd6c1a7f9609..040a08873432 100644
> --- a/include/hw/timer/aspeed_timer.h
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -24,6 +24,8 @@
> =20
>  #include "qemu/timer.h"
> =20
> +typedef struct AspeedSCUState AspeedSCUState;
> +
>  #define ASPEED_TIMER(obj) \
>      OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
>  #define TYPE_ASPEED_TIMER "aspeed.timer"
> @@ -55,6 +57,8 @@ typedef struct AspeedTimerCtrlState {
>      uint32_t ctrl;
>      uint32_t ctrl2;
>      AspeedTimer timers[ASPEED_TIMER_NR_TIMERS];
> +
> +    AspeedSCUState *scu;
>  } AspeedTimerCtrlState;

This patch breaks compiling with clang 3.4.2 for me:

In file included from /home/thuth/devel/qemu/hw/timer/aspeed_timer.c:16:
/home/thuth/devel/qemu/include/hw/misc/aspeed_scu.h:37:3: error:
redefinition of typedef 'AspeedSCUState' is a C11 feature
      [-Werror,-Wtypedef-redefinition]
} AspeedSCUState;
  ^
/home/thuth/devel/qemu/include/hw/timer/aspeed_timer.h:27:31: note:
previous definition is here
typedef struct AspeedSCUState AspeedSCUState;
                              ^

I think you should not re-typedef here. Either include the right header,
or use include/qemu/typedefs.h.

 Thomas


PS: Did I already mention that I really dislike the typedeffing in QEMU?
