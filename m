Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1562322wru;
        Mon, 16 Jul 2018 07:20:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcmd1Yo9HHhCrangYG6Yztly/qzX9+NApsU3cQPASRwtlqW94pDc9W8AimytTUZhLLN5ZXa
X-Received: by 2002:ac8:1928:: with SMTP id t37-v6mr14824819qtj.327.1531750855653;
        Mon, 16 Jul 2018 07:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531750855; cv=none;
        d=google.com; s=arc-20160816;
        b=axjUNFANAuSln9aZqZ7Q7vtyp9qWDa2k0dgZv0gLwV6SynwgPOoeGABq/AwFyKF+oB
         b23Tfe8C4ukS5kPdsR6/ZQuVFgspJIs+d9DPGes7jCvaSCNJZx/VznBlbqCRPQr1HZj6
         f7Jt5X33H2m9JhP4fAs9xeQv23GXa208ZM9wa66aDMolL6N4D18sTtaKDkjaqPi9oWmd
         7Igb08MrHObZmspXgOmY00m/oasK8FjICdePtFDJHzY2NdqWVOVN5gCANnmape78bj7T
         liEJccI9z8PoW38GWhz4giorgqsiEd/pmZAqlwZpQpNYN2lK3OoFr2JO4nxQ5AtBQBwd
         sNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=CN/bxBs5M1gtAvsCO8/pB/z15xtTAqPQetXGGDiwUwo=;
        b=YXf7G3YgmWI+Wvz4af1ANIcLhw/fmQPlupgKGNyrrTGY7fv9dgbdwvuG4ZKfAEwudB
         FZKyhuvR+QWpNz66o0JAkeLTHggRdQgPpntLP4hIvlhAYrZXa8WVe52T+qkjBPBLUWJs
         xiux1B2PgA5tFpAjRnBLeYqrATgUp0yvg09ngcutlk885RdAJoY0C/l6FQ/0sTgdagpg
         Qa5H0KrgUqgm7VHku8Lw94ef/h2c6p/GOH+P1OqEgvYiDa2ypx6mrVHu1P/G4fyieGt3
         M0i9mEebmOaFG2kvW5lY3x0Dh7Y1QU/Pj6JbyyFgoHPpjw/Ycecr7sNvjOwkiyoRylSc
         jcDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12-v6si171758qkf.333.2018.07.16.07.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 07:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff4Mw-0003QK-Vo
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 10:20:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ff4L1-00025l-Iw
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 10:18:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ff4L0-0004up-H9
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 10:18:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52442 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1ff4Ku-0004rJ-CD; Mon, 16 Jul 2018 10:18:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BA4E401EF11;
	Mon, 16 Jul 2018 14:18:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-125.ams2.redhat.com
	[10.36.116.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30D10111AF01;
	Mon, 16 Jul 2018 14:18:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E38A51138529; Mon, 16 Jul 2018 16:18:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1531415537-26037-1-git-send-email-thuth@redhat.com>
Date: Mon, 16 Jul 2018 16:18:45 +0200
In-Reply-To: <1531415537-26037-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Thu, 12 Jul 2018 19:12:17 +0200")
Message-ID: <87zhyrgt6i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 14:18:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 16 Jul 2018 14:18:47 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH] hw/arm/bcm2836: Mark the bcm2836 / bcm2837
 devices with user_creatable = false
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9tpz4CC7CLhx

Thomas Huth <thuth@redhat.com> writes:

> These devices are currently causing some problems when a user is trying
> to hot-plug or introspect them during runtime. Since these devices can
> not be instantiated by the user at all (they need to be wired up in code
> instead), we should mark them with user_creatable = false anyway, then we
> avoid at least the crashes with the hot-plugging. The introspection problem
> will be handled by a separate patch.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/bcm2836.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 6805a7d..45d9e40 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -185,6 +185,8 @@ static void bcm283x_class_init(ObjectClass *oc, void *data)
>      bc->info = data;
>      dc->realize = bcm2836_realize;
>      dc->props = bcm2836_props;
> +    /* Reason: Must be wired up in code (see raspi_init() function) */
> +    dc->user_creatable = false;
>  }
>  
>  static const TypeInfo bcm283x_type_info = {

A more common way to phrase this is

       /* Reason: needs to be wired-up by raspi_init() */

If you you expect other functions to wire this one up in the future,
insert ", e.g." before "by".

I like consistency in such things, but it's matter of taste, thus:
Reviewed-by: Markus Armbruster <armbru@redhat.com>
