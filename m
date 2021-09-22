Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp320784lfp;
        Wed, 22 Sep 2021 09:06:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC2Fr+KM2+Z5fzYy14vVRzHk2pqIlqG392wBHcdW9t3PQToqrm2AYbIqqu4M1+e9hSriAE
X-Received: by 2002:a67:c81a:: with SMTP id u26mr489565vsk.33.1632326812794;
        Wed, 22 Sep 2021 09:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632326812; cv=none;
        d=google.com; s=arc-20160816;
        b=FnDyIPkgoFW82K1uAOTPUfPwFqjq0n1ZICNkTRcRDJk2VmUihKFeXT7lFZtyWiWLKW
         wHC26sJZ43XZocIuWrOMSyfwoXkXFYMWx4+qz+oTVk+spACh3KhbRyPKDxo/h155lZwp
         6CquwW6y0y6UdEn13FzBu/uO34ohfbWmsPqf4kd5UkYsvjSdhtkxBne3KxGz8kK5FEQd
         imc3OYZ7IdAjazYWDn5rMgVE0el6HEj/oAWGB4BNsYZce7e46A+2qzAPBunBFgef9wFe
         l/H/a4IgP7u0WAaJ/BnAaQwzjU36WgTrFyhZXsc/Rh9tGo1K1Rw0TD6MKT5/tMH7Nyms
         ys7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=QebOB2SYHOmYM3jUpMCe05d9zHZjO5/ZfL4UGrTq+EM=;
        b=vGKNBuBfEeEkLNtcu4nU4W+rQyrpnZddpeoIoaSOJuNcwFDQgd+r43gGL4WfAHRd6h
         /6133sHozfwTtrDm48+gvbLryPhMqH/5qtO0wD0w+HcGaug8ponuAYquVsvSonl+4D9S
         NRmGQLHxNUvBHWZ2NjIs3C5ImBbbr02G3lZt0ndBc/6HFv1P+gL5m+VPZnhU2vr3C4pO
         XpWV4bCvJC7KJ9czhFrKPHbz4gs8ntcZw+3nMvGsCwmcgHA2DWy9vcOMeqZaNG9cCwfX
         AzkFbx7r/o1/i9kuiBGtHaNt9poIGa2bykEGiR5Wim9Fg0+pg5acNh0AwDGoLlYurMT4
         y0TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ejX35bdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h28si1789413vsg.450.2021.09.22.09.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Sep 2021 09:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ejX35bdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mT4lm-0001BS-Su
	for alex.bennee@linaro.org; Wed, 22 Sep 2021 12:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mT4jc-0000Nz-Kc
 for qemu-arm@nongnu.org; Wed, 22 Sep 2021 12:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mT4jY-0004PA-87
 for qemu-arm@nongnu.org; Wed, 22 Sep 2021 12:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632326670;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QebOB2SYHOmYM3jUpMCe05d9zHZjO5/ZfL4UGrTq+EM=;
 b=ejX35bdMmV60vaxQDfiQ0T6xYXxkY3xe779kUBMkCCOH5wKmsAlfQ3WxWJrKp1i9nTCW7P
 7P8Xe5ePjVwPmuy6Mk1B2OBjITGoyi5bC5TD0pG7qoueQldhPnXXleEUZCOnOIa9zvGpeB
 +geXWqYpDp7wV8EUjHBvmNnRV4Nw0sI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-7eIC7RurO66dIJH9eiFOlg-1; Wed, 22 Sep 2021 12:04:16 -0400
X-MC-Unique: 7eIC7RurO66dIJH9eiFOlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C88551923768;
 Wed, 22 Sep 2021 16:04:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BE661865D;
 Wed, 22 Sep 2021 16:02:27 +0000 (UTC)
Date: Wed, 22 Sep 2021 17:02:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 01/53] docs/devel: rename file for writing monitor
 commands
Message-ID: <YUtTkO9SFnA5xs2v@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-2-berrange@redhat.com>
 <87a6k74rsl.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87a6k74rsl.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mV+IsTOlWDjC

On Mon, Sep 20, 2021 at 09:42:02AM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > The file already covers writing new style HMP commands, in addition to
> > the QMP commands, so it deserves a more general name.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  docs/devel/index.rst                                        | 2 +-
> >  ...riting-qmp-commands.rst => writing-monitor-commands.rst} | 6 +++---
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >  rename docs/devel/{writing-qmp-commands.rst => writing-monitor-commands.rst} (99%)
> >
> > diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> > index f95df10b3e..7c25177c5d 100644
> > --- a/docs/devel/index.rst
> > +++ b/docs/devel/index.rst
> > @@ -44,4 +44,4 @@ modifying QEMU's source code.
> >     ebpf_rss
> >     vfio-migration
> >     qapi-code-gen
> > -   writing-qmp-commands
> > +   writing-monitor-commands
> > diff --git a/docs/devel/writing-qmp-commands.rst b/docs/devel/writing-monitor-commands.rst
> > similarity index 99%
> > rename from docs/devel/writing-qmp-commands.rst
> > rename to docs/devel/writing-monitor-commands.rst
> > index 6a10a06c48..497c9ce0d5 100644
> > --- a/docs/devel/writing-qmp-commands.rst
> > +++ b/docs/devel/writing-monitor-commands.rst
> > @@ -1,8 +1,8 @@
> > -How to write QMP commands using the QAPI framework
> > -==================================================
> > +How to write monitor commands
> > +=============================
> >  
> >  This document is a step-by-step guide on how to write new QMP commands using
> > -the QAPI framework. It also shows how to implement new style HMP commands.
> > +the QAPI framework and new style HMP commands.
> 
> Recommend to drop "new style", here and in the commit message.

Ok, will do.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

