Received: by 10.223.172.38 with SMTP id v35csp1407093wrc;
        Tue, 5 Sep 2017 06:13:10 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4VsRtBoewkUjEEc58jfzYdAi269onRZcM3ycS9o741xbAYdA+IJBrT0O4lAm4ipQT7AEPn
X-Received: by 10.233.230.66 with SMTP id x2mr4915178qkl.340.1504617190758;
        Tue, 05 Sep 2017 06:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504617190; cv=none;
        d=google.com; s=arc-20160816;
        b=gLYchUC4d+hqvDlRHodE9A9/+RycegG1bQlxjqYvFOJpYnmH+RrFfeHBqlcC0Hypiw
         P27Q5XFdOK0Fsyoo2JJbbxQP30ayPK3cvok+JfvDFX0H1IGajkLGyG6BbWhYgluJYodE
         q81R+t+mzJPMe0rzV8dohktLORBZ/lMs9Z9yi1D7SdipCrPfS499Cs88kiqQtQqXZJme
         OjzK1n5B6H6Apt//E0sNpzYdWhjbjHevA6XYF1l7TN7jDZvsNun2MhKl6zVHo9ufBh2U
         NYMGsKeRQ1GFttGg+W0ryBrcmBdrKJ0RvslUIFZ2U+GDJLehVQEsnlQPVsVCEZ4D2ZcQ
         YkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=byZFA/dzh+s8eCA7aCuaMS50+cBcQZe4mhi6qcMTLaU=;
        b=c9sH17/lwKuDmOMpK8grl30fhQ/xljHzxd4OeAPtEVfcbGfHsnpGL1ii0bkqO4wDsX
         TmO5qLOOSN+KvciMg7YXcgoHnglB55baJeAchxNo7+13YXc9dNMoSxtFGVfkQz1XycaX
         id6Dxbdg7ib89wIkwFDd4YbdCf2VmQ+fcslQQ5Me9E1ZcyPIii7pSVJHqc6kRYdJvN+a
         XrqlSRg6NJ04IQ0mRtu6WRSRXsV5rDka9P8MWhdNZ5OpuuIP8p7ZQt6DSU2akMWFCSDc
         /rsBijleGOb4FijvGfAg7OvrW3zSBOXMh37i/lkxvyffEC4D5RrdBGiRlk79yzBM7FJh
         hCAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j33si179975qtd.444.2017.09.05.06.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 06:13:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58863 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpDfA-0007O1-GR
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 09:13:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDeK-0006db-GL
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDeF-000808-MU
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33772)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dpDeF-0007zS-GQ; Tue, 05 Sep 2017 09:12:11 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 897A46331E;
	Tue,  5 Sep 2017 13:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 897A46331E
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-97.pek2.redhat.com [10.72.12.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF3CD6A0B1;
	Tue,  5 Sep 2017 13:12:09 +0000 (UTC)
Date: Tue, 5 Sep 2017 21:12:08 +0800
From: Fam Zheng <famz@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170905131208.GV22515@lemon.lan>
References: <20170717023824.18796-1-famz@redhat.com>
	<20170905033501.GS22515@lemon.lan>
	<CAFEAcA9bDh7c5WtUb+2qCFk0baj+=M2VvkYr1HW+1w=jqFRN=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9bDh7c5WtUb+2qCFk0baj+=M2VvkYr1HW+1w=jqFRN=A@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 05 Sep 2017 13:12:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/6] arm: Make use of
 DEFINE_PROP_LINK
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQLwCeQqyMht

On Tue, 09/05 11:43, Peter Maydell wrote:
> On 5 September 2017 at 04:35, Fam Zheng <famz@redhat.com> wrote:
> > Hi,
> >
> > Ping for 2.11.
> >
> > Peter, what do you think?
> >
> > On Mon, 07/17 10:38, Fam Zheng wrote:
> >> This is the arm part that was left out from:
> >>
> >> https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg04006.html
> >>
> >> Make use of the new DEFINE_PROP_LINK, in favor of open coded the
> >> object_property_add_link. The advantage of it is the property now get reflected
> >> in the info qtree output, for a bit more introspectability.
> >>
> >> Fam Zheng (6):
> >>   armv7m: Convert bitband.source-mamory to DEFINE_PROP_LINK
> >>   armv7m: Convert armv7m.memory to DEFINE_PROP_LINK
> >>   gicv3: Convert to DEFINE_PROP_LINK
> >>   xlnx_zynqmp: Convert to DEFINE_PROP_LINK
> >>   xilinx_axienet: Convert to DEFINE_PROP_LINK
> >>   xilinx_axidma: Convert to DEFINE_PROP_LINK
> 
> These look OK, but they've fallen out of the 'patches' cache.
> There's a typo in the subject of the bitband one: should
> be "memory", not "mamory". Can you fix that, add the reviewed-bys
> and resend the series, please, and I'll put it in my queue?

Sure, sent v6.

Fam
