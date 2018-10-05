Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp735407wrt;
        Fri, 5 Oct 2018 11:49:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62lHId6K6HrQLrE/mUFzcJmeqqFY5kTLL+/tS2Ahnzkbnz806z4nsDDpGWK80m6SwRyOEDG
X-Received: by 2002:a37:2e05:: with SMTP id u5-v6mr10047147qkh.38.1538765396204;
        Fri, 05 Oct 2018 11:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538765396; cv=none;
        d=google.com; s=arc-20160816;
        b=imIT2vkR3IRrHMpfd1dr5isncz3YsygFldOo+bFcIzYvD6bVImMXd8zfIjEjPSqj5N
         ljkWHgL3hlwrlef/n2Z1F7k5LnKhHerSkpj4LfEpC3CUa0DKp5knJhNRqFosxddIcNKL
         2WXduzuAI83pE1GBCF/Cdr6Gkcjy+OKHRFk4lVuZXAvH506Nr9vHjSSoLSHVWmJHGjxy
         lDAvtrFT6knWe0Es/Tjg0DSs8nTQwVQMslNBiZ9lcmVf5jgs0PbsM7YUTFCvZ0AbfFSh
         HRMmunujtFyU4pQehmln0Kt9IRVzdTXt7eiXnL+xtybklGsUPsGupYmDAQnyitUW8zly
         NrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=4ilpiNcTdDiqarpMGPjHP+T3G1gK8LLTD3YWLo6MaqQ=;
        b=LMn6UlYQfaFhNHenqXV82UpP6yx9Wkq+7bsSv1b584Cfge+c7UrtZzF41S4BStOleH
         dXwC3iZPJ49o/jPO5tG2zXbqPj2L2hObvLwoZzOiINSkhPdrPjfo0dAlJlMSxrimhIZe
         2YJaejaCotk5zZu0Qz6kh++IZh1KD1NMfwTSCjezJQou0nKXL9d5hxXvupWovZ5qRGff
         pFqKEYqmbV7Dh2Fc0iZz5LoP4l0zSOlPtMHdXDco7mz9TJlh9Aet6yVAapnmSe5zxDb8
         AAJPhbF9qbQT0gTm78MOoa/9WRtc6GdWNfPT3g5FJPyhiuINbEs58I78rKWohWWZNRQb
         VbuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j70-v6si1268396qka.53.2018.10.05.11.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 11:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8VAh-0007K2-EV
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 14:49:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1g8VAU-0007Jw-14
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 14:49:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1g8VAQ-0006MB-TN
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 14:49:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40720)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1g8VAQ-0006Lf-L0; Fri, 05 Oct 2018 14:49:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94BF030BD9FA;
	Fri,  5 Oct 2018 18:49:37 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C194171CAF;
	Fri,  5 Oct 2018 18:49:31 +0000 (UTC)
Date: Fri, 5 Oct 2018 15:49:29 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20181005184929.GY5738@habkost.net>
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-16-luc.michel@greensocs.com>
	<35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
	<CAFEAcA9vHi=qrV-Aj5ptgBQntafLGwL6VezxnmOuuR=6=Pr8cA@mail.gmail.com>
	<33c3ea72-652a-53b2-4865-830f3d7f2c3a@greensocs.com>
	<3d459f14-b701-02b6-d231-fc48c509640f@redhat.com>
	<20181004195225.GV5738@habkost.net>
	<CAFEAcA9tT5iFAo5DG=3dyBYNjBVN9u2qEK6Bo9Rf2MAPMBC6bg@mail.gmail.com>
	<20181004215352.GW5738@habkost.net>
	<e4724ba3-4dbc-7b79-b520-96b69be1a73c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <e4724ba3-4dbc-7b79-b520-96b69be1a73c@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 05 Oct 2018 18:49:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put
 APUs and RPUs in separate GDB groups
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2NakN9pU7ZFg

On Fri, Oct 05, 2018 at 03:50:01PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 04/10/2018 23:53, Eduardo Habkost wrote:
> > On Thu, Oct 04, 2018 at 09:01:09PM +0100, Peter Maydell wrote:
> >> On 4 October 2018 at 20:52, Eduardo Habkost <ehabkost@redhat.com> wr=
ote:
> >>> Changing the object hierarchy based on GDB groups doesn't seem
> >>> right, but I don't think it would be a big deal if we have the
> >>> board code explicitly telling the GDB code how to group the CPUs.
> >>>
> >>> If you really want to do it implicitly, would it work if you
> >>> simply group the CPUs based on object_get_canonical_path()?
> >>>
> >>> If a more explicit GDB grouping API is acceptable, what about
> >>> just adding a INTERFACE_GDB_GROUP interface name to (existing)
> >>> container objects that we expect to become GDB groups?
> >>>
> >>> I'm not sure which way is better. I'm a bit worried that making
> >>> things too implicit could easily break (e.g. if somebody changes
> >>> the CPU QOM hierarchy in the future for unrelated reasons).
> >>
> >> I don't want things implicit. I just don't want the explicitness
> >> to be "this is all about GDB", because it isn't. I want us
> >> to explicitly say "these 4 CPUs are in one cluster" (or
> >> whatever term we use), because that affects more than merely GDB.
> >=20
> > We already have a way to say "these 4 CPUs are in one cluster",
> > don't we?  That's the QOM hierarchy.
> >=20
> > My question is if "the CPUs are in one cluster" should implicitly
> > mean "the CPUs are in one GDB group".
> >=20
>=20
> What about having the container implement INTERFACE_CPU_CLUSTER?
>=20
> Or even cleaner, add a TYPE_CPU_CLUSTER which is just a container for
> TYPE_CPU[*]?

Sounds good to me.  An interface sounds more flexible, to avoid
clashing with existing type hierarchies for
nodes/sockets/cores/etc.

But first of all, I think we need a good definition of what
exactly is a cluster, and what is the purpose of this
abstraction.

If we end up with a new abstraction that is only going to used by
GDB code and nothing else, I don't see the point of pretending it
is not a GDB-specific abstraction.

--=20
Eduardo
