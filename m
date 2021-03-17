Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp378564lfg;
        Wed, 17 Mar 2021 05:55:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydKCI0JO7Be07Q4PxwCOnF1uclxmnVneHXc2oDZ0xpMMPdjzo7KDuFUdCp14+YsIBk2WE+
X-Received: by 2002:a25:148b:: with SMTP id 133mr4265157ybu.157.1615985718739;
        Wed, 17 Mar 2021 05:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615985718; cv=none;
        d=google.com; s=arc-20160816;
        b=DPp2j7zpTLiAHDra3SC2oNdRlic5iOmG6BAoktIcc/wty3pukNaznBhmVBcwj67va1
         iyu2sB54pH4OXHxO1aMY+7lMooHN16ik8s+zPBI8x94xBX3EELbedF/izy4q01FNbn/U
         3OEL+CjjKlMcEJ41GAufD1r544EUh4jcOf2OPYdATw3vdf8UvMs3glvc0iHBnK7dP1Fk
         eIXOScix3RBFgPAYAG7PUEoDBuxq0k2nCy57/v69vu1vhp2+I8DK5D2W19zVF2zBlLWM
         IVSuBs4eVgN1KuNpmvq8rXK4Tq5VaGQ3q4sPT8g7HVrPGF9EDrZF3ZR4sSvLjm7tXfxq
         JqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Fn84ExT8pSFAG1LBy957G7xwmEEJG7a07W8pYDLWZyU=;
        b=YgUKA19li/J1kkH//LiRGGb3WWyoFjVghglI7hQ5HilZRcCJMwJBmgYcB3jysFNzFX
         B2ywI525aVLNNc6KmT20M3i6b02t8AW/QGoNNY4236RAEvWFqvOM6WZ4tXTeXdt6aDgr
         lvPEFQVGqWQSeUsEfpIXiyo19qGXMC5ta92LZ+DlBbzSilovnKhj5ZzqpqM0ezEez7UW
         KeVxmHYjxJ1EoJyv3snFPeotLvMwUuE6e/J7TjhJpDdL3+5kg0EeRGifFQdnQ1ReQ9H6
         RKL2miGYucMFIOy0v3HWr4HHhNPqz9NH6YkpkJJiTbpdkSuLgVqLDqEOBtqqgCoUKfcA
         79jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P8pujd17;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n22si20796800ybg.348.2021.03.17.05.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 05:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P8pujd17;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMVhm-0007rq-3T
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 08:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lMVhd-0007rN-Pn
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 08:55:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lMVhb-0004OM-Jl
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 08:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615985705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fn84ExT8pSFAG1LBy957G7xwmEEJG7a07W8pYDLWZyU=;
 b=P8pujd17u6nJ1t4duaWBFOuIB8cU4qAFnI+n1zeah3pHjKSs464JqU10q2NdQ8HUobJPfG
 Qyrsb1KNArUqmjnILLeRb/WhuI1v3SPBpL+Z763VtRDcFctgB+IUd6/ATrSV57gNsxWDJN
 C4O5bUm1OnY8ioZ61PzTwg2asWdTXTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-ZL_ZUI0FMXqKPtP_yJ7_1Q-1; Wed, 17 Mar 2021 08:55:03 -0400
X-MC-Unique: ZL_ZUI0FMXqKPtP_yJ7_1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C698580006E;
 Wed, 17 Mar 2021 12:55:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.196.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F39B5D6AC;
 Wed, 17 Mar 2021 12:54:55 +0000 (UTC)
Date: Wed, 17 Mar 2021 13:54:53 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
Message-ID: <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
 <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
 <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
 <3e7ba090-c45e-8fa4-1a59-16856241cbdc@redhat.com>
 <CAFEAcA_zYaOXw5yaXWEjgBy6YeTpB5FRBCO96To-bv9xpQzbMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_zYaOXw5yaXWEjgBy6YeTpB5FRBCO96To-bv9xpQzbMQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: omwQoaBjK70e

On Wed, Mar 17, 2021 at 11:14:56AM +0000, Peter Maydell wrote:
> On Wed, 17 Mar 2021 at 10:59, Gavin Shan <gshan@redhat.com> wrote:
> >
> > Hi Peter,
> >
> > On 3/17/21 9:40 PM, Peter Maydell wrote:
> > > On Wed, 17 Mar 2021 at 10:37, Gavin Shan <gshan@redhat.com> wrote:
> > >> On 3/17/21 8:09 PM, Peter Maydell wrote:
> > >>> On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
> > >>>>
> > >>>>    static const VMStateDescription vmstate_pl011 = {
> > >>>>        .name = "pl011",
> > >>>>        .version_id = 2,
> > >>>>        .minimum_version_id = 2,
> > >>>> +    .post_load = pl011_post_load,
> > >>>>        .fields = (VMStateField[]) {
> > >>>>            VMSTATE_UINT32(readbuff, PL011State),
> > >>>>            VMSTATE_UINT32(flags, PL011State),
> > >>>> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
> > >>>>            VMSTATE_INT32(read_trigger, PL011State),
> > >>>>            VMSTATE_END_OF_LIST()
> > >>>>        },
> > >>>> -    .subsections = (const VMStateDescription * []) {
> > >>>> -        &vmstate_pl011_clock,
> > >>>> -        NULL
> > >>>> -    }
> > >>>>    };
> > >>>
> > >>> Doesn't dropping the subsection break migration compat ?
> > >>>
> > >>
> > >> It's why this patch needs to be backported to stable branches.
> > >> In that way, we won't have migration compatible issue.
> > >
> > > No, migration has to work from the existing already
> > > shipped 5.1, 5.2, etc releases to 6.0 (assuming you use
> > > the correct "virt-5.2" &c versioned machine type.)
> > >
> >
> > Commit aac63e0e6ea3 ("hw/char/pl011: add a clock input") is merged
> > to v5.2.0. The migration failure happens during migration from v6.0
> > to v5.1 with machine type as "virt-5.1", instead of migrating from
> > v5.1 to v6.0. One question is if we need support backwards migration?
> 
> Upstream doesn't care about backwards migration. AIUI
> RedHat as a downstream care about the backwards-migration
> case in some specific situations, but I don't know if that
> would include this one.

Right, we do prefer to be able to support "ping-pong" migrations. For
example, if we start a virt-5.1 machine on a 5.1 build of QEMU, and then
migrate it to a 5.2 build of QEMU, we'd like to also be able to go back
to the 5.1 build.

I agree this patch is not the right approach. I think the right approach
is to introduce a compat property and make the "new" section dependent
on it. And then update the hw_compat_* arrays. Gavin, please take a look
at "Connecting subsections to properties" of docs/devel/migration.rst.

I'm also curious what the state of mach-virt's machine types are for
migration. It'd be nice to exhaustively test both forward migration of
all machine types and ping-pong migrations of all machine types. We can
then consider each issue we find (the pessimist in me suggests we'll find
more than this pl011 issue) and how/if we want to resolve them.

Thanks,
drew

