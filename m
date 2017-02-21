Received: by 10.25.0.147 with SMTP id 141csp614209lfa;
        Tue, 21 Feb 2017 10:01:10 -0800 (PST)
X-Received: by 10.237.42.109 with SMTP id k42mr13008198qtf.52.1487700070666;
        Tue, 21 Feb 2017 10:01:10 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n65si15602568qkd.252.2017.02.21.10.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 10:01:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgEkO-0003vc-19
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 13:01:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgEjZ-0003sk-06
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 13:00:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgEjX-0007bC-Ob
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 13:00:17 -0500
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:33420)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgEjX-0007aB-J4
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 13:00:15 -0500
Received: by mail-wr0-x229.google.com with SMTP id 97so8446067wrb.0
	for <qemu-devel@nongnu.org>; Tue, 21 Feb 2017 10:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tr0n8qJ/YOBPkoSch1d2sAsQRZXB1/NrUHfYfwWrfFo=;
	b=fexfagi0xuTYFM7EWzvO7YVtQAkdYgHMz+x+u/Kl7X1z4rhLzqmmgW+J6b87j+/ACk
	Jv1U8QwJaEE837m0CXsirA3B7XZ/tmx+XyEJkqFvBvj90aztPe5xLCazN0eHiNXnXmdc
	eKaCfc9OYvMl4xqQm6cJzDDsPe6uhfFm49gio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tr0n8qJ/YOBPkoSch1d2sAsQRZXB1/NrUHfYfwWrfFo=;
	b=aU1TriZ9UAgndPAxBjouD+Z7xBfqZ5vKiqlJHVAQHyZWwDmJ+bnhUQJzWFVUgtDF9v
	RkkM2cnXw+4m/C6HMwX1uyBm34rP7YNp+ZRkWAes3V8sWEsIIau6GEAuk4JewtiL4rn2
	N0AuBV1hy0mlS9nbDd9k7w5pJNOondwljJWSpEqLbZF0GrBnNEyoqB0TC5ez6t/BiWu6
	C0su++Bo25mKfOODhDod6sYNM11Zg01aWUe3eO0PJ1jd0ccZrAL+T8kJ/Z9k06bhEUn3
	BADsrJLQihvYxLmaNqwT2DMVjLwCBY7C15s/fczviLYp2A8A/7vUIY1x6poTWLmLponV
	zKvQ==
X-Gm-Message-State: AMke39lUfI5phsxEF3RkV00TjY1eGxLW2AFpfwjkWmMqsetsLs8HVjoz6+N1G8lpnLey1r7w/jVdw47loOeiU/Jg
X-Received: by 10.223.150.209 with SMTP id u75mr3901628wrb.195.1487700014256; 
	Tue, 21 Feb 2017 10:00:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 21 Feb 2017 09:59:53 -0800 (PST)
In-Reply-To: <6959c545-4b6e-423b-45f2-8e0683b08ce2@redhat.com>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
	<20170220195500.332a4844@nial.brq.redhat.com>
	<CAFEAcA-VAY8LM+8jE4B-L=0QdcY5FLvwmwGVbUhcXjnC9-AW+w@mail.gmail.com>
	<20170221134416.5803b3e5@nial.brq.redhat.com>
	<CAFEAcA-MggU5T1fO8GonkSpLF0SNe0jtygEHtEBkpWC8hyShSw@mail.gmail.com>
	<87poibr6kv.fsf@dusky.pond.sub.org>
	<CAFEAcA-75VPiOzPauZO4ukYVYWffB1cu1-tsQs6Hs8m8Vf41OQ@mail.gmail.com>
	<6959c545-4b6e-423b-45f2-8e0683b08ce2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2017 17:59:53 +0000
Message-ID: <CAFEAcA8wJWXUJg1PC6rwVVuUsR7VPXwueMkyL4U_SxRSRqz3Kw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::229
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	"patches@linaro.org" <patches@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MiUCxJ1hjfsQ

On 21 February 2017 at 16:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 21/02/2017 14:57, Peter Maydell wrote:
>>> -global is a qdev thing.
>> ...which reminds me to ask: is there any hope for unifying
>> our properties so we don't have both "qdev properties" and
>> "qom properties" or are we doomed to two distinct sets of
>> APIs forever?
>
> We already have one set of property APIs in some sense.  qdev properties
> *are* QOM properties; you visit them with object_property_foreach and so on.
>
> The extensions that qdev adds, and are exclusive to qdev properties, are
> the following:
>
> - defining properties via DEFINE_PROPERTY_* (qdev_property_add_static etc.)
>
> - defining default values with -global (global_props and a handful of
> functions that use it).

...I didn't realize -global only worked on qdev properties.
That's kind of awkward (but then -global syntax is awkward
in any case). What's the QOM equivalent?

> - providing alternative human-readable formatting for info qtree
> (qdev_property_add_legacy)

There's also a distinct set of functions for setting them:
qdev_prop_set_uint32() vs object_property_set_int(), etc.
These seem to be sometimes just wrappers (eg set_uint32), sometimes
wrappers with a little convenience functionality (eg set_macaddr),
and sometimes doing something more complex (eg set_enum, set_ptr).

The effect at the board code level is that code for creating,
setting properties on and realizing qdev devices tends to look
very different from that for doing so for plain QOM objects
[qdev_create / qdev_prop_set* / qdev_init_nofail vs object_new /
object_property_set_* / object_property_set_bool(... "realized" ...) ]

Can/should we just deprecate further use of the qdev_* APIs?

thanks
-- PMM
