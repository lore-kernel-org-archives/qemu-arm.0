Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3729696wrx;
        Mon, 4 Mar 2019 07:30:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJhwAcWbw7Ljzefb4go9Lrk6QHFFl3zEDgApBwJnlzLWCjGbKeHGAuX4WjjMjNECNVuf/e
X-Received: by 2002:a25:828c:: with SMTP id r12mr15392363ybk.331.1551713409167;
        Mon, 04 Mar 2019 07:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551713409; cv=none;
        d=google.com; s=arc-20160816;
        b=noTHixpEDpLY4LCPh6bTRXObJEJF2qX1ZgksYcSHjmlQr29+UyqIWcrbWXM78s36hk
         WwisG30tt+VyCSZVKVkhSFml+NrOjsnSu0ZSef73f46AMjrgbKcL6FgCcRxeCHlcMfbc
         Dwg8MNeR/Gi4YzR+0SQfXMYjRF/ZZUpBBYwRx+dpaIJVDeh3Fzp9JWvt0eSNwKWxTQ2i
         FeCBM8ql9UjBzXL53oPRFxjkKNE178cxj5Kug2KSs0kGLltoj9UU7vvNTNp9OiAcJKYk
         1LRwgD3dYJ2fXQryKCp9arSuFoYHCcvUM1dk7VZqR6K/jDKQArYzrzNB0eW1uUEvL5Kp
         KJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=fCAFD6EB/aEXiSgS+Vl00rx3jRCDXuJLLasKuMjRIGs=;
        b=yvHRnJmXQDCaPIrYI4rBBEjM4yaUi65gLbkAX0VCRWrlvcjLSry9wu7bMATpjQlro4
         Y/B4EOokZmUUdpc2Y58J+EZkSFoZmdvFNxaTdReRhZDzwa5NI1jvbv1WADeoPGzyJkXp
         iWTyFazt3ySZYdBTa+zP4C7YUv4ch3jKExcNoqETmsUrjJ8io7yKOy09TbILGNDiYgUq
         k2LLCKfUOZvrHP6q2ezeVCxbGZVP4L92Gqy5aK/SlZPO29vby+SxebKY8XZS5fmLlAWE
         8217xcJCx8F6/7myRZNxmBmzdyn8bACf7Q+cpj3r29BVNGVHtD4R8Q+ojzamOFp0hp9p
         3/Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a187si3470112ywf.296.2019.03.04.07.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 07:30:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0pXc-00005n-Jn
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 10:30:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0pW3-0007LY-Qp
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 10:28:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0pW1-00070J-UP
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 10:28:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:27281)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1h0pVy-0006rQ-1Q; Mon, 04 Mar 2019 10:28:28 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E42E30833B5;
	Mon,  4 Mar 2019 15:28:24 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 370905DD63;
	Mon,  4 Mar 2019 15:28:14 +0000 (UTC)
Date: Mon, 4 Mar 2019 15:28:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190304152811.GO4239@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304101911.GE4239@redhat.com>
	<87y35u3lth.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87y35u3lth.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 04 Mar 2019 15:28:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, pbonzini@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H8VY3OhsTMFp

On Mon, Mar 04, 2019 at 12:45:14PM +0100, Markus Armbruster wrote:
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>=20
> > On Mon, Mar 04, 2019 at 08:13:53AM +0100, Markus Armbruster wrote:
> >> If we deprecate outdated NUMA configurations now, we can start rejec=
ting
> >> them with new machine types after a suitable grace period.
> >
> > How is libvirt going to know what machines it can use with the featur=
e ?
> > We don't have any way to introspect machine type specific logic, sinc=
e we
> > run all probing with "-machine none", and QEMU can't report anything =
about
> > machines without instantiating them.
>=20
> Fair point.  A practical way for management applications to decide whic=
h
> of the two interfaces they can use with which machine type may be
> required for deprecating one of the interfaces with new machine types.

We currently have  "qom-list-properties" which can report on the
existance of properties registered against object types. What it
can't do though is report on the default values of these properties.

What's interesting though is that qmp_qom_list_properties will actually
instantiate objects in order to query properties, if the type isn't an
abstract type.

IOW, even if you are running "$QEMU -machine none", then if at the qmp-sh=
ell
you do

   (QEMU) qom-list-properties typename=3Dpc-q35-2.6-machine

it will have actually instantiate the pc-q35-2.6-machine machine type.
Since it has instantiated the machine, the object initializer function
will have run and initialized the default values for various properties.

IOW, it is possible for qom-list-properties to report on default values
for non-abstract types.

I did a quick hack to PoC the theory:

diff --git a/qapi/misc.json b/qapi/misc.json
index 8b3ca4fdd3..906dfbf3b5 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -1368,7 +1368,8 @@
 # Since: 1.2
 ##
 { 'struct': 'ObjectPropertyInfo',
-  'data': { 'name': 'str', 'type': 'str', '*description': 'str' } }
+  'data': { 'name': 'str', 'type': 'str', '*description': 'str',
+            '*default': 'str'} }
=20
 ##
 # @qom-list:
diff --git a/qmp.c b/qmp.c
index b92d62cd5f..a45669032c 100644
--- a/qmp.c
+++ b/qmp.c
@@ -594,6 +594,11 @@ ObjectPropertyInfoList *qmp_qom_list_properties(cons=
t char *typename,
         info->has_description =3D !!prop->description;
         info->description =3D g_strdup(prop->description);
=20
+        if (obj && g_str_equal(info->type, "string")) {
+            info->q_default =3D g_strdup(object_property_get_str(obj, in=
fo->name, NULL));
+            info->has_q_default =3D info->q_default !=3D NULL;
+        }
+
         entry =3D g_malloc0(sizeof(*entry));
         entry->value =3D info;
         entry->next =3D prop_list;


If we could make this hack less of a hack, then perhaps this is good
enough to cope reporting machine types which forbid use of "mem" in
favour of "memdev" ? They would need to have a property registered
against them of course to identify the "memdev" requirement.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
