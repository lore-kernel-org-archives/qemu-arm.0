Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp10276848wrx;
        Sun, 10 Mar 2019 03:14:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJ2vX+AbOlvBIFErP9xt2Q1AjzGpedQu1fPrt2ZjOYyJas3+v7X0QvsbbC832O8YkM6iYO
X-Received: by 2002:a25:2605:: with SMTP id m5mr22745744ybm.194.1552212873529;
        Sun, 10 Mar 2019 03:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552212873; cv=none;
        d=google.com; s=arc-20160816;
        b=B+8CIVhT2j0IJUR2eIWcJwbis1MyUl5/JXh/qcBDsLfxnaJ7C8s6o+A1udue9ruo7y
         Bd1f/660Mmkb0VXN1bfvZMYjjDgxXOVjFviTvkVi1858CZ33whfpUtSK6XgGsQkBgAQh
         vpqob9TswF7jOF7MS1S4mszmN905g60MpQbnyHQqXsfQ0BT/2JJjw7CL6R+9PB2Yy149
         9OVgODawbcspm6jyJekcZcfcJ6gDa3mjLJIQJOkfUEitmf4QZ4U30el2L8JA8Y8LaQ5v
         EeNrv2YBkA1Jj4R2CO/lOUUYEKUKYj+Ikcg3aZAd8TF78oih+0zP+NhtXa59rWKvB7Lz
         4TdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=v8ftjqOEVzccZ18F+euYaLZS/gFCSnpec6/4W0kBVRU=;
        b=aPyN7nTwaT60GkKNKHkBijO/idevI4utNRd8xQCoVGf+kcACJNwNad5/ckSmyyrkdb
         xqWo8WjIrdL5oTXlWq7ZrkvmRuC4GqOCil11NsaRl+1obbUT6JwmxXs2bHGHfGjZKRj6
         zNXGasAJ2UMffoJSTbRmGBcqgeAYDyizNTdw2W60SF/CU2m5Tx5scnKIZNs0JcYPpLL+
         RB8IayqjSyymSH0NXtTZzar7ZR8yqdyHHFZLxC8PRQLbvpwlXxTFJzsWacdNs/j/dUx9
         KzhwtW+Ciu+Ca3ywgzkLZNu6rtbz40thiwV3Pv98+jbzKd5FixNjmiGm7VKoAc1nYkIZ
         uw4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si1437693ywc.356.2019.03.10.03.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Mar 2019 03:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2vTU-0004oK-Sd
	for alex.bennee@linaro.org; Sun, 10 Mar 2019 06:14:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2vTI-0004nJ-Hc
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 06:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2vTG-0004gy-PL
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 06:14:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h2vTF-0004eB-B7; Sun, 10 Mar 2019 06:14:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C255D3082AF0;
	Sun, 10 Mar 2019 10:14:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D7E560BFC;
	Sun, 10 Mar 2019 10:14:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 824001138660; Sun, 10 Mar 2019 11:14:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org> <20190304101911.GE4239@redhat.com>
	<87y35u3lth.fsf@dusky.pond.sub.org> <20190304152811.GO4239@redhat.com>
Date: Sun, 10 Mar 2019 11:14:08 +0100
In-Reply-To: <20190304152811.GO4239@redhat.com> ("Daniel P. =?utf-8?Q?Berr?=
	=?utf-8?Q?ang=C3=A9=22's?=
	message of "Mon, 4 Mar 2019 15:28:11 +0000")
Message-ID: <8736nvxci7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sun, 10 Mar 2019 10:14:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate
 'mem' parameter of '-numa node' option
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x7YTxrWnCJNJ

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Mar 04, 2019 at 12:45:14PM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Mon, Mar 04, 2019 at 08:13:53AM +0100, Markus Armbruster wrote:
>> >> If we deprecate outdated NUMA configurations now, we can start reject=
ing
>> >> them with new machine types after a suitable grace period.
>> >
>> > How is libvirt going to know what machines it can use with the feature=
 ?
>> > We don't have any way to introspect machine type specific logic, since=
 we
>> > run all probing with "-machine none", and QEMU can't report anything a=
bout
>> > machines without instantiating them.
>>=20
>> Fair point.  A practical way for management applications to decide which
>> of the two interfaces they can use with which machine type may be
>> required for deprecating one of the interfaces with new machine types.
>
> We currently have  "qom-list-properties" which can report on the
> existance of properties registered against object types. What it
> can't do though is report on the default values of these properties.

Yes.

> What's interesting though is that qmp_qom_list_properties will actually
> instantiate objects in order to query properties, if the type isn't an
> abstract type.

If it's an abstract type, qom-list-properties returns the properties
created with object_class_property_add() & friends, typically by the
class_init method.  This is possible without instantiating the type.

If it's a concrete type, qom-list-properties additionally returns the
properties created with object_property_add(), typically by the
instance_init() method.  This requires instantiating the type.

Both kinds of properties can be added or deleted at any time.  For
instance, setting a property value with object_property_set() or similar
could create additional properties.

For historical reasons, we use often use object_property_add() where
object_class_property_add() would do.  Sad.

> IOW, even if you are running "$QEMU -machine none", then if at the qmp-sh=
ell
> you do
>
>    (QEMU) qom-list-properties typename=3Dpc-q35-2.6-machine
>
> it will have actually instantiate the pc-q35-2.6-machine machine type.
> Since it has instantiated the machine, the object initializer function
> will have run and initialized the default values for various properties.
>
> IOW, it is possible for qom-list-properties to report on default values
> for non-abstract types.

instance_init() also initializes the properties' values.
qom-list-properties could show these initial values (I hesitate calling
them default values).

Setting a property's value can change other properties' values by side
effect.

My point is: the properties qom-list-properties shows and the initial
values it could show are not necessarily final.  QOM is designed to be
maximally flexible, and flexibility brings along its bosom-buddy
complexity.

If you keep that in mind, qom-list-properties can be put to good use all
the same.

A way to report "default values" (really: whatever the values are after
object_new()) feels like a fair feature request to me, if backed by an
actual use case.

[...]
