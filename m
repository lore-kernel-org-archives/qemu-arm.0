Received: by 10.25.227.6 with SMTP id a6csp5683768lfh;
        Fri, 30 Jun 2017 07:22:10 -0700 (PDT)
X-Received: by 10.55.142.67 with SMTP id q64mr24997820qkd.99.1498832530433;
        Fri, 30 Jun 2017 07:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498832530; cv=none;
        d=google.com; s=arc-20160816;
        b=EgPgJ012ldhdjXBe3ztY6ot6Wlnwl9zGLZBZe6GvFgX57NoGhY3A9wilalKtWvmQ9e
         jl3grKWWWtYmzqjFGruqJ1Uhiv4yK0sgByrcaRfsASZ62sFXQ/5qMMY8l+iWs9CUeC4f
         LcKIaqZPxqq3Ac758T1vjbgUor4iYKFk918ZoqfYOGOSa2efnQFrzUxYZC7UwqPEPDmJ
         KF04iJPy19TqkX4/1K/zCq/uunHlNQQ7ZrnQiZeDMRwir3hBokrewRJfFnc5RcozyX8R
         FznLXg5tdXHNsqYoYlMJVa7jNRUGrAQy9JxOykCPWai5jFNk5niaruZL2er4eVZXv57Z
         L/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=j6UZQ798OBa9a6MePnCr7BlNjHotnU5q0Y6sLdOBlpI=;
        b=xjrQ12sr+WiJ7OTyP8EdtCCxCXIyicrETQQXx70xQDjRG9PMx60uTACrpaHv3eTb72
         Q92hKsx6f1VpyBobIIZ1+y0kJRSmU5uFU7oDz1IzOwDr3AuP5eiUcB8TwG68SsOYfYHp
         YDBPkSxTGzzlFsWaJkfgbwIGDhAAJNwc9lIK8rueCfkKlSbWzUFM17+Os6oV3waHBHJJ
         Pua6u9nK0tPEiVyfJfRfYi8Zo9Z4OL01bwCK3kwUoXfAo0LPCzVaTqIC0GGWMWtdFAhF
         nl37qlL4gvD8s3IZXXGVPj0dQ1bOO9fJ590mK+VVhsYmJo2R9htEsSjBotgS98s9MMSW
         to+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b128si7483989qkf.321.2017.06.30.07.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Jun 2017 07:22:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQwoB-0002oG-RJ
	for alex.bennee@linaro.org; Fri, 30 Jun 2017 10:22:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dQwo5-0002o4-Us
	for qemu-arm@nongnu.org; Fri, 30 Jun 2017 10:22:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dQwo2-0006RS-RB
	for qemu-arm@nongnu.org; Fri, 30 Jun 2017 10:22:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dQwo2-0006Qt-KH; Fri, 30 Jun 2017 10:21:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6855D49003;
	Fri, 30 Jun 2017 14:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6855D49003
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6855D49003
Received: from localhost (ovpn-12-32.pek2.redhat.com [10.72.12.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDDC8187A3;
	Fri, 30 Jun 2017 14:21:54 +0000 (UTC)
Date: Fri, 30 Jun 2017 22:21:53 +0800
From: Fam Zheng <famz@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20170630142153.GA26114@lemon>
References: <1498734863-164338-1-git-send-email-imammedo@redhat.com>
	<41be440c-e158-fb83-15dd-e9853460d5a3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41be440c-e158-fb83-15dd-e9853460d5a3@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 30 Jun 2017 14:21:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] qom: enforce readonly nature of link's check
 callback
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>, afaerber@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DaXn+r094lnG

On Fri, 06/30 12:41, Paolo Bonzini wrote:
> 
> 
> On 29/06/2017 13:14, Igor Mammedov wrote:
> > link's check callback is supposed to verify/permit setting it,
> > however currently nothing restricts it from misusing it
> > and modifying target object from within.
> > Make sure that readonly semantics are checked by compiler
> > to prevent callback's misuse.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > Fam,
> >  it probably conflicts with yours DEFINE_PROP_LINK series,
> >  feel free to include this patch if you'll have to respin
> 
> Since there will be a respin, I'm _not_ queuing this patch.

I am going to include this in my next version of DEFINE_PROP_LINK series.

Fam
