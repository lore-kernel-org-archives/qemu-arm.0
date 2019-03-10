Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp10278673wrx;
        Sun, 10 Mar 2019 03:17:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6N9PRm/V1axuOY3YbrhSdMlBA9BuycVYlESjsiEYesxzy2xEhukp4vmpgFrxOrhY46zDK
X-Received: by 2002:a81:25d4:: with SMTP id l203mr20845491ywl.279.1552213022053;
        Sun, 10 Mar 2019 03:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552213022; cv=none;
        d=google.com; s=arc-20160816;
        b=rlBEtkiLOJujxukvIgPvo2UIQ5tdau9rXw+Qd4iedTYK1+Z7MAQyHdGBoifgY31KIl
         ZF+/PGNGxi2rx33PM/oXtBVLZyr6j7GS0+vZCAxv7L0/EKxux04SBedArmVTMCZROdTa
         SIXkpHVUUc5FHZLKjSLf3EYzmOZp8Lb2kZxb3RDAg6ObCCDhHiK7FCmJRPrYEDSvMShV
         te0+H7rgbQXGaBPt31fxIGbLISN0lvVQisnL7YX+M2ITdYa7lTiuK2YdyzDzLlVthpDX
         XtzPAH8i8X3OMdRDHtKgWDnZCiIwYiGfV2a/fD9dkx9Y6htls4mwxTxj39NjE9eOtPsS
         hyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=hbjZFN/2eMEuBO4NrcVcqnSpxogcbOSANmd1B2YViDQ=;
        b=AM196UWQ1nE20usC329K+y5bN/jVFie0ewuvWkp0/sKzP5217S5kF5nDmWCeSjXsR5
         MqbQgL+zdJirjxtMbhCXjkf995Xdu/JGRUTxBOkirGudB3hkEBSqMVxDj5g951y1Ovox
         kQVvxykpQS5akBad8Yig8fbZrdUHA+fOxOkFnRnHkLZInKYMcjRoC3VbklQ3lfgHZPJ/
         SwxpBgoR0FrPjL4ZWZv5s5nPFqg2F5nwLE8dpPnJjj/QwMdaXGxXPK9mym72zOVPCY6n
         jdzZgKZA4p90X4/rhMlv9xjXOZHj35JWS8ZKVAndN+xgxDRKEG/BasBwlqJ5FCqfA40V
         snkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si1381490ybn.24.2019.03.10.03.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Mar 2019 03:17:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2vVt-0006N1-D8
	for alex.bennee@linaro.org; Sun, 10 Mar 2019 06:17:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2vVZ-0006Lr-Cq
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 06:16:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2vVY-0006S0-I2
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 06:16:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h2vVY-0006RT-9E; Sun, 10 Mar 2019 06:16:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 370B085362;
	Sun, 10 Mar 2019 10:16:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4F35600C4;
	Sun, 10 Mar 2019 10:16:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 370A71138660; Sun, 10 Mar 2019 11:16:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
References: <20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com>
	<20190304123908.GK4239@redhat.com>
	<20190304151641.3deefc3b@redhat.com>
	<20190304142432.GM4239@redhat.com>
	<a6081774-c9d5-0496-3e65-ffb885408261@redhat.com>
	<20190304163516.GQ4239@redhat.com>
	<20190306200348.11e9eece@Igors-MacBook-Pro.local>
	<20190307095901.GF32268@redhat.com>
Date: Sun, 10 Mar 2019 11:16:33 +0100
In-Reply-To: <20190307095901.GF32268@redhat.com> ("Daniel P. =?utf-8?Q?Ber?=
	=?utf-8?Q?rang=C3=A9=22's?=
	message of "Thu, 7 Mar 2019 09:59:01 +0000")
Message-ID: <871s3fxce6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sun, 10 Mar 2019 10:16:39 +0000 (UTC)
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
	Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AqYSUrrAKWWk

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Mar 06, 2019 at 08:03:48PM +0100, Igor Mammedov wrote:
>> On Mon, 4 Mar 2019 16:35:16 +0000
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>=20
>> > On Mon, Mar 04, 2019 at 05:20:13PM +0100, Michal Privoznik wrote:
>> > > We couldn't have done that. How we would migrate from older qemu?
>> > >=20
>> > > Anyway, now that I look into this (esp. git log) I came accross:
>> > >=20
>> > > commit f309db1f4d51009bad0d32e12efc75530b66836b
>> > > Author:     Michal Privoznik <mprivozn@redhat.com>
>> > > AuthorDate: Thu Dec 18 12:36:48 2014 +0100
>> > > Commit:     Michal Privoznik <mprivozn@redhat.com>
>> > > CommitDate: Fri Dec 19 07:44:44 2014 +0100
>> > >=20
>> > >     qemu: Create memory-backend-{ram,file} iff needed
>> > >=20
>> > > Or this 7832fac84741d65e851dbdbfaf474785cbfdcf3c. We did try to gene=
rated
>> > > newer cmd line but then for various reasong (e.g. avoiding triggerin=
g a qemu
>> > > bug) we turned it off and make libvirt default to older (now depreca=
ted) cmd
>> > > line.
>> > >=20
>> > > Frankly, I don't know how to proceed. Unless qemu is fixed to allow
>> > > migration from deprecated to new cmd line (unlikely, if not impossib=
le,
>> > > right?) then I guess the only approach we can have is that:
>> > >=20
>> > > 1) whenever so called cold booting a new machine (fresh, brand new s=
tart of
>> > > a new domain) libvirt would default to modern cmd line,
>> > >=20
>> > > 2) on migration, libvirt would record in the migration stream (or st=
atus XML
>> > > or wherever) that modern cmd line was generated and thus it'll make =
the
>> > > destination generate modern cmd line too.
>> > >=20
>> > > This solution still suffers a couple of problems:
>> > > a) migration to older libvirt will fail as older libvirt won't recog=
nize the
>> > > flag set in 2) and therefore would default to deprecated cmd line
>> > > b) migrating from one host to another won't modernize the cmd line
>> > >=20
>> > > But I guess we have to draw a line somewhere (if we are not willing =
to write
>> > > those migration patches).
>> >=20
>> > Yeah supporting backwards migration is a non-optional requirement from=
 at
>> > least one of the mgmt apps using libvirt, so breaking the new to old c=
ase
>> > is something we always aim to avoid.
>> Aiming for support of=20
>> "new QEMU + new machine type" =3D> "old QEMU + non-existing machine type"
>> seems a bit difficult.
>
> That's not the scenario that's the problem. The problem is
>
>    new QEMU + new machine type + new libvirt   -> new QEMU + new machine =
type + old libvirt
>
> Previously released versions of libvirt will happily use any new machine
> type that QEMU introduces. So we can't make new libvirt use a different
> options, only for new machine types, as old libvirt supports those machine
> types too.

Avoiding tight coupling between QEMU und libvirt versions makes sense,
because having to upgrade stuff in lock-step is such a pain.

Does not imply we must support arbitrary combinations of QEMU and
libvirt versions.

Unless upstream libvirt's test matrix covers all versions of libvirt
against all released versions of QEMU, "previously released versions of
libvirt will continue to work with new QEMU" is largely an empty promise
anyway.  The real promise is more like "we won't break it intentionally;
good luck".

Mind, I'm not criticizing that real promise.  I'm criticizing cutting
yourself off from large areas of the solution space so you can continue
to pretend to yourself you actually deliver on the empty promise.

Now, if you limited what you promise to something more realistic,
ideally to something you actually test, we could talk about deprecation
schedules constructively.

For instance, if you promised

    QEMU as of time T + its latest machine type + libvirt as of time T
 -> QEMU as of time T + its latest machine type + libvirt as of time T - d

will work for a certain value of d, then once all released versions of
libvirt since T - d support a new way of doing things, flipping to that
new way becomes a whole lot easier.
