Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2052805lfi;
        Thu, 2 Apr 2020 07:41:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypImu5QmSCZ5HysCZRAheF42q11Un2mOHl+Gm/pXWZpbixOVJsnxquDQ3QvDEXsroQex2aJ/
X-Received: by 2002:a0c:e08d:: with SMTP id l13mr3573644qvk.216.1585838491453;
        Thu, 02 Apr 2020 07:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585838491; cv=none;
        d=google.com; s=arc-20160816;
        b=ROlZ0iIrV8RoOVyrWjrknqzmiGvWArq9KAXk3tpvigF0gwaZnIqRO+9WX93CTXu477
         SO7MkPjBb5v+SMI1LRdPc6xndEmK958amues6ydWjGyd6ko8RKnSI50SZGAHk9JG6Iro
         GUpmVO0JydrSbsE4EkLXXlGwxsg+FmZF+RkZoJQInn1JuHvCM2ZoKUvjqIvh6objjYYM
         7iAB18BIxv4MwcfIcou/Ybtu+OGBCRhz8UI2Z5ZyD0jJjsqztdknrZXl9/Gpb+7ZoMJv
         jN/Fs+OGa7URWCYxo57barBKZvxVHqNUedVeDywiiHUUwAo2L/KNgSQad09trxKLoOAS
         FjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=UZ3l7EJn/Yt2DsATvi8XChFxKP9Q5ReX5h6s4t8+Zo0=;
        b=JTUqhNKZQGfo1Y84NBCiE5AytV+YoDBBusA9O23BriLTYgVVnks9IYoyEhOfk1+fZ/
         ICpNVaG5Il9x/az9fuAANVFD2XUFwVgGoGd2s+1zHbQlsdbYzD4N2zrSz1jb+hsm/fKP
         w9SWdLXePWpz8c8Pvo0L9L4VlysN5ge4UJxa7kK9h/GwP1lVylIDDc8Tsb5VtG6LWH/6
         VPY93krCi36XxQ488Y1KYEx3lLR5Qw+fDWCleqgi0lxSvGo3K/0hC8dG64eellTk8XoZ
         NJSrocQ+SaTOY0JVD2dpZDPI/1AdWMKKZ/g7gwOaTwQv1pYZRP59zd1wMa/StE06m3UY
         nFJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=SRxHE2xH;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id g17si3402235qka.106.2020.04.02.07.41.31;
        Thu, 02 Apr 2020 07:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=SRxHE2xH;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 102CB4B164;
	Thu,  2 Apr 2020 10:41:31 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXJCxCMX2KXD; Thu,  2 Apr 2020 10:41:29 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E3EE44B15D;
	Thu,  2 Apr 2020 10:41:29 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 8B66D4B159
 for <kvmarm@lists.cs.columbia.edu>; Thu,  2 Apr 2020 10:41:28 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjFvMXDy8QhN for <kvmarm@lists.cs.columbia.edu>;
 Thu,  2 Apr 2020 10:41:27 -0400 (EDT)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 88B0B4B0EF
 for <kvmarm@lists.cs.columbia.edu>; Thu,  2 Apr 2020 10:41:27 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585838487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LQlIPwSA6eO8FaNGqaPVKwSvrWhWEma0a4EepOgZn9Y=;
 b=SRxHE2xHo6MwBPHWu79tFhGLGd+Rfik79qgtkL4tc34VNZMYNQAbW5O0zHggZ0OdnMXO52
 CdG75jI3MZzMukDps1XweOgiH/hNnG5FbqE1Jcgm8soNy1JuH3/MqRfbTQ8WWGRP8m800F
 6QNoOQ0yXal+8quQdCriIaee6O6yxvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-jcwdGm7hNY6oM0oaAdC1ag-1; Thu, 02 Apr 2020 10:41:25 -0400
X-MC-Unique: jcwdGm7hNY6oM0oaAdC1ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94C7419067E7;
 Thu,  2 Apr 2020 14:41:23 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78A36D768E;
 Thu,  2 Apr 2020 14:41:15 +0000 (UTC)
Date: Thu, 2 Apr 2020 16:41:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [kvm-unit-tests PATCH v7 10/13] arm/arm64: ITS: INT functional
 tests
Message-ID: <20200402144112.u6nwzkqe7mt3rr6c@kamzik.brq.redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-11-eric.auger@redhat.com>
 <f7f1d7c4-2321-9123-2394-528af737bfa7@huawei.com>
 <fa4e14f6-20ee-982f-0eda-74b101cddf7a@redhat.com>
 <114f8bba-a1e0-0367-a1b4-e875718d8dba@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <114f8bba-a1e0-0367-a1b4-e875718d8dba@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: thuth@redhat.com, kvm@vger.kernel.org, maz@kernel.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: wlLnlbqVLSBD

On Thu, Apr 02, 2020 at 08:40:42PM +0800, Zenghui Yu wrote:
> Hi Eric,
> =

> On 2020/4/2 16:50, Auger Eric wrote:
> > Hi Zenghui,
> > =

> > On 3/30/20 12:43 PM, Zenghui Yu wrote:
> > > Hi Eric,
> > > =

> > > On 2020/3/20 17:24, Eric Auger wrote:
> > > > Triggers LPIs through the INT command.
> > > > =

> > > > the test checks the LPI hits the right CPU and triggers
> > > > the right LPI intid, ie. the translation is correct.
> > > > =

> > > > Updates to the config table also are tested, along with inv
> > > > and invall commands.
> > > > =

> > > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > > =

> > > [...]
> > > =

> > > So I've tested this series and found that the "INT" test will sometim=
es
> > > fail.
> > > =

> > > "not ok 12 - gicv3: its-migration: dev2/eventid=3D20 triggers LPI 819=
5 en
> > > PE #3 after migration
> > > not ok 13 - gicv3: its-migration: dev7/eventid=3D255 triggers LPI 819=
6 on
> > > PE #2 after migration"
> > > =

> > >  From logs:
> > > "INFO: gicv3: its-migration: Migration complete
> > > INT dev_id=3D2 event_id=3D20
> > > INFO: gicv3: its-migration: No LPI received whereas (cpuid=3D3,
> > > intid=3D8195) was expected
> > > FAIL: gicv3: its-migration: dev2/eventid=3D20 triggers LPI 8195 en PE=
 #3
> > > after migration
> > > INT dev_id=3D7 event_id=3D255
> > > INFO: gicv3: its-migration: No LPI received whereas (cpuid=3D2,
> > > intid=3D8196) was expected
> > > FAIL: gicv3: its-migration: dev7/eventid=3D255 triggers LPI 8196 on P=
E #2
> > > after migration"
> > > =

> > > > +static void check_lpi_stats(const char *msg)
> > > > +{
> > > > +=A0=A0=A0 bool pass =3D false;
> > > > +
> > > > +=A0=A0=A0 mdelay(100);
> > > =

> > > After changing this to 'mdelay(1000)', the above error doesn't show up
> > > anymore. But it sounds strange that 100ms is not enough to deliver a
> > > single LPI. I haven't dig it further but will get back here later.
> > =

> > Did you find some time to investigate this issue. Changing 100 to 1000
> > has a huge impact on the overall test duration and I don't think it is
> > sensible. Could you see what is your minimal value that pass the tests?
> =

> I can reproduce this issue with a very *low* probability so I failed
> to investigate it :-(.  (It might because the LPI was delivered to a
> busy vcpu...)
> =

> You can leave it as it is until someone else complain about it again.
> Or take the similar approach as check_acked() - wait up to 5s for the
> interrupt to be delivered, and bail out as soon as we see it.

I think the check_acked approach would be the best approach.

Thanks,
drew

> =

> =

> Thanks,
> Zenghui
> =

> =


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
