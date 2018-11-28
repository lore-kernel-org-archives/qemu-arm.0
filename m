Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1217674wrt;
        Wed, 28 Nov 2018 08:05:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VuJTztOw3pVGbJkf0u0oY7ewT7P5EV9xJZ3H7tyevu/snc7RwKbyS117xONNDZQn9F6OPP
X-Received: by 2002:a37:93c3:: with SMTP id v186mr34551531qkd.285.1543421153599;
        Wed, 28 Nov 2018 08:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543421153; cv=none;
        d=google.com; s=arc-20160816;
        b=iWCqlqle5vsuIutO/mLi5lZEnYat960WBzgyoPqoUB6uqJ6RHqbhjXK96l0exlFswd
         4osC8dssJLjl94l3+njXUTqYiYUbHshXde+uLOaabycOMla2hGB1l1LUKjBN2OxkzprC
         sk/Qh9zE3+9Ga1bu/EimR/MFgIi2igVVQBpjugcdqO8ZZj6XzuvwLG83APIKxQEy8S09
         ZuUz/FxkF5bvHkIgR/KnZBL2rpQcaGt0xABK1pNXtvFu/nhbSP3aw5Ib1mDXJL3dDZdS
         6bshPgEwFi2SMyL5Bx/rCwEOxsezq5QuISU3xKnzY5LNkOtV8CiSGh/ugfj0FHzX0MXy
         980Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=edJhUT/D+echmAwZaCU0PN6myUXQ72SJ3zUNyPWe48s=;
        b=qLDRx5k04dEaaGrNOQ8G2R69BjTtKbUVjPx+jiBpzBKV355P9jUN5Z3zRSbc6Q+sRA
         COINsPFK9qboxWYi+T80EII8n868SMeF9NXFBFgxr2KbJVafIdgr3BPt4KkQiLtlQfR9
         TQFp5t2WkaPKfN75jmHKdN3xpVo6oJIpl0HQrahr/tWerIJOVu6nZOCFeRJLvJfI7l35
         5Ml1IqY+GDIT3mHsAnjF/VldGKogkzFnhns3IsVWQ9ai7ubJPkyOl5ShBuqDEB73dPlO
         vfWxT557xbbSVpZIVzNHZsprzJ0DixXL7uT50RowEVNHWzoLyt5eXkyTNfHhFS60DA4n
         SVUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g16si893361qtg.304.2018.11.28.08.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 08:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS2LZ-0003k0-1b
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 11:05:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gS2LP-0003jZ-T6
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 11:05:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gS2LK-0002lG-7S
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 11:05:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52260)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gS2LI-0002UF-2o; Wed, 28 Nov 2018 11:05:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C61F130832E8;
	Wed, 28 Nov 2018 16:05:30 +0000 (UTC)
Received: from redhat.com (ovpn-112-68.ams2.redhat.com [10.36.112.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDE056443D;
	Wed, 28 Nov 2018 16:05:28 +0000 (UTC)
Date: Wed, 28 Nov 2018 16:05:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20181128160525.GP24355@redhat.com>
References: <1543399094-2260-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1543399094-2260-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 28 Nov 2018 16:05:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1?] target/arm/sve_helper:
 Fix compilation with clang 3.4
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DYjz+KNmB9w6

On Wed, Nov 28, 2018 at 10:58:14AM +0100, Thomas Huth wrote:
> Clang 3.4 does not know the "flatten" attribute yet. We've already
> introduced the QEMU_FLATTEN macro for this in commit 97ff87c0ed020c2,
> so use this macro now here, too, to fix this issue.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Although we currently only aim to support CLang and GCC, we don't have
any checks for a minimum version of these two tools in configure.

So I was wondering if we actually still need to support CLang 3.4 at all
in QEMU, given our targetted build platforms.

Unfortunately repology.org is failing me in reporting clang versions
for most distros, so I don't have an answer yet. I do see that Debian
Jessie however ships clang == 3.5 and that's usually the oldest distro
if RHEL hasn't got something older.

If we did explicitly check min gcc + clang versions, we could sanitize
stuff such as hacks for ancient clang 3.2 which lacks int128 support.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
