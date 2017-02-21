Received: by 10.25.0.147 with SMTP id 141csp629235lfa;
        Tue, 21 Feb 2017 10:41:34 -0800 (PST)
X-Received: by 10.200.39.212 with SMTP id x20mr25455456qtx.109.1487702494570;
        Tue, 21 Feb 2017 10:41:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2si15659493qkc.210.2017.02.21.10.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 10:41:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgFNT-0000Jw-SA
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 13:41:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cgFNP-0000Jp-GI
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 13:41:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cgFNL-0003Ap-GW
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 13:41:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54182)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cgFNL-0003Ai-8b; Tue, 21 Feb 2017 13:41:23 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 060ADC04B326;
	Tue, 21 Feb 2017 18:41:23 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LIfLJj032583; Tue, 21 Feb 2017 13:41:22 -0500
Date: Tue, 21 Feb 2017 15:41:19 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170221184119.GJ2778@thinpad.lan.raisama.net>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
	<20170220195500.332a4844@nial.brq.redhat.com>
	<CAFEAcA-VAY8LM+8jE4B-L=0QdcY5FLvwmwGVbUhcXjnC9-AW+w@mail.gmail.com>
	<20170221134416.5803b3e5@nial.brq.redhat.com>
	<CAFEAcA-MggU5T1fO8GonkSpLF0SNe0jtygEHtEBkpWC8hyShSw@mail.gmail.com>
	<87poibr6kv.fsf@dusky.pond.sub.org>
	<CAFEAcA-75VPiOzPauZO4ukYVYWffB1cu1-tsQs6Hs8m8Vf41OQ@mail.gmail.com>
	<6959c545-4b6e-423b-45f2-8e0683b08ce2@redhat.com>
	<CAFEAcA8wJWXUJg1PC6rwVVuUsR7VPXwueMkyL4U_SxRSRqz3Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8wJWXUJg1PC6rwVVuUsR7VPXwueMkyL4U_SxRSRqz3Kw@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 21 Feb 2017 18:41:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/3] generalize parsing of
 cpu_model
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	"patches@linaro.org" <patches@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AI9L2+ocrJwi

On Tue, Feb 21, 2017 at 05:59:53PM +0000, Peter Maydell wrote:
> On 21 February 2017 at 16:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > On 21/02/2017 14:57, Peter Maydell wrote:
> >>> -global is a qdev thing.
> >> ...which reminds me to ask: is there any hope for unifying
> >> our properties so we don't have both "qdev properties" and
> >> "qom properties" or are we doomed to two distinct sets of
> >> APIs forever?
> >
> > We already have one set of property APIs in some sense.  qdev properties
> > *are* QOM properties; you visit them with object_property_foreach and so on.
> >
> > The extensions that qdev adds, and are exclusive to qdev properties, are
> > the following:
> >
> > - defining properties via DEFINE_PROPERTY_* (qdev_property_add_static etc.)
> >
> > - defining default values with -global (global_props and a handful of
> > functions that use it).
> 
> ...I didn't realize -global only worked on qdev properties.
> That's kind of awkward (but then -global syntax is awkward
> in any case). What's the QOM equivalent?

-global work on any kind of QOM properties (qdev properties are
registered as QOM properties). The only restriction is that it
works only on TYPE_DEVICE subclasses.

> 
> > - providing alternative human-readable formatting for info qtree
> > (qdev_property_add_legacy)
> 
> There's also a distinct set of functions for setting them:
> qdev_prop_set_uint32() vs object_property_set_int(), etc.
> These seem to be sometimes just wrappers (eg set_uint32), sometimes
> wrappers with a little convenience functionality (eg set_macaddr),
> and sometimes doing something more complex (eg set_enum, set_ptr).
> 
> The effect at the board code level is that code for creating,
> setting properties on and realizing qdev devices tends to look
> very different from that for doing so for plain QOM objects
> [qdev_create / qdev_prop_set* / qdev_init_nofail vs object_new /
> object_property_set_* / object_property_set_bool(... "realized" ...) ]
> 
> Can/should we just deprecate further use of the qdev_* APIs?

I don't think we can, until we provide a QOM API that is as
powerful and as easy to use as the DEFINE_PROP_* macros.

This probably isn't as hard as it sounds: I believe the only
thing forcing the existing DEFINE_PROP_* macros and PropertyInfo
structs to be qdev-specific is the device->realized check inside
the property setters.

-- 
Eduardo
