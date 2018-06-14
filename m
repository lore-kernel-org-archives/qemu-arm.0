Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1760530wrq;
        Thu, 14 Jun 2018 02:00:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJwD+4dq5S//dFz39SjMVhcy/aZYlGnMkmTte7T8h9I8rx7QPppEjJsYwRwrRCPyDsXKqCP
X-Received: by 2002:ac8:2972:: with SMTP id z47-v6mr1463886qtz.364.1528966810601;
        Thu, 14 Jun 2018 02:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528966810; cv=none;
        d=google.com; s=arc-20160816;
        b=Wkwtz+94iZUnXnxgIeC7wwHMVed+jdHbvG7pvzGLfsW1/dBO86bcKgjWPQ8liCVrbK
         qcr3Qq009+tfe2E4ZvQ4ta9WaxyUfWFFfDFUmtiMjXpIvTHb7Sk0U6EZZLfjhbpMljef
         viAAazaf+fONr+S21s6QC/R05nO0CRaYQh13b0d3tsZUTYPg0jmA+2KX70DXWPyv4B7/
         KlGMuLRR+ePkCJW+oCf3+OJ1LAVMRTr7orQQWXEq591uFSOJZe0IAEomdZsJz+Ve5sSL
         mBAGD07sX36XQZY3IE51eJ6DCSW4Lq1VWUovIpKMu4sV0jTJ1aFZ4o//GIhgb1L4E2ru
         I3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=kxMn0U8OaSbN09P0AIjNOj8eteU66aotxDYfLjlicd8=;
        b=gRM8XePOP9pPRLtpzXVH0Z8AqQbasA/2Kr8UppKtESa9ytFsJZREebjjgW2oI5vK1m
         34UtFmSa41MR0HREyFZJJ983RQcrM8WHMrNzCvW4EP08lkUTdzAQ+DilAPZ/UT+eWs10
         8nIY4t3S2Ecm616LWBVNvouoGExRC10nvzfLfKevtIxEL0QM8HkNcgkGY1UdCsGS0Ork
         BGz510aB6k0rO8F/KZOePskbWDL340v2L1Ary/D3bRbU8InjFYUzsS/4WXbPCW+EktIn
         dIgL84Y0nSg4y5pZf3K8yCPg+R8B/77u++E4JAfBcU6KAkFqiWfURdeHOmGllJLiCVyZ
         FiCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x32-v6si4850500qtx.59.2018.06.14.02.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 02:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTO70-000138-6e
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 05:00:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fTO6u-000131-Bc
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 05:00:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fTO6r-0001ID-9s
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 05:00:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56480 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fTO6r-0001GK-5X; Thu, 14 Jun 2018 05:00:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 894E6738E0;
	Thu, 14 Jun 2018 09:00:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89E372166BB3;
	Thu, 14 Jun 2018 08:59:57 +0000 (UTC)
Date: Thu, 14 Jun 2018 09:59:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20180614085954.GM6355@redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-10-git-send-email-eric.auger@redhat.com>
	<8bf1bccc-b32a-9982-6123-b644c41a96d3@redhat.com>
	<33a3fa10-bf1a-45cd-73bd-403cbd8d4792@redhat.com>
	<fbd7ea65-8f3e-bda3-1bb6-09b3b67d2543@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fbd7ea65-8f3e-bda3-1bb6-09b3b67d2543@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 14 Jun 2018 09:00:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 14 Jun 2018 09:00:00 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 9/9] hw/arm/virt: Add virt-3.0
 machine type
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, ard.biesheuvel@linaro.org,
	marc.zyngier@arm.com, qemu-devel@nongnu.org,
	christoffer.dall@arm.com, Auger Eric <eric.auger@redhat.com>,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1DcJ0OfyY4jh

On Thu, Jun 14, 2018 at 10:56:20AM +0200, Laszlo Ersek wrote:
> Hi Eric,
> 
> On 06/14/18 08:27, Auger Eric wrote:
> > Hi Laszlo,
> > 
> > On 06/13/2018 11:05 PM, Laszlo Ersek wrote:
> >> On 06/13/18 10:48, Eric Auger wrote:
> >>
> >>> PATCH: merge of ECAM and VCPU extension
> >>> - Laszlo reviewed the ECAM changes but I dropped his R-b
> >>>   due to the squash
> >>
> >> Was there any particular reason why the previous patch set (with only
> >> the ECAM enlargement) couldn't be merged first? To be honest I'm not
> >> super happy when my R-b is dropped for non-technical reasons; it seems
> >> like wasted work for both of us.
> >>
> >> Obviously if there's a technical dependency or some other reason why
> >> committing the ECAM enlargement in separation would be *wrong*, that's
> >> different. Even in that case, wouldn't it be possible to keep the
> >> initial virt-3.0 machtype addition as I reviewed it, and then add the
> >> rest in an incremental patch?
> > 
> > Sorry about that. My fear was about migration. We would have had 2 virt
> > 3.0 machine models not supporting the same features. While bisecting
> > migration we could have had the source using the high mem ECAM and the
> > destination not supporting it. So I preferred to avoid this trouble by
> > merging the 2 features in one patch. However I may have kept your R-b
> > restricting its scope to the ECAM stuff.
> 
> to my understanding, it is normal to *gradually* add new properties
> during the development cycle, to the new machine type of the upcoming
> QEMU release. To my understanding, it's not expected that migration work
> between development snapshots built from git. What matters is that two
> official releases, specifying the same machine type, enable the user to
> migrate a guest between them (in forward direction).
> 
> In every release, so many new features are introduced that it's
> impossible to introduce the new machine type with all the compat knobs
> added at once. Instead, the new machine type is introduced when the
> first feature that requires a compat knob is added to git. All other
> such features extend the compat knobs gradually, during the development
> cycle. Until the new official release is made (which contains all the
> compat knobs for all the new features), the new machine type simply
> doesn't exist, as far as the public is concerned, so it cannot partake
> in migration either.
> 
> This is my understanding anyway.

That is correct - there is ZERO expectation of migration / ABI stability
between arbitrary GIT snapshots, only official releases.  Prior to the
first release including it, a versioned machine type can be changed
arbitrarily.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
