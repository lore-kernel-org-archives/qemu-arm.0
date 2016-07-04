Received: by 10.25.21.96 with SMTP id l93csp1609080lfi;
        Mon, 4 Jul 2016 09:47:30 -0700 (PDT)
X-Received: by 10.200.37.150 with SMTP id e22mr20030225qte.37.1467650850057;
        Mon, 04 Jul 2016 09:47:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 65si2819516qkm.109.2016.07.04.09.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 09:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK71t-0001Ze-EC
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 12:47:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1bK6zl-0007rV-Hh
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 12:45:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1bK6zi-0001iW-DW
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 12:45:17 -0400
Received: from 4.mo69.mail-out.ovh.net ([46.105.42.102]:54471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1bK6zi-0001iL-72
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 12:45:14 -0400
Received: from player789.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 3D3261000648
	for <qemu-devel@nongnu.org>; Mon,  4 Jul 2016 18:45:13 +0200 (CEST)
Received: from bahia.lan (unknown [91.224.149.27])
	(Authenticated sender: groug@kaod.org)
	by player789.ha.ovh.net (Postfix) with ESMTPSA id 7F938260067;
	Mon,  4 Jul 2016 18:45:02 +0200 (CEST)
Date: Mon, 4 Jul 2016 18:45:00 +0200
From: Greg Kurz <groug@kaod.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160704184500.55cf4b96@bahia.lan>
In-Reply-To: <20160704162121.GA4131@thinpad.lan.raisama.net>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
	<20160704100431.6b20fd28@172-15-182-60.lightspeed.austtx.sbcglobal.net>
	<20160704140146.GO4620@thinpad.lan.raisama.net>
	<20160704163219.41a442fa@172-15-182-60.lightspeed.austtx.sbcglobal.net>
	<20160704162121.GA4131@thinpad.lan.raisama.net>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10563474402738018646
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.42.102
Subject: Re: [Qemu-devel] [PATCH v2 0/6] cpus: make "-cpu cpux,
 features" global properties
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, Igor Mammedov <imammedo@redhat.com>,
	david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0YL9I8tmjbxp

On Mon, 4 Jul 2016 13:21:21 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Mon, Jul 04, 2016 at 04:32:19PM +0200, Igor Mammedov wrote:
> > On Mon, 4 Jul 2016 11:01:46 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >   
> > > On Mon, Jul 04, 2016 at 10:04:31AM +0200, Igor Mammedov wrote:  
> > > > On Thu,  9 Jun 2016 19:10:57 +0200
> > > > Igor Mammedov <imammedo@redhat.com> wrote:
> > > > 
> > > > Eduardo,
> > > > 
> > > > is anything more left to review/fix so remaining patches of this
> > > > series could be merged?  
> > > 
> > > The only thing left is that I run some basic testing and submit a
> > > pull request. I couldn't do that last week (sorry!), but I plan
> > > to submit a pull request this week.  
> > Is there a tree for Greg to rebase his work upon?   
> 
> git://github.com/ehabkost/qemu.git x86-next
> 

Thanks Eduardo !

--
Greg
