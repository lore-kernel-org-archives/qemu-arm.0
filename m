Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7167270lff;
        Wed, 15 Jan 2020 08:53:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwgJ/+ww+8fceoXm08FRxTjsKg/xkf8ufDREfdrvt1Zs/idjDsghXfCpC6XlZPjKvTPHH22
X-Received: by 2002:a05:6402:170d:: with SMTP id y13mr30498921edu.126.1579107189748;
        Wed, 15 Jan 2020 08:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579107189; cv=none;
        d=google.com; s=arc-20160816;
        b=u/B8DlJ8o2M/eZkORr7JGi4KWbo+Pvko5S9eKVOFtmAMcEXVxNASZ+KejonYfOZG3d
         o+Lntz4sGjcfv8M2tlkab1todfrqG9baFRepPY3ru4xWmV8soqlTE/k/IkGP9pF/eG62
         /GjNlj6uKUsIj5L5XnMGYMWSNwN9GZ96BNYSqYNiyrM8LSONsm60LAmJzwTxgaQ3gsll
         n3/HpcRUOM6mITO5C/QgBCQpsCyEBZ43nzPI+QtCfmkZzNdPZmjAhFKq1JZ7L7cngnpD
         O38JWxVg/SQ1YRrLZ0zVykBgI+2/2ThtxHNwzEsssL9W2j3Th/212LW6kLih+o/8hqRK
         0S/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=IGiacmmsuMvdFZjM5gE21vfxb0JBz0ak8D+4clahb4c=;
        b=o1m8NYYUTeL2qe11AJLPiZmZFNOpPSP2DvlpTjYGg9Tb86U1qm7iYwnUF47NGY0K6M
         aNoDccS7e/z/xNxApdlTkc1V0rQX1rhUY2awAlx5ta29sSkWCsGET4TAoGsOeKRZ+/e/
         le04e/ZwVpZNyhxHlkkF6eQZ2E6iEGSA09KILZIrs9v9pYQW/Y2kUExnqODtAvQ8g5v5
         s9pX7d3femRrr0z27yzObFPgc2N+Qf/FM5O+2fQvyBgY2K3/kSVWTFGE79LXF5bjxdmy
         AuZnMoUVeWMHwqzKnObkRNbtFWgHNEXzpVGvYArnisjBZkdWP9i8lTeohIEXZpt722hB
         WC0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dmvgbRa3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si12491061edv.439.2020.01.15.08.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 08:53:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dmvgbRa3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irlum-0006lB-J0
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 11:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irluX-0006e7-TE
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 11:52:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irluT-0004AC-JT
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 11:52:52 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50093
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irluT-00049o-Fz
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 11:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579107168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGiacmmsuMvdFZjM5gE21vfxb0JBz0ak8D+4clahb4c=;
 b=dmvgbRa3fng2je5aUvQ8JnsQl3Fi0Y+WsNZhUFI+2BGJkYMfC27sT5GGnIg5UDK42FW0bI
 Fyb3Ht7Q3CuD390J4jVJIY3eRUgjPelbU5Q53VKZFIdlRCfQFJhj43+D9bWnG28i99PvNg
 SxVdCZtW8P/Uf3gJzPN/qbSp5M68fZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-e8cSHBHcPL2LM4bVqv8U7w-1; Wed, 15 Jan 2020 11:52:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6DE614E1;
 Wed, 15 Jan 2020 16:52:45 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0FD05C219;
 Wed, 15 Jan 2020 16:52:38 +0000 (UTC)
Date: Wed, 15 Jan 2020 17:52:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [libvirt] [PATCH v2 82/86] numa: forbid '-numa node, mem' for
 5.0 and newer machine types
Message-ID: <20200115175237.325055f3@redhat.com>
In-Reply-To: <20200115153453.GL3243410@angien.pipo.sk>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-83-git-send-email-imammedo@redhat.com>
 <20200115153453.GL3243410@angien.pipo.sk>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: e8cSHBHcPL2LM4bVqv8U7w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 libvir-list@redhat.com, mprivozn@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, rth@twiddle.net, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ahL899MrfaI

On Wed, 15 Jan 2020 16:34:53 +0100
Peter Krempa <pkrempa@redhat.com> wrote:

> On Wed, Jan 15, 2020 at 16:07:37 +0100, Igor Mammedov wrote:
> > Deprecation period is ran out and it's a time to flip the switch
> > introduced by cd5ff8333a.
> > Disable legacy option for new machine types and amend documentation.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > CC: peter.maydell@linaro.org
> > CC: ehabkost@redhat.com
> > CC: marcel.apfelbaum@gmail.com
> > CC: mst@redhat.com
> > CC: pbonzini@redhat.com
> > CC: rth@twiddle.net
> > CC: david@gibson.dropbear.id.au
> > CC: libvir-list@redhat.com
> > CC: qemu-arm@nongnu.org
> > CC: qemu-ppc@nongnu.org
> > ---
> >  hw/arm/virt.c        |  2 +-
> >  hw/core/numa.c       |  6 ++++++
> >  hw/i386/pc.c         |  1 -
> >  hw/i386/pc_piix.c    |  1 +
> >  hw/i386/pc_q35.c     |  1 +
> >  hw/ppc/spapr.c       |  2 +-
> >  qemu-deprecated.texi | 16 ----------------
> >  qemu-options.hx      |  8 ++++----
> >  8 files changed, 14 insertions(+), 23 deletions(-)  
> 
> I'm afraid nobody bothered to fix it yet:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1783355

It's time to start working on it :)
(looks like just deprecating stuff isn't sufficient motivation,
maybe actual switch flipping would work out better)

