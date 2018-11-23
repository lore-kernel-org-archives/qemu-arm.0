Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2392522wrt;
        Fri, 23 Nov 2018 10:32:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5f0DoTCc9F7I3koPBzz90Ex4OfztQOLKGY/y1G5PHuSYnMl8eO6ZV7wnUXSnJWyP+swEzXP
X-Received: by 2002:a81:2ac1:: with SMTP id q184mr16907381ywq.99.1542997970898;
        Fri, 23 Nov 2018 10:32:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542997970; cv=none;
        d=google.com; s=arc-20160816;
        b=o2gvbQI+aeBgi3UilPbzWb4kFlaFZETWscZFTBsuSXvAyuJl2WwW/x1Bd/SmYmYNQ5
         bsMvMfP7FcI7pas1ornus5bqUeDeps4ckJknic4Qa73MniQmxkDHaVEKpB3uPzajasfB
         8+UPOUJzrCBW65tM2iw8fyYV2F8fV4PJopDPuUZYFJL8quSV94S2YeouZORzx48N/h0R
         uEjWPSoxSxStTeowmrOLmpmtM6jklFD+YMDMdDb2Sy1JqAvkysXYHXguoNQcU3mnB1Ip
         vTevDH6kHynx2cz7ropMRqMO6GJrYESe8YJL/v3/ZsosHzBqEMSt12AfP/mdLJDJhXK0
         kjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=KffSLI1gvgVw80ocFUu4kob8fQnzT4lELzZFkYYdJho=;
        b=uw4gNT4JbsmFIQXWSW4gvl81x7Wruer78YrpauaYD7CAQg/fOIUJJBTFL7M/0eMLxk
         Tx1tDBVZfbNxwobX+Kg4e8/pgusLuFhdfWE6dnUa8FIAl1LJJZ3XeQvPFJ/ToE1lxOua
         247wYY6DiLhgRMbu6Qs8/OA/mUH1xJ/cJS2CJzSog73vnBzERZgXH6hfs3t6tfZNAPmc
         a/qNZuV54pI98uP8xbzqKgnBQqmfVo5OU/ltMdzF/wRstbjicc5YtYe2VLE2xZZfDjZm
         EpixtsaAfNg0sx+L3RhxkwZHKa18JL7y+7t/T6/F7+TFq9riek5QlYhN21NOnf/AHfBa
         dJgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k66-v6si34844925yba.481.2018.11.23.10.32.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 10:32:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQGG2-00059j-8V
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 13:32:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gQGD5-0003kz-S2
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 13:29:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gQG7s-0008Kl-UQ
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 13:24:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gQG7m-0008B9-DQ; Fri, 23 Nov 2018 13:24:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A29547AE93;
	Fri, 23 Nov 2018 18:24:17 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28A5F1811D;
	Fri, 23 Nov 2018 18:24:16 +0000 (UTC)
Date: Fri, 23 Nov 2018 16:24:15 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181123182415.GP18284@habkost.net>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<CAFEAcA_8jJz5dE7XP4R=LjEC5WzP3jzutg=YqiYjJVwZZz+jvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAFEAcA_8jJz5dE7XP4R=LjEC5WzP3jzutg=YqiYjJVwZZz+jvQ@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 23 Nov 2018 18:24:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU clusters
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YVB8qLEJJ+de

On Fri, Nov 23, 2018 at 06:14:28PM +0000, Peter Maydell wrote:
> On Fri, 23 Nov 2018 at 18:11, Eduardo Habkost <ehabkost@redhat.com> wro=
te:
> > On Fri, Nov 23, 2018 at 10:17:14AM +0100, Luc Michel wrote:
> > > This commit adds the cpu-cluster type. It aims at gathering CPUs fr=
om
> > > the same cluster in a machine.
> > >
> > > For now it only has a `cluster-id` property.
> > >
> > > Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > [...]
> > > +static void cpu_cluster_init(Object *obj)
> > > +{
> > > +    static uint32_t cluster_id_auto_increment;
> > > +    CPUClusterState *cluster =3D CPU_CLUSTER(obj);
> > > +
> > > +    cluster->cluster_id =3D cluster_id_auto_increment++;
> >
> > I see that you implemented this after a suggestion from Philippe,
> > but I'm worried about this kind of side-effect on object/device
> > code.  I'm afraid this will bite us back in the future.  We were
> > bitten by problems caused by automatic cpu_index assignment on
> > CPU instance_init, and we took a while to fix that.
> >
> > If you really want to do this and assign cluster_id
> > automatically, please do it on realize, where it won't have
> > unexpected side-effects after a simple `qom-list-properties` QMP
> > command.
> >
> > I would also add a huge warning above the cluster_id field
> > declaration, mentioning that the field is not supposed to be used
> > for anything except debugging.  I think there's a large risk of
> > people trying to reuse the field incorrectly, just like cpu_index
> > was reused for multiple (conflicting) purposes in the past.
>=20
> One thing I would like to do with this new "cpu cluster"
> concept is to use it to handle a problem we have at the
> moment with TCG, where we assume all CPUs have the same
> view of physical memory (and so if CPU A executes from physical
> address X it can share translated code with CPU B executing
> from physical address X). The idea is that we should include
> the CPU cluster number in the TCG hash key that we use to
> look up cached translation blocks, so that only CPUs in
> the same cluster (assumed to have the same view of memory
> and to be identical) share TBs.
>=20
> If we don't have a unique integer key for the cluster, what
> should we use instead ?

This sounds like a reasonable use of cluster_id as implemented in
this patch.  The ID would be only used internally and not exposed
to the outside, right?

I'm more worried about cases where we could end up exposing the
ID in an external interface (either to guests, or through QMP or
the command-line).  This happened to cpu_index and we took a long
time to fix the mess.

--=20
Eduardo
