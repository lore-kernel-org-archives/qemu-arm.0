Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp338320lfo;
        Wed, 3 Feb 2021 07:53:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXsMWxGcsJTXUYWbm45b4pRCtzp0Bmtg/6KYGE8L/DVyyUxK6lgmhnLPtJO4adtG6CRggq
X-Received: by 2002:a25:858e:: with SMTP id x14mr5672749ybk.257.1612367636302;
        Wed, 03 Feb 2021 07:53:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612367636; cv=none;
        d=google.com; s=arc-20160816;
        b=AP+wA3fq/FAQ62xdK8I7awi0AUFppmI11EvrehNYQJnE7/zz4GWmNY9tCA8IlV3Tnh
         SpQGrMYt1qjCBf1TZj4uasAOk4IjvVi486BPgYZMjI6xjrA8IePAKmmI/C/A6n3UFXja
         AYRGeesJwkEQL0yVGhhOC3vjAIihxFk2ialN59WSMEaYMnzokpE1JmJHT0N5fsCAj/mu
         SMsEfc28pn0HjMuiAoJ3euLPpmLIggypAcD4Iqt3+IpuOKBTrdMQrvK7CjZIIwU3tinJ
         fzvULj/TKOlm35wfJ03SEOHIlUqHOiCGgTeu22kG3DcoESraB2KcXyNcdZ/UXk2f9KvZ
         WKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=3txheURpNn5LjHxMd67tRWZDorXK7Hmsv1jLMlIWepc=;
        b=HBO2np2UTG8gUBKHhg2k9dBcUO1+bBQ3wwcB024hqqhyTlKMS43Sab/cmX1VzpNFtV
         9PAlU12fuAjU1qn52HFH4B1cVZW+AVmAsh4w5wUy7TmjN2jOaDYxgJe5fLwxft6k6CVe
         fBqmsbCZENOMuK9eSY+KFpRlB5aob192qp4XQz8Dr/OBXsKnVeC4XEE7F9RRRlywHVIe
         HCiRMV6GUSEJPHwrVnNyvsVE7SIY7GOLmM1wONbC8tNPYSX9tpwtA4KrTT69ON+JUC3l
         hPfVUqjtT7mPugnzpJY2CgzgX4WXPLTCgujIp8n9PJQebYJ1DJAEUulLo+61b8I7Exxz
         UVmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XMcFPixv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si2488271ybk.260.2021.02.03.07.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 07:53:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XMcFPixv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7KTb-0003jy-Mm
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 10:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l7KTT-0003jW-Ff
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 10:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l7KTR-0008TU-Kf
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 10:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612367624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3txheURpNn5LjHxMd67tRWZDorXK7Hmsv1jLMlIWepc=;
 b=XMcFPixv+5ptB2fX5c+/CWu+jSQNNgMGQ2cqDUo3Cf4W8aRpRBQxogNaRF7C4FuoX5cQtG
 kru8c0kMTYNL/irvF9dwMEDnXhFcUdxc9Nv3tuRUmKEzSlpb3v1NGa7NDRlQzwgEM8JifT
 Ha2RoYoqnE942Z9YGXT0GMFuZVPHXzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-j-OZalfJOfqQ4AT-uv6ivg-1; Wed, 03 Feb 2021 10:53:42 -0500
X-MC-Unique: j-OZalfJOfqQ4AT-uv6ivg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93570107ACC7;
 Wed,  3 Feb 2021 15:53:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6642B10016F4;
 Wed,  3 Feb 2021 15:53:38 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:53:35 +0100
From: Andrew Jones <drjones@redhat.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
Message-ID: <20210203155335.72tjsjiwom2i7na4@kamzik.brq.redhat.com>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
 <20210203102758.GC2950@work-vm>
 <CAFEAcA9_mcXHd5m+Z2M1jvk58kGVEcYKF+0kVsLJTjwB9MZcfw@mail.gmail.com>
 <20210203104920.GE2950@work-vm>
 <CAFEAcA9DdiBA+-5cQ87NR6fHFFFJAtDVbAEc+AJQNMNo4bVB+A@mail.gmail.com>
 <20210203124412.xioafvptnovzalle@kamzik.brq.redhat.com>
 <YBrFK2XscG6Y1/Rq@strawberry.localdomain>
MIME-Version: 1.0
In-Reply-To: <YBrFK2XscG6Y1/Rq@strawberry.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CFG8ibMtzIdj

On Wed, Feb 03, 2021 at 10:45:47AM -0500, Aaron Lindsay wrote:
> On Feb 03 13:44, Andrew Jones wrote:
> > On Wed, Feb 03, 2021 at 10:52:59AM +0000, Peter Maydell wrote:
> > > On Wed, 3 Feb 2021 at 10:49, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > > >
> > > > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > > > On Wed, 3 Feb 2021 at 10:28, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > > > > >
> > > > > > * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> > > > > > > Cc'ing migration team and qemu-arm@ list.
> > > > > >
> > > > > > I'll have to leave the detail of that to the ARM peole; but from a
> > > > > > migration point of view I think we do want the 64 bit ARM migrations to
> > > > > > be stable now.  Please tie incompatible changes to machine types.
> > > > >
> > > > > That is the intention, but because there's no upstream testing
> > > > > of migration compat, we never notice if we get it wrong.
> > > > > What is x86 doing to keep cross-version migration working ?
> > > >
> > > > I know there used to be some of our team running Avocado tests for
> > > > compatibility regularly, I'm not sure of the current status.
> > > > It's something we also do regularly around when we do downstream
> > > > releases, so we tend to catch them then, although even on x86 that
> > > > often turns out to be a bit late.
> > > 
> > > So downstream testing only?
> > 
> > Not even downstream for the Arm architecture, at least not at Red Hat. The
> > support we have for Arm Virt is still limited to the use cases for which
> > it has been deployed. To this day that hasn't included migration[*].
> > 
> > > I think that unless we either (a) start
> > > doing migration-compat testing consistently upstream or
> > 
> > This is the best choice and it can certainly be an additional approach
> > regardless of what goes on downstream. I can look into this. A pointer
> > to the x86 tests would be a good start. It's pretty simple to do a
> > quick migration test between two versions of QEMU, but we need the
> > whole build two versions of QEMU stuff first, which I hope already
> > exists.
> 
> Does this mean that this is largely an issue of developing the tests,
> and not a need for a place to host them? Or would additional
> hardware/hosting be required for these tests to be run on?
>

I wouldn't expect the new tests to require new resources. Whatever
upstream already has for the tests that are already being run should be
sufficient. I think we just need to see if we can develop/enable these
types of tests in the already present CI. At least for starters...

Thanks,
drew

