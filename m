Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1924550wrq;
        Thu, 7 Jun 2018 03:33:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKPPnUC8j2/EvW+iEGKr2RoW3Ze2rkortNhSnewz5/xjUseIlEPnYvPDgWIikC+GJ5Pu5u+
X-Received: by 2002:ac8:1c37:: with SMTP id a52-v6mr1062109qtk.411.1528367609414;
        Thu, 07 Jun 2018 03:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528367609; cv=none;
        d=google.com; s=arc-20160816;
        b=rUJa5QycrQTq19zTH2Nmcj2ORL5+N+TwZcdz0rjMznMgTe+HhUQHLraBD8uJFMEzTW
         WMHDmHX74PvxAa+5D2464KECFYIeV2IxXKvlFClmeszqphDNGlf0+E7SW6lbdGmCMMkK
         vx6H/lSxH8uhKJ4rehKM+6drdL6golkLK8BcEsM5uYfPDrNFJJd95QrcEscm3VJPFnP2
         B4GyKk4epzGye+CwAGD51TLZ+1YjgmjMwK1VrCsj7g17A0AnKtp3mvou5RdOxTCVFjQW
         NeoFMMzIdIJci76OUaauXgo3/v7xS9TV/MOBDjdTzp2LRRipdHPp54fX6xPMNn6uP6ay
         5mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=S2+QEyqGdmd7xyieYjZc+E3yxLsNZhX1TNH1QencK3I=;
        b=ntkmKbTZ2F2QRl7/t4bii+BwjckoazBlviavQbYC6oTNHy5X3XSn5q4O/99f/1EKhU
         VrUsB8UpJooN5ylPxVoIlh6LXArRryzsFm7VnqjuFV3AZARjy4RDhT+p58i9ILyBDX2f
         DTQ2B/VKem4TNzpJ4mEbkZlgFUN1cE9xFHWImG1QP6j0b9KoxiuGEn+uiviXw79y1bv2
         heOu34Pgrls6lVQYwRp3dWlUJr8hlCocyGqbDCmA5SkNpttrdyhwnJAxV8fKFwMOzRoL
         JUSAmQSS9iqIhcsLZ05+SYrvZz0nTbniIpdSzP6kEqSbay9rCdv1VHtK8LGDVNQ3ejJd
         rMBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a39-v6si7925571qkh.246.2018.06.07.03.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 03:33:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQsES-0006lB-Sw
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 06:33:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fQsEH-0006jo-8i
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 06:33:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fQsEE-0005iP-4D
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 06:33:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36462 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fQsED-0005i0-Uo; Thu, 07 Jun 2018 06:33:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44ED8C12C1;
	Thu,  7 Jun 2018 10:33:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E71D2026DEF;
	Thu,  7 Jun 2018 10:33:10 +0000 (UTC)
Date: Thu, 7 Jun 2018 11:33:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20180607103307.GI28827@redhat.com>
References: <20180603203412.11033-1-contrib@steffen-goertz.de>
	<20180604092008.GA13674@stefanha-x1.localdomain>
	<CAFEAcA9kdvxa61HNxv-cDhcv07E_NUpwVcSJVYNw4weS3k7nUw@mail.gmail.com>
	<20180604101221.nhvjum467ier3txx@sirius.home.kraxel.org>
	<20180607102455.GD19032@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180607102455.GD19032@stefanha-x1.localdomain>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 07 Jun 2018 10:33:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 07 Jun 2018 10:33:13 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3] qapi: command category to
 stimulate high-level machine devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>,
	Steffen =?utf-8?B?R8O2cnR6?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s/BN38FNfQD1

On Thu, Jun 07, 2018 at 11:24:55AM +0100, Stefan Hajnoczi wrote:
> On Mon, Jun 04, 2018 at 12:12:21PM +0200, Gerd Hoffmann wrote:
> > On Mon, Jun 04, 2018 at 10:29:40AM +0100, Peter Maydell wrote:
> > > On 4 June 2018 at 10:20, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > > Many of these inputs/outputs can be tied to an external UI.  A degree of
> > > > timing precision is required so that the UI is responsive, although
> > > > cycle-accurate timing is not what I'd expect from QMP.
> > > 
> > > Would we also be able to tie them to an internal UI, ie
> > > something that appears as another view in the GTK/etc
> > > UI frontends we have?
> > 
> > Should be doable too.  Basically a display device, which isn't a *real*
> > display but the UI.  Could show a rendering of the board, simliar to how
> > web emulation environments are doing it.  LED status could be rendered
> > directly to the board.  A virtual mouse could map mouse clicks to button
> > presses.
> > 
> > Doing more complex input that way (say a slider for the temperature
> > sensor) isn't going to work very well though ...
> > 
> > Sensor input in general is pretty much unsupported in qemu.
> 
> For the micro:bit we've been thinking of a WebSocket monitor interface.
> This way a web UI can work with both local and remote QEMU instances.
> 
> For security reasons, the WebSocket cannot be the regular QMP monitor.

FWIW, add ability to use websockets protocol over chardevs is fairly
easy. We already have a QIOChannelWebsock for the VNC server, so it
is just a little work to wire it into the chardev.

If the -monitor / -qmp arg took a filename containing a whitelist of
allowed monitor commands, you could indeed use the regular QMP monitor
instead of writing something new.

> A slimmed down monitor is required with a subset of QMP commands and
> events.  For example, users must not be able to migrate to an exec:
> destination so we need to ban that command on the UI monitor :-).

FWIW, you could  use the "-sandbox spawn=off,elevateprivileges=off"
arg to prevent ability of QEMU to fork/exec/setuid. Even if the
monitor still allows it, it thus get blocked, albeit by immediately
terminating the process.

> Pros:
>  + Remote control is possible over sockets
>    (Important for hosting QEMU on a server.  Nowadays this is becoming a
>    popular way to deliver emulation to users.  They don't need to
>    install software locally.)
>  + UI is cleanly isolated from QEMU process
> Cons:
>  - Binary or high-frequency I/O is a bad fit for a JSON WebSocket
>    interface
> 
> I prefer the WebSocket route over creating a fake display that will not
> be able to implement complex widgets well.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
