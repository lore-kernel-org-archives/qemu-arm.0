Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F691CA0FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 11:39:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut2sU-0002NF-13; Mon, 01 Sep 2025 07:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ut2sS-0002Mn-KW
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 07:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ut2sI-0000IX-SZ
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 07:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756726738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=br6lFDDd3KDdFbXr4OlauHeyFgJdw44+ZL7FT2x+Jbk=;
 b=dUCzAGH80oHYzqERkPu2VUbln3KvAPk6CNuDabq0aOef5twpv6tZz7qlAtz2zBjtd/zZkb
 edgF5/epVUHvbCDB+k/kT6V0RaGxAN2KQe4rc/G7cbpWfkQLhUHepHCRDiE2dDEtm0a1KD
 Zi2eQhd8wALOHUxP1ZxFe/Q7rQkNaQ8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-eJbWUxehO8qGEcG0UgfrDQ-1; Mon, 01 Sep 2025 07:38:56 -0400
X-MC-Unique: eJbWUxehO8qGEcG0UgfrDQ-1
X-Mimecast-MFC-AGG-ID: eJbWUxehO8qGEcG0UgfrDQ_1756726736
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7fea03c6847so160304385a.3
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 04:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756726736; x=1757331536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=br6lFDDd3KDdFbXr4OlauHeyFgJdw44+ZL7FT2x+Jbk=;
 b=F/Q+5DjWg5kjMrQWIMJDEkP4/RZybBeCcUBugqEcGampYgIHK67m4vs1lcux8R9U+p
 utnRNxriAU12F7t9JvXbxzCdpzesUzZZov4iK4PBb61WXGiqWIVl2YNkMck6/CxrNlc5
 5g/HowMRJ8x0OM7GK02C+aTZhTceSNaw57aQBp5UI/ZVO24fFSH3akH8qTf/T637bGXd
 02JZrECtHgaU7vSvxqoaQ2kafqgv+pQcXk3MxoapOM+/4dA0NOB933Y/MQYvUXVOrRWY
 5aHqrR+k5LEfgCKmBVx/K5+eWAyp+HwAzxDdFHtYvMuGIW2uVFITtVv2RMFI5cEEoiwy
 KBvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYaDEK0aBqgOU96knLO6oB98/K5wfZwT2J9CjunY+WltDk5Uqoj5oL3BtSG8svxvB5q8N9arOcgg==@nongnu.org
X-Gm-Message-State: AOJu0YxtDA1Ruej3ggBMRdoNCPypr6L2QkhRh+yG51OdnXVq1W36s1tH
 Ra6pnxyhPYzP3yUu/TohYQkTeYFE+ZL99EEoisQpJuf6+5tPGTADZhdZ9VDCjoFbrv6TTIrLBTD
 kiAV+GMnsIq1suJUgMZIicFcvARDpI3xehKaS3HNUAk2Ta/N/2qIScw==
X-Gm-Gg: ASbGncurD9u0RGCfoGrpdItMs66RFoVgCbZ3jnhmrMMj6cErOtbmhxHb8tj71QQkXq3
 KM4Z6SHGyT08S1gU5W7cOXhWdPkx+ZauQiyhw/DCVu+gGwmt5hOCnp7UJ/KtjHavO/lLC5zZ3R+
 M+rjA0527U5IhLjom44qwY7pzGfWS9Gjw8vrYClf6N920XoLzB4F0R0qPnciUJi6ARv6eVbtcOo
 6WDV0phhRBHMjc1uBN1rf4z9czP3dFCdsoxIk7Rf26gMGi094wrBfq5R8JyiOaEmj/4kB26FveQ
 va3knwykT8yRP/q7Bs+BvmID8wtitg==
X-Received: by 2002:a05:620a:414b:b0:7d4:5db0:5b95 with SMTP id
 af79cd13be357-7ff2b69c9a8mr877999285a.58.1756726736179; 
 Mon, 01 Sep 2025 04:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhPV0hm7N+tC9sdX5/5NbkgKw8Qein10NAXECOuDh+x3l6DAuz6c0UxgMSuqJLC6zDOQv0Vw==
X-Received: by 2002:a05:620a:414b:b0:7d4:5db0:5b95 with SMTP id
 af79cd13be357-7ff2b69c9a8mr877996785a.58.1756726735688; 
 Mon, 01 Sep 2025 04:38:55 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7fc16340db0sm649481085a.67.2025.09.01.04.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 04:38:55 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:38:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org,
 wangyanan55@huawei.com, zhao1.liu@intel.com, mst@redhat.com,
 pbonzini@redhat.com, qemu-arm@nongnu.org
Subject: Re: [PATCH] smbios: cap DIMM size to 2Tb as workaround for broken
 Windows
Message-ID: <20250901133851.2e407990@fedora>
In-Reply-To: <aLVijyqK4pPocGH8@redhat.com>
References: <20250901084915.2607632-1-imammedo@redhat.com>
 <aLVijyqK4pPocGH8@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DCkyR9VtNe8Nk4MFDYJJ2cx-ycrsyjsWxrvb-FTdPLY_1756726736
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 1 Sep 2025 10:08:31 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Sep 01, 2025 at 10:49:15AM +0200, Igor Mammedov wrote:
> > With current limit set to match max spec size (2PTb),
> > Windows fails to parse type 17 records when DIMM size reaches 4Tb+.
> > Failure happens in GetPhysicallyInstalledSystemMemory() function,
> > and fails "Check SMBIOS System Memory Tables" SVVP test.
> > Though not fatal, it might cause issues for userspace apps,
> > something like [1].
> >=20
> > Lets cap default DIMM size to 2Tb for now, until MS fixes it.
> >=20
> > 1) https://issues.redhat.com/browse/RHEL-81999?focusedId=3D27731200&pag=
e=3Dcom.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#commen=
t-27731200 =20
>=20
> Why link to a comment that refers to a link to Adobe photoshop
> and doesn't mention KVM ???

It's just to demo that GetPhysicallyInstalledSystemMemory(),
can cause issues (I doubt very much it's our case, since it's
unlikely that there are physical DIMMs of 4Tb+ size in wild).
Lets drop it.

I'd expect issues in various inventory sw and honestly I'd kick
this very niche problem MS direction.
I resisted long enough till the things got moving towards
resolution on MS side, but folks insist on workaround in QEMU.
If w10 isn't going to get fix, then QEMU is the only option
to work around the bug.

PS:
forgot another workaround (QEMU): configure initial RAM to be less
than 4Tb and all additional RAM add as DIMMs on QEMU CLI.
(however it's the job to be done by mgmt which could know
Windows version and total amount of RAM)

PS2:
I'm fine with dropping the idea of patching QEMU defaults
for yet another way to work around the issue.

> Also should have:
>=20
> Fixes: 62f182c97b31445012d37181005a83ff8453edaa
>=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > PS: It's obvious 32 int overflow math somewhere in Windows,
> >     MS admitted that it's Windows bug and in a process of fixing it.
> >     However it's unclear if W10 and earlier would get the fix.
> >     So however I dislike changing defaults, we heed to work around
> >     the issue (it looks like QEMU regression while not being it).
> >     Hopefully 2Tb/DIMM split will last longer until VM memory size
> >     will become large enough to cause to many type 17 records issue
> >     again.
> > PS2:
> >     Alternatively, instead of messing with defaults, I can create
> >     a dedicated knob to ask for desired DIMM size cap explicitly
> >     on CLI. That will let users to enable workaround when they
> >     hit this corner case. Downside is that knob has to be propagated
> >     up all mgmt stack, which might be not desirable. =20
>=20
>=20
> How many type 17 records can we get before hitting the the
> Linux limits which was the motiviation for the previous
> fix 62f182c97b31445012d37181005a83ff8453edaa ?
>=20
> ie, with this 2 TB dimm size, what is our effective maximum
> RAM size ?

it would be around 2PTb (assuming 1000 records,
exact number varies due to configuration since the rest of SMBIOS
tables take some part of that 64K buffer).

>=20
>=20
> With regards,
> Daniel


