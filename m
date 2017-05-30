Received: by 10.25.0.6 with SMTP id 6csp3524lfa;
        Tue, 30 May 2017 12:48:16 -0700 (PDT)
X-Received: by 10.55.168.86 with SMTP id r83mr26073395qke.97.1496173696836;
        Tue, 30 May 2017 12:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496173696; cv=none;
        d=google.com; s=arc-20160816;
        b=gR/2eNiexT0xJ0Y4zn6dnU4cQdQGqQyxje2BXXTmjpBHob5Zs+yyszImlDF1W0C0Nz
         skZ1I3DzgLHtg1fBqSJZmmrXw7J5U/0lIUZABCB/TZraodFVxqz5XRSSGEkZVKxKz9YL
         m/4JbubUahslHoTSEpZ5uIi+uBa1M2xhNR2tRkTVu7qNIzN2zm+PbkuOfV/mInhV6lHI
         NFANvZQ8rw593fVsdgVyZZ7pWc+QV8DhwLGu2kZulKbmQNHeJr62nn6JJyf7rQH6PsJR
         Ol0uoROAPny5911v/WSEuABvh3behJ8Aw1kkRg8EmlJtFwXbPimjQrbh+oyVJdI+VyMw
         9M2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=IjOaQzCxVlbuPEit0R1QmE8Zd4nqZ66Yai4/4ibQdAU=;
        b=QCVNBCygt3M1sc07ZvwdmT0PXSRkHU/dSToBjG5R1uc27C3GZC8UZ+pXAlgrHT6erv
         wfpqqw38pfDGdgSNdDf936ivP3WAWCBBeSN17fm+7ekgpePva19pExoUF3bLfaLxqf6E
         uZsdJ4C3Ko8X9gSFQ791NwPZvgn5/SXi++idji9R1sQ0+CmV0ZTG78Hw2bDFzV1bZsqo
         Y+H9leP7dA/vtx7btCtptBi3VRy3nxFzbMHEwol2c7XC43IHETgKYlA0/g+x23nrzQNC
         Hz01B6BXT/AyeENhDBvYhC7fSTcTVaQmpE/mLb7ksRJvMsm+sRBEaKRWLGLxrPe0knv6
         DuAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r190si13769657qkf.2.2017.05.30.12.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 12:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFn7o-0002Fl-8m
	for alex.bennee@linaro.org; Tue, 30 May 2017 15:48:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dFn7c-0002En-T6
	for qemu-arm@nongnu.org; Tue, 30 May 2017 15:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dFn7X-0008Lh-Ug
	for qemu-arm@nongnu.org; Tue, 30 May 2017 15:48:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dFn7X-0008Ld-Ow; Tue, 30 May 2017 15:47:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9311397836;
	Tue, 30 May 2017 19:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9311397836
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9311397836
Received: from localhost (ovpn-116-43.gru2.redhat.com [10.97.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27BC0189F6;
	Tue, 30 May 2017 19:47:57 +0000 (UTC)
Date: Tue, 30 May 2017 16:47:56 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20170530194756.GP32274@thinpad.lan.raisama.net>
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
	<1496161442-96665-7-git-send-email-imammedo@redhat.com>
	<20170530184022.4d17218a@bahia.ttt.fr.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170530184022.4d17218a@bahia.ttt.fr.ibm.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 30 May 2017 19:47:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-ppc] [PATCH v3 6/7] spapr: cleanup
 spapr_fixup_cpu_numa_dt() usage
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5VG73llJiJZp

On Tue, May 30, 2017 at 06:40:22PM +0200, Greg Kurz wrote:
> On Tue, 30 May 2017 18:24:01 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > even though spapr_fixup_cpu_numa_dt() has no effect on FDT
> > if numa is disabled, don't call it uselessly. It makes it
> > obvious at call sites that function is need only when numa
> 
> s/need/needed

Fixed while applying the patch.  Thanks!

> 
> > is enabled.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 

-- 
Eduardo
