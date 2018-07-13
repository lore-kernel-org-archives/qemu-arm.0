Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1124488wrq;
        Fri, 13 Jul 2018 14:18:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfLDsX9lJNFV4ROiS8Gkiv6LyE8Z4DOb1S3lnihWG07eN9aIZd8Ie4NKvGLnwLxMa/EFGTt
X-Received: by 2002:ac8:5393:: with SMTP id x19-v6mr7182883qtp.402.1531516683867;
        Fri, 13 Jul 2018 14:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531516683; cv=none;
        d=google.com; s=arc-20160816;
        b=oYFtYr5O0Km0iNfILYFhHN6BBs5yvPXJ6QjOXZEK6i3yWjc+K/PgAtgN/FCf2gh/ic
         fee7OydmbiAskGT/GK/WP9p3gxkK14pR5UmSnLdbKKB5E/zeHv2RNnxjxc91IjKxWMhO
         AsqnOFa15HbvICYe3KaxSPRIXZLg0q+Yf6UASD01AgSfFC6UXsptH7nNlTdyKP9tEPtw
         5F7fbaztypsZpSrRQ8/Ns3ZGVGobeb8ndlsDOaF3fwC0bfR4P1L6c9AaikOrlS+7UI+0
         usoZlUXvSVUHcVjNDvTEE0GPLOyBgrkY6cE4jlnALlnCne034xyei7rvgSCTcvw7/P/+
         zkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=QQq5KoZH/ZZn951znuZi0T0iNfr32dSF9WD3UmsHWiI=;
        b=XFX8JLpKHR37eD2G8bZC08X3ID734f7DU0tapgR/GtPhqakqie/oqj0PjDpmwaEaTx
         NpTM6p5gy5zgmA1Z+N8HqpQ30hjwtKQl4ZOPA+ex35/0A1sZ+RFl3NrG5/Dk8jUOdpgV
         ifDMBS6ysAPrJiO+2yAdL4DVGGyAST7oDmofCIgb+xCc+SfHjiVIn2xz8DYdjfrkK6uH
         M8nHjDO/TtTSSFwEBewvy90V0y159M6WT34Wx5JuDb0t+ftjzCaQwvNf34Ac495Tg+ZL
         abXvH0Sa/uZ3rsMZ1PhsmFU58j1gSPj64ld8J4sfKPME3476NMtqlHTVQ3/wBj5Be1fH
         tYHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y125-v6si1275045qke.391.2018.07.13.14.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 14:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe5Rz-0005Ym-85
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 17:18:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5Rl-0005XB-EN
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:17:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5Rf-0004OP-4k
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:17:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55432)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fe5Re-0004O3-Uh; Fri, 13 Jul 2018 17:17:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D5FF307D856;
	Fri, 13 Jul 2018 21:17:42 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AA5C5D761;
	Fri, 13 Jul 2018 21:17:41 +0000 (UTC)
Date: Fri, 13 Jul 2018 18:17:40 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180713211740.GT31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-3-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531470464-21522-3-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 13 Jul 2018 21:17:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 02/16] hw/core/sysbus: Add a function for
 creating and attaching an object
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
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AK6XdT8ZHJU8

On Fri, Jul 13, 2018 at 10:27:30AM +0200, Thomas Huth wrote:
> A lot of functions are initializing an object and attach it immediately
> afterwards to the system bus. Provide a common function for this, which
> also uses object_initialize_child() to make sure that the reference
> counter is correctly initialized to 1 afterwards.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/core/sysbus.c    | 8 ++++++++
>  include/hw/sysbus.h | 3 +++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index ecfb0cf..e2436ce 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -376,6 +376,14 @@ BusState *sysbus_get_default(void)
>      return main_system_bus;
>  }
>  
> +void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
> +                           size_t childsize, const char *childtype)
> +{
> +    object_initialize_child(parent, childname, child, childsize, childtype,
> +                            &error_abort);
> +    qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
> +}
> +
>  static void sysbus_register_types(void)
>  {
>      type_register_static(&system_bus_info);
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index e88bb6d..e405232 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -96,6 +96,9 @@ void sysbus_add_io(SysBusDevice *dev, hwaddr addr,
>                     MemoryRegion *mem);
>  MemoryRegion *sysbus_address_space(SysBusDevice *dev);
>  
> +void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
> +                           size_t childsize, const char *childtype);
> +

Documentation about the reference ownership rules would be nice,
but I don't think this should block the bug fixes.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
