Received: by 10.80.166.35 with SMTP id d32csp187439edc;
        Wed, 26 Oct 2016 10:34:49 -0700 (PDT)
X-Received: by 10.176.68.134 with SMTP id n6mr2102583uan.160.1477503289846;
        Wed, 26 Oct 2016 10:34:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2si1204021uak.165.2016.10.26.10.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 10:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzS6A-0001OL-Ty
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 13:34:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzRNJ-0004Dc-F2
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 12:48:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzRNI-0007zR-R6
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 12:48:25 -0400
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d]:38031)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bzRNI-0007z6-EQ
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 12:48:24 -0400
Received: by mail-ua0-x22d.google.com with SMTP id h7so7133282uab.5
	for <qemu-devel@nongnu.org>; Wed, 26 Oct 2016 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UHxDRtMShTH3moJRwvuO3dTYjqtdV5Y215n3q4+E1O4=;
	b=iv3DQiDMFibBBVMknrG+A8O3pVZ0Dyb1zufUckfdV5/gowvYuGBevdE9IuU37TJOe1
	4yWb6vYH8zBlDfiz3umnIEo4VJjofEWPF8Sho18WLj2tBf2Hx1zU2ZjOlz9KdXAsC+iG
	rZhrC4y3hVtErEuW/VIjxSZnmndVwUf35cM8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UHxDRtMShTH3moJRwvuO3dTYjqtdV5Y215n3q4+E1O4=;
	b=LnDwbOOiXyoNtrdretbdfMJeOzoOtFiJCULWgDhCkXMQI8LTT1vftGGdgf0DmgbvdH
	gvnyZjcK9PMSVvrXq1ydCINq7YFwBIARbgSHXHqbXMCi36n646na0uvorae5CzE6JuwD
	t5VEcUkOvImVFlSyrdbTibrnyL9ME1TCCI8lLHIsVdJCm/qqfpIAovrDtfCGG7Z4x/9Z
	XHB4W9DzSEQcJDC9FNLLYqhRRg9hIy6GDzYx7XVYITaJg8FAIQzCi2ljH+IefsxzmaxE
	WDMLTalirbXEUIzESHSJcqO3xgCTrmD7Z7ne4gXrPGpUPyjbY6RD67GvTG817Y93pJ67
	Cr5Q==
X-Gm-Message-State: ABUngve6Z3fjxQNDWSsG5dSngNDlN16DWr1MzgOuP+X1w88QDcESecFX/2Q2+7ox+GSjxzvvhC+6mxjqbnCSMQBO
X-Received: by 10.176.3.237 with SMTP id 100mr1729708uau.120.1477500503653;
	Wed, 26 Oct 2016 09:48:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 26 Oct 2016 09:48:03 -0700 (PDT)
In-Reply-To: <1477499426-9550-9-git-send-email-ehabkost@redhat.com>
References: <1477499426-9550-1-git-send-email-ehabkost@redhat.com>
	<1477499426-9550-9-git-send-email-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Oct 2016 17:48:03 +0100
Message-ID: <CAFEAcA9cr63HyXR+USsXJcF5txwJy0t2pw7NenCTHAAH=pRnUw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22d
Subject: Re: [Qemu-devel] [PATCH v3 8/8] qdev: Warning about using
 object_class_property_add() in new code
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tNb/8kU1nkUj

On 26 October 2016 at 17:30, Eduardo Habkost <ehabkost@redhat.com> wrote:
> The only remaining user of object_class_property_add() is
> arm_cpu_post_init(), but removing it may take some work. While we
> don't change it, warn people to not use the function in new code.

This is about the third time I've seen this commit
message go past, but:

  git grep object_class_property_add target-arm   => no hits

So I'm not sure what it's referring to...

thanks
-- PMM
