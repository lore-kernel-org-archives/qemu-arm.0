Received: by 10.25.0.147 with SMTP id 141csp622898lfa;
        Tue, 21 Feb 2017 10:22:43 -0800 (PST)
X-Received: by 10.233.232.86 with SMTP id a83mr22619324qkg.180.1487701363551;
        Tue, 21 Feb 2017 10:22:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w58si15633314qtc.245.2017.02.21.10.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 10:22:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgF5E-0004be-L6
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 13:22:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cgF4U-0004Wr-JN
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 13:21:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cgF4T-0005Ku-GA
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 13:21:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44400)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cgF4N-0005HY-Ci; Tue, 21 Feb 2017 13:21:47 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E243C05AA72;
	Tue, 21 Feb 2017 18:21:47 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B928C43DE6;
	Tue, 21 Feb 2017 18:21:46 +0000 (UTC)
Date: Tue, 21 Feb 2017 15:21:44 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20170221182144.GG2778@thinpad.lan.raisama.net>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
	<20170220195500.332a4844@nial.brq.redhat.com>
	<CAFEAcA-VAY8LM+8jE4B-L=0QdcY5FLvwmwGVbUhcXjnC9-AW+w@mail.gmail.com>
	<20170221134416.5803b3e5@nial.brq.redhat.com>
	<CAFEAcA-MggU5T1fO8GonkSpLF0SNe0jtygEHtEBkpWC8hyShSw@mail.gmail.com>
	<87poibr6kv.fsf@dusky.pond.sub.org>
	<CAFEAcA-75VPiOzPauZO4ukYVYWffB1cu1-tsQs6Hs8m8Vf41OQ@mail.gmail.com>
	<87fuj74k9q.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fuj74k9q.fsf@dusky.pond.sub.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 21 Feb 2017 18:21:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC 0/3] generalize parsing of cpu_model
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	"patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKxk+x25/0c4

On Tue, Feb 21, 2017 at 04:48:49PM +0100, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On 21 February 2017 at 13:56, Markus Armbruster <armbru@redhat.com> wrote:
> >> -global is a qdev thing.
> >
> > ...which reminds me to ask: is there any hope for unifying
> > our properties so we don't have both "qdev properties" and
> > "qom properties" or are we doomed to two distinct sets of
> > APIs forever?
> 
> Good question!  Paolo, Andreas, any ideas?

qdev properties are supposed to be just wrappers to easily add
QOM properties.

...in theory.

The current obstacles I see are:
1) the qdev static property macros (DEFINE_PROP_*) are very
   simple to use, and QOM property registration requires lots of
   boilerplate code;
2) The set of data types supported by the qdev macros doesn't
   seem to be a subset of the data types supported by QOM
   helpers.
3) qdev properties have the extra check for dev->realized on the
   setter functions.

If we make QOM properties as powerful and easy to use as the qdev
property system, replacing qdev properties with equivalent QOM
counterparts would be straightforward. The exact path we should
follow to do that is not clear to me, but cleanups going in that
direction would be welcome.

Some things I have considered, which may or may not be good
ideas:
* Getting rid of PropertyInfo structs that can't be represented
  by QAPI types (e.g. qdev_prop_ptr).
* Generating PropertyInfo structs for primitive types using QAPI.
* Providing DEFINE_PROP_* macros for QOM, and make the qdev ones
  just wrappers around the QOM macros.

-- 
Eduardo
