Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2870117wrq;
        Mon, 9 Jul 2018 14:31:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfGO3OQTAPUX6KsSc9hxGYjxjXM9QNM/1zNaLcyYr5Erq2nZbl1V90wTakw8KKx42gYe5d9
X-Received: by 2002:a37:1bc6:: with SMTP id m67-v6mr20059264qkh.380.1531171914935;
        Mon, 09 Jul 2018 14:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531171914; cv=none;
        d=google.com; s=arc-20160816;
        b=LgRjUVodNd4lrBX7e1O30D9LpejIJj48wv92H15/vqJUiLO7gP9qFDrWGIjea1E7u0
         MeRzO7bAP9EsNEwIPWXcSJocrEoySpkck3abSmks7Ak04R1oiXMdGZLnyJV1SoPw5bdv
         T92fTZlZ0rtxv1QgV59lAL2T0dDIXVaTMuMZXy4mp7yCBMIPIlJWTLgIQpAAjGSf0Np6
         23eFZ3KntuBpQ/HwQ5q2nkEdkdDJ9Xw6gtOGfQW2uWb3M5HN0PwXqAnPQgJr30huTPBK
         7i+ugIeHHV4iZ8099A50Tn68XY6Xl2w+7tlfw5hzfYfJWRWwFeXBf756BYsL9vCDfY6+
         2Y5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=+jGGZIu6uF6/A+HSYWeZpfyZeSg5YpnL7gHzSZMR2qk=;
        b=Yr04P+g7jghzCDpGkDRWYiByPsMpI8gG5ZS5Uw5yWlygLCZjd86kb8jk+y/DohHC1n
         bkgnaPqOISJ/SspUsAYk5RgVgWaQgWOA+DLGMv1nSvsNOGejEalU6C4hZsjUju9nJD3M
         4Vdkug+R6EUSc+5BRwVkEXJo3p7zs5ycmOF4m8JBAet3F/gkR6WeLahz7JKExQZGnb7N
         lRatboU9idVZfKKSqmMHTZjVFaXJJG+0X1R2mLFJ15vV4GnPOFINZkhiuBxop4B/5BrR
         6gH5VVP7qwg1anpTVBf5MI4c5NHfxh2ke0abIksMQ47hogMAaaAD3vwCiF10TvbByaQY
         ACMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x186-v6si371640qkd.254.2018.07.09.14.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 14:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcdlC-0008TN-AF
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 17:31:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fcdkw-0008Sr-55
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 17:31:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fcdks-0002eU-Ip
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 17:31:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54090)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fcdks-0002eK-CZ; Mon, 09 Jul 2018 17:31:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FCDE307D849;
	Mon,  9 Jul 2018 21:31:33 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F09E55D750;
	Mon,  9 Jul 2018 21:31:32 +0000 (UTC)
Date: Mon, 9 Jul 2018 18:31:31 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180709213131.GD7451@localhost.localdomain>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531170180-21199-1-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 09 Jul 2018 21:31:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jvoSzXsJwvw4

On Mon, Jul 09, 2018 at 11:03:00PM +0200, Thomas Huth wrote:
> When trying to "device_add bcm2837" on a machine that is not suitable for
> this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":
> 
> echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
>  "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio

Interesting, how did you find this bug?

Running "info qtree" and other queries on device-crash-test
sounds like a good idea.  I will add it to my TODO list.

> 
> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> {"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
>  hotplugged on this machine"}}
> Segmentation fault (core dumped)
> 
> The problem is that qdev_set_parent_bus() from instance_init adds a link
> to the child devices which is not valid anymore after the device init
> failed. Thus the qdev_set_parent_bus() must rather be done in the realize
> function instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
[...]

-- 
Eduardo
